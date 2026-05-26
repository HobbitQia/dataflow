#!/usr/bin/env python3
import sys
import os
import csv
import re


def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "."
    sizes = ["3x3", "4x4", "5x5", "4x8"]
    all_rows = []

    for size in sizes:
        csv_path = os.path.join(base_dir, size, "results", "summary.csv")
        if not os.path.isfile(csv_path):
            continue
        with open(csv_path) as f:
            reader = csv.DictReader(f)
            for row in reader:
                row["cgra_size"] = size
                m = re.match(r'(\d+)x(\d+)', size)
                if m:
                    row["num_tiles"] = int(m.group(1)) * int(m.group(2))
                all_rows.append(row)

    result_dir = os.path.join(base_dir, "results")
    os.makedirs(result_dir, exist_ok=True)
    out_path = os.path.join(result_dir, "scalability_summary.csv")

    fields = ["cgra_size", "num_tiles", "app", "method", "sharing", "kernel", "ii",
              "trip_count", "kernel_latency", "app_latency", "speedup",
              "area", "area_eff", "util"]

    with open(out_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(all_rows)

    print(f"\n{'='*160}")
    hdr = f"{'Size':<8} {'Tiles':<6} {'App':<10} {'Method':<12} {'Share':<10} {'Kernel':<22} {'II':<6} {'TripCnt':<12} {'KLatency':<12} {'AppLat':<14} {'Speedup':<10} {'Util':<8}"
    print(hdr)
    print(f"{'='*160}")

    for r in all_rows:
        if r.get("app_latency") and r.get("speedup"):
            line = f"{r['cgra_size']:<8} {str(r.get('num_tiles','')):<6} {r['app']:<10} {r['method']:<12} {str(r['sharing']):<10} {str(r['kernel']):<22} {str(r['ii']):<6} {str(r['trip_count']):<12} {str(r['kernel_latency']):<12} {str(r['app_latency']):<14} {str(r['speedup']):<10} {str(r['util']):<8}"
            print(line)

    print(f"\nAggregated results written to: {out_path}")

    print(f"\n{'='*80}")
    print("SCALABILITY SUMMARY (App-level speedup by CGRA size)")
    print(f"{'='*80}")
    summary = {}
    for r in all_rows:
        key = (r["cgra_size"], r["app"], r["method"], r["sharing"])
        if r.get("speedup") and r["speedup"] != "-":
            summary[key] = r["speedup"]

    print(f"{'Size':<8} {'App':<10} {'Method':<12} {'Share':<10} {'Speedup':<10}")
    print(f"{'-'*50}")
    for key in sorted(summary.keys()):
        size, app, method, sharing = key
        print(f"{size:<8} {app:<10} {method:<12} {sharing:<10} {summary[key]:<10}")


if __name__ == "__main__":
    main()
