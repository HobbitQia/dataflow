#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external local_unnamed_addr @A(dense<0> : tensor<256x256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x array<256 x i32>>
  llvm.mlir.global external local_unnamed_addr @r(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @p(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @s(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @q(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.addressof @r {latency = 1 : i32} : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.constant(255 : i32) {latency = 1 : i32} : i32
    %4 = llvm.mlir.addressof @A {latency = 1 : i32} : !llvm.ptr
    %5 = llvm.mlir.constant(256 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.addressof @p {latency = 1 : i32} : !llvm.ptr
    %7 = llvm.mlir.addressof @s {latency = 1 : i32} : !llvm.ptr
    %8 = llvm.mlir.constant(0 : i8) {latency = 1 : i32} : i8
    %9 = llvm.mlir.constant(1024 : i64) {latency = 1 : i32} : i64
    %10 = llvm.mlir.addressof @q {latency = 1 : i32} : !llvm.ptr
    %11 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    %12 = llvm.mlir.constant(2 : i64) {latency = 1 : i32} : i64
    %13 = llvm.mlir.constant(254 : i64) {latency = 1 : i32} : i64
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%14: i64):  // 2 preds: ^bb0, ^bb3
    %15 = llvm.getelementptr inbounds %1[0, %14] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %16 = llvm.trunc %14 {latency = 1 : i32} : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb2(%0 : i64) {latency = 1 : i32}
  ^bb2(%17: i64):  // 2 preds: ^bb1, ^bb2
    %18 = llvm.add %17, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %19 = llvm.mul %18, %14 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %20 = llvm.trunc %19 {latency = 1 : i32} : i64 to i32
    %21 = llvm.and %20, %3 {latency = 1 : i32} : i32
    %22 = llvm.getelementptr inbounds %4[0, %14, %17] {latency = 1 : i32} : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    llvm.store %21, %22 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.icmp "eq" %18, %5 {latency = 1 : i32} : i64
    llvm.cond_br %23, ^bb3, ^bb2(%18 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %24 = llvm.add %14, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %25 = llvm.icmp "eq" %24, %5 {latency = 1 : i32} : i64
    llvm.cond_br %25, ^bb4(%0 : i64), ^bb1(%24 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4(%26: i64):  // 2 preds: ^bb3, ^bb4
    %27 = llvm.getelementptr inbounds %6[0, %26] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %28 = llvm.trunc %26 {latency = 1 : i32} : i64 to i32
    llvm.store %28, %27 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %29 = llvm.add %26, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %30 = llvm.icmp "eq" %29, %5 {latency = 1 : i32} : i64
    llvm.cond_br %30, ^bb5, ^bb4(%29 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    "llvm.intr.memset"(%7, %8, %9) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb6(%0 : i64) {latency = 1 : i32}
  ^bb6(%31: i64):  // 2 preds: ^bb5, ^bb8
    %32 = llvm.getelementptr inbounds %10[0, %31] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %33 = llvm.getelementptr inbounds %1[0, %31] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %34 = llvm.load %33 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb7(%11, %0 : i32, i64) {latency = 1 : i32}
  ^bb7(%35: i32, %36: i64):  // 2 preds: ^bb6, ^bb7
    %37 = llvm.getelementptr inbounds %7[0, %36] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %38 = llvm.load %37 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.getelementptr inbounds %4[0, %31, %36] {latency = 1 : i32} : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    %40 = llvm.load %39 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.mul %40, %34 overflow<nsw> {latency = 1 : i32} : i32
    %42 = llvm.add %41, %38 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %42, %37 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %43 = llvm.getelementptr inbounds %6[0, %36] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %44 = llvm.load %43 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.mul %44, %40 overflow<nsw> {latency = 1 : i32} : i32
    %46 = llvm.add %45, %35 overflow<nsw> {latency = 1 : i32} : i32
    %47 = llvm.or %36, %2 {latency = 1 : i32} : i64
    %48 = llvm.getelementptr inbounds %7[0, %47] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %49 = llvm.load %48 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.getelementptr inbounds %4[0, %31, %47] {latency = 1 : i32} : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    %51 = llvm.load %50 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.mul %51, %34 overflow<nsw> {latency = 1 : i32} : i32
    %53 = llvm.add %52, %49 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %53, %48 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %54 = llvm.getelementptr inbounds %6[0, %47] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %55 = llvm.load %54 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %56 = llvm.mul %55, %51 overflow<nsw> {latency = 1 : i32} : i32
    %57 = llvm.add %56, %46 overflow<nsw> {latency = 1 : i32} : i32
    %58 = llvm.add %36, %12 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %59 = llvm.icmp "ult" %36, %13 {latency = 1 : i32} : i64
    llvm.cond_br %59, ^bb7(%57, %58 : i32, i64), ^bb8 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    llvm.store %57, %32 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %60 = llvm.add %31, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %61 = llvm.icmp "eq" %60, %5 {latency = 1 : i32} : i64
    llvm.cond_br %61, ^bb9, ^bb6(%60 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return {latency = 1 : i32} %11 : i32
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
    %8 = "neura.grant_once"() <{constant_value = 254 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 256 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    "neura.memset"(%2, %4, %5) <{is_volatile = false}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i64, i1>) -> ()
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18:2 = "neura.fused_op"(%17) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %108 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %109 = neura.phi_start %108, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%108, %109 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %19 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %20 = "neura.fused_op"(%19) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %108 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %109 = neura.phi_start %108, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%109 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %21 = neura.reserve : !neura.data<i32, i1>
    %22 = "neura.fused_op"(%21) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>):
      %108 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %109 = neura.phi_start %108, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%109 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %23 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %24 = "neura.fused_op"(%23) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %108 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %109 = neura.phi_start %108, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%109 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.phi_start %18#0, %25 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %27 = "neura.gep"(%24, %26) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%22, %27) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %28 = "neura.gep"(%20, %26) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %31 = neura.phi_start %20, %30 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %32 = neura.reserve : !neura.data<i32, i1>
    %33 = neura.phi_start %22, %32 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %34 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %35 = neura.phi_start %24, %34 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = "neura.fused_op"(%8, %11, %37) <{frequency = 13 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %108 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %109 = neura.phi_start %108, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%109 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = "neura.fused_op"(%7, %12, %39) <{frequency = 13 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %108 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %109 = neura.phi_start %108, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%109 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = "neura.fused_op"(%6, %13, %41) <{frequency = 13 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %108 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %109 = neura.phi_start %108, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%109 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %44 = "neura.fused_op"(%3, %14, %43) <{frequency = 13 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %108 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %109 = neura.phi_start %108, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%109 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %46 = neura.phi_start %27, %45 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = neura.phi_start %26, %47 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %49 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %50 = "neura.fused_op"(%0, %15, %49) <{frequency = 13 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %108 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %109 = neura.phi_start %108, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%109 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %51 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %52 = neura.phi_start %28, %51 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %53 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %54 = "neura.fused_op"(%1, %16, %53) <{frequency = 13 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %108 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %109 = neura.phi_start %108, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%109 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %55 = neura.reserve : !neura.data<i64, i1>
    %56:3 = "neura.fused_op"(%18#1, %55, %50, %48) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i64, i1>):
      %108 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %109 = "neura.gep"(%arg7, %arg8, %108) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %110 = "neura.load"(%109) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%108, %109, %110 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %57 = "neura.fused_op"(%44, %56#0) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %108 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %109 = "neura.load"(%108) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%109 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %58:2 = "neura.fused_op"(%54, %56#0) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %108 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %109 = "neura.load"(%108) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%108, %109 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %59 = "neura.load"(%52) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %60 = "neura.mul"(%56#2, %59) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %61 = "neura.add"(%60, %58#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%61, %58#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %62 = "neura.load"(%46) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %63 = "neura.load"(%56#1) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %64 = "neura.mul"(%57, %63) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %65 = "neura.add"(%64, %62) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%65, %46) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %66 = "neura.or"(%56#0, %42) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67:2 = "neura.fused_op"(%50, %48, %66) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %108 = "neura.gep"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %109 = "neura.load"(%108) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%108, %109 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %68 = "neura.fused_op"(%44, %66) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %108 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %109 = "neura.load"(%108) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%109 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %69:2 = "neura.fused_op"(%54, %66) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %108 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %109 = "neura.load"(%108) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%108, %109 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %70 = "neura.load"(%52) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %71 = "neura.mul"(%67#1, %70) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %72 = "neura.add"(%71, %69#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%72, %69#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %73 = "neura.load"(%46) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %74 = "neura.load"(%67#0) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %75 = "neura.mul"(%68, %74) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %76 = "neura.add"(%75, %73) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%76, %46) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %77 = "neura.add"(%56#0, %40) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78:3 = "neura.fused_op"(%56#0, %38, %77, %54) <{frequency = 13 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:icmp->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %108 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %109 = neura.grant_predicate %arg7, %108 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %110 = neura.grant_predicate %arg8, %108 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%108, %109, %110 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %79:2 = "neura.fused_op"(%9, %10, %36, %78#0) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i1, i1>):
      %108 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %109 = neura.phi_start %108, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %110 = neura.grant_predicate %109, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%109, %110 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %80:3 = "neura.fused_op"(%78#0, %48, %42) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:not->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %108 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %109 = neura.grant_predicate %arg6, %108 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %110 = neura.grant_predicate %arg7, %108 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%108, %109, %110 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %81:2 = "neura.fused_op"(%18#1, %29, %78#0) <{frequency = 26 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>):
      %108 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %109 = neura.grant_predicate %108, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%108, %109 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    neura.ctrl_mov %78#1 -> %55 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %78#2 -> %53 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %82 = neura.grant_predicate %52, %78#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %82 -> %51 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %83 = neura.grant_predicate %50, %78#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %83 -> %49 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %84 = neura.grant_predicate %48, %78#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %84 -> %47 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %85 = neura.grant_predicate %46, %78#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %85 -> %45 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %86 = neura.grant_predicate %44, %78#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %86 -> %43 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %87 = neura.grant_predicate %42, %78#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %87 -> %41 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %88 = neura.grant_predicate %40, %78#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %88 -> %39 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %89 = neura.grant_predicate %38, %78#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %89 -> %37 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %79#1 -> %36 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %90 = neura.grant_predicate %35, %78#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %90 -> %34 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %91 = neura.grant_predicate %33, %78#0 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %91 -> %32 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %92 = neura.grant_predicate %31, %78#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %92 -> %30 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %81#1 -> %29 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %93 = neura.grant_predicate %79#0, %80#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %94 = neura.grant_predicate %81#0, %80#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %95 = "neura.add"(%80#1, %80#2) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96:2 = "neura.fused_op"(%95, %93) <{frequency = 17 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %108 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %109 = neura.grant_predicate %108, %108 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%108, %109 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %97:3 = "neura.fused_op"(%96#0, %94, %95) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:not->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %108 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %109 = neura.grant_predicate %arg6, %108 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %110 = neura.grant_predicate %arg7, %108 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%108, %109, %110 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %98 = "neura.fused_op"(%38, %80#0, %97#0) <{frequency = 11 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %108 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %109 = neura.grant_predicate %108, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%109 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %99 = "neura.fused_op"(%40, %80#0, %97#0) <{frequency = 11 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %108 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %109 = neura.grant_predicate %108, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%109 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %100 = "neura.fused_op"(%44, %80#0, %97#0) <{frequency = 11 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %108 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %109 = neura.grant_predicate %108, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%109 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %101 = "neura.fused_op"(%50, %80#0, %97#0) <{frequency = 11 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %108 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %109 = neura.grant_predicate %108, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%109 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %102 = "neura.fused_op"(%54, %80#0, %97#0) <{frequency = 11 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %108 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %109 = neura.grant_predicate %108, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%109 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.fused_op"(%31, %80#0, %97#0) <{frequency = 11 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %108 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %109 = neura.grant_predicate %108, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%109 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %104 = "neura.fused_op"(%33, %80#0, %97#0) <{frequency = 11 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %108 = neura.grant_predicate %arg5, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %109 = neura.grant_predicate %108, %arg7 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%109 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i32, i1>
    %105 = "neura.fused_op"(%35, %80#0, %97#0) <{frequency = 11 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %108 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %109 = neura.grant_predicate %108, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%109 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %97#2 -> %25 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %105 -> %23 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %104 -> %21 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %103 -> %19 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %97#1 -> %17 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %102 -> %16 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %101 -> %15 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %100 -> %14 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %106 = neura.grant_predicate %80#2, %97#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %106 -> %13 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %99 -> %12 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %98 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %107 = neura.grant_predicate %93, %97#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %107 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %96#1 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

