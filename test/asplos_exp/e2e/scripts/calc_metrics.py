#!/usr/bin/env python3
import sys
import os
import re
import json
import yaml
import csv
import glob


AREA_SPEC = {}


def load_area_spec(path):
    global AREA_SPEC
    with open(path) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            m = re.match(r'(\S+):\s*(\d+)', line)
            if m:
                AREA_SPEC[m.group(1)] = int(m.group(2))


def extract_functions_ii(mapped_file):
    if not os.path.isfile(mapped_file):
        return {}
    with open(mapped_file) as f:
        lines = f.readlines()

    results = {}
    func_name = None
    pending_counters = []
    kernels_by_func = {}

    counter_re = re.compile(r'taskflow\.counter.*?lower_bound\s*=\s*(\d+).*?step\s*=\s*(\d+).*?upper_bound\s*=\s*(\d+)')
    kernel_re = re.compile(r'neura\.kernel.*?compiled_ii\s*=\s*(\d+)')
    func_re = re.compile(r'func\.func @(\w+)\(')

    for line in lines:
        fm = func_re.search(line)
        if fm:
            func_name = fm.group(1)
            pending_counters = []
            if func_name not in kernels_by_func:
                kernels_by_func[func_name] = []
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
        if km and func_name:
            ii = int(km.group(1))
            trip_count = 1
            for dim in pending_counters:
                trip_count *= dim
            if trip_count == 0:
                trip_count = 1
            kernels_by_func[func_name].append({"ii": ii, "trip_count": trip_count, "latency": ii * trip_count})
            pending_counters = []
            continue

    for func_name, kernels in kernels_by_func.items():
        if not kernels:
            continue

        if kernels:
            total_latency = sum(k["latency"] for k in kernels)
            max_ii = max(k["ii"] for k in kernels)
            results[func_name] = {
                "kernels": kernels,
                "total_latency": total_latency,
                "max_ii": max_ii,
            }

    return results


def extract_utilization(mapped_file):
    if not os.path.isfile(mapped_file):
        return {}
    with open(mapped_file) as f:
        text = f.read()

    func_pattern = re.compile(r'func\.func @(\w+)\(')
    func_positions = [(m.group(1), m.start()) for m in func_pattern.finditer(text)]
    func_positions.append(("__END__", len(text)))

    tile_loc_re = re.compile(r'resource\s*=\s*"tile".*?time_step\s*=\s*(\d+).*?x\s*=\s*(\d+).*?y\s*=\s*(\d+)')

    results = {}
    for idx in range(len(func_positions) - 1):
        func_name = func_positions[idx][0]
        start = func_positions[idx][1]
        end = func_positions[idx + 1][1]
        func_text = text[start:end]

        ii_vals = [int(m) for m in re.findall(r'compiled_ii\s*=\s*(\d+)', func_text)]
        if not ii_vals:
            continue

        occupied_count = 0
        for m in tile_loc_re.finditer(func_text):
            occupied_count += 1

        total_slots = 16 * ii_vals[0] if ii_vals else 1
        results[func_name] = occupied_count / total_slots if total_slots > 0 else 0.0

    return results


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

ARCH_FU_COMPOUND = {
    "fadd_fadd": ["add", "add"],
    "fmul_fadd": ["mul", "add"],
}


def compute_baseline_area():
    tile_fus = ["add", "mul", "div", "fadd", "fmul", "fdiv", "logic", "cmp", "sel",
                "type_conv", "vfmul", "fadd_fadd", "fmul_fadd", "grant", "loop_control",
                "phi", "constant", "return", "alloca", "shift", "mem_indexed"]
    area = 0
    for fu in tile_fus:
        if fu in ARCH_FU_COMPOUND:
            for sub in ARCH_FU_COMPOUND[fu]:
                area += AREA_SPEC.get(sub, 0)
        elif fu in ARCH_FU_AREA:
            area += AREA_SPEC.get(ARCH_FU_AREA[fu], 0)
    return area


NEURA_OP_TO_BASELINE_FU = {
    "add": "add", "sub": "add",
    "mul": "mul", "div": "div",
    "load_indexed": "mem_indexed", "store_indexed": "mem_indexed",
    "load": "mem", "store": "mem",
    "counter": "loop_control",
    "icmp": "cmp", "select": "sel",
    "and": "logic", "or": "logic", "not": "logic", "xor": "logic",
    "sext": "type_conv", "zext": "type_conv",
    "shift": "shift", "const": "constant",
    "phi_start": "phi", "phi_end": "phi",
    "grant_once": "grant", "grant_predicate": "grant",
    "return": "return", "return_void": "return", "return_value": "return",
    "alloca": "alloca",
}

