#!/bin/bash
set -e
BASE="$(cd "$(dirname "$0")/.." && pwd)"
cd "$BASE"
SCRIPTS="$BASE/scripts"

# ============================================================
# lstm and llama: 32-size benchmark, UF=16
# harris: original 16-size, UF=2 (already has good results)
# resnet: original 16-size, UF=8 (opfusion=taskfusion)
# ============================================================

run_bench32() {
    local APP=$1 SIZE=$2 UF=$3 MS=$4 MI=$5
    echo "[START] $APP $SIZE UF=$UF MS=$MS bench32 ($(date +%H:%M:%S))"
    bash "$SCRIPTS/run_uf16_32.sh" "$APP" "$SIZE" "$MS" "$MI" 2>"/tmp/scalability_final_${APP}_${SIZE}.log" && \
        echo "[DONE]  $APP $SIZE UF=$UF MS=$MS bench32 ($(date +%H:%M:%S))" || \
        echo "[FAIL]  $APP $SIZE UF=$UF MS=$MS bench32 ($(date +%H:%M:%S))"
}

run_original() {
    local APP=$1 SIZE=$2 UF=$3 MS=$4 MI=$5
    local TAG="sweep_uf${UF}_ms${MS}"
    local DIR="$BASE/${SIZE}/${APP}/${TAG}"
    if [ -f "$DIR/done" ]; then
        echo "[SKIP] $APP $SIZE UF=$UF MS=$MS (already done)"
        return
    fi
    echo "[START] $APP $SIZE UF=$UF MS=$MS ($(date +%H:%M:%S))"
    bash "$SCRIPTS/sweep_single.sh" "$APP" "$SIZE" "$UF" "$MS" "$MI" \
        2>"/tmp/scalability_final_${APP}_${SIZE}.log" && \
        echo "[DONE]  $APP $SIZE UF=$UF MS=$MS ($(date +%H:%M:%S))" || \
        echo "[FAIL]  $APP $SIZE UF=$UF MS=$MS ($(date +%H:%M:%S))"
}

# 5x5: lstm and llama with bench32 UF=16
run_bench32 lstm 5x5 16 3 4
run_bench32 llama 5x5 16 3 4

# 6x6: all benchmarks
run_original harris 6x6 2 2 4
run_original resnet 6x6 8 2 4
run_bench32 lstm 6x6 16 3 4
run_bench32 llama 6x6 16 3 4

echo "All final scalability experiments complete. $(date)"
