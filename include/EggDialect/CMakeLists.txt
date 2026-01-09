add_mlir_dialect(Egg egg)

# Generate Ops TableGen files
set(LLVM_TARGET_DEFINITIONS EggOps.td)
mlir_tablegen(EggOps.h.inc -gen-op-decls)
mlir_tablegen(EggOps.cpp.inc -gen-op-defs)
add_public_tablegen_target(MLIREggOpsIncGen)

set(LLVM_TARGET_DEFINITIONS EggPasses.td)
mlir_tablegen(EggPasses.h.inc --gen-pass-decls)
add_public_tablegen_target(MLIREggTransformsIncGen)
