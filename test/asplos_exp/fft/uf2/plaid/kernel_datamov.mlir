#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE9data_real(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE9data_imag(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE9data_real {latency = 1 : i32} : !llvm.ptr
    %2 = llvm.mlir.addressof @_ZZ4mainE9data_imag {latency = 1 : i32} : !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) {latency = 1 : i32} : i32
    %4 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.constant(256 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.constant(128 : i64) {latency = 1 : i32} : i64
    %7 = llvm.mlir.constant(129 : i64) {latency = 1 : i32} : i64
    %8 = llvm.mlir.constant(2 : i64) {latency = 1 : i32} : i64
    %9 = llvm.mlir.constant(126 : i64) {latency = 1 : i32} : i64
    %10 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%11: i64):  // 2 preds: ^bb0, ^bb1
    %12 = llvm.getelementptr inbounds %1[0, %11] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %13 = llvm.trunc %11 {latency = 1 : i32} : i64 to i32
    llvm.store %13, %12 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %14 = llvm.getelementptr inbounds %2[0, %11] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    llvm.store %3, %14 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %15 = llvm.add %11, %4 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %16 = llvm.icmp "eq" %15, %5 {latency = 1 : i32} : i64
    llvm.cond_br %16, ^bb2(%0 : i64), ^bb1(%15 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%17: i64):  // 2 preds: ^bb1, ^bb2
    %18 = llvm.add %17, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %19 = llvm.getelementptr inbounds %1[0, %18] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %20 = llvm.load %19 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.shl %20, %3 overflow<nsw> {latency = 1 : i32} : i32
    %22 = llvm.getelementptr inbounds %2[0, %18] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %23 = llvm.load %22 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.shl %23, %3 overflow<nsw> {latency = 1 : i32} : i32
    %25 = llvm.sub %21, %24 overflow<nsw> {latency = 1 : i32} : i32
    %26 = llvm.add %24, %21 overflow<nsw> {latency = 1 : i32} : i32
    %27 = llvm.getelementptr inbounds %1[0, %17] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %28 = llvm.load %27 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.sub %28, %25 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %29, %19 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %30 = llvm.add %25, %28 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %30, %27 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %31 = llvm.getelementptr inbounds %2[0, %17] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %32 = llvm.load %31 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.sub %32, %26 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %33, %22 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %34 = llvm.add %32, %26 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %34, %31 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %35 = llvm.add %17, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %36 = llvm.getelementptr inbounds %1[0, %35] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %37 = llvm.load %36 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %38 = llvm.shl %37, %3 overflow<nsw> {latency = 1 : i32} : i32
    %39 = llvm.getelementptr inbounds %2[0, %35] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %40 = llvm.load %39 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.shl %40, %3 overflow<nsw> {latency = 1 : i32} : i32
    %42 = llvm.sub %38, %41 overflow<nsw> {latency = 1 : i32} : i32
    %43 = llvm.add %41, %38 overflow<nsw> {latency = 1 : i32} : i32
    %44 = llvm.or %17, %4 {latency = 1 : i32} : i64
    %45 = llvm.getelementptr inbounds %1[0, %44] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %46 = llvm.load %45 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %47 = llvm.sub %46, %42 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %47, %36 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %48 = llvm.add %42, %46 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %48, %45 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %49 = llvm.getelementptr inbounds %2[0, %44] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %50 = llvm.load %49 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %51 = llvm.sub %50, %43 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %51, %39 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %52 = llvm.add %50, %43 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %52, %49 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %53 = llvm.add %17, %8 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %54 = llvm.icmp "ult" %17, %9 {latency = 1 : i32} : i64
    llvm.cond_br %54, ^bb2(%53 : i64), ^bb3 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.return {latency = 1 : i32} %10 : i32
  }
  func.func @_Z6kernelPiS_iil(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: i32 {llvm.noundef}, %arg3: i32 {llvm.noundef}, %arg4: i64 {llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg3"}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
    %4 = "neura.grant_once"() <{constant_value = "%arg4"}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 128 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 129 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 2 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %10 = "neura.grant_once"() <{constant_value = 126 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = "neura.data_mov"(%10) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = neura.phi_start %12, %11 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = "neura.data_mov"(%9) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = neura.phi_start %15, %14 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = neura.phi_start %18, %17 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = neura.phi_start %21, %20 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<i32, i1>
    %24 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %25 = neura.phi_start %24, %23 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %26 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %27 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = neura.phi_start %27, %26 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %29 = neura.reserve : !neura.data<i32, i1>
    %30 = "neura.data_mov"(%2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %31 = neura.phi_start %30, %29 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %32 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %33 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = neura.phi_start %33, %32 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %35 = neura.reserve : !neura.data<i64, i1>
    %36 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = neura.phi_start %36, %35 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = "neura.data_mov"(%4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %40 = neura.phi_start %39, %38 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = neura.phi_start %42, %41 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.data_mov"(%40) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %46 = "neura.data_mov"(%37) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %48:3 = "neura.fused_op"(%44, %45, %46, %47) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:add->add->gep"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %177 = "neura.add"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %178 = "neura.add"(%177, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %179 = "neura.gep"(%arg8, %178) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%177, %178, %179 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %49 = "neura.data_mov"(%48#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = "neura.data_mov"(%48#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.data_mov"(%48#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.data_mov"(%48#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %53 = "neura.data_mov"(%48#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = "neura.data_mov"(%48#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %55 = "neura.data_mov"(%48#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = "neura.load"(%55) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %57 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %58 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %59 = "neura.mul"(%57, %58) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %60 = "neura.data_mov"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %61 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %62:3 = "neura.fused_op"(%60, %53, %61) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %177 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %178 = "neura.load"(%177) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %179 = "neura.mul"(%178, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%177, %178, %179 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %63 = "neura.data_mov"(%62#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %64 = "neura.data_mov"(%62#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %65 = "neura.data_mov"(%62#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %66 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %67 = "neura.sub"(%66, %65) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %68 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %69 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %70 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %71 = "neura.fused_op"(%68, %69, %64, %70) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.fan_in:mul->mul->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>):
      %177 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %178 = "neura.mul"(%arg7, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %179 = "neura.add"(%178, %177) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%179 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %72 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %73 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %74 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %75 = "neura.data_mov"(%67) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %76:3 = "neura.fused_op"(%74, %52, %75) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.unicast:gep->load->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %177 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %178 = "neura.load"(%177) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %179 = "neura.sub"(%178, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%177, %178, %179 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %77 = "neura.data_mov"(%76#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %78 = "neura.data_mov"(%76#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %79 = "neura.data_mov"(%76#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%79, %54) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %80 = "neura.data_mov"(%67) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %81 = "neura.add"(%78, %80) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %82 = "neura.data_mov"(%81) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%82, %77) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %83 = "neura.data_mov"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %84:3 = "neura.fused_op"(%83, %51, %73) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:gep->load->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %177 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %178 = "neura.load"(%177) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %179 = "neura.sub"(%178, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%177, %178, %179 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %85 = "neura.data_mov"(%84#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %86 = "neura.data_mov"(%84#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %87 = "neura.data_mov"(%84#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%87, %63) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %88 = "neura.add"(%86, %72) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %89 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%89, %85) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %90 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %91 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %92:3 = "neura.fused_op"(%50, %90, %91) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.unicast:add->gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %177 = "neura.add"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %178 = "neura.gep"(%arg7, %177) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %179 = "neura.load"(%178) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%177, %178, %179 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %93 = "neura.data_mov"(%92#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %94 = "neura.data_mov"(%92#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %95 = "neura.data_mov"(%92#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %96 = "neura.data_mov"(%92#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %97 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %98 = "neura.mul"(%96, %97) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %99 = "neura.data_mov"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %100 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %101:3 = "neura.fused_op"(%99, %93, %100) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.unicast:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %177 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %178 = "neura.load"(%177) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %179 = "neura.mul"(%178, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%177, %178, %179 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %102 = "neura.data_mov"(%101#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.data_mov"(%101#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %104 = "neura.data_mov"(%101#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %105 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %106 = "neura.sub"(%105, %104) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %107 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %108 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %109 = "neura.fused_op"(%95, %107, %103, %108) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.fan_in:mul->mul->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>):
      %177 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %178 = "neura.mul"(%arg7, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %179 = "neura.add"(%178, %177) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%179 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %110 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %111 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %112 = "neura.data_mov"(%19) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %113 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %114:3 = "neura.fused_op"(%49, %112, %113) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.unicast:add->gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %177 = "neura.add"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %178 = "neura.gep"(%arg7, %177) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %179 = "neura.load"(%178) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%177, %178, %179 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %115 = "neura.data_mov"(%114#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %116 = "neura.data_mov"(%114#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %117 = "neura.data_mov"(%114#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %118 = "neura.data_mov"(%114#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %119 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %120 = "neura.sub"(%118, %119) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %121 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%121, %94) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %122 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %123 = "neura.add"(%117, %122) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %124 = "neura.data_mov"(%123) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%124, %116) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %125 = "neura.data_mov"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %126:3 = "neura.fused_op"(%125, %115, %111) <{frequency = 1 : i64, pattern_id = 9 : i64, pattern_name = "plaid.unicast:gep->load->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %177 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %178 = "neura.load"(%177) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %179 = "neura.sub"(%178, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%177, %178, %179 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %127 = "neura.data_mov"(%126#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %128 = "neura.data_mov"(%126#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %129 = "neura.data_mov"(%126#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%129, %102) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %130 = "neura.add"(%128, %110) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %131 = "neura.data_mov"(%130) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%131, %127) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %132 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %133 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134 = "neura.add"(%132, %133) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %135 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %136 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %137 = "neura.icmp"(%135, %136) <{cmpType = "ult"}> {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %138 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %139 = "neura.not"(%138) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %140 = "neura.data_mov"(%134) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %141 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %142 = neura.grant_predicate %140, %141 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %142 -> %41 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %143 = "neura.data_mov"(%40) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %144 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %145 = neura.grant_predicate %143, %144 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %145 -> %38 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %146 = "neura.data_mov"(%37) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %147 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %148 = neura.grant_predicate %146, %147 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %148 -> %35 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %149 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %150 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %151 = neura.grant_predicate %149, %150 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %151 -> %32 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %152 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %153 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %154 = neura.grant_predicate %152, %153 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %154 -> %29 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %155 = "neura.data_mov"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %156 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %157 = neura.grant_predicate %155, %156 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %157 -> %26 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %158 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %159 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %160 = neura.grant_predicate %158, %159 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %160 -> %23 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %161 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %162 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %163 = neura.grant_predicate %161, %162 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %163 -> %20 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %164 = "neura.data_mov"(%19) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %165 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %166 = neura.grant_predicate %164, %165 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %166 -> %17 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %167 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %168 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %169 = neura.grant_predicate %167, %168 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %169 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %170 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %171 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %172 = neura.grant_predicate %170, %171 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %172 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %173 = "neura.data_mov"(%139) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %174 = "neura.data_mov"(%139) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %175 = neura.grant_predicate %173, %174 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %176 = "neura.data_mov"(%175) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %176 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

