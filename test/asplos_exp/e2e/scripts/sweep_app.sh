#!/bin/bash
set -e

APP=$1
STRATEGY=$2
MAX_PARALLEL=${3:-4}

if [ -z "$APP" ] || [ -z "$STRATEGY" ]; then
  echo "Usage: sweep_app.sh APP STRATEGY [MAX_PARALLEL]" >&2
  echo "  APP       = resnet | llama | harris | lstm" >&2
  echo "  STRATEGY  = baseline | opfusion | taskfusion" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIGS=()

generate_baseline_configs() {
  case "$APP" in
    resnet)
      CONFIGS=(
        "1,1,1,1"
        "2,1,2,1"
        "4,1,4,1"
        "2,2,2,2"
        "4,2,4,2"
      )
      ;;
    llama)
      CONFIGS=(
        "1,1,1,1,1,1,1,1"
        "2,1,1,2,2,2,1,2"
        "4,1,1,4,4,4,1,4"
        "2,2,2,2,2,2,2,2"
      )
      ;;
    harris)
      CONFIGS=(
        "1,1,1,1,1,1,1"
        "2,2,2,2,2,2,2"
        "2,2,1,1,1,2,1"
        "1,1,1,1,1,1,2"
      )
      ;;
    lstm)
      CONFIGS=(
        "1,1,1,1,1,1,1,1,1,1"
        "2,2,2,2,2,2,2,2,1,1"
        "2,2,2,2,1,1,1,1,1,1"
        "1,1,1,1,2,2,2,2,1,1"
      )
      ;;
  esac
}

generate_opfusion_configs() {
  local UF_COMBOS=()
  local MI_VALS=(1 2 3 4)
  local MS_VALS=(2 3 4)

  case "$APP" in
    resnet)
      UF_COMBOS=(
        "1,1,1,1"
        "2,1,2,1"
        "4,1,4,1"
        "2,2,2,2"
        "4,2,4,2"
      )
      ;;
    llama)
      UF_COMBOS=(
        "1,1,1,1,1,1,1,1"
        "2,1,1,2,2,2,1,2"
        "4,1,1,4,4,4,1,4"
        "2,2,2,2,2,2,2,2"
      )
      ;;
    harris)
      UF_COMBOS=(
        "1,1,1,1,1,1,1"
        "2,2,2,2,2,2,2"
        "2,2,1,1,1,2,1"
        "1,1,1,1,1,1,2"
      )
      ;;
    lstm)
      UF_COMBOS=(
        "1,1,1,1,1,1,1,1,1,1"
        "2,2,2,2,2,2,2,2,1,1"
        "2,2,2,2,1,1,1,1,1,1"
        "1,1,1,1,2,2,2,2,1,1"
      )
      ;;
  esac

  for UF in "${UF_COMBOS[@]}"; do
    for MI in "${MI_VALS[@]}"; do
      for MS in "${MS_VALS[@]}"; do
        CONFIGS+=("${UF}|${MI}|${MS}")
      done
    done
  done
}

generate_taskfusion_configs() {
  local UF_COMBOS=()
  local MI_VALS=(1 2 3 4)
  local MS_VALS=(2 3 4)

  case "$APP" in
    resnet)
      UF_COMBOS=(
        "1,1,1,1"
        "2,1,2,1"
        "4,1,4,1"
        "2,2,2,2"
      )
      ;;
    llama)
      UF_COMBOS=(
        "1,1,1,1,1,1,1,1"
        "2,1,1,2,2,2,1,2"
        "4,1,1,4,4,4,1,4"
        "2,2,2,2,2,2,2,2"
      )
      ;;
    harris)
      UF_COMBOS=(
        "1,1,1,1,1,1,1"
        "2,2,2,2,2,2,2"
        "2,2,1,1,1,2,1"
        "1,1,1,1,1,1,2"
      )
      ;;
    lstm)
      UF_COMBOS=(
        "1,1,1,1,1,1,1,1,1,1"
        "2,2,2,2,2,2,2,2,1,1"
        "2,2,2,2,1,1,1,1,1,1"
        "1,1,1,1,2,2,2,2,1,1"
      )
      ;;
  esac

  for UF in "${UF_COMBOS[@]}"; do
    for MI in "${MI_VALS[@]}"; do
      for MS in "${MS_VALS[@]}"; do
        CONFIGS+=("${UF}|${MI}|${MS}")
      done
    done
  done
}

case "$STRATEGY" in
  baseline)   generate_baseline_configs ;;
  opfusion)   generate_opfusion_configs ;;
  taskfusion) generate_taskfusion_configs ;;
  *)
    echo "Unknown strategy: $STRATEGY" >&2
    exit 1
    ;;
esac

TOTAL=${#CONFIGS[@]}
echo "=== Sweep: $APP / $STRATEGY === ($TOTAL configs, max $MAX_PARALLEL parallel)"

RUNNING=0
DONE=0
FAILED=0

for CFG in "${CONFIGS[@]}"; do
  if [ "$STRATEGY" = "baseline" ]; then
    UF_SPEC="$CFG"
    MI=4
    MS=3
  else
    IFS='|' read -r UF_SPEC MI MS <<< "$CFG"
  fi

  (
    bash "$SCRIPT_DIR/run_sweep_single.sh" "$APP" "$STRATEGY" "$UF_SPEC" "$MI" "$MS" 2>&1
  ) &

  RUNNING=$((RUNNING + 1))

  if [ "$RUNNING" -ge "$MAX_PARALLEL" ]; then
    wait -n 2>/dev/null || true
    RUNNING=$((RUNNING - 1))
  fi
done

wait

echo "=== Sweep complete: $APP / $STRATEGY ($TOTAL configs) ==="
