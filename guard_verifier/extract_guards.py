import sys
import os
import re
import json

def classify_subsystem(function_name):
    fn = function_name.lower()
    if "thread" in fn or "tls" in fn or "idle" in fn:
        return "THREAD_LIFECYCLE"
    elif "sched" in fn or "priority" in fn:
        return "SCHEDULER"
    elif "watchdog" in fn or "time" in fn or "tod" in fn or "clock" in fn:
        return "WATCHDOG_TIMERS"
    elif "user_ext" in fn or "fatal" in fn:
        return "USER_EXTENSIONS"
    elif "object" in fn or "heap" in fn or "wkspace" in fn or "chain" in fn:
        return "OBJECTS_MEMORY"
    elif "task" in fn or "sem" in fn or "msg" in fn or "barrier" in fn:
        return "CLASSIC_API"
    else:
        return "CORE_SYSTEM"

def parse_disassembly(disasm_path):
    func_pattern = re.compile(r"^([0-9a-fA-F]+)\s+<([^>]+)>:")
    call_pattern = re.compile(r"^\s*([0-9a-fA-F]+):\s+[0-9a-fA-F\s]+\s+(?:bl|b|b\.w|blx)\s+([0-9a-fA-F]+)\s+<(DataCorruption_Handler|SigMismatch_Handler)>")
    instr_pattern = re.compile(r"^\s*([0-9a-fA-F]+):\s+[0-9a-fA-F\s]+\s+(\w+)")

    guards = []
    current_func = "unknown"
    recent_instructions = []

    with open(disasm_path, "r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            f_match = func_pattern.match(line)
            if f_match:
                current_func = f_match.group(2)
                recent_instructions.clear()
                continue

            i_match = instr_pattern.match(line)
            if i_match:
                addr = int(i_match.group(1), 16)
                mnemonic = i_match.group(2)
                recent_instructions.append((addr, mnemonic))
                if len(recent_instructions) > 15:
                    recent_instructions.pop(0)

            c_match = call_pattern.match(line)
            if c_match:
                trap_addr = int(c_match.group(1), 16)
                handler_name = c_match.group(3)
                guard_type = "EDDI" if handler_name == "DataCorruption_Handler" else "RASM"

                check_addr = trap_addr
                for a, m in reversed(recent_instructions[:-1]):
                    if m in ("cmp", "cmn", "tst", "teq", "cbz", "cbnz", "eors", "orrs", "eor", "orr", "subs", "adds"):
                        check_addr = a
                        break

                subsystem = classify_subsystem(current_func)
                guards.append({
                    "id": len(guards) + 1,
                    "type": guard_type,
                    "handler": handler_name,
                    "function": current_func,
                    "subsystem": subsystem,
                    "check_address": f"0x{check_addr:08x}",
                    "trap_address": f"0x{trap_addr:08x}"
                })

    return guards

def write_single_gdb_script(guards, output_path, is_batch=False, target_remote=None):
    if target_remote is None:
        target_remote = os.environ.get("GDB_TARGET", ":4242")
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("set pagination off\n")
        f.write("set confirm off\n")
        f.write(f"target remote {target_remote}\n")
        f.write("load\n\n")

        for g in guards:
            f.write(f"set $hit_{g['id']} = 0\n")
        f.write("\n")

        addr_map = {}
        for g in guards:
            addr_map.setdefault(g["check_address"], []).append(g)

        bp_idx = 1
        for addr, glist in addr_map.items():
            f.write(f"break *{addr}\n")
            f.write("commands\n")
            f.write("  silent\n")
            for g in glist:
                f.write(f"  set $hit_{g['id']} = $hit_{g['id']} + 1\n")
            primary_id = glist[0]["id"]
            f.write(f"  if $hit_{primary_id} >= 5\n")
            f.write(f"    disable {bp_idx}\n")
            f.write("  end\n")
            f.write("  continue\n")
            f.write("end\n\n")
            bp_idx += 1

        f.write("break bsp_reset\n")
        f.write("commands\n")
        f.write("  silent\n")
        f.write("  printf \"=== GUARD VERIFICATION RESULTS ===\\n\"\n")
        for g in guards:
            f.write(f"  printf \"GUARD_%03d [%s] [%s] %s check=%s: %d hits\\n\", {g['id']}, \"{g['type']}\", \"{g['subsystem']}\", \"{g['function']}\", \"{g['check_address']}\", $hit_{g['id']}\n")
        f.write("  printf \"=== END GUARD VERIFICATION ===\\n\"\n")
        f.write("  quit\n")
        f.write("end\n\n")
        f.write("continue\n")

def generate_hardware_batches(guards, out_dir, batch_size=4, target_remote=None):
    batches_dir = os.path.join(out_dir, "batches")
    os.makedirs(batches_dir, exist_ok=True)

    batch_files = []
    total_guards = len(guards)

    for i in range(0, total_guards, batch_size):
        chunk = guards[i:i + batch_size]
        batch_id = (i // batch_size) + 1
        b_name = f"batch_{batch_id:03d}.gdb"
        b_path = os.path.join(batches_dir, b_name)
        write_single_gdb_script(chunk, b_path, is_batch=True, target_remote=target_remote)
        batch_files.append({
            "batch_id": batch_id,
            "file": b_name,
            "guard_count": len(chunk),
            "guard_ids": [g["id"] for g in chunk]
        })

    manifest_path = os.path.join(batches_dir, "batches_manifest.json")
    with open(manifest_path, "w", encoding="utf-8") as f:
        json.dump(batch_files, f, indent=2)

    return len(batch_files)

def generate_subsystem_scripts(guards, out_dir, target_remote=None):
    subsystems_dir = os.path.join(out_dir, "subsystems")
    os.makedirs(subsystems_dir, exist_ok=True)

    by_sub = {}
    for g in guards:
        by_sub.setdefault(g["subsystem"], []).append(g)

    for sub_name, sub_guards in by_sub.items():
        sub_path = os.path.join(subsystems_dir, f"trace_{sub_name.lower()}.gdb")
        write_single_gdb_script(sub_guards, sub_path, target_remote=target_remote)

def main():
    disasm_file = sys.argv[1] if len(sys.argv) > 1 else "../acas_disasm.txt"
    if not os.path.exists(disasm_file):
        alt_path = os.path.join(os.path.dirname(__file__), "..", "acas_disasm.txt")
        if os.path.exists(alt_path):
            disasm_file = alt_path
        else:
            print(f"Error: {disasm_file} not found")
            sys.exit(1)

    guards = parse_disassembly(disasm_file)
    out_dir = os.path.dirname(os.path.abspath(__file__))

    json_path = os.path.join(out_dir, "guards_catalog.json")
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(guards, f, indent=2)

    full_gdb_path = os.path.join(out_dir, "trace_guards_full.gdb")
    write_single_gdb_script(guards, full_gdb_path)

    batch_count = generate_hardware_batches(guards, out_dir, batch_size=4)
    generate_subsystem_scripts(guards, out_dir)

    print("Extraction and script generation complete.")
    print(f"Total guards extracted: {len(guards)}")
    print(f"EDDI guards: {sum(1 for g in guards if g['type'] == 'EDDI')}")
    print(f"RASM guards: {sum(1 for g in guards if g['type'] == 'RASM')}")
    print(f"Hardware batches generated (max 4 breakpoints/run): {batch_count}")
    print(f"Full QEMU script: {full_gdb_path}")
    print(f"Catalog: {json_path}")

if __name__ == "__main__":
    main()
