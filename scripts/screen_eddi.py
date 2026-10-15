#!/usr/bin/env python3
import os
import sys
import glob
import subprocess
import time
import json

# ==============================================================================
# SCREENING EDDI - SUPERCORE RTEMS 7 (ARM STM32F4)
# ==============================================================================

CLANG = "/opt/rtems-llvm/rtems/bin/clang"
OPT = "/opt/rtems-llvm/rtems/bin/opt"
PASSES = "/opt/rtems-llvm/ASPIS/build/passes"
LIB_EDDI = f"{PASSES}/libEDDI.so"

CWD = "/opt/rtems-llvm/src/rtems/build/arm/stm32f4"
SRC_DIR = "/opt/rtems-llvm/src/rtems/cpukit/score/src"
TMP_BASE = "/tmp/eddi_screening"

TIMEOUT_SECONDS = 12

# Moduli già validati e consolidati (64 target)
WORKING_EDDI = {
    "threadstackallocate.c", "timespecaddto.c", "timespecisvalid.c", "timespecdivide.c",
    "timespecdividebyinteger.c", "timespecfromticks.c", "timespecgetasnanoseconds.c",
    "timespecisnonnegative.c", "timespeclessthan.c", "timespecsubtract.c", "timespectoticks.c",
    "watchdogremove.c", "watchdogtickssinceboot.c", "watchdogtimeslicedefault.c",
    "objectallocatenone.c", "objectfreenothing.c", "threadstackfree.c", "configstackspacesize.c",
    "threadentryadaptoridle.c", "threadentryadaptornumeric.c", "wkstringduplicate.c",
    "log2table.c", "threadidledefault.c", "wkspaceisunifieddefault.c", "stackallocator.c",
    "stackallocatorfree.c", "stackallocatorinit.c", "stackallocatorforidle.c",
    "stackallocatorforidlewkspace.c", "wkspaceallocate.c", "wkspacefree.c",
    "wkspacemallocinitdefault.c", "wkspacemallocinitunified.c", "memoryzerofreeareas.c",
    "memorydirtyfreeareas.c", "heapnoextend.c", "memoryzerobeforeuse.c", "isrisinprogress.c",
    "pheapallocate.c", "pheapfree.c", "pheapextend.c", "pheapgetinfo.c", "pheapgetfreeinfo.c",
    "pheapwalk.c", "allocatormutex.c", "apimutexlock.c", "apimutexunlock.c", "coresem.c",
    "corerwlock.c", "libatomic.c", "coretod.c", "once.c", "threadexhausttimeslice.c",
    "schedulerdefaultschedule.c", "schedulerdefaultreleasejob.c", "schedulerdefaultnodedestroy.c",
    "smplock.c", "smpbarrierwait.c", "objectnamespaceremove.c", "coretodhookdata.c",
    "coretodhookrun.c", "interr.c", "memorynoinit.c", "wkspace.c"
}

# Moduli già catalogati e sospesi (52 target)
KNOWN_SUSPENDED = {
    # FIX-01 (TDA loop)
    "chain.c", "coretodhookregister.c", "coretodhookunregister.c",
    # FIX-02 (TBAAParser cast)
    "watchdoginsert.c", "watchdogtick.c", "objectactivecount.c", "objectgetnoprotection.c",
    "threadentryadaptorpointer.c", "memoryfill.c", "pheapgetsize.c", "corebarrier.c",
    "hash.c", "threadyield.c", "threadclearstate.c", "threadsetstate.c", "threadresettimeslice.c",
    "schedulerdefaultstartidle.c", "schedulerdefaultnodeinit.c", "coremsgclose.c", "coremsgflush.c",
    "memoryallocate.c", "heap.c", "heapallocate.c", "heapextend.c", "heapfree.c", "heapgetfreeinfo.c",
    "heapgetinfo.c", "heapgreedy.c", "heapiterate.c", "heapsizeofuserarea.c", "heapwalk.c",
    "coremsgseize.c", "coremsgwkspace.c", "coremutexseize.c",
    # FIX-04 (FuncRetToRef / Verifier)
    "objectapimaximumclass.c", "processormaskcopy.c", "schedulerdefaultmappriority.c",
    "sched.c", "coretodcheck.c", "futex.c", "mutex.c", "semaphore.c", "condition.c",
    "heapresizeblock.c", "coremsg.c",
    # FIX-05 (DebugInfoParser DWARF layout)
    "apimutexisowner.c", "isr.c", "coretodset.c", "corerwlockobtainread.c",
    "corerwlockobtainwrite.c", "corerwlockrelease.c", "threadstartmultitasking.c"
}

