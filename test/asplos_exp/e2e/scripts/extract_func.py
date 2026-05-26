#!/usr/bin/env python3
import sys
import os
import re


def extract_functions(mlir_path, outdir):
    with open(mlir_path) as f:
        text = f.read()

    lines = text.split("\n")
    func_re = re.compile(r'^\s*func\.func\s+@(\w+)\s*\(')
    functions = []
    i = 0

    while i < len(lines):
        m = func_re.match(lines[i])
        if m:
            name = m.group(1)
            start = i
            depth = 0
            seen_open = False
            for j in range(i, len(lines)):
                depth += lines[j].count("{") - lines[j].count("}")
                if depth > 0:
                    seen_open = True
                if seen_open and depth <= 0:
                    functions.append((name, "\n".join(lines[start:j + 1])))
                    i = j + 1
                    break
            else:
                functions.append((name, "\n".join(lines[start:])))
                break
        else:
            i += 1

    os.makedirs(outdir, exist_ok=True)

    for name, body in functions:
        out_path = os.path.join(outdir, f"{name}.mlir")
        with open(out_path, "w") as f:
            f.write("module {\n\n")
            f.write(body)
            f.write("\n\n}\n")
        print(name)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: extract_func.py INPUT.mlir OUTDIR", file=sys.stderr)
        sys.exit(1)
    extract_functions(sys.argv[1], sys.argv[2])
