#!/bin/bash
set -e

APP=$1
STRATEGY=$2
UF_SPEC=$3
MI=${4:-4}
MS=${5:-3}

if [ -z "$APP" ] || [ -z "$STRATEGY" ] || [ -z "$UF_SPEC" ]; then
  echo "Usage: run_sweep_single.sh APP STRATEGY UF_SPEC [MI] [MS]" >&2
  echo "  APP       = resnet | llama | harris | lstm" >&2
  echo "  STRATEGY  = baseline | opfusion | taskfusion" >&2
  echo "  UF_SPEC   = comma-separated per-kernel UFs, e.g. \"4,1,4,1\"" >&2
  echo "  MI        = max-iter (default 4, ignored for baseline)" >&2
  echo "  MS        = min-support (default 3, ignored for baseline)" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$(cd "$BASE_DIR/../../.." && pwd)"
OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$BASE_DIR/architecture.yaml"
APP_DIR="$BASE_DIR/$APP"
MULTI_FUNC="$APP_DIR/${APP}_multi_func.mlir"
SINGLE_FUNC="$APP_DIR/${APP}_single_func.mlir"

IFS=',' read -ra UFS <<< "$UF_SPEC"
UF_TAG=$(echo "$UF_SPEC" | tr ',' '_')

LOWERED_DIR="$APP_DIR/sweep/lowered/uf_${UF_TAG}"
PER_KERNEL_DIR="$LOWERED_DIR/per_kernel"

if [ "$STRATEGY" = "baseline" ]; then
  RESULT_DIR="$APP_DIR/sweep/baseline/uf_${UF_TAG}"
else
  RESULT_DIR="$APP_DIR/sweep/${STRATEGY}/uf_${UF_TAG}_mi${MI}_ms${MS}"
fi

if [ -f "$RESULT_DIR/kernel_mapped.mlir" ] || [ -f "$RESULT_DIR/inclusive/kernel_mapped.mlir" ]; then
  echo "SKIP (already exists): $RESULT_DIR"
  exit 0
fi

mkdir -p "$RESULT_DIR"

lower_per_kernel() {
  if [ -f "$LOWERED_DIR/neura_module.mlir" ]; then
    return
  fi

  mkdir -p "$PER_KERNEL_DIR"

  FUNC_NAMES=$(python3 "$SCRIPT_DIR/extract_func.py" "$MULTI_FUNC" "$PER_KERNEL_DIR/affine")

  IDX=0
  NEURA_FILES=()
  for FNAME in $FUNC_NAMES; do
    UF=${UFS[$IDX]:-1}
    NEURA_OUT="$PER_KERNEL_DIR/${FNAME}_neura.mlir"
    AFFINE_IN="$PER_KERNEL_DIR/affine/${FNAME}.mlir"

    if [ ! -f "$NEURA_OUT" ]; then
      bash "$SCRIPT_DIR/lower_affine_to_neura.sh" \
        "$AFFINE_IN" "$NEURA_OUT" false "$ARCH_SPEC" "$UF"
    fi

    NEURA_FILES+=("$NEURA_OUT")
    IDX=$((IDX + 1))
  done

  python3 "$SCRIPT_DIR/merge_neura_modules.py" "${NEURA_FILES[@]}" -o "$LOWERED_DIR/neura_module.mlir"
}

run_baseline() {
  lower_per_kernel

  $OPT --insert-data-mov \
    "$LOWERED_DIR/neura_module.mlir" -o "$RESULT_DIR/kernel_datamov.mlir" 2>/dev/null

  $OPT --architecture-spec="$ARCH_SPEC" \
    --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized" \
    "$RESULT_DIR/kernel_datamov.mlir" -o "$RESULT_DIR/kernel_mapped.mlir" \
    2>"$RESULT_DIR/map.log" || true
}

