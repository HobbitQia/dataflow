#!/usr/bin/env python3
import argparse
import json
import re
from dataclasses import dataclass
from typing import Dict, List, Tuple


TOKEN_RE = re.compile(r'(?<!")%[A-Za-z0-9_.$]+(?:#\d+)?')
RESULT_RE = re.compile(r'^(\s*)(%[A-Za-z0-9_.$]+)(?::(\d+))?\s*=\s*(.+)$')
BLOCK_ARG_RE = re.compile(r'(%[A-Za-z0-9_.$]+)\s*:\s*([^,)]+)')

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

SUPPORTED_RESULT_OPS = {
    "counter", "load_indexed", "load", "mul", "add", "sub", "div", "icmp",
    "sel", "and", "or", "not", "xor", "shift", "constant", "sext", "zext",
    "trunc", "gep", "shl", "vector", "vmul", "store", "store_indexed",
}


@dataclass
class OpRecord:
    line_idx: int
    indent: str
    result: str
    op_name: str
    operands: List[str]
    result_type: str
    original_line: str


def extract_op_name(line: str) -> str:
    quoted = re.search(r'"neura\.([A-Za-z0-9_]+)"', line)
    if quoted:
        return quoted.group(1)
    bare = re.search(r'\bneura\.([A-Za-z0-9_]+)\b', line)
    if bare:
        return bare.group(1)
    return ""


def extract_result_type(line: str) -> str:
    if "->" not in line:
        if " : " in line:
            return line.rsplit(" : ", 1)[1].strip()
        return ""
    return line.rsplit("->", 1)[1].strip()


def extract_operands(rhs: str) -> List[str]:
    return TOKEN_RE.findall(rhs)


def parse_block_args(header_line: str) -> Dict[str, str]:
    args: Dict[str, str] = {}
    for arg, arg_type in BLOCK_ARG_RE.findall(header_line):
        args[arg] = arg_type.strip()
    return args


def parse_ops(body_lines: List[str]) -> Tuple[List[OpRecord], Dict[str, str]]:
    ops: List[OpRecord] = []
    value_types: Dict[str, str] = {}
    for idx, line in enumerate(body_lines):
        stripped = line.strip()
        if not stripped or stripped.startswith("^bb") or stripped.startswith("neura.yield"):
            continue
        match = RESULT_RE.match(line)
        if not match:
            continue
        indent, result, _, rhs = match.groups()
        op_name = extract_op_name(rhs)
        if not op_name or op_name == "fused_op":
            continue
        result_type = extract_result_type(line)
        operands = extract_operands(rhs)
        ops.append(
            OpRecord(
                line_idx=idx,
                indent=indent,
                result=result,
                op_name=op_name,
                operands=operands,
                result_type=result_type,
                original_line=line.rstrip("\n"),
            )
        )
        if result_type:
            value_types[result] = result_type
    return ops, value_types


def classify_triplet(triple: List[OpRecord]) -> Tuple[str, int]:
    a, b, c = triple
    deps = {
        "ab": a.result in b.operands,
        "ac": a.result in c.operands,
        "bc": b.result in c.operands,
    }
    if deps["ab"] and deps["bc"]:
        return ("unicast", 3)
    if deps["ac"] and deps["bc"]:
        return ("fan_in", 2)
    if deps["ab"] and deps["ac"]:
        return ("fan_out", 2)
    return ("", 0)


def substitute_tokens(text: str, mapping: Dict[str, str]) -> str:
    if not mapping:
        return text

    def repl(match: re.Match) -> str:
        token = match.group(0)
        return mapping.get(token, token)

    return TOKEN_RE.sub(repl, text)


def find_outside_uses(
    body_lines: List[str], selected_line_ids: set, selected_results: List[str]
) -> Dict[str, bool]:
    outside_uses = {res: False for res in selected_results}
    for idx, line in enumerate(body_lines):
        if idx in selected_line_ids:
            continue
        tokens = set(TOKEN_RE.findall(line))
        for res in selected_results:
            if res in tokens:
                outside_uses[res] = True
    return outside_uses


