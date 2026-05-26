#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1x(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1y(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE1x {latency = 1 : i32} : !llvm.ptr
    %2 = llvm.mlir.constant(7 : i16) {latency = 1 : i32} : i16
    %3 = llvm.mlir.addressof @_ZZ4mainE1y {latency = 1 : i32} : !llvm.ptr
    %4 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.constant(1024 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.constant(dense<3> : vector<4xi32>) {latency = 1 : i32} : vector<4xi32>
    %7 = llvm.mlir.constant(4 : i64) {latency = 1 : i32} : i64
    %8 = llvm.mlir.constant(1020 : i64) {latency = 1 : i32} : i64
    %9 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb1
    %11 = llvm.trunc %10 {latency = 1 : i32} : i64 to i32
    %12 = llvm.getelementptr inbounds %1[0, %10] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %11, %12 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %13 = llvm.trunc %10 {latency = 1 : i32} : i64 to i16
    %14 = llvm.urem %13, %2 {latency = 1 : i32} : i16
    %15 = llvm.zext %14 {latency = 1 : i32} : i16 to i32
    %16 = llvm.getelementptr inbounds %3[0, %10] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %15, %16 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.add %10, %4 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %18 = llvm.icmp "eq" %17, %5 {latency = 1 : i32} : i64
    llvm.cond_br %18, ^bb2(%0 : i64), ^bb1(%17 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%19: i64):  // 2 preds: ^bb1, ^bb2
    %20 = llvm.getelementptr inbounds %1[0, %19] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %21 = llvm.getelementptr inbounds %3[0, %19] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %22 = llvm.load %20 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> vector<4xi32>
    %23 = llvm.mul %22, %6 overflow<nsw> {latency = 1 : i32} : vector<4xi32>
    %24 = llvm.load %21 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> vector<4xi32>
    %25 = llvm.add %23, %24 overflow<nsw> {latency = 1 : i32} : vector<4xi32>
    llvm.store %25, %21 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : vector<4xi32>, !llvm.ptr
    %26 = llvm.add %19, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %27 = llvm.icmp "ult" %19, %8 {latency = 1 : i32} : i64
    llvm.cond_br %27, ^bb2(%26 : i64), ^bb3 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.return {latency = 1 : i32} %9 : i32
  }
  func.func @_Z6kernelPKiPi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 3 : i32}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
    %3 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 2 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 3 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 4 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 1020 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %10 = neura.phi_start %9, %8 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = neura.phi_start %12, %11 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %18 = neura.reserve : !neura.data<i32, i1>
    %19 = "neura.data_mov"(%2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %20 = neura.phi_start %19, %18 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = "neura.fused_op"(%22) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %92 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %93 = neura.phi_start %92, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%93 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %32:3 = "neura.fused_op"(%31, %17, %30) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %92 = neura.phi_start %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %93 = "neura.gep"(%92, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %94 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%92, %93, %94 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %33 = "neura.data_mov"(%32#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.data_mov"(%32#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = "neura.data_mov"(%32#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %36 = "neura.data_mov"(%32#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = "neura.data_mov"(%32#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = "neura.data_mov"(%32#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %39 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %41:2 = "neura.fused_op"(%39, %21, %29, %40, %38) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "phi_start->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>):
      %92 = neura.phi_start %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %93 = "neura.gep"(%92, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %94 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %95 = "neura.mul"(%94, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %96 = "neura.add"(%95, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%92, %96 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %42 = "neura.data_mov"(%41#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = "neura.data_mov"(%41#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = "neura.data_mov"(%41#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.data_mov"(%41#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.data_mov"(%41#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %47 = "neura.data_mov"(%3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %48 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49:3 = "neura.fused_op"(%47, %16, %28, %36, %45, %48) <{frequency = 6 : i64, pattern_id = 4 : i64, pattern_name = "phi_start->fused_op:fused_op:or->fused_op:gep->load->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i32, i1>):
      %92 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %93 = "neura.or"(%arg4, %92) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %94 = "neura.gep"(%arg5, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %95 = "neura.load"(%94) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %96 = "neura.gep"(%arg6, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %97 = "neura.load"(%96) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.mul"(%97, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %99 = "neura.add"(%98, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%92, %94, %99 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %50 = "neura.data_mov"(%49#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.data_mov"(%49#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %52 = "neura.data_mov"(%49#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %53 = "neura.data_mov"(%4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %55:3 = "neura.fused_op"(%53, %15, %27, %35, %44, %54) <{frequency = 6 : i64, pattern_id = 4 : i64, pattern_name = "phi_start->fused_op:fused_op:or->fused_op:gep->load->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i32, i1>):
      %92 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %93 = "neura.or"(%arg4, %92) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %94 = "neura.gep"(%arg5, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %95 = "neura.load"(%94) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %96 = "neura.gep"(%arg6, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %97 = "neura.load"(%96) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.mul"(%97, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %99 = "neura.add"(%98, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%92, %94, %99 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %56 = "neura.data_mov"(%55#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.data_mov"(%55#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %58 = "neura.data_mov"(%55#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %59 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %61:3 = "neura.fused_op"(%59, %14, %26, %34, %43, %60) <{frequency = 6 : i64, pattern_id = 4 : i64, pattern_name = "phi_start->fused_op:fused_op:or->fused_op:gep->load->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i32, i1>):
      %92 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %93 = "neura.or"(%arg4, %92) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %94 = "neura.gep"(%arg5, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %95 = "neura.load"(%94) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %96 = "neura.gep"(%arg6, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %97 = "neura.load"(%96) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %98 = "neura.mul"(%97, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %99 = "neura.add"(%98, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%92, %94, %99 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %62 = "neura.data_mov"(%61#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %63 = "neura.data_mov"(%61#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %64 = "neura.data_mov"(%61#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%46, %37) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%52, %51) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%58, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%64, %63) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %65 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.add"(%25, %65) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = "neura.data_mov"(%10) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = "neura.data_mov"(%66) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70:5 = "neura.fused_op"(%24, %67, %68, %69, %42) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %92 = "neura.icmp"(%arg2, %arg3) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %93 = neura.grant_predicate %arg4, %92 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %94 = neura.grant_predicate %arg5, %92 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %95 = neura.grant_predicate %arg3, %92 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %96 = neura.grant_predicate %arg6, %92 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%92, %93, %94, %95, %96 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %71 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %72 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %73 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %74 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %75 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %76 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %77 = "neura.data_mov"(%70#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = "neura.data_mov"(%70#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %79 = "neura.data_mov"(%70#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80 = "neura.data_mov"(%70#4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %81 = "neura.not"(%76) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %77 -> %22 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %80 -> %21 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %82 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %83 = neura.grant_predicate %82, %75 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %83 -> %18 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %84 = neura.grant_predicate %33, %74 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %84 -> %17 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %85 = neura.grant_predicate %50, %73 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %85 -> %16 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %86 = neura.grant_predicate %56, %72 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %86 -> %15 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %87 = neura.grant_predicate %62, %71 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %87 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %78 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %79 -> %8 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %88 = "neura.data_mov"(%81) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %89 = "neura.data_mov"(%81) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %90 = neura.grant_predicate %88, %89 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %91 = "neura.data_mov"(%90) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %91 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

