#!/bin/bash
set -e
APP=$1
SIZE=$2
MS=${3:-5}
MI=${4:-4}
UF=8

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$(cd "$BASE_DIR/../../.." && pwd)"
OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$BASE_DIR/arch/architecture_${SIZE}.yaml"

TAG="sweep_uf${UF}_ms${MS}_bench32"
APP_DIR="$BASE_DIR/${SIZE}/${APP}/${TAG}"

if [ -f "$APP_DIR/done" ]; then
    echo "[SKIP] $APP $SIZE UF=$UF MS=$MS bench32"
    exit 0
fi

mkdir -p "$APP_DIR"
ln -sf "$(readlink -f "$BASE_DIR/$APP/${APP}_multi_func_32.mlir")" "$APP_DIR/${APP}_multi_func.mlir"
ln -sf "$(readlink -f "$BASE_DIR/$APP/${APP}_single_func_32.mlir")" "$APP_DIR/${APP}_single_func.mlir"

MULTI_FUNC="$APP_DIR/${APP}_multi_func.mlir"
SINGLE_FUNC="$APP_DIR/${APP}_single_func.mlir"

# Baseline
BASELINE_DIR="$APP_DIR/baseline"
mkdir -p "$BASELINE_DIR"
bash "$SCRIPT_DIR/lower_affine_to_neura.sh" "$MULTI_FUNC" "$BASELINE_DIR/neura_module.mlir" false "$ARCH_SPEC" "$UF"
$OPT --insert-data-mov "$BASELINE_DIR/neura_module.mlir" -o "$BASELINE_DIR/kernel_datamov.mlir" 2>/dev/null
$OPT --architecture-spec="$ARCH_SPEC" \
  --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized" \
  "$BASELINE_DIR/kernel_datamov.mlir" -o "$BASELINE_DIR/kernel_mapped.mlir" 2>"$BASELINE_DIR/map.log" || true

# TaskFusion
TASKFUSION_DIR="$APP_DIR/taskfusion"
FUSED_DIR="$TASKFUSION_DIR/fused"
TF_UNIFIED_DIR="$TASKFUSION_DIR/unified"
mkdir -p "$FUSED_DIR" "$TF_UNIFIED_DIR"
bash "$SCRIPT_DIR/lower_affine_to_neura.sh" "$SINGLE_FUNC" "$FUSED_DIR/fused_neura.mlir" true "$ARCH_SPEC" "$UF"
$OPT --verify-each=true --iter-merge-pattern="min-support=$MS max-iter=$MI" \
  "$FUSED_DIR/fused_neura.mlir" -o "$TF_UNIFIED_DIR/kernel_fused.mlir"
$OPT --hardware-merge="output=$TF_UNIFIED_DIR/hardware_config.json" --verify-each=true \
  "$TF_UNIFIED_DIR/kernel_fused.mlir" -o "$TF_UNIFIED_DIR/kernel_hwmerge.mlir"
python3 "$SCRIPT_DIR/generate_latency_map.py" \
  "$TF_UNIFIED_DIR/kernel_fused.mlir" -o "$TF_UNIFIED_DIR/latency_map.yaml"
$OPT --init-exec-latency --latency-spec="$TF_UNIFIED_DIR/latency_map.yaml" \
  "$TF_UNIFIED_DIR/kernel_hwmerge.mlir" -o "$TF_UNIFIED_DIR/kernel_latency.mlir"
$OPT --insert-data-mov "$TF_UNIFIED_DIR/kernel_latency.mlir" -o "$TF_UNIFIED_DIR/kernel_datamov.mlir" 2>/dev/null
for MODE in exclusive inclusive; do
  MDIR="$TASKFUSION_DIR/$MODE"
  mkdir -p "$MDIR"
  $OPT --architecture-spec="$ARCH_SPEC" \
    --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=$TF_UNIFIED_DIR/hardware_config.json tile-sharing-mode=$MODE" \
    "$TF_UNIFIED_DIR/kernel_datamov.mlir" -o "$MDIR/kernel_mapped.mlir" 2>"$MDIR/map.log" || true
done

touch "$APP_DIR/done"
echo "[DONE] $APP $SIZE UF=$UF MS=$MS bench32"
