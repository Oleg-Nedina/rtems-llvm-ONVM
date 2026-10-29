import sys
import os
import re

def analyze_raw(ll_path):
    if not os.path.exists(ll_path):
        print(f"[ERRORE] File non trovato: {ll_path}")
        sys.exit(1)

    size_kb = os.path.getsize(ll_path) / 1024.0
    lines = 0
    defined_funcs = []
    declared_funcs = []
    basic_blocks = 0
    instructions = 0
    switches = 0
    mutable_defined = []
    mutable_section = []
    mutable_external = []
    constant_globals = []
    dwarf_composite = 0
    dwarf_derived = 0
    dwarf_subprogram = 0
    has_annotations = False

    re_define = re.compile(r'^define\s+.*?@([^\(\s]+)\(')
    re_declare = re.compile(r'^declare\s+.*?@([^\(\s]+)\(')
    re_global = re.compile(r'^@([^\s=]+)\s*=\s*(.*)')
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
                m = re_define.match(s)
                if m:
                    defined_funcs.append(m.group(1))
                basic_blocks += 1
                continue
            elif s == '}':
                in_func = False
                continue

            if s.startswith('declare '):
                m = re_declare.match(s)
                if m:
                    declared_funcs.append(m.group(1))
                continue

            if s.startswith('@'):
                m = re_global.match(s)
                if m:
                    gname, grest = m.group(1), m.group(2)
                    if gname == 'llvm.global.annotations':
                        has_annotations = True
                    elif gname.startswith('llvm.'):
                        continue
                    elif 'constant ' in grest:
                        constant_globals.append(gname)
                    elif 'global ' in grest:
                        if re.search(r'\bexternal\b', grest):
                            mutable_external.append(gname)
                        elif 'section "' in grest:
                            mutable_section.append(gname)
                        else:
                            mutable_defined.append(gname)
                continue

            if s.startswith('!'):
                if '!DICompositeType(' in s:
                    dwarf_composite += 1
                elif '!DIDerivedType(' in s:
                    dwarf_derived += 1
                elif '!DISubprogram(' in s:
                    dwarf_subprogram += 1
                continue

            if in_func:
                if re_bb.match(s):
                    basic_blocks += 1
                elif not s.startswith(';') and not s.startswith(']'):
                    instructions += 1
                    if s.startswith('switch ') or ' switch ' in s:
                        switches += 1

    def_set = set(defined_funcs)
    glob_set = set(mutable_defined) | set(mutable_section) | set(constant_globals)

    bench_Main_targets = [
        'Init', 'main', 'acas', 'ann', 'canny',
        'img_scaling', 'jpeg_compress', 'latnav', 'crcSlow', 'random_get'
    ]
    present_bench = [fn for fn in bench_Main_targets if fn in def_set]

    confdefs_targets = [
        '_Thread_Information', '_RTEMS_tasks_Information',
        '_Message_queue_Information', '_Semaphore_Information',
        '_RTEMS_tasks_User_task_table'
    ]
    present_confdefs = [g for g in confdefs_targets if g in glob_set]

    total_mut = len(mutable_defined) + len(mutable_section) + len(mutable_external)

    print("=" * 70)
    print(f"[STADIO 01 - RAW / LINKED IR] File: {ll_path}")
    print("=" * 70)
    print(f"  Dimensione file IR          : {size_kb:.2f} KB ({lines} righe)")
    print(f"  Funzioni definite (define)  : {len(defined_funcs)}")
    print(f"  Funzioni esterne (declare)  : {len(declared_funcs)}")
    print(f"  Basic Blocks stimati        : {basic_blocks}")
    print(f"  Istruzioni IR totali        : {instructions}")
    print(f"  Istruzioni 'switch'         : {switches}")
    print(f"  Globali mutabili totali     : {total_mut} (Definite std: {len(mutable_defined)}, Sezioni custom: {len(mutable_section)}, External: {len(mutable_external)})")
    print(f"  Costanti globali            : {len(constant_globals)}")
    print(f"  Entrypoint Benchmark presenti: {len(present_bench)}/{len(bench_Main_targets)} ({', '.join(present_bench)})")
    print(f"  Tabelle confdefs.h presenti : {len(present_confdefs)}/{len(confdefs_targets)} ({', '.join(present_confdefs)})")
    print(f"  Metadati DWARF              : DICompositeType={dwarf_composite}, DIDerivedType={dwarf_derived}, DISubprogram={dwarf_subprogram}")
    print(f"  Tabella annotazioni presenti: {'SI' if has_annotations else 'NO'}")
    print()

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Uso: analyze_01_raw.py <01_raw.ll>")
        sys.exit(1)
    analyze_raw(sys.argv[1])