BASELINE_FU_COUNTS = {}


def init_baseline_fu_counts():
    global BASELINE_FU_COUNTS
    tile_fus = ["add", "mul", "div", "fadd", "fmul", "fdiv", "logic", "cmp", "sel",
                "type_conv", "vfmul", "fadd_fadd", "fmul_fadd", "grant", "loop_control",
                "phi", "constant", "return", "alloca", "shift", "mem_indexed"]
    for fu in tile_fus:
        BASELINE_FU_COUNTS[fu] = BASELINE_FU_COUNTS.get(fu, 0) + 1


def compute_fusion_area(hw_config_path, baseline_area):
    if not os.path.isfile(hw_config_path):
        return None
    with open(hw_config_path) as f:
        config = json.load(f)

    hw_cfg = config.get("hardware_configuration", config)
    templates = hw_cfg.get("hardware_templates", hw_cfg.get("templates", []))
    if isinstance(config, list):
        templates = config
    if not templates:
        return None

    tmpl = templates[0]
    fus = tmpl.get("functional_units", [])

    baseline_fu_used = {}
    for fu_entry in fus:
        if isinstance(fu_entry, dict):
            op_name = fu_entry.get("op_type", "")
        elif isinstance(fu_entry, str):
            op_name = fu_entry
        else:
            continue
        base_name = op_name.split(".")[-1] if "." in op_name else op_name
        baseline_fu = NEURA_OP_TO_BASELINE_FU.get(base_name, base_name)
        baseline_fu_used[baseline_fu] = baseline_fu_used.get(baseline_fu, 0) + 1

    extra_area = 0
    for bfu, count in baseline_fu_used.items():
        baseline_count = BASELINE_FU_COUNTS.get(bfu, 0)
        extra = max(0, count - baseline_count)
        if extra > 0:
            if bfu in ARCH_FU_AREA:
                extra_area += extra * AREA_SPEC.get(ARCH_FU_AREA[bfu], 0)
            elif bfu in ARCH_FU_COMPOUND:
                for sub in ARCH_FU_COMPOUND[bfu]:
                    extra_area += extra * AREA_SPEC.get(sub, 0)

    return baseline_area + extra_area


def process_method(app, method, mapped_file, hw_config_path, baseline_area, baseline_app_latency, sharing, rows, uf_label=""):
    func_data = extract_functions_ii(mapped_file)
    util_data = extract_utilization(mapped_file)

    fusion_area = compute_fusion_area(hw_config_path, baseline_area) if hw_config_path else None
    area = fusion_area if fusion_area else baseline_area

    app_latency = 0
    all_mapped = True

    for func_name, data in sorted(func_data.items()):
        util = util_data.get(func_name, None)
        for ki, kernel in enumerate(data["kernels"]):
            k_name = func_name if len(data["kernels"]) == 1 else f"{func_name}_{ki}"
            row = {
                "app": app, "method": method, "sharing": sharing,
                "kernel": k_name, "ii": kernel["ii"],
                "trip_count": kernel["trip_count"],
                "kernel_latency": kernel["latency"],
                "app_latency": "", "speedup": "",
                "area": area,
                "area_eff": "",
                "util": f"{util:.4f}" if util is not None else "-",
            }
            if uf_label:
                row["uf"] = uf_label
            rows.append(row)
        app_latency += data["total_latency"]

    if not func_data:
        all_mapped = False

    if all_mapped and app_latency > 0:
        speedup = baseline_app_latency / app_latency if baseline_app_latency > 0 else 0
        ae = f"{(1.0 / app_latency) / area:.2e}" if area > 0 else "-"
        for r in rows:
            if r["app"] == app and r["method"] == method and r["sharing"] == sharing:
                if uf_label and r.get("uf") != uf_label:
                    continue
                r["app_latency"] = app_latency
                r["speedup"] = f"{speedup:.4f}"
                r["area_eff"] = ae

    return app_latency if all_mapped else 0


