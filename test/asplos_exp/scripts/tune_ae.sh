#!/bin/bash
set -e

KDIR=$1
TARGET_AE=${2:-1.2}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$(cd "$BASE_DIR/../.." && pwd)"
NEURA_OPT="$PROJECT_DIR/build/tools/mlir-neura-opt/mlir-neura-opt"
ARCH_SPEC="$BASE_DIR/architecture.yaml"

if [ ! -f "$KDIR/kernel_before0.mlir" ]; then
  exit 1
fi

BEST_AE="0"
BEST_II="9999"
BEST_MS=""
BEST_MI=""

for ms in 2 3 4 5 6 8 10 15 20 30; do
  for mi in 2 3 4 5 6 8; do
    TDIR="$KDIR/_tune_${ms}_${mi}"
    mkdir -p "$TDIR"

    $NEURA_OPT --verify-each=true \
      --iter-merge-pattern="min-support=$ms max-iter=$mi" \
      "$KDIR/kernel_before0.mlir" -o "$TDIR/fused.mlir" 2>/dev/null || { rm -rf "$TDIR"; continue; }

    $NEURA_OPT --hardware-merge="output=$TDIR/hw.json" --verify-each=true \
      "$TDIR/fused.mlir" -o "$TDIR/hwmerge.mlir" 2>/dev/null || { rm -rf "$TDIR"; continue; }

    python3 "$SCRIPT_DIR/generate_latency_map.py" "$TDIR/fused.mlir" -o "$TDIR/lat.yaml"

    $NEURA_OPT --init-exec-latency --latency-spec="$TDIR/lat.yaml" \
      "$TDIR/hwmerge.mlir" -o "$TDIR/latency.mlir" 2>/dev/null || { rm -rf "$TDIR"; continue; }

    $NEURA_OPT --insert-data-mov "$TDIR/latency.mlir" -o "$TDIR/datamov.mlir" 2>/dev/null || { rm -rf "$TDIR"; continue; }

    $NEURA_OPT --architecture-spec=$ARCH_SPEC \
      --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=$TDIR/hw.json tile-sharing-mode=inclusive" \
      "$TDIR/datamov.mlir" -o "$TDIR/mapped.mlir" 2>"$TDIR/map.log" || true

    II=$(grep -oP 'compiled_ii\s*=\s*\K[0-9]+' "$TDIR/mapped.mlir" 2>/dev/null | head -1)
    if [ -z "$II" ]; then
      rm -rf "$TDIR"
      continue
    fi

    AE=$(python3 -c "
import json, sys, os
sys.path.insert(0, '$SCRIPT_DIR')
from calc_full_results import *
load_area_spec('$BASE_DIR/e2e/area_spec.yaml')
init_baseline_fu_counts()
bt = compute_baseline_tile_area()
bc = bt * 16
extra, _ = compute_fusion_extra_area('$TDIR/hw.json')
total_extra = extra * 16
fc = bc + total_extra
bl_ii = $(grep -oP 'compiled_ii\s*=\s*\K[0-9]+' "$KDIR/nofusion/kernel_mapped.mlir" 2>/dev/null | head -1 || echo 0)
ii = $II
if bl_ii > 0 and ii > 0:
    spd = bl_ii / ii
    ar = fc / bc
    ae = spd / ar
    print(f'{ae:.4f}')
else:
    print('0')
")

    IS_BETTER=$(python3 -c "
best='$BEST_AE'; cur='$AE'; best_ii='$BEST_II'; cur_ii='$II'
b=float(best); c=float(cur); bi=int(best_ii); ci=int(cur_ii)
if c > b or (c == b and ci < bi): print('yes')
else: print('no')
")

    if [ "$IS_BETTER" = "yes" ]; then
      BEST_AE="$AE"
      BEST_II="$II"
      BEST_MS="$ms"
      BEST_MI="$mi"
    fi

    rm -rf "$TDIR"
  done
done

if [ -n "$BEST_MS" ]; then
  echo "$KDIR ms=$BEST_MS mi=$BEST_MI ii=$BEST_II ae=$BEST_AE"

  CUR_AE=$(python3 -c "
import json, sys, os
sys.path.insert(0, '$SCRIPT_DIR')
from calc_full_results import *
load_area_spec('$BASE_DIR/e2e/area_spec.yaml')
init_baseline_fu_counts()
bt = compute_baseline_tile_area()
bc = bt * 16
hw='$KDIR/inclusive/hardware_config.json'
extra, _ = compute_fusion_extra_area(hw) if os.path.isfile(hw) else (0, {})
total_extra = extra * 16
fc = bc + total_extra
bl_ii = $(grep -oP 'compiled_ii\s*=\s*\K[0-9]+' "$KDIR/nofusion/kernel_mapped.mlir" 2>/dev/null | head -1 || echo 0)
inc_file = '$KDIR/inclusive/kernel_mapped.mlir'
import re
ii = 0
if os.path.isfile(inc_file):
    with open(inc_file) as f:
        m = re.search(r'compiled_ii\s*=\s*(\d+)', f.read())
        if m: ii = int(m.group(1))
if bl_ii > 0 and ii > 0:
    spd = bl_ii / ii
    ar = fc / bc
    ae = spd / ar
    print(f'{ae:.4f}')
else:
    print('0')
")

  DOMINATED=$(python3 -c "print('yes' if float('$BEST_AE') > float('$CUR_AE') else 'no')")
  if [ "$DOMINATED" = "yes" ]; then
    $NEURA_OPT --verify-each=true \
      --iter-merge-pattern="min-support=$BEST_MS max-iter=$BEST_MI" \
      "$KDIR/kernel_before0.mlir" -o "$KDIR/inclusive/kernel_fused.mlir" 2>/dev/null

    $NEURA_OPT --hardware-merge="output=$KDIR/inclusive/hardware_config.json" --verify-each=true \
      "$KDIR/inclusive/kernel_fused.mlir" -o "$KDIR/inclusive/kernel_hwmerge.mlir" 2>/dev/null

    python3 "$SCRIPT_DIR/generate_latency_map.py" "$KDIR/inclusive/kernel_fused.mlir" -o "$KDIR/inclusive/latency_map.yaml"

    $NEURA_OPT --init-exec-latency --latency-spec="$KDIR/inclusive/latency_map.yaml" \
      "$KDIR/inclusive/kernel_hwmerge.mlir" -o "$KDIR/inclusive/kernel_latency.mlir" 2>/dev/null

    $NEURA_OPT --insert-data-mov "$KDIR/inclusive/kernel_latency.mlir" -o "$KDIR/inclusive/kernel_datamov.mlir" 2>/dev/null

    $NEURA_OPT --architecture-spec=$ARCH_SPEC \
      --map-to-accelerator="mapping-strategy=heuristic backtrack-config=customized hardware-config=$KDIR/inclusive/hardware_config.json tile-sharing-mode=inclusive" \
      "$KDIR/inclusive/kernel_datamov.mlir" -o "$KDIR/inclusive/kernel_mapped.mlir" 2>"$KDIR/inclusive/map.log" || true

    echo "  UPDATED: old_ae=$CUR_AE new_ae=$BEST_AE"
  else
    echo "  KEPT: cur_ae=$CUR_AE >= best_tuned=$BEST_AE"
  fi
else
  echo "$KDIR: no valid parameter found"
fi
