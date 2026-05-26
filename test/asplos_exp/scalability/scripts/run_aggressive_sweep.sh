#!/bin/bash
# Run aggressive UF sweep for 5x5 and 4x8 CGRA sizes.
# Usage: nohup bash scripts/run_aggressive_sweep.sh > sweep_aggressive.log 2>&1 &
set -e
BASE="$(cd "$(dirname "$0")/.." && pwd)"
cd "$BASE"

LOG="$BASE/sweep_aggressive.log"
MAX_PARALLEL=8

run_job() {
    local app=$1 size=$2 uf=$3 ms=$4 mi=$5
    local tag="sweep_uf${uf}_ms${ms}"
    local dir="$BASE/${size}/${app}/${tag}"

    if [ -f "$dir/done" ]; then
        echo "[SKIP] $app $size UF=$uf MS=$ms (already done)"
        return
    fi

    echo "[START] $app $size UF=$uf MS=$ms MI=$mi  ($(date '+%H:%M:%S'))"
    bash scripts/sweep_single.sh "$app" "$size" "$uf" "$ms" "$mi" \
        > "/tmp/scalability_${app}_${size}_uf${uf}_ms${ms}.log" 2>&1 \
        && echo "[DONE]  $app $size UF=$uf MS=$ms  ($(date '+%H:%M:%S'))" \
        || echo "[FAIL]  $app $size UF=$uf MS=$ms  ($(date '+%H:%M:%S'))"
}

PIDS=()

for app in lstm llama resnet harris; do
    for size in 5x5 4x8; do
        for uf in 8 16; do
            for ms in 2 3; do
                # Throttle
                while true; do
                    alive=0
                    for pid in "${PIDS[@]}"; do
                        kill -0 "$pid" 2>/dev/null && ((alive++)) || true
                    done
                    [ "$alive" -lt "$MAX_PARALLEL" ] && break
                    sleep 5
                done

                run_job "$app" "$size" "$uf" "$ms" 4 &
                PIDS+=($!)
            done
        done
    done
done

echo "All jobs launched, waiting..."
wait
echo "All experiments complete. $(date)"
