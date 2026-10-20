import os
import re
import sys

def find_files(base_dir):
    f1 = None
    f7 = None
    for n in ("01_kernel_linked.ll", "01_raw.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f1 = p
            break
    for n in ("07_kernel_globals.ll", "07_duplicate_globals.ll"):
        p = os.path.join(base_dir, n)
        if os.path.isfile(p):
            f7 = p
            break
    if not f7:
        sys.exit(f"File stadio 07 non trovato in {base_dir}")
    return f1, f7

def classify_kind(rest):
    if re.search(r"global\s+\[\d+\s+x\s+", rest):
        return "array"
    if "%struct." in rest or "%union." in rest:
        return "struct/union"
    return "scalar/ptr"

def analyze_globals(path):
    with open(path, "r", encoding="utf-8", errors="ignore") as f:
        lines = f.readlines()

    orig_globals = {}
    dup_names = set()
    const_globals = 0
    defs = 0
    dc_calls = 0
    sig_calls = 0

    for line in lines:
        s = line.strip()
        if s.startswith("define "):
            defs += 1
        elif "call " in s and "@DataCorruption_Handler" in s:
            dc_calls += 1
        elif "call " in s and "@SigMismatch_Handler" in s:
            sig_calls += 1

        m = re.match(r"^@([\w\.\$]+)\s*=\s*(.*)", s)
        if m:
            name, rest = m.group(1), m.group(2)
            if name.startswith("llvm."):
                continue
            if "constant" in rest:
                const_globals += 1
            elif "global" in rest:
                if name.endswith("_dup"):
                    dup_names.add(name[:-4])
                else:
                    orig_globals[name] = rest

    dup_by_kind = {"scalar/ptr": 0, "struct/union": 0, "array": 0}
    nondup_by_kind = {"scalar/ptr": 0, "struct/union": 0, "array": 0}
    nondup_details = []

    for name, rest in sorted(orig_globals.items()):
        kind = classify_kind(rest)
        if name in dup_names:
            dup_by_kind[kind] += 1
        else:
            nondup_by_kind[kind] += 1
            if re.search(r"\bexternal\b", rest):
                reason = "dichiarazione external (definita fuori dal modulo)"
            elif "section " in rest:
                reason = "sezione custom del linker (hasSection)"
            else:
                reason = "NON DUPLICATA (da verificare in EDDI/DuplicateGlobals)"
            nondup_details.append((name, kind, reason))

    total_globals = len(orig_globals) + len(dup_names)
    return (
        len(lines),
        defs,
        total_globals,
        len(orig_globals),
        len(dup_names),
        dup_by_kind,
        nondup_by_kind,
        nondup_details,
        const_globals,
        dc_calls,
        sig_calls,
    )

def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "/tmp/aspis_monolithic/output"
    f1, f7 = find_files(base_dir)
    (
        l7,
        d7,
        tg7,
        orig_cnt,
        dup_cnt,
        dup_by_kind,
        nondup_by_kind,
        nondup_details,
        cg7,
        dc7,
        sc7,
    ) = analyze_globals(f7)
    l1 = sum(1 for _ in open(f1, "r", encoding="utf-8", errors="ignore")) if f1 else 0
    size_kb = os.path.getsize(f7) / 1024.0

    print("======================================================================")
    print(f"[STADIO 07 - DUPLICATE-GLOBALS & RIEPILOGO FINALE] File: {f7}")
    print("======================================================================")
    print(f"  Dimensione IR finale            : {size_kb:.2f} KB ({l7} righe, Stadio 01: {l1} righe)")
    print(f"  Funzioni totali nel modulo      : {d7}")
    print(f"  Variabili globali mutabili tot. : {tg7} ({orig_cnt} originali + {dup_cnt} copie _dup)")
    print(f"  -> Scalari/Ptr duplicati        : {dup_by_kind['scalar/ptr']} (non dup: {nondup_by_kind['scalar/ptr']})")
    print(f"  -> Struct/Union duplicate       : {dup_by_kind['struct/union']} (non dup: {nondup_by_kind['struct/union']})")
    print(f"  -> Array duplicati              : {dup_by_kind['array']} (non dup: {nondup_by_kind['array']})")
    print(f"  Costanti globali (read-only)    : {cg7}")
    print(f"  Totale Guardie EDDI             : {dc7}")
    print(f"  Totale Guardie RASM             : {sc7}")
    print(f"  Totale Guardie Attive nel Blocco: {dc7 + sc7}")
    if nondup_details:
        print("----------------------------------------------------------------------")
        print("  Dettaglio variabili globali mutabili NON duplicate:")
        for name, kind, reason in nondup_details:
            print(f"    - @{name:<38} [{kind:<12}] -> {reason}")
    print("======================================================================")
    print()

if __name__ == "__main__":
    main()
