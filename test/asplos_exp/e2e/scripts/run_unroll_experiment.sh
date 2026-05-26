#!/bin/bash
set -e

APP=$1
UF=$2

if [ -z "$APP" ] || [ -z "$UF" ]; then
  echo "Usage: bash run_unroll_experiment.sh APP UF"
  echo "  APP = resnet | llama | harris"
  echo "  UF  = 2, 4, 8, ..."
  exit 1
fi

MIN_SUPPORT=${3:-3}
MAX_ITER=${4:-4}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$(cd "$BASE_DIR/../../.." && pwd)"
OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$BASE_DIR/architecture.yaml"
APP_DIR="$BASE_DIR/$APP"

MULTI_FUNC="$APP_DIR/${APP}_multi_func.mlir"
SINGLE_FUNC="$APP_DIR/${APP}_single_func.mlir"

UF_DIR="$APP_DIR/uf${UF}"
mkdir -p "$UF_DIR"

BASELINE_DIR="$UF_DIR/baseline"
mkdir -p "$BASELINE_DIR"
bash "$SCRIPT_DIR/lower_affine_to_neura.sh" \
  "$MULTI_FUNC" "$BASELINE_DIR/neura_module.mlir" false "$ARCH_SPEC" "$UF"
$OPT --insert-data-mov "$BASELINE_DIR/neura_module.mlir" -o "$BASELINE_DIR/kernel_datamov.mlir" 2>/dev/null
$OPT --architecture-spec="$ARCH_SPEC" \
  --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized" \
  "$BASELINE_DIR/kernel_datamov.mlir" -o "$BASELINE_DIR/kernel_mapped.mlir" 2>"$BASELINE_DIR/map.log" || true

OPFUSION_DIR="$UF_DIR/opfusion"
UNIFIED_DIR="$OPFUSION_DIR/unified"
mkdir -p "$UNIFIED_DIR"
bash "$SCRIPT_DIR/lower_affine_to_neura.sh" \
  "$MULTI_FUNC" "$OPFUSION_DIR/neura_module.mlir" false "$ARCH_SPEC" "$UF"
$OPT --verify-each=true \
  --iter-merge-pattern="min-support=$MIN_SUPPORT max-iter=$MAX_ITER" \
  "$OPFUSION_DIR/neura_module.mlir" -o "$UNIFIED_DIR/kernel_fused.mlir"
$OPT --hardware-merge="output=$UNIFIED_DIR/hardware_config.json" --verify-each=true \
  "$UNIFIED_DIR/kernel_fused.mlir" -o "$UNIFIED_DIR/kernel_hwmerge.mlir"
python3 "$SCRIPT_DIR/generate_latency_map.py" \
  "$UNIFIED_DIR/kernel_fused.mlir" -o "$UNIFIED_DIR/latency_map.yaml"
$OPT --init-exec-latency --latency-spec="$UNIFIED_DIR/latency_map.yaml" \
  "$UNIFIED_DIR/kernel_hwmerge.mlir" -o "$UNIFIED_DIR/kernel_latency.mlir"
$OPT --insert-data-mov "$UNIFIED_DIR/kernel_latency.mlir" -o "$UNIFIED_DIR/kernel_datamov.mlir" 2>/dev/null
for MODE in exclusive inclusive; do
  MDIR="$OPFUSION_DIR/$MODE"
  mkdir -p "$MDIR"
  $OPT --architecture-spec="$ARCH_SPEC" \
    --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=$UNIFIED_DIR/hardware_config.json tile-sharing-mode=$MODE" \
    "$UNIFIED_DIR/kernel_datamov.mlir" -o "$MDIR/kernel_mapped.mlir" 2>"$MDIR/map.log" || true
done

TASKFUSION_DIR="$UF_DIR/taskfusion"
FUSED_DIR="$TASKFUSION_DIR/fused"
TUNIFIED_DIR="$TASKFUSION_DIR/unified"
mkdir -p "$FUSED_DIR" "$TUNIFIED_DIR"
bash "$SCRIPT_DIR/lower_affine_to_neura.sh" \
  "$SINGLE_FUNC" "$FUSED_DIR/fused_neura.mlir" true "$ARCH_SPEC" "$UF"
$OPT --verify-each=true \
  --iter-merge-pattern="min-support=$MIN_SUPPORT max-iter=$MAX_ITER" \
  "$FUSED_DIR/fused_neura.mlir" -o "$TUNIFIED_DIR/kernel_fused.mlir"
$OPT --hardware-merge="output=$TUNIFIED_DIR/hardware_config.json" --verify-each=true \
  "$TUNIFIED_DIR/kernel_fused.mlir" -o "$TUNIFIED_DIR/kernel_hwmerge.mlir"
python3 "$SCRIPT_DIR/generate_latency_map.py" \
  "$TUNIFIED_DIR/kernel_fused.mlir" -o "$TUNIFIED_DIR/latency_map.yaml"
$OPT --init-exec-latency --latency-spec="$TUNIFIED_DIR/latency_map.yaml" \
  "$TUNIFIED_DIR/kernel_hwmerge.mlir" -o "$TUNIFIED_DIR/kernel_latency.mlir"
$OPT --insert-data-mov "$TUNIFIED_DIR/kernel_latency.mlir" -o "$TUNIFIED_DIR/kernel_datamov.mlir" 2>/dev/null
for MODE in exclusive inclusive; do
  MDIR="$TASKFUSION_DIR/$MODE"
  mkdir -p "$MDIR"
  $OPT --architecture-spec="$ARCH_SPEC" \
    --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=$TUNIFIED_DIR/hardware_config.json tile-sharing-mode=$MODE" \
    "$TUNIFIED_DIR/kernel_datamov.mlir" -o "$MDIR/kernel_mapped.mlir" 2>"$MDIR/map.log" || true
done

extract_trip() {
  local FILE=$1
  if [ ! -f "$FILE" ]; then
    echo "  (no mapped file)"
    return
  fi
  python3 -c "
import re
lines = open('$FILE').readlines()
counters = []
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
        ii = int(km.group(1))
        print(f'  II={ii} TC={tc} Lat={ii*tc}')
        counters = []
"
}

printf '\n%s\n' "======== $APP UF=$UF Results ========"
printf '%-14s %s\n' 'Method' 'Per-kernel details'
printf '%s\n' '--------------------------------------------'

printf '%-14s' 'baseline'
extract_trip "$UF_DIR/baseline/kernel_mapped.mlir"

for MODE in exclusive inclusive; do
  printf '%-14s' "opfusion/$MODE"
  extract_trip "$UF_DIR/opfusion/$MODE/kernel_mapped.mlir"
done

for MODE in exclusive inclusive; do
  printf '%-14s' "taskfus/$MODE"
  extract_trip "$UF_DIR/taskfusion/$MODE/kernel_mapped.mlir"
done
