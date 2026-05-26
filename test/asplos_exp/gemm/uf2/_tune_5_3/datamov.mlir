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
    %15 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = neura.phi_start %15, %14 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = "neura.data_mov"(%3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = neura.phi_start %18, %17 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = neura.phi_start %21, %20 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %23 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = "neura.data_mov"(%19) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.shl"(%23, %24) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = neura.phi_start %27, %26 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = "neura.fused_op"(%7, %29) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %307 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %308 = neura.phi_start %307, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %309 = neura.phi_start %308, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%309 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = "neura.data_mov"(%30) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = neura.phi_start %38, %37 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = "neura.data_mov"(%19) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %42 = neura.phi_start %41, %40 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %43 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %44 = "neura.fused_op"(%13, %43) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %307 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %308 = neura.phi_start %307, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %309 = neura.phi_start %308, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%309 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.data_mov"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.data_mov"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = "neura.data_mov"(%25) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %49 = neura.phi_start %48, %47 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.data_mov"(%49) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %53:2 = "neura.fused_op"(%51, %50, %52) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %308 = "neura.add"(%307, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%307, %308 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %54 = "neura.data_mov"(%53#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = "neura.data_mov"(%53#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56 = "neura.data_mov"(%53#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.gep"(%46, %56) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %58 = "neura.data_mov"(%42) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.shl"(%55, %58) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61 = neura.reserve : !neura.data<i64, i1>
    %62 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %63 = neura.reserve : !neura.data<i64, i1>
    %64 = neura.reserve : !neura.data<i64, i1>
    %65 = neura.reserve : !neura.data<i64, i1>
    %66 = neura.reserve : !neura.data<i64, i1>
    %67 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = "neura.fused_op"(%67, %8, %32, %66) <{frequency = 5 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %308 = neura.phi_start %307, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %309 = neura.phi_start %308, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%309 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.data_mov"(%68) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.data_mov"(%68) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71 = "neura.data_mov"(%68) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %72 = neura.reserve : !neura.data<i64, i1>
    %73 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %74 = "neura.fused_op"(%73, %9, %33, %72) <{frequency = 5 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %308 = neura.phi_start %307, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %309 = neura.phi_start %308, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%309 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %75 = "neura.data_mov"(%74) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %76 = "neura.data_mov"(%74) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %77 = "neura.data_mov"(%74) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = neura.reserve : !neura.data<i64, i1>
    %79 = "neura.data_mov"(%4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80 = "neura.fused_op"(%79, %10, %34, %78) <{frequency = 5 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %308 = neura.phi_start %307, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %309 = neura.phi_start %308, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%309 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %84 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %85 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %86 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = "neura.fused_op"(%86, %11, %35, %85) <{frequency = 5 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %308 = neura.phi_start %307, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %309 = neura.phi_start %308, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%309 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = "neura.data_mov"(%87) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %89 = "neura.data_mov"(%87) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %90 = "neura.data_mov"(%87) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %91 = "neura.data_mov"(%87) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %92 = neura.reserve : !neura.data<i64, i1>
    %93 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %94 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %95 = "neura.fused_op"(%94, %12, %36, %93) <{frequency = 5 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %308 = neura.phi_start %307, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %309 = neura.phi_start %308, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%309 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %96 = "neura.data_mov"(%95) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %97 = "neura.data_mov"(%95) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %98 = "neura.data_mov"(%95) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %99 = "neura.data_mov"(%95) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %100 = neura.reserve : !neura.data<i64, i1>
    %101 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %102 = "neura.data_mov"(%57) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = neura.phi_start %102, %101 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %104 = neura.reserve : !neura.data<i64, i1>
    %105 = "neura.data_mov"(%39) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %106:2 = "neura.fused_op"(%105, %104, %77) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %308 = "neura.add"(%307, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%307, %308 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %107 = "neura.data_mov"(%106#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %108 = "neura.data_mov"(%106#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %109 = "neura.data_mov"(%106#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %110 = "neura.data_mov"(%106#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %111 = "neura.data_mov"(%39) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %112:6 = "neura.fused_op"(%109, %71, %110, %54, %65, %111, %60) <{frequency = 5 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:icmp->grant_predicate->fused_op:phi_start->grant_predicate->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i64, i1>):
      %307 = "neura.icmp"(%arg3, %arg4) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %308 = neura.grant_predicate %arg5, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %309 = neura.phi_start %arg6, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %310 = neura.grant_predicate %309, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %311 = neura.phi_start %arg8, %arg9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %312 = neura.grant_predicate %311, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%307, %308, %309, %310, %311, %312 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %113 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %114 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %115 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %116 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %117 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %118 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %119 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %120 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %121 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %122 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %123 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %124 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %125 = "neura.data_mov"(%112#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %126 = "neura.data_mov"(%112#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %127 = "neura.data_mov"(%112#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %128 = "neura.data_mov"(%112#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %129 = "neura.data_mov"(%112#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %130 = "neura.data_mov"(%112#5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %131 = "neura.data_mov"(%49) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %132:2 = "neura.fused_op"(%131, %92, %108) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %308 = "neura.add"(%arg5, %307) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%307, %308 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %133 = "neura.data_mov"(%132#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134 = "neura.data_mov"(%132#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %135 = "neura.data_mov"(%132#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %136 = "neura.data_mov"(%132#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %137 = "neura.data_mov"(%59) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %138:2 = "neura.fused_op"(%137, %100, %107) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %308 = "neura.add"(%arg5, %307) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%307, %308 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %139 = "neura.data_mov"(%138#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %140 = "neura.data_mov"(%138#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %141 = "neura.data_mov"(%138#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %142 = "neura.data_mov"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %143 = "neura.load"(%142) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %144 = "neura.gep"(%99, %141) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %145 = "neura.data_mov"(%144) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %146 = "neura.load"(%145) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %147 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %148 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %149 = "neura.mul"(%147, %148) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %150 = "neura.gep"(%91, %136) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %151 = "neura.data_mov"(%150) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %152 = "neura.load"(%151) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %153 = "neura.data_mov"(%152) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %154 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %155 = "neura.add"(%153, %154) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %156 = "neura.data_mov"(%155) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %157 = "neura.data_mov"(%150) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%156, %157) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %158 = "neura.data_mov"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %159 = "neura.load"(%158) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %160 = "neura.or"(%140, %84) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %161 = "neura.data_mov"(%160) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %162 = "neura.gep"(%98, %161) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %163 = "neura.data_mov"(%162) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %164 = "neura.load"(%163) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %165 = "neura.data_mov"(%164) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %166 = "neura.data_mov"(%159) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %167 = "neura.mul"(%165, %166) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %168 = "neura.or"(%135, %83) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %169 = "neura.data_mov"(%168) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %170 = "neura.gep"(%90, %169) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %171 = "neura.data_mov"(%170) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %172 = "neura.load"(%171) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %173 = "neura.data_mov"(%172) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %174 = "neura.data_mov"(%167) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %175 = "neura.add"(%173, %174) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %176 = "neura.data_mov"(%175) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %177 = "neura.data_mov"(%170) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%176, %177) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %178 = "neura.data_mov"(%42) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %179:2 = "neura.fused_op"(%178, %61, %125) <{frequency = 26 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%307, %308 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %180 = "neura.data_mov"(%179#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %181 = "neura.data_mov"(%179#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %182:2 = "neura.fused_op"(%45, %62, %124) <{frequency = 26 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%307, %308 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %183 = "neura.data_mov"(%182#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %184 = "neura.data_mov"(%182#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %185 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %186:2 = "neura.fused_op"(%185, %63, %123) <{frequency = 26 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%307, %308 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %187 = "neura.data_mov"(%186#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %188 = "neura.data_mov"(%186#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %189:2 = "neura.fused_op"(%31, %64, %122) <{frequency = 26 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%307, %308 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %190 = "neura.data_mov"(%189#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %191 = "neura.data_mov"(%189#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %192:2 = "neura.fused_op"(%121, %127) <{frequency = 34 : i64, pattern_id = 3 : i64, pattern_name = "not->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>):
      %307 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %308 = neura.grant_predicate %arg4, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%307, %308 : !neura.data<i1, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>)
    %193 = "neura.data_mov"(%192#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %194 = "neura.data_mov"(%192#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %195 = "neura.data_mov"(%192#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %196 = "neura.data_mov"(%192#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %197 = "neura.data_mov"(%192#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %198 = "neura.data_mov"(%192#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %199 = "neura.data_mov"(%192#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %200 = "neura.data_mov"(%192#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %201 = "neura.data_mov"(%192#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %202 = "neura.data_mov"(%192#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %203 = "neura.data_mov"(%192#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %126 -> %104 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %204 = "neura.data_mov"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %205 = neura.grant_predicate %204, %120 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %205 -> %101 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %206 = neura.grant_predicate %139, %119 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %206 -> %100 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %207 = neura.grant_predicate %97, %118 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %207 -> %93 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %208 = neura.grant_predicate %134, %117 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %208 -> %92 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %209 = neura.grant_predicate %89, %116 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %209 -> %85 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %210 = neura.grant_predicate %82, %115 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %210 -> %78 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %211 = neura.grant_predicate %76, %114 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %211 -> %72 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %212 = neura.grant_predicate %70, %113 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %212 -> %66 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %128 -> %65 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %191 -> %64 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %188 -> %63 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %184 -> %62 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %181 -> %61 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %130 -> %60 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %213 = neura.grant_predicate %81, %202 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %214 = neura.grant_predicate %190, %201 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %215 = neura.grant_predicate %187, %200 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %216 = "neura.data_mov"(%213) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %217 = "neura.add"(%203, %216) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %218 = "neura.data_mov"(%217) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %219 = "neura.data_mov"(%214) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %220 = "neura.data_mov"(%215) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %221 = "neura.data_mov"(%213) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %222:3 = "neura.fused_op"(%218, %219, %220, %221) <{frequency = 11 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:icmp->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %307 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %308 = neura.grant_predicate %arg5, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %309 = neura.grant_predicate %arg6, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%307, %308, %309 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %223 = "neura.data_mov"(%222#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %224 = "neura.data_mov"(%222#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %225 = "neura.data_mov"(%222#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %226 = "neura.data_mov"(%222#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %227 = "neura.data_mov"(%222#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %228 = "neura.data_mov"(%222#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %229 = "neura.data_mov"(%222#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %230 = "neura.data_mov"(%222#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %231 = "neura.data_mov"(%222#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %232 = "neura.data_mov"(%222#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %233 = "neura.data_mov"(%222#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %234 = "neura.data_mov"(%217) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %235:6 = "neura.fused_op"(%230, %234, %69, %199, %129) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %307 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %308 = neura.grant_predicate %arg4, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %309 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %310 = neura.grant_predicate %309, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %311 = neura.grant_predicate %arg7, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %312 = neura.grant_predicate %311, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%307, %308, %309, %310, %311, %312 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %236 = "neura.data_mov"(%235#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %237 = "neura.data_mov"(%235#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %238 = "neura.data_mov"(%235#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %239 = "neura.data_mov"(%235#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %240 = "neura.data_mov"(%235#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %241 = "neura.data_mov"(%235#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %242 = "neura.data_mov"(%235#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %243 = "neura.data_mov"(%235#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %244 = "neura.data_mov"(%235#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %245 = "neura.data_mov"(%235#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %246 = "neura.data_mov"(%235#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %247 = "neura.data_mov"(%235#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %248 = "neura.data_mov"(%235#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %249 = "neura.data_mov"(%235#5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %250:2 = "neura.fused_op"(%75, %198, %244) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%307, %308 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %251 = "neura.data_mov"(%250#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %252 = "neura.data_mov"(%250#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %253:2 = "neura.fused_op"(%88, %197, %243) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%307, %308 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %254 = "neura.data_mov"(%253#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %255 = "neura.data_mov"(%253#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %256:2 = "neura.fused_op"(%96, %196, %242) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%307, %308 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %257 = "neura.data_mov"(%256#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %258 = "neura.data_mov"(%256#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %259:2 = "neura.fused_op"(%180, %195, %241) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%307, %308 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %260 = "neura.data_mov"(%259#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %261 = "neura.data_mov"(%259#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %262:2 = "neura.fused_op"(%183, %194, %240) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%307, %308 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %263 = "neura.data_mov"(%262#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %264 = "neura.data_mov"(%262#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %265 = "neura.fused_op"(%133, %193, %239) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%308 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %266 = "neura.data_mov"(%265) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %245 -> %50 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %266 -> %47 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %264 -> %43 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %261 -> %40 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %249 -> %37 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %258 -> %36 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %255 -> %35 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %267 = "neura.data_mov"(%213) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %268 = neura.grant_predicate %267, %238 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %268 -> %34 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %252 -> %33 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %247 -> %32 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %269 = "neura.data_mov"(%214) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %270 = neura.grant_predicate %269, %237 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %270 -> %29 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %271 = "neura.data_mov"(%215) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %272 = neura.grant_predicate %271, %236 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %272 -> %26 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %273 = "neura.data_mov"(%214) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %274 = neura.grant_predicate %273, %229 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %275 = neura.grant_predicate %248, %228 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %276 = "neura.add"(%231, %233) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %277 = "neura.data_mov"(%276) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %278 = "neura.data_mov"(%274) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %279:2 = "neura.fused_op"(%277, %278) <{frequency = 27 : i64, pattern_id = 2 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %307 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %308 = neura.grant_predicate %307, %307 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%307, %308 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %280 = "neura.data_mov"(%279#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %281 = "neura.data_mov"(%279#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %282 = "neura.data_mov"(%275) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %283:4 = "neura.fused_op"(%280, %282, %251, %227, %246) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %307 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %308 = neura.grant_predicate %arg4, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %309 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %310 = neura.grant_predicate %309, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %311 = neura.grant_predicate %arg7, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %312 = neura.grant_predicate %311, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%307, %308, %310, %312 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %284 = "neura.data_mov"(%283#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %285 = "neura.data_mov"(%283#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %286 = "neura.data_mov"(%283#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %287 = "neura.data_mov"(%283#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %288 = "neura.data_mov"(%283#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %289 = "neura.data_mov"(%283#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %290 = "neura.data_mov"(%283#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %291 = "neura.data_mov"(%283#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %292 = "neura.data_mov"(%283#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %293 = "neura.data_mov"(%283#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %294 = "neura.fused_op"(%254, %226, %290) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%308 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %295 = "neura.data_mov"(%294) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %296 = "neura.fused_op"(%257, %225, %289) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%308 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %297 = "neura.data_mov"(%296) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %298 = "neura.fused_op"(%260, %224, %288) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%308 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %299 = "neura.data_mov"(%298) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %300 = "neura.fused_op"(%263, %223, %287) <{frequency = 30 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %307 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %308 = neura.grant_predicate %307, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%308 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %301 = "neura.data_mov"(%300) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %302 = "neura.data_mov"(%276) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %303 = neura.grant_predicate %302, %286 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %303 -> %20 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %299 -> %17 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %291 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %301 -> %13 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %297 -> %12 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %295 -> %11 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %304 = neura.grant_predicate %232, %285 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %304 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %292 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %293 -> %8 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %305 = "neura.data_mov"(%274) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %306 = neura.grant_predicate %305, %284 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %306 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %281 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

