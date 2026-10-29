import sys
import os
import re

def analyze_eddi(ll_path, prev_ll_path=None):
    if not os.path.exists(ll_path):
        print(f"[ERRORE] File non trovato: {ll_path}")
        sys.exit(1)

    funcs = []
    dup_funcs = []
    verif_bbs = 0
    err_bbs = 0
    datacorruption_calls = 0
    memcpy_calls = 0
    instructions = 0
    lines = 0

    re_define = re.compile(r'^define\s+.*?@([^\(\s]+)\(')
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
                m = re_define.match(s)
                if m:
                    fn = m.group(1)
                    funcs.append(fn)
                    if fn.endswith('_dup'):
                        dup_funcs.append(fn)
                continue
            elif s == '}':
                in_func = False
                continue

            if in_func:
                m_bb = re_bb.match(s)
                if m_bb:
                    bb_name = m_bb.group(1)
                    if 'VerificationBB' in bb_name:
                        verif_bbs += 1
                    elif 'ErrBB' in bb_name:
                        err_bbs += 1
                elif not s.startswith(';') and not s.startswith(']'):
                    instructions += 1
                    if '@DataCorruption_Handler' in s and ('call ' in s or 'invoke ' in s):
                        datacorruption_calls += 1
                    if '@llvm.memcpy' in s and 'call ' in s:
                        memcpy_calls += 1

    prev_funcs_count = 0
    prev_memcpy = 0
    non_duplicated = []
    if prev_ll_path and os.path.exists(prev_ll_path):
        prev_funcs = []
        with open(prev_ll_path, 'r', errors='replace') as pf:
            for line in pf:
                s = line.strip()
                if s.startswith('define '):
                    m = re_define.match(s)
                    if m:
                        prev_funcs.append(m.group(1))
                elif '@llvm.memcpy' in s and 'call ' in s:
                    prev_memcpy += 1
        prev_funcs_count = len(prev_funcs)
        dup_base_set = {fn[:-4] for fn in dup_funcs}
        non_duplicated = [fn for fn in prev_funcs if fn not in dup_base_set]

    print("=" * 70)
    print(f"[STADIO 04 - EDDI VERIFY] File: {ll_path}")
    print("=" * 70)
    print(f"  Funzioni totali definite    : {len(funcs)}" + (f" (Stadio 03: {prev_funcs_count})" if prev_funcs_count else ""))
    print(f"  Funzioni duplicate '*_dup'  : {len(dup_funcs)}")
    if non_duplicated:
        print(f"  Funzioni senza clone '_dup' : {len(non_duplicated)} -> {', '.join(non_duplicated)}")
    print(f"  Blocchi VerificationBB      : {verif_bbs}")
    print(f"  Blocchi ErrBB               : {err_bbs}")
    print(f"  Check DataCorruption_Handler: {datacorruption_calls}")
    print(f"  Sincronizzazioni TAD memcpy : +{memcpy_calls - prev_memcpy} (Totale: {memcpy_calls})")
    print(f"  Istruzioni IR totali        : {instructions}")
    print(f"  Righe IR totali             : {lines}")
    print()

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Uso: analyze_04_eddi.py <04_eddi_verify.ll> [03_func_ret_to_ref.ll]")
        sys.exit(1)
    prev = sys.argv[2] if len(sys.argv) > 2 else None
    analyze_eddi(sys.argv[1], prev)
