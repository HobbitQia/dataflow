#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr constant @_ZZ4mainE11coefficient(dense<[25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560]> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<16 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5state(dense<0> : tensor<12xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<12 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    %1 = llvm.mlir.constant(8 : i64) {latency = 1 : i32} : i64
    %2 = llvm.mlir.constant(2 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.addressof @_ZZ4mainE11coefficient {latency = 1 : i32} : !llvm.ptr
    %4 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.addressof @_ZZ4mainE5state {latency = 1 : i32} : !llvm.ptr
    %7 = llvm.mlir.constant(12 : i64) {latency = 1 : i32} : i64
    %8 = llvm.getelementptr inbounds %6[0, 1] {latency = 1 : i32} : (!llvm.ptr) -> !llvm.ptr, !llvm.array<12 x i32>
    llvm.br ^bb1(%4 : i64) {latency = 1 : i32}
  ^bb1(%9: i64):  // 2 preds: ^bb0, ^bb1
    %10 = llvm.add %9, %5 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %11 = llvm.getelementptr inbounds %6[0, %9] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %12 = llvm.trunc %10 {latency = 1 : i32} : i64 to i32
    llvm.store %12, %11 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %13 = llvm.icmp "eq" %10, %7 {latency = 1 : i32} : i64
    llvm.cond_br %13, ^bb2, ^bb1(%10 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %14 = llvm.load %6 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %15 = llvm.load %8 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb3(%15, %14, %4 : i32, i32, i64) {latency = 1 : i32}
  ^bb3(%16: i32, %17: i32, %18: i64):  // 2 preds: ^bb2, ^bb3
    %19 = llvm.shl %18, %5 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %20 = llvm.getelementptr inbounds %3[0, %19] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %21 = llvm.load %20 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.or %19, %5 {latency = 1 : i32} : i64
    %23 = llvm.getelementptr inbounds %3[0, %22] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %24 = llvm.load %23 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.add %18, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %26 = llvm.getelementptr inbounds %6[0, %25] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %27 = llvm.load %26 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %16, %26 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %28 = llvm.mul %24, %17 overflow<nsw> {latency = 1 : i32} : i32
    %29 = llvm.mul %27, %21 overflow<nsw> {latency = 1 : i32} : i32
    %30 = llvm.sub %28, %29 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %30, %6 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %31 = llvm.mul %27, %24 overflow<nsw> {latency = 1 : i32} : i32
    %32 = llvm.mul %21, %17 overflow<nsw> {latency = 1 : i32} : i32
    %33 = llvm.add %31, %32 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %33, %8 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %34 = llvm.add %18, %5 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %35 = llvm.icmp "eq" %34, %1 {latency = 1 : i32} : i64
    llvm.cond_br %35, ^bb4, ^bb3(%33, %30, %34 : i32, i32, i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return {latency = 1 : i32} %0 : i32
  }
  func.func @_Z6kernelPiPKi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 2 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 8 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %8 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %9 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %10 = "neura.gep"(%8, %9) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %11 = "neura.data_mov"(%10) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %12 = "neura.grant_once"(%11) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %13 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %14 = "neura.load"(%13) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %15 = "neura.data_mov"(%14) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %16 = "neura.grant_once"(%15) {latency = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %17 = "neura.data_mov"(%10) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %18 = "neura.load"(%17) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %19 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %20 = "neura.grant_once"(%19) {latency = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23 = neura.phi_start %22, %21 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %25 = "neura.data_mov"(%12) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %26 = neura.phi_start %25, %24 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %27 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %28 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = neura.phi_start %28, %27 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = neura.phi_start %31, %30 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %34 = "neura.data_mov"(%2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = neura.phi_start %34, %33 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = "neura.data_mov"(%3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %38 = neura.phi_start %37, %36 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = "neura.data_mov"(%4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41 = neura.phi_start %40, %39 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<i32, i1>
    %43 = "neura.data_mov"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %44 = neura.phi_start %43, %42 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %45 = neura.reserve : !neura.data<i32, i1>
    %46 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %47 = neura.phi_start %46, %45 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %48 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %49 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = "neura.data_mov"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %51:2 = "neura.fused_op"(%48, %49, %50) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:shl->gep->load"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %111 = "neura.shl"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %112 = "neura.gep"(%arg4, %111) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %113 = "neura.load"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%111, %113 : !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>)
    %52 = "neura.data_mov"(%51#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %53 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %54 = "neura.data_mov"(%51#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %55 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56 = "neura.data_mov"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.fused_op"(%52, %55, %56) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:or->gep->load"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %111 = "neura.or"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %112 = "neura.gep"(%arg4, %111) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %113 = "neura.load"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%113 : !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %58 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %59 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %60 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = "neura.data_mov"(%32) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %63:2 = "neura.fused_op"(%60, %61, %62) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->gep->load"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %111 = "neura.add"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %112 = "neura.gep"(%arg4, %111) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %113 = "neura.load"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%112, %113 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %64 = "neura.data_mov"(%63#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %65 = "neura.data_mov"(%63#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %66 = "neura.data_mov"(%63#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %67 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%67, %64) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %68 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %69 = "neura.fused_op"(%68, %59, %66, %54) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.fan_in:mul->mul->sub"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>):
      %111 = "neura.mul"(%arg2, %arg3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %112 = "neura.mul"(%arg4, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %113 = "neura.sub"(%111, %112) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%113 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %70 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %71 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %72 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%71, %72) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %73 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %74 = "neura.fused_op"(%65, %58, %73, %53) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.fan_in:mul->mul->add"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>):
      %111 = "neura.mul"(%arg2, %arg3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %112 = "neura.mul"(%arg4, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %113 = "neura.add"(%111, %112) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%113 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %76 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %77 = "neura.data_mov"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%76, %77) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %78 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %79 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81:3 = "neura.fused_op"(%78, %79, %80) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.unicast:add->icmp->not"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %111 = "neura.add"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %112 = "neura.icmp"(%111, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %113 = "neura.not"(%112) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      neura.yield results(%111, %112, %113 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %82 = "neura.data_mov"(%81#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = "neura.data_mov"(%81#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %84 = "neura.data_mov"(%81#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %85 = "neura.data_mov"(%81#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %86 = "neura.data_mov"(%81#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %87 = "neura.data_mov"(%81#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %88 = "neura.data_mov"(%81#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %89 = "neura.data_mov"(%81#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %90 = "neura.data_mov"(%81#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %91 = "neura.data_mov"(%81#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %92 = "neura.data_mov"(%81#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %93 = "neura.data_mov"(%81#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %94 = neura.grant_predicate %75, %93 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %94 -> %45 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %95 = neura.grant_predicate %70, %92 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %95 -> %42 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %96 = neura.grant_predicate %82, %91 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %96 -> %39 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %97 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = neura.grant_predicate %97, %90 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %98 -> %36 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %99 = "neura.data_mov"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %100 = neura.grant_predicate %99, %89 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %100 -> %33 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %101 = "neura.data_mov"(%32) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = neura.grant_predicate %101, %88 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %102 -> %30 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %103 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %104 = neura.grant_predicate %103, %87 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %104 -> %27 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %105 = "neura.data_mov"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %106 = neura.grant_predicate %105, %86 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %106 -> %24 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %107 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %108 = neura.grant_predicate %107, %85 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %108 -> %21 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %109 = neura.grant_predicate %84, %83 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %110 = "neura.data_mov"(%109) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %110 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

