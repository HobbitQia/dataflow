#!/bin/bash
set -e

APP=$1
UF_SPEC=$2

if [ -z "$APP" ] || [ -z "$UF_SPEC" ]; then
  echo "Usage: $0 APP UF_SPEC" >&2
  echo "  APP     = resnet | harris | llama | lstm" >&2
  echo "  UF_SPEC = comma-separated per-kernel UFs, e.g. \"4,1,4,1\"" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ASPLOS_DIR="$(cd "$BASE_DIR/.." && pwd)"
E2E_DIR="$ASPLOS_DIR/e2e"
E2E_SCRIPT_DIR="$E2E_DIR/scripts"
E2E_APP_DIR="$E2E_DIR/$APP"
PROJECT_DIR="$(cd "$ASPLOS_DIR/../.." && pwd)"

OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$E2E_DIR/architecture.yaml"
MULTI_FUNC="$E2E_APP_DIR/${APP}_multi_func.mlir"
PLAID_MAP_TIMEOUT=${PLAID_MAP_TIMEOUT:-45}

IFS=',' read -ra UFS <<< "$UF_SPEC"
UF_TAG=$(echo "$UF_SPEC" | tr ',' '_')

APP_ROOT="$BASE_DIR/$APP/sweep"
LOWERED_DIR="$APP_ROOT/lowered/uf_${UF_TAG}"
BASELINE_DIR="$APP_ROOT/baseline/uf_${UF_TAG}"
PLAID_ROOT="$APP_ROOT/plaid/uf_${UF_TAG}"
PLAID_DIR="$PLAID_ROOT/exclusive"
WORK_DIR="$PLAID_ROOT/work"

mkdir -p "$LOWERED_DIR" "$BASELINE_DIR" "$PLAID_DIR" "$WORK_DIR"

ensure_lowered_module() {
  if [ -f "$LOWERED_DIR/neura_module.mlir" ]; then
    return
  fi

  E2E_LOWERED="$E2E_APP_DIR/sweep/lowered/uf_${UF_TAG}/neura_module.mlir"
  if [ -f "$E2E_LOWERED" ]; then
    cp "$E2E_LOWERED" "$LOWERED_DIR/neura_module.mlir"
    return
  fi

  mkdir -p "$LOWERED_DIR/per_kernel/affine" "$LOWERED_DIR/per_kernel/lowered"
  FUNC_NAMES=$(python3 "$E2E_SCRIPT_DIR/extract_func.py" "$MULTI_FUNC" "$LOWERED_DIR/per_kernel/affine")
  IDX=0
  NEURA_FILES=()
  for FNAME in $FUNC_NAMES; do
    UF=${UFS[$IDX]:-1}
    AFFINE_IN="$LOWERED_DIR/per_kernel/affine/${FNAME}.mlir"
    NEURA_OUT="$LOWERED_DIR/per_kernel/lowered/${FNAME}_neura.mlir"
    bash "$E2E_SCRIPT_DIR/lower_affine_to_neura.sh" \
      "$AFFINE_IN" "$NEURA_OUT" false "$ARCH_SPEC" "$UF"
    NEURA_FILES+=("$NEURA_OUT")
    IDX=$((IDX + 1))
  done
  python3 "$E2E_SCRIPT_DIR/merge_neura_modules.py" "${NEURA_FILES[@]}" -o "$LOWERED_DIR/neura_module.mlir"
}

ensure_baseline() {
  if [ -s "$BASELINE_DIR/kernel_mapped.mlir" ]; then
    return
  fi

  E2E_BASELINE_DIR="$E2E_APP_DIR/sweep/baseline/uf_${UF_TAG}"
  if [ -f "$E2E_BASELINE_DIR/kernel_mapped.mlir" ]; then
    cp -a "$E2E_BASELINE_DIR/." "$BASELINE_DIR/"
    return
  fi

  $OPT --insert-data-mov "$LOWERED_DIR/neura_module.mlir" \
    -o "$BASELINE_DIR/kernel_datamov.mlir" >"$BASELINE_DIR/insert.stdout.log" 2>"$BASELINE_DIR/insert.log" || true
  timeout "$PLAID_MAP_TIMEOUT" $OPT --architecture-spec="$ARCH_SPEC" \
    --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized" \
    "$BASELINE_DIR/kernel_datamov.mlir" \
    -o "$BASELINE_DIR/kernel_mapped.mlir" \
    >"$BASELINE_DIR/map.stdout.log" 2>"$BASELINE_DIR/map.log" || true
}

