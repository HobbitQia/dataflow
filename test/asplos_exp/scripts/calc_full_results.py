#!/usr/bin/env python3
import sys
import os
import re
import json
import csv
import math
import yaml

AREA_SPEC = {}

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

TILE_FUS = [
    "add", "mul", "div", "fadd", "fmul", "fdiv", "logic", "cmp", "sel",
    "type_conv", "vfmul", "fadd_fadd", "fmul_fadd", "grant", "loop_control",
    "phi", "constant", "return", "alloca", "shift", "mem_indexed",
]

NEURA_OP_TO_BASELINE_FU = {
    "add": "add", "sub": "add",
    "mul": "mul", "div": "div",
    "load_indexed": "mem_indexed", "store_indexed": "mem_indexed",
    "load": "mem", "store": "mem",
    "gep": "add",
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


def load_area_spec(path):
    global AREA_SPEC
    with open(path) as f:
        AREA_SPEC = yaml.safe_load(f)


def init_baseline_fu_counts():
    global BASELINE_FU_COUNTS
    for fu in TILE_FUS:
        BASELINE_FU_COUNTS[fu] = BASELINE_FU_COUNTS.get(fu, 0) + 1


def compute_baseline_tile_area():
    area = 0
    for fu in TILE_FUS:
        if fu in ARCH_FU_COMPOUND:
            for sub in ARCH_FU_COMPOUND[fu]:
                area += AREA_SPEC.get(sub, 0)
        elif fu in ARCH_FU_AREA:
            area += AREA_SPEC.get(ARCH_FU_AREA[fu], 0)
    return area


def compute_fusion_extra_area(hw_config_path, debug=False):
    if not hw_config_path or not os.path.isfile(hw_config_path):
        return 0, {}
    with open(hw_config_path) as f:
        config = json.load(f)
    hw_cfg = config.get("hardware_configuration", config)
    templates = hw_cfg.get("hardware_templates", hw_cfg.get("templates", []))
    if not templates:
        return 0, {}

    all_extra = {}
    total_extra_area = 0
    for tmpl in templates:
        fus = tmpl.get("functional_units", [])
        baseline_fu_used = {}
        if debug:
            print(f"    Template {tmpl.get('template_id', '?')} (instances={tmpl.get('instance_count',1)}):")
            print(f"      FUs: {[fu.get('op_type','') if isinstance(fu, dict) else fu for fu in fus]}")
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
        if debug:
            print(f"      Mapped to baseline FUs: {baseline_fu_used}")
            print(f"      Baseline FU counts:     { {k:v for k,v in BASELINE_FU_COUNTS.items() if k in baseline_fu_used} }")
        extra_area = 0
        for bfu, count in baseline_fu_used.items():
            baseline_count = BASELINE_FU_COUNTS.get(bfu, 0)
            extra = max(0, count - baseline_count)
            if extra > 0:
                if bfu in ARCH_FU_COMPOUND:
                    for sub in ARCH_FU_COMPOUND[bfu]:
                        cost = extra * AREA_SPEC.get(sub, 0)
                        extra_area += cost
                        if debug:
                            print(f"      Extra: {bfu} needs {count}, baseline has {baseline_count}, +{extra} -> compound sub={sub}, cost={cost}")
                elif bfu in ARCH_FU_AREA:
                    cost = extra * AREA_SPEC.get(ARCH_FU_AREA[bfu], 0)
                    extra_area += cost
                    if debug:
                        print(f"      Extra: {bfu} needs {count}, baseline has {baseline_count}, +{extra} -> area_key={ARCH_FU_AREA[bfu]}, unit_cost={AREA_SPEC.get(ARCH_FU_AREA[bfu], 0)}, cost={cost}")
                all_extra[bfu] = all_extra.get(bfu, 0) + extra
        total_extra_area += extra_area
    return total_extra_area, all_extra


def extract_mapping_info(mapped_file):
    if not os.path.isfile(mapped_file):
        return None
    with open(mapped_file) as f:
        text = f.read()
    m = re.search(r'compiled_ii\s*=\s*(\d+)', text)
    if not m:
        return None
    ii = int(m.group(1))
    rec = re.search(r'rec_mii\s*=\s*(\d+)', text)
    res = re.search(r'res_mii\s*=\s*(\d+)', text)
    rec_val = int(rec.group(1)) if rec else None
    res_val = int(res.group(1)) if res else None
    return {"ii": ii, "rec_mii": rec_val, "res_mii": res_val}


def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else "test/asplos_exp"
    debug_case = None
    for arg in sys.argv[2:]:
        if arg.startswith("--debug="):
            debug_case = arg.split("=", 1)[1]

    area_spec_path = None
    for candidate in [
        os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "e2e", "area_spec.yaml"),
        "/mnt/public/sichuan_a/qjj/dataflow/test/asplos_exp/e2e/area_spec.yaml",
        os.path.join(base_dir, "e2e", "area_spec.yaml"),
    ]:
        if os.path.isfile(candidate):
            area_spec_path = candidate
            break

    load_area_spec(area_spec_path)
    init_baseline_fu_counts()
    baseline_tile_area = compute_baseline_tile_area()
    baseline_cgra_area = baseline_tile_area * 16

    kernels = ["axpy", "bicg", "conv", "dtw", "fft", "fir", "gemm", "gemv",
               "histogram", "latnrm", "mvt", "relu", "spmv"]
    ufs = [1, 2, 4]

    rows = []
    for kernel in kernels:
        for uf in ufs:
            kdir = os.path.join(base_dir, kernel, f"uf{uf}")
            nf_mapped = os.path.join(kdir, "nofusion", "kernel_mapped.mlir")
            ex_mapped = os.path.join(kdir, "exclusive", "kernel_mapped.mlir")
            in_mapped = os.path.join(kdir, "inclusive", "kernel_mapped.mlir")
            ex_hw = os.path.join(kdir, "exclusive", "hardware_config.json")
            in_hw = os.path.join(kdir, "inclusive", "hardware_config.json")

            nf = extract_mapping_info(nf_mapped)
            ex = extract_mapping_info(ex_mapped)
            inc = extract_mapping_info(in_mapped)

            is_debug = debug_case and debug_case == f"{kernel}/uf{uf}"
            if is_debug:
                print(f"\n{'='*80}")
                print(f"DEBUG: {kernel}/uf{uf} inclusive fusion area calculation")
                print(f"{'='*80}")
                print(f"  Baseline tile area = {baseline_tile_area}")
                print(f"  Baseline CGRA area = {baseline_tile_area} * 16 = {baseline_cgra_area}")
                print(f"  Hardware config: {in_hw}")

            ex_extra_per_tile, _ = compute_fusion_extra_area(ex_hw)
            in_extra_per_tile, in_extra_detail = compute_fusion_extra_area(in_hw, debug=is_debug)
            ex_extra_total = ex_extra_per_tile * 16
            in_extra_total = in_extra_per_tile * 16

            if is_debug:
                print(f"  Extra area per tile = {in_extra_per_tile}")
                print(f"  Extra area total = {in_extra_per_tile} * 16 = {in_extra_total}")
                print(f"  Fusion CGRA area = {baseline_cgra_area} + {in_extra_total} = {baseline_cgra_area + in_extra_total}")
                print(f"  Area overhead = {in_extra_total / baseline_cgra_area * 100:.2f}%")
                print(f"{'='*80}\n")

            row = {
                "kernel": kernel, "uf": uf,
                "baseline_ii": nf["ii"] if nf else "-",
                "exclusive_ii": ex["ii"] if ex else "FAIL",
                "inclusive_ii": inc["ii"] if inc else "FAIL",
                "baseline_rec": nf["rec_mii"] if nf else "-",
                "baseline_res": nf["res_mii"] if nf else "-",
                "baseline_area": baseline_cgra_area,
                "exclusive_area": baseline_cgra_area + ex_extra_total if ex else "-",
                "inclusive_area": baseline_cgra_area + in_extra_total if inc else "-",
                "area_overhead_pct": f"{in_extra_total / baseline_cgra_area * 100:.2f}" if inc else "-",
            }

            if nf and ex and isinstance(row["exclusive_ii"], int):
                row["exclusive_speedup"] = f"{nf['ii'] / ex['ii']:.2f}"
                ex_area_ratio = (baseline_cgra_area + ex_extra_total) / baseline_cgra_area
                row["exclusive_ae"] = f"{(nf['ii'] / ex['ii']) / ex_area_ratio:.2f}"
            else:
                row["exclusive_speedup"] = "-"
                row["exclusive_ae"] = "-"

            if nf and inc and isinstance(row["inclusive_ii"], int):
                row["inclusive_speedup"] = f"{nf['ii'] / inc['ii']:.2f}"
                in_area_ratio = (baseline_cgra_area + in_extra_total) / baseline_cgra_area
                row["inclusive_ae"] = f"{(nf['ii'] / inc['ii']) / in_area_ratio:.2f}"
            else:
                row["inclusive_speedup"] = "-"
                row["inclusive_ae"] = "-"

            rows.append(row)

    result_dir = os.path.join(base_dir, "results")
    os.makedirs(result_dir, exist_ok=True)
    csv_path = os.path.join(result_dir, "full_summary.csv")

    fields = ["kernel", "uf", "baseline_ii", "exclusive_ii", "inclusive_ii",
              "baseline_rec", "baseline_res",
              "exclusive_speedup", "inclusive_speedup",
              "baseline_area", "exclusive_area", "inclusive_area",
              "area_overhead_pct",
              "exclusive_ae", "inclusive_ae"]
    with open(csv_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)

    print(f"\n{'='*170}")
    print(f"{'Kernel':<10} {'UF':<4} {'BL_II':<7} {'EX_II':<7} {'IN_II':<7} {'Rec':<5} {'Res':<5} {'EX_Spd':<8} {'IN_Spd':<8} {'BL_Area':<10} {'EX_Area':<10} {'IN_Area':<10} {'OH%':<7} {'EX_AE':<8} {'IN_AE':<8}")
    print(f"{'='*170}")
    for r in rows:
        print(f"{r['kernel']:<10} {r['uf']:<4} {str(r['baseline_ii']):<7} {str(r['exclusive_ii']):<7} {str(r['inclusive_ii']):<7} {str(r['baseline_rec']):<5} {str(r['baseline_res']):<5} {str(r['exclusive_speedup']):<8} {str(r['inclusive_speedup']):<8} {str(r['baseline_area']):<10} {str(r['exclusive_area']):<10} {str(r['inclusive_area']):<10} {str(r['area_overhead_pct']):<7} {str(r['exclusive_ae']):<8} {str(r['inclusive_ae']):<8}")

    print(f"\n--- Summary Statistics ---")
    valid_inc = [r for r in rows if r["inclusive_speedup"] != "-" and r["baseline_ii"] != "-"]
    if valid_inc:
        speedups = [float(r["inclusive_speedup"]) for r in valid_inc]
        overheads = [float(r["area_overhead_pct"]) for r in valid_inc if r["area_overhead_pct"] != "-"]
        print(f"Inclusive fusion: {len([s for s in speedups if s > 1.0])}/{len(speedups)} kernels improved")
        print(f"  Geo mean speedup: {math.exp(sum(math.log(s) for s in speedups) / len(speedups)):.2f}x")
        print(f"  Max speedup: {max(speedups):.2f}x ({[r['kernel']+'/uf'+str(r['uf']) for r in valid_inc if float(r['inclusive_speedup'])==max(speedups)][0]})")
        print(f"  Min speedup: {min(speedups):.2f}x ({[r['kernel']+'/uf'+str(r['uf']) for r in valid_inc if float(r['inclusive_speedup'])==min(speedups)][0]})")
        if overheads:
            print(f"  Avg area overhead: {sum(overheads)/len(overheads):.2f}%")
            print(f"  Max area overhead: {max(overheads):.2f}%")
        aes = [float(r["inclusive_ae"]) for r in valid_inc if r["inclusive_ae"] != "-"]
        if aes:
            print(f"  Geo mean area efficiency: {math.exp(sum(math.log(a) for a in aes)/len(aes)):.2f}")

    print(f"\nBaseline tile area: {baseline_tile_area}")
    print(f"Baseline CGRA area (16 tiles): {baseline_cgra_area}")
    print(f"Results written to: {csv_path}")


if __name__ == "__main__":
    main()
