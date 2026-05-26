#!/usr/bin/env python3
import argparse
import json


SINGLE_OPS = [
    "add", "sub", "mul", "div",
    "load_indexed", "store_indexed", "load", "store",
    "counter", "icmp", "sel",
    "and", "or", "not", "xor",
    "sext", "zext", "trunc", "shift",
    "constant", "phi_start", "phi_end",
    "grant_once", "grant_predicate",
    "return", "return_void", "return_value",
    "alloca", "reserve", "data_mov", "ctrl_mov",
]


def main() -> None:
    parser = argparse.ArgumentParser(description="Merge Plaid manifests and build a latency map")
    parser.add_argument("manifests", nargs="+")
    parser.add_argument("-o", "--output", required=True)
    parser.add_argument("--latency-map", required=True)
    args = parser.parse_args()

    merged = {"motifs": []}
    latency = {name: 1 for name in SINGLE_OPS}

    for path in args.manifests:
        with open(path, "r") as handle:
            data = json.load(handle)
        merged["motifs"].extend(data.get("motifs", []))
        if "app" in data and data["app"]:
            merged["app"] = data["app"]
        if "uf_spec" in data and data["uf_spec"]:
            merged["uf_spec"] = data["uf_spec"]
        for motif in data.get("motifs", []):
            latency[motif["pattern_name"]] = motif["latency"]

    merged["motif_count"] = len(merged["motifs"])
    breakdown = {}
    for motif in merged["motifs"]:
        breakdown[motif["motif_type"]] = breakdown.get(motif["motif_type"], 0) + 1
    merged["motif_breakdown"] = breakdown

    with open(args.output, "w") as handle:
        json.dump(merged, handle, indent=2, sort_keys=True)
        handle.write("\n")

    with open(args.latency_map, "w") as handle:
        for key in sorted(latency):
            handle.write(f"{key}: {latency[key]}\n")


if __name__ == "__main__":
    main()

