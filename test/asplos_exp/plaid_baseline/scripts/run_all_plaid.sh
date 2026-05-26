#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
E2E_DIR="$BASE_DIR/../e2e"

APPS="${*:-resnet harris llama lstm}"

repeat_tag() {
  local uf=$1
  local count=$2
  local tag="$uf"
  local idx
  for ((idx = 1; idx < count; idx++)); do
    tag="${tag}_${uf}"
  done
  printf '%s\n' "$tag"
}

for APP in $APPS; do
  APP_DIR="$E2E_DIR/$APP"
  MULTI_FUNC="$APP_DIR/${APP}_multi_func.mlir"
  FUNC_COUNT=$(rg -n '^\s*func\.func\s+@' "$MULTI_FUNC" | wc -l)
  TMP_TAGS=$(mktemp /tmp/plaid_tags_XXXXXX.txt)

  repeat_tag 1 "$FUNC_COUNT" >"$TMP_TAGS"
  repeat_tag 2 "$FUNC_COUNT" >>"$TMP_TAGS"
  repeat_tag 4 "$FUNC_COUNT" >>"$TMP_TAGS"

  find "$APP_DIR/sweep/baseline" -maxdepth 1 -mindepth 1 -type d -printf '%f\n' \
    | sed 's/^uf_//' >>"$TMP_TAGS"

  while read -r TAG; do
    [ -z "$TAG" ] && continue
    UF_SPEC=${TAG//_/,}
    bash "$SCRIPT_DIR/run_plaid_sweep_single.sh" "$APP" "$UF_SPEC" \
      2>&1 | tee "$BASE_DIR/${APP}_uf_${TAG}.log" || {
        echo "WARNING: $APP uf_${TAG} failed, continuing..." >&2
      }
  done < <(sort -u "$TMP_TAGS")

  rm -f "$TMP_TAGS"
done

python3 "$SCRIPT_DIR/collect_plaid_results.py" "$BASE_DIR"

