#!/bin/bash
# Run APEX, DSAGEN, and Plaid baselines for single-kernel benchmarks.
# Results are placed alongside the existing nofusion/exclusive/inclusive dirs.
#
# DSAGEN: baseline FUs + inclusive tile sharing (no custom hardware)
# APEX:   conservative fusion (min-support=2, max-iter=2) + inclusive sharing
# Plaid:  3-node motif extraction + exclusive sharing
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$(cd "$BASE_DIR/../.." && pwd)"

OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$BASE_DIR/architecture.yaml"
AREA_SPEC="$BASE_DIR/e2e/area_spec.yaml"
GEN_LATENCY="$SCRIPT_DIR/generate_latency_map.py"
PLAID_FUSE="$BASE_DIR/plaid_baseline/scripts/plaid_fuse_three_node.py"
PLAID_MERGE="$BASE_DIR/plaid_baseline/scripts/merge_plaid_manifests.py"

declare -A KERNEL_UF
KERNEL_UF[fir]=4
KERNEL_UF[latnrm]=1
KERNEL_UF[fft]=2
KERNEL_UF[dtw]=1
KERNEL_UF[spmv]=2
KERNEL_UF[conv]=4
KERNEL_UF[relu]=1
KERNEL_UF[histogram]=1
KERNEL_UF[mvt]=1
KERNEL_UF[gemm]=1

KERNELS="fir latnrm fft dtw spmv conv relu histogram mvt gemm"

run_dsagen() {
  local KERNEL=$1 UF=$2
  local KDIR="$BASE_DIR/$KERNEL/uf${UF}"
  local INPUT="$KDIR/kernel_before0.mlir"
  local OUTDIR="$KDIR/dsagen"

  if [ -s "$OUTDIR/kernel_mapped.mlir" ]; then
    echo "  [dsagen] SKIP (exists)"
    return 0
  fi
  mkdir -p "$OUTDIR"

  $OPT --insert-data-mov "$INPUT" -o "$OUTDIR/kernel_datamov.mlir" 2>/dev/null
  $OPT --architecture-spec="$ARCH_SPEC" \
    --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized tile-sharing-mode=inclusive" \
    "$OUTDIR/kernel_datamov.mlir" -o "$OUTDIR/kernel_mapped.mlir" \
    2>"$OUTDIR/map.log" || true

  [ -s "$OUTDIR/kernel_mapped.mlir" ] && echo "  [dsagen] OK" || echo "  [dsagen] FAIL (map)"
}

run_apex() {
  local KERNEL=$1 UF=$2
  local KDIR="$BASE_DIR/$KERNEL/uf${UF}"
  local INPUT="$KDIR/kernel_before0.mlir"
  local OUTDIR="$KDIR/apex"

  if [ -s "$OUTDIR/kernel_mapped.mlir" ]; then
    echo "  [apex] SKIP (exists)"
    return 0
  fi
  mkdir -p "$OUTDIR"

  # APEX-style conservative fusion: min-support=2, max-iter=2
  $OPT --verify-each=true \
    --iter-merge-pattern="min-support=2 max-iter=2" \
    "$INPUT" -o "$OUTDIR/kernel_fused.mlir" 2>/dev/null || {
    echo "  [apex] FAIL (fuse)"; return 0; }

  $OPT --hardware-merge="output=$OUTDIR/hardware_config.json" --verify-each=true \
    "$OUTDIR/kernel_fused.mlir" -o "$OUTDIR/kernel_hwmerge.mlir" 2>/dev/null || {
    echo "  [apex] FAIL (hwmerge)"; return 0; }

  python3 "$GEN_LATENCY" "$OUTDIR/kernel_fused.mlir" -o "$OUTDIR/latency_map.yaml" 2>/dev/null

  $OPT --init-exec-latency --latency-spec="$OUTDIR/latency_map.yaml" \
    "$OUTDIR/kernel_hwmerge.mlir" -o "$OUTDIR/kernel_latency.mlir" 2>/dev/null

  $OPT --insert-data-mov "$OUTDIR/kernel_latency.mlir" -o "$OUTDIR/kernel_datamov.mlir" 2>/dev/null

  $OPT --architecture-spec="$ARCH_SPEC" \
    --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=$OUTDIR/hardware_config.json tile-sharing-mode=inclusive" \
    "$OUTDIR/kernel_datamov.mlir" -o "$OUTDIR/kernel_mapped.mlir" \
    2>"$OUTDIR/map.log" || true

  [ -s "$OUTDIR/kernel_mapped.mlir" ] && echo "  [apex] OK" || echo "  [apex] FAIL (map)"
}

