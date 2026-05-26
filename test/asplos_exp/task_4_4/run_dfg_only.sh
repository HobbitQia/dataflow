#!/bin/bash
# Task 4.4: Run "+DFG" config (DFG fusion with dedicated FU, no template sharing)
# This script runs the opfusion pipeline for one app.
# PREREQUISITE: binary must be rebuilt with no-merge threshold (0.5 -> -1.0)
set -e

APP=$1
MIN_SUPPORT=${2:-3}
MAX_ITER=${3:-4}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
E2E_DIR="/mnt/public/qjj/dataflow/test/asplos_exp/e2e"
PROJECT_DIR="/mnt/public/qjj/dataflow"
OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$E2E_DIR/architecture.yaml"

APP_DIR="$E2E_DIR/$APP"
MULTI_FUNC="$APP_DIR/${APP}_multi_func.mlir"

# Output goes to task_4_4/{app}/dfg_only/
OUT_DIR="$SCRIPT_DIR/$APP/dfg_only"
UNIFIED_DIR="$OUT_DIR/unified"
mkdir -p "$UNIFIED_DIR"

echo "=== Running +DFG (dedicated FU) for $APP ==="

# Step 1: Lower to Neura (no task fusion)
bash "$E2E_DIR/scripts/lower_affine_to_neura.sh" \
  "$MULTI_FUNC" "$OUT_DIR/neura_module.mlir" false "$ARCH_SPEC" 1

# Step 2: DFG-level pattern fusion
$OPT --verify-each=true \
  --iter-merge-pattern="min-support=$MIN_SUPPORT max-iter=$MAX_ITER" \
  "$OUT_DIR/neura_module.mlir" -o "$UNIFIED_DIR/kernel_fused.mlir"

# Step 3: Hardware merge (with no-merge threshold, each pattern gets own template)
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

echo "=== Done $APP ==="
if [ -f "$MDIR/kernel_mapped.mlir" ]; then
  echo "Mapped kernels: $(grep -c 'compiled_ii' "$MDIR/kernel_mapped.mlir")"
else
  echo "MAPPING FAILED"
fi
