#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external @A(dense<0> : tensor<256x256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x array<256 x i32>>
  llvm.mlir.global external @r(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external @p(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external @s(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external @q(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.addressof @r {latency = 1 : i32} : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.constant(255 : i32) {latency = 1 : i32} : i32
    %4 = llvm.mlir.addressof @A {latency = 1 : i32} : !llvm.ptr
    %5 = llvm.mlir.constant(256 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.addressof @p {latency = 1 : i32} : !llvm.ptr
    %7 = llvm.mlir.addressof @s {latency = 1 : i32} : !llvm.ptr
    %8 = llvm.mlir.addressof @q {latency = 1 : i32} : !llvm.ptr
    %9 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb3
    %11 = llvm.getelementptr inbounds %1[0, %10] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %12 = llvm.trunc %10 {latency = 1 : i32} : i64 to i32
    llvm.store %12, %11 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb2(%0 : i64) {latency = 1 : i32}
  ^bb2(%13: i64):  // 2 preds: ^bb1, ^bb2
    %14 = llvm.add %13, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %15 = llvm.mul %14, %10 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %16 = llvm.trunc %15 {latency = 1 : i32} : i64 to i32
    %17 = llvm.and %16, %3 {latency = 1 : i32} : i32
    %18 = llvm.getelementptr inbounds %4[0, %10, %13] {latency = 1 : i32} : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    llvm.store %17, %18 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.icmp "eq" %14, %5 {latency = 1 : i32} : i64
    llvm.cond_br %19, ^bb3, ^bb2(%14 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %20 = llvm.add %10, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %21 = llvm.icmp "eq" %20, %5 {latency = 1 : i32} : i64
    llvm.cond_br %21, ^bb4(%0 : i64), ^bb1(%20 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4(%22: i64):  // 2 preds: ^bb3, ^bb4
    %23 = llvm.getelementptr inbounds %6[0, %22] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %24 = llvm.trunc %22 {latency = 1 : i32} : i64 to i32
    llvm.store %24, %23 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %22, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %26 = llvm.icmp "eq" %25, %5 {latency = 1 : i32} : i64
    llvm.cond_br %26, ^bb5, ^bb4(%25 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %27 = func.call @_Z6kernelPA256_iPiS1_S1_S1_(%4, %7, %8, %6, %1) {latency = 1 : i32} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.void
    llvm.return {latency = 1 : i32} %9 : i32
  }
  func.func @_Z6kernelPA256_iPiS1_S1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = 0 : i8}> {latency = 1 : i32} : () -> !neura.data<i8, i1>
    %2 = "neura.constant"() <{value = 1024 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 256 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    "neura.memset"(%0, %1, %2) <{is_volatile = false}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i64, i1>) -> ()
    %4 = neura.reserve : !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = "neura.fused_op"(%14) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%94 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<i32, i1>
    %17 = "neura.fused_op"(%16) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>):
      %93 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%94 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = "neura.fused_op"(%18) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%94 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21:2 = "neura.fused_op"(%13, %20) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %93 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %95 = neura.phi_start %93, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%94, %95 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %22 = "neura.gep"(%19, %21#1) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%17, %22) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %23 = "neura.gep"(%15, %21#1) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %26 = neura.phi_start %15, %25 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %27 = neura.reserve : !neura.data<i32, i1>
    %28 = neura.phi_start %17, %27 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %29 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %30 = neura.phi_start %19, %29 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %31 = neura.reserve : !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = "neura.fused_op"(%5, %32) <{frequency = 8 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %93 = "neura.grant_once"() <{constant_value = 252 : i64}> : () -> !neura.data<i64, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %95 = neura.phi_start %94, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%95 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = "neura.fused_op"(%6, %34) <{frequency = 8 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %93 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %95 = neura.phi_start %94, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%95 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = "neura.fused_op"(%7, %36) <{frequency = 8 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %93 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %95 = neura.phi_start %94, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%95 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = "neura.fused_op"(%8, %38) <{frequency = 8 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %93 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %95 = neura.phi_start %94, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%95 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = "neura.fused_op"(%9, %40) <{frequency = 8 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %93 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %95 = neura.phi_start %94, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%95 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %43 = "neura.fused_op"(%10, %42) <{frequency = 8 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %95 = neura.phi_start %94, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%95 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %45 = neura.phi_start %22, %44 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %46 = neura.reserve : !neura.data<i64, i1>
    %47 = neura.phi_start %21#1, %46 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %49 = "neura.fused_op"(%11, %48) <{frequency = 8 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %95 = neura.phi_start %94, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%95 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %50 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %51 = neura.phi_start %23, %50 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %52 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %53 = "neura.fused_op"(%12, %52) <{frequency = 8 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %94 = neura.phi_start %93, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %95 = neura.phi_start %94, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%95 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %54 = neura.reserve : !neura.data<i64, i1>
    %55:4 = "neura.fused_op"(%21#0, %54, %43, %37) <{frequency = 3 : i64, pattern_id = 11 : i64, pattern_name = "fused_op:phi_start->fused_op:gep->load->fused_op:or->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i64, i1>):
      %93 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %94 = "neura.gep"(%arg7, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %95 = "neura.load"(%94) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %96 = "neura.or"(%93, %arg8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %97 = "neura.gep"(%arg7, %96) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %98 = "neura.load"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%93, %95, %96, %98 : !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>)
    %56:3 = "neura.fused_op"(%49, %47, %55#0, %55#1, %45, %53, %51) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:gep->load->load->fused_op:mul->fused_op:load->add->fused_op:fused_op:gep->load->fused_op:load->fused_op:mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<!llvm.ptr, i1>, %arg11: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.gep"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %94 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %95 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %96 = "neura.mul"(%arg8, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %97 = "neura.load"(%arg9) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.add"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %99 = "neura.gep"(%arg10, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %101 = "neura.load"(%arg11) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %102 = "neura.mul"(%94, %101) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %103 = "neura.add"(%102, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%98, %99, %103 : !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %57:3 = "neura.fused_op"(%49, %47, %55#2, %55#3, %45, %53, %51) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:gep->load->load->fused_op:mul->fused_op:load->add->fused_op:fused_op:gep->load->fused_op:load->fused_op:mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<!llvm.ptr, i1>, %arg11: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.gep"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %94 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %95 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %96 = "neura.mul"(%arg8, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %97 = "neura.load"(%arg9) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.add"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %99 = "neura.gep"(%arg10, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %101 = "neura.load"(%arg11) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %102 = "neura.mul"(%94, %101) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %103 = "neura.add"(%102, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%98, %99, %103 : !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %58:2 = "neura.fused_op"(%55#0, %39, %43) <{frequency = 6 : i64, pattern_id = 14 : i64, pattern_name = "or->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.or"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %94 = "neura.gep"(%arg7, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %95 = "neura.load"(%94) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%93, %95 : !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>)
    %59:3 = "neura.fused_op"(%49, %47, %58#0, %58#1, %45, %53, %51) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:gep->load->load->fused_op:mul->fused_op:load->add->fused_op:fused_op:gep->load->fused_op:load->fused_op:mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<!llvm.ptr, i1>, %arg11: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.gep"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %94 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %95 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %96 = "neura.mul"(%arg8, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %97 = "neura.load"(%arg9) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.add"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %99 = "neura.gep"(%arg10, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %101 = "neura.load"(%arg11) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %102 = "neura.mul"(%94, %101) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %103 = "neura.add"(%102, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%98, %99, %103 : !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %60:2 = "neura.fused_op"(%55#0, %41, %43) <{frequency = 6 : i64, pattern_id = 14 : i64, pattern_name = "or->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.or"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %94 = "neura.gep"(%arg7, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %95 = "neura.load"(%94) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%93, %95 : !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>)
    %61:3 = "neura.fused_op"(%49, %47, %60#0, %60#1, %45, %53, %51) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:gep->load->load->fused_op:mul->fused_op:load->add->fused_op:fused_op:gep->load->fused_op:load->fused_op:mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<!llvm.ptr, i1>, %arg11: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.gep"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %94 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %95 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %96 = "neura.mul"(%arg8, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %97 = "neura.load"(%arg9) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.add"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %99 = "neura.gep"(%arg10, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %101 = "neura.load"(%arg11) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %102 = "neura.mul"(%94, %101) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %103 = "neura.add"(%102, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%98, %99, %103 : !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%56#2, %56#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%56#0, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%61#2, %61#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%61#0, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%59#2, %59#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%59#0, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%57#2, %57#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%57#0, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %62 = "neura.add"(%55#0, %35) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %63:5 = "neura.fused_op"(%55#0, %33, %62, %53, %51, %49) <{frequency = 12 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<!llvm.ptr, i1>):
      %93 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %94 = neura.grant_predicate %arg7, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %95 = neura.grant_predicate %arg8, %93 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %96 = neura.grant_predicate %arg9, %93 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %97 = neura.grant_predicate %arg10, %93 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%93, %94, %95, %96, %97 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %64:2 = "neura.fused_op"(%3, %4, %31, %63#0) <{frequency = 11 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i1, i1>):
      %93 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %94 = neura.phi_start %93, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %95 = neura.grant_predicate %94, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%94, %95 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %65:4 = "neura.fused_op"(%63#0, %47, %41, %64#0) <{frequency = 3 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %93 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %94 = neura.grant_predicate %arg6, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %95 = neura.grant_predicate %arg7, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %96 = neura.grant_predicate %arg8, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%93, %94, %95, %96 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %66:2 = "neura.fused_op"(%21#0, %24, %63#0) <{frequency = 30 : i64, pattern_id = 10 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>):
      %93 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %94 = neura.grant_predicate %93, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%93, %94 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    neura.ctrl_mov %63#1 -> %54 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %63#2 -> %52 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %63#3 -> %50 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %63#4 -> %48 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %67 = neura.grant_predicate %47, %63#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %67 -> %46 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %68 = neura.grant_predicate %45, %63#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %68 -> %44 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %69 = neura.grant_predicate %43, %63#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %69 -> %42 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %70 = neura.grant_predicate %41, %63#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %70 -> %40 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %71 = neura.grant_predicate %39, %63#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %71 -> %38 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %72 = neura.grant_predicate %37, %63#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %72 -> %36 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %73 = neura.grant_predicate %35, %63#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %73 -> %34 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %74 = neura.grant_predicate %33, %63#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %74 -> %32 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %64#1 -> %31 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %75 = neura.grant_predicate %30, %63#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %75 -> %29 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %76 = neura.grant_predicate %28, %63#0 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %76 -> %27 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %77 = neura.grant_predicate %26, %63#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %77 -> %25 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %66#1 -> %24 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %78 = neura.grant_predicate %66#0, %65#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %79 = "neura.add"(%65#1, %65#2) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80:2 = "neura.fused_op"(%79, %65#3) <{frequency = 19 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %93 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %94 = neura.grant_predicate %93, %93 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%93, %94 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %81:4 = "neura.fused_op"(%80#0, %78, %79, %33, %65#0) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i1, i1>):
      %93 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %94 = neura.grant_predicate %arg6, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %95 = neura.grant_predicate %arg7, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %96 = neura.grant_predicate %arg8, %arg9 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %97 = neura.grant_predicate %96, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%93, %94, %95, %97 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %82 = "neura.fused_op"(%35, %65#0, %81#0) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %93 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %94 = neura.grant_predicate %93, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%94 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %83 = "neura.fused_op"(%37, %65#0, %81#0) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %93 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %94 = neura.grant_predicate %93, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%94 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %84 = "neura.fused_op"(%39, %65#0, %81#0) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %93 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %94 = neura.grant_predicate %93, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%94 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %85 = "neura.fused_op"(%43, %65#0, %81#0) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %93 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %94 = neura.grant_predicate %93, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%94 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %86 = "neura.fused_op"(%49, %65#0, %81#0) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %93 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %94 = neura.grant_predicate %93, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%94 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = "neura.fused_op"(%53, %65#0, %81#0) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %93 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %94 = neura.grant_predicate %93, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%94 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = "neura.fused_op"(%26, %65#0, %81#0) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %93 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %94 = neura.grant_predicate %93, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%94 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %89 = "neura.fused_op"(%28, %65#0, %81#0) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %93 = neura.grant_predicate %arg5, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %94 = neura.grant_predicate %93, %arg7 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%94 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i32, i1>
    %90 = "neura.fused_op"(%30, %65#0, %81#0) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %93 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %94 = neura.grant_predicate %93, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%94 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %81#2 -> %20 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %90 -> %18 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %89 -> %16 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %88 -> %14 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %81#1 -> %13 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %87 -> %12 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %86 -> %11 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %85 -> %10 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %91 = neura.grant_predicate %65#2, %81#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %91 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %84 -> %8 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %83 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %82 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %81#3 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %92 = neura.grant_predicate %65#3, %81#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %92 -> %4 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %80#1 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

