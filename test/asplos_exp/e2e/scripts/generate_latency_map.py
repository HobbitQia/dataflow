#!/usr/bin/env python3
import sys
import re
import math
import argparse
from collections import defaultdict

RTL_DELAY = {
    "add": 386.13,
    "sub": 386.13,
    "icmp": 386.13,
    "mul": 397.66,
    "gep": 330.69,
    "load": 330.69,
    "store": 330.69,
    "grant_once": 326.72,
    "grant_predicate": 326.72,
    "not": 315.91,
    "phi_start": 308.89,
    "constant": 345.92,
    "return_void": 340.40,
    "shift": 300.73,
    "phi": 308.89,
    "select": 386.13,
    "trunc": 345.92,
    "sext": 345.92,
    "zext": 345.92,
    "ctrl_mov": 308.89,
    "data_mov": 308.89,
}

SINGLE_OPS = [
    "add", "mul", "sub", "icmp", "not", "gep", "load", "store",
    "phi_start", "grant_once", "grant_predicate", "ctrl_mov",
    "return_void", "constant", "shift", "phi", "select",
    "trunc", "sext", "zext", "data_mov",
]


def get_delay(op_name):
    for key in RTL_DELAY:
        if op_name == key or op_name.endswith("." + key):
            return RTL_DELAY[key]
    return 308.89


def parse_fused_op_region(lines, start_idx):
    depth = 0
    region_lines = []
    i = start_idx
    while i < len(lines):
        line = lines[i]
        depth += line.count("({") + line.count("{") - line.count("})") - line.count("}")
        region_lines.append(line)
        if depth <= 0:
            break
        i += 1
    return region_lines, i


def extract_op_name(line):
    line = line.strip()
    m = re.search(r'"neura\.(\w+)"', line)
    if m:
        return m.group(1)
    m = re.search(r'neura\.(\w+)\s', line)
    if m:
        return m.group(1)
    return None


def extract_def(line):
    line = line.strip()
    m = re.match(r'(%\S+?)(?::(\d+))?\s*=\s', line)
    if m:
        return m.group(1)
    return None


def extract_uses(line):
    line = line.strip()
    eq_pos = line.find("=")
    if eq_pos >= 0:
        rhs = line[eq_pos + 1:]
    else:
        rhs = line
    uses = re.findall(r'(%\w+)', rhs)
    return uses


def compute_critical_path_from_region(region_lines):
    ops = []
    defs = {}

    for line in region_lines:
        line_stripped = line.strip()
        if line_stripped.startswith("^bb") or "neura.yield" in line_stripped:
            continue
        if "neura.fused_op" in line_stripped:
            inner_start = region_lines.index(line)
            inner_region, end_idx = parse_fused_op_region(region_lines, inner_start)
            inner_delay = compute_critical_path_from_region(inner_region[1:])
            def_var = extract_def(line_stripped)
            if def_var:
                uses = extract_uses(line_stripped)
                ops.append((def_var, uses, inner_delay))
                defs[def_var] = len(ops) - 1
                multi = re.match(r'(%\S+):(\d+)', line_stripped)
                if multi:
                    base = multi.group(1)
                    count_m = re.findall(r'(%\S+:\d+)', line_stripped)
                    for cv in count_m:
                        defs[cv] = len(ops) - 1
            continue

        op_name = extract_op_name(line_stripped)
        if op_name and op_name not in ("yield",):
            def_var = extract_def(line_stripped)
            uses = extract_uses(line_stripped)
            delay = get_delay(op_name)
            if def_var:
                ops.append((def_var, uses, delay))
                defs[def_var] = len(ops) - 1

    if not ops:
        return 0.0

    longest = [0.0] * len(ops)
    for idx, (def_var, uses, delay) in enumerate(ops):
        max_pred = 0.0
        for u in uses:
            if u in defs:
                pred_idx = defs[u]
                if pred_idx < idx:
                    max_pred = max(max_pred, longest[pred_idx])
        longest[idx] = max_pred + delay

    return max(longest) if longest else 0.0


def parse_fused_ops(mlir_text):
    lines = mlir_text.split("\n")
    fused_patterns = {}
    i = 0
    while i < len(lines):
        line = lines[i]
        if "neura.fused_op" in line and "pattern_name" in line:
            m = re.search(r'pattern_name\s*=\s*"([^"]+)"', line)
            if m:
                pattern_name = m.group(1)
                brace_start = i
                while brace_start < len(lines) and "({" not in lines[brace_start]:
                    brace_start += 1
                region_lines = []
                depth = 0
                j = brace_start
                while j < len(lines):
                    l = lines[j]
                    for ch_idx in range(len(l)):
                        if l[ch_idx:ch_idx+2] == "({":
                            depth += 1
                        elif l[ch_idx:ch_idx+2] == "})":
                            depth -= 1
                    region_lines.append(l)
                    if depth <= 0 and j > brace_start:
                        break
                    j += 1
                delay = compute_critical_path_from_region(region_lines)
                latency = max(1, math.ceil(delay / 1000.0))
                if pattern_name not in fused_patterns:
                    fused_patterns[pattern_name] = latency
                i = j + 1
                continue
        i += 1
    return fused_patterns


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("mlir_file")
    parser.add_argument("-o", "--output", required=True)
    args = parser.parse_args()

    with open(args.mlir_file, "r") as f:
        mlir_text = f.read()

    fused_patterns = parse_fused_ops(mlir_text)

    with open(args.output, "w") as f:
        for op in SINGLE_OPS:
            f.write(f"{op}: 1\n")
        for pattern, latency in sorted(fused_patterns.items()):
            f.write(f"{pattern}: {latency}\n")


if __name__ == "__main__":
    main()
