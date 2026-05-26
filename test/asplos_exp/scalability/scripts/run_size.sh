#!/bin/bash
set -e

SIZE=$1
MIN_SUPPORT=${2:-3}
MAX_ITER=${3:-4}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

ROWS=$(echo "$SIZE" | cut -dx -f1)
COLS=$(echo "$SIZE" | cut -dx -f2)

SIZE_DIR="$BASE_DIR/$SIZE"
APPS="resnet llama harris lstm"

for APP in $APPS; do
  APP_DIR="$SIZE_DIR/$APP"
  mkdir -p "$APP_DIR"
  SRC_DIR="$BASE_DIR/$APP"
  for f in "$SRC_DIR"/*.mlir; do
    fname=$(basename "$f")
    if [ ! -e "$APP_DIR/$fname" ]; then
      ln -sf "$(readlink -f "$f")" "$APP_DIR/$fname"
    fi
  done

  bash "$SCRIPT_DIR/run_baseline.sh" "$APP" "$SIZE" 1 2>&1 | tee "$APP_DIR/baseline_run.log"

  bash "$SCRIPT_DIR/run_opfusion.sh" "$APP" "$SIZE" "$MIN_SUPPORT" "$MAX_ITER" 1 2>&1 | tee "$APP_DIR/opfusion_run.log"

  bash "$SCRIPT_DIR/run_taskfusion.sh" "$APP" "$SIZE" "$MIN_SUPPORT" "$MAX_ITER" 1 2>&1 | tee "$APP_DIR/taskfusion_run.log"
done

python3 "$SCRIPT_DIR/calc_metrics.py" "$SIZE_DIR" --rows="$ROWS" --cols="$COLS"