def rewrite_kernel_body(
    body_lines: List[str],
    function_name: str,
    kernel_index: int,
    app: str,
    uf_spec: str,
    motif_id_start: int,
) -> Tuple[List[str], List[dict], int]:
    ops, value_types = parse_ops(body_lines)
    op_type_by_result = {op.result: op.result_type for op in ops if op.result_type}
    motifs = []
    selected: Dict[int, Tuple[List[OpRecord], str, int, int]] = {}
    used_op_ids = set()

    for idx in range(len(ops) - 2):
        if idx in used_op_ids or idx + 1 in used_op_ids or idx + 2 in used_op_ids:
            continue
        triple = ops[idx:idx + 3]
        if any(op.op_name not in SUPPORTED_RESULT_OPS for op in triple):
            continue
        motif_type, latency = classify_triplet(triple)
        if not motif_type:
            continue
        selected[idx] = (triple, motif_type, latency, motif_id_start)
        used_op_ids.update({idx, idx + 1, idx + 2})
        motif_id_start += 1

    line_to_start = {triple[0].line_idx: start_idx for start_idx, (triple, _, _, _) in selected.items()}
    line_to_end = {triple[-1].line_idx: start_idx for start_idx, (triple, _, _, _) in selected.items()}

    output_lines: List[str] = []
    current_map: Dict[str, str] = {}
    block_args = parse_block_args(body_lines[0]) if body_lines and body_lines[0].lstrip().startswith("^bb") else {}
    generated_counter = 0
    line_idx = 0

    while line_idx < len(body_lines):
        if line_idx in line_to_start:
            start_key = line_to_start[line_idx]
            triple, motif_type, latency, pattern_id = selected[start_key]
            selected_line_ids = {op.line_idx for op in triple}
            selected_results = [op.result for op in triple]
            outside_uses = find_outside_uses(body_lines, selected_line_ids, selected_results)

            external_inputs: List[str] = []
            external_types: Dict[str, str] = {}
            selected_set = set(selected_results)

            def lookup_type(value: str) -> str:
                return value_types.get(value, op_type_by_result.get(value, block_args.get(value, "")))

            for op in triple:
                for operand in op.operands:
                    if operand in selected_set:
                        continue
                    if operand not in external_inputs:
                        external_inputs.append(operand)
                        ext_type = lookup_type(operand)
                        external_types[operand] = ext_type

            yielded_results = [res for res in selected_results if outside_uses.get(res, False)]
            if not yielded_results:
                yielded_results = [triple[-1].result]

            base_name = f"%plaid_fused_{generated_counter}"
            generated_counter += 1
            if len(yielded_results) == 1:
                fused_lhs = base_name
            else:
                fused_lhs = f"{base_name}:{len(yielded_results)}"

            result_map = {}
            for out_idx, result in enumerate(yielded_results):
                result_map[result] = base_name if len(yielded_results) == 1 else f"{base_name}#{out_idx}"
            current_map.update(result_map)

            op_chain = "->".join(op.op_name for op in triple)
            pattern_name = f"plaid.{motif_type}:{op_chain}"
            indent = triple[0].indent

            fused_operands = [current_map.get(inp, inp) for inp in external_inputs]
            fused_operand_types = [external_types[inp] for inp in external_inputs]
            fused_result_types = [lookup_type(result) for result in yielded_results]

            attr_chunk = (
                f'<{{frequency = 1 : i64, pattern_id = {pattern_id} : i64, '
                f'pattern_name = "{pattern_name}"}}>'
            )
            operands_chunk = ", ".join(fused_operands)
            if fused_operand_types:
                input_type_chunk = "(" + ", ".join(fused_operand_types) + ")"
            else:
                input_type_chunk = "()"
            if len(fused_result_types) == 1:
                result_type_chunk = fused_result_types[0]
            else:
                result_type_chunk = "(" + ", ".join(fused_result_types) + ")"

            output_lines.append(
                f'{indent}{fused_lhs} = "neura.fused_op"({operands_chunk}) {attr_chunk} ({{'
                if operands_chunk
                else f'{indent}{fused_lhs} = "neura.fused_op"() {attr_chunk} ({{'
            )

            if external_inputs:
                arg_parts = [
                    f"%plaid_arg{generated_counter}_{arg_idx}: {external_types[inp]}"
                    for arg_idx, inp in enumerate(external_inputs)
                ]
                output_lines.append(f'{indent}^bb0({", ".join(arg_parts)}):')
            else:
                output_lines.append(f"{indent}^bb0:")

            arg_map = {
                inp: f"%plaid_arg{generated_counter}_{arg_idx}"
                for arg_idx, inp in enumerate(external_inputs)
            }
            for op in triple:
                rewritten = substitute_tokens(op.original_line.strip(), arg_map)
                output_lines.append(f"{indent}  {rewritten}")

            yield_values = ", ".join(yielded_results)
            yield_types = ", ".join(lookup_type(result) for result in yielded_results)
            output_lines.append(f"{indent}  neura.yield results({yield_values} : {yield_types})")
            output_lines.append(f"{indent}}}) : {input_type_chunk} -> {result_type_chunk}")

            motifs.append(
                {
                    "app": app,
                    "uf_spec": uf_spec,
                    "function": function_name,
                    "kernel_index": kernel_index,
                    "pattern_id": pattern_id,
                    "pattern_name": pattern_name,
                    "motif_type": motif_type,
                    "latency": latency,
                    "ops": [op.op_name for op in triple],
                    "external_inputs": external_inputs,
                    "outputs": yielded_results,
                }
            )

            line_idx = triple[-1].line_idx + 1
            continue

        rewritten_line = substitute_tokens(body_lines[line_idx].rstrip("\n"), current_map)
        output_lines.append(rewritten_line)
        line_idx += 1

    return output_lines, motifs, motif_id_start


