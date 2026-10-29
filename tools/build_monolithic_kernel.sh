#!/usr/bin/env bash
set -e

LLVM_BIN="/opt/rtems-llvm/rtems/bin"
PASSES="/opt/rtems-llvm/ASPIS/build/passes"
RAW_DIR="/tmp/aspis_monolithic/raw_ll"
OUT_DIR="/tmp/aspis_monolithic/output"

mkdir -p "$OUT_DIR"

echo "=== Fase 1: llvm-link di tutti i moduli IR del kernel ==="
$LLVM_BIN/llvm-link -S $RAW_DIR/*.ll -o $OUT_DIR/01_kernel_linked.ll

echo "=== Fase 2: lower-switch su modulo monolitico ==="
$LLVM_BIN/opt -passes=lower-switch $OUT_DIR/01_kernel_linked.ll -o $OUT_DIR/02_kernel_lower_switch.ll -S

echo "=== Fase 3: func-ret-to-ref su modulo monolitico ==="
$LLVM_BIN/opt -load-pass-plugin=$PASSES/libEDDI.so -debug-enabled=true -passes=func-ret-to-ref $OUT_DIR/02_kernel_lower_switch.ll -o $OUT_DIR/03_kernel_func_ret.ll -S

echo "=== Fase 4: eddi-verify su modulo monolitico ==="
$LLVM_BIN/opt -load-pass-plugin=$PASSES/libEDDI.so -debug-enabled=true -passes=eddi-verify $OUT_DIR/03_kernel_func_ret.ll -o $OUT_DIR/04_kernel_eddi.ll -S

echo "=== Fase 5: simplifycfg,lower-switch e rasm-verify su modulo monolitico ==="
$LLVM_BIN/opt -passes=simplifycfg,lower-switch $OUT_DIR/04_kernel_eddi.ll -o $OUT_DIR/05_kernel_simplifycfg.ll -S
$LLVM_BIN/opt -load-pass-plugin=$PASSES/libRASM.so -debug-enabled=true -passes=rasm-verify $OUT_DIR/05_kernel_simplifycfg.ll -o $OUT_DIR/06_kernel_rasm.ll -S

echo "=== Fase 6: duplicate-globals su modulo monolitico ==="
$LLVM_BIN/opt -load-pass-plugin=$PASSES/libEDDI.so -debug-enabled=true -passes=duplicate-globals $OUT_DIR/06_kernel_rasm.ll -o $OUT_DIR/07_kernel_globals.ll -S

echo "=== Fase 7: Compilazione a file oggetto ELF ==="
$LLVM_BIN/clang --target=arm-rtems7 --sysroot=/opt/rtems-llvm/rtems/arm-rtems7 -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -c $OUT_DIR/07_kernel_globals.ll -o $OUT_DIR/kernel_monolithic.o

echo "=== Fase 8: Analisi Statica delle Sezioni con arm-rtems7-size ==="
arm-rtems7-size -A -d $OUT_DIR/kernel_monolithic.o