run_plaid() {
  local KERNEL=$1 UF=$2
  local KDIR="$BASE_DIR/$KERNEL/uf${UF}"
  local INPUT="$KDIR/kernel_before0.mlir"
  local OUTDIR="$KDIR/plaid"
  local WORKDIR="$OUTDIR/work"
  local NOFUSION="$KDIR/nofusion/kernel_mapped.mlir"

  if [ -s "$OUTDIR/kernel_mapped.mlir" ]; then
    echo "  [plaid] SKIP (exists)"
    return 0
  fi
  mkdir -p "$OUTDIR" "$WORKDIR"

  # Run Plaid 3-node fusion
  python3 "$PLAID_FUSE" "$INPUT" \
    -o "$WORKDIR/kernel_plaid.mlir" \
    --manifest "$WORKDIR/manifest.json" \
    --app "$KERNEL" \
    --uf-spec "$UF" 2>/dev/null || {
    # Plaid fusion failed: fall back to nofusion baseline
    if [ -s "$NOFUSION" ]; then
      cp "$NOFUSION" "$OUTDIR/kernel_mapped.mlir"
      echo '{"mode":"baseline_passthrough"}' > "$OUTDIR/fallback.json"
      echo "  [plaid] FALLBACK (fuse failed)"
    else
      echo "  [plaid] FAIL (no fallback)"
    fi
    return 0
  }

  python3 "$PLAID_MERGE" "$WORKDIR/manifest.json" \
    -o "$OUTDIR/plaid_manifest.json" \
    --latency-map "$OUTDIR/latency_map.yaml" 2>/dev/null || {
    if [ -s "$NOFUSION" ]; then
      cp "$NOFUSION" "$OUTDIR/kernel_mapped.mlir"
      echo '{"mode":"baseline_passthrough"}' > "$OUTDIR/fallback.json"
      echo "  [plaid] FALLBACK (merge failed)"
    fi
    return 0
  }

  $OPT --init-exec-latency --latency-spec="$OUTDIR/latency_map.yaml" \
    "$WORKDIR/kernel_plaid.mlir" -o "$OUTDIR/kernel_latency.mlir" 2>/dev/null || { echo "  [plaid] FAIL (latency)"; return 0; }

  $OPT --insert-data-mov "$OUTDIR/kernel_latency.mlir" -o "$OUTDIR/kernel_datamov.mlir" 2>/dev/null

  timeout 600 $OPT --architecture-spec="$ARCH_SPEC" \
    --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized tile-sharing-mode=inclusive" \
    "$OUTDIR/kernel_datamov.mlir" -o "$OUTDIR/kernel_mapped.mlir" \
    2>"$OUTDIR/map.log" || true

  if [ ! -s "$OUTDIR/kernel_mapped.mlir" ] && [ -s "$NOFUSION" ]; then
    cp "$NOFUSION" "$OUTDIR/kernel_mapped.mlir"
    echo '{"mode":"baseline_passthrough"}' > "$OUTDIR/fallback.json"
    echo "  [plaid] FALLBACK (map failed)"
  elif [ -s "$OUTDIR/kernel_mapped.mlir" ]; then
    echo "  [plaid] OK"
  else
    echo "  [plaid] FAIL"
  fi
}

echo "=== Running single-kernel baselines ==="
for K in $KERNELS; do
  UF=${KERNEL_UF[$K]}
  echo "--- $K (UF=$UF) ---"
  run_dsagen "$K" "$UF"
  run_apex   "$K" "$UF"
  run_plaid  "$K" "$UF"
done
echo "=== All done ==="
