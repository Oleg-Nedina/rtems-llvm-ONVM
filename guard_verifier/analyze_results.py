import sys
import os
import re
import json

def parse_gdb_output(log_path):
    hit_pattern_new = re.compile(r"GUARD_(\d+)\s+\[(\w+)\]\s+\[(\w+)\]\s+([^\s]+)\s+check=(0x[0-9a-fA-F]+):\s+(\d+)\s+hits")
    hit_pattern_old = re.compile(r"GUARD_(\d+)\s+\[(\w+)\]\s+([^\s]+)\s+check=(0x[0-9a-fA-F]+):\s+(\d+)\s+hits")

    results_map = {}

    with open(log_path, "r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            m = hit_pattern_new.search(line)
            if m:
                gid = int(m.group(1))
                hits = int(m.group(6))
                if gid in results_map:
                    results_map[gid]["hits"] = max(results_map[gid]["hits"], hits)
                else:
                    results_map[gid] = {
                        "id": gid,
                        "type": m.group(2),
                        "subsystem": m.group(3),
                        "function": m.group(4),
                        "check_address": m.group(5),
                        "hits": hits
                    }
                continue

            m_old = hit_pattern_old.search(line)
            if m_old:
                gid = int(m_old.group(1))
                hits = int(m_old.group(5))
                if gid in results_map:
                    results_map[gid]["hits"] = max(results_map[gid]["hits"], hits)
                else:
                    results_map[gid] = {
                        "id": gid,
                        "type": m_old.group(2),
                        "subsystem": "UNKNOWN",
                        "function": m_old.group(3),
                        "check_address": m_old.group(4),
                        "hits": hits
                    }

    return sorted(results_map.values(), key=lambda x: x["id"])

def generate_markdown_report(results, output_path, catalog_total=None):
    total = len(results)
    if total == 0:
        return

    active = [r for r in results if r["hits"] > 0]
    dormant = [r for r in results if r["hits"] == 0]

    rasm_total = [r for r in results if r["type"] == "RASM"]
    rasm_active = [r for r in rasm_total if r["hits"] > 0]

    eddi_total = [r for r in results if r["type"] == "EDDI"]
    eddi_active = [r for r in eddi_total if r["hits"] > 0]

    subsystems = {}
    for r in results:
        sub = r.get("subsystem", "UNKNOWN")
        subsystems.setdefault(sub, []).append(r)

    with open(output_path, "w", encoding="utf-8") as f:
        f.write("# Report di Copertura Dinamica Controlli di Sicurezza (EDDI + RASM)\n\n")
        f.write(f"**Target:** STM32F407VG Discovery (ARM Cortex-M4 @ 168 MHz)\n")
        if catalog_total:
            f.write(f"**Guard Points Totali a Catalogo:** {catalog_total}\n")
            f.write(f"**Guard Points Testati:** {total} ({total/catalog_total*100:.1f}%)\n")
        else:
            f.write(f"**Guard Points Rilevati:** {total}\n")
        f.write(f"**Guard Points Attivi (Eseguiti):** {len(active)} ({len(active)/total*100:.1f}%)\n")
        f.write(f"**Guard Points Dormienti:** {len(dormant)} ({len(dormant)/total*100:.1f}%)\n\n")

        f.write("## 1. Sintesi per Tipo di Protezione\n\n")
        f.write("| Tipo di Protezione | Checkpoint Totali | Checkpoint Attivi | Copertura % |\n")
        f.write("|---|---|---|---|\n")
        f.write(f"| **RASM (Control-Flow Integrity)** | {len(rasm_total)} | {len(rasm_active)} | {len(rasm_active)/len(rasm_total)*100 if rasm_total else 0:.1f}% |\n")
        f.write(f"| **EDDI (Data-Flow Integrity)** | {len(eddi_total)} | {len(eddi_active)} | {len(eddi_active)/len(eddi_total)*100 if eddi_total else 0:.1f}% |\n")
        f.write(f"| **Totale Combinato** | **{total}** | **{len(active)}** | **{len(active)/total*100:.1f}%** |\n\n")

        f.write("## 2. Copertura per Sottosistema RTEMS\n\n")
        f.write("| Sottosistema RTEMS | Guard Totali | Guard Attivi | Copertura % |\n")
        f.write("|---|---|---|---|\n")
        for sub_name in sorted(subsystems.keys()):
            sub_list = subsystems[sub_name]
            sub_act = [r for r in sub_list if r["hits"] > 0]
            f.write(f"| `{sub_name}` | {len(sub_list)} | {len(sub_act)} | {len(sub_act)/len(sub_list)*100:.1f}% |\n")
        f.write("\n")

        f.write("## 3. Elenco Completo Guard Points Attivi\n\n")
        f.write("| ID | Tipo | Sottosistema | Funzione | Indirizzo Check | Esecuzioni Effettive |\n")
        f.write("|---|---|---|---|---|---|\n")
        sorted_active = sorted(active, key=lambda x: x["hits"], reverse=True)
        for r in sorted_active:
            f.write(f"| {r['id']} | `{r['type']}` | `{r.get('subsystem', 'N/A')}` | `{r['function']}` | `{r['check_address']}` | **{r['hits']}** |\n")
        f.write("\n")

        f.write("## 4. Elenco Completo Guard Points Dormienti\n\n")
        f.write("| ID | Tipo | Sottosistema | Funzione | Indirizzo Check | Stato |\n")
        f.write("|---|---|---|---|---|---|\n")
        for r in sorted(dormant, key=lambda x: x["id"]):
            f.write(f"| {r['id']} | `{r['type']}` | `{r.get('subsystem', 'N/A')}` | `{r['function']}` | `{r['check_address']}` | Inattivo (0 hit) |\n")
        f.write("\n")

        f.write("## 5. Dettaglio Guardie EDDI (Data-Flow Integrity)\n\n")
        f.write("| ID | Sottosistema | Funzione | Indirizzo Check | Esecuzioni | Condizione di Attivazione |\n")
        f.write("|---|---|---|---|---|---|\n")
        for r in sorted(eddi_total, key=lambda x: x["id"]):
            note = "Eseguito a runtime" if r["hits"] > 0 else "Richiede Multi-Tasking / Context Switch / Thread Join"
            f.write(f"| {r['id']} | `{r.get('subsystem', 'N/A')}` | `{r['function']}` | `{r['check_address']}` | **{r['hits']}** | {note} |\n")
        f.write("\n")

def generate_csv_export(results, output_path):
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("id,type,subsystem,function,check_address,hits,status\n")
        for r in results:
            status = "ACTIVE" if r["hits"] > 0 else "DORMANT"
            f.write(f"{r['id']},{r['type']},{r.get('subsystem','UNKNOWN')},{r['function']},{r['check_address']},{r['hits']},{status}\n")

def print_summary(results, catalog_total=None):
    total = len(results)
    if total == 0:
        print("No guard results found in log file.")
        return

    active = [r for r in results if r["hits"] > 0]
    dormant = [r for r in results if r["hits"] == 0]

    rasm_total = [r for r in results if r["type"] == "RASM"]
    rasm_active = [r for r in rasm_total if r["hits"] > 0]

    eddi_total = [r for r in results if r["type"] == "EDDI"]
    eddi_active = [r for r in eddi_total if r["hits"] > 0]

    print("==================================================")
    print("      GUARD VERIFICATION & COVERAGE REPORT        ")
    print("==================================================")
    if catalog_total:
        print(f"Catalog Total Guards:     {catalog_total}")
        print(f"Tested Guards:            {total} / {catalog_total} ({total/catalog_total*100:.1f}%)")
    else:
        print(f"Total Guards Checked:     {total}")
    print(f"Active Guards (Hit > 0):  {len(active)} ({len(active)/total*100:.1f}%)")
    print(f"Dormant Guards (Hit = 0): {len(dormant)} ({len(dormant)/total*100:.1f}%)")
    print("--------------------------------------------------")
    print(f"RASM CFI Guards:          {len(rasm_active)} / {len(rasm_total)} active ({len(rasm_active)/len(rasm_total)*100 if rasm_total else 0:.1f}%)")
    print(f"EDDI DFI Guards:          {len(eddi_active)} / {len(eddi_total)} active ({len(eddi_active)/len(eddi_total)*100 if eddi_total else 0:.1f}%)")
    print("==================================================")

    if active:
        print("\nTOP ACTIVE GUARDS:")
        sorted_active = sorted(active, key=lambda x: x["hits"], reverse=True)
        for r in sorted_active[:15]:
            print(f"  [{r['type']}] [{r.get('subsystem','N/A')}] {r['function']} @ {r['check_address']}: {r['hits']} executions")

def main():
    if len(sys.argv) < 2:
        print("Usage: python analyze_results.py <gdb_output.log>")
        sys.exit(1)

    log_file = sys.argv[1]
    if not os.path.exists(log_file):
        print(f"Error: file {log_file} not found")
        sys.exit(1)

    catalog_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "guards_catalog.json")
    if not os.path.exists(catalog_path):
        alt = os.path.join(os.path.dirname(log_file), "guards_catalog.json")
        if os.path.exists(alt):
            catalog_path = alt
        else:
            catalog_path = None

    catalog_total = None
    if catalog_path and os.path.exists(catalog_path):
        try:
            with open(catalog_path, "r", encoding="utf-8") as f:
                cat = json.load(f)
                catalog_total = len(cat)
        except Exception:
            pass

    results = parse_gdb_output(log_file)
    print_summary(results, catalog_total=catalog_total)

    base_path = os.path.splitext(log_file)[0]
    out_json = base_path + "_summary.json"
    with open(out_json, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2)

    out_md = os.path.join(os.path.dirname(log_file), "COVERAGE_REPORT.md")
    generate_markdown_report(results, out_md, catalog_total=catalog_total)

    out_csv = base_path + "_data.csv"
    generate_csv_export(results, out_csv)

    print(f"\nOutputs generated:")
    print(f"  JSON:     {out_json}")
    print(f"  Markdown: {out_md}")
    print(f"  CSV:      {out_csv}")

if __name__ == "__main__":
    main()
