#!/usr/bin/env python3
import sys
import os
import re
import csv

sys.path.insert(0, os.path.dirname(__file__))
from calc_metrics import (
    load_area_spec, init_baseline_fu_counts, compute_baseline_area_per_tile,
    compute_fusion_area, extract_functions_ii, extract_utilization,
    BASELINE_FU_COUNTS
)


BEST_CONFIGS = [
    ("3x3", "resnet",  "sweep_uf2_ms2",                               "UF=2, ms=2, mi=4"),
    ("3x3", "llama",   "sweep_uf2_ms2",                               "UF=2, ms=2, mi=4"),
    ("3x3", "harris",  "sweep_uf2_ms2",                               "UF=2, ms=2, mi=4"),
    ("3x3", "lstm",    "sweep_mixed_bl2_opf2ms15mi4_tf2ms2mi4",       "BL:UF=2 | OPF:UF=2,ms=15 | TF:UF=2,ms=2"),
    ("5x5", "resnet",  "sweep_uf3_ms2",                               "UF=3, ms=2, mi=4"),
    ("5x5", "llama",   "sweep_mixed_bl8_opf2ms2mi4_tf8ms10mi4",       "BL:UF=8 | OPF:UF=2,ms=2 | TF:UF=8,ms=10"),
    ("5x5", "harris",  "sweep_uf2_ms2",                               "UF=2, ms=2, mi=4"),
    ("5x5", "lstm",    "sweep_mixed_bl8_opf2ms2mi4_tf8ms10mi4",       "BL:UF=8 | OPF:UF=2,ms=2 | TF:UF=8,ms=10"),
    ("4x8", "resnet",  "original",                                     "UF=1, ms=3, mi=4"),
    ("4x8", "llama",   "sweep_uf2_ms3",                               "UF=2, ms=3, mi=4"),
    ("4x8", "harris",  "sweep_uf2_ms2",                               "UF=2, ms=2, mi=4"),
    ("4x8", "lstm",    "sweep_uf1_ms2",                               "UF=1, ms=2, mi=4"),
]


def process_mapped_file(mapped_file, hw_config_path, baseline_area_per_tile, num_tiles):
    func_data = extract_functions_ii(mapped_file)
    util_data = extract_utilization(mapped_file, num_tiles)

    baseline_area_total = baseline_area_per_tile * num_tiles
    fusion_area = compute_fusion_area(hw_config_path, baseline_area_total) if hw_config_path and os.path.isfile(hw_config_path) else None
    area = fusion_area if fusion_area else baseline_area_total

    kernels_out = []
    app_latency = 0
    for func_name, data in sorted(func_data.items()):
        util = util_data.get(func_name, None)
        for ki, kernel in enumerate(data["kernels"]):
            k_name = func_name if len(data["kernels"]) == 1 else f"{func_name}_{ki}"
            kernels_out.append({
                "kernel": k_name, "ii": kernel["ii"],
                "trip_count": kernel["trip_count"],
                "kernel_latency": kernel["latency"],
                "util": f"{util:.4f}" if util is not None else "-",
            })
        app_latency += data["total_latency"]

    return app_latency, area, kernels_out


