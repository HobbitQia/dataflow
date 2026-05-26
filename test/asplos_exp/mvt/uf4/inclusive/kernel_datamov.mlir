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
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 2 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 3 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 4 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 60 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %18 = "neura.fused_op"(%17) <{frequency = 5 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %312 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %313 = neura.phi_start %312, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%313 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %19 = "neura.data_mov"(%18) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %20 = "neura.data_mov"(%18) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = "neura.fused_op"(%21) <{frequency = 5 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %312 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %313 = neura.phi_start %312, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%313 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %26 = "neura.fused_op"(%25) <{frequency = 5 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %312 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %313 = neura.phi_start %312, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%313 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %27 = "neura.data_mov"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = "neura.data_mov"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30:2 = "neura.fused_op"(%16, %29) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %312 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %313 = neura.phi_start %312, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %314 = neura.phi_start %312, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%313, %314 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %31 = "neura.data_mov"(%30#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = "neura.data_mov"(%30#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = "neura.data_mov"(%30#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %34 = "neura.data_mov"(%30#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %35 = "neura.data_mov"(%30#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = "neura.data_mov"(%30#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = "neura.gep"(%28, %36) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = "neura.shl"(%35, %24) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = "neura.gep"(%20, %34) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %42 = neura.phi_start %19, %41 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %43 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %44 = neura.phi_start %27, %43 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = "neura.fused_op"(%7, %45) <{frequency = 9 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %312 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %313 = neura.phi_start %312, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %314 = neura.phi_start %313, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%314 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = "neura.data_mov"(%46) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %48 = "neura.data_mov"(%46) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %49 = neura.reserve : !neura.data<i64, i1>
    %50 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.fused_op"(%50, %8, %49) <{frequency = 15 : i64, pattern_id = 15 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %312 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %313 = neura.phi_start %312, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%313 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %53 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = neura.reserve : !neura.data<i64, i1>
    %56 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.fused_op"(%56, %9, %55) <{frequency = 15 : i64, pattern_id = 15 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %312 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %313 = neura.phi_start %312, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%313 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = "neura.data_mov"(%57) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.data_mov"(%57) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.data_mov"(%57) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = neura.reserve : !neura.data<i64, i1>
    %62 = neura.reserve : !neura.data<i64, i1>
    %63 = neura.reserve : !neura.data<i64, i1>
    %64 = "neura.fused_op"(%12, %63) <{frequency = 9 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %312 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %313 = neura.phi_start %312, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %314 = neura.phi_start %313, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%314 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.data_mov"(%64) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.data_mov"(%64) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = "neura.data_mov"(%64) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %69 = "neura.data_mov"(%39) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = neura.phi_start %69, %68 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %71 = neura.reserve : !neura.data<i64, i1>
    %72 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %73 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %74 = "neura.data_mov"(%37) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %75 = neura.phi_start %74, %73 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %76 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %77 = neura.reserve : !neura.data<i64, i1>
    %78 = neura.phi_start %33, %77 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %79 = neura.reserve : !neura.data<i64, i1>
    %80 = neura.phi_start %23, %79 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %81 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %82 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.fused_op"(%82, %15, %81) <{frequency = 15 : i64, pattern_id = 15 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %312 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %313 = neura.phi_start %312, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%313 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.data_mov"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85 = "neura.data_mov"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %86 = "neura.data_mov"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = "neura.data_mov"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = "neura.data_mov"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %89 = "neura.data_mov"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %90 = neura.reserve : !neura.data<i64, i1>
    %91:2 = "neura.fused_op"(%32, %90, %60) <{frequency = 6 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %312 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %313 = "neura.add"(%312, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%312, %313 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %92 = "neura.data_mov"(%91#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %93 = "neura.data_mov"(%91#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %94 = "neura.data_mov"(%91#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %95 = "neura.data_mov"(%91#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96 = "neura.data_mov"(%91#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %97 = "neura.data_mov"(%91#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.data_mov"(%91#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %99 = "neura.data_mov"(%91#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100 = "neura.data_mov"(%91#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %101 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102:4 = "neura.fused_op"(%99, %54, %100, %89, %101) <{frequency = 15 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %312 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %313 = neura.grant_predicate %arg7, %312 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %314 = neura.grant_predicate %arg8, %312 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %315 = neura.grant_predicate %arg9, %312 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%312, %313, %314, %315 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    %103 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %104 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %105 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %106 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %107 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %108 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %109 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %110 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %111 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %112 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %113 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %114 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %115 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %116 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %117 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %118 = "neura.data_mov"(%102#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %119 = "neura.data_mov"(%102#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %120 = "neura.data_mov"(%102#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %121 = "neura.data_mov"(%102#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %122 = "neura.data_mov"(%4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %123:2 = "neura.fused_op"(%122, %10, %61, %118) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i1, i1>):
      %312 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %313 = neura.phi_start %312, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %314 = neura.grant_predicate %313, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%313, %314 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %124 = "neura.data_mov"(%123#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %125 = "neura.data_mov"(%123#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %126 = "neura.data_mov"(%123#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %127 = "neura.data_mov"(%3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %128:2 = "neura.fused_op"(%127, %11, %62, %117) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i1, i1>):
      %312 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %313 = neura.phi_start %312, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %314 = neura.grant_predicate %313, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%313, %314 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %129 = "neura.data_mov"(%128#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %130 = "neura.data_mov"(%128#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %131 = "neura.data_mov"(%128#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %132 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %133:2 = "neura.fused_op"(%132, %13, %72, %116) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i1, i1>):
      %312 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %313 = neura.phi_start %312, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %314 = neura.grant_predicate %313, %arg8 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%313, %314 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %134 = "neura.data_mov"(%133#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %135 = "neura.data_mov"(%133#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %136 = "neura.data_mov"(%133#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %137 = "neura.data_mov"(%133#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %138 = "neura.data_mov"(%133#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %139 = "neura.data_mov"(%133#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %140 = "neura.data_mov"(%2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %141:2 = "neura.fused_op"(%140, %14, %76, %115) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i1, i1>):
      %312 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %313 = neura.phi_start %312, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %314 = neura.grant_predicate %313, %arg8 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%313, %314 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %142 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %143 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %144 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %145 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %146 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %147 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %148 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %149 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %150 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %151 = "neura.data_mov"(%141#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %152 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %153:2 = "neura.fused_op"(%152, %71, %98) <{frequency = 6 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %312 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %313 = "neura.add"(%arg7, %312) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%312, %313 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %154 = "neura.data_mov"(%153#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %155 = "neura.data_mov"(%153#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %156 = "neura.data_mov"(%153#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %157 = "neura.data_mov"(%153#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %158 = "neura.data_mov"(%153#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %159 = "neura.data_mov"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %160:2 = "neura.fused_op"(%150, %158, %159, %138, %97) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %312 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %313 = "neura.load"(%312) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %314 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %315 = "neura.mul"(%314, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %316 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %317 = "neura.load"(%316) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %318 = "neura.add"(%315, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%316, %318 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %161 = "neura.data_mov"(%160#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %162 = "neura.data_mov"(%160#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %163 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %164 = "neura.data_mov"(%78) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %165 = "neura.fused_op"(%96, %163, %164) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %312 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %313 = "neura.add"(%312, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%313 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %166 = "neura.data_mov"(%165) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %167 = "neura.data_mov"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %168:2 = "neura.fused_op"(%149, %166, %167, %88, %95) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %312 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %313 = "neura.load"(%312) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %314 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %315 = "neura.mul"(%314, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %316 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %317 = "neura.load"(%316) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %318 = "neura.add"(%315, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%316, %318 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %169 = "neura.data_mov"(%168#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %170 = "neura.data_mov"(%168#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%170, %169) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%162, %161) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %171 = "neura.or"(%94, %67) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %172 = "neura.data_mov"(%171) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %173 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %174 = "neura.data_mov"(%78) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %175 = "neura.fused_op"(%172, %173, %174) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %312 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %313 = "neura.add"(%312, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%313 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %176 = "neura.data_mov"(%175) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %177 = "neura.data_mov"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %178 = "neura.data_mov"(%171) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %179:2 = "neura.fused_op"(%148, %176, %177, %87, %178) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %312 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %313 = "neura.load"(%312) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %314 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %315 = "neura.mul"(%314, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %316 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %317 = "neura.load"(%316) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %318 = "neura.add"(%315, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%316, %318 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %180 = "neura.data_mov"(%179#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %181 = "neura.data_mov"(%179#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%181, %180) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %182 = "neura.data_mov"(%171) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %183 = "neura.add"(%182, %157) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %184 = "neura.data_mov"(%183) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %185 = "neura.data_mov"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %186 = "neura.data_mov"(%171) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %187:2 = "neura.fused_op"(%147, %184, %185, %137, %186) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %312 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %313 = "neura.load"(%312) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %314 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %315 = "neura.mul"(%314, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %316 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %317 = "neura.load"(%316) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %318 = "neura.add"(%315, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%316, %318 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %188 = "neura.data_mov"(%187#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %189 = "neura.data_mov"(%187#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%189, %188) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %190 = "neura.or"(%93, %130) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %191 = "neura.data_mov"(%190) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %192 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %193 = "neura.data_mov"(%78) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %194 = "neura.fused_op"(%191, %192, %193) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %312 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %313 = "neura.add"(%312, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%313 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %195 = "neura.data_mov"(%194) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %196 = "neura.data_mov"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %197 = "neura.data_mov"(%190) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %198:2 = "neura.fused_op"(%146, %195, %196, %86, %197) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %312 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %313 = "neura.load"(%312) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %314 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %315 = "neura.mul"(%314, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %316 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %317 = "neura.load"(%316) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %318 = "neura.add"(%315, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%316, %318 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %199 = "neura.data_mov"(%198#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %200 = "neura.data_mov"(%198#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%200, %199) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %201 = "neura.data_mov"(%190) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %202 = "neura.add"(%201, %156) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %203 = "neura.data_mov"(%202) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %204 = "neura.data_mov"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %205 = "neura.data_mov"(%190) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %206:2 = "neura.fused_op"(%145, %203, %204, %136, %205) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %312 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %313 = "neura.load"(%312) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %314 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %315 = "neura.mul"(%314, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %316 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %317 = "neura.load"(%316) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %318 = "neura.add"(%315, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%316, %318 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %207 = "neura.data_mov"(%206#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %208 = "neura.data_mov"(%206#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%208, %207) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %209 = "neura.or"(%92, %125) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %210 = "neura.data_mov"(%209) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %211 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %212 = "neura.data_mov"(%78) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %213 = "neura.fused_op"(%210, %211, %212) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %312 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %313 = "neura.add"(%312, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%313 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %214 = "neura.data_mov"(%213) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %215 = "neura.data_mov"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %216 = "neura.data_mov"(%209) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %217:2 = "neura.fused_op"(%144, %214, %215, %85, %216) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %312 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %313 = "neura.load"(%312) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %314 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %315 = "neura.mul"(%314, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %316 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %317 = "neura.load"(%316) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %318 = "neura.add"(%315, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%316, %318 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %218 = "neura.data_mov"(%217#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %219 = "neura.data_mov"(%217#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%219, %218) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %220 = "neura.data_mov"(%209) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %221 = "neura.add"(%220, %155) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %222 = "neura.data_mov"(%221) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %223 = "neura.data_mov"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %224 = "neura.data_mov"(%209) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %225:2 = "neura.fused_op"(%143, %222, %223, %135, %224) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %312 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %313 = "neura.load"(%312) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %314 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %315 = "neura.mul"(%314, %313) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %316 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %317 = "neura.load"(%316) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %318 = "neura.add"(%315, %317) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%316, %318 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %226 = "neura.data_mov"(%225#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %227 = "neura.data_mov"(%225#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%227, %226) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %228 = "neura.data_mov"(%78) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %229:3 = "neura.fused_op"(%114, %228, %66) <{frequency = 6 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:not->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %312 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %313 = neura.grant_predicate %arg6, %312 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %314 = neura.grant_predicate %arg7, %312 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%312, %313, %314 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %230 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %231 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %232 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %233 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %234 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %235 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %236 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %237 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %238 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %239 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %240 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %241 = "neura.data_mov"(%229#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %242 = "neura.data_mov"(%229#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %243 = "neura.data_mov"(%229#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %244 = "neura.data_mov"(%229#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %245:2 = "neura.fused_op"(%31, %40, %113) <{frequency = 31 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>):
      %312 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %313 = neura.grant_predicate %312, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%312, %313 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %246 = "neura.data_mov"(%245#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %247 = "neura.data_mov"(%245#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %119 -> %90 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %120 -> %81 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %121 -> %79 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %248 = "neura.data_mov"(%78) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %249 = neura.grant_predicate %248, %112 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %249 -> %77 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %151 -> %76 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %250 = "neura.data_mov"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %251 = neura.grant_predicate %250, %111 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %251 -> %73 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %139 -> %72 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %252 = neura.grant_predicate %154, %110 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %252 -> %71 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %253 = "neura.data_mov"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %254 = neura.grant_predicate %253, %109 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %254 -> %68 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %255 = neura.grant_predicate %65, %108 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %255 -> %63 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %131 -> %62 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %126 -> %61 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %256 = neura.grant_predicate %59, %107 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %256 -> %55 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %257 = neura.grant_predicate %53, %106 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %257 -> %49 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %258 = neura.grant_predicate %48, %105 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %258 -> %45 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %259 = "neura.data_mov"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %260 = neura.grant_predicate %259, %104 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %260 -> %43 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %261 = "neura.data_mov"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %262 = neura.grant_predicate %261, %103 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %262 -> %41 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %247 -> %40 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %263 = neura.grant_predicate %47, %241 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %264 = neura.grant_predicate %246, %240 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %265 = "neura.add"(%242, %244) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %266 = "neura.data_mov"(%265) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %267 = "neura.data_mov"(%263) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %268:2 = "neura.fused_op"(%266, %267) <{frequency = 20 : i64, pattern_id = 4 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %312 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %313 = neura.grant_predicate %312, %312 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%312, %313 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %269 = "neura.data_mov"(%268#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %270 = "neura.data_mov"(%268#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %271 = "neura.data_mov"(%264) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %272 = "neura.data_mov"(%265) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %273:4 = "neura.fused_op"(%269, %271, %272, %52, %239) <{frequency = 20 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i1, i1>):
      %312 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %313 = neura.grant_predicate %arg6, %312 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %314 = neura.grant_predicate %arg7, %312 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %315 = neura.grant_predicate %arg8, %arg9 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %316 = neura.grant_predicate %315, %312 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%312, %313, %314, %316 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %274 = "neura.data_mov"(%273#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %275 = "neura.data_mov"(%273#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %276 = "neura.data_mov"(%273#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %277 = "neura.data_mov"(%273#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %278 = "neura.data_mov"(%273#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %279 = "neura.data_mov"(%273#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %280 = "neura.data_mov"(%273#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %281 = "neura.data_mov"(%273#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %282 = "neura.data_mov"(%273#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %283 = "neura.data_mov"(%273#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %284 = "neura.data_mov"(%273#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %285 = "neura.data_mov"(%273#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %286 = "neura.data_mov"(%273#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %287 = "neura.data_mov"(%273#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %288 = "neura.fused_op"(%58, %238, %284) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %312 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %313 = neura.grant_predicate %312, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%313 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %289 = "neura.data_mov"(%288) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %290 = "neura.fused_op"(%124, %237, %283) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %312 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %313 = neura.grant_predicate %312, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%313 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %291 = "neura.data_mov"(%290) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %292 = "neura.fused_op"(%129, %236, %282) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %312 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %313 = neura.grant_predicate %312, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%313 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %293 = "neura.data_mov"(%292) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %294 = "neura.fused_op"(%134, %235, %281) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %312 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %313 = neura.grant_predicate %312, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%313 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %295 = "neura.data_mov"(%294) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %296 = "neura.fused_op"(%142, %234, %280) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %312 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %313 = neura.grant_predicate %312, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%313 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %297 = "neura.data_mov"(%296) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %298 = "neura.fused_op"(%84, %233, %279) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %312 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %313 = neura.grant_predicate %312, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%313 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %299 = "neura.data_mov"(%298) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %300 = "neura.data_mov"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %301 = "neura.fused_op"(%300, %232, %278) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %312 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %313 = neura.grant_predicate %312, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%313 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %302 = "neura.data_mov"(%301) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %303 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %304 = "neura.fused_op"(%303, %231, %277) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %312 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %313 = neura.grant_predicate %312, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%313 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %305 = "neura.data_mov"(%304) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %306 = "neura.data_mov"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %307 = "neura.fused_op"(%306, %230, %276) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %312 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %313 = neura.grant_predicate %312, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%313 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %308 = "neura.data_mov"(%307) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %286 -> %29 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %308 -> %25 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %305 -> %21 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %302 -> %17 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %285 -> %16 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %299 -> %15 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %297 -> %14 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %295 -> %13 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %309 = neura.grant_predicate %243, %275 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %309 -> %12 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %293 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %291 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %289 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %287 -> %8 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %310 = "neura.data_mov"(%263) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %311 = neura.grant_predicate %310, %274 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %311 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %270 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

