#!/bin/bash
set -e

KERNEL_DIR=$1
MIN_SUPPORT=${2:-3}
MAX_ITER=${3:-4}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$(cd "$BASE_DIR/../.." && pwd)"

NEURA_OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$BASE_DIR/architecture.yaml"
MLIR_TRANSLATE="$(dirname $(which mlir-translate 2>/dev/null || echo /mnt/public/sichuan_a/qjj/llvm-project/build/bin/mlir-translate))/mlir-translate"

cd "$KERNEL_DIR"

clang++ -S -emit-llvm -O3 -fno-unroll-loops -fno-vectorize kernel.c -o kernel.ll

$MLIR_TRANSLATE --import-llvm kernel.ll -o kernel.mlir

$NEURA_OPT --architecture-spec=$ARCH_SPEC --verify-each=true \
  --assign-accelerator --lower-llvm-to-neura --promote-input-arg-to-const \
  --canonicalize-return --canonicalize-cast --canonicalize-live-in \
  --leverage-predicated-value --fold-constant kernel.mlir -o kernel_before.mlir

$NEURA_OPT --architecture-spec=$ARCH_SPEC --verify-each=true \
  --transform-ctrl-to-data-flow --fold-constant kernel_before.mlir -o kernel_before0.mlir

mkdir -p nofusion exclusive inclusive

$NEURA_OPT --insert-data-mov kernel_before0.mlir -o nofusion/kernel_datamov.mlir
$NEURA_OPT --architecture-spec=$ARCH_SPEC \
  --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized" \
  nofusion/kernel_datamov.mlir -o nofusion/kernel_mapped.mlir 2>nofusion/map.log || true

$NEURA_OPT --verify-each=true \
  --iter-merge-pattern="min-support=$MIN_SUPPORT max-iter=$MAX_ITER" \
  kernel_before0.mlir -o exclusive/kernel_fused.mlir

$NEURA_OPT --hardware-merge="output=exclusive/hardware_config.json" --verify-each=true \
  exclusive/kernel_fused.mlir -o exclusive/kernel_hwmerge.mlir

python3 "$SCRIPT_DIR/generate_latency_map.py" exclusive/kernel_fused.mlir -o exclusive/latency_map.yaml

$NEURA_OPT --init-exec-latency --latency-spec=exclusive/latency_map.yaml \
  exclusive/kernel_hwmerge.mlir -o exclusive/kernel_latency.mlir

$NEURA_OPT --insert-data-mov exclusive/kernel_latency.mlir -o exclusive/kernel_datamov.mlir

$NEURA_OPT --architecture-spec=$ARCH_SPEC \
  --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=exclusive/hardware_config.json tile-sharing-mode=exclusive" \
  exclusive/kernel_datamov.mlir -o exclusive/kernel_mapped.mlir 2>exclusive/map.log || true

cp exclusive/kernel_fused.mlir inclusive/kernel_fused.mlir
cp exclusive/hardware_config.json inclusive/hardware_config.json
cp exclusive/latency_map.yaml inclusive/latency_map.yaml
cp exclusive/kernel_hwmerge.mlir inclusive/kernel_hwmerge.mlir
cp exclusive/kernel_latency.mlir inclusive/kernel_latency.mlir
cp exclusive/kernel_datamov.mlir inclusive/kernel_datamov.mlir

$NEURA_OPT --architecture-spec=$ARCH_SPEC \
  --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=inclusive/hardware_config.json tile-sharing-mode=inclusive" \
  inclusive/kernel_datamov.mlir -o inclusive/kernel_mapped.mlir 2>inclusive/map.log || true
