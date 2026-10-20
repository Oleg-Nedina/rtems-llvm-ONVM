import os
import sys

def find_pair(base_dir):
    f4 = None
    f5 = None
    for n in ("04_kernel_eddi.ll", "04_eddi_verify.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f4 = p
            break
    for n in ("05_kernel_simplifycfg.ll", "05_simplifycfg.ll", "03_simplifycfg.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f5 = p
            break
    if not f5:
        sys.exit(f"File stadio 05 non trovato in {base_dir}")
    return f4, f5

def stats(path):
    with open(path, "r", encoding="utf-8", errors="ignore") as f:
        lines = f.readlines()
    switches = 0
    bbs = 0
    dc_calls = 0
    in_func = False
    for line in lines:
        s = line.strip()
        if s.startswith("define "):
            in_func = True
        elif s == "}":
            in_func = False
        elif in_func:
            if s.endswith(":") or "preds =" in s:
                bbs += 1
            elif s and not s.startswith(";"):
                if s.startswith("switch ") or " switch " in s:
                    switches += 1
                if "call " in s and "@DataCorruption_Handler" in s:
                    dc_calls += 1
    return len(lines), switches, bbs, dc_calls

def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "/tmp/aspis_monolithic/output"
    f4, f5 = find_pair(base_dir)
    l5, sw5, bb5, dc5 = stats(f5)
    l4, sw4, bb4, dc4 = stats(f4) if f4 else (0, 0, 0, 0)

    print("======================================================================")
    print(f"[STADIO 05 - SIMPLIFYCFG + LOWER-SWITCH] File: {f5}")
    print("======================================================================")
    print(f"  Istruzioni 'switch' residue : {sw5} -> {'OK (Pronto per RASM)' if sw5 == 0 else 'ERRORE: switch presente!'}")
    print(f"  Basic Blocks dopo pulizia   : {bb5} (Stadio 04: {bb4}, Riduzione: {bb5 - bb4:+d})")
    print(f"  Check DataCorruption_Handler: {dc5} (Stadio 04: {dc4})")
    print(f"  Righe IR totali             : {l5} (Delta: {l5 - l4:+d})")
    print()

if __name__ == "__main__":
    main()
