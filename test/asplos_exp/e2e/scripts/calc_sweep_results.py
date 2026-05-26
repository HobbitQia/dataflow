#!/usr/bin/env python3
import sys
import os
import re
import csv
import json
import glob

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from calc_metrics import (
    extract_functions_ii,
    extract_utilization,
    load_area_spec,
    init_baseline_fu_counts,
    compute_baseline_area,
    compute_fusion_area,
    AREA_SPEC,
)


def find_mapped_file(result_dir, strategy):
    if strategy == "baseline":
        return os.path.join(result_dir, "kernel_mapped.mlir")
    return os.path.join(result_dir, "inclusive", "kernel_mapped.mlir")


def find_hw_config(result_dir, strategy):
    if strategy == "baseline":
        return None
    return os.path.join(result_dir, "unified", "hardware_config.json")


def parse_dir_name(dirname, strategy):
    if strategy == "baseline":
        m = re.match(r'uf_(.+)', dirname)
        if m:
            uf_spec = m.group(1).replace("_", ",")
            return {"uf_spec": uf_spec, "mi": "-", "ms": "-"}
    else:
        m = re.match(r'uf_(.+?)_mi(\d+)_ms(\d+)', dirname)
        if m:
            uf_spec = m.group(1).replace("_", ",")
            return {"uf_spec": uf_spec, "mi": m.group(2), "ms": m.group(3)}
    return None


def collect_results(base_dir, app):
    app_dir = os.path.join(base_dir, app)
    sweep_dir = os.path.join(app_dir, "sweep")

    if not os.path.isdir(sweep_dir):
        return []

    rows = []

    for strategy in ["baseline", "opfusion", "taskfusion"]:
        strat_dir = os.path.join(sweep_dir, strategy)
        if not os.path.isdir(strat_dir):
            continue

        for entry in sorted(os.listdir(strat_dir)):
            result_dir = os.path.join(strat_dir, entry)
            if not os.path.isdir(result_dir):
                continue

            params = parse_dir_name(entry, strategy)
            if not params:
                continue

            mapped_file = find_mapped_file(result_dir, strategy)
            if not os.path.isfile(mapped_file):
                continue

            func_data = extract_functions_ii(mapped_file)
            util_data = extract_utilization(mapped_file)

            if not func_data:
                continue

            hw_config_path = find_hw_config(result_dir, strategy)
            baseline_area = compute_baseline_area()
            fusion_area = compute_fusion_area(hw_config_path, baseline_area) if hw_config_path else None
            area = fusion_area if fusion_area else baseline_area

            app_latency = 0
            kernel_rows = []

            for func_name, data in sorted(func_data.items()):
                util = util_data.get(func_name, None)
                for ki, kernel in enumerate(data["kernels"]):
                    k_name = func_name if len(data["kernels"]) == 1 else f"{func_name}_{ki}"
                    kernel_rows.append({
                        "app": app,
                        "strategy": strategy,
                        "uf_spec": params["uf_spec"],
                        "mi": params["mi"],
                        "ms": params["ms"],
                        "kernel": k_name,
                        "ii": kernel["ii"],
                        "trip_count": kernel["trip_count"],
                        "kernel_latency": kernel["latency"],
                        "app_latency": "",
                        "speedup_vs_best_baseline": "",
                        "area": area,
                        "util": f"{util:.4f}" if util is not None else "-",
                    })
                app_latency += data["total_latency"]

            for kr in kernel_rows:
                kr["app_latency"] = app_latency

            rows.extend(kernel_rows)

    return rows


def compute_speedups(rows):
    baseline_latencies = {}
    for r in rows:
        if r["strategy"] == "baseline" and r["app_latency"]:
            key = r["app"]
            lat = r["app_latency"]
            if key not in baseline_latencies or lat < baseline_latencies[key]:
                baseline_latencies[key] = lat

    for r in rows:
        app = r["app"]
        if app in baseline_latencies and r["app_latency"]:
            r["speedup_vs_best_baseline"] = f"{baseline_latencies[app] / r['app_latency']:.4f}"


def rank_results(rows):
    by_app_strategy = {}
    for r in rows:
        key = (r["app"], r["strategy"])
        if key not in by_app_strategy:
            by_app_strategy[key] = {}

        config_key = f"{r['uf_spec']}|{r['mi']}|{r['ms']}"
        if config_key not in by_app_strategy[key]:
            by_app_strategy[key][config_key] = r["app_latency"]

    print("\n" + "=" * 100)
    print("TOP-3 CONFIGS PER APP/STRATEGY (by app latency, lower is better)")
    print("=" * 100)

    for (app, strategy), configs in sorted(by_app_strategy.items()):
        ranked = sorted(configs.items(), key=lambda x: x[1] if x[1] else float("inf"))
        print(f"\n{app} / {strategy}:")
        for i, (cfg, lat) in enumerate(ranked[:3]):
            print(f"  #{i+1}: latency={lat}  config={cfg}")


def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "."

    load_area_spec(os.path.join(base_dir, "area_spec.yaml"))
    init_baseline_fu_counts()

    all_rows = []
    for app in ["resnet", "llama", "harris", "lstm"]:
        all_rows.extend(collect_results(base_dir, app))

    compute_speedups(all_rows)

    result_dir = os.path.join(base_dir, "results")
    os.makedirs(result_dir, exist_ok=True)
    csv_path = os.path.join(result_dir, "sweep_summary.csv")

    fields = [
        "app", "strategy", "uf_spec", "mi", "ms",
        "kernel", "ii", "trip_count", "kernel_latency",
        "app_latency", "speedup_vs_best_baseline", "area", "util",
    ]

    with open(csv_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(all_rows)

    print(f"\n{'='*140}")
    hdr = f"{'App':<8} {'Strategy':<12} {'UF_spec':<24} {'MI':<4} {'MS':<4} {'Kernel':<22} {'II':<6} {'TC':<12} {'KLat':<12} {'AppLat':<14} {'Speedup':<10} {'Area':<10} {'Util':<8}"
    print(hdr)
    print(f"{'='*140}")
    for r in all_rows:
        line = (
            f"{r['app']:<8} {r['strategy']:<12} {str(r['uf_spec']):<24} "
            f"{str(r['mi']):<4} {str(r['ms']):<4} {str(r['kernel']):<22} "
            f"{str(r['ii']):<6} {str(r['trip_count']):<12} {str(r['kernel_latency']):<12} "
            f"{str(r['app_latency']):<14} {str(r['speedup_vs_best_baseline']):<10} "
            f"{str(r['area']):<10} {str(r['util']):<8}"
        )
        print(line)

    rank_results(all_rows)

    print(f"\nResults written to: {csv_path}")


if __name__ == "__main__":
    main()
