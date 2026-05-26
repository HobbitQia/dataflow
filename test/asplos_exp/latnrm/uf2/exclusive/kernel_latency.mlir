#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr constant @_ZZ4mainE11coefficient(dense<[25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560]> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<16 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5state(dense<0> : tensor<12xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<12 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    %1 = llvm.mlir.constant(6 : i64) {latency = 1 : i32} : i64
    %2 = llvm.mlir.constant(3 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.constant(2 : i64) {latency = 1 : i32} : i64
    %4 = llvm.mlir.addressof @_ZZ4mainE11coefficient {latency = 1 : i32} : !llvm.ptr
    %5 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %7 = llvm.mlir.addressof @_ZZ4mainE5state {latency = 1 : i32} : !llvm.ptr
    %8 = llvm.mlir.constant(12 : i64) {latency = 1 : i32} : i64
    %9 = llvm.getelementptr inbounds %7[0, 1] {latency = 1 : i32} : (!llvm.ptr) -> !llvm.ptr, !llvm.array<12 x i32>
    llvm.br ^bb1(%5 : i64) {latency = 1 : i32}
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb1
    %11 = llvm.add %10, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %12 = llvm.getelementptr inbounds %7[0, %10] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %13 = llvm.trunc %11 {latency = 1 : i32} : i64 to i32
    llvm.store %13, %12 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %14 = llvm.icmp "eq" %11, %8 {latency = 1 : i32} : i64
    llvm.cond_br %14, ^bb2, ^bb1(%11 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %15 = llvm.load %7 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.load %9 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb3(%16, %15, %5 : i32, i32, i64) {latency = 1 : i32}
  ^bb3(%17: i32, %18: i32, %19: i64):  // 2 preds: ^bb2, ^bb3
    %20 = llvm.shl %19, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %21 = llvm.getelementptr inbounds %4[0, %20] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %22 = llvm.load %21 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.or %20, %6 {latency = 1 : i32} : i64
    %24 = llvm.getelementptr inbounds %4[0, %23] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %25 = llvm.load %24 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.add %19, %3 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %27 = llvm.getelementptr inbounds %7[0, %26] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %28 = llvm.load %27 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %17, %27 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %29 = llvm.mul %25, %18 overflow<nsw> {latency = 1 : i32} : i32
    %30 = llvm.mul %28, %22 overflow<nsw> {latency = 1 : i32} : i32
    %31 = llvm.sub %29, %30 overflow<nsw> {latency = 1 : i32} : i32
    %32 = llvm.mul %28, %25 overflow<nsw> {latency = 1 : i32} : i32
    %33 = llvm.mul %22, %18 overflow<nsw> {latency = 1 : i32} : i32
    %34 = llvm.add %32, %33 overflow<nsw> {latency = 1 : i32} : i32
    %35 = llvm.or %20, %3 {latency = 1 : i32} : i64
    %36 = llvm.getelementptr inbounds %4[0, %35] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %37 = llvm.load %36 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %38 = llvm.or %20, %2 {latency = 1 : i32} : i64
    %39 = llvm.getelementptr inbounds %4[0, %38] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %40 = llvm.load %39 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.add %19, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %42 = llvm.getelementptr inbounds %7[0, %41] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %43 = llvm.load %42 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %34, %42 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %44 = llvm.mul %40, %31 overflow<nsw> {latency = 1 : i32} : i32
    %45 = llvm.mul %43, %37 overflow<nsw> {latency = 1 : i32} : i32
    %46 = llvm.sub %44, %45 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %46, %7 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.mul %43, %40 overflow<nsw> {latency = 1 : i32} : i32
    %48 = llvm.mul %37, %31 overflow<nsw> {latency = 1 : i32} : i32
    %49 = llvm.add %47, %48 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %49, %9 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.icmp "ult" %19, %1 {latency = 1 : i32} : i64
    llvm.cond_br %50, ^bb3(%49, %46, %26 : i32, i32, i64), ^bb4 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return {latency = 1 : i32} %0 : i32
  }
  func.func @_Z6kernelPiPKi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %2:2 = "neura.fused_op"(%0, %1) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %42 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%42, %43 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %3 = "neura.load"(%0) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %4 = neura.reserve : !neura.data<i64, i1>
    %5 = "neura.fused_op"(%4) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %42 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %43 = neura.phi_start %42, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%43 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = "neura.fused_op"(%7) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %42 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
      %43 = neura.phi_start %42, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%43 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %10 = "neura.fused_op"(%9) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>):
      %42 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %43 = neura.phi_start %42, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%43 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = "neura.fused_op"(%12) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>):
      %42 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %43 = neura.phi_start %42, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%43 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = "neura.fused_op"(%14) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %42 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %43 = neura.phi_start %42, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%43 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17:2 = "neura.fused_op"(%16, %8) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->phi_start->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %42 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %43 = neura.phi_start %42, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %44 = "neura.add"(%43, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%43, %44 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %18:2 = "neura.fused_op"(%11, %17#0) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->phi_start->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %42 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %43 = neura.phi_start %42, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %44 = "neura.add"(%arg3, %43) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%43, %44 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %19:2 = "neura.fused_op"(%17#0, %15) <{frequency = 3 : i64, pattern_id = 11 : i64, pattern_name = "shl->or"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %42 = "neura.shl"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %43 = "neura.or"(%42, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%42, %43 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %20 = neura.reserve : !neura.data<i32, i1>
    %21:3 = "neura.fused_op"(%3, %20, %13, %19#0) <{frequency = 5 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:grant_once->phi_start->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i64, i1>):
      %42 = "neura.grant_once"(%arg2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %43 = neura.phi_start %42, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %44 = "neura.gep"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.load"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %46 = "neura.mul"(%43, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%43, %45, %46 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %22 = neura.reserve : !neura.data<i32, i1>
    %23 = "neura.fused_op"(%2#1, %22) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>):
      %42 = "neura.grant_once"(%arg2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %43 = neura.phi_start %42, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%43 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %24 = "neura.fused_op"(%13, %19#1) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %42 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%43 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %25:3 = "neura.fused_op"(%10, %18#1, %21#1, %24, %21#2) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->mul->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>):
      %42 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %44 = "neura.mul"(%43, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %45 = "neura.mul"(%43, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %46 = "neura.add"(%45, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%42, %44, %46 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    "neura.store"(%23, %25#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %26 = "neura.fused_op"(%21#0, %24, %25#1) <{frequency = 4 : i64, pattern_id = 5 : i64, pattern_name = "mul->sub"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>):
      %42 = "neura.mul"(%arg2, %arg3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %43 = "neura.sub"(%42, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%43 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %27 = "neura.or"(%19#0, %18#0) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28:2 = "neura.fused_op"(%13, %27, %26) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>):
      %42 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %44 = "neura.mul"(%43, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%43, %44 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %29 = "neura.or"(%19#0, %8) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.fused_op"(%13, %29) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %42 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%43 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %31:3 = "neura.fused_op"(%10, %17#1, %28#0, %30, %28#1) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->mul->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>):
      %42 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %44 = "neura.mul"(%43, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %45 = "neura.mul"(%43, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %46 = "neura.add"(%45, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%42, %44, %46 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %32:5 = "neura.fused_op"(%17#0, %5, %31#2, %18#1, %15, %8) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %42 = "neura.icmp"(%arg2, %arg3) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %43 = neura.grant_predicate %arg4, %42 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %44 = neura.grant_predicate %arg5, %42 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %45 = neura.grant_predicate %arg6, %42 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %46 = neura.grant_predicate %arg7, %42 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%42, %43, %44, %45, %46 : !neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    "neura.store"(%25#2, %31#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %33 = "neura.fused_op"(%30, %26, %31#1) <{frequency = 4 : i64, pattern_id = 5 : i64, pattern_name = "mul->sub"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>):
      %42 = "neura.mul"(%arg2, %arg3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %43 = "neura.sub"(%42, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%43 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%33, %10) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %34:2 = "neura.fused_op"(%2#0, %6, %32#0) <{frequency = 7 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>):
      %42 = "neura.grant_once"(%arg2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
      %43 = neura.phi_start %42, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %44 = neura.grant_predicate %43, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%43, %44 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    "neura.store"(%31#2, %34#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %35 = "neura.not"(%32#0) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %32#1 -> %22 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %36 = neura.grant_predicate %33, %32#0 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %36 -> %20 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %32#2 -> %16 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %32#3 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %37 = neura.grant_predicate %13, %32#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %37 -> %12 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %38 = neura.grant_predicate %18#0, %32#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %38 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %39 = neura.grant_predicate %10, %32#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %39 -> %9 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %32#4 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %34#1 -> %6 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %40 = neura.grant_predicate %5, %32#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %40 -> %4 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %41 = neura.grant_predicate %35, %35 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %41 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

