#!/usr/bin/env python3
"""Task 4.5.1: DFG-Level Internal Ablation.

Collects metrics for 3 variants × 13 kernels:
  Full DFG (existing), w/o hw-cost, w/o critical-path
"""
import os
import re
import csv
import json
import math

EXP_DIR = "/mnt/public/qjj/dataflow/test/asplos_exp"
TASK_DIR = os.path.dirname(os.path.abspath(__file__))
KERNELS = ["axpy", "bicg", "conv", "dtw", "fft", "fir", "gemm", "gemv",
           "histogram", "latnrm", "mvt", "relu", "spmv"]

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
        return baseline_tile_area * 16, 0
    baseline_fu_counts = {}
    for fu in TILE_FUS:
        baseline_fu_counts[fu] = baseline_fu_counts.get(fu, 0) + 1
    with open(hw_config_path) as f:
        config = json.load(f)
    hw_cfg = config.get("hardware_configuration", config)
    templates = hw_cfg.get("hardware_templates", hw_cfg.get("templates", []))
    extra_area = 0
    n_templates = len(templates)
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
    return (baseline_tile_area + extra_area) * 16, n_templates


def extract_ii(mapped_file):
    if not os.path.isfile(mapped_file):
        return None
    with open(mapped_file) as f:
        text = f.read()
    m = re.search(r'compiled_ii\s*=\s*(\d+)', text)
    if m:
        return int(m.group(1))
    return None


def extract_rec_res_mii(mapped_file):
    if not os.path.isfile(mapped_file):
        return None, None
    with open(mapped_file) as f:
        text = f.read()
    rec = re.search(r'rec_mii\s*=\s*(\d+)', text)
    res = re.search(r'res_mii\s*=\s*(\d+)', text)
    return (int(rec.group(1)) if rec else None, int(res.group(1)) if res else None)


def count_patterns(fused_file):
    """Count unique pattern types from fused MLIR."""
    if not os.path.isfile(fused_file):
        return 0, 0
    with open(fused_file) as f:
        text = f.read()
    pattern_names = re.findall(r'pattern_name\s*=\s*"([^"]+)"', text)
    n_instances = len(pattern_names)
    n_unique = len(set(pattern_names))
    return n_unique, n_instances


