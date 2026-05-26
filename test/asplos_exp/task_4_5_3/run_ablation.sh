#!/bin/bash
# Task 4.5.3: Run kernel fusion ablation with configurable unroll factor and fusion mode.
# Usage: run_ablation.sh <app> <fusion_mode> <unroll_factor> [min_support] [max_iter]
# fusion_mode: metric | always | pc-only
set -e

APP=$1
FMODE=$2
UF=${3:-1}
MIN_SUPPORT=${4:-3}
MAX_ITER=${5:-4}

TASK_DIR="$(cd "$(dirname "$0")" && pwd)"
E2E_DIR="/mnt/public/qjj/dataflow/test/asplos_exp/e2e"
PROJECT_DIR="/mnt/public/qjj/dataflow"
OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$E2E_DIR/architecture.yaml"

APP_DIR="$E2E_DIR/$APP"
SINGLE_FUNC="$APP_DIR/${APP}_single_func.mlir"

VARIANT="${FMODE}_uf${UF}"
OUT_DIR="$TASK_DIR/$APP/$VARIANT"
FUSED_DIR="$OUT_DIR/fused"
UNIFIED_DIR="$OUT_DIR/unified"
mkdir -p "$FUSED_DIR" "$UNIFIED_DIR"

echo "=== Running $APP / $VARIANT (FUSION_MODE=$FMODE, UF=$UF) ==="

# Step 1: Lower with task fusion + unrolling (fusion mode via env var)
export FUSION_MODE="$FMODE"
bash "$E2E_DIR/scripts/lower_affine_to_neura.sh" \
  "$SINGLE_FUNC" "$FUSED_DIR/fused_neura.mlir" true "$ARCH_SPEC" "$UF"

# Step 2: DFG pattern fusion
$OPT --verify-each=true \
  --iter-merge-pattern="min-support=$MIN_SUPPORT max-iter=$MAX_ITER" \
  "$FUSED_DIR/fused_neura.mlir" -o "$UNIFIED_DIR/kernel_fused.mlir"

# Step 3: Hardware merge
$OPT --hardware-merge="output=$UNIFIED_DIR/hardware_config.json" --verify-each=true \
  "$UNIFIED_DIR/kernel_fused.mlir" -o "$UNIFIED_DIR/kernel_hwmerge.mlir"

# Step 4: Latency map
python3 "$E2E_DIR/scripts/generate_latency_map.py" \
  "$UNIFIED_DIR/kernel_fused.mlir" -o "$UNIFIED_DIR/latency_map.yaml"

# Step 5: Init latency
$OPT --init-exec-latency --latency-spec="$UNIFIED_DIR/latency_map.yaml" \
  "$UNIFIED_DIR/kernel_hwmerge.mlir" -o "$UNIFIED_DIR/kernel_latency.mlir"

# Step 6: Insert data movement
$OPT --insert-data-mov "$UNIFIED_DIR/kernel_latency.mlir" -o "$UNIFIED_DIR/kernel_datamov.mlir" 2>/dev/null

# Step 7: Map with inclusive mode
MDIR="$OUT_DIR/inclusive"
mkdir -p "$MDIR"
$OPT --architecture-spec="$ARCH_SPEC" \
  --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=$UNIFIED_DIR/hardware_config.json tile-sharing-mode=inclusive" \
  "$UNIFIED_DIR/kernel_datamov.mlir" -o "$MDIR/kernel_mapped.mlir" 2>"$MDIR/map.log" || true

unset FUSION_MODE

echo "=== Done $APP / $VARIANT ==="
if [ -f "$MDIR/kernel_mapped.mlir" ] && grep -q 'compiled_ii' "$MDIR/kernel_mapped.mlir" 2>/dev/null; then
  n_mapped=$(grep -c 'compiled_ii' "$MDIR/kernel_mapped.mlir")
  echo "Mapped kernels: $n_mapped"
  grep -o 'compiled_ii = [0-9]*' "$MDIR/kernel_mapped.mlir" | tr '\n' ', '
  echo ""
  grep -o 'rec_mii = [0-9]*' "$MDIR/kernel_mapped.mlir" | tr '\n' ', '
  echo ""
  grep -o 'res_mii = [0-9]*' "$MDIR/kernel_mapped.mlir" | tr '\n' ', '
  echo ""
else
  log="$MDIR/map.log"
  success=$(grep -c 'Successfully mapped all' "$log" 2>/dev/null || echo 0)
  fail=$(grep -c 'Mapping failed' "$log" 2>/dev/null || echo 0)
  echo "MAPPING RESULT: $success ok, $fail failed"
fi
