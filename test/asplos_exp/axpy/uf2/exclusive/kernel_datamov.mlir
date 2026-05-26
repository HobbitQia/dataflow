#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1x(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1y(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE1x {latency = 1 : i32} : !llvm.ptr
    %2 = llvm.mlir.constant(7 : i16) {latency = 1 : i32} : i16
    %3 = llvm.mlir.addressof @_ZZ4mainE1y {latency = 1 : i32} : !llvm.ptr
    %4 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.constant(1024 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.constant(3 : i32) {latency = 1 : i32} : i32
    %7 = llvm.mlir.constant(2 : i64) {latency = 1 : i32} : i64
    %8 = llvm.mlir.constant(1022 : i64) {latency = 1 : i32} : i64
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
    %21 = llvm.load %20 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.mul %21, %6 overflow<nsw> {latency = 1 : i32} : i32
    %23 = llvm.getelementptr inbounds %3[0, %19] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %24 = llvm.load %23 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.add %22, %24 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %25, %23 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %26 = llvm.or %19, %4 {latency = 1 : i32} : i64
    %27 = llvm.getelementptr inbounds %1[0, %26] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %28 = llvm.load %27 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.mul %28, %6 overflow<nsw> {latency = 1 : i32} : i32
    %30 = llvm.getelementptr inbounds %3[0, %26] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %31 = llvm.load %30 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %32 = llvm.add %29, %31 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %32, %30 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.add %19, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %34 = llvm.icmp "ult" %19, %8 {latency = 1 : i32} : i64
    llvm.cond_br %34, ^bb2(%33 : i64), ^bb3 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.return {latency = 1 : i32} %9 : i32
  }
  func.func @_Z6kernelPKiPi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 3 : i32}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
    %3 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 2 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 1022 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %8 = neura.phi_start %7, %6 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = "neura.data_mov"(%4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11 = neura.phi_start %10, %9 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = "neura.data_mov"(%3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = neura.phi_start %13, %12 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<i32, i1>
    %17 = "neura.data_mov"(%2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %18 = neura.phi_start %17, %16 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %19 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = "neura.fused_op"(%20) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %81 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %82 = neura.phi_start %81, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%82 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = "neura.data_mov"(%21) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23 = "neura.data_mov"(%21) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = "neura.data_mov"(%21) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.data_mov"(%21) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.data_mov"(%21) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %28:2 = "neura.fused_op"(%27, %19, %26) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %81 = neura.phi_start %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %82 = "neura.gep"(%81, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %83 = "neura.load"(%82) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%81, %83 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %29 = "neura.data_mov"(%28#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %30 = "neura.data_mov"(%28#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %31 = "neura.data_mov"(%28#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %32 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %33:3 = "neura.fused_op"(%32, %15, %25) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %81 = neura.phi_start %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %82 = "neura.gep"(%81, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %83 = "neura.load"(%82) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%81, %82, %83 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %34 = "neura.data_mov"(%33#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = "neura.data_mov"(%33#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %36 = "neura.data_mov"(%33#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = "neura.data_mov"(%33#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %38 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %39 = "neura.mul"(%31, %38) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %41 = "neura.add"(%40, %37) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%42, %36) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %43 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = "neura.or"(%24, %43) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.data_mov"(%44) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %46:2 = "neura.fused_op"(%35, %45) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %81 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %82 = "neura.load"(%81) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%81, %82 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %47 = "neura.data_mov"(%46#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %48 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.data_mov"(%44) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = "neura.fused_op"(%30, %49) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %81 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %82 = "neura.load"(%81) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%82 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %52 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %53 = "neura.mul"(%51, %52) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %55 = "neura.add"(%54, %48) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%56, %47) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %57 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = "neura.add"(%23, %57) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.data_mov"(%58) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62:5 = "neura.fused_op"(%22, %59, %60, %61, %29) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %81 = "neura.icmp"(%arg2, %arg3) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %82 = neura.grant_predicate %arg4, %81 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %83 = neura.grant_predicate %arg5, %81 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %84 = neura.grant_predicate %arg3, %81 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %85 = neura.grant_predicate %arg6, %81 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%81, %82, %83, %84, %85 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %63 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %64 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %65 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %66 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %67 = "neura.data_mov"(%62#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = "neura.data_mov"(%62#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.data_mov"(%62#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.data_mov"(%62#4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.not"(%66) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %67 -> %20 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %70 -> %19 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %72 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %73 = neura.grant_predicate %72, %65 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %73 -> %16 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %74 = neura.grant_predicate %34, %64 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %74 -> %15 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %75 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %76 = neura.grant_predicate %75, %63 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %76 -> %12 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %68 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %69 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %77 = "neura.data_mov"(%71) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %78 = "neura.data_mov"(%71) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %79 = neura.grant_predicate %77, %78 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %80 = "neura.data_mov"(%79) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %80 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

