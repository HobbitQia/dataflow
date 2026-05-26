#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

KERNELS="axpy bicg conv dtw fft fir gemm gemv histogram latnrm mvt relu spmv"
UFS="1 2 4"
MAX_PARALLEL=${MAX_PARALLEL:-6}

running=0
for kernel in $KERNELS; do
  for uf in $UFS; do
    KERNEL_DIR="$BASE_DIR/$kernel/uf$uf"
    if [ ! -f "$KERNEL_DIR/kernel.c" ]; then
      continue
    fi
    bash "$SCRIPT_DIR/run_kernel.sh" "$KERNEL_DIR" 3 4 > "$KERNEL_DIR/run.log" 2>&1 &
    running=$((running + 1))
    if [ $running -ge $MAX_PARALLEL ]; then
      wait -n 2>/dev/null || true
      running=$((running - 1))
    fi
  done
done

wait || true
bash "$SCRIPT_DIR/collect_results.sh"
