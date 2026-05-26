#!/bin/bash
set -e

APP=$1
SIZE=$2
MIN_SUPPORT=${3:-3}
MAX_ITER=${4:-4}
UNROLL_FACTOR=${5:-1}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$(cd "$BASE_DIR/../../.." && pwd)"
OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$BASE_DIR/arch/architecture_${SIZE}.yaml"
APP_DIR="$BASE_DIR/$SIZE/$APP"

MULTI_FUNC="$APP_DIR/${APP}_multi_func.mlir"
OPFUSION_DIR="$APP_DIR/opfusion"
UNIFIED_DIR="$OPFUSION_DIR/unified"
mkdir -p "$UNIFIED_DIR"

bash "$SCRIPT_DIR/lower_affine_to_neura.sh" \
  "$MULTI_FUNC" "$OPFUSION_DIR/neura_module.mlir" false "$ARCH_SPEC" "$UNROLL_FACTOR"

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
