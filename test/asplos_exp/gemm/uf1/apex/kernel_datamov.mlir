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
    %1 = "neura.grant_once"() <{constant_value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 64 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = neura.reserve : !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %7 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %8 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10:2 = "neura.fused_op"(%9) <{frequency = 3 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %234 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %235 = neura.phi_start %234, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%234, %235 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %11 = "neura.data_mov"(%10#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %12 = "neura.data_mov"(%10#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = "neura.data_mov"(%10#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = "neura.fused_op"(%14) <{frequency = 3 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %234 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %235 = neura.phi_start %234, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%235 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = "neura.data_mov"(%15) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = "neura.data_mov"(%15) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19:2 = "neura.fused_op"(%11, %18, %17) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "phi_start->shl"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %235 = "neura.shl"(%234, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%234, %235 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %20 = "neura.data_mov"(%19#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21 = "neura.data_mov"(%19#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %26 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %27 = neura.reserve : !neura.data<i64, i1>
    %28 = neura.phi_start %13, %27 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = neura.phi_start %16, %29 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %32 = "neura.fused_op"(%8, %31) <{frequency = 5 : i64, pattern_id = 10 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %234 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %235 = neura.phi_start %234, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %236 = neura.phi_start %235, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%236 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.data_mov"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.data_mov"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = neura.reserve : !neura.data<i64, i1>
    %36 = neura.phi_start %21, %35 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = neura.phi_start %12, %37 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %39 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %40 = "neura.data_mov"(%36) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41 = "neura.fused_op"(%39, %40, %34) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %234 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %235 = "neura.gep"(%arg5, %234) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%235 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %42 = "neura.data_mov"(%41) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = neura.reserve : !neura.data<i64, i1>
    %44 = neura.reserve : !neura.data<i64, i1>
    %45 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %46 = neura.reserve : !neura.data<i64, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = "neura.data_mov"(%3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = "neura.fused_op"(%49, %4, %23, %48) <{frequency = 4 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %235 = neura.phi_start %234, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %236 = neura.phi_start %235, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%236 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.data_mov"(%50) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.data_mov"(%50) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %53 = "neura.data_mov"(%50) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = neura.reserve : !neura.data<i64, i1>
    %55 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56 = "neura.fused_op"(%55, %5, %24, %54) <{frequency = 4 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %235 = neura.phi_start %234, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %236 = neura.phi_start %235, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%236 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.data_mov"(%56) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = "neura.data_mov"(%56) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.data_mov"(%56) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %61 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %62 = "neura.fused_op"(%61, %6, %25, %60) <{frequency = 4 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %235 = neura.phi_start %234, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %236 = neura.phi_start %235, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%236 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %63 = "neura.data_mov"(%62) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %64 = "neura.data_mov"(%62) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %65 = "neura.data_mov"(%62) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %66 = neura.reserve : !neura.data<i64, i1>
    %67 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %68 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %69 = "neura.fused_op"(%68, %7, %26, %67) <{frequency = 4 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %235 = neura.phi_start %234, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %236 = neura.phi_start %235, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%236 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %73 = neura.reserve : !neura.data<i64, i1>
    %74 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %75 = "neura.data_mov"(%30) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %76 = "neura.fused_op"(%74, %75, %73) <{frequency = 2 : i64, pattern_id = 18 : i64, pattern_name = "shl->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %234 = "neura.shl"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %235 = neura.phi_start %234, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%235 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %77 = "neura.data_mov"(%76) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = "neura.data_mov"(%76) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %79 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %80 = neura.phi_start %42, %79 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %81 = neura.reserve : !neura.data<i64, i1>
    %82 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83:2 = "neura.fused_op"(%82, %81, %78, %72) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->fused_op:add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %235 = "neura.add"(%234, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %236 = "neura.gep"(%arg6, %235) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%234, %236 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %84 = "neura.data_mov"(%83#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %85 = "neura.data_mov"(%83#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %86 = "neura.data_mov"(%83#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = "neura.data_mov"(%36) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %88:2 = "neura.fused_op"(%87, %66, %85, %65) <{frequency = 8 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->fused_op:add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %235 = "neura.add"(%arg5, %234) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %236 = "neura.gep"(%arg6, %235) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%234, %236 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %89 = "neura.data_mov"(%88#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %90 = "neura.data_mov"(%88#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %91 = "neura.data_mov"(%88#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %92 = "neura.data_mov"(%88#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %93:3 = "neura.fused_op"(%84, %59, %53) <{frequency = 5 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->icmp->fused_op:not->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %234 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %235 = "neura.icmp"(%234, %arg5) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %236 = "neura.not"(%235) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %237 = neura.grant_predicate %234, %236 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%235, %236, %237 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>)
    %94 = "neura.data_mov"(%93#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %95 = "neura.data_mov"(%93#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %96 = "neura.data_mov"(%93#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %97 = "neura.data_mov"(%93#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %98 = "neura.data_mov"(%93#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %99 = "neura.data_mov"(%93#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %100 = "neura.data_mov"(%93#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %101 = "neura.data_mov"(%93#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %102 = "neura.data_mov"(%93#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %103 = "neura.data_mov"(%93#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %104 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %105 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %106 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %107 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %108 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %109 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %110 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %111 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %112 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %113 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %114 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %115 = "neura.data_mov"(%93#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %116 = "neura.data_mov"(%93#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %117:2 = "neura.fused_op"(%20, %22, %46, %115) <{frequency = 4 : i64, pattern_id = 16 : i64, pattern_name = "phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %235 = neura.phi_start %234, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %236 = neura.grant_predicate %235, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%235, %236 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %118 = "neura.data_mov"(%117#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %119 = "neura.data_mov"(%117#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %120 = "neura.data_mov"(%80) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %121 = "neura.load"(%120) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %122 = "neura.data_mov"(%121) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %123 = "neura.fused_op"(%86, %122) <{frequency = 2 : i64, pattern_id = 10 : i64, pattern_name = "load->mul"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i32, i1>):
      %234 = "neura.load"(%arg3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %235 = "neura.mul"(%234, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%235 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %124 = "neura.data_mov"(%123) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %125 = "neura.load"(%92) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %126 = "neura.data_mov"(%125) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %127 = "neura.add"(%126, %124) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %128 = "neura.data_mov"(%127) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%128, %91) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %129 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %130:2 = "neura.fused_op"(%129, %43, %114) <{frequency = 22 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%234, %235 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %131 = "neura.data_mov"(%130#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %132 = "neura.data_mov"(%130#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %133 = "neura.data_mov"(%30) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134:2 = "neura.fused_op"(%133, %44, %113) <{frequency = 22 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%234, %235 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %135 = "neura.data_mov"(%134#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %136 = "neura.data_mov"(%134#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %137:2 = "neura.fused_op"(%33, %45, %112) <{frequency = 22 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%234, %235 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %138 = "neura.data_mov"(%137#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %139 = "neura.data_mov"(%137#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %140 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %141:2 = "neura.fused_op"(%140, %47, %111) <{frequency = 22 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%234, %235 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %142 = "neura.data_mov"(%141#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %143 = "neura.data_mov"(%141#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %116 -> %81 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %144 = "neura.data_mov"(%80) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %145 = neura.grant_predicate %144, %110 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %145 -> %79 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %146 = neura.grant_predicate %77, %109 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %146 -> %73 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %147 = neura.grant_predicate %71, %108 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %147 -> %67 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %148 = neura.grant_predicate %90, %107 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %148 -> %66 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %149 = neura.grant_predicate %64, %106 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %149 -> %60 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %150 = neura.grant_predicate %58, %105 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %150 -> %54 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %151 = neura.grant_predicate %52, %104 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %151 -> %48 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %143 -> %47 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %119 -> %46 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %139 -> %45 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %136 -> %44 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %132 -> %43 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %152 = neura.grant_predicate %142, %103 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %153 = neura.grant_predicate %57, %102 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %154 = neura.grant_predicate %51, %101 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %155 = "neura.data_mov"(%152) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %156 = "neura.data_mov"(%153) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %157 = "neura.data_mov"(%154) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %158:3 = "neura.fused_op"(%155, %156, %157) <{frequency = 5 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->icmp->fused_op:not->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %234 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %235 = "neura.icmp"(%234, %arg5) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %236 = "neura.not"(%235) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %237 = neura.grant_predicate %234, %236 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%235, %236, %237 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>)
    %159 = "neura.data_mov"(%158#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %160 = "neura.data_mov"(%158#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %161 = "neura.data_mov"(%158#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %162 = "neura.data_mov"(%158#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %163 = "neura.data_mov"(%158#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %164 = "neura.data_mov"(%158#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %165 = "neura.data_mov"(%158#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %166 = "neura.data_mov"(%158#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %167 = "neura.data_mov"(%158#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %168 = "neura.data_mov"(%158#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %169 = "neura.data_mov"(%158#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %170 = "neura.data_mov"(%158#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %171 = "neura.data_mov"(%158#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %172 = "neura.data_mov"(%158#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %173 = "neura.data_mov"(%158#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %174 = "neura.data_mov"(%158#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %175 = "neura.data_mov"(%158#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %176 = "neura.data_mov"(%158#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %177:2 = "neura.fused_op"(%131, %100, %175, %166) <{frequency = 2 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>, %arg6: !neura.data<i1, i1>):
      %234 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %236 = neura.grant_predicate %234, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%235, %236 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %178 = "neura.data_mov"(%177#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %179 = "neura.data_mov"(%177#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %180:2 = "neura.fused_op"(%118, %99, %174, %165) <{frequency = 2 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>, %arg6: !neura.data<i1, i1>):
      %234 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %236 = neura.grant_predicate %234, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%235, %236 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %181 = "neura.data_mov"(%180#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %182 = "neura.data_mov"(%180#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %183:2 = "neura.fused_op"(%63, %98, %173) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%234, %235 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %184 = "neura.data_mov"(%183#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %185 = "neura.data_mov"(%183#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %186:2 = "neura.fused_op"(%70, %97, %172) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%234, %235 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %187 = "neura.data_mov"(%186#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %188 = "neura.data_mov"(%186#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %189:2 = "neura.fused_op"(%135, %96, %171) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%234, %235 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %190 = "neura.data_mov"(%189#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %191 = "neura.data_mov"(%189#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %192:2 = "neura.fused_op"(%138, %95, %170) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%234, %235 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %193 = "neura.data_mov"(%192#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %194 = "neura.data_mov"(%192#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %195 = "neura.fused_op"(%89, %94, %169) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%235 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %196 = "neura.data_mov"(%195) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %176 -> %37 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %196 -> %35 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %194 -> %31 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %191 -> %29 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %178 -> %27 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %188 -> %26 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %185 -> %25 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %197 = "neura.data_mov"(%153) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %198 = neura.grant_predicate %197, %168 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %198 -> %24 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %199 = "neura.data_mov"(%154) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %200 = neura.grant_predicate %199, %167 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %200 -> %23 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %181 -> %22 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %201 = "neura.data_mov"(%153) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %202 = neura.grant_predicate %201, %164 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %203 = "neura.data_mov"(%154) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %204 = neura.grant_predicate %203, %163 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %205 = "neura.data_mov"(%202) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %206 = "neura.data_mov"(%204) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %207:4 = "neura.fused_op"(%182, %205, %206, %179) <{frequency = 5 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->icmp->fused_op:not->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %234 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %235 = "neura.icmp"(%234, %arg5) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %236 = "neura.not"(%235) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %237 = neura.grant_predicate %arg6, %236 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%234, %235, %236, %237 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>)
    %208 = "neura.data_mov"(%207#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %209 = "neura.data_mov"(%207#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %210 = "neura.data_mov"(%207#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %211 = "neura.data_mov"(%207#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %212 = "neura.data_mov"(%207#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %213 = "neura.data_mov"(%207#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %214 = "neura.data_mov"(%207#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %215 = "neura.data_mov"(%207#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %216 = "neura.data_mov"(%207#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %217 = "neura.data_mov"(%207#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %218 = "neura.data_mov"(%207#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %219 = "neura.fused_op"(%184, %162, %217) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%235 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %220 = "neura.data_mov"(%219) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %221 = "neura.fused_op"(%187, %161, %216) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%235 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %222 = "neura.data_mov"(%221) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %223 = "neura.fused_op"(%190, %160, %215) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%235 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %224 = "neura.data_mov"(%223) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %225 = "neura.fused_op"(%193, %159, %214) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %234 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %235 = neura.grant_predicate %234, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%235 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %226 = "neura.data_mov"(%225) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %227 = neura.grant_predicate %208, %213 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %227 -> %18 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %224 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %218 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %226 -> %8 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %222 -> %7 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %220 -> %6 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %228 = "neura.data_mov"(%202) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %229 = neura.grant_predicate %228, %212 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %229 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %230 = "neura.data_mov"(%204) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %231 = neura.grant_predicate %230, %211 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %231 -> %4 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %232 = neura.grant_predicate %210, %209 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %233 = "neura.data_mov"(%232) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %233 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

