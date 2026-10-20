import os
import re
import sys

def find_pair(base_dir):
    f2 = None
    f3 = None
    for n in ("02_kernel_lower_switch.ll", "02_lower_switch.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f2 = p
            break
    for n in ("03_kernel_func_ret.ll", "03_func_ret_to_ref.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f3 = p
            break
    if not f3:
        sys.exit(f"File stadio 03 non trovato in {base_dir}")
    return f2, f3

def stats(path):
    with open(path, "r", encoding="utf-8", errors="ignore") as f:
        lines = f.readlines()
    defs = 0
    ret_defs = 0
    allocas = 0
    for line in lines:
        s = line.strip()
        if s.startswith("define "):
            defs += 1
            m = re.search(r"@([\w\.\$]+)\(", s)
            if m and m.group(1).endswith("_ret"):
                ret_defs += 1
        elif " = alloca " in s:
            allocas += 1
    return len(lines), defs, ret_defs, allocas

def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "/tmp/aspis_monolithic/output"
    f2, f3 = find_pair(base_dir)
    l3, d3, r3, a3 = stats(f3)
    l2, d2, r2, a2 = stats(f2) if f2 else (0, 0, 0, 0)

    print("======================================================================")
    print(f"[STADIO 03 - FUNC-RET-TO-REF] File: {f3}")
    print("======================================================================")
    print(f"  Funzioni totali definite    : {d3} (Stadio 02: {d2}, Nuove: {d3 - d2:+d})")
    print(f"  Funzioni clonate '*_ret'    : {r3}")
    print(f"  Funzioni rimaste void/orig  : {d3 - 2 * r3}")
    print(f"  Istruzioni 'alloca' totali  : {a3} (Nuove alloca per ret-ptr: {a3 - a2:+d})")
    print(f"  Righe IR totali             : {l3} (Delta: {l3 - l2:+d})")
    print()

if __name__ == "__main__":
    main()
