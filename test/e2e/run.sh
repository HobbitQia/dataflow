 mlir-neura-opt  fir/fir_kernel.mlir \
    --assign-accelerator \
    --lower-llvm-to-neura \
    --promote-func-arg-to-const \
    --fold-constant \
    --canonicalize-live-in \
    --leverage-predicated-value \
    --transform-ctrl-to-data-flow \
    --fold-constant --view-op-graph