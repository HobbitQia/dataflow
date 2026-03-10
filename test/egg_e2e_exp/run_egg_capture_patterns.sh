#!/usr/bin/env bash
set -uo pipefail

NEURA_OPT=/mnt/public/qjj/dataflow/build/tools/mlir-neura-opt/mlir-neura-opt
ARCH=/mnt/public/qjj/dataflow/test/egg_e2e_exp/architecture_all_tiles_mem.yaml
PPA_SPEC=/mnt/public/qjj/dataflow/test/egg/ppa_spec.yaml
E2E=/mnt/public/qjj/dataflow/test/egg_e2e_exp
C_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"
TIMEOUT_SEC=600

compile_to_mlir() {
  local src="$1" out_mlir="$2" func_re="$3"
  local base="${out_mlir%.mlir}"
  clang-12 -S -emit-llvm $C_FLAGS -o "${base}.ll" "$src" 2>/dev/null
  llvm-extract -S --rfunc="$func_re" "${base}.ll" -o "${base}_extracted.ll" 2>/dev/null
  mlir-translate --import-llvm "${base}_extracted.ll" -o "$out_mlir" 2>/dev/null
}

run_egg_capture() {
  local in_mlir="$1" out_mlir="$2" log_file="$3" ops="$4" area="$5"
  pushd /tmp > /dev/null
  timeout "$TIMEOUT_SEC" $NEURA_OPT \
    --architecture-spec="$ARCH" \
    --area-spec="$PPA_SPEC" \
    --assign-accelerator \
    --lower-llvm-to-neura \
    --promote-input-arg-to-const \
    --fold-constant \
    --canonicalize-return \
    --canonicalize-live-in \
    --leverage-predicated-value \
    --transform-ctrl-to-data-flow \
    --fold-constant \
    "--egg-process-neura=max-pattern-area=${area} max-pattern-ops=${ops}" \
    --insert-data-mov \
    "--map-to-accelerator=mapping-strategy=heuristic" \
    "$in_mlir" -o "$out_mlir" 2>"$log_file" || true
  popd > /dev/null
}

check_result() {
  local out_mlir="$1" kernel="$2" uf="$3" ops="$4" area="$5"
  if [[ -s "$out_mlir" ]]; then
    local ii
    ii=$(grep -oP 'compiled_ii\s*=\s*\K\d+' "$out_mlir" | head -1)
    echo "${kernel} uf=${uf}: OK  compiled_ii=${ii:-?}  (ops=${ops} area=${area})"
  else
    echo "${kernel} uf=${uf}: MAP_ERR  (ops=${ops} area=${area})"
  fi
}

run_kernel() {
  local kernel="$1" uf="$2" src="$3" func_re="$4" ops="$5" area="$6"
  local tmp_base="/tmp/capture_${kernel}_uf${uf}"
  local out_dir="$E2E/${kernel}"
  local out_mlir="$out_dir/kernel-egg-uf${uf}.mlir"
  local log_file="$out_dir/egg_uf${uf}.log"

  if compile_to_mlir "$src" "${tmp_base}_llvm.mlir" "$func_re"; then
    run_egg_capture "${tmp_base}_llvm.mlir" "$out_mlir" "$log_file" "$ops" "$area"
    check_result "$out_mlir" "$kernel" "$uf" "$ops" "$area"
  else
    echo "${kernel} uf=${uf}: COMPILE_ERR"
  fi
}

echo "=== Pattern capture run (3x3 arch) ==="
echo "date: $(date)"
echo ""

echo "--- DTW (ops=20 area=50000) ---"
run_kernel dtw 1 "$E2E/dtw/dtw_standalone_uf1.c" ".*kernel.*" 20 50000
run_kernel dtw 2 "$E2E/dtw/dtw_standalone_uf2.c" ".*kernel.*" 20 50000
run_kernel dtw 4 "$E2E/dtw/dtw_standalone_uf4.c" ".*kernel.*" 20 50000
echo ""

echo "--- MVT (ops=20 area=50000) ---"
run_kernel mvt 1 "$E2E/mvt/mvt_standalone_uf1.c" ".*kernel.*" 20 50000
run_kernel mvt 2 "$E2E/mvt/mvt_standalone_uf2.c" ".*kernel.*" 20 50000
run_kernel mvt 4 "$E2E/mvt/mvt_standalone_uf4.c" ".*kernel.*" 20 50000
echo ""

echo "--- CONV (ops=2 area=50000) ---"
run_kernel conv 1 "$E2E/conv/conv_standalone_uf1.c" ".*kernel.*" 2 50000
run_kernel conv 2 "$E2E/conv/conv_standalone_uf2.c" ".*kernel.*" 2 50000
run_kernel conv 4 "$E2E/conv/conv_standalone_uf4.c" ".*kernel.*" 2 50000
echo ""

echo "--- LATNRM (uf=1/2: ops=3 area=10000; uf=4: ops=1 area=50000) ---"
run_kernel latnrm 1 "$E2E/latnrm/latnrm_standalone_uf1.c" ".*kernel.*" 3 10000
run_kernel latnrm 2 "$E2E/latnrm/latnrm_standalone_uf2.c" ".*kernel.*" 3 10000
run_kernel latnrm 4 "$E2E/latnrm/latnrm_standalone_uf4.c" ".*kernel.*" 1 50000
echo ""

echo "=== done ==="
