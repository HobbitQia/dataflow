#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<4096 x i32>
  llvm.mlir.global internal @_ZZ4mainE2x1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.mlir.global internal @_ZZ4mainE2x2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.mlir.global internal @_ZZ4mainE2y1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.mlir.global internal @_ZZ4mainE2y2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.addressof @_ZZ4mainE2x1 {latency = 1 : i32} : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i8) {latency = 1 : i32} : i8
    %2 = llvm.mlir.constant(256 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.addressof @_ZZ4mainE2x2 {latency = 1 : i32} : !llvm.ptr
    %4 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.addressof @_ZZ4mainE2y1 {latency = 1 : i32} : !llvm.ptr
    %6 = llvm.mlir.constant(3 : i32) {latency = 1 : i32} : i32
    %7 = llvm.mlir.addressof @_ZZ4mainE2y2 {latency = 1 : i32} : !llvm.ptr
    %8 = llvm.mlir.constant(4 : i32) {latency = 1 : i32} : i32
    %9 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %10 = llvm.mlir.constant(64 : i64) {latency = 1 : i32} : i64
    %11 = llvm.mlir.constant(6 : i32) {latency = 1 : i32} : i32
    %12 = llvm.mlir.constant(63 : i32) {latency = 1 : i32} : i32
    %13 = llvm.mlir.addressof @_ZZ4mainE1A {latency = 1 : i32} : !llvm.ptr
    %14 = llvm.mlir.constant(4096 : i64) {latency = 1 : i32} : i64
    %15 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    "llvm.intr.memset"(%3, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%4 : i64) {latency = 1 : i32}
  ^bb1(%16: i64):  // 2 preds: ^bb0, ^bb1
    %17 = llvm.getelementptr inbounds %5[0, %16] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %18 = llvm.trunc %16 {latency = 1 : i32} : i64 to i32
    %19 = llvm.add %18, %6 {latency = 1 : i32} : i32
    llvm.store %19, %17 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.getelementptr inbounds %7[0, %16] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %21 = llvm.trunc %16 {latency = 1 : i32} : i64 to i32
    %22 = llvm.add %21, %8 {latency = 1 : i32} : i32
    llvm.store %22, %20 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %16, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %24 = llvm.icmp "eq" %23, %10 {latency = 1 : i32} : i64
    llvm.cond_br %24, ^bb2(%4 : i64), ^bb1(%23 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%25: i64):  // 2 preds: ^bb1, ^bb2
    %26 = llvm.trunc %25 {latency = 1 : i32} : i64 to i32
    %27 = llvm.lshr %26, %11 {latency = 1 : i32} : i32
    %28 = llvm.and %26, %12 {latency = 1 : i32} : i32
    %29 = llvm.mul %27, %28 overflow<nsw, nuw> {latency = 1 : i32} : i32
    %30 = llvm.and %29, %12 {latency = 1 : i32} : i32
    %31 = llvm.getelementptr inbounds %13[0, %25] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    llvm.store %30, %31 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %32 = llvm.add %25, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %33 = llvm.icmp "eq" %32, %14 {latency = 1 : i32} : i64
    llvm.cond_br %33, ^bb3, ^bb2(%32 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %34 = func.call @_Z6kernelPiS_PKiS1_S1_(%0, %3, %13, %5, %7) {latency = 1 : i32} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.void
    llvm.return {latency = 1 : i32} %15 : i32
  }
  func.func @_Z6kernelPiS_PKiS1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 64 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %1 = neura.reserve : !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = neura.reserve : !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %8 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %12 = "neura.fused_op"(%11) <{frequency = 5 : i64, pattern_id = 14 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %276 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%277 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %13 = "neura.data_mov"(%12) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %14 = "neura.data_mov"(%12) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = "neura.fused_op"(%15) <{frequency = 5 : i64, pattern_id = 14 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %276 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %20 = "neura.fused_op"(%19) <{frequency = 5 : i64, pattern_id = 14 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %276 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%277 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %21 = "neura.data_mov"(%20) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = "neura.data_mov"(%20) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24:2 = "neura.fused_op"(%10, %23) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %276 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.phi_start %276, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%277, %278 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %25 = "neura.data_mov"(%24#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.data_mov"(%24#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.data_mov"(%24#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.data_mov"(%24#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = "neura.data_mov"(%24#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.data_mov"(%24#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = "neura.gep"(%22, %30) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %32 = "neura.shl"(%29, %18) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = "neura.gep"(%14, %28) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %36 = neura.phi_start %13, %35 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %37 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %38 = neura.phi_start %21, %37 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = "neura.fused_op"(%2, %40) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %276 = "neura.grant_once"() <{constant_value = 60 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.phi_start %277, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%278 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %42 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = "neura.fused_op"(%3, %45) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %276 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.phi_start %277, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%278 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = "neura.data_mov"(%46) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %48 = "neura.data_mov"(%46) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %49 = "neura.data_mov"(%46) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = "neura.fused_op"(%4, %50) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %276 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.phi_start %277, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%278 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %53 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = neura.reserve : !neura.data<i64, i1>
    %56 = "neura.fused_op"(%5, %55) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %276 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.phi_start %277, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%278 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.data_mov"(%56) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = "neura.data_mov"(%56) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.data_mov"(%56) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61 = "neura.fused_op"(%6, %60) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %276 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.phi_start %277, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%278 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62 = "neura.data_mov"(%61) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %63 = "neura.data_mov"(%61) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64 = "neura.data_mov"(%61) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %66 = neura.reserve : !neura.data<i64, i1>
    %67 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %68 = "neura.fused_op"(%7, %67) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %276 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %278 = neura.phi_start %277, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%278 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %69 = "neura.data_mov"(%68) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.data_mov"(%68) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.data_mov"(%68) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = "neura.data_mov"(%68) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %73 = "neura.data_mov"(%68) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %74 = "neura.data_mov"(%68) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %75 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %76 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %77 = "neura.fused_op"(%8, %76) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %276 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %278 = neura.phi_start %277, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%278 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %78 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %80 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %81 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %82 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %86 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = neura.reserve : !neura.data<i64, i1>
    %89 = neura.phi_start %27, %88 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %90 = neura.reserve : !neura.data<i64, i1>
    %91 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %92 = "neura.fused_op"(%9, %91) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %276 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %278 = neura.phi_start %277, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%278 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %93 = "neura.data_mov"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %94 = "neura.data_mov"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %95 = "neura.data_mov"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %96 = "neura.data_mov"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %97 = "neura.data_mov"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %98 = "neura.data_mov"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %99 = neura.reserve : !neura.data<i64, i1>
    %100:2 = "neura.fused_op"(%26, %99, %49) <{frequency = 3 : i64, pattern_id = 15 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %276 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %277 = "neura.add"(%276, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%276, %277 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %101 = "neura.data_mov"(%100#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = "neura.data_mov"(%100#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %103 = "neura.data_mov"(%100#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %104 = "neura.data_mov"(%100#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %105 = "neura.data_mov"(%100#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %106 = "neura.data_mov"(%100#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %107 = "neura.data_mov"(%100#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %108 = "neura.data_mov"(%100#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %109 = "neura.data_mov"(%32) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %110:4 = "neura.fused_op"(%109, %66, %107, %59) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->add->fused_op:or->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %276 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %277 = "neura.add"(%arg7, %276) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %278 = "neura.or"(%arg7, %arg8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %279 = "neura.add"(%278, %276) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%276, %277, %278, %279 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %111 = "neura.data_mov"(%110#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %112 = "neura.data_mov"(%110#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %113 = "neura.data_mov"(%110#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %114 = "neura.data_mov"(%110#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %115 = "neura.data_mov"(%110#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %116 = "neura.data_mov"(%110#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %117 = "neura.data_mov"(%110#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %118 = "neura.data_mov"(%110#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %119 = "neura.data_mov"(%33) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %120:3 = "neura.fused_op"(%119, %65, %87, %114, %74, %106) <{frequency = 8 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->fused_op:fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<i64, i1>):
      %276 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = "neura.gep"(%arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %278 = "neura.load"(%277) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %279 = "neura.load"(%276) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %280 = "neura.mul"(%279, %278) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %281 = "neura.gep"(%arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %282 = "neura.load"(%281) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %283 = "neura.add"(%280, %282) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%276, %281, %283 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %121 = "neura.data_mov"(%120#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %122 = "neura.data_mov"(%120#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %123 = "neura.data_mov"(%120#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %124 = "neura.data_mov"(%120#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %125 = "neura.data_mov"(%120#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %126 = "neura.data_mov"(%120#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %127:3 = "neura.fused_op"(%105, %64, %113, %86, %124, %73) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:or->add->fused_op:fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<!llvm.ptr, i1>):
      %276 = "neura.or"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %277 = "neura.add"(%276, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %278 = "neura.gep"(%arg8, %277) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %279 = "neura.load"(%278) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %280 = "neura.load"(%arg9) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %281 = "neura.mul"(%280, %279) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %282 = "neura.gep"(%arg10, %276) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %283 = "neura.load"(%282) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %284 = "neura.add"(%281, %283) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%276, %282, %284 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %128 = "neura.data_mov"(%127#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %129 = "neura.data_mov"(%127#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %130 = "neura.data_mov"(%127#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %131 = "neura.data_mov"(%127#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %132:3 = "neura.fused_op"(%104, %54, %112, %85, %123, %72) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:or->add->fused_op:fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<!llvm.ptr, i1>):
      %276 = "neura.or"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %277 = "neura.add"(%276, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %278 = "neura.gep"(%arg8, %277) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %279 = "neura.load"(%278) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %280 = "neura.load"(%arg9) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %281 = "neura.mul"(%280, %279) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %282 = "neura.gep"(%arg10, %276) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %283 = "neura.load"(%282) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %284 = "neura.add"(%281, %283) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%276, %282, %284 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %133 = "neura.data_mov"(%132#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134 = "neura.data_mov"(%132#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %135 = "neura.data_mov"(%132#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %136 = "neura.data_mov"(%132#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %137:2 = "neura.fused_op"(%84, %118, %122, %71, %117) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %276 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %277 = "neura.load"(%276) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %278 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %279 = "neura.mul"(%278, %277) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %280 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %281 = "neura.load"(%280) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %282 = "neura.add"(%279, %281) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%280, %282 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %138 = "neura.data_mov"(%137#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %139 = "neura.data_mov"(%137#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %140 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %141:3 = "neura.fused_op"(%17, %90, %129, %140, %103) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:phi_start->fused_op:shl->add->fused_op:shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i64, i1>):
      %276 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %277 = "neura.shl"(%arg7, %276) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %278 = "neura.add"(%277, %arg8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %279 = "neura.shl"(%arg9, %276) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %280 = "neura.add"(%279, %arg8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%276, %278, %280 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %142 = "neura.data_mov"(%141#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %143 = "neura.data_mov"(%141#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %144 = "neura.data_mov"(%141#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %145 = "neura.data_mov"(%141#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %146 = "neura.data_mov"(%141#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %147 = "neura.data_mov"(%141#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %148 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %149:5 = "neura.fused_op"(%102, %44, %108, %98, %145, %148) <{frequency = 13 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>, %arg10: !neura.data<i64, i1>):
      %276 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %277 = neura.grant_predicate %arg7, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %278 = neura.grant_predicate %arg8, %276 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %279 = neura.grant_predicate %arg9, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %280 = neura.grant_predicate %arg10, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277, %278, %279, %280 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %150 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %151 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %152 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %153 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %154 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %155 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %156 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %157 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %158 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %159 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %160 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %161 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %162 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %163 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %164 = "neura.data_mov"(%149#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %165 = "neura.data_mov"(%149#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %166 = "neura.data_mov"(%149#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %167 = "neura.data_mov"(%149#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %168 = "neura.data_mov"(%149#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %169 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %170:3 = "neura.fused_op"(%169, %75, %83, %146, %97, %128) <{frequency = 8 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->fused_op:fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<i64, i1>):
      %276 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = "neura.gep"(%arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %278 = "neura.load"(%277) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %279 = "neura.load"(%276) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %280 = "neura.mul"(%279, %278) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %281 = "neura.gep"(%arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %282 = "neura.load"(%281) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %283 = "neura.add"(%280, %282) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%276, %281, %283 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %171 = "neura.data_mov"(%170#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %172 = "neura.data_mov"(%170#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %173 = "neura.data_mov"(%170#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %174 = "neura.data_mov"(%170#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %175 = "neura.data_mov"(%170#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %176 = "neura.data_mov"(%170#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %177:2 = "neura.fused_op"(%82, %147, %174, %96, %101) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %276 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %277 = "neura.load"(%276) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %278 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %279 = "neura.mul"(%278, %277) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %280 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %281 = "neura.load"(%280) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %282 = "neura.add"(%279, %281) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%280, %282 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %178 = "neura.data_mov"(%177#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %179 = "neura.data_mov"(%177#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%179, %178) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%126, %125) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%176, %175) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%131, %130) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %180 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %181 = "neura.fused_op"(%116, %144, %180) <{frequency = 4 : i64, pattern_id = 19 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %276 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %277 = "neura.add"(%276, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %182 = "neura.data_mov"(%181) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %183:2 = "neura.fused_op"(%81, %182, %173, %95, %115) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %276 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %277 = "neura.load"(%276) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %278 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %279 = "neura.mul"(%278, %277) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %280 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %281 = "neura.load"(%280) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %282 = "neura.add"(%279, %281) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%280, %282 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %184 = "neura.data_mov"(%183#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %185 = "neura.data_mov"(%183#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%185, %184) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%139, %138) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %186 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %187 = "neura.fused_op"(%134, %143, %186) <{frequency = 4 : i64, pattern_id = 19 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %276 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %277 = "neura.add"(%276, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %188 = "neura.data_mov"(%187) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %189:2 = "neura.fused_op"(%80, %188, %172, %94, %133) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %276 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %277 = "neura.load"(%276) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %278 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %279 = "neura.mul"(%278, %277) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %280 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %281 = "neura.load"(%280) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %282 = "neura.add"(%279, %281) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%280, %282 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %190 = "neura.data_mov"(%189#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %191 = "neura.data_mov"(%189#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%191, %190) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%136, %135) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %192 = "neura.data_mov"(%0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %193:2 = "neura.fused_op"(%192, %1, %39, %164) <{frequency = 11 : i64, pattern_id = 11 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i1, i1>):
      %276 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.grant_predicate %277, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%277, %278 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %194 = "neura.data_mov"(%193#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %195 = "neura.data_mov"(%193#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %196 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %197:4 = "neura.fused_op"(%163, %196, %63, %194) <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %276 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %277 = neura.grant_predicate %arg6, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %278 = neura.grant_predicate %arg7, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %279 = neura.grant_predicate %arg8, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277, %278, %279 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %198 = "neura.data_mov"(%197#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %199 = "neura.data_mov"(%197#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %200 = "neura.data_mov"(%197#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %201 = "neura.data_mov"(%197#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %202 = "neura.data_mov"(%197#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %203 = "neura.data_mov"(%197#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %204 = "neura.data_mov"(%197#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %205 = "neura.data_mov"(%197#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %206 = "neura.data_mov"(%197#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %207 = "neura.data_mov"(%197#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %208 = "neura.data_mov"(%197#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %209 = "neura.data_mov"(%197#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %210 = "neura.data_mov"(%197#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %211 = "neura.data_mov"(%197#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %212 = "neura.data_mov"(%197#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %213 = "neura.data_mov"(%197#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %214:2 = "neura.fused_op"(%25, %34, %162) <{frequency = 31 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>):
      %276 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %215 = "neura.data_mov"(%214#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %216 = "neura.data_mov"(%214#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %165 -> %99 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %166 -> %91 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %167 -> %90 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %168 -> %88 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %217 = neura.grant_predicate %79, %161 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %217 -> %76 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %218 = neura.grant_predicate %171, %160 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %218 -> %75 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %219 = neura.grant_predicate %70, %159 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %219 -> %67 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %220 = neura.grant_predicate %111, %158 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %220 -> %66 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %221 = neura.grant_predicate %121, %157 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %221 -> %65 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %222 = neura.grant_predicate %62, %156 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %222 -> %60 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %223 = neura.grant_predicate %58, %155 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %223 -> %55 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %224 = neura.grant_predicate %53, %154 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %224 -> %50 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %225 = neura.grant_predicate %48, %153 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %225 -> %45 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %226 = neura.grant_predicate %43, %152 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %226 -> %40 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %195 -> %39 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %227 = "neura.data_mov"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %228 = neura.grant_predicate %227, %151 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %228 -> %37 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %229 = "neura.data_mov"(%36) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %230 = neura.grant_predicate %229, %150 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %230 -> %35 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %216 -> %34 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %231 = neura.grant_predicate %215, %208 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %232 = "neura.add"(%209, %211) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %233 = "neura.data_mov"(%232) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %234:2 = "neura.fused_op"(%233, %213) <{frequency = 20 : i64, pattern_id = 4 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %276 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %277 = neura.grant_predicate %276, %276 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%276, %277 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %235 = "neura.data_mov"(%234#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %236 = "neura.data_mov"(%234#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %237 = "neura.data_mov"(%231) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %238 = "neura.data_mov"(%232) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %239:4 = "neura.fused_op"(%235, %237, %238, %42, %207) <{frequency = 20 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i1, i1>):
      %276 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %277 = neura.grant_predicate %arg6, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %278 = neura.grant_predicate %arg7, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %279 = neura.grant_predicate %arg8, %arg9 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %280 = neura.grant_predicate %279, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277, %278, %280 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %240 = "neura.data_mov"(%239#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %241 = "neura.data_mov"(%239#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %242 = "neura.data_mov"(%239#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %243 = "neura.data_mov"(%239#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %244 = "neura.data_mov"(%239#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %245 = "neura.data_mov"(%239#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %246 = "neura.data_mov"(%239#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %247 = "neura.data_mov"(%239#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %248 = "neura.data_mov"(%239#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %249 = "neura.data_mov"(%239#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %250 = "neura.data_mov"(%239#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %251 = "neura.data_mov"(%239#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %252 = "neura.data_mov"(%239#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %253 = "neura.data_mov"(%239#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %254 = "neura.fused_op"(%47, %206, %250) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %255 = "neura.data_mov"(%254) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %256 = "neura.fused_op"(%52, %205, %249) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %257 = "neura.data_mov"(%256) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %258 = "neura.fused_op"(%57, %204, %248) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %259 = "neura.data_mov"(%258) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %260 = "neura.fused_op"(%69, %203, %247) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%277 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %261 = "neura.data_mov"(%260) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %262 = "neura.fused_op"(%78, %202, %246) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%277 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %263 = "neura.data_mov"(%262) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %264 = "neura.fused_op"(%93, %201, %245) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%277 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %265 = "neura.data_mov"(%264) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %266 = "neura.data_mov"(%36) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %267 = "neura.fused_op"(%266, %200, %244) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%277 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %268 = "neura.data_mov"(%267) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %269 = "neura.fused_op"(%142, %199, %243) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %270 = "neura.data_mov"(%269) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %271 = "neura.data_mov"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %272 = "neura.fused_op"(%271, %198, %242) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%277 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %273 = "neura.data_mov"(%272) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %252 -> %23 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %273 -> %19 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %270 -> %15 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %268 -> %11 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %251 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %265 -> %9 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %263 -> %8 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %261 -> %7 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %274 = neura.grant_predicate %210, %241 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %274 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %259 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %257 -> %4 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %255 -> %3 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %253 -> %2 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %275 = neura.grant_predicate %212, %240 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %275 -> %1 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %236 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

