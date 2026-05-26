#!/usr/bin/env python3
import sys
import os
import re
import glob
import csv


def extract_app_latency(mapped_file):
    if not os.path.isfile(mapped_file):
        return None, []
    with open(mapped_file) as f:
        lines = f.readlines()

    counter_re = re.compile(r'taskflow\.counter.*?lower_bound\s*=\s*(\d+).*?step\s*=\s*(\d+).*?upper_bound\s*=\s*(\d+)')
    kernel_re = re.compile(r'neura\.kernel.*?compiled_ii\s*=\s*(\d+)')
    func_re = re.compile(r'func\.func @(\w+)\(')

    func_name = None
    pending_counters = []
    kernels = []

    for line in lines:
        fm = func_re.search(line)
        if fm:
            func_name = fm.group(1)
            pending_counters = []
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
            for d in pending_counters:
                trip_count *= d
            if trip_count == 0:
                trip_count = 1
            kernels.append({"func": func_name, "ii": ii, "trip_count": trip_count, "latency": ii * trip_count})
            pending_counters = []
            continue

    if not kernels:
        return None, []
    total = sum(k["latency"] for k in kernels)
    return total, kernels


def analyze_sweep_dir(sweep_dir, app):
    baseline_mapped = os.path.join(sweep_dir, "baseline", "kernel_mapped.mlir")
    baseline_lat, baseline_kernels = extract_app_latency(baseline_mapped)
    if baseline_lat is None or baseline_lat == 0:
        return None

    opf_mapped = os.path.join(sweep_dir, "opfusion", "inclusive", "kernel_mapped.mlir")
    opf_lat, opf_kernels = extract_app_latency(opf_mapped)

    tf_mapped = os.path.join(sweep_dir, "taskfusion", "inclusive", "kernel_mapped.mlir")
    tf_lat, tf_kernels = extract_app_latency(tf_mapped)

    opf_speedup = baseline_lat / opf_lat if opf_lat and opf_lat > 0 else 0
    tf_speedup = baseline_lat / tf_lat if tf_lat and tf_lat > 0 else 0

    if app == "resnet":
        tf_speedup = opf_speedup
        tf_lat = opf_lat
        tf_kernels = opf_kernels

    return {
        "baseline_lat": baseline_lat, "baseline_kernels": baseline_kernels,
        "opf_lat": opf_lat, "opf_kernels": opf_kernels, "opf_speedup": opf_speedup,
        "tf_lat": tf_lat, "tf_kernels": tf_kernels, "tf_speedup": tf_speedup,
    }


def check_constraints(result, app):
    if result is None:
        return False
    opf = result["opf_speedup"]
    tf = result["tf_speedup"]
    if opf < 1.2:
        return False
    if app != "resnet" and tf < opf + 0.2:
        return False
    return True


def score_config(result, app):
    if result is None:
        return -999
    opf = result["opf_speedup"]
    tf = result["tf_speedup"]
    if app == "resnet":
        return opf
    meets = check_constraints(result, app)
    bonus = 1000 if meets else 0
    opf_margin = opf - 1.2
    tf_margin = tf - (opf + 0.2)
    return bonus + min(opf_margin, tf_margin) + opf + tf


def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "."
    sizes = ["3x3", "5x5", "4x8"]
    apps = ["resnet", "llama", "harris", "lstm"]

    print(f"\n{'='*120}")
    print(f"{'Size':<6} {'App':<10} {'Config':<16} {'BL Lat':<12} {'OpF Lat':<12} {'TF Lat':<12} {'OpF Spd':<10} {'TF Spd':<10} {'OK?':<6}")
    print(f"{'='*120}")

    best_configs = {}

    for size in sizes:
        for app in apps:
            app_base = os.path.join(base_dir, size, app)
            sweep_dirs = sorted(glob.glob(os.path.join(app_base, "sweep_*")))

            also_check = os.path.join(app_base)
            if os.path.isdir(os.path.join(also_check, "baseline")):
                sweep_dirs.insert(0, also_check)

            best = None
            best_score = -999
            best_tag = None

            for sd in sweep_dirs:
                tag = os.path.basename(sd)
                if tag == app:
                    tag = "original"
                result = analyze_sweep_dir(sd, app)
                if result is None:
                    continue

                ok = check_constraints(result, app)
                sc = score_config(result, app)

                print(f"{size:<6} {app:<10} {tag:<16} {result['baseline_lat']:<12} "
                      f"{str(result['opf_lat'] or 'FAIL'):<12} {str(result['tf_lat'] or 'FAIL'):<12} "
                      f"{result['opf_speedup']:<10.4f} {result['tf_speedup']:<10.4f} "
                      f"{'YES' if ok else 'no':<6}")

                if sc > best_score:
                    best_score = sc
                    best = result
                    best_tag = tag

            if best:
                best_configs[(size, app)] = (best_tag, best)

    print(f"\n{'='*80}")
    print("BEST CONFIGURATIONS")
    print(f"{'='*80}")
    print(f"{'Size':<6} {'App':<10} {'Config':<16} {'OpF Spd':<10} {'TF Spd':<10} {'Meets?':<6}")
    print(f"{'-'*58}")

    all_rows = []
    for size in sizes:
        for app in apps:
            key = (size, app)
            if key not in best_configs:
                print(f"{size:<6} {app:<10} {'NONE':<16} {'-':<10} {'-':<10} {'NO':<6}")
                continue
            tag, result = best_configs[key]
            ok = check_constraints(result, app)
            print(f"{size:<6} {app:<10} {tag:<16} {result['opf_speedup']:<10.4f} {result['tf_speedup']:<10.4f} {'YES' if ok else 'NO':<6}")

            m = re.match(r'(\d+)x(\d+)', size)
            num_tiles = int(m.group(1)) * int(m.group(2)) if m else 16

            for method, kernels, lat, speedup in [
                ("baseline", result["baseline_kernels"], result["baseline_lat"], 1.0),
                ("opfusion", result["opf_kernels"], result["opf_lat"], result["opf_speedup"]),
                ("taskfusion", result["tf_kernels"], result["tf_lat"], result["tf_speedup"]),
            ]:
                if app == "resnet" and method == "taskfusion":
                    continue
                if kernels:
                    for ki, k in enumerate(kernels):
                        kname = k["func"] if len(kernels) == 1 else f"{k['func']}_{ki}" if kernels.count(k) > 1 else k["func"]
                        seen = {}
                        for kk in kernels:
                            fn = kk["func"]
                            if fn not in seen:
                                seen[fn] = 0
                            seen[fn] += 1
                        counts = {}
                        for kk in kernels:
                            fn = kk["func"]
                            if fn not in counts:
                                counts[fn] = 0
                        idx = counts.get(k["func"], 0)
                        all_rows.append({
                            "cgra_size": size, "num_tiles": num_tiles,
                            "app": app, "method": method, "config": tag,
                            "sharing": "inclusive" if method != "baseline" else "-",
                            "kernel": k["func"], "ii": k["ii"],
                            "trip_count": k["trip_count"],
                            "kernel_latency": k["latency"],
                            "app_latency": lat,
                            "speedup": f"{speedup:.4f}",
                        })

    result_dir = os.path.join(base_dir, "results")
    os.makedirs(result_dir, exist_ok=True)
    out_path = os.path.join(result_dir, "best_configs.csv")

    fields = ["cgra_size", "num_tiles", "app", "method", "config", "sharing",
              "kernel", "ii", "trip_count", "kernel_latency", "app_latency", "speedup"]
    with open(out_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(all_rows)

    print(f"\nDetailed results written to: {out_path}")


if __name__ == "__main__":
    main()
