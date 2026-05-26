#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

APPS="resnet llama harris"
MIN_SUPPORT=${1:-3}
MAX_ITER=${2:-4}

for APP in $APPS; do
  bash "$SCRIPT_DIR/run_baseline.sh" "$APP" 2>&1 | tee "$BASE_DIR/$APP/baseline/run.log"

  bash "$SCRIPT_DIR/run_opfusion.sh" "$APP" "$MIN_SUPPORT" "$MAX_ITER" 2>&1 | tee "$BASE_DIR/$APP/opfusion/run.log"

  bash "$SCRIPT_DIR/run_taskfusion.sh" "$APP" "$MIN_SUPPORT" "$MAX_ITER" 2>&1 | tee "$BASE_DIR/$APP/taskfusion/run.log"
done

python3 "$SCRIPT_DIR/calc_metrics.py" "$BASE_DIR"
