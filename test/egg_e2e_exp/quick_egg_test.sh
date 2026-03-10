#!/usr/bin/env bash
set -uo pipefail

NEURA_OPT=/mnt/public/qjj/dataflow/build/tools/mlir-neura-opt/mlir-neura-opt
ARCH=/mnt/public/qjj/dataflow/test/egg_e2e_exp/architecture_all_tiles_mem.yaml
PPA=/mnt/public/qjj/dataflow/test/egg/ppa_spec.yaml

KERNEL="$1"
UF="$2"
MAX_OPS="${3:-20}"
MAX_AREA="${4:-50000}"
MIN_FREQ="${5:-}"
TIMEOUT="${6:-120}"

IN_MLIR="/tmp/opt_${KERNEL}_uf${UF}_llvm.mlir"

if [ ! -f "$IN_MLIR" ]; then
  echo "ERROR: $IN_MLIR not found. Run precompile first."
  exit 1
fi

EGG_OPTS="max-pattern-area=$MAX_AREA max-pattern-ops=$MAX_OPS"
if [ -n "$MIN_FREQ" ]; then
  EGG_OPTS="$EGG_OPTS min-pattern-frequency=$MIN_FREQ"
fi

OUT_MLIR="/tmp/opt_${KERNEL}_uf${UF}_ops${MAX_OPS}_area${MAX_AREA}.mlir"

timeout "$TIMEOUT" $NEURA_OPT \
  --architecture-spec="$ARCH" --area-spec="$PPA" \
  --assign-accelerator --lower-llvm-to-neura --promote-input-arg-to-const \
  --fold-constant --canonicalize-return --canonicalize-live-in \
  --leverage-predicated-value --transform-ctrl-to-data-flow --fold-constant \
  "--egg-process-neura=$EGG_OPTS" \
  --insert-data-mov "--map-to-accelerator=mapping-strategy=heuristic" \
  "$IN_MLIR" -o "$OUT_MLIR" >/dev/null 2>&1
ret=$?

if [ $ret -eq 124 ]; then
  echo "${KERNEL} uf=${UF} ops=${MAX_OPS} area=${MAX_AREA}: TIMEOUT"
elif [ $ret -ne 0 ] || [ ! -s "$OUT_MLIR" ]; then
  echo "${KERNEL} uf=${UF} ops=${MAX_OPS} area=${MAX_AREA}: MAP_ERR (exit=$ret)"
else
  ii=$(grep -o "compiled_ii = [0-9]*" "$OUT_MLIR" | head -1 | grep -o "[0-9]*")
  rec=$(grep -o "rec_mii = [0-9]*" "$OUT_MLIR" | head -1 | grep -o "[0-9]*")
  res=$(grep -o "res_mii = [0-9]*" "$OUT_MLIR" | head -1 | grep -o "[0-9]*")
  echo "${KERNEL} uf=${UF} ops=${MAX_OPS} area=${MAX_AREA}: ii=${ii} rec=${rec} res=${res}"
fi
