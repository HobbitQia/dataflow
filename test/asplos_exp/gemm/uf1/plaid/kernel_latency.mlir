#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1C(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1B(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<4096 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.addressof @_ZZ4mainE1C {latency = 1 : i32} : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i8) {latency = 1 : i32} : i8
    %2 = llvm.mlir.constant(16384 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %4 = llvm.mlir.constant(6 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.addressof @_ZZ4mainE1A {latency = 1 : i32} : !llvm.ptr
    %6 = llvm.mlir.addressof @_ZZ4mainE1B {latency = 1 : i32} : !llvm.ptr
    %7 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %8 = llvm.mlir.constant(64 : i64) {latency = 1 : i32} : i64
    %9 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%3 : i64) {latency = 1 : i32}
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb3
    %11 = llvm.shl %10, %4 overflow<nsw> {latency = 1 : i32} : i64
    llvm.br ^bb2(%3 : i64) {latency = 1 : i32}
  ^bb2(%12: i64):  // 2 preds: ^bb1, ^bb2
    %13 = llvm.add %12, %11 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %14 = llvm.add %12, %10 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %15 = llvm.getelementptr inbounds %5[0, %13] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %16 = llvm.trunc %14 {latency = 1 : i32} : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.sub %10, %12 overflow<nsw> {latency = 1 : i32} : i64
    %18 = llvm.getelementptr inbounds %6[0, %13] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %19 = llvm.trunc %17 {latency = 1 : i32} : i64 to i32
    llvm.store %19, %18 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.add %12, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %21 = llvm.icmp "eq" %20, %8 {latency = 1 : i32} : i64
    llvm.cond_br %21, ^bb3, ^bb2(%20 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %22 = llvm.add %10, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %23 = llvm.icmp "eq" %22, %8 {latency = 1 : i32} : i64
    llvm.cond_br %23, ^bb4(%3 : i64), ^bb1(%22 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4(%24: i64):  // 2 preds: ^bb3, ^bb8
    %25 = llvm.shl %24, %4 overflow<nsw> {latency = 1 : i32} : i64
    llvm.br ^bb5(%3 : i64) {latency = 1 : i32}
  ^bb5(%26: i64):  // 2 preds: ^bb4, ^bb7
    %27 = llvm.add %26, %25 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %28 = llvm.getelementptr inbounds %5[0, %27] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %29 = llvm.shl %26, %4 overflow<nsw> {latency = 1 : i32} : i64
    %30 = llvm.load %28 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb6(%3 : i64) {latency = 1 : i32}
  ^bb6(%31: i64):  // 2 preds: ^bb5, ^bb6
    %32 = llvm.add %31, %29 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %33 = llvm.getelementptr inbounds %6[0, %32] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %34 = llvm.load %33 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.mul %34, %30 overflow<nsw> {latency = 1 : i32} : i32
    %36 = llvm.add %31, %25 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %37 = llvm.getelementptr inbounds %0[0, %36] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %38 = llvm.load %37 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.add %38, %35 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %39, %37 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %40 = llvm.add %31, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %41 = llvm.icmp "eq" %40, %8 {latency = 1 : i32} : i64
    llvm.cond_br %41, ^bb7, ^bb6(%40 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %42 = llvm.add %26, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %43 = llvm.icmp "eq" %42, %8 {latency = 1 : i32} : i64
    llvm.cond_br %43, ^bb8, ^bb5(%42 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    %44 = llvm.add %24, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %45 = llvm.icmp "eq" %44, %8 {latency = 1 : i32} : i64
    llvm.cond_br %45, ^bb9, ^bb4(%44 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return {latency = 1 : i32} %9 : i32
  }
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 6 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 64 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.phi_start %6, %7 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.phi_start %5, %9 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %12 = neura.phi_start %0, %11 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %14 = neura.phi_start %2, %13 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = neura.phi_start %1, %15 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.phi_start %3, %17 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.phi_start %4, %19 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = neura.phi_start %3, %21 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %23 = "neura.shl"(%22, %20) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.phi_start %22, %24 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = neura.phi_start %8, %26 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<i64, i1>
    %29 = neura.phi_start %10, %28 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %30 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %31 = neura.phi_start %12, %30 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %32 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %33 = neura.phi_start %14, %32 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = neura.phi_start %18, %34 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = neura.phi_start %20, %36 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %39 = neura.phi_start %16, %38 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = neura.phi_start %23, %40 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.phi_start %18, %42 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = "neura.add"(%43, %41) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.gep"(%39, %44) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.shl"(%43, %37) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = neura.phi_start %35, %47 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %49 = neura.reserve : !neura.data<i64, i1>
    %50 = neura.phi_start %37, %49 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %51 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %52 = neura.phi_start %39, %51 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %53 = neura.reserve : !neura.data<i64, i1>
    %54 = neura.phi_start %25, %53 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %55 = neura.reserve : !neura.data<i64, i1>
    %56 = neura.phi_start %43, %55 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %57 = neura.reserve : !neura.data<i64, i1>
    %58 = neura.phi_start %27, %57 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %59 = neura.reserve : !neura.data<i64, i1>
    %60 = neura.phi_start %29, %59 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %61 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %62 = neura.phi_start %31, %61 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %63 = neura.reserve : !neura.data<i64, i1>
    %64 = neura.phi_start %41, %63 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %65 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %66 = neura.phi_start %33, %65 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %67 = neura.reserve : !neura.data<i64, i1>
    %68 = neura.phi_start %46, %67 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %69 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %70 = neura.phi_start %45, %69 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %71 = neura.reserve : !neura.data<i64, i1>
    %72 = neura.phi_start %35, %71 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %73 = "neura.load"(%70) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %74 = "neura.fused_op"(%72, %68, %66) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:add->gep->load"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %131 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %132 = "neura.gep"(%arg5, %131) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %133 = "neura.load"(%132) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%133 : !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %75 = "neura.mul"(%74, %73) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %76:2 = "neura.fused_op"(%72, %64, %62) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:add->gep->load"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %131 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %132 = "neura.gep"(%arg5, %131) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %133 = "neura.load"(%132) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%132, %133 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %77 = "neura.add"(%76#1, %75) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%77, %76#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %78:3 = "neura.fused_op"(%72, %60, %58) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->icmp->not"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %131 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %132 = "neura.icmp"(%131, %arg5) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %133 = "neura.not"(%132) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      neura.yield results(%131, %132, %133 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %79 = neura.grant_predicate %78#0, %78#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %79 -> %71 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %80 = neura.grant_predicate %70, %78#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %80 -> %69 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %81 = neura.grant_predicate %68, %78#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %81 -> %67 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %82 = neura.grant_predicate %66, %78#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %82 -> %65 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %83 = neura.grant_predicate %64, %78#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %83 -> %63 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %84 = neura.grant_predicate %62, %78#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %84 -> %61 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %85 = neura.grant_predicate %60, %78#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %85 -> %59 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %86 = neura.grant_predicate %58, %78#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %86 -> %57 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %87 = neura.grant_predicate %56, %78#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %87 -> %55 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %88 = neura.grant_predicate %54, %78#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %88 -> %53 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %89 = neura.grant_predicate %52, %78#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %89 -> %51 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %90 = neura.grant_predicate %50, %78#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %90 -> %49 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %91 = neura.grant_predicate %48, %78#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %91 -> %47 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %92 = neura.grant_predicate %56, %78#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %93 = neura.grant_predicate %60, %78#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %94 = neura.grant_predicate %58, %78#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %95 = neura.grant_predicate %54, %78#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %96 = neura.grant_predicate %64, %78#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %97 = neura.grant_predicate %52, %78#1 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %98 = neura.grant_predicate %50, %78#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %99 = neura.grant_predicate %48, %78#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %100 = neura.grant_predicate %66, %78#1 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %101 = neura.grant_predicate %62, %78#1 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %102:3 = "neura.fused_op"(%92, %93, %94) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.unicast:add->icmp->not"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %131 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %132 = "neura.icmp"(%131, %arg5) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %133 = "neura.not"(%132) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      neura.yield results(%131, %132, %133 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %103 = neura.grant_predicate %102#0, %102#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %103 -> %42 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %104 = neura.grant_predicate %96, %102#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %104 -> %40 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %105 = neura.grant_predicate %97, %102#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %105 -> %38 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %106 = neura.grant_predicate %98, %102#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %106 -> %36 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %107 = neura.grant_predicate %99, %102#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %107 -> %34 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %108 = neura.grant_predicate %100, %102#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %108 -> %32 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %109 = neura.grant_predicate %101, %102#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %109 -> %30 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %110 = neura.grant_predicate %93, %102#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %110 -> %28 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %111 = neura.grant_predicate %94, %102#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %111 -> %26 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %112 = neura.grant_predicate %95, %102#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %112 -> %24 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %113 = neura.grant_predicate %95, %102#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %114 = neura.grant_predicate %93, %102#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %115 = neura.grant_predicate %94, %102#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %116 = neura.grant_predicate %98, %102#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %117 = neura.grant_predicate %99, %102#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %118 = neura.grant_predicate %97, %102#1 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %119 = neura.grant_predicate %100, %102#1 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %120 = neura.grant_predicate %101, %102#1 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %121:3 = "neura.fused_op"(%113, %114, %115) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:add->icmp->not"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %131 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %132 = "neura.icmp"(%131, %arg5) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %133 = "neura.not"(%132) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      neura.yield results(%131, %132, %133 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %122 = neura.grant_predicate %121#0, %121#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %122 -> %21 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %123 = neura.grant_predicate %116, %121#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %123 -> %19 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %124 = neura.grant_predicate %117, %121#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %124 -> %17 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %125 = neura.grant_predicate %118, %121#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %125 -> %15 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %126 = neura.grant_predicate %119, %121#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %126 -> %13 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %127 = neura.grant_predicate %120, %121#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %127 -> %11 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %128 = neura.grant_predicate %114, %121#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %128 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %129 = neura.grant_predicate %115, %121#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %129 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %130 = neura.grant_predicate %121#1, %121#1 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %130 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

