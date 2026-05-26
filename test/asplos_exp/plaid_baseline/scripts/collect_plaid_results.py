#!/usr/bin/env python3
import argparse
import csv
import json
import math
import os
import re
from typing import Dict, List, Tuple


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

BASELINE_TILE_FUS = [
    "add", "mul", "div", "fadd", "fmul", "fdiv", "logic", "cmp", "sel",
    "type_conv", "vfmul", "fadd_fadd", "fmul_fadd", "grant", "loop_control",
    "phi", "constant", "return", "alloca", "shift", "mem_indexed",
]

# Conservative Plaid approximation:
# 1. successful motif executions pay an extra schedule/collective-routing penalty
# 2. specialized motif hardware is treated as an overlay on top of the baseline tile
PLAID_LATENCY_SCALE = 1.30


def load_scalar_yaml(path: str) -> Dict[str, int]:
    data: Dict[str, int] = {}
    if not os.path.isfile(path):
        return data
    with open(path, "r") as handle:
        for line in handle:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            match = re.match(r'(\S+):\s*(\d+)', line)
            if match:
                data[match.group(1)] = int(match.group(2))
    return data


def compute_baseline_area_per_tile(area_spec: Dict[str, int]) -> int:
    total = 0
    for fu in BASELINE_TILE_FUS:
        if fu in ARCH_FU_COMPOUND:
            for sub in ARCH_FU_COMPOUND[fu]:
                total += area_spec.get(sub, 0)
        elif fu in ARCH_FU_AREA:
            total += area_spec.get(ARCH_FU_AREA[fu], 0)
    return total if total > 0 else 1


def compute_plaid_area_per_tile(area_spec: Dict[str, int]) -> int:
    alu = area_spec.get("alu", 6845)
    router = area_spec.get("local_router", 3500)
    bypass = area_spec.get("bypass_control", 1200)
    edge = area_spec.get("edge_alsu_amortized", 1000)
    return 3 * alu + router + bypass + edge


def extract_functions_ii(mapped_file: str) -> Dict[str, dict]:
    if not os.path.isfile(mapped_file):
        return {}
    with open(mapped_file, "r") as handle:
        lines = handle.readlines()

    results: Dict[str, dict] = {}
    func_name = None
    pending_counters: List[int] = []
    kernels_by_func: Dict[str, List[dict]] = {}

    counter_re = re.compile(
        r'taskflow\.counter.*?lower_bound\s*=\s*(\d+).*?step\s*=\s*(\d+).*?upper_bound\s*=\s*(\d+)'
    )
    kernel_re = re.compile(r'neura\.kernel.*?compiled_ii\s*=\s*(\d+)')
    func_re = re.compile(r'func\.func @(\w+)\(')

    for line in lines:
        func_match = func_re.search(line)
        if func_match:
            func_name = func_match.group(1)
            pending_counters = []
            kernels_by_func.setdefault(func_name, [])
            continue

        counter_match = counter_re.search(line)
        if counter_match:
            lb = int(counter_match.group(1))
            step = int(counter_match.group(2))
            ub = int(counter_match.group(3))
            trip = (ub - lb + step - 1) // step if step > 0 else (ub - lb)
            pending_counters.append(trip)
            continue

        kernel_match = kernel_re.search(line)
        if kernel_match and func_name:
            ii = int(kernel_match.group(1))
            trip_count = 1
            for dim in pending_counters:
                trip_count *= dim
            if trip_count == 0:
                trip_count = 1
            kernels_by_func[func_name].append(
                {"ii": ii, "trip_count": trip_count, "latency": ii * trip_count}
            )
            pending_counters = []

    for fn, kernels in kernels_by_func.items():
        if kernels:
            results[fn] = {
                "kernels": kernels,
                "total_latency": sum(k["latency"] for k in kernels),
                "max_ii": max(k["ii"] for k in kernels),
            }
    return results


def extract_utilization(mapped_file: str, num_tiles: int = 16) -> Dict[str, float]:
    if not os.path.isfile(mapped_file):
        return {}
    with open(mapped_file, "r") as handle:
        text = handle.read()

    func_pattern = re.compile(r'func\.func @(\w+)\(')
    func_positions = [(m.group(1), m.start()) for m in func_pattern.finditer(text)]
    func_positions.append(("__END__", len(text)))

    tile_loc_re = re.compile(
        r'resource\s*=\s*"tile".*?time_step\s*=\s*(\d+).*?x\s*=\s*(\d+).*?y\s*=\s*(\d+)'
    )

    results: Dict[str, float] = {}
    for idx in range(len(func_positions) - 1):
        fn = func_positions[idx][0]
        start = func_positions[idx][1]
        end = func_positions[idx + 1][1]
        chunk = text[start:end]
        ii_vals = [int(m) for m in re.findall(r'compiled_ii\s*=\s*(\d+)', chunk)]
        if not ii_vals:
            continue
        occupied = len(list(tile_loc_re.finditer(chunk)))
        total_slots = num_tiles * ii_vals[0]
        results[fn] = occupied / total_slots if total_slots > 0 else 0.0
    return results


