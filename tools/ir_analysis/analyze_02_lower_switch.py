import sys
import os
import re

def count_metrics(ll_path):
    switches = 0
    bbs = 0
    node_blocks = 0
    leaf_blocks = 0
    icmps = 0
    lines = 0
    re_bb = re.compile(r'^([a-zA-Z0-9_\.\-]+):\s*(;.*)?$')

    in_func = False
    with open(ll_path, 'r', errors='replace') as f:
        for line in f:
            lines += 1
            s = line.strip()
            if not s:
                continue
            if s.startswith('define '):
                in_func = True
                bbs += 1
                continue
            elif s == '}':
                in_func = False
                continue

            if in_func:
                m_bb = re_bb.match(s)
                if m_bb:
                    bbs += 1
                    bb_name = m_bb.group(1)
                    if 'NodeBlock' in bb_name:
                        node_blocks += 1
                    elif 'LeafBlock' in bb_name:
                        leaf_blocks += 1
                elif not s.startswith(';') and not s.startswith(']'):
                    if s.startswith('switch ') or ' switch ' in s:
                        switches += 1
                    if '= icmp ' in s:
                        icmps += 1
    return switches, bbs, node_blocks, leaf_blocks, icmps, lines

def analyze_lower_switch(ll_path, prev_ll_path=None):
    if not os.path.exists(ll_path):
        print(f"[ERRORE] File non trovato: {ll_path}")
        sys.exit(1)

    sw, bbs, nb, lb, icmps, lines = count_metrics(ll_path)
    prev_sw_str = ""
    delta_bb_str = ""
    delta_icmp_str = ""
    delta_lines_str = ""

    if prev_ll_path and os.path.exists(prev_ll_path):
        p_sw, p_bbs, _, _, p_icmps, p_lines = count_metrics(prev_ll_path)
        prev_sw_str = f" (Stadio 01: {p_sw})"
        delta_bb_str = f" (Delta rispetto a Stadio 01: {bbs - p_bbs:+d})"
        delta_icmp_str = f" (Delta rispetto a Stadio 01: {icmps - p_icmps:+d})"
        delta_lines_str = f" (Delta: {lines - p_lines:+d})"

    status = "OK (0 switch)" if sw == 0 else f"ATTENZIONE ({sw} switch ancora presenti)"

    print("=" * 70)
    print(f"[STADIO 02 - LOWER-SWITCH] File: {ll_path}")
    print("=" * 70)
    print(f"  Istruzioni 'switch' residue : {sw}{prev_sw_str} -> {status}")
    print(f"  Basic Blocks totali         : {bbs}{delta_bb_str}")
    print(f"  Blocchi albero decisionale  : NodeBlock={nb}, LeafBlock={lb}")
    print(f"  Istruzioni 'icmp' totali    : {icmps}{delta_icmp_str}")
    print(f"  Righe IR totali             : {lines}{delta_lines_str}")
    print()

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Uso: analyze_02_lower_switch.py <02_lower_switch.ll> [01_raw.ll]")
        sys.exit(1)
    prev = sys.argv[2] if len(sys.argv) > 2 else None
    analyze_lower_switch(sys.argv[1], prev)
