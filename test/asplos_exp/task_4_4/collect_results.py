#!/usr/bin/env python3
"""Task 4.4: Hierarchical Contribution Analysis.

Collects 4 incremental configs × 4 apps:
  Baseline (Homo), +DFG (dedicated FU), +DFG+FU (template sharing), Full HF-CGRA
"""
import os
import re
import csv
import json

BASE_DIR = "/mnt/public/qjj/dataflow/test/asplos_exp/e2e"
TASK_DIR = os.path.dirname(os.path.abspath(__file__))
APPS = ["resnet", "llama", "harris", "lstm"]

AREA_SPEC = {
    "add": 6845, "sub": 6845, "mul": 14497, "gep": 6845, "const": 894,
    "alloca": 0, "reserve": 0, "icmp": 2635, "div": 14497, "shift": 6845,
    "load": 2060, "store": 2060, "load_indexed": 8905, "store_indexed": 8905,
    "counter": 1522, "phi_start": 1522, "phi_end": 1522,
    "grant_once": 1416, "grant_predicate": 1416,
    "and": 2635, "or": 2635, "not": 2635, "xor": 2635,
    "return": 1742, "return_value": 1742, "return_void": 1742,
    "sext": 1200, "zext": 1200,
}
ARCH_FU_AREA = {
    "add": "add", "mul": "mul", "div": "div",
    "fadd": "add", "fmul": "mul", "fdiv": "div",
    "logic": "and", "cmp": "icmp", "sel": "icmp",
    "type_conv": "sext", "vfmul": "mul",
    "grant": "grant_once", "loop_control": "counter",
    "phi": "phi_start", "constant": "const",
    "return": "return", "alloca": "alloca", "shift": "shift",
    "mem_indexed": "load_indexed", "mem": "load",
}
ARCH_FU_COMPOUND = {"fadd_fadd": ["add", "add"], "fmul_fadd": ["mul", "add"]}
TILE_FUS = [
    "add", "mul", "div", "fadd", "fmul", "fdiv", "logic", "cmp", "sel",
    "type_conv", "vfmul", "fadd_fadd", "fmul_fadd", "grant", "loop_control",
    "phi", "constant", "return", "alloca", "shift", "mem_indexed",
]
NEURA_OP_TO_BASELINE_FU = {
    "add": "add", "sub": "add", "mul": "mul", "div": "div",
    "load_indexed": "mem_indexed", "store_indexed": "mem_indexed",
    "load": "mem", "store": "mem", "gep": "add",
    "counter": "loop_control", "icmp": "cmp", "select": "sel",
    "and": "logic", "or": "logic", "not": "logic", "xor": "logic",
    "sext": "type_conv", "zext": "type_conv",
    "shift": "shift", "const": "constant",
    "phi_start": "phi", "phi_end": "phi",
    "grant_once": "grant", "grant_predicate": "grant",
    "return": "return", "return_void": "return", "return_value": "return",
    "alloca": "alloca",
}


def compute_baseline_tile_area():
    area = 0
    for fu in TILE_FUS:
        if fu in ARCH_FU_COMPOUND:
            for sub in ARCH_FU_COMPOUND[fu]:
                area += AREA_SPEC.get(sub, 0)
        elif fu in ARCH_FU_AREA:
            area += AREA_SPEC.get(ARCH_FU_AREA[fu], 0)
    return area


