#!/bin/bash
set -e

APP=$1
SIZE=$2
UNROLL_FACTOR=${3:-1}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$(cd "$BASE_DIR/../../.." && pwd)"
OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$BASE_DIR/arch/architecture_${SIZE}.yaml"
APP_DIR="$BASE_DIR/$SIZE/$APP"

MULTI_FUNC="$APP_DIR/${APP}_multi_func.mlir"
BASELINE_DIR="$APP_DIR/baseline"
mkdir -p "$BASELINE_DIR"

bash "$SCRIPT_DIR/lower_affine_to_neura.sh" \
  "$MULTI_FUNC" "$BASELINE_DIR/neura_module.mlir" false "$ARCH_SPEC" "$UNROLL_FACTOR"

$OPT --insert-data-mov "$BASELINE_DIR/neura_module.mlir" -o "$BASELINE_DIR/kernel_datamov.mlir" 2>/dev/null

$OPT --architecture-spec="$ARCH_SPEC" \
  --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized" \
  "$BASELINE_DIR/kernel_datamov.mlir" -o "$BASELINE_DIR/kernel_mapped.mlir" 2>"$BASELINE_DIR/map.log" || true
