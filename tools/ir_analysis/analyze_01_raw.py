import os
import re
import sys

def find_file(base_dir):
    for name in ("01_kernel_linked.ll", "01_raw.ll"):
        p = os.path.join(base_dir, name)
        if os.path.isfile(p):
            return p
    sys.exit(f"File stadio 01 non trovato in {base_dir}")

def analyze(path):
    with open(path, "r", encoding="utf-8", errors="ignore") as f:
        lines = f.readlines()

    defs = 0
    decls = 0
    globals_cnt = 0
    constants_cnt = 0
    switches = 0
    bbs = 0
    insts = 0
    dicomp = 0
    dideriv = 0
    disub = 0
    annotations = []

    in_func = False
    for line in lines:
        s = line.strip()
        if s.startswith("define "):
            defs += 1
            in_func = True
        elif s.startswith("declare "):
            decls += 1
        elif s == "}":
            in_func = False
        elif in_func:
            if s.endswith(":") or "preds =" in s:
                bbs += 1
            elif s and not s.startswith(";"):
                insts += 1
                if s.startswith("switch ") or " switch " in s:
                    switches += 1

        if re.match(r"^@[\w\.\$]+\s*=\s*.*global\b", s):
            globals_cnt += 1
        elif re.match(r"^@[\w\.\$]+\s*=\s*.*constant\b", s):
            constants_cnt += 1

        if "DICompositeType" in s:
            dicomp += 1
        if "DIDerivedType" in s:
            dideriv += 1
        if "DISubprogram" in s:
            disub += 1
        if "@llvm.global.annotations" in s:
            annotations.append(s)

    size_kb = os.path.getsize(path) / 1024.0
    print("======================================================================")
    print(f"[STADIO 01 - RAW / LINKED IR] File: {path}")
    print("======================================================================")
    print(f"  Dimensione file IR          : {size_kb:.2f} KB ({len(lines)} righe)")
    print(f"  Funzioni definite (define)  : {defs}")
    print(f"  Funzioni esterne (declare)  : {decls}")
    print(f"  Basic Blocks stimati        : {bbs}")
    print(f"  Istruzioni IR totali        : {insts}")
    print(f"  Istruzioni 'switch'         : {switches}")
    print(f"  Variabili globali mutabili  : {globals_cnt}")
    print(f"  Costanti globali            : {constants_cnt}")
    print(f"  Metadati DWARF              : DICompositeType={dicomp}, DIDerivedType={dideriv}, DISubprogram={disub}")
    print(f"  Tabella annotazioni presenti: {'SI' if annotations else 'NO'}")
    print()

if __name__ == "__main__":
    target_dir = sys.argv[1] if len(sys.argv) > 1 else "/tmp/aspis_monolithic/output"
    analyze(find_file(target_dir))
