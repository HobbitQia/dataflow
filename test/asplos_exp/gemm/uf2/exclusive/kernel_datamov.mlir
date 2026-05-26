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
    %0 = neura.reserve : !neura.data<i64, i1>
    %1 = neura.reserve : !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %5 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %6 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8:2 = "neura.fused_op"(%7) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %276 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %9 = "neura.data_mov"(%8#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %10 = "neura.data_mov"(%8#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11 = "neura.data_mov"(%8#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = "neura.fused_op"(%12) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %276 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %15 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17:2 = "neura.fused_op"(%9, %16, %15) <{frequency = 4 : i64, pattern_id = 11 : i64, pattern_name = "phi_start->shl"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %276 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %277 = "neura.shl"(%276, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%276, %277 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %18 = "neura.data_mov"(%17#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = "neura.data_mov"(%17#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = "neura.fused_op"(%1, %22) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %276 = "neura.grant_once"() <{constant_value = 62 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.phi_start %277, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%278 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = "neura.fused_op"(%3, %26) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %276 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.phi_start %277, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%278 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.data_mov"(%27) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %30 = "neura.fused_op"(%4, %29) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %276 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %277 = neura.phi_start %276, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %278 = neura.phi_start %277, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%278 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %31 = "neura.data_mov"(%30) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %32 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %33 = "neura.fused_op"(%5, %32) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %276 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %277 = neura.phi_start %276, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %278 = neura.phi_start %277, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%278 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.data_mov"(%33) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = neura.reserve : !neura.data<i64, i1>
    %36 = neura.phi_start %11, %35 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = neura.phi_start %14, %37 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %40 = "neura.fused_op"(%6, %39) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %276 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %277 = neura.phi_start %276, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %278 = neura.phi_start %277, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%278 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %41 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %42 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = neura.reserve : !neura.data<i64, i1>
    %44 = neura.phi_start %19, %43 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = neura.phi_start %10, %45 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %47 = "neura.data_mov"(%46) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %48 = "neura.data_mov"(%44) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %49 = "neura.fused_op"(%47, %48, %42) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %276 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %277 = "neura.gep"(%arg5, %276) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%277 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %50 = "neura.data_mov"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %51 = "neura.data_mov"(%46) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %53 = "neura.shl"(%51, %52) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = neura.reserve : !neura.data<i64, i1>
    %55 = neura.reserve : !neura.data<i64, i1>
    %56 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %57 = neura.reserve : !neura.data<i64, i1>
    %58 = neura.reserve : !neura.data<i64, i1>
    %59 = neura.reserve : !neura.data<i64, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61 = neura.phi_start %24, %60 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %62 = neura.reserve : !neura.data<i64, i1>
    %63 = neura.reserve : !neura.data<i64, i1>
    %64 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %65 = neura.reserve : !neura.data<i64, i1>
    %66 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %67 = neura.reserve : !neura.data<i64, i1>
    %68 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %69 = neura.reserve : !neura.data<i64, i1>
    %70 = "neura.data_mov"(%36) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71 = neura.phi_start %70, %69 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %72 = "neura.data_mov"(%71) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %73 = "neura.data_mov"(%61) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %74 = "neura.data_mov"(%46) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %75:6 = "neura.fused_op"(%72, %73, %28, %63, %74, %59) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:icmp->not->fused_op:phi_start->grant_predicate->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %276 = "neura.icmp"(%arg3, %arg4) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %277 = "neura.not"(%276) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %278 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %279 = neura.grant_predicate %278, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %280 = neura.phi_start %arg7, %arg8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %281 = neura.grant_predicate %280, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277, %278, %279, %280, %281 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %76 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %77 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %78 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %79 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %80 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %81 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %82 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %83 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %84 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %85 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %86 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %87 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %88 = "neura.data_mov"(%75#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %89 = "neura.data_mov"(%75#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %90 = "neura.data_mov"(%75#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %91 = "neura.data_mov"(%75#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %92 = "neura.data_mov"(%75#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %93 = "neura.data_mov"(%75#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %94 = "neura.data_mov"(%75#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %95 = "neura.data_mov"(%75#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %96 = "neura.data_mov"(%75#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %97 = "neura.data_mov"(%75#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %98 = "neura.data_mov"(%75#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %99 = "neura.data_mov"(%75#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %100 = "neura.data_mov"(%75#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %101 = "neura.data_mov"(%75#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = "neura.data_mov"(%75#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %103 = "neura.data_mov"(%75#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %104 = "neura.data_mov"(%75#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %105 = "neura.data_mov"(%75#5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %106:2 = "neura.fused_op"(%2, %25, %62, %88) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %276 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.phi_start %277, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %279 = neura.phi_start %278, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %280 = neura.grant_predicate %279, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%279, %280 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %107 = "neura.data_mov"(%106#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %108 = "neura.data_mov"(%106#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %109 = "neura.data_mov"(%106#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %110:2 = "neura.fused_op"(%0, %21, %58, %87) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %276 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.phi_start %277, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %279 = neura.phi_start %278, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %280 = neura.grant_predicate %279, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%279, %280 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %111 = "neura.data_mov"(%110#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %112 = "neura.data_mov"(%110#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %113 = "neura.data_mov"(%44) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %114 = "neura.data_mov"(%71) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %115:2 = "neura.fused_op"(%113, %65, %114) <{frequency = 3 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %276 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %277 = "neura.add"(%arg5, %276) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%276, %277 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %116 = "neura.data_mov"(%115#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %117 = "neura.data_mov"(%115#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %118 = "neura.data_mov"(%115#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %119 = "neura.data_mov"(%115#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %120:2 = "neura.fused_op"(%18, %20, %57, %86) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %276 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %277 = neura.phi_start %276, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %278 = neura.grant_predicate %277, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%277, %278 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %121 = "neura.data_mov"(%120#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %122 = "neura.data_mov"(%120#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %123 = "neura.data_mov"(%36) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %124:2 = "neura.fused_op"(%123, %54, %85) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %125 = "neura.data_mov"(%124#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %126 = "neura.data_mov"(%124#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %127 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %128:2 = "neura.fused_op"(%127, %55, %84) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %129 = "neura.data_mov"(%128#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %130 = "neura.data_mov"(%128#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %131:2 = "neura.fused_op"(%41, %56, %83) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%276, %277 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %132 = "neura.data_mov"(%131#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %133 = "neura.data_mov"(%131#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %134 = "neura.data_mov"(%71) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %135 = "neura.fused_op"(%134, %108, %82) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "add->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %276 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %136 = "neura.data_mov"(%135) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %137 = "neura.data_mov"(%53) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %138:2 = "neura.fused_op"(%137, %67, %81) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %139 = "neura.data_mov"(%138#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %140 = "neura.data_mov"(%138#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %141:2 = "neura.fused_op"(%50, %68, %80) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%276, %277 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %142 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %143 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %144 = "neura.data_mov"(%141#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %145 = "neura.load"(%143) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %146 = "neura.data_mov"(%71) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %147 = "neura.add"(%146, %139) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %148 = "neura.data_mov"(%147) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %149:3 = "neura.fused_op"(%34, %66, %79, %148) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:phi_start->grant_predicate->fused_op:gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>):
      %276 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %278 = "neura.gep"(%276, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %279 = "neura.load"(%278) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%276, %277, %279 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %150 = "neura.data_mov"(%149#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %151 = "neura.data_mov"(%149#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %152 = "neura.data_mov"(%149#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %153 = "neura.data_mov"(%149#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %154 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %155 = "neura.mul"(%153, %154) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %156:4 = "neura.fused_op"(%31, %64, %78, %119) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:phi_start->grant_predicate->fused_op:gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>):
      %276 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %278 = "neura.gep"(%276, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %279 = "neura.load"(%278) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%276, %277, %278, %279 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %157 = "neura.data_mov"(%156#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %158 = "neura.data_mov"(%156#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %159 = "neura.data_mov"(%156#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %160 = "neura.data_mov"(%156#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %161 = "neura.data_mov"(%156#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %162 = "neura.data_mov"(%155) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %163 = "neura.add"(%161, %162) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %164 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%164, %160) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %165 = "neura.load"(%142) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %166 = "neura.data_mov"(%147) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %167 = "neura.or"(%166, %102) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %168 = "neura.data_mov"(%167) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %169 = "neura.fused_op"(%151, %168) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %276 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %277 = "neura.load"(%276) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%277 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %171 = "neura.data_mov"(%165) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %172 = "neura.mul"(%170, %171) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %173 = "neura.or"(%118, %101) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %174 = "neura.data_mov"(%173) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %175:2 = "neura.fused_op"(%158, %174) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %276 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %277 = "neura.load"(%276) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%276, %277 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %176 = "neura.data_mov"(%175#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %177 = "neura.data_mov"(%175#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %178 = "neura.data_mov"(%172) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %179 = "neura.add"(%177, %178) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %180 = "neura.data_mov"(%179) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%180, %176) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    neura.ctrl_mov %136 -> %69 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %144 -> %68 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %140 -> %67 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %152 -> %66 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %181 = neura.grant_predicate %117, %77 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %181 -> %65 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %159 -> %64 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %103 -> %63 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %109 -> %62 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %182 = "neura.data_mov"(%61) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %183 = neura.grant_predicate %182, %76 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %183 -> %60 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %105 -> %59 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %112 -> %58 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %122 -> %57 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %133 -> %56 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %130 -> %55 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %126 -> %54 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %184 = neura.grant_predicate %100, %99 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %185 = "neura.data_mov"(%184) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %186 = "neura.fused_op"(%104, %98, %185) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "grant_predicate->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i64, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = "neura.add"(%276, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %187 = "neura.data_mov"(%186) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %188 = "neura.data_mov"(%186) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %189 = neura.grant_predicate %111, %97 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %190 = "neura.data_mov"(%189) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %191 = "neura.data_mov"(%61) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %192 = "neura.data_mov"(%184) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %193:7 = "neura.fused_op"(%188, %190, %191, %96, %121, %192) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->not->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %276 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %277 = "neura.not"(%276) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %278 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %279 = neura.grant_predicate %278, %277 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %280 = neura.grant_predicate %arg7, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %281 = neura.grant_predicate %280, %277 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %282 = neura.grant_predicate %arg8, %276 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277, %278, %279, %280, %281, %282 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %194 = "neura.data_mov"(%193#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %195 = "neura.data_mov"(%193#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %196 = "neura.data_mov"(%193#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %197 = "neura.data_mov"(%193#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %198 = "neura.data_mov"(%193#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %199 = "neura.data_mov"(%193#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %200 = "neura.data_mov"(%193#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %201 = "neura.data_mov"(%193#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %202 = "neura.data_mov"(%193#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %203 = "neura.data_mov"(%193#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %204 = "neura.data_mov"(%193#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %205 = "neura.data_mov"(%193#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %206 = "neura.data_mov"(%193#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %207 = "neura.data_mov"(%193#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %208 = "neura.data_mov"(%193#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %209 = "neura.data_mov"(%193#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %210 = "neura.data_mov"(%193#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %211 = "neura.data_mov"(%193#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %212 = "neura.data_mov"(%193#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %213 = "neura.data_mov"(%193#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %214 = "neura.data_mov"(%193#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %215 = "neura.data_mov"(%193#5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %216 = "neura.data_mov"(%193#6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %217 = "neura.data_mov"(%193#6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %218:2 = "neura.fused_op"(%107, %95, %211) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %219 = "neura.data_mov"(%218#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %220 = "neura.data_mov"(%218#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %221:2 = "neura.fused_op"(%157, %94, %210) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%276, %277 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %222 = "neura.data_mov"(%221#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %223 = "neura.data_mov"(%221#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %224:2 = "neura.fused_op"(%150, %93, %209) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%276, %277 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %225 = "neura.data_mov"(%224#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %226 = "neura.data_mov"(%224#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %227:2 = "neura.fused_op"(%125, %92, %208) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %228 = "neura.data_mov"(%227#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %229 = "neura.data_mov"(%227#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %230:2 = "neura.fused_op"(%129, %91, %207) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %231 = "neura.data_mov"(%230#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %232 = "neura.data_mov"(%230#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %233:2 = "neura.fused_op"(%132, %90, %206) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%276, %277 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %234 = "neura.data_mov"(%233#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %235 = "neura.data_mov"(%233#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %236 = "neura.fused_op"(%116, %89, %205) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %237 = "neura.data_mov"(%236) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %238 = neura.grant_predicate %187, %204 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %238 -> %45 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %237 -> %43 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %235 -> %39 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %232 -> %37 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %229 -> %35 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %226 -> %32 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %223 -> %29 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %239 = "neura.data_mov"(%184) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %240 = neura.grant_predicate %239, %203 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %240 -> %26 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %220 -> %25 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %213 -> %22 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %241 = "neura.data_mov"(%189) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %242 = neura.grant_predicate %241, %202 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %242 -> %21 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %215 -> %20 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %243 = "neura.fused_op"(%214, %201, %217) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "grant_predicate->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i64, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = "neura.add"(%276, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %244 = "neura.data_mov"(%243) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %245 = "neura.data_mov"(%189) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %246 = neura.grant_predicate %245, %200 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %247 = "neura.data_mov"(%246) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %248:5 = "neura.fused_op"(%244, %247, %228, %199, %212) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->not->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %276 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %277 = "neura.not"(%276) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %278 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %279 = neura.grant_predicate %278, %277 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %280 = neura.grant_predicate %arg7, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %281 = neura.grant_predicate %280, %277 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %282 = neura.grant_predicate %arg3, %277 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%276, %277, %279, %281, %282 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %249 = "neura.data_mov"(%248#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %250 = "neura.data_mov"(%248#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %251 = "neura.data_mov"(%248#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %252 = "neura.data_mov"(%248#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %253 = "neura.data_mov"(%248#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %254 = "neura.data_mov"(%248#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %255 = "neura.data_mov"(%248#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %256 = "neura.data_mov"(%248#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %257 = "neura.data_mov"(%248#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %258 = "neura.data_mov"(%248#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %259 = "neura.data_mov"(%248#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %260 = "neura.data_mov"(%248#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %261 = "neura.fused_op"(%219, %198, %257) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %262 = "neura.data_mov"(%261) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %263 = "neura.fused_op"(%222, %197, %256) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%277 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %264 = "neura.data_mov"(%263) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %265 = "neura.fused_op"(%225, %196, %255) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%277 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %266 = "neura.data_mov"(%265) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %267 = "neura.fused_op"(%231, %195, %254) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%277 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %268 = "neura.data_mov"(%267) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %269 = "neura.fused_op"(%234, %194, %253) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %276 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %277 = neura.grant_predicate %276, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%277 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %270 = "neura.data_mov"(%269) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %260 -> %16 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %268 -> %12 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %258 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %270 -> %6 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %266 -> %5 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %264 -> %4 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %271 = neura.grant_predicate %216, %252 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %271 -> %3 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %262 -> %2 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %259 -> %1 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %272 = "neura.data_mov"(%246) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %273 = neura.grant_predicate %272, %251 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %273 -> %0 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %274 = neura.grant_predicate %250, %249 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %275 = "neura.data_mov"(%274) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %275 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

