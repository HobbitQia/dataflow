#!/usr/bin/env python3
import sys
import os
import re

def extract_app_latency(mapped_file):
    if not os.path.isfile(mapped_file):
        return None, [], []
    with open(mapped_file) as f:
        lines = f.readlines()

    counter_re = re.compile(r'taskflow\.counter.*?lower_bound\s*=\s*(\d+).*?step\s*=\s*(\d+).*?upper_bound\s*=\s*(\d+)')
    kernel_re = re.compile(r'neura\.kernel.*?compiled_ii\s*=\s*(\d+)')
    func_re = re.compile(r'func\.func @(\w+)\(')

    total_latency = 0
    all_ii = []
    kernel_count = 0
    pending_counters = []

    for line in lines:
        fm = func_re.search(line)
        if fm:
            pending_counters = []
            continue

        cm = counter_re.search(line)
        if cm:
            lb = int(cm.group(1))
            step = int(cm.group(2))
            ub = int(cm.group(3))
            trip = (ub - lb + step - 1) // step if step > 0 else (ub - lb)
            pending_counters.append(trip)
            continue

        km = kernel_re.search(line)
        if km:
            ii = int(km.group(1))
            all_ii.append(ii)
            trip_count = 1
            for dim in pending_counters:
                trip_count *= dim
            if trip_count == 0:
                trip_count = 1
            total_latency += ii * trip_count
            kernel_count += 1
            pending_counters = []
            continue

    return total_latency if kernel_count > 0 else None, all_ii, kernel_count


def extract_patterns(fused_file):
    if not os.path.isfile(fused_file):
        return []
    with open(fused_file) as f:
        text = f.read()
    patterns = set(re.findall(r'pattern_name\s*=\s*"([^"]+)"', text))
    return sorted(patterns)


size = sys.argv[1]
app = sys.argv[2]
tag = sys.argv[3]
base = os.environ.get("BASE_DIR", ".")

app_dir = os.path.join(base, size, app, tag)

bl_lat, bl_ii, bl_k = extract_app_latency(os.path.join(app_dir, "baseline", "kernel_mapped.mlir"))
op_lat, op_ii, op_k = extract_app_latency(os.path.join(app_dir, "opfusion", "inclusive", "kernel_mapped.mlir"))
tf_lat, tf_ii, tf_k = extract_app_latency(os.path.join(app_dir, "taskfusion", "inclusive", "kernel_mapped.mlir"))

op_spd = f"{bl_lat / op_lat:.4f}" if bl_lat and op_lat else "-"
tf_spd = f"{bl_lat / tf_lat:.4f}" if bl_lat and tf_lat else "-"

op_patterns = extract_patterns(os.path.join(app_dir, "opfusion", "unified", "kernel_fused.mlir"))
tf_patterns = extract_patterns(os.path.join(app_dir, "taskfusion", "unified", "kernel_fused.mlir"))

print(f"{size:5s} {app:10s} {tag:20s}  BL:{bl_lat}(II:{','.join(map(str,bl_ii))},k={bl_k})  OP:{op_lat}(II:{','.join(map(str,op_ii))},spd={op_spd},k={op_k})  TF:{tf_lat}(II:{','.join(map(str,tf_ii))},spd={tf_spd},k={tf_k})")
if op_patterns:
    print(f"      OP patterns({len(op_patterns)}): {', '.join(op_patterns[:10])}")
if tf_patterns:
    print(f"      TF patterns({len(tf_patterns)}): {', '.join(tf_patterns[:10])}")