def load_manifest_summary(path: str) -> Tuple[int, str]:
    if not os.path.isfile(path):
        return 0, "-"
    with open(path, "r") as handle:
        data = json.load(handle)
    motifs = data.get("motifs", [])
    breakdown: Dict[str, int] = {}
    for motif in motifs:
        kind = motif.get("motif_type", "unknown")
        breakdown[kind] = breakdown.get(kind, 0) + 1
    breakdown_text = ",".join(f"{key}:{breakdown[key]}" for key in sorted(breakdown)) if breakdown else "-"
    return len(motifs), breakdown_text


def load_fallback_metadata(path: str) -> Dict[str, str]:
    if not os.path.isfile(path):
        return {}
    with open(path, "r") as handle:
        try:
            data = json.load(handle)
        except json.JSONDecodeError:
            return {}
    return data if isinstance(data, dict) else {}


def process_mapped(
    app: str,
    method: str,
    uf_tag: str,
    uf_spec: str,
    mapped_file: str,
    area: int,
    motif_count: int,
    motif_breakdown: str,
    baseline_latency: int,
    baseline_ae: float,
    rows: List[dict],
    num_tiles: int = 16,
    latency_scale: float = 1.0,
) -> Tuple[int, float]:
    func_data = extract_functions_ii(mapped_file)
    util_data = extract_utilization(mapped_file, num_tiles)

    if not func_data:
        return 0, 0.0

    app_latency = 0
    start_idx = len(rows)
    for fn, data in sorted(func_data.items()):
        util = util_data.get(fn)
        for kernel_idx, kernel in enumerate(data["kernels"]):
            kernel_name = fn if len(data["kernels"]) == 1 else f"{fn}_{kernel_idx}"
            scaled_kernel_latency = max(1, math.ceil(kernel["latency"] * latency_scale))
            rows.append(
                {
                    "app": app,
                    "method": method,
                    "uf_tag": uf_tag,
                    "uf_spec": uf_spec,
                    "kernel": kernel_name,
                    "ii": kernel["ii"],
                    "trip_count": kernel["trip_count"],
                    "kernel_latency": scaled_kernel_latency,
                    "app_latency": "",
                    "speedup": "",
                    "area": area,
                    "area_eff": "",
                    "ae_speedup": "",
                    "util": f"{util:.4f}" if util is not None else "-",
                    "motif_count": motif_count,
                    "motif_breakdown": motif_breakdown,
                }
            )
        app_latency += max(1, math.ceil(data["total_latency"] * latency_scale))

    ae = (1.0 / app_latency) / area if app_latency > 0 and area > 0 else 0.0
    if method == "baseline":
        speedup = 1.0 if app_latency > 0 else 0.0
        ae_speedup = 1.0 if app_latency > 0 else 0.0
    else:
        speedup = baseline_latency / app_latency if baseline_latency > 0 and app_latency > 0 else 0.0
        ae_speedup = ae / baseline_ae if baseline_ae > 0 and ae > 0 else 0.0

    for idx in range(start_idx, len(rows)):
        rows[idx]["app_latency"] = app_latency
        rows[idx]["speedup"] = f"{speedup:.4f}" if speedup > 0 else "-"
        rows[idx]["area_eff"] = f"{ae:.2e}" if ae > 0 else "-"
        rows[idx]["ae_speedup"] = f"{ae_speedup:.4f}" if ae_speedup > 0 else "-"

    return app_latency, ae