def transform_module(text: str, app: str, uf_spec: str) -> Tuple[str, List[dict]]:
    lines = text.splitlines()
    out_lines: List[str] = []
    motifs: List[dict] = []
    motif_id = 0
    current_function = ""
    kernel_index = -1
    line_idx = 0
    has_neura_kernel = "neura.kernel inputs" in text

    while line_idx < len(lines):
        line = lines[line_idx]
        func_match = re.match(r'^\s*func\.func\s+@([A-Za-z0-9_.$]+)\s*\(', line)
        if func_match:
            current_function = func_match.group(1)

        # Handle neura.kernel blocks (e2e multi-kernel flow)
        if "neura.kernel inputs" in line:
            kernel_index += 1
            out_lines.append(line)
            line_idx += 1
            body_lines: List[str] = []
            while line_idx < len(lines):
                candidate = lines[line_idx]
                if candidate.strip() == "}":
                    transformed, kernel_motifs, motif_id = rewrite_kernel_body(
                        body_lines,
                        current_function,
                        kernel_index,
                        app,
                        uf_spec,
                        motif_id,
                    )
                    out_lines.extend(transformed)
                    motifs.extend(kernel_motifs)
                    out_lines.append(candidate)
                    line_idx += 1
                    break
                body_lines.append(candidate)
                line_idx += 1
            else:
                transformed, kernel_motifs, motif_id = rewrite_kernel_body(
                    body_lines,
                    current_function,
                    kernel_index,
                    app,
                    uf_spec,
                    motif_id,
                )
                out_lines.extend(transformed)
                motifs.extend(kernel_motifs)
            continue

        # Handle bare func.func with accelerator="neura" (single-kernel flow)
        if (not has_neura_kernel and func_match
                and 'accelerator = "neura"' in line and line.rstrip().endswith("{")):
            kernel_index += 1
            out_lines.append(line)
            line_idx += 1
            brace_depth = 1
            body_lines = []
            while line_idx < len(lines) and brace_depth > 0:
                candidate = lines[line_idx]
                stripped = candidate.strip()
                brace_depth += stripped.count("{") - stripped.count("}")
                if brace_depth == 0:
                    transformed, kernel_motifs, motif_id = rewrite_kernel_body(
                        body_lines,
                        current_function,
                        kernel_index,
                        app,
                        uf_spec,
                        motif_id,
                    )
                    out_lines.extend(transformed)
                    motifs.extend(kernel_motifs)
                    out_lines.append(candidate)
                    line_idx += 1
                    break
                body_lines.append(candidate)
                line_idx += 1
            continue

        out_lines.append(line)
        line_idx += 1

    return "\n".join(out_lines) + "\n", motifs


def write_latency_map(path: str, motifs: List[dict]) -> None:
    entries = {name: 1 for name in SINGLE_OPS}
    for motif in motifs:
        entries[motif["pattern_name"]] = motif["latency"]
    with open(path, "w") as handle:
        for key in sorted(entries):
            handle.write(f"{key}: {entries[key]}\n")


def main() -> None:
    parser = argparse.ArgumentParser(description="Greedy 3-node Plaid motif fusion")
    parser.add_argument("input")
    parser.add_argument("-o", "--output", required=True)
    parser.add_argument("--manifest", required=True)
    parser.add_argument("--latency-map")
    parser.add_argument("--app", default="")
    parser.add_argument("--uf-spec", default="")
    args = parser.parse_args()

    with open(args.input, "r") as handle:
        text = handle.read()

    transformed, motifs = transform_module(text, args.app, args.uf_spec)
    with open(args.output, "w") as handle:
        handle.write(transformed)

    manifest = {
        "source": args.input,
        "app": args.app,
        "uf_spec": args.uf_spec,
        "motifs": motifs,
    }
    with open(args.manifest, "w") as handle:
        json.dump(manifest, handle, indent=2, sort_keys=True)
        handle.write("\n")

    if args.latency_map:
        write_latency_map(args.latency_map, motifs)


if __name__ == "__main__":
    main()
