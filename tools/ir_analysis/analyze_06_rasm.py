import os
import sys

def find_pair(base_dir):
    f5 = None
    f6 = None
    for n in ("05_kernel_simplifycfg.ll", "05_simplifycfg.ll", "03_simplifycfg.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f5 = p
            break
    for n in ("06_kernel_rasm.ll", "06_rasm_verify.ll", "04_rasm_verify.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f6 = p
            break
    if not f6:
        sys.exit(f"File stadio 06 non trovato in {base_dir}")
    return f5, f6

def stats(path):
    with open(path, "r", encoding="utf-8", errors="ignore") as f:
        lines = f.readlines()
    rasm_bbs = 0
    rasm_ret_bbs = 0
    sig_calls = 0
    dc_calls = 0
    insts = 0
    in_func = False
    for line in lines:
        s = line.strip()
        if s.startswith("define "):
            in_func = True
        elif s == "}":
            in_func = False
        elif in_func:
            if s.endswith(":") or "preds =" in s:
                if "RASM_ret_Verification_BB" in s:
                    rasm_ret_bbs += 1
                elif "RASM_Verification_BB" in s:
                    rasm_bbs += 1
            elif s and not s.startswith(";"):
                insts += 1
                if "call " in s and "@SigMismatch_Handler" in s:
                    sig_calls += 1
                if "call " in s and "@DataCorruption_Handler" in s:
                    dc_calls += 1
    return len(lines), rasm_bbs, rasm_ret_bbs, sig_calls, dc_calls, insts

def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "/tmp/aspis_monolithic/output"
    f5, f6 = find_pair(base_dir)
    l6, rb6, rrb6, sc6, dc6, i6 = stats(f6)
    l5, _, _, _, _, i5 = stats(f5) if f5 else (0, 0, 0, 0, 0, 0)

    print("======================================================================")
    print(f"[STADIO 06 - RASM VERIFY (CFI)] File: {f6}")
    print("======================================================================")
    print(f"  Blocchi RASM_Verification_BB    : {rb6}")
    print(f"  Blocchi RASM_ret_Verification_BB: {rrb6}")
    print(f"  Check SigMismatch_Handler (RASM): {sc6}")
    print(f"  Check DataCorruption (EDDI)     : {dc6}")
    print(f"  Totale Guardie Combinate        : {sc6 + dc6}")
    print(f"  Istruzioni IR totali            : {i6} (Delta RASM: {i6 - i5:+d})")
    print(f"  Righe IR totali                 : {l6} (Delta: {l6 - l5:+d})")
    print()

if __name__ == "__main__":
    main()
