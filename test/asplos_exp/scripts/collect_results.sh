#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

KERNELS="axpy bicg conv dtw fft fir gemm gemv histogram latnrm mvt relu spmv"
UFS="1 2 4"
MODES="nofusion exclusive inclusive"
RESULT_FILE="$BASE_DIR/results/summary.csv"

extract_ii() {
  local file=$1
  if [ ! -f "$file" ]; then
    echo "FAILED"
    return
  fi
  local ii=$(grep -oP 'compiled_ii\s*=\s*\K[0-9]+' "$file" 2>/dev/null | head -1)
  if [ -z "$ii" ]; then
    echo "FAILED"
  else
    echo "$ii"
  fi
}

extract_rec_mii() {
  local file=$1
  if [ ! -f "$file" ]; then
    echo "-"
    return
  fi
  local val=$(grep -oP 'Recurrence MII:\s*\K[0-9]+' "$file" 2>/dev/null | head -1)
  if [ -z "$val" ]; then
    echo "-"
  else
    echo "$val"
  fi
}

extract_res_mii() {
  local file=$1
  if [ ! -f "$file" ]; then
    echo "-"
    return
  fi
  local val=$(grep -oP 'Total operations:\s*\K[0-9]+' "$file" 2>/dev/null | head -1)
  if [ -z "$val" ]; then
    echo "-"
  else
    local res=$(( (val + 15) / 16 ))
    echo "$res"
  fi
}

echo "kernel,uf,nofusion_ii,exclusive_ii,inclusive_ii,nofusion_rec,nofusion_res" > "$RESULT_FILE"

for kernel in $KERNELS; do
  for uf in $UFS; do
    KERNEL_DIR="$BASE_DIR/$kernel/uf$uf"
    nf_ii=$(extract_ii "$KERNEL_DIR/nofusion/kernel_mapped.mlir")
    ex_ii=$(extract_ii "$KERNEL_DIR/exclusive/kernel_mapped.mlir")
    in_ii=$(extract_ii "$KERNEL_DIR/inclusive/kernel_mapped.mlir")
    nf_rec=$(extract_rec_mii "$KERNEL_DIR/nofusion/map.log")
    nf_res=$(extract_res_mii "$KERNEL_DIR/nofusion/map.log")
    echo "$kernel,$uf,$nf_ii,$ex_ii,$in_ii,$nf_rec,$nf_res" >> "$RESULT_FILE"
  done
done

printf "%-12s %3s %12s %12s %12s %10s %10s\n" "kernel" "uf" "nofusion_ii" "exclusive_ii" "inclusive_ii" "nf_rec" "nf_res"
printf "%s\n" "$(printf '%.0s-' {1..80})"
while IFS=, read -r kernel uf nf_ii ex_ii in_ii nf_rec nf_res; do
  [ "$kernel" = "kernel" ] && continue
  printf "%-12s %3s %12s %12s %12s %10s %10s\n" "$kernel" "$uf" "$nf_ii" "$ex_ii" "$in_ii" "$nf_rec" "$nf_res"
done < "$RESULT_FILE"