def compute_fusion_area(hw_config_path, baseline_tile_area):
    if not hw_config_path or not os.path.isfile(hw_config_path):
        return baseline_tile_area * 16
    baseline_fu_counts = {}
    for fu in TILE_FUS:
        baseline_fu_counts[fu] = baseline_fu_counts.get(fu, 0) + 1
    with open(hw_config_path) as f:
        config = json.load(f)
    hw_cfg = config.get("hardware_configuration", config)
    templates = hw_cfg.get("hardware_templates", hw_cfg.get("templates", []))
    extra_area = 0
    for tmpl in templates:
        fus = tmpl.get("functional_units", [])
        fu_used = {}
        for fu_entry in fus:
            op_name = fu_entry.get("op_type", "") if isinstance(fu_entry, dict) else fu_entry
            base_name = op_name.split(".")[-1] if "." in op_name else op_name
            bfu = NEURA_OP_TO_BASELINE_FU.get(base_name, base_name)
            fu_used[bfu] = fu_used.get(bfu, 0) + 1
        for bfu, count in fu_used.items():
            extra = max(0, count - baseline_fu_counts.get(bfu, 0))
            if extra > 0:
                if bfu in ARCH_FU_COMPOUND:
                    for sub in ARCH_FU_COMPOUND[bfu]:
                        extra_area += extra * AREA_SPEC.get(sub, 0)
                elif bfu in ARCH_FU_AREA:
                    extra_area += extra * AREA_SPEC.get(ARCH_FU_AREA[bfu], 0)
    return (baseline_tile_area + extra_area) * 16


def count_templates(hw_config_path):
    if not hw_config_path or not os.path.isfile(hw_config_path):
        return 0
    with open(hw_config_path) as f:
        config = json.load(f)
    hw_cfg = config.get("hardware_configuration", config)
    templates = hw_cfg.get("hardware_templates", hw_cfg.get("templates", []))
    return len(templates)


def extract_kernels_from_mapped(mapped_file):
    if not os.path.isfile(mapped_file):
        return None
    with open(mapped_file) as f:
        lines = f.readlines()

    results = []
    func_name = None
    pending_counters = []
    kernel_idx_in_func = {}

    func_re = re.compile(r'func\.func @(\w+)\(')
    counter_re = re.compile(
        r'taskflow\.counter.*?lower_bound\s*=\s*(\d+).*?step\s*=\s*(\d+).*?upper_bound\s*=\s*(\d+)')
    kernel_re = re.compile(r'neura\.kernel.*?compiled_ii\s*=\s*(\d+)')

    for line in lines:
        fm = func_re.search(line)
        if fm:
            func_name = fm.group(1)
            pending_counters = []
            if func_name not in kernel_idx_in_func:
                kernel_idx_in_func[func_name] = 0
            continue
        cm = counter_re.search(line)
        if cm:
            lb, step, ub = int(cm.group(1)), int(cm.group(2)), int(cm.group(3))
            trip = (ub - lb + step - 1) // step if step > 0 else (ub - lb)
            pending_counters.append(trip)
            continue
        km = kernel_re.search(line)
        if km and func_name:
            ii = int(km.group(1))
            trip_count = 1
            for dim in pending_counters:
                trip_count *= dim
            if trip_count == 0:
                trip_count = 1
            idx = kernel_idx_in_func[func_name]
            kernel_idx_in_func[func_name] += 1
            k_name = func_name if idx == 0 else f"{func_name}_{idx}"
            results.append({
                "func": func_name, "kernel": k_name,
                "ii": ii, "trip_count": trip_count, "latency": ii * trip_count,
            })
            pending_counters = []
            continue
    return results if results else None


def extract_tile_utilization(mapped_file):
    if not os.path.isfile(mapped_file):
        return {}
    with open(mapped_file) as f:
        text = f.read()
    func_re = re.compile(r'func\.func @(\w+)\(')
    func_positions = [(m.group(1), m.start()) for m in func_re.finditer(text)]
    func_positions.append(("__END__", len(text)))
    tile_re = re.compile(r'resource\s*=\s*"tile".*?x\s*=\s*(\d+).*?y\s*=\s*(\d+)')
    results = {}
    for idx in range(len(func_positions) - 1):
        fname = func_positions[idx][0]
        start = func_positions[idx][1]
        end = func_positions[idx + 1][1]
        func_text = text[start:end]
        iis = [int(m) for m in re.findall(r'compiled_ii\s*=\s*(\d+)', func_text)]
        if not iis:
            continue
        tiles_used = set()
        for m in tile_re.finditer(func_text):
            tiles_used.add((int(m.group(1)), int(m.group(2))))
        results[fname] = len(tiles_used) / 16.0
    return results