def main() -> None:
    parser = argparse.ArgumentParser(description="Collect Plaid sweep results")
    parser.add_argument("base_dir", nargs="?", default=os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    parser.add_argument("--size", default="4x4")
    args = parser.parse_args()

    parts = args.size.split("x")
    num_tiles = int(parts[0]) * int(parts[1])

    base_dir = os.path.abspath(args.base_dir)
    asplos_dir = os.path.dirname(base_dir)
    baseline_area_spec = load_scalar_yaml(os.path.join(asplos_dir, "scalability", "area_spec.yaml"))
    plaid_area_spec = load_scalar_yaml(os.path.join(base_dir, "area_spec_plaid.yaml"))

    baseline_area = compute_baseline_area_per_tile(baseline_area_spec) * num_tiles
    plaid_overlay_area = compute_plaid_area_per_tile(plaid_area_spec) * num_tiles
    plaid_area = baseline_area + plaid_overlay_area

    rows: List[dict] = []
    best_latency_rows: List[dict] = []
    best_ae_rows: List[dict] = []

    for app in ["resnet", "harris", "llama", "lstm"]:
        app_root = os.path.join(base_dir, app, "sweep")
        baseline_root = os.path.join(app_root, "baseline")
        plaid_root = os.path.join(app_root, "plaid")
        if not os.path.isdir(app_root):
            continue

        uf_tags = set()
        if os.path.isdir(baseline_root):
            uf_tags.update(name for name in os.listdir(baseline_root) if name.startswith("uf_"))
        if os.path.isdir(plaid_root):
            uf_tags.update(name for name in os.listdir(plaid_root) if name.startswith("uf_"))

        config_rows: List[dict] = []
        for entry in sorted(uf_tags):
            uf_tag = entry[3:]
            uf_spec = uf_tag.replace("_", ",")
            baseline_mapped = os.path.join(baseline_root, entry, "kernel_mapped.mlir")
            plaid_dir = os.path.join(plaid_root, entry, "exclusive")
            plaid_mapped = os.path.join(plaid_dir, "kernel_mapped.mlir")
            manifest_path = os.path.join(plaid_dir, "plaid_manifest.json")
            fallback_path = os.path.join(plaid_dir, "fallback.json")

            baseline_latency, baseline_ae = process_mapped(
                app,
                "baseline",
                uf_tag,
                uf_spec,
                baseline_mapped,
                baseline_area,
                0,
                "-",
                0,
                0.0,
                rows,
                num_tiles,
            )

            fallback_meta = load_fallback_metadata(fallback_path)
            motif_count, motif_breakdown = load_manifest_summary(manifest_path)
            plaid_area_effective = plaid_area
            plaid_latency_scale = PLAID_LATENCY_SCALE
            if fallback_meta.get("mode") == "baseline_passthrough":
                motif_count = 0
                reason = fallback_meta.get("reason", "baseline_passthrough")
                motif_breakdown = f"fallback:{reason}"
                plaid_area_effective = baseline_area
                plaid_latency_scale = 1.0

            plaid_latency, plaid_ae = process_mapped(
                app,
                "plaid",
                uf_tag,
                uf_spec,
                plaid_mapped,
                plaid_area_effective,
                motif_count,
                motif_breakdown,
                baseline_latency,
                baseline_ae,
                rows,
                num_tiles,
                plaid_latency_scale,
            )

            if plaid_latency > 0:
                config_rows.append(
                    {
                        "app": app,
                        "uf_tag": uf_tag,
                        "uf_spec": uf_spec,
                        "baseline_latency": baseline_latency,
                        "plaid_latency": plaid_latency,
                        "speedup": baseline_latency / plaid_latency if baseline_latency > 0 else 0.0,
                        "baseline_area": baseline_area,
                        "plaid_area": plaid_area_effective,
                        "baseline_ae": baseline_ae,
                        "plaid_ae": plaid_ae,
                        "ae_speedup": plaid_ae / baseline_ae if baseline_ae > 0 else 0.0,
                        "motif_count": motif_count,
                        "motif_breakdown": motif_breakdown,
                    }
                )

        if config_rows:
            best_latency_rows.append(min(config_rows, key=lambda item: item["plaid_latency"]))
            best_ae_rows.append(max(config_rows, key=lambda item: item["plaid_ae"]))

    result_dir = os.path.join(base_dir, "results")
    os.makedirs(result_dir, exist_ok=True)

    summary_csv = os.path.join(result_dir, "plaid_sweep_summary.csv")
    with open(summary_csv, "w", newline="") as handle:
        fields = [
            "app", "method", "uf_tag", "uf_spec", "kernel", "ii", "trip_count",
            "kernel_latency", "app_latency", "speedup", "area", "area_eff",
            "ae_speedup", "util", "motif_count", "motif_breakdown",
        ]
        writer = csv.DictWriter(handle, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)

    best_fields = [
        "app", "uf_tag", "uf_spec", "baseline_latency", "plaid_latency",
        "speedup", "baseline_area", "plaid_area", "baseline_ae", "plaid_ae",
        "ae_speedup", "motif_count", "motif_breakdown",
    ]

    best_latency_csv = os.path.join(result_dir, "plaid_best_latency.csv")
    with open(best_latency_csv, "w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=best_fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(best_latency_rows)

    best_ae_csv = os.path.join(result_dir, "plaid_best_area_eff.csv")
    with open(best_ae_csv, "w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=best_fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(best_ae_rows)

    print(f"Results written to: {summary_csv}")
    print(f"Best-latency configs: {best_latency_csv}")
    print(f"Best-area-efficiency configs: {best_ae_csv}")


if __name__ == "__main__":
    main()