# File esclusi a priori (es. handler eccezioni)
EXCLUDED_MANUAL = {
    "aspishandlers.c"
}

# Flag ufficiali estratti dalla build RTEMS 7 STM32F4
BASE_CFLAGS = [
    "-MMD",
    "-isystem", "/opt/rtems-llvm/rtems/lib/clang/21/include",
    "--target=arm-rtems7",
    "--sysroot=/opt/rtems-llvm/rtems/arm-rtems7",
    "--gcc-toolchain=/opt/rtems-llvm/rtems",
    "-Qunused-arguments",
    "-isystem", "/opt/rtems-llvm/rtems/arm-rtems7/include",
    "-std=gnu23",
    "-D_BSD_SOURCE",
    "-Wall", "-Wextra", "-Werror", "-Wno-error",
    "-Wmissing-prototypes", "-Wimplicit-function-declaration",
    "-Wstrict-prototypes", "-Wnested-externs",
    "-Wno-parentheses-equality", "-Wno-asm-operand-widths",
    "-Wno-gnu-variable-sized-type-not-at-end",
    "-Wno-sign-compare", "-Wno-default-const-init-var-unsafe",
    "-Wno-unused-function",
    "-mcpu=cortex-m4", "-mthumb", "-mfloat-abi=hard", "-mfpu=fpv4-sp-d16",
    "-ffunction-sections", "-fdata-sections",
    "-O2", "-g",
    "-DHAVE_CONFIG_H=1",
    "-Icpukit/include",
    "-I../../../cpukit/include",
    "-Icpukit/score/cpu/arm/include",
    "-I../../../cpukit/score/cpu/arm/include",
    "-Icpukit/contrib/include",
    "-I../../../cpukit/contrib/include",
    "-Icontrib/cpukit/include",
    "-I../../../contrib/cpukit/include",
    "-Icontrib/cpukit/fastlz",
    "-I../../../contrib/cpukit/fastlz",
    "-Icontrib/cpukit/utf8proc",
    "-I../../../contrib/cpukit/utf8proc",
    "-Icontrib/cpukit/uuid",
    "-I../../../contrib/cpukit/uuid",
    "-Icontrib/cpukit/zlib",
    "-I../../../contrib/cpukit/zlib",
    "-Icontrib/cpukit/xz-embedded/userspace",
    "-I../../../contrib/cpukit/xz-embedded/userspace"
]


def classify_error(step_name, stdout, stderr, timed_out=False):
    if timed_out:
        return "FIX-01: TDA Loop (Timeout > 30s)", "Subprocess timed out after 30 seconds"

    err = stderr.strip() if stderr else ""
    out = stdout.strip() if stdout else ""
    combined = f"{err}\n{out}"

    if "ConstantAsMetadata" in combined or "TBAAParser" in combined or "cast<To>(Val)" in combined:
        return "FIX-02: TBAAParser cast<ConstantAsMetadata>", err.splitlines()[-3:] if err else []
    if "range attribute" in combined or "Broken module" in combined or "FuncRetToRef" in combined:
        return "FIX-04: FuncRetToRef / Verifier (range attr)", err.splitlines()[-3:] if err else []
    if "Idx < NumElements" in combined or "DebugInfoParser" in combined or "getElementOffset" in combined:
        return "FIX-05: DebugInfoParser DWARF layout", err.splitlines()[-3:] if err else []
    if "Assertion" in combined:
        for line in combined.splitlines():
            if "Assertion" in line:
                return f"CRASH: {line.strip()}", err.splitlines()[-3:]

    # Fallback generico
    first_lines = [l for l in combined.splitlines() if l.strip()][:3]
    return f"ERROR in {step_name}", first_lines


