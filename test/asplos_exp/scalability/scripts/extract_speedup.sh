#!/bin/bash
set -e

SIZE=$1
APP=$2
TAG=$3

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
APP_DIR="$BASE_DIR/${SIZE}/${APP}/${TAG}"

ROWS=$(echo "$SIZE" | cut -dx -f1)
COLS=$(echo "$SIZE" | cut -dx -f2)
NUM_TILES=$((ROWS * COLS))

extract_latency() {
  local f=$1
  if [ ! -f "$f" ]; then
    echo "FAILED"
    return
  fi
  python3 -c "
import re, sys
with open('$f') as fh:
    text = fh.read()
counter_re = re.compile(r'taskflow\.counter.*?lower_bound\s*=\s*(\d+).*?step\s*=\s*(\d+).*?upper_bound\s*=\s*(\d+)')
kernel_re = re.compile(r'neura\.kernel.*?compiled_ii\s*=\s*(\d+)')
funcs = re.split(r'func\.func @', text)
total = 0
iis = []
for fn in funcs[1:]:
    counters = []
    for cm in counter_re.finditer(fn):
        lb, step, ub = int(cm.group(1)), int(cm.group(2)), int(cm.group(3))
        counters.append((ub - lb + step - 1) // step if step > 0 else (ub - lb))
    for km in kernel_re.finditer(fn):
        ii = int(km.group(1))
        iis.append(ii)
        tc = 1
        for d in counters:
            tc *= d
        if tc == 0:
            tc = 1
        total += ii * tc
        counters = []
print(f'{total}|{\",\".join(map(str,iis))}')
"
}

BL=$(extract_latency "$APP_DIR/baseline/kernel_mapped.mlir")
BL_LAT=$(echo "$BL" | cut -d'|' -f1)
BL_II=$(echo "$BL" | cut -d'|' -f2)

OP=$(extract_latency "$APP_DIR/opfusion/inclusive/kernel_mapped.mlir")
OP_LAT=$(echo "$OP" | cut -d'|' -f1)
OP_II=$(echo "$OP" | cut -d'|' -f2)

TF=$(extract_latency "$APP_DIR/taskfusion/inclusive/kernel_mapped.mlir")
TF_LAT=$(echo "$TF" | cut -d'|' -f1)
TF_II=$(echo "$TF" | cut -d'|' -f2)

OP_SPD="-"
TF_SPD="-"
if [ "$BL_LAT" != "FAILED" ] && [ "$OP_LAT" != "FAILED" ]; then
  OP_SPD=$(python3 -c "print(f'{$BL_LAT/$OP_LAT:.4f}')")
fi
if [ "$BL_LAT" != "FAILED" ] && [ "$TF_LAT" != "FAILED" ]; then
  TF_SPD=$(python3 -c "print(f'{$BL_LAT/$TF_LAT:.4f}')")
fi

N_OP_KERN="-"
N_TF_KERN="-"
if [ -f "$APP_DIR/opfusion/inclusive/kernel_mapped.mlir" ]; then
  N_OP_KERN=$(grep -c 'neura\.kernel' "$APP_DIR/opfusion/inclusive/kernel_mapped.mlir" || echo 0)
fi
if [ -f "$APP_DIR/taskfusion/inclusive/kernel_mapped.mlir" ]; then
  N_TF_KERN=$(grep -c 'neura\.kernel' "$APP_DIR/taskfusion/inclusive/kernel_mapped.mlir" || echo 0)
fi

echo "$SIZE $APP $TAG  BL:$BL_LAT(II:$BL_II)  OP:$OP_LAT(II:$OP_II,spd=$OP_SPD,k=$N_OP_KERN)  TF:$TF_LAT(II:$TF_II,spd=$TF_SPD,k=$N_TF_KERN)"