def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "."

    area_spec_path = os.path.join(base_dir, "area_spec.yaml")
    if not os.path.isfile(area_spec_path):
        area_spec_path = os.path.join(os.path.dirname(base_dir), "area_spec.yaml")
    load_area_spec(area_spec_path)
    init_baseline_fu_counts()
    baseline_area_per_tile = compute_baseline_area_per_tile()

    all_rows = []

    for size, app, config_tag, config_desc in BEST_CONFIGS:
        m = re.match(r'(\d+)x(\d+)', size)
        rows_n, cols_n = int(m.group(1)), int(m.group(2))
        num_tiles = rows_n * cols_n

        if config_tag == "original":
            sweep_dir = os.path.join(base_dir, size, app)
        else:
            sweep_dir = os.path.join(base_dir, size, app, config_tag)

        bl_mapped = os.path.join(sweep_dir, "baseline", "kernel_mapped.mlir")
        bl_lat, bl_area, bl_kernels = process_mapped_file(bl_mapped, None, baseline_area_per_tile, num_tiles)

        if bl_lat == 0:
            continue

        bl_ae = f"{(1.0 / bl_lat) / bl_area:.2e}" if bl_area > 0 else "-"
        for k in bl_kernels:
            all_rows.append({
                "cgra_size": size, "num_tiles": num_tiles,
                "app": app, "method": "baseline", "config": config_desc,
                "sharing": "-",
                "kernel": k["kernel"], "ii": k["ii"],
                "trip_count": k["trip_count"],
                "kernel_latency": k["kernel_latency"],
                "app_latency": bl_lat, "speedup": "1.0000",
                "area": bl_area, "area_eff": bl_ae, "util": k["util"],
            })

        for method, dir_name in [("opfusion", "opfusion"), ("taskfusion", "taskfusion")]:
            if app == "resnet" and method == "taskfusion":
                continue

            hw_config = os.path.join(sweep_dir, dir_name, "unified", "hardware_config.json")
            mapped = os.path.join(sweep_dir, dir_name, "inclusive", "kernel_mapped.mlir")

            m_lat, m_area, m_kernels = process_mapped_file(mapped, hw_config, baseline_area_per_tile, num_tiles)
            if m_lat == 0:
                continue

            speedup = bl_lat / m_lat
            ae = f"{(1.0 / m_lat) / m_area:.2e}" if m_area > 0 else "-"

            for k in m_kernels:
                all_rows.append({
                    "cgra_size": size, "num_tiles": num_tiles,
                    "app": app, "method": method, "config": config_desc,
                    "sharing": "inclusive",
                    "kernel": k["kernel"], "ii": k["ii"],
                    "trip_count": k["trip_count"],
                    "kernel_latency": k["kernel_latency"],
                    "app_latency": m_lat, "speedup": f"{speedup:.4f}",
                    "area": m_area, "area_eff": ae, "util": k["util"],
                })

    result_dir = os.path.join(base_dir, "results")
    os.makedirs(result_dir, exist_ok=True)
    csv_path = os.path.join(result_dir, "final_summary.csv")

    fields = ["cgra_size", "num_tiles", "app", "method", "config", "sharing",
              "kernel", "ii", "trip_count", "kernel_latency",
              "app_latency", "speedup", "area", "area_eff", "util"]
    with open(csv_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(all_rows)

    print(f"\n{'='*200}")
    hdr = f"{'Size':<6} {'Tiles':<6} {'App':<10} {'Method':<12} {'Share':<10} {'Kernel':<26} {'II':<6} {'TripCnt':<12} {'KLatency':<12} {'AppLat':<14} {'Speedup':<10} {'Area':<12} {'AE':<12} {'Util':<8}"
    print(hdr)
    print(f"{'='*200}")
    for r in all_rows:
        line = (f"{r['cgra_size']:<6} {r['num_tiles']:<6} {r['app']:<10} {r['method']:<12} "
                f"{str(r['sharing']):<10} {str(r['kernel']):<26} {str(r['ii']):<6} "
                f"{str(r['trip_count']):<12} {str(r['kernel_latency']):<12} "
                f"{str(r['app_latency']):<14} {str(r['speedup']):<10} "
                f"{str(r['area']):<12} {str(r['area_eff']):<12} {str(r['util']):<8}")
        print(line)

    print(f"\n{'='*120}")
    print("SUMMARY BY (SIZE, APP)")
    print(f"{'='*120}")
    print(f"{'Size':<6} {'App':<10} {'Config':<45} {'BL Area':<12} {'OpF Area':<12} {'TF Area':<12} {'OpF Spd':<10} {'TF Spd':<10} {'OpF AE':<12} {'TF AE':<12}")
    print(f"{'-'*120}")

    seen = set()
    for r in all_rows:
        key = (r['cgra_size'], r['app'])
        if key in seen:
            continue
        seen.add(key)

        bl_area = bl_lat = opf_area = opf_lat = tf_area = tf_lat = None
        opf_ae = tf_ae = "-"
        for rr in all_rows:
            if (rr['cgra_size'], rr['app']) != key:
                continue
            if rr['method'] == 'baseline':
                bl_area = rr['area']
                bl_lat = rr['app_latency']
            elif rr['method'] == 'opfusion':
                opf_area = rr['area']
                opf_lat = rr['app_latency']
                opf_ae = rr['area_eff']
            elif rr['method'] == 'taskfusion':
                tf_area = rr['area']
                tf_lat = rr['app_latency']
                tf_ae = rr['area_eff']

        opf_spd = f"{bl_lat/opf_lat:.4f}" if bl_lat and opf_lat else "-"
        tf_spd = f"{bl_lat/tf_lat:.4f}" if bl_lat and tf_lat else opf_spd
        config = r['config']

        print(f"{r['cgra_size']:<6} {r['app']:<10} {config:<45} {str(bl_area or '-'):<12} {str(opf_area or '-'):<12} {str(tf_area or '-'):<12} {opf_spd:<10} {tf_spd:<10} {opf_ae:<12} {tf_ae:<12}")

    print(f"\nResults written to: {csv_path}")


if __name__ == "__main__":
    main()
