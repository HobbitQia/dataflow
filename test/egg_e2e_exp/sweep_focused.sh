#!/usr/bin/env bash
set -uo pipefail

NEURA_OPT=/mnt/public/qjj/dataflow/build/tools/mlir-neura-opt/mlir-neura-opt
ARCH=/mnt/public/qjj/dataflow/test/egg_e2e_exp/architecture_all_tiles_mem.yaml
PPA=/mnt/public/qjj/dataflow/test/egg/ppa_spec.yaml

run_test() {
  local kernel="$1" uf="$2" max_ops="$3" max_area="$4" tout="${5:-120}"
  local in_mlir="/tmp/opt_${kernel}_uf${uf}_llvm.mlir"
  local out_mlir="/tmp/sweep_${kernel}_uf${uf}_ops${max_ops}_area${max_area}.mlir"

  if [ ! -f "$in_mlir" ]; then
    printf "%-6s uf=%-2s ops=%-3s area=%-6s NO_INPUT\n" "$kernel" "$uf" "$max_ops" "$max_area"
    return
  fi

  timeout "$tout" $NEURA_OPT \
    --architecture-spec="$ARCH" --area-spec="$PPA" \
    --assign-accelerator --lower-llvm-to-neura --promote-input-arg-to-const \
    --fold-constant --canonicalize-return --canonicalize-live-in \
    --leverage-predicated-value --transform-ctrl-to-data-flow --fold-constant \
    "--egg-process-neura=max-pattern-area=${max_area} max-pattern-ops=${max_ops}" \
    --insert-data-mov "--map-to-accelerator=mapping-strategy=heuristic" \
    "$in_mlir" -o "$out_mlir" >/dev/null 2>&1
  local ret=$?

  if [ $ret -eq 124 ]; then
    printf "%-6s uf=%-2s ops=%-3s area=%-6s TIMEOUT\n" "$kernel" "$uf" "$max_ops" "$max_area"
  elif [ $ret -ne 0 ] || [ ! -s "$out_mlir" ]; then
    printf "%-6s uf=%-2s ops=%-3s area=%-6s MAP_ERR\n" "$kernel" "$uf" "$max_ops" "$max_area"
  else
    local ii rec res
    ii=$(grep -o "compiled_ii = [0-9]*" "$out_mlir" | head -1 | grep -o "[0-9]*$")
    rec=$(grep -o "rec_mii = [0-9]*" "$out_mlir" | head -1 | grep -o "[0-9]*$")
    res=$(grep -o "res_mii = [0-9]*" "$out_mlir" | head -1 | grep -o "[0-9]*$")
    printf "%-6s uf=%-2s ops=%-3s area=%-6s ii=%-3s rec=%-3s res=%-3s\n" "$kernel" "$uf" "$max_ops" "$max_area" "$ii" "$rec" "$res"
  fi
}

echo "=== Parameter sweep for rec_mii optimization ==="
echo "date: $(date)"
echo ""

for k in axpy fir hist gemv latnrm spmv gemm; do
  echo "### $k"
  for uf in 1 2 4; do
    run_test "$k" "$uf" 20 50000
    run_test "$k" "$uf" 20 10000
    run_test "$k" "$uf" 10 50000
    run_test "$k" "$uf" 5  50000
    run_test "$k" "$uf" 3  50000
    run_test "$k" "$uf" 2  50000
  done
  echo ""
done

echo "=== done ==="
