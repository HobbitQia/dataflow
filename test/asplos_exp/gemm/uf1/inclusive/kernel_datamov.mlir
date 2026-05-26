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
    %2 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 6 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 64 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %10 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = neura.phi_start %12, %11 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = "neura.data_mov"(%3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = neura.phi_start %15, %14 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21:2 = "neura.fused_op"(%19, %17, %20, %18) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->shl->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %243 = "neura.shl"(%242, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %244 = neura.phi_start %242, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%243, %244 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %22 = "neura.data_mov"(%21#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23 = "neura.data_mov"(%21#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %27 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %28 = neura.reserve : !neura.data<i64, i1>
    %29 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = neura.phi_start %29, %28 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<i64, i1>
    %32 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = neura.phi_start %32, %31 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %35 = "neura.fused_op"(%10, %34) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %242 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %243 = neura.phi_start %242, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %244 = neura.phi_start %243, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%244 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %36 = "neura.data_mov"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = "neura.data_mov"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41 = "neura.data_mov"(%33) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %42:2 = "neura.fused_op"(%40, %39, %41) <{frequency = 4 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->shl"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %243 = "neura.shl"(%242, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%242, %243 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %43 = "neura.data_mov"(%42#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = "neura.data_mov"(%42#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.data_mov"(%42#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %46:2 = "neura.fused_op"(%22, %38, %44) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %243 = "neura.add"(%arg5, %242) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%242, %243 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %47 = "neura.data_mov"(%46#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %48 = "neura.data_mov"(%46#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %49 = "neura.gep"(%37, %48) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = neura.reserve : !neura.data<i64, i1>
    %52 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %53 = neura.reserve : !neura.data<i64, i1>
    %54 = neura.reserve : !neura.data<i64, i1>
    %55 = neura.phi_start %43, %54 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %56 = neura.reserve : !neura.data<i64, i1>
    %57 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = "neura.fused_op"(%57, %6, %24, %56) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %243 = neura.phi_start %242, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %244 = neura.phi_start %243, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%244 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.data_mov"(%58) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.data_mov"(%58) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = "neura.data_mov"(%58) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62 = neura.reserve : !neura.data<i64, i1>
    %63 = "neura.data_mov"(%4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64 = "neura.fused_op"(%63, %7, %25, %62) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %243 = neura.phi_start %242, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %244 = neura.phi_start %243, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%244 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.data_mov"(%64) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.data_mov"(%64) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = "neura.data_mov"(%64) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %69 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.fused_op"(%69, %8, %26, %68) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %243 = neura.phi_start %242, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %244 = neura.phi_start %243, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%244 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.data_mov"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = "neura.data_mov"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %73 = "neura.data_mov"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %74 = neura.reserve : !neura.data<i64, i1>
    %75 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %76 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = "neura.fused_op"(%76, %9, %27, %75) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %243 = neura.phi_start %242, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %244 = neura.phi_start %243, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%244 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %78 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %80 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %81 = neura.reserve : !neura.data<i64, i1>
    %82 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %83 = "neura.data_mov"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = neura.phi_start %83, %82 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %85 = neura.reserve : !neura.data<i64, i1>
    %86 = "neura.data_mov"(%30) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %87:2 = "neura.fused_op"(%86, %85, %67) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %243 = "neura.add"(%242, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%242, %243 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %88 = "neura.data_mov"(%87#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %89 = "neura.data_mov"(%87#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %90 = "neura.data_mov"(%87#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %91 = "neura.data_mov"(%87#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %92:2 = "neura.fused_op"(%47, %74, %89) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %243 = "neura.add"(%arg5, %242) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%242, %243 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %93 = "neura.data_mov"(%92#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %94 = "neura.data_mov"(%92#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %95 = "neura.data_mov"(%92#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96:2 = "neura.fused_op"(%45, %81, %88) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %243 = "neura.add"(%arg5, %242) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%242, %243 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %97 = "neura.data_mov"(%96#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.data_mov"(%96#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %99 = "neura.data_mov"(%84) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %100 = "neura.load"(%99) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %101 = "neura.gep"(%80, %98) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %102 = "neura.data_mov"(%101) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.load"(%102) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %104 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %105 = "neura.data_mov"(%100) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %106 = "neura.mul"(%104, %105) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %107 = "neura.gep"(%73, %95) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %108 = "neura.data_mov"(%107) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %109 = "neura.load"(%108) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %110 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %111 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %112 = "neura.add"(%110, %111) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %113 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %114 = "neura.data_mov"(%107) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%113, %114) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %115 = "neura.data_mov"(%55) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %116:2 = "neura.fused_op"(%91, %61, %115) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %242 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %243 = neura.grant_predicate %arg5, %242 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%242, %243 : !neura.data<i1, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>)
    %117 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %118 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %119 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %120 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %121 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %122 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %123 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %124 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %125 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %126 = "neura.data_mov"(%116#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %127:4 = "neura.fused_op"(%125, %90, %23, %53) <{frequency = 9 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->fused_op:phi_start->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %242 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %243 = neura.grant_predicate %arg4, %242 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %244 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %245 = neura.grant_predicate %244, %242 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %246 = neura.grant_predicate %244, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%242, %243, %245, %246 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %128 = "neura.data_mov"(%127#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %129 = "neura.data_mov"(%127#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %130 = "neura.data_mov"(%127#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %131 = "neura.data_mov"(%127#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %132 = "neura.data_mov"(%127#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %133 = "neura.data_mov"(%127#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %134 = "neura.data_mov"(%127#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %135 = "neura.data_mov"(%127#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %136 = "neura.data_mov"(%127#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %137 = "neura.data_mov"(%127#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %138 = "neura.data_mov"(%127#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %139 = "neura.data_mov"(%127#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %140 = "neura.data_mov"(%127#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %141 = "neura.data_mov"(%127#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %142 = "neura.data_mov"(%127#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %143 = "neura.data_mov"(%30) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %144:2 = "neura.fused_op"(%143, %50, %138) <{frequency = 22 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%242, %243 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %145 = "neura.data_mov"(%144#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %146 = "neura.data_mov"(%144#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %147 = "neura.data_mov"(%33) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %148:2 = "neura.fused_op"(%147, %51, %137) <{frequency = 22 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%242, %243 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %149 = "neura.data_mov"(%148#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %150 = "neura.data_mov"(%148#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %151:2 = "neura.fused_op"(%36, %52, %136) <{frequency = 22 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%242, %243 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %152 = "neura.data_mov"(%151#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %153 = "neura.data_mov"(%151#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %139 -> %85 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %154 = "neura.data_mov"(%84) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %155 = neura.grant_predicate %154, %135 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %155 -> %82 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %156 = neura.grant_predicate %97, %134 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %156 -> %81 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %157 = neura.grant_predicate %79, %133 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %157 -> %75 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %158 = neura.grant_predicate %94, %132 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %158 -> %74 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %159 = neura.grant_predicate %72, %131 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %159 -> %68 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %160 = neura.grant_predicate %66, %130 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %160 -> %62 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %161 = neura.grant_predicate %60, %129 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %161 -> %56 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %162 = "neura.data_mov"(%55) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %163 = neura.grant_predicate %162, %128 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %163 -> %54 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %140 -> %53 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %153 -> %52 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %150 -> %51 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %146 -> %50 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %164 = neura.grant_predicate %65, %124 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %165 = neura.grant_predicate %59, %123 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %166 = "neura.data_mov"(%164) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %167 = "neura.add"(%126, %166) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %168 = "neura.data_mov"(%167) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %169 = "neura.data_mov"(%165) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %170 = "neura.data_mov"(%164) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %171:3 = "neura.fused_op"(%168, %169, %142, %170) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:icmp->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %242 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %243 = neura.grant_predicate %arg5, %242 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %244 = neura.grant_predicate %arg6, %242 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%242, %243, %244 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %172 = "neura.data_mov"(%171#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %173 = "neura.data_mov"(%171#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %174 = "neura.data_mov"(%171#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %175 = "neura.data_mov"(%171#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %176 = "neura.data_mov"(%171#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %177 = "neura.data_mov"(%171#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %178 = "neura.data_mov"(%171#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %179 = "neura.data_mov"(%171#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %180 = "neura.data_mov"(%171#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %181 = "neura.data_mov"(%167) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %182:4 = "neura.fused_op"(%177, %181, %145, %122) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %242 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %243 = neura.grant_predicate %arg4, %242 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %244 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %245 = neura.grant_predicate %244, %242 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %246 = neura.grant_predicate %244, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%242, %243, %245, %246 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %183 = "neura.data_mov"(%182#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %184 = "neura.data_mov"(%182#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %185 = "neura.data_mov"(%182#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %186 = "neura.data_mov"(%182#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %187 = "neura.data_mov"(%182#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %188 = "neura.data_mov"(%182#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %189 = "neura.data_mov"(%182#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %190 = "neura.data_mov"(%182#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %191 = "neura.data_mov"(%182#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %192 = "neura.data_mov"(%182#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %193 = "neura.data_mov"(%182#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %194:2 = "neura.fused_op"(%71, %121, %190) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%242, %243 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %195 = "neura.data_mov"(%194#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %196 = "neura.data_mov"(%194#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %197:2 = "neura.fused_op"(%78, %120, %189) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%242, %243 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %198 = "neura.data_mov"(%197#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %199 = "neura.data_mov"(%197#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %200:2 = "neura.fused_op"(%149, %119, %188) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%242, %243 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %201 = "neura.data_mov"(%200#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %202 = "neura.data_mov"(%200#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %203:2 = "neura.fused_op"(%152, %118, %187) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%242, %243 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %204 = "neura.data_mov"(%203#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %205 = "neura.data_mov"(%203#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %206 = "neura.fused_op"(%93, %117, %186) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%243 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %207 = "neura.data_mov"(%206) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %191 -> %39 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %207 -> %38 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %205 -> %34 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %202 -> %31 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %192 -> %28 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %199 -> %27 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %196 -> %26 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %208 = "neura.data_mov"(%164) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %209 = neura.grant_predicate %208, %185 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %209 -> %25 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %210 = "neura.data_mov"(%165) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %211 = neura.grant_predicate %210, %184 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %211 -> %24 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %212 = neura.grant_predicate %141, %183 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %212 -> %18 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %213 = "neura.data_mov"(%165) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %214 = neura.grant_predicate %213, %176 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %215 = "neura.add"(%178, %180) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %216 = "neura.data_mov"(%215) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %217 = "neura.data_mov"(%214) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %218:2 = "neura.fused_op"(%216, %217) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %242 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %243 = neura.grant_predicate %242, %242 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%242, %243 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %219 = "neura.data_mov"(%218#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %220 = "neura.data_mov"(%218#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %221:3 = "neura.fused_op"(%219, %193, %179) <{frequency = 14 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:not->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %242 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %243 = neura.grant_predicate %arg4, %242 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %244 = neura.grant_predicate %arg5, %242 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%242, %243, %244 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %222 = "neura.data_mov"(%221#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %223 = "neura.data_mov"(%221#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %224 = "neura.data_mov"(%221#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %225 = "neura.data_mov"(%221#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %226 = "neura.data_mov"(%221#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %227 = "neura.data_mov"(%221#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %228 = "neura.data_mov"(%221#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %229 = "neura.data_mov"(%221#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %230 = "neura.fused_op"(%195, %175, %227) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%243 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %231 = "neura.data_mov"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %232 = "neura.fused_op"(%198, %174, %226) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%243 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %233 = "neura.data_mov"(%232) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %234 = "neura.fused_op"(%201, %173, %225) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%243 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %235 = "neura.data_mov"(%234) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %236 = "neura.fused_op"(%204, %172, %224) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %242 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %243 = neura.grant_predicate %242, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%243 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %237 = "neura.data_mov"(%236) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %238 = "neura.data_mov"(%215) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %239 = neura.grant_predicate %238, %223 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %239 -> %17 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %235 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %228 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %237 -> %10 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %233 -> %9 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %231 -> %8 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %229 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %240 = "neura.data_mov"(%214) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %241 = neura.grant_predicate %240, %222 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %241 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %220 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

