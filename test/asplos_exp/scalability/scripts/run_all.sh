#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

SIZES="3x3 4x4 5x5 4x8"
MIN_SUPPORT=${1:-3}
MAX_ITER=${2:-4}

for SIZE in $SIZES; do
  bash "$SCRIPT_DIR/run_size.sh" "$SIZE" "$MIN_SUPPORT" "$MAX_ITER"
done

python3 "$SCRIPT_DIR/aggregate_results.py" "$BASE_DIR"
