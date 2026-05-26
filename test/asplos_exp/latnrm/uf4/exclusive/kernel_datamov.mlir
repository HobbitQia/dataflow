#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr constant @_ZZ4mainE11coefficient(dense<[25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560]> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<16 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5state(dense<0> : tensor<12xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<12 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    %1 = llvm.mlir.constant(false) {latency = 1 : i32} : i1
    %2 = llvm.mlir.constant(5 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.constant(4 : i64) {latency = 1 : i32} : i64
    %4 = llvm.mlir.constant(3 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.constant(2 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.addressof @_ZZ4mainE11coefficient {latency = 1 : i32} : !llvm.ptr
    %7 = llvm.mlir.constant(true) {latency = 1 : i32} : i1
    %8 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %9 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %10 = llvm.mlir.addressof @_ZZ4mainE5state {latency = 1 : i32} : !llvm.ptr
    %11 = llvm.mlir.constant(12 : i64) {latency = 1 : i32} : i64
    %12 = llvm.getelementptr inbounds %10[0, 1] {latency = 1 : i32} : (!llvm.ptr) -> !llvm.ptr, !llvm.array<12 x i32>
    llvm.br ^bb1(%8 : i64) {latency = 1 : i32}
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb1
    %14 = llvm.add %13, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %15 = llvm.getelementptr inbounds %10[0, %13] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %16 = llvm.trunc %14 {latency = 1 : i32} : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.icmp "eq" %14, %11 {latency = 1 : i32} : i64
    llvm.cond_br %17, ^bb2, ^bb1(%14 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %18 = llvm.load %10 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.load %12 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb3(%19, %18, %7, %8 : i32, i32, i1, i64) {latency = 1 : i32}
  ^bb3(%20: i32, %21: i32, %22: i1, %23: i64):  // 2 preds: ^bb2, ^bb3
    %24 = llvm.shl %23, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %25 = llvm.getelementptr inbounds %6[0, %24] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %26 = llvm.load %25 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %27 = llvm.or %24, %9 {latency = 1 : i32} : i64
    %28 = llvm.getelementptr inbounds %6[0, %27] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %29 = llvm.load %28 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.or %23, %5 {latency = 1 : i32} : i64
    %31 = llvm.getelementptr inbounds %10[0, %30] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %32 = llvm.load %31 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %20, %31 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.mul %29, %21 overflow<nsw> {latency = 1 : i32} : i32
    %34 = llvm.mul %32, %26 overflow<nsw> {latency = 1 : i32} : i32
    %35 = llvm.sub %33, %34 overflow<nsw> {latency = 1 : i32} : i32
    %36 = llvm.mul %32, %29 overflow<nsw> {latency = 1 : i32} : i32
    %37 = llvm.mul %26, %21 overflow<nsw> {latency = 1 : i32} : i32
    %38 = llvm.add %36, %37 overflow<nsw> {latency = 1 : i32} : i32
    %39 = llvm.or %24, %5 {latency = 1 : i32} : i64
    %40 = llvm.getelementptr inbounds %6[0, %39] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %41 = llvm.load %40 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.or %24, %4 {latency = 1 : i32} : i64
    %43 = llvm.getelementptr inbounds %6[0, %42] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %44 = llvm.load %43 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.or %23, %4 {latency = 1 : i32} : i64
    %46 = llvm.getelementptr inbounds %10[0, %45] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %38, %46 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %48 = llvm.mul %44, %35 overflow<nsw> {latency = 1 : i32} : i32
    %49 = llvm.mul %47, %41 overflow<nsw> {latency = 1 : i32} : i32
    %50 = llvm.sub %48, %49 overflow<nsw> {latency = 1 : i32} : i32
    %51 = llvm.mul %47, %44 overflow<nsw> {latency = 1 : i32} : i32
    %52 = llvm.mul %41, %35 overflow<nsw> {latency = 1 : i32} : i32
    %53 = llvm.add %51, %52 overflow<nsw> {latency = 1 : i32} : i32
    %54 = llvm.shl %30, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %55 = llvm.getelementptr inbounds %6[0, %54] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %56 = llvm.load %55 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.or %54, %9 {latency = 1 : i32} : i64
    %58 = llvm.getelementptr inbounds %6[0, %57] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %59 = llvm.load %58 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %60 = llvm.add %23, %3 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %61 = llvm.getelementptr inbounds %10[0, %60] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %62 = llvm.load %61 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %53, %61 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %63 = llvm.mul %59, %50 overflow<nsw> {latency = 1 : i32} : i32
    %64 = llvm.mul %62, %56 overflow<nsw> {latency = 1 : i32} : i32
    %65 = llvm.sub %63, %64 overflow<nsw> {latency = 1 : i32} : i32
    %66 = llvm.mul %62, %59 overflow<nsw> {latency = 1 : i32} : i32
    %67 = llvm.mul %56, %50 overflow<nsw> {latency = 1 : i32} : i32
    %68 = llvm.add %66, %67 overflow<nsw> {latency = 1 : i32} : i32
    %69 = llvm.shl %45, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %70 = llvm.getelementptr inbounds %6[0, %69] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %71 = llvm.load %70 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %72 = llvm.or %69, %9 {latency = 1 : i32} : i64
    %73 = llvm.getelementptr inbounds %6[0, %72] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %74 = llvm.load %73 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %75 = llvm.add %23, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %76 = llvm.getelementptr inbounds %10[0, %75] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %77 = llvm.load %76 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %68, %76 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %78 = llvm.mul %74, %65 overflow<nsw> {latency = 1 : i32} : i32
    %79 = llvm.mul %77, %71 overflow<nsw> {latency = 1 : i32} : i32
    %80 = llvm.sub %78, %79 overflow<nsw> {latency = 1 : i32} : i32
    %81 = llvm.mul %77, %74 overflow<nsw> {latency = 1 : i32} : i32
    %82 = llvm.mul %71, %65 overflow<nsw> {latency = 1 : i32} : i32
    %83 = llvm.add %81, %82 overflow<nsw> {latency = 1 : i32} : i32
    llvm.cond_br %22, ^bb3(%83, %80, %1, %3 : i32, i32, i1, i64), ^bb4 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.store %80, %10 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.store %83, %12 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.return {latency = 1 : i32} %0 : i32
  }
  func.func @_Z6kernelPiPKi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %2 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.data_mov"(%1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %4:2 = "neura.fused_op"(%2, %3) <{frequency = 13 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %166 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %167 = "neura.load"(%166) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%166, %167 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %5 = "neura.data_mov"(%4#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %6 = "neura.data_mov"(%4#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %7 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %8 = "neura.load"(%7) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %9 = neura.reserve : !neura.data<i1, i1>
    %10 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = "neura.fused_op"(%17) <{frequency = 13 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %166 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %167 = neura.phi_start %166, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%167 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = "neura.data_mov"(%18) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20 = "neura.data_mov"(%18) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21 = "neura.data_mov"(%18) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = "neura.data_mov"(%18) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24:3 = "neura.fused_op"(%23, %22) <{frequency = 4 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:grant_once->phi_start->fused_op:shl->or"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %166 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %167 = neura.phi_start %166, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %168 = "neura.shl"(%167, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %169 = "neura.or"(%168, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%167, %168, %169 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %25 = "neura.data_mov"(%24#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.data_mov"(%24#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.data_mov"(%24#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.data_mov"(%24#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = "neura.data_mov"(%24#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.data_mov"(%24#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = "neura.data_mov"(%24#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = "neura.data_mov"(%24#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<i1, i1>
    %34:5 = "neura.fused_op"(%33, %12, %9) <{frequency = 5 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:grant_once->phi_start->fused_op:fused_op:grant_once->phi_start->grant_predicate->fused_op:fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %166 = "neura.grant_once"() <{constant_value = true}> : () -> !neura.data<i1, i1>
      %167 = neura.phi_start %166, %arg2 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      %168 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
      %169 = neura.phi_start %168, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %170 = neura.grant_predicate %169, %167 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %171 = "neura.grant_once"() <{constant_value = false}> : () -> !neura.data<i1, i1>
      %172 = neura.phi_start %171, %arg4 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      %173 = neura.grant_predicate %172, %167 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%167, %169, %170, %172, %173 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %35 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %36 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %37 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %38 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %39 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %40 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %41 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %42 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %43 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %44 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %45 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %46 = "neura.data_mov"(%34#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %47 = "neura.data_mov"(%34#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %48 = "neura.data_mov"(%34#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %49 = "neura.data_mov"(%34#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = "neura.data_mov"(%34#3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %51 = "neura.data_mov"(%34#4) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %52:3 = "neura.fused_op"(%15, %46, %28) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:grant_once->phi_start->grant_predicate->or"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>):
      %166 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %167 = neura.phi_start %166, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %168 = neura.grant_predicate %167, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %169 = "neura.or"(%arg4, %167) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%167, %168, %169 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %53 = "neura.data_mov"(%52#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = "neura.data_mov"(%52#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = "neura.data_mov"(%52#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56 = "neura.data_mov"(%52#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57:3 = "neura.fused_op"(%13, %45, %27) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:grant_once->phi_start->grant_predicate->or"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>):
      %166 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
      %167 = neura.phi_start %166, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %168 = neura.grant_predicate %167, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %169 = "neura.or"(%arg4, %167) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%167, %168, %169 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %58 = "neura.data_mov"(%57#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.data_mov"(%57#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.data_mov"(%57#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = "neura.data_mov"(%57#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62:2 = "neura.fused_op"(%5, %10, %44) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>):
      %166 = "neura.grant_once"(%arg2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
      %167 = neura.phi_start %166, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %168 = neura.grant_predicate %167, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%167, %168 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %63 = "neura.data_mov"(%62#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %64 = "neura.data_mov"(%62#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %65:2 = "neura.fused_op"(%11, %43) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>):
      %166 = "neura.grant_once"() <{constant_value = 5 : i64}> : () -> !neura.data<i64, i1>
      %167 = neura.phi_start %166, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %168 = neura.grant_predicate %167, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%167, %168 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %66 = "neura.data_mov"(%65#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = "neura.data_mov"(%65#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68:2 = "neura.fused_op"(%14, %42) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>):
      %166 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %167 = neura.phi_start %166, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %168 = neura.grant_predicate %167, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%167, %168 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %69 = "neura.data_mov"(%68#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.data_mov"(%68#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.data_mov"(%68#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = "neura.data_mov"(%68#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %73 = "neura.data_mov"(%68#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %74 = "neura.data_mov"(%68#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %75:2 = "neura.fused_op"(%16, %41) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>):
      %166 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %167 = neura.phi_start %166, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %168 = neura.grant_predicate %167, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%167, %168 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %76 = "neura.data_mov"(%75#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = "neura.data_mov"(%75#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %78 = "neura.data_mov"(%75#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.data_mov"(%75#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %80 = "neura.data_mov"(%75#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %81 = "neura.data_mov"(%75#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %82 = "neura.data_mov"(%75#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.data_mov"(%75#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.data_mov"(%75#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85 = "neura.fused_op"(%31, %58, %83) <{frequency = 4 : i64, pattern_id = 13 : i64, pattern_name = "or->fused_op:gep->load"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %166 = "neura.or"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %167 = "neura.gep"(%arg4, %166) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %168 = "neura.load"(%167) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%168 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %87 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %88 = neura.reserve : !neura.data<i32, i1>
    %89 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %90 = "neura.fused_op"(%89, %88) <{frequency = 13 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>):
      %166 = "neura.grant_once"(%arg2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %167 = neura.phi_start %166, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%167 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %91 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %92 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %93:2 = "neura.fused_op"(%82, %30, %92) <{frequency = 12 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>):
      %166 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %167 = "neura.load"(%166) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %168 = "neura.mul"(%arg4, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%167, %168 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %94 = "neura.data_mov"(%93#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %95 = "neura.data_mov"(%93#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %96:4 = "neura.fused_op"(%73, %56, %94, %81, %32, %95) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->mul->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %166 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %167 = "neura.load"(%166) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %168 = "neura.mul"(%167, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %169 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %170 = "neura.load"(%169) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %171 = "neura.mul"(%167, %170) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %172 = "neura.add"(%171, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%166, %168, %170, %172 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %97 = "neura.data_mov"(%96#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %98 = "neura.data_mov"(%96#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %99 = "neura.data_mov"(%96#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %100 = "neura.data_mov"(%96#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %101 = neura.reserve : !neura.data<i32, i1>
    %102 = "neura.fused_op"(%6, %101) <{frequency = 13 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>):
      %166 = "neura.grant_once"(%arg2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %167 = neura.phi_start %166, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%167 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %103 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %104:2 = "neura.fused_op"(%55, %21) <{frequency = 5 : i64, pattern_id = 12 : i64, pattern_name = "shl->or"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %166 = "neura.shl"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %167 = "neura.or"(%166, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%166, %167 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %105 = "neura.data_mov"(%104#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %106 = "neura.data_mov"(%104#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    "neura.store"(%103, %97) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %107 = "neura.or"(%29, %53) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %108 = "neura.data_mov"(%107) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %109 = "neura.fused_op"(%80, %108) <{frequency = 13 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %166 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %167 = "neura.load"(%166) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%167 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %110 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %111 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %112:2 = "neura.fused_op"(%61, %20, %79) <{frequency = 4 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:shl->or->fused_op:gep->load"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %166 = "neura.shl"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %167 = "neura.or"(%166, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %168 = "neura.gep"(%arg4, %166) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %169 = "neura.load"(%168) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%167, %169 : !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>)
    %113 = "neura.data_mov"(%112#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %114 = "neura.data_mov"(%112#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %115 = "neura.data_mov"(%112#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %116:3 = "neura.fused_op"(%72, %60, %111) <{frequency = 12 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>):
      %166 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %167 = "neura.load"(%166) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %168 = "neura.mul"(%167, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%166, %167, %168 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %117 = "neura.data_mov"(%116#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %118 = "neura.data_mov"(%116#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %119 = "neura.data_mov"(%116#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%100, %117) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %120:2 = "neura.fused_op"(%91, %99, %98, %87, %119) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:mul->sub->fused_op:mul->sub"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>):
      %166 = "neura.mul"(%arg2, %arg3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %167 = "neura.sub"(%166, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %168 = "neura.mul"(%arg5, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %169 = "neura.sub"(%168, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%167, %169 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %121 = "neura.data_mov"(%120#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %122 = "neura.data_mov"(%120#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %123 = "neura.data_mov"(%120#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %124:2 = "neura.fused_op"(%78, %105, %123) <{frequency = 12 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>):
      %166 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %167 = "neura.load"(%166) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %168 = "neura.mul"(%167, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%167, %168 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %125 = "neura.data_mov"(%124#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %126 = "neura.data_mov"(%124#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %127 = "neura.mul"(%110, %121) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %128 = "neura.data_mov"(%127) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %129 = "neura.fused_op"(%118, %86, %128) <{frequency = 8 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>):
      %166 = "neura.mul"(%arg2, %arg3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %167 = "neura.add"(%166, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%167 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %130 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %131 = "neura.add"(%26, %48) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %132 = "neura.data_mov"(%131) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %133:4 = "neura.fused_op"(%71, %132, %125, %77, %106, %126) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->mul->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %166 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %167 = "neura.load"(%166) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %168 = "neura.mul"(%167, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %169 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %170 = "neura.load"(%169) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %171 = "neura.mul"(%167, %170) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %172 = "neura.add"(%171, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%166, %168, %170, %172 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %134 = "neura.data_mov"(%133#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %135 = "neura.data_mov"(%133#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %136 = "neura.data_mov"(%133#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %137 = "neura.data_mov"(%133#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%130, %134) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %138 = "neura.fused_op"(%76, %113) <{frequency = 13 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %166 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %167 = "neura.load"(%166) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%167 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %139 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %140 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %141 = "neura.add"(%25, %66) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %142 = "neura.data_mov"(%141) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %143:3 = "neura.fused_op"(%70, %142, %115) <{frequency = 12 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>):
      %166 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %167 = "neura.load"(%166) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %168 = "neura.mul"(%167, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%166, %167, %168 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %144 = "neura.data_mov"(%143#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %145 = "neura.data_mov"(%143#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %146 = "neura.data_mov"(%143#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%137, %144) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %147:2 = "neura.fused_op"(%136, %122, %135, %140, %146) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:mul->sub->fused_op:mul->sub"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>):
      %166 = "neura.mul"(%arg2, %arg3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %167 = "neura.sub"(%166, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %168 = "neura.mul"(%arg5, %167) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %169 = "neura.sub"(%168, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%167, %169 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %148 = "neura.data_mov"(%147#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %149 = "neura.data_mov"(%147#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %150 = "neura.data_mov"(%147#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%150, %69) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %151 = "neura.mul"(%114, %148) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %152 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %153 = "neura.fused_op"(%145, %139, %152) <{frequency = 8 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>):
      %166 = "neura.mul"(%arg2, %arg3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %167 = "neura.add"(%166, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%167 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %154 = "neura.data_mov"(%153) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %155 = "neura.data_mov"(%153) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%155, %63) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %156 = "neura.not"(%40) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %157 = neura.grant_predicate %154, %39 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %157 -> %101 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %158 = neura.grant_predicate %149, %38 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %158 -> %88 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %51 -> %33 {latency = 1 : i32} : !neura.data<i1, i1> !neura.data<i1, i1>
    neura.ctrl_mov %49 -> %23 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %159 = neura.grant_predicate %19, %37 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %159 -> %17 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %84 -> %16 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %54 -> %15 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %74 -> %14 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %59 -> %13 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %160 = neura.grant_predicate %47, %36 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %160 -> %12 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %67 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %64 -> %10 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %161 = neura.grant_predicate %50, %35 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.ctrl_mov %161 -> %9 {latency = 1 : i32} : !neura.data<i1, i1> !neura.data<i1, i1>
    %162 = "neura.data_mov"(%156) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %163 = "neura.data_mov"(%156) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %164 = neura.grant_predicate %162, %163 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %165 = "neura.data_mov"(%164) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %165 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

