#!/bin/bash
# Task 4.5.1: Run single kernel DFG fusion pipeline.
# Usage: run_single_kernel.sh <kernel_name> <variant_name> [min_support] [max_iter]
# Variant is used only for the output directory name.
set -e

KERNEL=$1
VARIANT=$2
MIN_SUPPORT=${3:-3}
MAX_ITER=${4:-4}

TASK_DIR="$(cd "$(dirname "$0")" && pwd)"
EXP_DIR="/mnt/public/qjj/dataflow/test/asplos_exp"
PROJECT_DIR="/mnt/public/qjj/dataflow"
OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$EXP_DIR/architecture.yaml"
KERNEL_DIR="$EXP_DIR/$KERNEL/uf1"

# Output directory
OUT_DIR="$TASK_DIR/$KERNEL/$VARIANT"
mkdir -p "$OUT_DIR"

# Use the pre-processed kernel (control-flow-to-dataflow already done)
INPUT="$KERNEL_DIR/kernel_before0.mlir"
if [ ! -f "$INPUT" ]; then
  echo "ERROR: $INPUT not found"
  exit 1
fi

# Step 1: Pattern fusion
$OPT --verify-each=true \
  --iter-merge-pattern="min-support=$MIN_SUPPORT max-iter=$MAX_ITER" \
  "$INPUT" -o "$OUT_DIR/kernel_fused.mlir" 2>"$OUT_DIR/fusion.log"

# Step 2: Hardware merge
$OPT --hardware-merge="output=$OUT_DIR/hardware_config.json" --verify-each=true \
  "$OUT_DIR/kernel_fused.mlir" -o "$OUT_DIR/kernel_hwmerge.mlir"

# Step 3: Latency map
python3 "$EXP_DIR/scripts/generate_latency_map.py" \
  "$OUT_DIR/kernel_fused.mlir" -o "$OUT_DIR/latency_map.yaml"

# Step 4: Init latency
$OPT --init-exec-latency --latency-spec="$OUT_DIR/latency_map.yaml" \
  "$OUT_DIR/kernel_hwmerge.mlir" -o "$OUT_DIR/kernel_latency.mlir"

# Step 5: Insert data movement
$OPT --insert-data-mov "$OUT_DIR/kernel_latency.mlir" -o "$OUT_DIR/kernel_datamov.mlir" 2>/dev/null

# Step 6: Map with inclusive mode
$OPT --architecture-spec="$ARCH_SPEC" \
  --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=$OUT_DIR/hardware_config.json tile-sharing-mode=inclusive" \
  "$OUT_DIR/kernel_datamov.mlir" -o "$OUT_DIR/kernel_mapped.mlir" 2>"$OUT_DIR/map.log" || true

# Report
if [ -f "$OUT_DIR/kernel_mapped.mlir" ]; then
  II=$(grep -oP 'compiled_ii = \K\d+' "$OUT_DIR/kernel_mapped.mlir" | head -1)
  echo "$KERNEL/$VARIANT: II=$II"
else
  echo "$KERNEL/$VARIANT: MAPPING FAILED"
fi
