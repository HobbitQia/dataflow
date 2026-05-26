#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2x1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2x2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2y1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2y2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.addressof @_ZZ4mainE2x1 {latency = 1 : i32} : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i8) {latency = 1 : i32} : i8
    %2 = llvm.mlir.constant(256 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.addressof @_ZZ4mainE2x2 {latency = 1 : i32} : !llvm.ptr
    %4 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.addressof @_ZZ4mainE2y1 {latency = 1 : i32} : !llvm.ptr
    %6 = llvm.mlir.constant(3 : i32) {latency = 1 : i32} : i32
    %7 = llvm.mlir.addressof @_ZZ4mainE2y2 {latency = 1 : i32} : !llvm.ptr
    %8 = llvm.mlir.constant(4 : i32) {latency = 1 : i32} : i32
    %9 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %10 = llvm.mlir.constant(64 : i64) {latency = 1 : i32} : i64
    %11 = llvm.mlir.constant(6 : i32) {latency = 1 : i32} : i32
    %12 = llvm.mlir.constant(63 : i32) {latency = 1 : i32} : i32
    %13 = llvm.mlir.addressof @_ZZ4mainE1A {latency = 1 : i32} : !llvm.ptr
    %14 = llvm.mlir.constant(4096 : i64) {latency = 1 : i32} : i64
    %15 = llvm.mlir.constant(6 : i64) {latency = 1 : i32} : i64
    %16 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    "llvm.intr.memset"(%3, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%4 : i64) {latency = 1 : i32}
  ^bb1(%17: i64):  // 2 preds: ^bb0, ^bb1
    %18 = llvm.getelementptr inbounds %5[0, %17] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %19 = llvm.trunc %17 {latency = 1 : i32} : i64 to i32
    %20 = llvm.add %19, %6 {latency = 1 : i32} : i32
    llvm.store %20, %18 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.getelementptr inbounds %7[0, %17] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %22 = llvm.trunc %17 {latency = 1 : i32} : i64 to i32
    %23 = llvm.add %22, %8 {latency = 1 : i32} : i32
    llvm.store %23, %21 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.add %17, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %25 = llvm.icmp "eq" %24, %10 {latency = 1 : i32} : i64
    llvm.cond_br %25, ^bb2(%4 : i64), ^bb1(%24 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%26: i64):  // 2 preds: ^bb1, ^bb2
    %27 = llvm.trunc %26 {latency = 1 : i32} : i64 to i32
    %28 = llvm.lshr %27, %11 {latency = 1 : i32} : i32
    %29 = llvm.and %27, %12 {latency = 1 : i32} : i32
    %30 = llvm.mul %28, %29 overflow<nsw, nuw> {latency = 1 : i32} : i32
    %31 = llvm.and %30, %12 {latency = 1 : i32} : i32
    %32 = llvm.getelementptr inbounds %13[0, %26] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    llvm.store %31, %32 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.add %26, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %34 = llvm.icmp "eq" %33, %14 {latency = 1 : i32} : i64
    llvm.cond_br %34, ^bb3(%4 : i64), ^bb2(%33 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3(%35: i64):  // 2 preds: ^bb2, ^bb5
    %36 = llvm.getelementptr inbounds %5[0, %35] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %37 = llvm.shl %35, %15 overflow<nsw> {latency = 1 : i32} : i64
    %38 = llvm.getelementptr inbounds %7[0, %35] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %39 = llvm.load %36 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %40 = llvm.load %38 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb4(%4 : i64) {latency = 1 : i32}
  ^bb4(%41: i64):  // 2 preds: ^bb3, ^bb4
    %42 = llvm.getelementptr inbounds %0[0, %41] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %43 = llvm.load %42 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.shl %41, %15 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %45 = llvm.add %44, %35 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %46 = llvm.getelementptr inbounds %13[0, %45] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.mul %39, %47 overflow<nsw> {latency = 1 : i32} : i32
    %49 = llvm.add %48, %43 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %49, %42 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.getelementptr inbounds %3[0, %41] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %51 = llvm.load %50 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.add %41, %37 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %53 = llvm.getelementptr inbounds %13[0, %52] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %54 = llvm.load %53 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.mul %40, %54 overflow<nsw> {latency = 1 : i32} : i32
    %56 = llvm.add %55, %51 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %56, %50 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %57 = llvm.add %41, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %58 = llvm.icmp "eq" %57, %10 {latency = 1 : i32} : i64
    llvm.cond_br %58, ^bb5, ^bb4(%57 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %59 = llvm.add %35, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %60 = llvm.icmp "eq" %59, %10 {latency = 1 : i32} : i64
    llvm.cond_br %60, ^bb6, ^bb3(%59 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    llvm.return {latency = 1 : i32} %16 : i32
  }
  func.func @_Z6kernelPiS_PKiS1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = neura.reserve : !neura.data<i64, i1>
    %1 = neura.reserve : !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %3 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %4 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6:2 = "neura.fused_op"(%5) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %181 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %182 = neura.phi_start %181, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%181, %182 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %7 = "neura.data_mov"(%6#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %8 = "neura.data_mov"(%6#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %9 = "neura.data_mov"(%6#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %11 = "neura.fused_op"(%10) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %181 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %182 = neura.phi_start %181, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%182 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %12 = "neura.data_mov"(%11) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %13 = "neura.data_mov"(%11) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = "neura.fused_op"(%14) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %181 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %182 = neura.phi_start %181, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%182 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = "neura.data_mov"(%15) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = "neura.data_mov"(%15) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = "neura.fused_op"(%18) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %181 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %182 = neura.phi_start %181, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%182 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %20 = "neura.data_mov"(%19) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %21 = "neura.data_mov"(%19) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23:2 = "neura.fused_op"(%7, %22, %17) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "phi_start->shl"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %181 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %182 = "neura.shl"(%181, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%181, %182 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %24 = "neura.data_mov"(%23#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.data_mov"(%23#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.data_mov"(%23#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.data_mov"(%23#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.gep"(%21, %26) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = "neura.gep"(%13, %25) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %32 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = "neura.fused_op"(%0, %33) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %181 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %182 = neura.phi_start %181, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %183 = neura.phi_start %182, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%183 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %35 = "neura.data_mov"(%34) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = "neura.data_mov"(%34) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = "neura.fused_op"(%1, %37) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %181 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %182 = neura.phi_start %181, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %183 = neura.phi_start %182, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%183 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %40 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %43 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = neura.phi_start %43, %42 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %47 = "neura.fused_op"(%2, %46) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %181 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %182 = neura.phi_start %181, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %183 = neura.phi_start %182, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%183 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %48 = "neura.data_mov"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %49 = "neura.data_mov"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %50 = "neura.data_mov"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %51 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %52 = "neura.data_mov"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %53 = neura.phi_start %52, %51 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %54 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %55 = "neura.fused_op"(%3, %54) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %181 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %182 = neura.phi_start %181, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %183 = neura.phi_start %182, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%183 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = "neura.data_mov"(%55) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.data_mov"(%55) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %58 = "neura.data_mov"(%55) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %59 = "neura.data_mov"(%55) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61 = neura.reserve : !neura.data<i64, i1>
    %62 = neura.phi_start %16, %61 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %63 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %64 = neura.reserve : !neura.data<i64, i1>
    %65 = "neura.data_mov"(%62) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66:3 = "neura.fused_op"(%9, %64, %65, %41) <{frequency = 3 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %181 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %182 = "neura.shl"(%181, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %183 = "neura.add"(%181, %arg8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%181, %182, %183 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %67 = "neura.data_mov"(%66#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = "neura.data_mov"(%66#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.data_mov"(%66#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.data_mov"(%66#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71 = "neura.data_mov"(%66#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %72 = "neura.data_mov"(%66#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %73:3 = "neura.fused_op"(%4, %63, %69) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:grant_once->phi_start->phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i64, i1>):
      %181 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %182 = neura.phi_start %181, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %183 = neura.phi_start %182, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %184 = "neura.gep"(%183, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %185 = "neura.load"(%184) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%183, %184, %185 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %74 = "neura.data_mov"(%73#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %75 = "neura.data_mov"(%73#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %76 = "neura.data_mov"(%73#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = "neura.data_mov"(%73#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %78:2 = "neura.fused_op"(%27, %45, %68) <{frequency = 3 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %181 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %182 = "neura.add"(%arg7, %181) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%181, %182 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %79 = "neura.data_mov"(%78#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80 = "neura.data_mov"(%78#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81:2 = "neura.fused_op"(%24, %60, %70) <{frequency = 3 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %181 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %182 = "neura.add"(%arg7, %181) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%181, %182 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %82 = "neura.data_mov"(%81#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = "neura.data_mov"(%81#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %84 = "neura.data_mov"(%81#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %85:4 = "neura.fused_op"(%72, %36, %83, %40) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %181 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %182 = neura.grant_predicate %arg7, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %183 = neura.grant_predicate %arg8, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %184 = neura.grant_predicate %arg6, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%181, %182, %183, %184 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %86 = "neura.data_mov"(%85#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %87 = "neura.data_mov"(%85#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %88 = "neura.data_mov"(%85#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %89 = "neura.data_mov"(%85#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %90 = "neura.data_mov"(%85#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %91 = "neura.data_mov"(%85#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %92 = "neura.data_mov"(%85#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %93 = "neura.data_mov"(%85#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %94 = "neura.data_mov"(%85#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %95 = "neura.data_mov"(%85#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96 = "neura.data_mov"(%85#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %97 = "neura.data_mov"(%85#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.data_mov"(%85#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %99 = "neura.data_mov"(%62) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100:5 = "neura.fused_op"(%93, %71, %75, %99, %82) <{frequency = 10 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i64, i1>):
      %181 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %182 = neura.grant_predicate %arg6, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %183 = neura.grant_predicate %arg7, %181 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %184 = neura.grant_predicate %arg8, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %185 = neura.grant_predicate %arg9, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%181, %182, %183, %184, %185 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %101 = "neura.data_mov"(%100#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %102 = "neura.data_mov"(%100#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %103 = "neura.data_mov"(%100#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %104 = "neura.data_mov"(%100#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %105 = "neura.data_mov"(%100#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %106 = "neura.data_mov"(%100#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %107 = "neura.data_mov"(%100#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %108 = "neura.data_mov"(%100#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %109 = "neura.data_mov"(%100#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %110 = "neura.data_mov"(%100#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %111 = "neura.data_mov"(%100#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %112 = "neura.data_mov"(%100#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %113 = "neura.data_mov"(%100#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %114 = "neura.data_mov"(%100#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %115:2 = "neura.fused_op"(%50, %67) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %181 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %182 = "neura.load"(%181) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%181, %182 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %116 = "neura.data_mov"(%115#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %117 = "neura.data_mov"(%115#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %118 = "neura.fused_op"(%59, %84) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %181 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %182 = "neura.load"(%181) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%182 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %120 = "neura.data_mov"(%53) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %121 = "neura.fused_op"(%120, %119) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i32, i1>):
      %181 = "neura.load"(%arg5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %182 = "neura.mul"(%181, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%182 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %122 = "neura.data_mov"(%121) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %123 = "neura.add"(%122, %77) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %124 = "neura.data_mov"(%123) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%124, %76) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %125 = "neura.fused_op"(%58, %80) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %181 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %182 = "neura.load"(%181) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%182 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %126 = "neura.data_mov"(%125) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %127 = "neura.data_mov"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %128 = "neura.fused_op"(%127, %126) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i32, i1>):
      %181 = "neura.load"(%arg5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %182 = "neura.mul"(%181, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%182 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %129 = "neura.data_mov"(%128) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %130 = "neura.add"(%129, %117) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %131 = "neura.data_mov"(%130) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%131, %116) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %132:2 = "neura.fused_op"(%8, %30, %110, %92) <{frequency = 3 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>, %arg8: !neura.data<i1, i1>):
      %181 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %182 = neura.grant_predicate %181, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %183 = neura.grant_predicate %181, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%182, %183 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %133 = "neura.data_mov"(%132#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134 = "neura.data_mov"(%132#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %135:2 = "neura.fused_op"(%12, %31, %109) <{frequency = 23 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i1, i1>):
      %181 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %182 = neura.grant_predicate %181, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%181, %182 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %136 = "neura.data_mov"(%135#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %137 = "neura.data_mov"(%135#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %138:2 = "neura.fused_op"(%20, %32, %108) <{frequency = 23 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i1, i1>):
      %181 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %182 = neura.grant_predicate %181, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%181, %182 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %139 = "neura.data_mov"(%138#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %140 = "neura.data_mov"(%138#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %111 -> %64 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %112 -> %63 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %113 -> %61 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %114 -> %60 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %141 = neura.grant_predicate %57, %107 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %141 -> %54 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %142 = "neura.data_mov"(%53) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %143 = neura.grant_predicate %142, %106 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %143 -> %51 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %144 = neura.grant_predicate %49, %105 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %144 -> %46 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %145 = neura.grant_predicate %79, %104 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %145 -> %45 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %146 = "neura.data_mov"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %147 = neura.grant_predicate %146, %103 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %147 -> %42 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %148 = neura.grant_predicate %39, %102 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %148 -> %37 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %149 = neura.grant_predicate %35, %101 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %149 -> %33 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %140 -> %32 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %137 -> %31 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %133 -> %30 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %150 = "neura.data_mov"(%62) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %151 = neura.grant_predicate %150, %91 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %152 = "neura.add"(%94, %96) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %153 = "neura.data_mov"(%152) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %154:2 = "neura.fused_op"(%153, %98) <{frequency = 12 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %181 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %182 = neura.grant_predicate %181, %181 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%181, %182 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %155 = "neura.data_mov"(%154#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %156 = "neura.data_mov"(%154#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %157 = "neura.data_mov"(%151) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %158 = "neura.data_mov"(%152) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %159:5 = "neura.fused_op"(%155, %134, %157, %95, %158) <{frequency = 10 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i64, i1>):
      %181 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %182 = neura.grant_predicate %arg6, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %183 = neura.grant_predicate %arg7, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %184 = neura.grant_predicate %arg8, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %185 = neura.grant_predicate %arg9, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%181, %182, %183, %184, %185 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %160 = "neura.data_mov"(%159#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %161 = "neura.data_mov"(%159#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %162 = "neura.data_mov"(%159#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %163 = "neura.data_mov"(%159#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %164 = "neura.data_mov"(%159#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %165 = "neura.data_mov"(%159#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %166 = "neura.data_mov"(%159#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %167 = "neura.data_mov"(%159#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %168 = "neura.data_mov"(%159#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %169 = "neura.data_mov"(%159#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %170 = "neura.fused_op"(%48, %90, %165) <{frequency = 8 : i64, pattern_id = 8 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %181 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %182 = neura.grant_predicate %181, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%182 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %171 = "neura.data_mov"(%170) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %172 = "neura.fused_op"(%56, %89, %164) <{frequency = 8 : i64, pattern_id = 8 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %181 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %182 = neura.grant_predicate %181, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%182 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %173 = "neura.data_mov"(%172) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %174 = "neura.fused_op"(%74, %88, %163) <{frequency = 8 : i64, pattern_id = 8 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %181 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %182 = neura.grant_predicate %181, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%182 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %175 = "neura.data_mov"(%174) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %176 = "neura.fused_op"(%136, %87, %162) <{frequency = 8 : i64, pattern_id = 8 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %181 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %182 = neura.grant_predicate %181, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%182 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %177 = "neura.data_mov"(%176) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %178 = "neura.fused_op"(%139, %86, %161) <{frequency = 8 : i64, pattern_id = 8 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %181 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %182 = neura.grant_predicate %181, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%182 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %179 = "neura.data_mov"(%178) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %169 -> %22 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %179 -> %18 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %167 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %177 -> %10 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %166 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %175 -> %4 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %173 -> %3 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %171 -> %2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %168 -> %1 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %180 = neura.grant_predicate %97, %160 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %180 -> %0 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %156 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

