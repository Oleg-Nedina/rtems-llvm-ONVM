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
        print("Manifest not found. Please run extract_guards.py first.")
        sys.exit(1)

    elf_path = sys.argv[1] if len(sys.argv) > 1 else os.path.join(script_dir, "../src/rtems/build/arm/stm32f4/testsuites/benchmarks/bench_acas.exe")
    if not os.path.exists(elf_path):
        print(f"Target ELF not found: {elf_path}")
        sys.exit(1)

    gdb_bin = resolve_gdb_binary()
    timeout_sec = int(os.environ.get("GDB_TIMEOUT", "60"))

    with open(manifest_path, "r", encoding="utf-8") as f:
        manifest = json.load(f)

    max_batches = len(manifest)
    if len(sys.argv) > 2:
        try:
            max_batches = int(sys.argv[2])
        except ValueError:
            pass

    out_log_path = os.path.join(script_dir, "gdb_hardware_results.log")
    with open(out_log_path, "w", encoding="utf-8") as out_f:
        out_f.write("")

    print(f"GDB Binary: {gdb_bin}")
    print(f"Target ELF: {elf_path}")
    print(f"Total batches to run: {max_batches} of {len(manifest)}")
    print(f"Logging to: {out_log_path}")

    consecutive_conn_failures = 0

    for b in manifest[:max_batches]:
        b_id = b["batch_id"]
        b_file = os.path.join(batches_dir, b["file"])
        print(f"Running batch {b_id:03d}/{len(manifest)} ({b['guard_count']} guards)...", end="", flush=True)

        out = run_batch(gdb_bin, b_file, elf_path, timeout=timeout_sec)
        with open(out_log_path, "a", encoding="utf-8") as out_f:
            out_f.write(out + "\n")

        hit_lines = [l for l in out.splitlines() if "GUARD_" in l and "hits" in l]

        if "Connection refused" in out or "Remote connection closed" in out or "Cannot connect to remote" in out:
            consecutive_conn_failures += 1
            print(f" FAILED (connection error)")
            if consecutive_conn_failures >= 2:
                print("\n[!] Connection to debug server failed repeatedly. Check ST-Link / st-util daemon.")
                break
        else:
            consecutive_conn_failures = 0
            print(f" done. ({len(hit_lines)} guards reported)")

    print(f"\nCompleted execution. Results saved to: {out_log_path}")
    print("Running analysis...")

    analyze_script = os.path.join(script_dir, "analyze_results.py")
    if os.path.exists(analyze_script):
        subprocess.run([sys.executable, analyze_script, out_log_path])

if __name__ == "__main__":
    main()
