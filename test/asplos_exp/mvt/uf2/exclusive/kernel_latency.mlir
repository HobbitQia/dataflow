#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %16 = llvm.mlir.constant(2 : i64) {latency = 1 : i32} : i64
    %17 = llvm.mlir.constant(62 : i64) {latency = 1 : i32} : i64
    %18 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    "llvm.intr.memset"(%3, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%4 : i64) {latency = 1 : i32}
  ^bb1(%19: i64):  // 2 preds: ^bb0, ^bb1
    %20 = llvm.getelementptr inbounds %5[0, %19] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %21 = llvm.trunc %19 {latency = 1 : i32} : i64 to i32
    %22 = llvm.add %21, %6 {latency = 1 : i32} : i32
    llvm.store %22, %20 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.getelementptr inbounds %7[0, %19] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %24 = llvm.trunc %19 {latency = 1 : i32} : i64 to i32
    %25 = llvm.add %24, %8 {latency = 1 : i32} : i32
    llvm.store %25, %23 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %26 = llvm.add %19, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %27 = llvm.icmp "eq" %26, %10 {latency = 1 : i32} : i64
    llvm.cond_br %27, ^bb2(%4 : i64), ^bb1(%26 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%28: i64):  // 2 preds: ^bb1, ^bb2
    %29 = llvm.trunc %28 {latency = 1 : i32} : i64 to i32
    %30 = llvm.lshr %29, %11 {latency = 1 : i32} : i32
    %31 = llvm.and %29, %12 {latency = 1 : i32} : i32
    %32 = llvm.mul %30, %31 overflow<nsw, nuw> {latency = 1 : i32} : i32
    %33 = llvm.and %32, %12 {latency = 1 : i32} : i32
    %34 = llvm.getelementptr inbounds %13[0, %28] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    llvm.store %33, %34 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %35 = llvm.add %28, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %36 = llvm.icmp "eq" %35, %14 {latency = 1 : i32} : i64
    llvm.cond_br %36, ^bb3(%4 : i64), ^bb2(%35 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3(%37: i64):  // 2 preds: ^bb2, ^bb5
    %38 = llvm.getelementptr inbounds %5[0, %37] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %39 = llvm.shl %37, %15 overflow<nsw> {latency = 1 : i32} : i64
    %40 = llvm.getelementptr inbounds %7[0, %37] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %41 = llvm.load %38 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.load %40 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb4(%4 : i64) {latency = 1 : i32}
  ^bb4(%43: i64):  // 2 preds: ^bb3, ^bb4
    %44 = llvm.getelementptr inbounds %0[0, %43] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %45 = llvm.load %44 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.shl %43, %15 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %47 = llvm.add %46, %37 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %48 = llvm.getelementptr inbounds %13[0, %47] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %49 = llvm.load %48 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.mul %41, %49 overflow<nsw> {latency = 1 : i32} : i32
    %51 = llvm.add %50, %45 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %51, %44 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %52 = llvm.getelementptr inbounds %3[0, %43] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %53 = llvm.load %52 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %54 = llvm.add %43, %39 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %55 = llvm.getelementptr inbounds %13[0, %54] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %56 = llvm.load %55 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.mul %42, %56 overflow<nsw> {latency = 1 : i32} : i32
    %58 = llvm.add %57, %53 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %58, %52 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %59 = llvm.or %43, %9 {latency = 1 : i32} : i64
    %60 = llvm.getelementptr inbounds %0[0, %59] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %61 = llvm.load %60 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %62 = llvm.shl %59, %15 overflow<nsw> {latency = 1 : i32} : i64
    %63 = llvm.add %62, %37 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %64 = llvm.getelementptr inbounds %13[0, %63] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %65 = llvm.load %64 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %66 = llvm.mul %65, %41 overflow<nsw> {latency = 1 : i32} : i32
    %67 = llvm.add %66, %61 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %67, %60 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %68 = llvm.getelementptr inbounds %3[0, %59] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %69 = llvm.load %68 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %70 = llvm.add %59, %39 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %71 = llvm.getelementptr inbounds %13[0, %70] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %72 = llvm.load %71 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %73 = llvm.mul %72, %42 overflow<nsw> {latency = 1 : i32} : i32
    %74 = llvm.add %73, %69 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %74, %68 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %75 = llvm.add %43, %16 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %76 = llvm.icmp "ult" %43, %17 {latency = 1 : i32} : i64
    llvm.cond_br %76, ^bb4(%75 : i64), ^bb5 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %77 = llvm.add %37, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %78 = llvm.icmp "eq" %77, %10 {latency = 1 : i32} : i64
    llvm.cond_br %78, ^bb6, ^bb3(%77 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    llvm.return {latency = 1 : i32} %18 : i32
  }
  func.func @_Z6kernelPiS_PKiS1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 2 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 62 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %10 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13:2 = "neura.fused_op"(%12) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %86 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %87 = neura.phi_start %86, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%86, %87 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = "neura.fused_op"(%14) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %86 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %87 = neura.phi_start %86, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%87 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = "neura.fused_op"(%16) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %86 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %87 = neura.phi_start %86, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%87 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = "neura.fused_op"(%18) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %86 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %87 = neura.phi_start %86, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%87 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21:2 = "neura.fused_op"(%13#0, %20, %17) <{frequency = 5 : i64, pattern_id = 16 : i64, pattern_name = "phi_start->shl"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %86 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %87 = "neura.shl"(%86, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%86, %87 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %22 = "neura.gep"(%19, %21#0) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = "neura.gep"(%15, %21#0) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %26 = neura.phi_start %15, %25 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %27 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %28 = neura.phi_start %19, %27 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = "neura.fused_op"(%4, %6, %30) <{frequency = 13 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %86 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %87 = neura.phi_start %86, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%87 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = "neura.fused_op"(%3, %7, %32) <{frequency = 13 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %86 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %87 = neura.phi_start %86, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%87 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %36 = neura.phi_start %23, %35 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %39 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %40 = neura.phi_start %22, %39 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %41 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.reserve : !neura.data<i64, i1>
    %44 = neura.phi_start %17, %43 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %45 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %46 = "neura.fused_op"(%0, %11, %45) <{frequency = 13 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %86 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %87 = neura.phi_start %86, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%87 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48:2 = "neura.fused_op"(%13#1, %47, %33) <{frequency = 6 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %86 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %87 = "neura.add"(%86, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%86, %87 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %49:4 = "neura.fused_op"(%48#0, %31, %48#1, %46, %44) <{frequency = 13 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %86 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %87 = neura.grant_predicate %arg7, %86 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %88 = neura.grant_predicate %arg8, %86 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %89 = neura.grant_predicate %arg9, %86 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%86, %87, %88, %89 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    %50:2 = "neura.fused_op"(%5, %29, %49#0) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>):
      %86 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %87 = neura.phi_start %86, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %88 = neura.phi_start %87, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %89 = neura.grant_predicate %88, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%88, %89 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %51:2 = "neura.fused_op"(%8, %34, %49#0) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>):
      %86 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %87 = neura.phi_start %86, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %88 = neura.phi_start %87, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %89 = neura.grant_predicate %88, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%88, %89 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %52:2 = "neura.fused_op"(%2, %10, %41, %49#0) <{frequency = 4 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i1, i1>):
      %86 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %87 = neura.phi_start %86, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %88 = neura.grant_predicate %87, %arg8 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%87, %88 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %53:2 = "neura.fused_op"(%21#1, %37, %48#0) <{frequency = 6 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %86 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %87 = "neura.add"(%arg7, %86) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%86, %87 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %54:4 = "neura.fused_op"(%1, %9, %38, %49#0, %52#0, %53#1, %36, %48#0) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:phi_start->phi_start->grant_predicate->fused_op:fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i1, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<i64, i1>, %arg11: !neura.data<!llvm.ptr, i1>, %arg12: !neura.data<i64, i1>):
      %86 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %87 = neura.phi_start %86, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %88 = neura.grant_predicate %87, %arg8 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %89 = "neura.gep"(%arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %90 = "neura.load"(%89) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %91 = "neura.load"(%arg11) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %92 = "neura.mul"(%91, %90) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %93 = "neura.gep"(%87, %arg12) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %94 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %95 = "neura.add"(%92, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%87, %88, %93, %95 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %55 = "neura.shl"(%48#0, %44) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56:2 = "neura.fused_op"(%21#0, %42, %55) <{frequency = 6 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %86 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %87 = "neura.add"(%arg7, %86) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%86, %87 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %57:4 = "neura.fused_op"(%49#0, %56#0, %51#0, %50#0) <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %86 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %87 = neura.grant_predicate %arg6, %86 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %88 = neura.grant_predicate %arg7, %86 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %89 = neura.grant_predicate %arg8, %86 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%86, %87, %88, %89 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %58:2 = "neura.fused_op"(%52#0, %56#1, %40, %46, %48#0) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %86 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %87 = "neura.load"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %88 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %89 = "neura.mul"(%88, %87) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %90 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %91 = "neura.load"(%90) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %92 = "neura.add"(%89, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%90, %92 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%58#1, %58#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%54#3, %54#2) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %59 = "neura.or"(%48#0, %51#0) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.shl"(%59, %44) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = "neura.add"(%60, %56#0) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62:2 = "neura.fused_op"(%52#0, %61, %40, %46, %59) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %86 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %87 = "neura.load"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %88 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %89 = "neura.mul"(%88, %87) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %90 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %91 = "neura.load"(%90) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %92 = "neura.add"(%89, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%90, %92 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%62#1, %62#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %63 = "neura.add"(%59, %53#0) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64:2 = "neura.fused_op"(%52#0, %63, %36, %54#0, %59) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %86 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %87 = "neura.load"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %88 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %89 = "neura.mul"(%88, %87) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %90 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %91 = "neura.load"(%90) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %92 = "neura.add"(%89, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%90, %92 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%64#1, %64#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %65:2 = "neura.fused_op"(%13#1, %24, %49#0) <{frequency = 27 : i64, pattern_id = 11 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>):
      %86 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %87 = neura.grant_predicate %86, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%86, %87 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    neura.ctrl_mov %49#1 -> %47 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %49#2 -> %45 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %49#3 -> %43 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %66 = neura.grant_predicate %56#0, %49#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %66 -> %42 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %52#1 -> %41 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %67 = neura.grant_predicate %40, %49#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %67 -> %39 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %54#1 -> %38 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %68 = neura.grant_predicate %53#0, %49#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %68 -> %37 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %69 = neura.grant_predicate %36, %49#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %69 -> %35 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %51#1 -> %34 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %70 = neura.grant_predicate %33, %49#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %70 -> %32 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %71 = neura.grant_predicate %31, %49#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %71 -> %30 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %50#1 -> %29 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %72 = neura.grant_predicate %28, %49#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %72 -> %27 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %73 = neura.grant_predicate %26, %49#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %73 -> %25 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %65#1 -> %24 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %74 = neura.grant_predicate %65#0, %57#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %75 = "neura.add"(%57#1, %57#2) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %76:2 = "neura.fused_op"(%75, %57#3) <{frequency = 18 : i64, pattern_id = 4 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %86 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %87 = neura.grant_predicate %86, %86 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%86, %87 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %77:5 = "neura.fused_op"(%76#0, %74, %75, %44, %57#0, %33) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:not->grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i1, i1>, %arg10: !neura.data<i64, i1>):
      %86 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %87 = neura.grant_predicate %arg6, %86 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %88 = neura.grant_predicate %arg7, %86 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %89 = neura.grant_predicate %arg8, %arg9 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %90 = neura.grant_predicate %89, %86 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %91 = neura.grant_predicate %arg10, %arg9 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %92 = neura.grant_predicate %91, %86 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%86, %87, %88, %90, %92 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %78 = "neura.fused_op"(%31, %57#0, %77#0) <{frequency = 11 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %86 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %87 = neura.grant_predicate %86, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%87 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %79 = "neura.fused_op"(%54#0, %57#0, %77#0) <{frequency = 11 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %86 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %87 = neura.grant_predicate %86, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%87 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %80 = "neura.fused_op"(%52#0, %57#0, %77#0) <{frequency = 11 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %86 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %87 = neura.grant_predicate %86, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%87 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %81 = "neura.fused_op"(%46, %57#0, %77#0) <{frequency = 11 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %86 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %87 = neura.grant_predicate %86, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%87 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %82 = "neura.fused_op"(%26, %57#0, %77#0) <{frequency = 11 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %86 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %87 = neura.grant_predicate %86, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%87 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.fused_op"(%28, %57#0, %77#0) <{frequency = 11 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %86 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %87 = neura.grant_predicate %86, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%87 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %77#2 -> %20 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %83 -> %18 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %77#3 -> %16 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %82 -> %14 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %77#1 -> %12 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %81 -> %11 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %80 -> %10 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %79 -> %9 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %84 = neura.grant_predicate %57#2, %77#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %84 -> %8 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %77#4 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %78 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %85 = neura.grant_predicate %57#3, %77#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %85 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %76#1 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

