#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$(cd "$BASE_DIR/../../.." && pwd)"
OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$BASE_DIR/architecture.yaml"
APP_DIR="$BASE_DIR/llama"

MULTI_FUNC="$APP_DIR/llama_multi_func.mlir"
SINGLE_FUNC="$APP_DIR/llama_single_func.mlir"

for UF in 2 4; do
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
    --iter-merge-pattern="min-support=3 max-iter=4" \
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
    --iter-merge-pattern="min-support=3 max-iter=4" \
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
done

extract_ii() {
  local FILE=$1
  if [ ! -f "$FILE" ]; then
    echo "-"
    return
  fi
  grep -oP 'compiled_ii\s*=\s*\K\d+' "$FILE" | head -1
}

extract_trip() {
  local FILE=$1
  if [ ! -f "$FILE" ]; then
    echo "-"
    return
  fi
  python3 -c "
import re, sys
lines = open('$FILE').readlines()
counters = []
for line in lines:
    cm = re.search(r'lower_bound\s*=\s*(\d+).*?upper_bound\s*=\s*(\d+)', line)
    if cm:
        counters.append(int(cm.group(2)) - int(cm.group(1)))
    km = re.search(r'compiled_ii\s*=\s*(\d+)', line)
    if km:
        tc = 1
        for c in counters:
            tc *= c
        ii = int(km.group(1))
        print(f'II={ii} TC={tc} Lat={ii*tc}')
        counters = []
"
}

printf '\n%s\n' '======== LLaMA Loop Unroll Results ========'
printf '%-6s %-14s %-8s %-10s\n' 'UF' 'Method' 'II' 'Details'
printf '%s\n' '--------------------------------------------'

for UF in 2 4; do
  UF_DIR="$APP_DIR/uf${UF}"
  printf '%-6s %-14s ' "$UF" 'baseline'
  extract_trip "$UF_DIR/baseline/kernel_mapped.mlir"
  printf '%-6s %-14s ' "$UF" 'opfusion/incl'
  extract_trip "$UF_DIR/opfusion/inclusive/kernel_mapped.mlir"
  printf '%-6s %-14s ' "$UF" 'taskfusion/incl'
  extract_trip "$UF_DIR/taskfusion/inclusive/kernel_mapped.mlir"
done
