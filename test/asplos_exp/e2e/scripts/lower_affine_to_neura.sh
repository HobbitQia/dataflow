#!/bin/bash
set -e

INPUT=$1
OUTPUT=$2
FUSE_TASK=${3:-false}
ARCH_SPEC=$4
UNROLL_FACTOR=${5:-1}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$(cd "$BASE_DIR/../../.." && pwd)"
OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"

if [ -z "$ARCH_SPEC" ]; then
  ARCH_SPEC="$BASE_DIR/architecture.yaml"
fi

FUSE_FLAG=""
if [ "$FUSE_TASK" = "true" ]; then
  FUSE_FLAG="--fuse-task"
fi

UNROLL_FLAG=""
if [ "$UNROLL_FACTOR" -gt 1 ] 2>/dev/null; then
  UNROLL_FLAG="--affine-loop-unroll=\"unroll-factor=$UNROLL_FACTOR\""
fi

TMPFILE=$(mktemp /tmp/neura_lower_XXXXXX.mlir)
trap "rm -f $TMPFILE" EXIT

eval $OPT "$INPUT" \
  $UNROLL_FLAG \
  --affine-loop-tree-serialization \
  --convert-affine-to-taskflow \
  --construct-hyperblock-from-task \
  $FUSE_FLAG \
  --classify-counters \
  --convert-taskflow-to-neura \
  -o "$TMPFILE"

$OPT "$TMPFILE" \
  --lower-affine --convert-scf-to-cf --convert-cf-to-llvm \
  --assign-accelerator --lower-memref-to-neura --lower-arith-to-neura \
  --lower-builtin-to-neura --lower-llvm-to-neura \
  --promote-input-arg-to-const --fold-constant \
  --canonicalize-return --canonicalize-live-in \
  --leverage-predicated-value --transform-ctrl-to-data-flow --fold-constant \
  --architecture-spec="$ARCH_SPEC" \
  -o "$OUTPUT"
