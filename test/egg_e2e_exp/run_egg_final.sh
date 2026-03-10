#!/usr/bin/env bash
set -uo pipefail

NEURA_OPT=/mnt/public/qjj/dataflow/build/tools/mlir-neura-opt/mlir-neura-opt
E2E=/mnt/public/qjj/dataflow/test/egg_e2e_exp
PPA=/mnt/public/qjj/dataflow/test/egg/ppa_spec.yaml

declare -A ARCH_MAP
ARCH_MAP[3x3]="$E2E/architecture_all_tiles_mem.yaml"
ARCH_MAP[4x4]="$E2E/architecture_all_tiles_mem_4x4.yaml"
ARCH_MAP[5x5]="$E2E/architecture_all_tiles_mem_5x5.yaml"
ARCH_MAP[4x8]="$E2E/architecture_all_tiles_mem_4x8.yaml"

CPP="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c++17"
C11="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"

compile_to_mlir() {
  local src="$1" flags="$2" out_mlir="$3" func_re="${4:-.*kernel.*}"
  local base="${out_mlir%.mlir}"
  clang-12 -S -emit-llvm $flags -o "${base}_full.ll" "$src" 2>/dev/null
  llvm-extract -S --rfunc="$func_re" "${base}_full.ll" -o "${base}.ll" 2>/dev/null
  mlir-translate --import-llvm "${base}.ll" -o "$out_mlir" 2>/dev/null
}

run_egg() {
  local in_mlir="$1" out_mlir="$2" arch="$3" max_ops="$4" max_area="$5" tout="${6:-120}"
  pushd /tmp > /dev/null
  timeout "$tout" $NEURA_OPT \
    --architecture-spec="$arch" --area-spec="$PPA" \
    --assign-accelerator --lower-llvm-to-neura --promote-input-arg-to-const \
    --fold-constant --canonicalize-return --canonicalize-live-in \
    --leverage-predicated-value --transform-ctrl-to-data-flow --fold-constant \
    "--egg-process-neura=max-pattern-area=${max_area} max-pattern-ops=${max_ops}" \
    --insert-data-mov "--map-to-accelerator=mapping-strategy=heuristic" \
    "$in_mlir" -o "$out_mlir" >/dev/null 2>&1
  local ret=$?
  popd > /dev/null
  return $ret
}

extract_ii() {
  local mlir="$1"
  if [ ! -s "$mlir" ]; then echo "MAP_ERR"; return; fi
  local ii rec res
  ii=$(grep -o "compiled_ii = [0-9]*" "$mlir" | head -1 | grep -o "[0-9]*$")
  rec=$(grep -o "rec_mii = [0-9]*" "$mlir" | head -1 | grep -o "[0-9]*$")
  res=$(grep -o "res_mii = [0-9]*" "$mlir" | head -1 | grep -o "[0-9]*$")
  echo "ii=${ii} rec=${rec} res=${res}"
}

LOG="$E2E/egg_final_results.log"
exec > >(tee "$LOG") 2>&1

echo "=== Egg FINAL mapping (no-regression params) ==="
echo "date: $(date)"
echo ""
echo "Per-kernel best params (3x3 tuned, per-size fallback for regressions):"
echo "  axpy:   ops=20 area=50000"
echo "  fir:    ops=20 area=50000; 4x4/4x8 uf=2: ops=1 (avoid regression)"
echo "  hist:   ops=20 area=50000"
echo "  gemv:   ops=20 area=10000"
echo "  latnrm: 3x3: ops=3 area=10000; >=4x4 uf=1: ops=20 area=50000; uf=2: ops=3 area=10000; uf=4: ops=1"
echo "  spmv:   uf=1: ops=1; uf=2/4: ops=20 area=50000"
echo "  gemm:   ops=2 area=50000"
echo ""

for size in 3x3 4x4 5x5 4x8; do
  arch="${ARCH_MAP[$size]}"
  echo "========== $size =========="

  for uf in 1 2 4; do
    base="/tmp/egg_final_axpy_${size}_uf${uf}"
    compile_to_mlir "$E2E/axpy/axpy_large_uf${uf}.cpp" "$CPP" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 20 50000 \
      || { printf "axpy  %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "axpy  %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  for uf in 1 2 4; do
    base="/tmp/egg_final_fir_${size}_uf${uf}"
    compile_to_mlir "$E2E/fir/kernel_pragma_uf${uf}.cpp" "$CPP" "${base}_llvm.mlir"
    local_ops=20
    if [[ "$uf" == "2" && ("$size" == "4x4" || "$size" == "4x8") ]]; then
      local_ops=1
    fi
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" "$local_ops" 50000 \
      || { printf "fir   %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "fir   %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  for uf in 1 2 4; do
    base="/tmp/egg_final_hist_${size}_uf${uf}"
    compile_to_mlir "$E2E/histogram/kernel_pragma_uf${uf}.cpp" "$CPP" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 20 50000 \
      || { printf "hist  %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "hist  %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  for uf in 1 2 4; do
    base="/tmp/egg_final_gemv_${size}_uf${uf}"
    compile_to_mlir "$E2E/gemv/kernel_pragma_uf${uf}.cpp" "$CPP" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 20 10000 \
      || { printf "gemv  %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "gemv  %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  for uf in 1 2 4; do
    base="/tmp/egg_final_latnrm_${size}_uf${uf}"
    compile_to_mlir "$E2E/latnrm/latnrm_standalone_uf${uf}.c" "$C11" "${base}_llvm.mlir"
    local_ops=3; local_area=10000
    if [[ "$uf" == "4" ]]; then
      local_ops=1; local_area=50000
    elif [[ "$uf" == "1" && "$size" != "3x3" ]]; then
      local_ops=20; local_area=50000
    fi
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" "$local_ops" "$local_area" \
      || { printf "latnrm %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "latnrm %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  base="/tmp/egg_final_spmv_${size}_uf1"
  compile_to_mlir "$E2E/spmv/spmv_standalone_uf1.c" "$C11" "${base}_llvm.mlir"
  run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 1 50000 \
    || { printf "spmv  %s uf=1   MAP_ERR\n" "$size"; }
  if [ -s "${base}_mapped.mlir" ]; then
    printf "spmv  %s uf=%-2s  %s\n" "$size" "1" "$(extract_ii "${base}_mapped.mlir")"
  fi
  for uf in 2 4; do
    base="/tmp/egg_final_spmv_${size}_uf${uf}"
    compile_to_mlir "$E2E/spmv/spmv_standalone_uf${uf}.c" "$C11" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 20 50000 \
      || { printf "spmv  %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "spmv  %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  for uf in 1 2 4; do
    base="/tmp/egg_final_gemm_${size}_uf${uf}"
    compile_to_mlir "$E2E/gemm/kernel_pragma_uf${uf}.c" "$C11" "${base}_llvm.mlir"
    run_egg "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" 2 50000 \
      || { printf "gemm  %s uf=%-2s  MAP_ERR\n" "$size" "$uf"; continue; }
    printf "gemm  %s uf=%-2s  %s\n" "$size" "$uf" "$(extract_ii "${base}_mapped.mlir")"
  done

  echo ""
done

echo "=== done ==="