def get_config_data(app, config_name, baseline_tile_area):
    """Get (mapped_file, hw_config_path) for each config."""
    if config_name == "Baseline":
        mapped = os.path.join(BASE_DIR, app, "baseline", "kernel_mapped.mlir")
        return mapped, None
    elif config_name == "+DFG":
        mapped = os.path.join(TASK_DIR, app, "dfg_only", "inclusive", "kernel_mapped.mlir")
        hw = os.path.join(TASK_DIR, app, "dfg_only", "unified", "hardware_config.json")
        return mapped, hw
    elif config_name == "+DFG+FU":
        mapped = os.path.join(BASE_DIR, app, "opfusion", "inclusive", "kernel_mapped.mlir")
        hw = os.path.join(BASE_DIR, app, "opfusion", "unified", "hardware_config.json")
        return mapped, hw
    elif config_name == "Full":
        mapped = os.path.join(BASE_DIR, app, "taskfusion", "inclusive", "kernel_mapped.mlir")
        hw = os.path.join(BASE_DIR, app, "taskfusion", "unified", "hardware_config.json")
        return mapped, hw
    return None, None


def main():
    baseline_tile_area = compute_baseline_tile_area()
    baseline_cgra_area = baseline_tile_area * 16
    configs = ["Baseline", "+DFG", "+DFG+FU", "Full"]

    rows = []
    for app in APPS:
        # Get baseline latency first
        bl_mapped, _ = get_config_data(app, "Baseline", baseline_tile_area)
        bl_kernels = extract_kernels_from_mapped(bl_mapped)
        if not bl_kernels:
            print(f"WARNING: No baseline for {app}")
            continue
        bl_latency = sum(k["latency"] for k in bl_kernels)

        for config in configs:
            mapped, hw_config = get_config_data(app, config, baseline_tile_area)
            kernels = extract_kernels_from_mapped(mapped)
            util_data = extract_tile_utilization(mapped)
            area = compute_fusion_area(hw_config, baseline_tile_area)
            n_templates = count_templates(hw_config)

            if kernels:
                latency = sum(k["latency"] for k in kernels)
                speedup = bl_latency / latency if latency > 0 else 0
                area_ratio = area / baseline_cgra_area
                ae = speedup / area_ratio if area_ratio > 0 else 0
                total_lat = sum(k["latency"] for k in kernels)
                weighted_util = sum(
                    util_data.get(k["func"], 0) * k["latency"] / total_lat
                    for k in kernels
                ) if total_lat > 0 else 0
            else:
                latency = 0
                speedup = 0
                ae = 0
                weighted_util = 0

            rows.append({
                "app": app,
                "config": config,
                "num_kernels": len(kernels) if kernels else 0,
                "num_templates": n_templates,
                "latency": latency,
                "speedup": f"{speedup:.4f}",
                "area": area,
                "area_overhead_pct": f"{(area - baseline_cgra_area) / baseline_cgra_area * 100:.2f}",
                "area_efficiency": f"{ae:.4f}",
                "tile_util": f"{weighted_util:.4f}",
            })

    # Write CSV
    csv_path = os.path.join(TASK_DIR, "results.csv")
    with open(csv_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)

    # Print summary
    print(f"\n{'='*140}")
    print(f"Task 4.4: Hierarchical Contribution Analysis")
    print(f"{'='*140}")
    print(f"{'App':<10} {'Config':<12} {'#K':<5} {'#Tmpl':<7} {'Latency':<14} "
          f"{'Speedup':<10} {'Area':<12} {'Area_OH%':<10} {'AE':<10} {'Util':<8}")
    print(f"{'-'*140}")
    for r in rows:
        print(f"{r['app']:<10} {r['config']:<12} {r['num_kernels']:<5} {r['num_templates']:<7} "
              f"{str(r['latency']):<14} {r['speedup']:<10} {str(r['area']):<12} "
              f"{r['area_overhead_pct']:<10} {r['area_efficiency']:<10} {r['tile_util']:<8}")

    print(f"\nBaseline CGRA area: {baseline_cgra_area}")
    print(f"Results written to: {csv_path}")


if __name__ == "__main__":
    main()
