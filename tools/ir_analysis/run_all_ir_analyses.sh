set -e

TARGET_DIR="${1:-/tmp/aspis_monolithic/output}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPORT_FILE="${TARGET_DIR}/IR_PIPELINE_REPORT.txt"

{
    python3 "${SCRIPT_DIR}/analyze_01_raw.py" "${TARGET_DIR}"
    python3 "${SCRIPT_DIR}/analyze_02_lower_switch.py" "${TARGET_DIR}"
    python3 "${SCRIPT_DIR}/analyze_03_func_ret.py" "${TARGET_DIR}"
    python3 "${SCRIPT_DIR}/analyze_04_eddi.py" "${TARGET_DIR}"
    python3 "${SCRIPT_DIR}/analyze_05_simplifycfg.py" "${TARGET_DIR}"
    python3 "${SCRIPT_DIR}/analyze_06_rasm.py" "${TARGET_DIR}"
    python3 "${SCRIPT_DIR}/analyze_07_duplicate_globals.py" "${TARGET_DIR}"
} | tee "${REPORT_FILE}"

echo "Report salvato in: ${REPORT_FILE}"