run_opfusion() {
  lower_per_kernel

  UNIFIED_DIR="$RESULT_DIR/unified"
  INCLUSIVE_DIR="$RESULT_DIR/inclusive"
  mkdir -p "$UNIFIED_DIR" "$INCLUSIVE_DIR"

  $OPT --verify-each=true \
    --iter-merge-pattern="min-support=$MS max-iter=$MI" \
    "$LOWERED_DIR/neura_module.mlir" -o "$UNIFIED_DIR/kernel_fused.mlir"

  $OPT --hardware-merge="output=$UNIFIED_DIR/hardware_config.json" --verify-each=true \
    "$UNIFIED_DIR/kernel_fused.mlir" -o "$UNIFIED_DIR/kernel_hwmerge.mlir"

  python3 "$SCRIPT_DIR/generate_latency_map.py" \
    "$UNIFIED_DIR/kernel_fused.mlir" -o "$UNIFIED_DIR/latency_map.yaml"

  $OPT --init-exec-latency --latency-spec="$UNIFIED_DIR/latency_map.yaml" \
    "$UNIFIED_DIR/kernel_hwmerge.mlir" -o "$UNIFIED_DIR/kernel_latency.mlir"

  $OPT --insert-data-mov \
    "$UNIFIED_DIR/kernel_latency.mlir" -o "$UNIFIED_DIR/kernel_datamov.mlir" 2>/dev/null

  $OPT --architecture-spec="$ARCH_SPEC" \
    --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=$UNIFIED_DIR/hardware_config.json tile-sharing-mode=inclusive" \
    "$UNIFIED_DIR/kernel_datamov.mlir" -o "$INCLUSIVE_DIR/kernel_mapped.mlir" \
    2>"$INCLUSIVE_DIR/map.log" || true
}

run_taskfusion() {
  UNIFIED_DIR="$RESULT_DIR/unified"
  INCLUSIVE_DIR="$RESULT_DIR/inclusive"
  mkdir -p "$UNIFIED_DIR" "$INCLUSIVE_DIR"

  FUSED_DIR="$RESULT_DIR/fused"
  mkdir -p "$FUSED_DIR"

  MAX_UF=1
  for U in "${UFS[@]}"; do
    if [ "$U" -gt "$MAX_UF" ]; then
      MAX_UF=$U
    fi
  done

  bash "$SCRIPT_DIR/lower_affine_to_neura.sh" \
    "$SINGLE_FUNC" "$FUSED_DIR/fused_neura.mlir" true "$ARCH_SPEC" "$MAX_UF"

  $OPT --verify-each=true \
    --iter-merge-pattern="min-support=$MS max-iter=$MI" \
    "$FUSED_DIR/fused_neura.mlir" -o "$UNIFIED_DIR/kernel_fused.mlir"

  $OPT --hardware-merge="output=$UNIFIED_DIR/hardware_config.json" --verify-each=true \
    "$UNIFIED_DIR/kernel_fused.mlir" -o "$UNIFIED_DIR/kernel_hwmerge.mlir"

  python3 "$SCRIPT_DIR/generate_latency_map.py" \
    "$UNIFIED_DIR/kernel_fused.mlir" -o "$UNIFIED_DIR/latency_map.yaml"

  $OPT --init-exec-latency --latency-spec="$UNIFIED_DIR/latency_map.yaml" \
    "$UNIFIED_DIR/kernel_hwmerge.mlir" -o "$UNIFIED_DIR/kernel_latency.mlir"

  $OPT --insert-data-mov \
    "$UNIFIED_DIR/kernel_latency.mlir" -o "$UNIFIED_DIR/kernel_datamov.mlir" 2>/dev/null

  $OPT --architecture-spec="$ARCH_SPEC" \
    --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=$UNIFIED_DIR/hardware_config.json tile-sharing-mode=inclusive" \
    "$UNIFIED_DIR/kernel_datamov.mlir" -o "$INCLUSIVE_DIR/kernel_mapped.mlir" \
    2>"$INCLUSIVE_DIR/map.log" || true
}

case "$STRATEGY" in
  baseline)   run_baseline ;;
  opfusion)   run_opfusion ;;
  taskfusion) run_taskfusion ;;
  *)
    echo "Unknown strategy: $STRATEGY" >&2
    exit 1
    ;;
esac

echo "DONE: $RESULT_DIR"
