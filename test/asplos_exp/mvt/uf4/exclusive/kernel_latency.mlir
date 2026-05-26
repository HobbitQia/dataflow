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
      %95 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%96 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = "neura.fused_op"(%13) <{frequency = 5 : i64, pattern_id = 14 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %95 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%96 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = "neura.fused_op"(%15) <{frequency = 5 : i64, pattern_id = 14 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %95 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%96 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18:2 = "neura.fused_op"(%10, %17) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %95 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %97 = neura.phi_start %95, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%96, %97 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %19 = "neura.gep"(%16, %18#1) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %20 = "neura.shl"(%18#1, %14) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21 = "neura.gep"(%12, %18#1) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %24 = neura.phi_start %12, %23 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %25 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %26 = neura.phi_start %16, %25 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %27 = neura.reserve : !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<i64, i1>
    %29 = "neura.fused_op"(%2, %28) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %95 = "neura.grant_once"() <{constant_value = 60 : i64}> : () -> !neura.data<i64, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %97 = neura.phi_start %96, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%97 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = "neura.fused_op"(%3, %30) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %95 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %97 = neura.phi_start %96, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%97 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = "neura.fused_op"(%4, %32) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %95 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %97 = neura.phi_start %96, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%97 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = "neura.fused_op"(%5, %34) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %95 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %97 = neura.phi_start %96, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%97 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = "neura.fused_op"(%6, %36) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %95 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %97 = neura.phi_start %96, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%97 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %41 = "neura.fused_op"(%7, %40) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %95 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %97 = neura.phi_start %96, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%97 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %42 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %43 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %44 = "neura.fused_op"(%8, %43) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %95 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %97 = neura.phi_start %96, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%97 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = neura.phi_start %18#1, %45 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %49 = "neura.fused_op"(%9, %48) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %95 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %96 = neura.phi_start %95, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %97 = neura.phi_start %96, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%97 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51:2 = "neura.fused_op"(%18#0, %50, %31) <{frequency = 3 : i64, pattern_id = 15 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %95 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %96 = "neura.add"(%95, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%95, %96 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %52:4 = "neura.fused_op"(%20, %39, %51#0, %35) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->add->fused_op:or->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %95 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %96 = "neura.add"(%arg7, %95) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %97 = "neura.or"(%arg7, %arg8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %98 = "neura.add"(%97, %95) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%95, %96, %97, %98 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %53:3 = "neura.fused_op"(%21, %38, %44, %52#1, %41, %51#0) <{frequency = 8 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->fused_op:fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<i64, i1>):
      %95 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %96 = "neura.gep"(%arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %97 = "neura.load"(%96) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.load"(%95) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %99 = "neura.mul"(%98, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %100 = "neura.gep"(%arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %101 = "neura.load"(%100) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %102 = "neura.add"(%99, %101) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%95, %100, %102 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %54:3 = "neura.fused_op"(%51#0, %37, %52#0, %44, %53#0, %41) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:or->add->fused_op:fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<!llvm.ptr, i1>):
      %95 = "neura.or"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %96 = "neura.add"(%95, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %97 = "neura.gep"(%arg8, %96) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %98 = "neura.load"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %99 = "neura.load"(%arg9) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %100 = "neura.mul"(%99, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %101 = "neura.gep"(%arg10, %95) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %102 = "neura.load"(%101) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %103 = "neura.add"(%100, %102) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%95, %101, %103 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %55:3 = "neura.fused_op"(%51#0, %33, %52#0, %44, %53#0, %41) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:or->add->fused_op:fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<!llvm.ptr, i1>):
      %95 = "neura.or"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %96 = "neura.add"(%95, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %97 = "neura.gep"(%arg8, %96) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %98 = "neura.load"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %99 = "neura.load"(%arg9) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %100 = "neura.mul"(%99, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %101 = "neura.gep"(%arg10, %95) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %102 = "neura.load"(%101) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %103 = "neura.add"(%100, %102) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%95, %101, %103 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %56:2 = "neura.fused_op"(%44, %52#3, %53#0, %41, %52#2) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %95 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %96 = "neura.load"(%95) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %97 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.mul"(%97, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %99 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %101 = "neura.add"(%98, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%99, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %57:3 = "neura.fused_op"(%14, %47, %54#0, %46, %51#0) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:phi_start->fused_op:shl->add->fused_op:shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i64, i1>):
      %95 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %96 = "neura.shl"(%arg7, %95) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %97 = "neura.add"(%96, %arg8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %98 = "neura.shl"(%arg9, %95) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %99 = "neura.add"(%98, %arg8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%95, %97, %99 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %58:5 = "neura.fused_op"(%51#0, %29, %51#1, %49, %57#0, %46) <{frequency = 13 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>, %arg10: !neura.data<i64, i1>):
      %95 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %96 = neura.grant_predicate %arg7, %95 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %97 = neura.grant_predicate %arg8, %95 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %98 = neura.grant_predicate %arg9, %95 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %99 = neura.grant_predicate %arg10, %95 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%95, %96, %97, %98, %99 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %59:3 = "neura.fused_op"(%19, %42, %44, %57#1, %49, %54#0) <{frequency = 8 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->fused_op:fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<i64, i1>):
      %95 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %96 = "neura.gep"(%arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %97 = "neura.load"(%96) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.load"(%95) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %99 = "neura.mul"(%98, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %100 = "neura.gep"(%arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %101 = "neura.load"(%100) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %102 = "neura.add"(%99, %101) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%95, %100, %102 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %60:2 = "neura.fused_op"(%44, %57#2, %59#0, %49, %51#0) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %95 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %96 = "neura.load"(%95) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %97 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.mul"(%97, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %99 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %101 = "neura.add"(%98, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%99, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%60#1, %60#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%53#2, %53#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%59#2, %59#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%54#2, %54#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %61 = "neura.fused_op"(%52#2, %57#0, %46) <{frequency = 4 : i64, pattern_id = 19 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %95 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %96 = "neura.add"(%95, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%96 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62:2 = "neura.fused_op"(%44, %61, %59#0, %49, %52#2) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %95 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %96 = "neura.load"(%95) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %97 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.mul"(%97, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %99 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %101 = "neura.add"(%98, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%99, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%62#1, %62#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%56#1, %56#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %63 = "neura.fused_op"(%55#0, %57#0, %46) <{frequency = 4 : i64, pattern_id = 19 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %95 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %96 = "neura.add"(%95, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%96 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64:2 = "neura.fused_op"(%44, %63, %59#0, %49, %55#0) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %95 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %96 = "neura.load"(%95) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %97 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.mul"(%97, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %99 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %101 = "neura.add"(%98, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%99, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%64#1, %64#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%55#2, %55#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %65:2 = "neura.fused_op"(%0, %1, %27, %58#0) <{frequency = 11 : i64, pattern_id = 11 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i1, i1>):
      %95 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %96 = neura.phi_start %95, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %97 = neura.grant_predicate %96, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%96, %97 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %66:4 = "neura.fused_op"(%58#0, %46, %37, %65#0) <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %95 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %96 = neura.grant_predicate %arg6, %95 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %97 = neura.grant_predicate %arg7, %95 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %98 = neura.grant_predicate %arg8, %95 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%95, %96, %97, %98 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %67:2 = "neura.fused_op"(%18#0, %22, %58#0) <{frequency = 31 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>):
      %95 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %96 = neura.grant_predicate %95, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%95, %96 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    neura.ctrl_mov %58#1 -> %50 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %58#2 -> %48 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %58#3 -> %47 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %58#4 -> %45 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %68 = neura.grant_predicate %44, %58#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %68 -> %43 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %69 = neura.grant_predicate %59#0, %58#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %69 -> %42 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %70 = neura.grant_predicate %41, %58#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %70 -> %40 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %71 = neura.grant_predicate %52#0, %58#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %71 -> %39 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %72 = neura.grant_predicate %53#0, %58#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %72 -> %38 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %73 = neura.grant_predicate %37, %58#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %73 -> %36 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %74 = neura.grant_predicate %35, %58#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %74 -> %34 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %75 = neura.grant_predicate %33, %58#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %75 -> %32 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %76 = neura.grant_predicate %31, %58#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %76 -> %30 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %77 = neura.grant_predicate %29, %58#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %77 -> %28 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %65#1 -> %27 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %78 = neura.grant_predicate %26, %58#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %78 -> %25 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %79 = neura.grant_predicate %24, %58#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %79 -> %23 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %67#1 -> %22 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %80 = neura.grant_predicate %67#0, %66#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %81 = "neura.add"(%66#1, %66#2) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82:2 = "neura.fused_op"(%81, %66#3) <{frequency = 20 : i64, pattern_id = 4 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %95 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %96 = neura.grant_predicate %95, %95 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%95, %96 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %83:4 = "neura.fused_op"(%82#0, %80, %81, %29, %66#0) <{frequency = 20 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i1, i1>):
      %95 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %96 = neura.grant_predicate %arg6, %95 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %97 = neura.grant_predicate %arg7, %95 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %98 = neura.grant_predicate %arg8, %arg9 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %99 = neura.grant_predicate %98, %95 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%95, %96, %97, %99 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %84 = "neura.fused_op"(%31, %66#0, %83#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %95 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %96 = neura.grant_predicate %95, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%96 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %85 = "neura.fused_op"(%33, %66#0, %83#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %95 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %96 = neura.grant_predicate %95, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%96 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %86 = "neura.fused_op"(%35, %66#0, %83#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %95 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %96 = neura.grant_predicate %95, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%96 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %87 = "neura.fused_op"(%41, %66#0, %83#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %95 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %96 = neura.grant_predicate %95, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%96 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = "neura.fused_op"(%44, %66#0, %83#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %95 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %96 = neura.grant_predicate %95, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%96 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %89 = "neura.fused_op"(%49, %66#0, %83#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %95 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %96 = neura.grant_predicate %95, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%96 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %90 = "neura.fused_op"(%24, %66#0, %83#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %95 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %96 = neura.grant_predicate %95, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%96 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %91 = "neura.fused_op"(%57#0, %66#0, %83#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %95 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %96 = neura.grant_predicate %95, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%96 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %92 = "neura.fused_op"(%26, %66#0, %83#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %95 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %96 = neura.grant_predicate %95, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%96 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %83#2 -> %17 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %92 -> %15 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %91 -> %13 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %90 -> %11 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %83#1 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %89 -> %9 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %88 -> %8 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %87 -> %7 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %93 = neura.grant_predicate %66#2, %83#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %93 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %86 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %85 -> %4 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %84 -> %3 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %83#3 -> %2 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %94 = neura.grant_predicate %66#3, %83#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %94 -> %1 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %82#1 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