def process_app_at_path(app, app_dir, baseline_area, rows, uf_label=""):
    baseline_mapped = os.path.join(app_dir, "baseline", "kernel_mapped.mlir")
    baseline_latency = process_method(
        app, "baseline", baseline_mapped, None, baseline_area, 0, "-", rows, uf_label
    )
    for r in rows:
        if r["app"] == app and r["method"] == "baseline":
            if uf_label and r.get("uf") != uf_label:
                continue
            r["app_latency"] = baseline_latency if baseline_latency > 0 else "FAILED"
            r["speedup"] = "1.0000" if baseline_latency > 0 else "-"
            if baseline_latency > 0 and baseline_area > 0:
                r["area_eff"] = f"{(1.0 / baseline_latency) / baseline_area:.2e}"

    for method, dir_name in [("opfusion", "opfusion"), ("taskfusion", "taskfusion")]:
        hw_config = os.path.join(app_dir, dir_name, "unified", "hardware_config.json")
        for sharing in ["exclusive", "inclusive"]:
            mapped = os.path.join(app_dir, dir_name, sharing, "kernel_mapped.mlir")
            process_method(
                app, method, mapped, hw_config, baseline_area,
                baseline_latency, sharing, rows, uf_label
            )


def discover_uf_dirs(app_dir):
    pattern = os.path.join(app_dir, "uf*")
    uf_dirs = sorted(glob.glob(pattern))
    results = []
    for d in uf_dirs:
        if os.path.isdir(d):
            name = os.path.basename(d)
            m = re.match(r'uf(\d+)', name)
            if m:
                results.append(int(m.group(1)))
    return results


def parse_uf_arg(args):
    for arg in args:
        m = re.match(r'--uf=(.+)', arg)
        if m:
            val = m.group(1)
            if val == "all":
                return "all"
            return int(val)
    return None


def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "."
    uf_arg = parse_uf_arg(sys.argv[2:])

    load_area_spec(os.path.join(base_dir, "area_spec.yaml"))
    init_baseline_fu_counts()

    baseline_area = compute_baseline_area()
    rows = []
    has_uf = uf_arg is not None

    for app in ["resnet", "llama", "harris"]:
        app_dir = os.path.join(base_dir, app)

        if uf_arg is None:
            process_app_at_path(app, app_dir, baseline_area, rows)
        elif uf_arg == "all":
            uf_values = discover_uf_dirs(app_dir)
            for uf in uf_values:
                uf_path = os.path.join(app_dir, f"uf{uf}")
                process_app_at_path(app, uf_path, baseline_area, rows, uf_label=str(uf))
        else:
            uf_path = os.path.join(app_dir, f"uf{uf_arg}")
            process_app_at_path(app, uf_path, baseline_area, rows, uf_label=str(uf_arg))

    result_dir = os.path.join(base_dir, "results")
    os.makedirs(result_dir, exist_ok=True)

    if uf_arg is not None:
        csv_name = f"summary_uf{uf_arg}.csv" if uf_arg != "all" else "summary_uf_all.csv"
    else:
        csv_name = "summary.csv"
    csv_path = os.path.join(result_dir, csv_name)

    fields = ["app", "method", "sharing", "kernel", "ii", "trip_count",
              "kernel_latency", "app_latency", "speedup", "area", "area_eff", "util"]
    if has_uf:
        fields.insert(1, "uf")

    with open(csv_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)

    print(f"\n{'='*140}")
    if has_uf:
        hdr = f"{'App':<10} {'UF':<4} {'Method':<12} {'Share':<10} {'Kernel':<22} {'II':<6} {'TripCnt':<12} {'KLatency':<12} {'AppLat':<14} {'Speedup':<10} {'Area':<10} {'AE':<12} {'Util':<8}"
    else:
        hdr = f"{'App':<10} {'Method':<12} {'Share':<10} {'Kernel':<22} {'II':<6} {'TripCnt':<12} {'KLatency':<12} {'AppLat':<14} {'Speedup':<10} {'Area':<10} {'AE':<12} {'Util':<8}"
    print(hdr)
    print(f"{'='*140}")
    for r in rows:
        if has_uf:
            line = f"{r['app']:<10} {str(r.get('uf','')):<4} {r['method']:<12} {str(r['sharing']):<10} {str(r['kernel']):<22} {str(r['ii']):<6} {str(r['trip_count']):<12} {str(r['kernel_latency']):<12} {str(r['app_latency']):<14} {str(r['speedup']):<10} {str(r['area']):<10} {str(r['area_eff']):<12} {str(r['util']):<8}"
        else:
            line = f"{r['app']:<10} {r['method']:<12} {str(r['sharing']):<10} {str(r['kernel']):<22} {str(r['ii']):<6} {str(r['trip_count']):<12} {str(r['kernel_latency']):<12} {str(r['app_latency']):<14} {str(r['speedup']):<10} {str(r['area']):<10} {str(r['area_eff']):<12} {str(r['util']):<8}"
        print(line)

    print(f"\nResults written to: {csv_path}")


if __name__ == "__main__":
    main()
