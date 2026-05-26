#!/usr/bin/env python3
import sys
import re


def strip_module_wrapper(text):
    lines = text.strip().split("\n")
    if not lines:
        return ""

    first = lines[0].strip()
    if re.match(r'^module\s*\{', first) or first == "module {":
        last_idx = len(lines) - 1
        while last_idx >= 0 and lines[last_idx].strip() == "":
            last_idx -= 1
        if last_idx >= 0 and lines[last_idx].strip() == "}":
            return "\n".join(lines[1:last_idx])

    return text


def merge_modules(input_files, output_file):
    bodies = []
    for path in input_files:
        with open(path) as f:
            text = f.read()
        body = strip_module_wrapper(text)
        if body.strip():
            bodies.append(body)

    merged = "module {\n\n" + "\n\n".join(bodies) + "\n\n}\n"

    with open(output_file, "w") as f:
        f.write(merged)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: merge_neura_modules.py FILE1.mlir FILE2.mlir ... -o OUTPUT.mlir", file=sys.stderr)
        sys.exit(1)

    if "-o" in sys.argv:
        o_idx = sys.argv.index("-o")
        output = sys.argv[o_idx + 1]
        inputs = sys.argv[1:o_idx]
    else:
        output = sys.argv[-1]
        inputs = sys.argv[1:-1]

    merge_modules(inputs, output)
