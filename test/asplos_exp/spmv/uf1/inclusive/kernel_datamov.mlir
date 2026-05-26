#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3val(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3col(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3row(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE7feature(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE6output(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.constant(7 : i16) {latency = 1 : i32} : i16
    %2 = llvm.mlir.constant(1 : i16) {latency = 1 : i32} : i16
    %3 = llvm.mlir.addressof @_ZZ4mainE3val {latency = 1 : i32} : !llvm.ptr
    %4 = llvm.mlir.addressof @_ZZ4mainE3col {latency = 1 : i32} : !llvm.ptr
    %5 = llvm.mlir.addressof @_ZZ4mainE3row {latency = 1 : i32} : !llvm.ptr
    %6 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %7 = llvm.mlir.constant(1024 : i64) {latency = 1 : i32} : i64
    %8 = llvm.mlir.constant(13 : i16) {latency = 1 : i32} : i16
    %9 = llvm.mlir.addressof @_ZZ4mainE7feature {latency = 1 : i32} : !llvm.ptr
    %10 = llvm.mlir.addressof @_ZZ4mainE6output {latency = 1 : i32} : !llvm.ptr
    %11 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%12: i64):  // 2 preds: ^bb0, ^bb1
    %13 = llvm.trunc %12 {latency = 1 : i32} : i64 to i32
    %14 = llvm.trunc %12 {latency = 1 : i32} : i64 to i16
    %15 = llvm.urem %14, %1 {latency = 1 : i32} : i16
    %16 = llvm.add %15, %2 overflow<nsw, nuw> {latency = 1 : i32} : i16
    %17 = llvm.zext %16 {latency = 1 : i32} : i16 to i32
    %18 = llvm.getelementptr inbounds %3[0, %12] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %17, %18 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.getelementptr inbounds %4[0, %12] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %13, %19 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.getelementptr inbounds %5[0, %12] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %13, %20 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.add %12, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %22 = llvm.icmp "eq" %21, %7 {latency = 1 : i32} : i64
    llvm.cond_br %22, ^bb2(%0 : i64), ^bb1(%21 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%23: i64):  // 2 preds: ^bb1, ^bb2
    %24 = llvm.trunc %23 {latency = 1 : i32} : i64 to i16
    %25 = llvm.urem %24, %8 {latency = 1 : i32} : i16
    %26 = llvm.zext %25 {latency = 1 : i32} : i16 to i32
    %27 = llvm.getelementptr inbounds %9[0, %23] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %26, %27 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %28 = llvm.add %23, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %29 = llvm.icmp "eq" %28, %7 {latency = 1 : i32} : i64
    llvm.cond_br %29, ^bb3(%0 : i64), ^bb2(%28 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3(%30: i64):  // 2 preds: ^bb2, ^bb3
    %31 = llvm.getelementptr inbounds %3[0, %30] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %32 = llvm.load %31 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.getelementptr inbounds %4[0, %30] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %34 = llvm.load %33 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.sext %34 {latency = 1 : i32} : i32 to i64
    %36 = llvm.getelementptr inbounds %9[0, %35] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %37 = llvm.load %36 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %38 = llvm.mul %37, %32 overflow<nsw> {latency = 1 : i32} : i32
    %39 = llvm.getelementptr inbounds %5[0, %30] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %40 = llvm.load %39 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.sext %40 {latency = 1 : i32} : i32 to i64
    %42 = llvm.getelementptr inbounds %10[0, %41] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %43 = llvm.load %42 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.add %43, %38 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %44, %42 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %45 = llvm.add %30, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %46 = llvm.icmp "eq" %45, %7 {latency = 1 : i32} : i64
    llvm.cond_br %46, ^bb4, ^bb3(%45 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return {latency = 1 : i32} %11 : i32
  }
  func.func @_Z6kernelPiS_S_S_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %1 = "neura.grant_once"() <{constant_value = 1024 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<i64, i1>
    %3 = "neura.data_mov"(%1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %4 = neura.phi_start %3, %2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = "neura.data_mov"(%0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %7 = neura.phi_start %6, %5 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %10 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = "neura.fused_op"(%13) <{frequency = 8 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %69 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %70 = neura.phi_start %69, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%70 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %15 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19:2 = "neura.fused_op"(%9, %18) <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %69 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %70 = neura.phi_start %69, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %71 = "neura.gep"(%70, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %72 = "neura.load"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%70, %72 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %20 = "neura.data_mov"(%19#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %21 = "neura.data_mov"(%19#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %22:2 = "neura.fused_op"(%11, %17) <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %69 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %70 = neura.phi_start %69, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %71 = "neura.gep"(%70, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %72 = "neura.load"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%70, %72 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %23 = "neura.data_mov"(%22#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %24 = "neura.data_mov"(%22#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %25:2 = "neura.fused_op"(%12, %16) <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %69 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %70 = neura.phi_start %69, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %71 = "neura.gep"(%70, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %72 = "neura.load"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%70, %72 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %26 = "neura.data_mov"(%25#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %27 = "neura.data_mov"(%25#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %28 = neura.sext %24 {latency = 1 : i32} : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %29 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30:2 = "neura.fused_op"(%10, %29) <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %69 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %70 = neura.phi_start %69, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %71 = "neura.gep"(%70, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %72 = "neura.load"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%70, %72 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %31 = "neura.data_mov"(%30#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %32 = "neura.data_mov"(%30#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %33 = "neura.mul"(%32, %27) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %34 = neura.sext %21 {latency = 1 : i32} : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %35 = "neura.data_mov"(%34) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36:3 = "neura.fused_op"(%8, %35) <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %69 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %70 = neura.phi_start %69, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %71 = "neura.gep"(%70, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %72 = "neura.load"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%70, %71, %72 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %37 = "neura.data_mov"(%36#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = "neura.data_mov"(%36#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %39 = "neura.data_mov"(%36#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %40 = "neura.data_mov"(%33) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %41 = "neura.add"(%39, %40) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%42, %38) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %43 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = "neura.add"(%15, %43) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.data_mov"(%44) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %46 = "neura.data_mov"(%4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = "neura.icmp"(%45, %46) <{cmpType = "eq"}> {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %48 = "neura.data_mov"(%47) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %49 = "neura.data_mov"(%44) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.data_mov"(%4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52:5 = "neura.fused_op"(%48, %49, %50, %51, %26) <{frequency = 5 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<!llvm.ptr, i1>):
      %69 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %70 = neura.grant_predicate %arg6, %69 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %71 = neura.grant_predicate %arg7, %69 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %72 = neura.grant_predicate %arg8, %69 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %73 = neura.grant_predicate %arg9, %69 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%69, %70, %71, %72, %73 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %53 = "neura.data_mov"(%52#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %54 = "neura.data_mov"(%52#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %55 = "neura.data_mov"(%52#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %56 = "neura.data_mov"(%52#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %57 = "neura.data_mov"(%52#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = "neura.data_mov"(%52#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.data_mov"(%52#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.data_mov"(%52#4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %57 -> %13 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %60 -> %12 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %61 = neura.grant_predicate %23, %56 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %61 -> %11 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %62 = neura.grant_predicate %31, %55 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %62 -> %10 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %63 = neura.grant_predicate %20, %54 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %63 -> %9 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %64 = neura.grant_predicate %37, %53 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %64 -> %8 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %58 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %59 -> %2 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %65 = "neura.data_mov"(%47) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %66 = "neura.data_mov"(%47) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %67 = neura.grant_predicate %65, %66 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %68 = "neura.data_mov"(%67) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %68 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

