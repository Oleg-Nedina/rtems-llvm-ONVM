import sys
import os
import re

def classify_global(grest):
    if ' section "' in grest or ', section "' in grest:
        return "section_custom"
    if re.search(r'\bexternal\b', grest):
        return "external"
    if re.search(r'global\s+%struct\.', grest) or re.search(r'global\s+%union\.', grest) or re.search(r'global\s+\{', grest):
        return "struct_union"
    if re.search(r'global\s+\[\d+\s+x\s+', grest):
        return "array"
    return "scalar_ptr"

def analyze_duplicate_globals(ll_path, prev_ll_path=None):
    if not os.path.exists(ll_path):
        print(f"[ERRORE] File non trovato: {ll_path}")
        sys.exit(1)

    re_global = re.compile(r'^@([^\s=]+)\s*=\s*(.*)')

    orig_globals = {}
    dup_defined_names = set()
    dup_external_names = set()
    const_count = 0
    lines = 0

    with open(ll_path, 'r', errors='replace') as f:
        for line in f:
            lines += 1
            s = line.strip()
            if not s.startswith('@'):
                continue
            m = re_global.match(s)
            if not m:
                continue
            gname, grest = m.group(1), m.group(2)
            if gname.startswith('llvm.') or gname.startswith('.'):
                continue
            if 'constant ' in grest:
                const_count += 1
                continue
            if 'global ' in grest:
                if gname.endswith('_dup'):
                    if re.search(r'\bexternal\b', grest):
                        dup_external_names.add(gname)
                    else:
                        dup_defined_names.add(gname)
                else:
                    orig_globals[gname] = classify_global(grest)

    duplicated_by_cat = {"scalar_ptr": [], "struct_union": [], "array": []}
    missing_std = []
    section_globals = []
    external_globals = []

    for gname, cat in sorted(orig_globals.items()):
        if cat == "section_custom":
            section_globals.append(gname)
        elif cat == "external":
            external_globals.append(gname)
        else:
            if f"{gname}_dup" in dup_defined_names:
                duplicated_by_cat[cat].append(gname)
            else:
                missing_std.append((gname, cat))

    total_std_def = sum(len(v) for v in duplicated_by_cat.values()) + len(missing_std)
    total_std_dup = sum(len(v) for v in duplicated_by_cat.values())
    std_pct = (total_std_dup / total_std_def * 100.0) if total_std_def > 0 else 100.0

    critical_targets = [
        '_Thread_Information',
        '_RTEMS_tasks_Information',
        '_Message_queue_Information',
        '_Semaphore_Information',
        '_Per_CPU_Information',
        '_System_state_Current',
        '_Thread_Dispatch_disable_level',
        '_ISR_Nest_level',
        'input1',
        'image_in',
        'output_data',
    ]
    verified_critical = [t for t in critical_targets if f"{t}_dup" in dup_defined_names]

    print("=" * 70)
    print(f"[STADIO 07 - DUPLICATE-GLOBALS] File: {ll_path}")
    print("=" * 70)
    print(f"  Globali mutabili standard definite nel monolite : {total_std_def}")
    print(f"  Globali duplicate '@*_dup' generate             : {total_std_dup}/{total_std_def} ({std_pct:.1f}%)")
    print(f"  Costanti globali (sola lettura)                 : {const_count}")
    print("-" * 70)
    print("  Dettaglio copertura globali definite standard:")
    for cat, label in [
        ("scalar_ptr", "Scalari / Puntatori definiti"),
        ("struct_union", "Struct / Union definite (confdefs/kernel)"),
        ("array", "Array definiti (buffer benchmark/kernel)")
    ]:
        dup_c = len(duplicated_by_cat[cat])
        tot_c = dup_c + sum(1 for _, c in missing_std if c == cat)
        pct = (dup_c / tot_c * 100.0) if tot_c > 0 else 100.0
        print(f"    - {label:42s}: {dup_c:3d}/{tot_c:3d} duplicate ({pct:5.1f}%)")

    print("-" * 70)
    print(f"  Globali con attributo 'section' (escluse da pass): {len(section_globals)} -> {', '.join(section_globals)}")
    print(f"  Dichiarazioni 'external global' (esterne al mod.): {len(external_globals)} (di cui {len(dup_external_names)} con dich. external _dup)")
    print(f"  Verifica simboli critici (confdefs + benchmark)  : {len(verified_critical)}/{len(critical_targets)} duplicati ({', '.join(verified_critical)})")

    if missing_std:
        print("-" * 70)
        print("  [ATTENZIONE] Globali standard definite NON duplicate:")
        for gname, cat in missing_std:
            print(f"    * @{gname} [{cat}]")
    print()

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Uso: analyze_07_duplicate_globals.py <07_duplicate_globals.ll> [06_rasm_verify.ll]")
        sys.exit(1)
    prev = sys.argv[2] if len(sys.argv) > 2 else None
    analyze_duplicate_globals(sys.argv[1], prev)