run_plaid() {
  if [ -s "$PLAID_DIR/kernel_mapped.mlir" ] && [ -f "$PLAID_DIR/plaid_manifest.json" ]; then
    return
  fi

  rm -f "$PLAID_DIR/fallback.json"
  rm -rf "$WORK_DIR/orig" "$WORK_DIR/plaid" "$WORK_DIR/manifests"
  mkdir -p "$WORK_DIR/orig" "$WORK_DIR/plaid" "$WORK_DIR/manifests"

  python3 "$E2E_SCRIPT_DIR/extract_func.py" "$LOWERED_DIR/neura_module.mlir" "$WORK_DIR/orig" >/tmp/plaid_extract_"$APP"_"$UF_TAG".log

  PLAID_FILES=()
  MANIFEST_FILES=()
  for ORIG in "$WORK_DIR"/orig/*.mlir; do
    FBASE=$(basename "$ORIG" .mlir)
    PLAID_OUT="$WORK_DIR/plaid/${FBASE}_plaid.mlir"
    MANIFEST_OUT="$WORK_DIR/manifests/${FBASE}.json"
    python3 "$SCRIPT_DIR/plaid_fuse_three_node.py" \
      "$ORIG" \
      -o "$PLAID_OUT" \
      --manifest "$MANIFEST_OUT" \
      --app "$APP" \
      --uf-spec "$UF_SPEC"
    PLAID_FILES+=("$PLAID_OUT")
    MANIFEST_FILES+=("$MANIFEST_OUT")
  done

  python3 "$E2E_SCRIPT_DIR/merge_neura_modules.py" "${PLAID_FILES[@]}" -o "$PLAID_DIR/plaid_module.mlir"
  python3 "$SCRIPT_DIR/merge_plaid_manifests.py" "${MANIFEST_FILES[@]}" \
    -o "$PLAID_DIR/plaid_manifest.json" \
    --latency-map "$PLAID_DIR/latency_map.yaml"

  $OPT --init-exec-latency --latency-spec="$PLAID_DIR/latency_map.yaml" \
    "$PLAID_DIR/plaid_module.mlir" -o "$PLAID_DIR/kernel_latency.mlir" \
    >"$PLAID_DIR/init.stdout.log" 2>"$PLAID_DIR/init.log"
  $OPT --insert-data-mov "$PLAID_DIR/kernel_latency.mlir" \
    -o "$PLAID_DIR/kernel_datamov.mlir" >"$PLAID_DIR/insert.stdout.log" 2>"$PLAID_DIR/insert.log"
  timeout "$PLAID_MAP_TIMEOUT" $OPT --architecture-spec="$ARCH_SPEC" \
    --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized tile-sharing-mode=exclusive" \
    "$PLAID_DIR/kernel_datamov.mlir" \
    -o "$PLAID_DIR/kernel_mapped.mlir" \
    >"$PLAID_DIR/map.stdout.log" 2>"$PLAID_DIR/map.log" || true

  if [ ! -s "$PLAID_DIR/kernel_mapped.mlir" ] && [ -s "$BASELINE_DIR/kernel_mapped.mlir" ]; then
    cp "$BASELINE_DIR/kernel_mapped.mlir" "$PLAID_DIR/kernel_mapped.mlir"
    printf '{\n  "mode": "baseline_passthrough",\n  "reason": "mapper_failed_or_timed_out"\n}\n' \
      >"$PLAID_DIR/fallback.json"
  fi
}

echo "=== Plaid vector sweep: $APP UF_SPEC=$UF_SPEC ==="
ensure_lowered_module
ensure_baseline
run_plaid
echo "DONE: $APP uf_${UF_TAG}"
