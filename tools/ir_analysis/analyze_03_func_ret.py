import sys
import os
import re

def parse_funcs(ll_path):
    funcs = []
    void_funcs = []
    nonvoid_funcs = []
    allocas = 0
    lines = 0
    re_define = re.compile(r'^define\s+(.*?)\s*@([^\(\s]+)\(')
    with open(ll_path, 'r', errors='replace') as f:
        for line in f:
            lines += 1
            s = line.strip()
            if s.startswith('define '):
                m = re_define.match(s)
                if m:
                    ret_prefix = m.group(1).strip()
                    fname = m.group(2)
                    funcs.append(fname)
                    if ret_prefix.endswith('void'):
                        void_funcs.append(fname)
                    else:
                        nonvoid_funcs.append(fname)
            elif '= alloca ' in s:
                allocas += 1
    return funcs, void_funcs, nonvoid_funcs, allocas, lines

def analyze_func_ret(ll_path, prev_ll_path=None):
    if not os.path.exists(ll_path):
        print(f"[ERRORE] File non trovato: {ll_path}")
        sys.exit(1)

    funcs, void_f, nonvoid_f, allocas, lines = parse_funcs(ll_path)
    ret_funcs = [fn for fn in funcs if fn.endswith('_ret')]
    orig_funcs = [fn for fn in funcs if not fn.endswith('_ret')]

    prev_info = ""
    alloca_info = ""
    lines_info = ""
    ratio_info = ""
    if prev_ll_path and os.path.exists(prev_ll_path):
        p_funcs, p_void, p_nonvoid, p_allocas, p_lines = parse_funcs(prev_ll_path)
        prev_info = f" (Stadio 02: {len(p_funcs)} = {len(p_void)} void + {len(p_nonvoid)} non-void, Nuove: +{len(funcs) - len(p_funcs)})"
        alloca_info = f" (Nuove alloca per ret-ptr: +{allocas - p_allocas})"
        lines_info = f" (Delta: +{lines - p_lines})"
        if len(p_nonvoid) > 0:
            pct = (len(ret_funcs) / len(p_nonvoid)) * 100.0
            ratio_info = f" ({len(ret_funcs)}/{len(p_nonvoid)} funzioni non-void trasformate = {pct:.1f}%)"

    print("=" * 70)
    print(f"[STADIO 03 - FUNC-RET-TO-REF] File: {ll_path}")
    print("=" * 70)
    print(f"  Funzioni totali definite    : {len(funcs)}{prev_info}")
    print(f"  Funzioni clonate '*_ret'    : {len(ret_funcs)}{ratio_info}")
    print(f"  Funzioni originali mantenute: {len(orig_funcs)}")
    print(f"  Istruzioni 'alloca' totali  : {allocas}{alloca_info}")
    print(f"  Righe IR totali             : {lines}{lines_info}")
    print()

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Uso: analyze_03_func_ret.py <03_func_ret_to_ref.ll> [02_lower_switch.ll]")
        sys.exit(1)
    prev = sys.argv[2] if len(sys.argv) > 2 else None
    analyze_func_ret(sys.argv[1], prev)
