#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %9 = llvm.mlir.constant(2 : i64) {latency = 1 : i32} : i64
    %10 = llvm.mlir.constant(62 : i64) {latency = 1 : i32} : i64
    %11 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%3 : i64) {latency = 1 : i32}
  ^bb1(%12: i64):  // 2 preds: ^bb0, ^bb3
    %13 = llvm.shl %12, %4 overflow<nsw> {latency = 1 : i32} : i64
    llvm.br ^bb2(%3 : i64) {latency = 1 : i32}
  ^bb2(%14: i64):  // 2 preds: ^bb1, ^bb2
    %15 = llvm.add %14, %13 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %16 = llvm.add %14, %12 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %17 = llvm.getelementptr inbounds %5[0, %15] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %18 = llvm.trunc %16 {latency = 1 : i32} : i64 to i32
    llvm.store %18, %17 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.sub %12, %14 overflow<nsw> {latency = 1 : i32} : i64
    %20 = llvm.getelementptr inbounds %6[0, %15] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %21 = llvm.trunc %19 {latency = 1 : i32} : i64 to i32
    llvm.store %21, %20 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.add %14, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %23 = llvm.icmp "eq" %22, %8 {latency = 1 : i32} : i64
    llvm.cond_br %23, ^bb3, ^bb2(%22 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %24 = llvm.add %12, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %25 = llvm.icmp "eq" %24, %8 {latency = 1 : i32} : i64
    llvm.cond_br %25, ^bb4(%3 : i64), ^bb1(%24 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4(%26: i64):  // 2 preds: ^bb3, ^bb8
    %27 = llvm.shl %26, %4 overflow<nsw> {latency = 1 : i32} : i64
    llvm.br ^bb5(%3 : i64) {latency = 1 : i32}
  ^bb5(%28: i64):  // 2 preds: ^bb4, ^bb7
    %29 = llvm.add %28, %27 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %30 = llvm.getelementptr inbounds %5[0, %29] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %31 = llvm.shl %28, %4 overflow<nsw> {latency = 1 : i32} : i64
    %32 = llvm.load %30 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb6(%3 : i64) {latency = 1 : i32}
  ^bb6(%33: i64):  // 2 preds: ^bb5, ^bb6
    %34 = llvm.add %33, %31 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %35 = llvm.getelementptr inbounds %6[0, %34] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %36 = llvm.load %35 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.mul %36, %32 overflow<nsw> {latency = 1 : i32} : i32
    %38 = llvm.add %33, %27 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %39 = llvm.getelementptr inbounds %0[0, %38] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %40 = llvm.load %39 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.add %40, %37 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %41, %39 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %42 = llvm.or %34, %7 {latency = 1 : i32} : i64
    %43 = llvm.getelementptr inbounds %6[0, %42] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %44 = llvm.load %43 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.mul %44, %32 overflow<nsw> {latency = 1 : i32} : i32
    %46 = llvm.or %38, %7 {latency = 1 : i32} : i64
    %47 = llvm.getelementptr inbounds %0[0, %46] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %48 = llvm.load %47 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.add %48, %45 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %49, %47 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.add %33, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %51 = llvm.icmp "ult" %33, %10 {latency = 1 : i32} : i64
    llvm.cond_br %51, ^bb6(%50 : i64), ^bb7 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %52 = llvm.add %28, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %53 = llvm.icmp "eq" %52, %8 {latency = 1 : i32} : i64
    llvm.cond_br %53, ^bb8, ^bb5(%52 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    %54 = llvm.add %26, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %55 = llvm.icmp "eq" %54, %8 {latency = 1 : i32} : i64
    llvm.cond_br %55, ^bb9, ^bb4(%54 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return {latency = 1 : i32} %11 : i32
  }
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 6 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 2 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 62 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.phi_start %2, %14 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.phi_start %3, %16 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.phi_start %2, %18 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = "neura.shl"(%19, %17) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = neura.phi_start %19, %21 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = "neura.fused_op"(%7, %23) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %123 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %124 = neura.phi_start %123, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %125 = neura.phi_start %124, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%125 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = neura.reserve : !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %29 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.phi_start %15, %30 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = neura.phi_start %17, %32 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %35 = "neura.fused_op"(%13, %34) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %123 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %124 = neura.phi_start %123, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %125 = neura.phi_start %124, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%125 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = neura.phi_start %20, %36 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39:2 = "neura.fused_op"(%15, %38, %37) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %124 = "neura.add"(%123, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%123, %124 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %40 = "neura.gep"(%35, %39#1) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %41 = "neura.shl"(%39#0, %33) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.reserve : !neura.data<i64, i1>
    %44 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<i64, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = "neura.fused_op"(%6, %8, %25, %48) <{frequency = 5 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %124 = neura.phi_start %123, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %125 = neura.phi_start %124, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%125 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = "neura.fused_op"(%5, %9, %26, %50) <{frequency = 5 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %124 = neura.phi_start %123, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %125 = neura.phi_start %124, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%125 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = neura.reserve : !neura.data<i64, i1>
    %53 = "neura.fused_op"(%4, %10, %27, %52) <{frequency = 5 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %124 = neura.phi_start %123, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %125 = neura.phi_start %124, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%125 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %55 = "neura.fused_op"(%0, %11, %28, %54) <{frequency = 5 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %124 = neura.phi_start %123, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %125 = neura.phi_start %124, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%125 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = neura.reserve : !neura.data<i64, i1>
    %57 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %58 = "neura.fused_op"(%1, %12, %29, %57) <{frequency = 5 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %124 = neura.phi_start %123, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %125 = neura.phi_start %124, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%125 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %59 = neura.reserve : !neura.data<i64, i1>
    %60 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %61 = neura.phi_start %40, %60 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %62 = neura.reserve : !neura.data<i64, i1>
    %63:2 = "neura.fused_op"(%31, %62, %51) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %124 = "neura.add"(%123, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%123, %124 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %64:6 = "neura.fused_op"(%63#0, %49, %63#1, %39#0, %47, %31, %42) <{frequency = 5 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:icmp->grant_predicate->fused_op:phi_start->grant_predicate->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i64, i1>):
      %123 = "neura.icmp"(%arg3, %arg4) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %124 = neura.grant_predicate %arg5, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %125 = neura.phi_start %arg6, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %126 = neura.grant_predicate %125, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %127 = neura.phi_start %arg8, %arg9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %128 = neura.grant_predicate %127, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%123, %124, %125, %126, %127, %128 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %65:2 = "neura.fused_op"(%37, %56, %63#0) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %124 = "neura.add"(%arg5, %123) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%123, %124 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %66:2 = "neura.fused_op"(%41, %59, %63#0) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %124 = "neura.add"(%arg5, %123) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%123, %124 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %67 = "neura.load"(%61) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %68 = "neura.gep"(%58, %66#1) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %69 = "neura.load"(%68) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %70 = "neura.mul"(%69, %67) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %71 = "neura.gep"(%55, %65#1) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = "neura.load"(%71) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %73 = "neura.add"(%72, %70) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%73, %71) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %74 = "neura.load"(%61) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %75 = "neura.or"(%66#1, %53) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %76 = "neura.gep"(%58, %75) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = "neura.load"(%76) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %78 = "neura.mul"(%77, %74) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %79 = "neura.or"(%65#1, %53) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80 = "neura.gep"(%55, %79) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %81 = "neura.load"(%80) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %82 = "neura.add"(%81, %78) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%82, %80) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %83:2 = "neura.fused_op"(%33, %43, %64#0) <{frequency = 26 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%123, %124 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %84:2 = "neura.fused_op"(%35, %44, %64#0) <{frequency = 26 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%123, %124 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %85:2 = "neura.fused_op"(%22, %45, %64#0) <{frequency = 26 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%123, %124 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %86:2 = "neura.fused_op"(%24, %46, %64#0) <{frequency = 26 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%123, %124 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %87:2 = "neura.fused_op"(%64#0, %64#2) <{frequency = 34 : i64, pattern_id = 3 : i64, pattern_name = "not->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>):
      %123 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %124 = neura.grant_predicate %arg4, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%123, %124 : !neura.data<i1, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>)
    neura.ctrl_mov %64#1 -> %62 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %88 = neura.grant_predicate %61, %64#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %88 -> %60 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %89 = neura.grant_predicate %66#0, %64#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %89 -> %59 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %90 = neura.grant_predicate %58, %64#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %90 -> %57 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %91 = neura.grant_predicate %65#0, %64#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %91 -> %56 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %92 = neura.grant_predicate %55, %64#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %92 -> %54 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %93 = neura.grant_predicate %53, %64#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %93 -> %52 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %94 = neura.grant_predicate %51, %64#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %94 -> %50 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %95 = neura.grant_predicate %49, %64#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %95 -> %48 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %64#3 -> %47 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %86#1 -> %46 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %85#1 -> %45 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %84#1 -> %44 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %83#1 -> %43 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %64#5 -> %42 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %96 = neura.grant_predicate %53, %87#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %97 = neura.grant_predicate %86#0, %87#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %98 = neura.grant_predicate %85#0, %87#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %99 = "neura.add"(%87#1, %96) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100:3 = "neura.fused_op"(%99, %97, %98, %96) <{frequency = 11 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:icmp->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %123 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %124 = neura.grant_predicate %arg5, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %125 = neura.grant_predicate %arg6, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%123, %124, %125 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %101:6 = "neura.fused_op"(%100#0, %99, %49, %87#0, %64#4) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %123 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %124 = neura.grant_predicate %arg4, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %125 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %126 = neura.grant_predicate %125, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %127 = neura.grant_predicate %arg7, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %128 = neura.grant_predicate %127, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%123, %124, %125, %126, %127, %128 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %102:2 = "neura.fused_op"(%51, %87#0, %101#0) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%123, %124 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %103:2 = "neura.fused_op"(%55, %87#0, %101#0) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%123, %124 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %104:2 = "neura.fused_op"(%58, %87#0, %101#0) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%123, %124 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %105:2 = "neura.fused_op"(%83#0, %87#0, %101#0) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%123, %124 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %106:2 = "neura.fused_op"(%84#0, %87#0, %101#0) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%123, %124 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %107 = "neura.fused_op"(%65#0, %87#0, %101#0) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%124 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %101#1 -> %38 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %107 -> %36 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %106#1 -> %34 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %105#1 -> %32 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %101#5 -> %30 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %104#1 -> %29 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %103#1 -> %28 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %108 = neura.grant_predicate %96, %101#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %108 -> %27 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %102#1 -> %26 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %101#3 -> %25 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %109 = neura.grant_predicate %97, %101#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %109 -> %23 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %110 = neura.grant_predicate %98, %101#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %110 -> %21 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %111 = neura.grant_predicate %97, %100#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %112 = neura.grant_predicate %101#4, %100#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %113 = "neura.add"(%100#1, %100#2) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %114:2 = "neura.fused_op"(%113, %111) <{frequency = 27 : i64, pattern_id = 2 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %123 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %124 = neura.grant_predicate %123, %123 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%123, %124 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %115:4 = "neura.fused_op"(%114#0, %112, %102#0, %100#0, %101#2) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %123 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %124 = neura.grant_predicate %arg4, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %125 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %126 = neura.grant_predicate %125, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %127 = neura.grant_predicate %arg7, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %128 = neura.grant_predicate %127, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%123, %124, %126, %128 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %116 = "neura.fused_op"(%103#0, %100#0, %115#0) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%124 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %117 = "neura.fused_op"(%104#0, %100#0, %115#0) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%124 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %118 = "neura.fused_op"(%105#0, %100#0, %115#0) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%124 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %119 = "neura.fused_op"(%106#0, %100#0, %115#0) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %123 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %124 = neura.grant_predicate %123, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%124 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %120 = neura.grant_predicate %113, %115#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %120 -> %18 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %118 -> %16 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %115#1 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %119 -> %13 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %117 -> %12 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %116 -> %11 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %121 = neura.grant_predicate %100#2, %115#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %121 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %115#2 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %115#3 -> %8 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %122 = neura.grant_predicate %111, %115#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %122 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %114#1 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

