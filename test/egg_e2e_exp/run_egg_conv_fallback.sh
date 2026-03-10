#!/usr/bin/env bash
set -uo pipefail

NEURA_OPT=/mnt/public/qjj/dataflow/build/tools/mlir-neura-opt/mlir-neura-opt
E2E=/mnt/public/qjj/dataflow/test/egg_e2e_exp
PPA_SPEC=/mnt/public/qjj/dataflow/test/egg/ppa_spec.yaml
C_FLAGS="-O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -std=c11"

compile_to_mlir() {
  local src="$1" flags="$2" out_mlir="$3" func_re="${4:-.*kernel.*}"
  local base="${out_mlir%.mlir}"
  clang-12 -S -emit-llvm $flags -o "${base}_full.ll" "$src" 2>/dev/null
  llvm-extract -S --rfunc="$func_re" "${base}_full.ll" -o "${base}.ll" 2>/dev/null
  mlir-translate --import-llvm "${base}.ll" -o "$out_mlir"
}

run_egg_ops2() {
  local in_mlir="$1" out_mlir="$2" arch="$3"
  pushd /tmp > /dev/null
  timeout 120 $NEURA_OPT \
    --architecture-spec="$arch" \
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
    "--egg-process-neura=max-pattern-area=50000 max-pattern-ops=2" \
    --insert-data-mov \
    "--map-to-accelerator=mapping-strategy=heuristic" \
    "$in_mlir" -o "$out_mlir" >/dev/null 2>/dev/null
  local ret=$?
  popd > /dev/null
  return $ret
}

run_egg_ops1_long() {
  local in_mlir="$1" out_mlir="$2" arch="$3"
  pushd /tmp > /dev/null
  timeout 300 $NEURA_OPT \
    --architecture-spec="$arch" \
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
    "--egg-process-neura=max-pattern-area=50000 max-pattern-ops=1" \
    --insert-data-mov \
    "--map-to-accelerator=mapping-strategy=heuristic" \
    "$in_mlir" -o "$out_mlir" >/dev/null 2>/dev/null
  local ret=$?
  popd > /dev/null
  return $ret
}

extract_metrics() {
  local mlir="$1"
  python3 - "$mlir" <<'PYEOF'
import sys, re
path = sys.argv[1]
try:
    txt = open(path).read()
except:
    print("compiled_ii=ERR  rec_mii=ERR  res_mii=ERR  dfg_nodes=ERR")
    sys.exit(0)
def g(pat): m = re.search(pat, txt); return m.group(1) if m else "?"
cii = g(r'compiled_ii\s*=\s*(\d+)')
rec = g(r'rec_mii\s*=\s*(\d+)')
res = g(r'res_mii\s*=\s*(\d+)')
lines = txt.split('\n')
depth, in_fused, fused_depth, nodes = 0, False, 0, 0
for line in lines:
    opens  = line.count('{')
    closes = line.count('}')
    stripped = line.strip()
    if in_fused:
        fused_depth += opens - closes
        if fused_depth <= 0: in_fused = False
        depth += opens - closes
        if depth < 0: depth = 0
        continue
    if depth == 2 and stripped and not stripped.startswith('//'):
        if re.search(r'neura\.fused_op', stripped):
            nodes += 1; in_fused = True; fused_depth = opens - closes
        elif re.search(r'neura\.data_mov|neura\.yield|neura\.return', stripped):
            pass
        elif re.search(r'neura\.\w', stripped):
            nodes += 1
    depth += opens - closes
    if depth < 0: depth = 0
print(f"compiled_ii={cii}  rec_mii={rec}  res_mii={res}  dfg_nodes={nodes}")
PYEOF
}

declare -A ARCH_MAP
ARCH_MAP[3x3]="$E2E/architecture_all_tiles_mem.yaml"
ARCH_MAP[4x4]="$E2E/architecture_all_tiles_mem_4x4.yaml"
ARCH_MAP[5x5]="$E2E/architecture_all_tiles_mem_5x5.yaml"
ARCH_MAP[4x8]="$E2E/architecture_all_tiles_mem_4x8.yaml"

declare -A CONV_SRC
CONV_SRC[1]="$E2E/conv/conv_standalone_uf1.c"
CONV_SRC[2]="$E2E/conv/conv_standalone_uf2.c"
CONV_SRC[4]="$E2E/conv/conv_standalone_uf4.c"

echo "=== Conv egg fallback (max-pattern-ops=2) ==="
echo "date: $(date)"
echo ""

for size in 3x3 4x4 5x5 4x8; do
  arch="${ARCH_MAP[$size]}"
  echo "### CONV $size"
  for uf in 1 2 4; do
    base="/tmp/conv_fb_${size}_uf${uf}"
    compile_to_mlir "${CONV_SRC[$uf]}" "$C_FLAGS" "${base}_llvm.mlir" ".*kernel.*" \
      || { echo "conv $size uf=$uf: COMPILE_ERR"; continue; }
    if [[ "$size" == "4x8" && "$uf" == "4" ]]; then
      run_egg_ops1_long "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" \
        || { echo "conv $size uf=$uf: MAP_ERR"; continue; }
    else
      run_egg_ops2 "${base}_llvm.mlir" "${base}_mapped.mlir" "$arch" \
        || { echo "conv $size uf=$uf: MAP_ERR"; continue; }
    fi
    metrics=$(extract_metrics "${base}_mapped.mlir")
    printf "conv %s uf=%-2s  %s\n" "$size" "$uf" "$metrics"
  done
  echo ""
done

echo "=== done ==="
