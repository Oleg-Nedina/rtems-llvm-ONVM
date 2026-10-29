import sys
import os
import re

def count_cfg(ll_path):
    bbs = 0
    verif_bbs = 0
    err_bbs = 0
    switches = 0
    phis = 0
    selects = 0
    datacorruption_calls = 0
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
                    bname = m_bb.group(1)
                    if 'VerificationBB' in bname:
                        verif_bbs += 1
                    elif 'ErrBB' in bname:
                        err_bbs += 1
                elif not s.startswith(';') and not s.startswith(']'):
                    if s.startswith('switch ') or ' switch ' in s:
                        switches += 1
                    if '= phi ' in s:
                        phis += 1
                    if '= select ' in s:
                        selects += 1
                    if '@DataCorruption_Handler' in s and ('call ' in s or 'invoke ' in s):
                        datacorruption_calls += 1
    return bbs, verif_bbs, err_bbs, switches, phis, selects, datacorruption_calls, lines

def analyze_simplifycfg(ll_path, prev_ll_path=None):
    if not os.path.exists(ll_path):
        print(f"[ERRORE] File non trovato: {ll_path}")
        sys.exit(1)

    bbs, v_bbs, e_bbs, sw, phis, selects, dc_calls, lines = count_cfg(ll_path)

    delta_bb = ""
    delta_vbb = ""
    delta_dc = ""
    if prev_ll_path and os.path.exists(prev_ll_path):
        p_bbs, p_vbbs, _, _, _, _, p_dc, _ = count_cfg(prev_ll_path)
        pct = ((bbs - p_bbs) / p_bbs * 100.0) if p_bbs else 0.0
        delta_bb = f" (Stadio 04: {p_bbs}, Riduzione: {bbs - p_bbs:+d} BB [{pct:.1f}%])"
        delta_vbb = f" (Stadio 04: {p_vbbs}, Fusi: {v_bbs - p_vbbs:+d})"
        delta_dc = f" (Stadio 04: {p_dc}, Preservati: {dc_calls}/{p_dc})"

    print("=" * 70)
    print(f"[STADIO 05 - SIMPLIFYCFG + LOWER-SWITCH] File: {ll_path}")
    print("=" * 70)
    print(f"  Basic Blocks totali         : {bbs}{delta_bb}")
    print(f"  Blocchi VerificationBB      : {v_bbs}{delta_vbb}")
    print(f"  Check DataCorruption_Handler: {dc_calls}{delta_dc}")
    print(f"  Istruzioni 'switch' residue : {sw} -> {'OK (0 switch)' if sw == 0 else 'ERRORE'}")
    print(f"  Istruzioni 'phi' / 'select' : phi={phis}, select={selects}")
    print(f"  Righe IR totali             : {lines}")
    print()

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Uso: analyze_05_simplifycfg.py <05_simplifycfg.ll> [04_eddi_verify.ll]")
        sys.exit(1)
    prev = sys.argv[2] if len(sys.argv) > 2 else None
    analyze_simplifycfg(sys.argv[1], prev)
