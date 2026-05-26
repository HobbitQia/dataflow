#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

APPS="${1:-resnet llama harris}"
UFS="${2:-2 4 8}"

for APP in $APPS; do
  for UF in $UFS; do
    printf '\n>>> Running %s UF=%s ...\n' "$APP" "$UF"
    bash "$SCRIPT_DIR/run_unroll_experiment.sh" "$APP" "$UF" 2>&1 \
      | tee "$BASE_DIR/$APP/uf${UF}/run.log" || {
        printf '!!! %s UF=%s failed, skipping\n' "$APP" "$UF"
        continue
      }
  done
done

printf '\n\n%s\n' '================ Consolidated Comparison ================'
printf '%-8s %-4s %-14s %-10s %s\n' 'App' 'UF' 'Method' 'AppLat' 'Speedup'
printf '%s\n' '----------------------------------------------------------'

for APP in $APPS; do
  for UF in $UFS; do
    UF_DIR="$BASE_DIR/$APP/uf${UF}"
    if [ ! -d "$UF_DIR" ]; then
      continue
    fi

    compute_app_latency() {
      local FILE=$1
      if [ ! -f "$FILE" ]; then
        echo "FAILED"
        return
      fi
      python3 -c "
import re
lines = open('$FILE').readlines()
counters = []
total = 0
for line in lines:
    cm = re.search(r'lower_bound\s*=\s*(\d+).*?step\s*=\s*(\d+).*?upper_bound\s*=\s*(\d+)', line)
    if cm:
        lb, step, ub = int(cm.group(1)), int(cm.group(2)), int(cm.group(3))
        counters.append((ub - lb + step - 1) // step if step > 0 else (ub - lb))
    km = re.search(r'compiled_ii\s*=\s*(\d+)', line)
    if km:
        tc = 1
        for c in counters:
            tc *= c
        total += int(km.group(1)) * tc
        counters = []
print(total if total > 0 else 'FAILED')
"
    }

    BASELINE_LAT=$(compute_app_latency "$UF_DIR/baseline/kernel_mapped.mlir")
    printf '%-8s %-4s %-14s %-10s %s\n' "$APP" "$UF" 'baseline' "$BASELINE_LAT" '1.0000'

    for METHOD in opfusion taskfusion; do
      for MODE in exclusive inclusive; do
        LAT=$(compute_app_latency "$UF_DIR/$METHOD/$MODE/kernel_mapped.mlir")
        if [ "$LAT" != "FAILED" ] && [ "$BASELINE_LAT" != "FAILED" ] && [ "$BASELINE_LAT" -gt 0 ] 2>/dev/null; then
          SPEEDUP=$(python3 -c "print(f'{$BASELINE_LAT/$LAT:.4f}')")
        else
          SPEEDUP="-"
        fi
        LABEL="${METHOD:0:7}/$MODE"
        printf '%-8s %-4s %-14s %-10s %s\n' "$APP" "$UF" "$LABEL" "$LAT" "$SPEEDUP"
      done
    done
  done
done

python3 "$SCRIPT_DIR/calc_metrics.py" "$BASE_DIR" --uf=all
