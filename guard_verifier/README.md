# Guard Verifier Toolchain (Enhanced Multi-Mode)

Strumento automatico per la verifica dinamica della copertura dei controlli di sicurezza (EDDI + RASM) su STM32F407VG Discovery e QEMU.

---

## 1. Architettura e Modalità di Esecuzione

I microcontrollori ARM Cortex-M4 dispongono di una Flash Patch and Breakpoint (FPB) unit con un limite hardware di **6 breakpoint simultanei in Flash**. Per superare questo vincolo senza errori di debug, lo strumento supporta tre modalità operative:

1. **Modalità Hardware Batch (`run_hardware_batches.py`):**
   * Suddivide i 130 controlli in 33 batch da 4 breakpoint ciascuno.
   * Esegue in sequenza ciascun batch contro la scheda fisica ST-Link (:4242), accumulando le statistiche nel file di log unificato.
2. **Modalità Sottosistema (`subsystems/`):**
   * Permette di verificare selettivamente i controlli per specifica area funzionale del kernel RTEMS (`trace_scheduler.gdb`, `trace_watchdog_timers.gdb`, `trace_thread_lifecycle.gdb`, ecc.).
3. **Modalità Simulatore Globale (`trace_guards_full.gdb`):**
   * Per ambienti QEMU o simulatori privi del limite dei 6 breakpoint hardware FPB.

---

## 2. Moduli della Toolchain

* [`extract_guards.py`](file:///home/olly/UNI/CTO_ES/rtems-llvm-ONVM/guard_verifier/extract_guards.py): Parser del disassembly. Classifica i guard points nei sottosistemi RTEMS, estrae gli indirizzi di check e genera:
  * `guards_catalog.json`: Catalogo strutturato di tutti i guard points con metadati.
  * `trace_guards_full.gdb`: Script con tutti i 130 guard points (per simulatore).
  * `batches/batch_*.gdb`: 33 script suddivisi a blocchi di 4 per hardware reale.
  * `subsystems/trace_*.gdb`: Script dedicati per singolo sottosistema.
* [`run_hardware_batches.py`](file:///home/olly/UNI/CTO_ES/rtems-llvm-ONVM/guard_verifier/run_hardware_batches.py): Orchestratore per esecuzione automatizzata dei batch hardware su ST-Link.
* [`analyze_results.py`](file:///home/olly/UNI/CTO_ES/rtems-llvm-ONVM/guard_verifier/analyze_results.py): Motore di analisi statistica. Calcola tassi di copertura, genera file CSV e redige il report formale in Markdown [`COVERAGE_REPORT.md`](file:///home/olly/UNI/CTO_ES/rtems-llvm-ONVM/guard_verifier/COVERAGE_REPORT.md).

---

## 3. Guida Operativa

### Passo 1: Rigenerazione dei Batch e dei Catalogo
```bash
cd /home/olly/UNI/CTO_ES/rtems-llvm-ONVM/guard_verifier
python3 extract_guards.py ../acas_disasm.txt
```

### Passo 2: Esecuzione su Hardware Reale (Tramite Orchestratore)
Con ST-Link e `st-util` attivo su porta 4242:
```bash
cd /home/olly/UNI/CTO_ES/rtems-llvm-ONVM/guard_verifier
python3 run_hardware_batches.py ../src/rtems/build/arm/stm32f4/testsuites/benchmarks/bench_acas.exe
```
*(Per eseguire un numero limitato di batch di test rapido, aggiungere il numero come secondo argomento: `python3 run_hardware_batches.py ../src/rtems/build/arm/stm32f4/testsuites/benchmarks/bench_acas.exe 5`)*

### Passo 3: Test Singolo Sottosistema (Esempio: Watchdog & Timers)
```bash
cd /home/olly/UNI/CTO_ES/rtems-llvm-ONVM
arm-rtems7-gdb -x guard_verifier/subsystems/trace_watchdog_timers.gdb src/rtems/build/arm/stm32f4/testsuites/benchmarks/bench_acas.exe
```

### Passo 4: Generazione Report Analitico
```bash
cd /home/olly/UNI/CTO_ES/rtems-llvm-ONVM/guard_verifier
python3 analyze_results.py gdb_hardware_results.log
```