def test_file(filename):
    rel_src = f"../../../cpukit/score/src/{filename}"
    tmp_dir = os.path.join(TMP_BASE, filename)
    os.makedirs(tmp_dir, exist_ok=True)

    a_ll = os.path.join(tmp_dir, "a.ll")
    b_ll = os.path.join(tmp_dir, "b.ll")
    c_ll = os.path.join(tmp_dir, "c.ll")
    d_ll = os.path.join(tmp_dir, "d.ll")
    out_o = os.path.join(tmp_dir, "test.o")

    # Step 1: Clang frontend -> IR
    cmd_clang_emit = [CLANG] + BASE_CFLAGS + ["-emit-llvm", "-S", rel_src, "-o", a_ll]
    try:
        p = subprocess.run(cmd_clang_emit, cwd=CWD, capture_output=True, text=True, timeout=TIMEOUT_SECONDS)
        if p.returncode != 0:
            category, details = classify_error("Clang frontend", p.stdout, p.stderr)
            return False, category, details
    except subprocess.TimeoutExpired:
        return False, "TIMEOUT: Clang frontend", ["Frontend timed out"]

    # Step 2: Pass func-ret-to-ref
    cmd_p1 = [OPT, "-load-pass-plugin", LIB_EDDI, "-debug-enabled=true", "-passes=func-ret-to-ref", a_ll, "-o", b_ll, "-S"]
    try:
        p = subprocess.run(cmd_p1, cwd=CWD, capture_output=True, text=True, timeout=TIMEOUT_SECONDS)
        if p.returncode != 0:
            category, details = classify_error("func-ret-to-ref", p.stdout, p.stderr)
            return False, category, details
    except subprocess.TimeoutExpired:
        return False, "FIX-01: TDA Loop (Timeout > 30s in func-ret-to-ref)", ["Timed out"]

    # Step 3: Pass eddi-verify (cuore della trasformazione e TDA)
    cmd_p2 = [OPT, "-load-pass-plugin", LIB_EDDI, "-debug-enabled=true", "-passes=eddi-verify", b_ll, "-o", c_ll, "-S"]
    try:
        p = subprocess.run(cmd_p2, cwd=CWD, capture_output=True, text=True, timeout=TIMEOUT_SECONDS)
        if p.returncode != 0:
            category, details = classify_error("eddi-verify", p.stdout, p.stderr)
            return False, category, details
    except subprocess.TimeoutExpired:
        return False, "FIX-01: TDA Loop (Timeout > 30s in eddi-verify)", ["Timed out in eddi-verify"]

    # Step 4: Pass duplicate-globals
    cmd_p3 = [OPT, "-load-pass-plugin", LIB_EDDI, "-debug-enabled=true", "-passes=duplicate-globals", c_ll, "-o", d_ll, "-S"]
    try:
        p = subprocess.run(cmd_p3, cwd=CWD, capture_output=True, text=True, timeout=TIMEOUT_SECONDS)
        if p.returncode != 0:
            category, details = classify_error("duplicate-globals", p.stdout, p.stderr)
            return False, category, details
    except subprocess.TimeoutExpired:
        return False, "TIMEOUT in duplicate-globals", ["Timed out"]

    # Step 5: Clang backend assembler
    cmd_clang_asm = [CLANG] + BASE_CFLAGS + ["-c", d_ll, "-o", out_o]
    try:
        p = subprocess.run(cmd_clang_asm, cwd=CWD, capture_output=True, text=True, timeout=TIMEOUT_SECONDS)
        if p.returncode != 0:
            category, details = classify_error("Clang assembler", p.stdout, p.stderr)
            return False, category, details
    except subprocess.TimeoutExpired:
        return False, "TIMEOUT in Clang assembler", ["Timed out"]

    return True, "OK", []


