import sys
import os
import re

def analyze_rasm(ll_path, prev_ll_path=None):
    if not os.path.exists(ll_path):
        print(f"[ERRORE] File non trovato: {ll_path}")
        sys.exit(1)

    sig_calls = 0
    datacorruption_calls = 0
    bbs = 0
    instructions = 0
    lines = 0
    defined_funcs = 0
    re_bb = re.compile(r'^[a-zA-Z0-9_\.\-]+:\s*(;.*)?$')

    in_func = False
    with open(ll_path, 'r', errors='replace') as f:
        for line in f:
            lines += 1
            s = line.strip()
            if not s:
                continue
            if s.startswith('define '):
                in_func = True
                defined_funcs += 1
                bbs += 1
                continue
            elif s == '}':
                in_func = False
                continue

            if in_func:
                if re_bb.match(s):
                    bbs += 1
                elif not s.startswith(';') and not s.startswith(']'):
                    instructions += 1
                    if '@SigMismatch_Handler' in s and ('call ' in s or 'invoke ' in s):
                        sig_calls += 1
                    elif '@DataCorruption_Handler' in s and ('call ' in s or 'invoke ' in s):
                        datacorruption_calls += 1

    prev_inst = 0
    if prev_ll_path and os.path.exists(prev_ll_path):
        in_f = False
        with open(prev_ll_path, 'r', errors='replace') as pf:
            for line in pf:
                s = line.strip()
                if s.startswith('define '):
                    in_f = True
                elif s == '}':
                    in_f = False
                elif in_f and s and not re_bb.match(s) and not s.startswith(';') and not s.startswith(']'):
                    prev_inst += 1

    cov_pct = (sig_calls / defined_funcs * 100.0) if defined_funcs > 0 else 0.0

    print("=" * 70)
    print(f"[STADIO 06 - RASM VERIFY] File: {ll_path}")
    print("=" * 70)
    print(f"  Check SigMismatch_Handler   : {sig_calls} ({sig_calls}/{defined_funcs} funzioni protette = {cov_pct:.1f}%)")
    print(f"  Check DataCorruption_Handler: {datacorruption_calls}")
    print(f"  Totale guardie attive       : {sig_calls + datacorruption_calls} (EDDI + RASM)")
    print(f"  Basic Blocks totali         : {bbs}")
    print(f"  Istruzioni IR totali        : {instructions}" + (f" (Overhead RASM: +{instructions - prev_inst} istruzioni)" if prev_inst else ""))
    print(f"  Righe IR totali             : {lines}")
    print()

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Uso: analyze_06_rasm.py <06_rasm_verify.ll> [05_simplifycfg.ll]")
        sys.exit(1)
    prev = sys.argv[2] if len(sys.argv) > 2 else None
    analyze_rasm(sys.argv[1], prev)
