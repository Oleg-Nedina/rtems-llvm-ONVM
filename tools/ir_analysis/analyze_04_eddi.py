import os
import re
import sys

def find_pair(base_dir):
    f3 = None
    f4 = None
    for n in ("03_kernel_func_ret.ll", "03_func_ret_to_ref.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f3 = p
            break
    for n in ("04_kernel_eddi.ll", "04_eddi_verify.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f4 = p
            break
    if not f4:
        sys.exit(f"File stadio 04 non trovato in {base_dir}")
    return f3, f4

def stats(path):
    with open(path, "r", encoding="utf-8", errors="ignore") as f:
        lines = f.readlines()
    defs = 0
    dup_defs = 0
    verif_bbs = 0
    err_bbs = 0
    dc_calls = 0
    memcpys = 0
    insts = 0
    in_func = False
    for line in lines:
        s = line.strip()
        if s.startswith("define "):
            defs += 1
            in_func = True
            m = re.search(r"@([\w\.\$]+)\(", s)
            if m and m.group(1).endswith("_dup"):
                dup_defs += 1
        elif s == "}":
            in_func = False
        elif in_func:
            if s.endswith(":") or "preds =" in s:
                if "VerificationBB" in s:
                    verif_bbs += 1
                elif "ErrBB" in s:
                    err_bbs += 1
            elif s and not s.startswith(";"):
                insts += 1
                if "call " in s and "@DataCorruption_Handler" in s:
                    dc_calls += 1
                if "@llvm.memcpy" in s:
                    memcpys += 1
    return len(lines), defs, dup_defs, verif_bbs, err_bbs, dc_calls, memcpys, insts

def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "/tmp/aspis_monolithic/output"
    f3, f4 = find_pair(base_dir)
    l4, d4, dup4, vb4, eb4, dc4, mc4, i4 = stats(f4)
    l3, d3, _, _, _, _, mc3, i3 = stats(f3) if f3 else (0, 0, 0, 0, 0, 0, 0, 0)

    ratio = (i4 / i3) if i3 > 0 else 0.0
    print("======================================================================")
    print(f"[STADIO 04 - EDDI VERIFY] File: {f4}")
    print("======================================================================")
    print(f"  Funzioni totali definite    : {d4} (Stadio 03: {d3})")
    print(f"  Funzioni duplicate '*_dup'  : {dup4}")
    print(f"  Blocchi VerificationBB      : {vb4}")
    print(f"  Blocchi ErrBB               : {eb4}")
    print(f"  Check DataCorruption_Handler: {dc4}")
    print(f"  Sincronizzazioni TAD memcpy : {mc4 - mc3:+d} (Totale: {mc4})")
    print(f"  Istruzioni IR totali        : {i4} (Stadio 03: {i3}, Fattore espansione: {ratio:.2f}x)")
    print(f"  Righe IR totali             : {l4} (Delta: {l4 - l3:+d})")
    print()

if __name__ == "__main__":
    main()
