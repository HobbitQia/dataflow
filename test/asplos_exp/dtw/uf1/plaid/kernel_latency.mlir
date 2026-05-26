#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1S(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<512 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1T(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<512 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3DTW(dense<0> : tensor<263169xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<263169 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %2 = llvm.mlir.addressof @_ZZ4mainE1S {latency = 1 : i32} : !llvm.ptr
    %3 = llvm.mlir.addressof @_ZZ4mainE1T {latency = 1 : i32} : !llvm.ptr
    %4 = llvm.mlir.constant(3 : i32) {latency = 1 : i32} : i32
    %5 = llvm.mlir.constant(512 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.addressof @_ZZ4mainE3DTW {latency = 1 : i32} : !llvm.ptr
    %7 = llvm.mlir.constant(65535 : i32) {latency = 1 : i32} : i32
    %8 = llvm.mlir.constant(263169 : i64) {latency = 1 : i32} : i64
    %9 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    %10 = llvm.mlir.constant(513 : i64) {latency = 1 : i32} : i64
    %11 = llvm.mlir.constant(-513 : i64) {latency = 1 : i32} : i64
    %12 = llvm.mlir.constant(-1 : i64) {latency = 1 : i32} : i64
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb1
    %14 = llvm.add %13, %1 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %15 = llvm.getelementptr inbounds %2[0, %13] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %16 = llvm.trunc %14 {latency = 1 : i32} : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.getelementptr inbounds %3[0, %13] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %18 = llvm.trunc %13 {latency = 1 : i32} : i64 to i32
    %19 = llvm.add %18, %4 {latency = 1 : i32} : i32
    llvm.store %19, %17 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.icmp "eq" %14, %5 {latency = 1 : i32} : i64
    llvm.cond_br %20, ^bb2(%0 : i64), ^bb1(%14 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%21: i64):  // 2 preds: ^bb1, ^bb2
    %22 = llvm.getelementptr inbounds %6[0, %21] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %7, %22 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %21, %1 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %24 = llvm.icmp "eq" %23, %8 {latency = 1 : i32} : i64
    llvm.cond_br %24, ^bb3, ^bb2(%23 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.store %9, %6 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb4(%1 : i64) {latency = 1 : i32}
  ^bb4(%25: i64):  // 2 preds: ^bb3, ^bb6
    %26 = llvm.getelementptr inbounds %2[0, %25] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %27 = llvm.mul %25, %10 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %28 = llvm.add %27, %10 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %29 = llvm.load %26 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb5(%1 : i64) {latency = 1 : i32}
  ^bb5(%30: i64):  // 2 preds: ^bb4, ^bb5
    %31 = llvm.getelementptr inbounds %3[0, %30] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %32 = llvm.load %31 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.sub %29, %32 overflow<nsw> {latency = 1 : i32} : i32
    %34 = llvm.sub %32, %29 overflow<nsw> {latency = 1 : i32} : i32
    %35 = llvm.icmp "sgt" %34, %33 {latency = 1 : i32} : i32
    %36 = llvm.select %35, %34, %33 {latency = 1 : i32} : i1, i32
    %37 = llvm.add %30, %27 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %38 = llvm.add %37, %11 overflow<nsw> {latency = 1 : i32} : i64
    %39 = llvm.getelementptr inbounds %6[0, %38] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %40 = llvm.load %39 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.getelementptr inbounds %6[0, %37] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %42 = llvm.load %41 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.add %37, %12 overflow<nsw> {latency = 1 : i32} : i64
    %44 = llvm.getelementptr inbounds %6[0, %43] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %45 = llvm.load %44 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.icmp "slt" %42, %40 {latency = 1 : i32} : i32
    %47 = llvm.select %46, %42, %40 {latency = 1 : i32} : i1, i32
    %48 = llvm.icmp "slt" %45, %47 {latency = 1 : i32} : i32
    %49 = llvm.select %48, %45, %47 {latency = 1 : i32} : i1, i32
    %50 = llvm.add %49, %36 overflow<nsw> {latency = 1 : i32} : i32
    %51 = llvm.add %30, %1 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %52 = llvm.add %28, %51 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %53 = llvm.getelementptr inbounds %6[0, %52] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %50, %53 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %54 = llvm.icmp "eq" %51, %5 {latency = 1 : i32} : i64
    llvm.cond_br %54, ^bb6, ^bb5(%51 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    %55 = llvm.add %25, %1 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %56 = llvm.icmp "eq" %55, %5 {latency = 1 : i32} : i64
    llvm.cond_br %56, ^bb7, ^bb4(%55 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    llvm.return {latency = 1 : i32} %9 : i32
  }
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 513 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = -513 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = -1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 512 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.phi_start %7, %8 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.phi_start %6, %10 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.phi_start %2, %12 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.phi_start %5, %14 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = neura.phi_start %1, %16 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.phi_start %3, %18 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = neura.phi_start %4, %20 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %22 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %23 = neura.phi_start %0, %22 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.phi_start %3, %24 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %26 = "neura.gep"(%23, %25) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %27 = "neura.mul"(%25, %21) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.add"(%27, %21) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = neura.phi_start %21, %29 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %32 = neura.phi_start %23, %31 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = neura.phi_start %25, %33 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %35 = neura.reserve : !neura.data<i64, i1>
    %36 = neura.phi_start %9, %35 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = neura.phi_start %28, %37 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = neura.phi_start %19, %39 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = neura.phi_start %11, %41 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %43 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %44 = neura.phi_start %13, %43 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = neura.phi_start %15, %45 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = neura.phi_start %27, %47 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %49 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %50 = neura.phi_start %17, %49 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %51 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %52 = neura.phi_start %26, %51 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %53 = neura.reserve : !neura.data<i64, i1>
    %54 = neura.phi_start %19, %53 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %55 = "neura.load"(%52) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %56:2 = "neura.fused_op"(%50, %54, %55) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:gep->load->sub"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i32, i1>):
      %102 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %103 = "neura.load"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %104 = "neura.sub"(%arg5, %103) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%103, %104 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %57 = "neura.fused_op"(%56#0, %55, %56#1) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:sub->icmp->sel"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>):
      %102 = "neura.sub"(%arg3, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %103 = "neura.icmp"(%102, %arg5) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %104 = "neura.sel"(%103, %102, %arg5) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%104 : !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %58:2 = "neura.fused_op"(%54, %48, %46, %44) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %102 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %103 = "neura.add"(%102, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %104 = "neura.gep"(%arg6, %103) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%102, %104 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %59 = "neura.load"(%58#1) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %60 = "neura.gep"(%44, %58#0) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %61 = "neura.load"(%60) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %62 = "neura.fused_op"(%58#0, %42, %44) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.unicast:add->gep->load"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %102 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %103 = "neura.gep"(%arg5, %102) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %104 = "neura.load"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%104 : !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %63:2 = "neura.fused_op"(%61, %59, %62) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:icmp->sel->icmp"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>):
      %102 = "neura.icmp"(%arg3, %arg4) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %103 = "neura.sel"(%102, %arg3, %arg4) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %104 = "neura.icmp"(%arg5, %103) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      neura.yield results(%103, %104 : !neura.data<i32, i1>, !neura.data<i1, i1>)
    }) {latency = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i1, i1>)
    %64 = "neura.sel"(%63#1, %62, %63#0) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %65 = "neura.add"(%64, %57) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %66:2 = "neura.fused_op"(%54, %40, %38, %44) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.unicast:add->add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %102 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %103 = "neura.add"(%arg5, %102) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %104 = "neura.gep"(%arg6, %103) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%102, %104 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    "neura.store"(%65, %66#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %67 = "neura.icmp"(%66#0, %36) <{cmpType = "eq"}> {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %68 = "neura.not"(%67) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %69 = neura.grant_predicate %66#0, %68 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %69 -> %53 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %70 = neura.grant_predicate %52, %68 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %70 -> %51 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %71 = neura.grant_predicate %50, %68 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %71 -> %49 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %72 = neura.grant_predicate %48, %68 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %72 -> %47 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %73 = neura.grant_predicate %46, %68 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %73 -> %45 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %74 = neura.grant_predicate %44, %68 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %74 -> %43 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %75 = neura.grant_predicate %42, %68 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %75 -> %41 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %76 = neura.grant_predicate %40, %68 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %76 -> %39 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %77 = neura.grant_predicate %38, %68 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %77 -> %37 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %78 = neura.grant_predicate %36, %68 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %78 -> %35 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %79 = neura.grant_predicate %34, %68 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %79 -> %33 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %80 = neura.grant_predicate %32, %68 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %80 -> %31 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %81 = neura.grant_predicate %30, %68 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %81 -> %29 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %82 = neura.grant_predicate %34, %67 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %83 = neura.grant_predicate %40, %67 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %84 = neura.grant_predicate %36, %67 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %85 = neura.grant_predicate %32, %67 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %86 = neura.grant_predicate %30, %67 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %87 = neura.grant_predicate %50, %67 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %88 = neura.grant_predicate %46, %67 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %89 = neura.grant_predicate %44, %67 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %90 = neura.grant_predicate %42, %67 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %91:3 = "neura.fused_op"(%82, %83, %84) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.unicast:add->icmp->not"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %102 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %103 = "neura.icmp"(%102, %arg5) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %104 = "neura.not"(%103) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      neura.yield results(%102, %103, %104 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %92 = neura.grant_predicate %91#0, %91#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %92 -> %24 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %93 = neura.grant_predicate %85, %91#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %93 -> %22 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %94 = neura.grant_predicate %86, %91#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %94 -> %20 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %95 = neura.grant_predicate %83, %91#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %95 -> %18 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %96 = neura.grant_predicate %87, %91#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %96 -> %16 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %97 = neura.grant_predicate %88, %91#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %97 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %98 = neura.grant_predicate %89, %91#2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %98 -> %12 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %99 = neura.grant_predicate %90, %91#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %99 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %100 = neura.grant_predicate %84, %91#2 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %100 -> %8 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %101 = neura.grant_predicate %91#1, %91#1 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %101 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

