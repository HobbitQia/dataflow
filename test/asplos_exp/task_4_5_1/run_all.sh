#!/bin/bash
# Task 4.5.1: Run all kernels for a given variant.
# Usage: run_all.sh <variant_name> [min_support] [max_iter]
set -e

VARIANT=$1
MIN_SUPPORT=${2:-3}
MAX_ITER=${3:-4}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
KERNELS="axpy bicg conv dtw fft fir gemm gemv histogram latnrm mvt relu spmv"

echo "=== Running variant: $VARIANT (ms=$MIN_SUPPORT, mi=$MAX_ITER) ==="
for KERNEL in $KERNELS; do
  echo "--- $KERNEL ---"
  bash "$SCRIPT_DIR/run_single_kernel.sh" "$KERNEL" "$VARIANT" "$MIN_SUPPORT" "$MAX_ITER" 2>&1 | tail -1
done
echo "=== Done ==="
