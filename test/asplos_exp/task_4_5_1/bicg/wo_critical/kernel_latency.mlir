#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external local_unnamed_addr @A(dense<0> : tensor<256x256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x array<256 x i32>>
  llvm.mlir.global external local_unnamed_addr @r(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @p(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @s(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @q(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.addressof @r {latency = 1 : i32} : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.constant(255 : i32) {latency = 1 : i32} : i32
    %4 = llvm.mlir.addressof @A {latency = 1 : i32} : !llvm.ptr
    %5 = llvm.mlir.constant(256 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.addressof @p {latency = 1 : i32} : !llvm.ptr
    %7 = llvm.mlir.addressof @s {latency = 1 : i32} : !llvm.ptr
    %8 = llvm.mlir.constant(0 : i8) {latency = 1 : i32} : i8
    %9 = llvm.mlir.constant(1024 : i64) {latency = 1 : i32} : i64
    %10 = llvm.mlir.addressof @q {latency = 1 : i32} : !llvm.ptr
    %11 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%12: i64):  // 2 preds: ^bb0, ^bb3
    %13 = llvm.getelementptr inbounds %1[0, %12] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %14 = llvm.trunc %12 {latency = 1 : i32} : i64 to i32
    llvm.store %14, %13 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb2(%0 : i64) {latency = 1 : i32}
  ^bb2(%15: i64):  // 2 preds: ^bb1, ^bb2
    %16 = llvm.add %15, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %17 = llvm.mul %16, %12 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %18 = llvm.trunc %17 {latency = 1 : i32} : i64 to i32
    %19 = llvm.and %18, %3 {latency = 1 : i32} : i32
    %20 = llvm.getelementptr inbounds %4[0, %12, %15] {latency = 1 : i32} : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    llvm.store %19, %20 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.icmp "eq" %16, %5 {latency = 1 : i32} : i64
    llvm.cond_br %21, ^bb3, ^bb2(%16 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %22 = llvm.add %12, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %23 = llvm.icmp "eq" %22, %5 {latency = 1 : i32} : i64
    llvm.cond_br %23, ^bb4(%0 : i64), ^bb1(%22 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4(%24: i64):  // 2 preds: ^bb3, ^bb4
    %25 = llvm.getelementptr inbounds %6[0, %24] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %26 = llvm.trunc %24 {latency = 1 : i32} : i64 to i32
    llvm.store %26, %25 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %27 = llvm.add %24, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %28 = llvm.icmp "eq" %27, %5 {latency = 1 : i32} : i64
    llvm.cond_br %28, ^bb5, ^bb4(%27 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    "llvm.intr.memset"(%7, %8, %9) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb6(%0 : i64) {latency = 1 : i32}
  ^bb6(%29: i64):  // 2 preds: ^bb5, ^bb8
    %30 = llvm.getelementptr inbounds %10[0, %29] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %31 = llvm.getelementptr inbounds %1[0, %29] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %32 = llvm.load %31 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb7(%11, %0 : i32, i64) {latency = 1 : i32}
  ^bb7(%33: i32, %34: i64):  // 2 preds: ^bb6, ^bb7
    %35 = llvm.getelementptr inbounds %7[0, %34] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %36 = llvm.load %35 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.getelementptr inbounds %4[0, %29, %34] {latency = 1 : i32} : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    %38 = llvm.load %37 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.mul %38, %32 overflow<nsw> {latency = 1 : i32} : i32
    %40 = llvm.add %39, %36 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %40, %35 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %41 = llvm.getelementptr inbounds %6[0, %34] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %42 = llvm.load %41 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.mul %42, %38 overflow<nsw> {latency = 1 : i32} : i32
    %44 = llvm.add %43, %33 overflow<nsw> {latency = 1 : i32} : i32
    %45 = llvm.add %34, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %46 = llvm.icmp "eq" %45, %5 {latency = 1 : i32} : i64
    llvm.cond_br %46, ^bb8, ^bb7(%44, %45 : i32, i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    llvm.store %44, %30 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.add %29, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %48 = llvm.icmp "eq" %47, %5 {latency = 1 : i32} : i64
    llvm.cond_br %48, ^bb9, ^bb6(%47 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return {latency = 1 : i32} %11 : i32
  }
  func.func @_Z6kernelPA256_iPiS1_S1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = 0 : i8}> {latency = 1 : i32} : () -> !neura.data<i8, i1>
    %2 = "neura.constant"() <{value = 1024 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    "neura.memset"(%0, %1, %2) <{is_volatile = false}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i64, i1>) -> ()
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = neura.reserve : !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %6 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %7 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %10 = "neura.fused_op"(%9) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %76 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %77 = neura.phi_start %76, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%77 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve : !neura.data<i32, i1>
    %12 = "neura.fused_op"(%11) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>):
      %76 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %77 = neura.phi_start %76, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%77 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %13 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %14 = "neura.fused_op"(%13) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %76 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %77 = neura.phi_start %76, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%77 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16:2 = "neura.fused_op"(%8, %15) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %76 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %77 = neura.phi_start %76, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %78 = neura.phi_start %76, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%77, %78 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %17 = "neura.gep"(%14, %16#1) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%12, %17) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %18 = "neura.gep"(%10, %16#1) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %21 = neura.reserve : !neura.data<i32, i1>
    %22 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = "neura.fused_op"(%3, %23) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %76 = "neura.grant_once"() <{constant_value = 256 : i64}> : () -> !neura.data<i64, i1>
      %77 = neura.phi_start %76, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %78 = neura.phi_start %77, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%78 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = "neura.fused_op"(%4, %25) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %76 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %77 = neura.phi_start %76, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %78 = neura.phi_start %77, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%78 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %28 = "neura.fused_op"(%5, %27) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %76 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %77 = neura.phi_start %76, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %78 = neura.phi_start %77, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%78 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %30 = neura.phi_start %17, %29 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %31 = neura.reserve : !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %33 = "neura.fused_op"(%6, %32) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %76 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %77 = neura.phi_start %76, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %78 = neura.phi_start %77, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%78 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %35 = neura.phi_start %18, %34 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %37 = "neura.fused_op"(%7, %36) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %76 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %77 = neura.phi_start %76, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %78 = neura.phi_start %77, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%78 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39:2 = "neura.fused_op"(%16#0, %38, %28) <{frequency = 4 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %76 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %77 = "neura.gep"(%arg7, %76) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %78 = "neura.load"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%76, %78 : !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>)
    %40:3 = "neura.fused_op"(%16#1, %31, %33, %39#0) <{frequency = 4 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i64, i1>):
      %76 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %77 = "neura.gep"(%arg7, %76, %arg8) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %78 = "neura.load"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%76, %77, %78 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %41:2 = "neura.fused_op"(%37, %39#0) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %76 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %77 = "neura.load"(%76) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%76, %77 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %42 = "neura.load"(%35) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %43 = "neura.mul"(%40#2, %42) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %44 = "neura.add"(%43, %41#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%44, %41#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %45 = "neura.load"(%30) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %46 = "neura.load"(%40#1) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %47 = "neura.mul"(%39#1, %46) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48 = "neura.add"(%47, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%48, %30) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %49 = "neura.add"(%39#0, %26) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50:2 = "neura.fused_op"(%49, %24, %40#0) <{frequency = 12 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %76 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %77 = neura.grant_predicate %arg7, %76 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%76, %77 : !neura.data<i1, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>)
    %51:4 = "neura.fused_op"(%50#0, %49, %10, %20) <{frequency = 3 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:not->grant_predicate->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %76 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %77 = neura.grant_predicate %arg6, %76 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %78 = neura.phi_start %arg7, %arg8 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %79 = neura.grant_predicate %78, %76 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%76, %77, %78, %79 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %52:2 = "neura.fused_op"(%16#0, %19, %51#0, %50#0) <{frequency = 4 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:phi_start->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>, %arg8: !neura.data<i1, i1>):
      %76 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %77 = neura.grant_predicate %76, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %78 = neura.grant_predicate %76, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%77, %78 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %53:2 = "neura.fused_op"(%12, %21, %51#0) <{frequency = 22 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i1, i1>):
      %76 = neura.phi_start %arg5, %arg6 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %77 = neura.grant_predicate %76, %arg7 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%76, %77 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %54:2 = "neura.fused_op"(%14, %22, %51#0) <{frequency = 22 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i1, i1>):
      %76 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %77 = neura.grant_predicate %76, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%76, %77 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    neura.ctrl_mov %51#1 -> %38 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %55 = neura.grant_predicate %37, %51#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %55 -> %36 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %56 = neura.grant_predicate %35, %51#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %56 -> %34 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %57 = neura.grant_predicate %33, %51#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %57 -> %32 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %58 = neura.grant_predicate %40#0, %51#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %58 -> %31 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %59 = neura.grant_predicate %30, %51#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %59 -> %29 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %60 = neura.grant_predicate %28, %51#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %60 -> %27 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %61 = neura.grant_predicate %26, %51#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %61 -> %25 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %62 = neura.grant_predicate %24, %51#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %62 -> %23 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %54#1 -> %22 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %53#1 -> %21 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %51#3 -> %20 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %52#0 -> %19 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %63 = neura.grant_predicate %26, %50#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %64 = neura.grant_predicate %24, %50#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %65 = "neura.add"(%50#1, %63) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66:2 = "neura.fused_op"(%65, %64) <{frequency = 12 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %76 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %77 = neura.grant_predicate %76, %76 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%76, %77 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %67:3 = "neura.fused_op"(%66#0, %52#1, %65) <{frequency = 11 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:not->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %76 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %77 = neura.grant_predicate %arg6, %76 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %78 = neura.grant_predicate %arg7, %76 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%76, %77, %78 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %68 = "neura.fused_op"(%28, %50#0, %67#0) <{frequency = 8 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %76 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %77 = neura.grant_predicate %76, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%77 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %69 = "neura.fused_op"(%33, %50#0, %67#0) <{frequency = 8 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %76 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %77 = neura.grant_predicate %76, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%77 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.fused_op"(%37, %50#0, %67#0) <{frequency = 8 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %76 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %77 = neura.grant_predicate %76, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%77 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.fused_op"(%51#2, %50#0, %67#0) <{frequency = 8 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %76 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %77 = neura.grant_predicate %76, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%77 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = "neura.fused_op"(%53#0, %50#0, %67#0) <{frequency = 8 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %76 = neura.grant_predicate %arg5, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %77 = neura.grant_predicate %76, %arg7 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%77 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i32, i1>
    %73 = "neura.fused_op"(%54#0, %50#0, %67#0) <{frequency = 8 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %76 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %77 = neura.grant_predicate %76, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%77 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %67#2 -> %15 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %73 -> %13 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %72 -> %11 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %71 -> %9 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %67#1 -> %8 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %70 -> %7 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %69 -> %6 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %68 -> %5 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %74 = neura.grant_predicate %63, %67#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %74 -> %4 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %75 = neura.grant_predicate %64, %67#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %75 -> %3 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %66#1 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

