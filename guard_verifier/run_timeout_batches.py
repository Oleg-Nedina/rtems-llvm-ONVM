import sys
import os
import subprocess
import json
import shutil

def resolve_gdb_binary():
    candidate = os.environ.get("GDB", "arm-rtems7-gdb")
    if shutil.which(candidate):
        return candidate
    for alt in ("gdb-multiarch", "arm-none-eabi-gdb", "gdb"):
        if shutil.which(alt):
            return alt
    return candidate

def run_batch(gdb_bin, gdb_script, elf_path, timeout=60):
    cmd = [
        gdb_bin,
        "-batch",
        "-x", gdb_script,
        elf_path
    ]
    try:
        res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=timeout)
        return res.stdout
    except subprocess.TimeoutExpired:
        print(f"Warning: batch {os.path.basename(gdb_script)} timed out after {timeout}s")
        return ""
    except Exception as e:
        print(f"Error running {gdb_script}: {e}")
        return ""

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    batches_dir = os.path.join(script_dir, "batches")
    manifest_path = os.path.join(batches_dir, "batches_manifest.json")

    if not os.path.exists(manifest_path):
        print("Manifest not found.")
        sys.exit(1)

    elf_path = sys.argv[1] if len(sys.argv) > 1 else os.path.join(script_dir, "../src/rtems/build/arm/stm32f4/testsuites/benchmarks/bench_eddi_stress.exe")
    if not os.path.exists(elf_path):
        print(f"Target ELF not found: {elf_path}")
        sys.exit(1)

    gdb_bin = resolve_gdb_binary()
    timeout_sec = int(os.environ.get("GDB_TIMEOUT", "60"))

    with open(manifest_path, "r", encoding="utf-8") as f:
        manifest = json.load(f)

    target_ids = [7, 8, 9, 14, 15]
    if len(sys.argv) > 2:
        try:
            target_ids = [int(x) for x in sys.argv[2].split(",")]
        except ValueError:
            pass

    selected_batches = [b for b in manifest if b["batch_id"] in target_ids]

    out_log_path = os.path.join(script_dir, "gdb_hardware_results.log")

    print(f"GDB Binary: {gdb_bin}")
    print(f"Target ELF: {elf_path}")
    print(f"Running selective batches: {target_ids}")
    print(f"Appending to: {out_log_path}")

    for b in selected_batches:
        b_id = b["batch_id"]
        b_file = os.path.join(batches_dir, b["file"])
        print(f"Running batch {b_id:03d} ({b['guard_count']} guards)...", end="", flush=True)

        out = run_batch(gdb_bin, b_file, elf_path, timeout=timeout_sec)
        with open(out_log_path, "a", encoding="utf-8") as out_f:
            out_f.write(out + "\n")

        hit_lines = [l for l in out.splitlines() if "GUARD_" in l and "hits" in l]
        print(f" done. ({len(hit_lines)} guards reported)")

    print("\nCompleted selective execution. Running analysis on updated log...")
    analyze_script = os.path.join(script_dir, "analyze_results.py")
    if os.path.exists(analyze_script):
        subprocess.run([sys.executable, analyze_script, out_log_path])

if __name__ == "__main__":
    main()