def main():
    print("=" * 80)
    print("RTEMS 7 SuperCore - Automatic EDDI Screening Tool")
    print(f"Directory Sorgenti: {SRC_DIR}")
    print(f"Directory Build:    {CWD}")
    print(f"Timeout per modulo: {TIMEOUT_SECONDS} secondi")
    print("=" * 80)

    if not os.path.exists(CLANG) or not os.path.exists(OPT) or not os.path.exists(LIB_EDDI):
        print(f"[ERRORE] Toolchain o pass non trovati:")
        print(f"  CLANG:    {CLANG} ({os.path.exists(CLANG)})")
        print(f"  OPT:      {OPT} ({os.path.exists(OPT)})")
        print(f"  LIB_EDDI: {LIB_EDDI} ({os.path.exists(LIB_EDDI)})")
        sys.exit(1)

    all_files = sorted([os.path.basename(f) for f in glob.glob(os.path.join(SRC_DIR, "*.c"))])
    total_all = len(all_files)

    candidates = [
        f for f in all_files
        if f not in WORKING_EDDI and f not in KNOWN_SUSPENDED and f not in EXCLUDED_MANUAL
    ]

    print(f"Totale file SuperCore:         {total_all}")
    print(f"Già consolidati (WORKING):     {len(WORKING_EDDI)}")
    print(f"Già catalogati (SUSPENDED):    {len(KNOWN_SUSPENDED)}")
    print(f"Esclusi a priori:              {len(EXCLUDED_MANUAL)}")
    print(f"File rimanenti da screenare:   {len(candidates)}")
    print("-" * 80)

    results_ok = []
    results_fail = {}

    start_time = time.time()

    for idx, fname in enumerate(candidates, 1):
        print(f"[{idx:3d}/{len(candidates)}] Test: {fname:<35} ... ", end="", flush=True)
        t0 = time.time()
        ok, cat, details = test_file(fname)
        dt = time.time() - t0

        if ok:
            print(f"\033[92mOK\033[0m ({dt:.2f}s)")
            results_ok.append(fname)
        else:
            print(f"\033[91mFAIL\033[0m ({dt:.2f}s) -> {cat}")
            if cat not in results_fail:
                results_fail[cat] = []
            results_fail[cat].append({"file": fname, "details": details})

    total_time = time.time() - start_time

    print("=" * 80)
    print("RIASSUNTO SCREENING EDDI")
    print(f"Tempo totale: {total_time:.2f} secondi")
    print(f"Moduli candidati testati: {len(candidates)}")
    print(f"\033[92mPromossi (OK):\033[0m            {len(results_ok)}")
    print(f"\033[91mBocciati (FAIL):\033[0m          {sum(len(v) for v in results_fail.values())}")
    print("-" * 80)

    if results_ok:
        print("\nElenco Moduli PROMOSSI (OK):")
        for f in results_ok:
            print(f"  + {f}")

    if results_fail:
        print("\nElenco Moduli BOCCIATI per Categoria:")
        for cat, items in sorted(results_fail.items()):
            print(f"\n[{cat}] ({len(items)} file):")
            for item in items:
                print(f"  - {item['file']}")

    # Salvataggio report strutturato JSON
    report = {
        "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
        "total_tested": len(candidates),
        "passed_count": len(results_ok),
        "passed_files": results_ok,
        "failed_by_category": results_fail
    }

    report_path = "/tmp/eddi_screening/report.json"
    with open(report_path, "w") as fp:
        json.dump(report, fp, indent=2)
    print(f"\nReport dettagliato salvato in: {report_path}")
    print("=" * 80)


if __name__ == "__main__":
    main()
