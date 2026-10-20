import os
import sys

def find_pair(base_dir):
    f1 = None
    f2 = None
    for n in ("01_kernel_linked.ll", "01_raw.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f1 = p
            break
    for n in ("02_kernel_lower_switch.ll", "02_lower_switch.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f2 = p
            break
    if not f2:
        sys.exit(f"File stadio 02 non trovato in {base_dir}")
    return f1, f2

def stats(path):
    with open(path, "r", encoding="utf-8", errors="ignore") as f:
        lines = f.readlines()
    switches = 0
    bbs = 0
    icmps = 0
    node_blocks = 0
    leaf_blocks = 0
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
                if s.startswith("NodeBlock"):
                    node_blocks += 1
                elif s.startswith("LeafBlock"):
                    leaf_blocks += 1
            elif s and not s.startswith(";"):
                if s.startswith("switch ") or " switch " in s:
                    switches += 1
                if " = icmp " in s:
                    icmps += 1
    return len(lines), switches, bbs, icmps, node_blocks, leaf_blocks

def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "/tmp/aspis_monolithic/output"
    f1, f2 = find_pair(base_dir)
    l2, sw2, bb2, ic2, nb2, lb2 = stats(f2)
    l1, sw1, bb1, ic1, _, _ = stats(f1) if f1 else (0, 0, 0, 0, 0, 0)

    print("======================================================================")
    print(f"[STADIO 02 - LOWER-SWITCH] File: {f2}")
    print("======================================================================")
    print(f"  Istruzioni 'switch' residue : {sw2} (Stadio 01: {sw1}) -> {'OK (0 switch)' if sw2 == 0 else 'ATTENZIONE!'}")
    print(f"  Basic Blocks totali         : {bb2} (Delta rispetto a Stadio 01: {bb2 - bb1:+d})")
    print(f"  Blocchi albero decisionale  : NodeBlock={nb2}, LeafBlock={lb2}")
    print(f"  Istruzioni 'icmp' totali    : {ic2} (Delta rispetto a Stadio 01: {ic2 - ic1:+d})")
    print(f"  Righe IR totali             : {l2} (Delta: {l2 - l1:+d})")
    print()

if __name__ == "__main__":
    main()
