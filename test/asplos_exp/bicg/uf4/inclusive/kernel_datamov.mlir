#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external @A(dense<0> : tensor<256x256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x array<256 x i32>>
  llvm.mlir.global external @r(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external @p(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external @s(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external @q(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.addressof @r {latency = 1 : i32} : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.constant(255 : i32) {latency = 1 : i32} : i32
    %4 = llvm.mlir.addressof @A {latency = 1 : i32} : !llvm.ptr
    %5 = llvm.mlir.constant(256 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.addressof @p {latency = 1 : i32} : !llvm.ptr
    %7 = llvm.mlir.addressof @s {latency = 1 : i32} : !llvm.ptr
    %8 = llvm.mlir.addressof @q {latency = 1 : i32} : !llvm.ptr
    %9 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb3
    %11 = llvm.getelementptr inbounds %1[0, %10] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %12 = llvm.trunc %10 {latency = 1 : i32} : i64 to i32
    llvm.store %12, %11 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb2(%0 : i64) {latency = 1 : i32}
  ^bb2(%13: i64):  // 2 preds: ^bb1, ^bb2
    %14 = llvm.add %13, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %15 = llvm.mul %14, %10 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %16 = llvm.trunc %15 {latency = 1 : i32} : i64 to i32
    %17 = llvm.and %16, %3 {latency = 1 : i32} : i32
    %18 = llvm.getelementptr inbounds %4[0, %10, %13] {latency = 1 : i32} : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    llvm.store %17, %18 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.icmp "eq" %14, %5 {latency = 1 : i32} : i64
    llvm.cond_br %19, ^bb3, ^bb2(%14 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %20 = llvm.add %10, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %21 = llvm.icmp "eq" %20, %5 {latency = 1 : i32} : i64
    llvm.cond_br %21, ^bb4(%0 : i64), ^bb1(%20 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4(%22: i64):  // 2 preds: ^bb3, ^bb4
    %23 = llvm.getelementptr inbounds %6[0, %22] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %24 = llvm.trunc %22 {latency = 1 : i32} : i64 to i32
    llvm.store %24, %23 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %22, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %26 = llvm.icmp "eq" %25, %5 {latency = 1 : i32} : i64
    llvm.cond_br %26, ^bb5, ^bb4(%25 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %27 = func.call @_Z6kernelPA256_iPiS1_S1_S1_(%4, %7, %8, %6, %1) {latency = 1 : i32} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.void
    llvm.return {latency = 1 : i32} %9 : i32
  }
  func.func @_Z6kernelPA256_iPiS1_S1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg3"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.constant"() <{value = 0 : i8}> {latency = 1 : i32} : () -> !neura.data<i8, i1>
    %5 = "neura.constant"() <{value = 1024 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 2 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 3 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 4 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %10 = "neura.grant_once"() <{constant_value = 252 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %11 = "neura.grant_once"() <{constant_value = 256 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %12 = "neura.data_mov"(%2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %13 = "neura.data_mov"(%4) : (!neura.data<i8, i1>) -> !neura.data<i8, i1>
    %14 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    "neura.memset"(%12, %13, %14) <{is_volatile = false}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i64, i1>) -> ()
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %23 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25:2 = "neura.fused_op"(%24) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %321 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %322 = neura.phi_start %321, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%321, %322 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %26 = "neura.data_mov"(%25#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.data_mov"(%25#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.data_mov"(%25#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %30 = "neura.fused_op"(%29) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %321 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %322 = neura.phi_start %321, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%322 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %31 = "neura.data_mov"(%30) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %32 = "neura.data_mov"(%30) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = neura.reserve : !neura.data<i32, i1>
    %34 = "neura.fused_op"(%33) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>):
      %321 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %322 = neura.phi_start %321, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%322 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %35 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %36 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %37 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %38 = "neura.fused_op"(%37) <{frequency = 5 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %321 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %322 = neura.phi_start %321, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%322 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %39 = "neura.data_mov"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = "neura.data_mov"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = neura.phi_start %26, %41 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %43 = "neura.data_mov"(%42) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = "neura.gep"(%40, %43) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.data_mov"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%36, %45) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %46 = "neura.data_mov"(%42) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = "neura.gep"(%32, %46) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %50 = neura.phi_start %31, %49 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %51 = neura.reserve : !neura.data<i32, i1>
    %52 = neura.phi_start %35, %51 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %53 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %54 = neura.phi_start %39, %53 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %55 = neura.reserve : !neura.data<i64, i1>
    %56 = neura.reserve : !neura.data<i64, i1>
    %57 = "neura.data_mov"(%10) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = "neura.fused_op"(%57, %16, %56) <{frequency = 15 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %321 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %322 = neura.phi_start %321, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%322 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.data_mov"(%58) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.data_mov"(%58) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = "neura.data_mov"(%58) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62 = neura.reserve : !neura.data<i64, i1>
    %63 = "neura.data_mov"(%9) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64 = "neura.fused_op"(%63, %17, %62) <{frequency = 15 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %321 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %322 = neura.phi_start %321, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%322 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.data_mov"(%64) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.data_mov"(%64) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = "neura.data_mov"(%64) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = neura.reserve : !neura.data<i64, i1>
    %69 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.fused_op"(%69, %18, %68) <{frequency = 15 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %321 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %322 = neura.phi_start %321, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%322 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71 = "neura.data_mov"(%70) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %72 = "neura.data_mov"(%70) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %73 = "neura.data_mov"(%70) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %74 = neura.reserve : !neura.data<i64, i1>
    %75 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %76 = "neura.fused_op"(%75, %19, %74) <{frequency = 15 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %321 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %322 = neura.phi_start %321, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%322 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %77 = "neura.data_mov"(%76) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = "neura.data_mov"(%76) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %79 = "neura.data_mov"(%76) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80 = neura.reserve : !neura.data<i64, i1>
    %81 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.fused_op"(%81, %20, %80) <{frequency = 15 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %321 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %322 = neura.phi_start %321, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%322 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = "neura.data_mov"(%82) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %84 = "neura.data_mov"(%82) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %85 = "neura.data_mov"(%82) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %86 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %87 = "neura.data_mov"(%3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = "neura.fused_op"(%87, %21, %86) <{frequency = 15 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %321 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %322 = neura.phi_start %321, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%322 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %89 = "neura.data_mov"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %90 = "neura.data_mov"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %91 = "neura.data_mov"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %92 = "neura.data_mov"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %93 = "neura.data_mov"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %94 = "neura.data_mov"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %95 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %96 = "neura.data_mov"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %97 = neura.phi_start %96, %95 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %98 = neura.reserve : !neura.data<i64, i1>
    %99 = "neura.data_mov"(%42) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100 = neura.phi_start %99, %98 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %101 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %102 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.fused_op"(%102, %22, %101) <{frequency = 15 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %321 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %322 = neura.phi_start %321, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%322 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %104 = "neura.data_mov"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %105 = "neura.data_mov"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %106 = "neura.data_mov"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %107 = "neura.data_mov"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %108 = "neura.data_mov"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %109 = "neura.data_mov"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %110 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %111 = "neura.data_mov"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %112 = neura.phi_start %111, %110 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %113 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %114 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %115 = "neura.fused_op"(%114, %23, %113) <{frequency = 15 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %321 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %322 = neura.phi_start %321, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%322 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %116 = "neura.data_mov"(%115) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %117 = "neura.data_mov"(%115) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %118 = "neura.data_mov"(%115) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %119 = "neura.data_mov"(%115) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %120 = "neura.data_mov"(%115) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %121 = "neura.data_mov"(%115) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %122 = neura.reserve : !neura.data<i64, i1>
    %123:2 = "neura.fused_op"(%28, %122, %94) <{frequency = 7 : i64, pattern_id = 16 : i64, pattern_name = "phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %321 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %322 = "neura.gep"(%arg7, %321) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %323 = "neura.load"(%322) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%321, %323 : !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>)
    %124 = "neura.data_mov"(%123#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %125 = "neura.data_mov"(%123#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %126 = "neura.data_mov"(%123#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %127 = "neura.data_mov"(%123#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %128 = "neura.data_mov"(%123#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %129 = "neura.data_mov"(%123#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %130 = "neura.data_mov"(%123#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %131 = "neura.data_mov"(%123#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %132 = "neura.data_mov"(%100) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %133:2 = "neura.fused_op"(%109, %132, %130) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:gep->load->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %321 = "neura.gep"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %322 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %323 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%322, %323 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %134 = "neura.data_mov"(%133#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %135 = "neura.data_mov"(%133#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %136 = "neura.data_mov"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %137 = "neura.fused_op"(%131, %135, %136) <{frequency = 4 : i64, pattern_id = 14 : i64, pattern_name = "mul->fused_op:load->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %321 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %322 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %323 = "neura.add"(%321, %322) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%323 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %138 = "neura.data_mov"(%137) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %139:2 = "neura.fused_op"(%121, %129) <{frequency = 16 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %321 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %322 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%321, %322 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %140 = "neura.data_mov"(%139#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %141 = "neura.data_mov"(%139#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %142 = "neura.data_mov"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %143 = "neura.fused_op"(%142, %134, %141) <{frequency = 4 : i64, pattern_id = 12 : i64, pattern_name = "load->fused_op:mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>):
      %321 = "neura.load"(%arg5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %322 = "neura.mul"(%arg6, %321) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %323 = "neura.add"(%322, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%323 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %144 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%144, %140) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %145 = "neura.data_mov"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%138, %145) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %146 = "neura.or"(%128, %85) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %147 = "neura.data_mov"(%100) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %148 = "neura.data_mov"(%146) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %149:2 = "neura.fused_op"(%108, %147, %148) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:gep->load->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %321 = "neura.gep"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %322 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %323 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%322, %323 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %150 = "neura.data_mov"(%149#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %151 = "neura.data_mov"(%149#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %152 = "neura.data_mov"(%146) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %153 = "neura.fused_op"(%93, %152) <{frequency = 16 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %321 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %322 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%322 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %154 = "neura.data_mov"(%153) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %155 = "neura.data_mov"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %156 = "neura.fused_op"(%154, %151, %155) <{frequency = 4 : i64, pattern_id = 14 : i64, pattern_name = "mul->fused_op:load->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %321 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %322 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %323 = "neura.add"(%321, %322) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%323 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %157 = "neura.data_mov"(%156) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %158 = "neura.data_mov"(%146) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %159:2 = "neura.fused_op"(%120, %158) <{frequency = 16 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %321 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %322 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%321, %322 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %160 = "neura.data_mov"(%159#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %161 = "neura.data_mov"(%159#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %162 = "neura.data_mov"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %163 = "neura.fused_op"(%162, %150, %161) <{frequency = 4 : i64, pattern_id = 12 : i64, pattern_name = "load->fused_op:mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>):
      %321 = "neura.load"(%arg5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %322 = "neura.mul"(%arg6, %321) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %323 = "neura.add"(%322, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%323 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %164 = "neura.data_mov"(%163) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%164, %160) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %165 = "neura.data_mov"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%157, %165) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %166 = "neura.or"(%127, %79) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %167 = "neura.data_mov"(%100) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %168 = "neura.data_mov"(%166) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %169:2 = "neura.fused_op"(%107, %167, %168) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:gep->load->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %321 = "neura.gep"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %322 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %323 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%322, %323 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %170 = "neura.data_mov"(%169#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %171 = "neura.data_mov"(%169#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %172 = "neura.data_mov"(%166) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %173 = "neura.fused_op"(%92, %172) <{frequency = 16 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %321 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %322 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%322 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %174 = "neura.data_mov"(%173) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %175 = "neura.data_mov"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %176 = "neura.fused_op"(%174, %171, %175) <{frequency = 4 : i64, pattern_id = 14 : i64, pattern_name = "mul->fused_op:load->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %321 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %322 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %323 = "neura.add"(%321, %322) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%323 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %177 = "neura.data_mov"(%176) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %178 = "neura.data_mov"(%166) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %179:2 = "neura.fused_op"(%119, %178) <{frequency = 16 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %321 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %322 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%321, %322 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %180 = "neura.data_mov"(%179#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %181 = "neura.data_mov"(%179#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %182 = "neura.data_mov"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %183 = "neura.fused_op"(%182, %170, %181) <{frequency = 4 : i64, pattern_id = 12 : i64, pattern_name = "load->fused_op:mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>):
      %321 = "neura.load"(%arg5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %322 = "neura.mul"(%arg6, %321) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %323 = "neura.add"(%322, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%323 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %184 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%184, %180) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %185 = "neura.data_mov"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%177, %185) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %186 = "neura.or"(%126, %73) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %187 = "neura.data_mov"(%100) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %188 = "neura.data_mov"(%186) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %189:2 = "neura.fused_op"(%106, %187, %188) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:gep->load->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %321 = "neura.gep"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %322 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %323 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%322, %323 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %190 = "neura.data_mov"(%189#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %191 = "neura.data_mov"(%189#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %192 = "neura.data_mov"(%186) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %193 = "neura.fused_op"(%91, %192) <{frequency = 16 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %321 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %322 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%322 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %194 = "neura.data_mov"(%193) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %195 = "neura.data_mov"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %196 = "neura.fused_op"(%194, %191, %195) <{frequency = 4 : i64, pattern_id = 14 : i64, pattern_name = "mul->fused_op:load->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %321 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %322 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %323 = "neura.add"(%321, %322) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%323 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %197 = "neura.data_mov"(%196) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %198 = "neura.data_mov"(%186) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %199:2 = "neura.fused_op"(%118, %198) <{frequency = 16 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %321 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %322 = "neura.load"(%321) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%321, %322 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %200 = "neura.data_mov"(%199#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %201 = "neura.data_mov"(%199#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %202 = "neura.data_mov"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %203 = "neura.fused_op"(%202, %190, %201) <{frequency = 4 : i64, pattern_id = 12 : i64, pattern_name = "load->fused_op:mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>):
      %321 = "neura.load"(%arg5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %322 = "neura.mul"(%arg6, %321) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %323 = "neura.add"(%322, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%323 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %204 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%204, %200) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %205 = "neura.data_mov"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%197, %205) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %206 = "neura.add"(%125, %67) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %207 = "neura.data_mov"(%206) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %208:3 = "neura.fused_op"(%124, %61, %207, %117) <{frequency = 15 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:icmp->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %321 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %322 = neura.grant_predicate %arg7, %321 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %323 = neura.grant_predicate %arg8, %321 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%321, %322, %323 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %209 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %210 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %211 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %212 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %213 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %214 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %215 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %216 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %217 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %218 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %219 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %220 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %221 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %222 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %223 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %224 = "neura.data_mov"(%208#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %225 = "neura.data_mov"(%208#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %226 = "neura.data_mov"(%208#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %227 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %228:2 = "neura.fused_op"(%227, %15, %55, %224) <{frequency = 11 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i1, i1>):
      %321 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %322 = neura.phi_start %321, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %323 = neura.grant_predicate %322, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%322, %323 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %229 = "neura.data_mov"(%228#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %230 = "neura.data_mov"(%228#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %231 = "neura.data_mov"(%100) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %232:3 = "neura.fused_op"(%223, %231, %84) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:not->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %321 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %322 = neura.grant_predicate %arg6, %321 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %323 = neura.grant_predicate %arg7, %321 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%321, %322, %323 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %233 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %234 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %235 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %236 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %237 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %238 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %239 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %240 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %241 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %242 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %243 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %244 = "neura.data_mov"(%232#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %245 = "neura.data_mov"(%232#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %246 = "neura.data_mov"(%232#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %247 = "neura.data_mov"(%232#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %248:2 = "neura.fused_op"(%27, %48, %222) <{frequency = 30 : i64, pattern_id = 10 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>):
      %321 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %322 = neura.grant_predicate %321, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%321, %322 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %249 = "neura.data_mov"(%248#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %250 = "neura.data_mov"(%248#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %225 -> %122 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %226 -> %113 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %251 = "neura.data_mov"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %252 = neura.grant_predicate %251, %221 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %252 -> %110 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %253 = neura.grant_predicate %105, %220 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %253 -> %101 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %254 = "neura.data_mov"(%100) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %255 = neura.grant_predicate %254, %219 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %255 -> %98 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %256 = "neura.data_mov"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %257 = neura.grant_predicate %256, %218 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %257 -> %95 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %258 = neura.grant_predicate %90, %217 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %258 -> %86 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %259 = neura.grant_predicate %83, %216 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %259 -> %80 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %260 = neura.grant_predicate %78, %215 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %260 -> %74 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %261 = neura.grant_predicate %72, %214 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %261 -> %68 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %262 = neura.grant_predicate %66, %213 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %262 -> %62 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %263 = neura.grant_predicate %60, %212 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %263 -> %56 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %230 -> %55 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %264 = "neura.data_mov"(%54) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %265 = neura.grant_predicate %264, %211 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %265 -> %53 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %266 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %267 = neura.grant_predicate %266, %210 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %267 -> %51 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %268 = "neura.data_mov"(%50) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %269 = neura.grant_predicate %268, %209 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %269 -> %49 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %250 -> %48 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %270 = neura.grant_predicate %229, %244 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %271 = neura.grant_predicate %249, %243 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %272 = "neura.add"(%245, %247) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %273 = "neura.data_mov"(%272) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %274 = "neura.data_mov"(%270) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %275:2 = "neura.fused_op"(%273, %274) <{frequency = 19 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %321 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %322 = neura.grant_predicate %321, %321 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%321, %322 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %276 = "neura.data_mov"(%275#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %277 = "neura.data_mov"(%275#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %278 = "neura.data_mov"(%271) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %279 = "neura.data_mov"(%272) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %280:3 = "neura.fused_op"(%276, %278, %279) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:not->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %321 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %322 = neura.grant_predicate %arg6, %321 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %323 = neura.grant_predicate %arg7, %321 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%321, %322, %323 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %281 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %282 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %283 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %284 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %285 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %286 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %287 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %288 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %289 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %290 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %291 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %292 = "neura.data_mov"(%280#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %293 = "neura.data_mov"(%280#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %294 = "neura.data_mov"(%280#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %295 = "neura.fused_op"(%59, %242, %292) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %321 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %322 = neura.grant_predicate %321, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%322 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %296 = "neura.data_mov"(%295) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %297 = "neura.fused_op"(%65, %241, %291) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %321 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %322 = neura.grant_predicate %321, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%322 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %298 = "neura.data_mov"(%297) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %299 = "neura.fused_op"(%71, %240, %290) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %321 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %322 = neura.grant_predicate %321, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%322 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %300 = "neura.data_mov"(%299) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %301 = "neura.fused_op"(%77, %239, %289) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %321 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %322 = neura.grant_predicate %321, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%322 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %302 = "neura.data_mov"(%301) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %303 = "neura.fused_op"(%89, %238, %288) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %321 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %322 = neura.grant_predicate %321, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%322 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %304 = "neura.data_mov"(%303) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %305 = "neura.fused_op"(%104, %237, %287) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %321 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %322 = neura.grant_predicate %321, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%322 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %306 = "neura.data_mov"(%305) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %307 = "neura.fused_op"(%116, %236, %286) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %321 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %322 = neura.grant_predicate %321, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%322 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %308 = "neura.data_mov"(%307) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %309 = "neura.data_mov"(%50) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %310 = "neura.fused_op"(%309, %235, %285) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %321 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %322 = neura.grant_predicate %321, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%322 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %311 = "neura.data_mov"(%310) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %312 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %313 = "neura.fused_op"(%312, %234, %284) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %321 = neura.grant_predicate %arg5, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %322 = neura.grant_predicate %321, %arg7 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%322 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i32, i1>
    %314 = "neura.data_mov"(%313) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %315 = "neura.data_mov"(%54) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %316 = "neura.fused_op"(%315, %233, %283) <{frequency = 13 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %321 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %322 = neura.grant_predicate %321, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%322 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %317 = "neura.data_mov"(%316) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %294 -> %41 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %317 -> %37 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %314 -> %33 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %311 -> %29 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %293 -> %24 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %308 -> %23 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %306 -> %22 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %304 -> %21 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %318 = neura.grant_predicate %246, %282 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %318 -> %20 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %302 -> %19 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %300 -> %18 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %298 -> %17 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %296 -> %16 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %319 = "neura.data_mov"(%270) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %320 = neura.grant_predicate %319, %281 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %320 -> %15 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %277 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

