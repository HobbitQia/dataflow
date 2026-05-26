#!/bin/bash
set -e

APP=$1
UF=${2:-1}

if [ -z "$APP" ]; then
  echo "Usage: $0 APP [UF]" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
E2E_APP_DIR="$BASE_DIR/../e2e/$APP"
MULTI_FUNC="$E2E_APP_DIR/${APP}_multi_func.mlir"

FUNC_COUNT=$(rg -n '^\s*func\.func\s+@' "$MULTI_FUNC" | wc -l)
UF_SPEC="$UF"
for ((IDX = 1; IDX < FUNC_COUNT; IDX++)); do
  UF_SPEC="${UF_SPEC},${UF}"
done

bash "$SCRIPT_DIR/run_plaid_sweep_single.sh" "$APP" "$UF_SPEC"

