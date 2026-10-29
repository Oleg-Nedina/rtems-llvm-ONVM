set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-/tmp/aspis_monolithic/output}"

if [ ! -d "$TARGET_DIR" ]; then
    echo "[ERRORE] Directory IR non trovata: $TARGET_DIR"
    exit 1
fi

find_stage() {
    local prefix="$1"
    local f
    f=$(find "$TARGET_DIR" -maxdepth 1 -name "${prefix}*.ll" | head -n 1)
    echo "$f"
}

S1=$(find_stage "01_")
S2=$(find_stage "02_")
S3=$(find_stage "03_")
S4=$(find_stage "04_")
S5=$(find_stage "05_")
S6=$(find_stage "06_")
S7=$(find_stage "07_")

REPORT_FILE="${TARGET_DIR}/IR_PIPELINE_REPORT.txt"
PERSIST_DIR="/opt/rtems-llvm/ir_monolithic_dump"

{
    if [ -n "$S1" ]; then python3 "$SCRIPT_DIR/analyze_01_raw.py" "$S1"; fi
    if [ -n "$S2" ]; then python3 "$SCRIPT_DIR/analyze_02_lower_switch.py" "$S2" "$S1"; fi
    if [ -n "$S3" ]; then python3 "$SCRIPT_DIR/analyze_03_func_ret.py" "$S3" "$S2"; fi
    if [ -n "$S4" ]; then python3 "$SCRIPT_DIR/analyze_04_eddi.py" "$S4" "$S3"; fi
    if [ -n "$S5" ]; then python3 "$SCRIPT_DIR/analyze_05_simplifycfg.py" "$S5" "$S4"; fi
    if [ -n "$S6" ]; then python3 "$SCRIPT_DIR/analyze_06_rasm.py" "$S6" "$S5"; fi
    if [ -n "$S7" ]; then python3 "$SCRIPT_DIR/analyze_07_duplicate_globals.py" "$S7" "$S6"; fi
} | tee "$REPORT_FILE"

if [ -d "$PERSIST_DIR" ]; then
    cp "$REPORT_FILE" "${PERSIST_DIR}/IR_PIPELINE_REPORT.txt"
fi

echo "Report salvato in: $REPORT_FILE"