def main():
    baseline_tile_area = compute_baseline_tile_area()
    baseline_cgra_area = baseline_tile_area * 16

    # Variants: (name, mapped_path_template, hw_config_template, fused_template)
    variants = [
        ("full_dfg",
         os.path.join(EXP_DIR, "{kernel}", "uf1", "inclusive", "kernel_mapped.mlir"),
         os.path.join(EXP_DIR, "{kernel}", "uf1", "inclusive", "hardware_config.json"),
         os.path.join(EXP_DIR, "{kernel}", "uf1", "inclusive", "kernel_fused.mlir")),
        ("wo_hwcost",
         os.path.join(TASK_DIR, "{kernel}", "wo_hwcost", "kernel_mapped.mlir"),
         os.path.join(TASK_DIR, "{kernel}", "wo_hwcost", "hardware_config.json"),
         os.path.join(TASK_DIR, "{kernel}", "wo_hwcost", "kernel_fused.mlir")),
        ("wo_critical",
         os.path.join(TASK_DIR, "{kernel}", "wo_critical", "kernel_mapped.mlir"),
         os.path.join(TASK_DIR, "{kernel}", "wo_critical", "hardware_config.json"),
         os.path.join(TASK_DIR, "{kernel}", "wo_critical", "kernel_fused.mlir")),
    ]

    rows = []
    for kernel in KERNELS:
        # Baseline (nofusion)
        bl_mapped = os.path.join(EXP_DIR, kernel, "uf1", "nofusion", "kernel_mapped.mlir")
        bl_ii = extract_ii(bl_mapped)
        bl_rec, bl_res = extract_rec_res_mii(bl_mapped)

        for vname, mapped_tmpl, hw_tmpl, fused_tmpl in variants:
            mapped = mapped_tmpl.format(kernel=kernel)
            hw_config = hw_tmpl.format(kernel=kernel)
            fused = fused_tmpl.format(kernel=kernel)

            ii = extract_ii(mapped)
            rec, res = extract_rec_res_mii(mapped)
            area, n_templates = compute_fusion_area(hw_config, baseline_tile_area)
            n_patterns, n_instances = count_patterns(fused)

            if bl_ii and ii:
                speedup = bl_ii / ii
                area_ratio = area / baseline_cgra_area
                ae = speedup / area_ratio if area_ratio > 0 else 0
            else:
                speedup = None
                ae = None

            rows.append({
                "kernel": kernel,
                "variant": vname,
                "baseline_ii": bl_ii or "-",
                "baseline_rec": bl_rec or "-",
                "baseline_res": bl_res or "-",
                "ii": ii or "FAIL",
                "rec_mii": rec or "-",
                "res_mii": res or "-",
                "speedup": f"{speedup:.4f}" if speedup else "-",
                "area": area,
                "area_overhead_pct": f"{(area - baseline_cgra_area) / baseline_cgra_area * 100:.2f}",
                "area_efficiency": f"{ae:.4f}" if ae else "-",
                "n_templates": n_templates,
                "n_patterns": n_patterns,
                "n_instances": n_instances,
            })

    # Write CSV
    csv_path = os.path.join(TASK_DIR, "results.csv")
    with open(csv_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)

    # Print summary
    print(f"\n{'='*160}")
    print(f"Task 4.5.1: DFG-Level Internal Ablation (all kernels uf1, inclusive mode)")
    print(f"{'='*160}")
    print(f"{'Kernel':<12} {'Variant':<15} {'BL_II':<7} {'II':<7} {'Rec':<5} {'Res':<5} "
          f"{'Speedup':<10} {'Area':<10} {'OH%':<8} {'AE':<10} {'#Tmpl':<7} {'#Pat':<6} {'#Inst':<6}")
    print(f"{'-'*160}")
    for r in rows:
        print(f"{r['kernel']:<12} {r['variant']:<15} {str(r['baseline_ii']):<7} {str(r['ii']):<7} "
              f"{str(r['rec_mii']):<5} {str(r['res_mii']):<5} "
              f"{r['speedup']:<10} {str(r['area']):<10} {r['area_overhead_pct']:<8} "
              f"{r['area_efficiency']:<10} {str(r['n_templates']):<7} "
              f"{str(r['n_patterns']):<6} {str(r['n_instances']):<6}")

    # Geo-mean summary per variant
    print(f"\n--- Geo-Mean Summary ---")
    for vname in ["full_dfg", "wo_hwcost", "wo_critical"]:
        v_rows = [r for r in rows if r["variant"] == vname and r["speedup"] != "-"]
        if v_rows:
            speedups = [float(r["speedup"]) for r in v_rows]
            overheads = [float(r["area_overhead_pct"]) for r in v_rows]
            aes = [float(r["area_efficiency"]) for r in v_rows if r["area_efficiency"] != "-"]
            geo_spd = math.exp(sum(math.log(s) for s in speedups) / len(speedups))
            avg_oh = sum(overheads) / len(overheads)
            geo_ae = math.exp(sum(math.log(a) for a in aes) / len(aes)) if aes else 0
            n_fail = sum(1 for r in rows if r["variant"] == vname and r["ii"] == "FAIL")
            print(f"  {vname:<15} geo_speedup={geo_spd:.4f}  avg_area_oh={avg_oh:.2f}%  "
                  f"geo_ae={geo_ae:.4f}  failures={n_fail}/{len(KERNELS)}")

    print(f"\nBaseline CGRA area: {baseline_cgra_area}")
    print(f"Results written to: {csv_path}")


if __name__ == "__main__":
    main()
