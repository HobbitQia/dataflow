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
    %0 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %1 = "neura.grant_once"() <{constant_value = 2 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %2 = "neura.grant_once"() <{constant_value = 126 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %5 = neura.phi_start %4, %3 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = "neura.data_mov"(%1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %8 = neura.phi_start %7, %6 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i32, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<i32, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = "neura.data_mov"(%0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20:2 = "neura.fused_op"(%18, %17, %19) <{frequency = 7 : i64, pattern_id = 10 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %138 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %139 = "neura.add"(%138, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%138, %139 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %21 = "neura.data_mov"(%20#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = "neura.data_mov"(%20#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23 = "neura.data_mov"(%20#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25:6 = "neura.fused_op"(%22, %24, %23, %16, %15) <{frequency = 5 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:icmp->grant_predicate->fused_op:grant_once->fused_op:phi_start->grant_predicate->fused_op:grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i64, i1>):
      %138 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %139 = neura.grant_predicate %arg7, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %140 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<i64, i1>
      %141 = neura.phi_start %140, %arg8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %142 = neura.grant_predicate %141, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %143 = "neura.grant_once"() <{constant_value = 128 : i64}> : () -> !neura.data<i64, i1>
      %144 = neura.phi_start %143, %arg9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %145 = neura.grant_predicate %144, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%138, %139, %141, %142, %144, %145 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %26 = "neura.data_mov"(%25#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %27 = "neura.data_mov"(%25#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %28 = "neura.data_mov"(%25#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %29 = "neura.data_mov"(%25#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %30 = "neura.data_mov"(%25#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %31 = "neura.data_mov"(%25#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %32 = "neura.data_mov"(%25#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %33 = "neura.data_mov"(%25#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %34 = "neura.data_mov"(%25#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %35 = "neura.data_mov"(%25#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = "neura.data_mov"(%25#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = "neura.data_mov"(%25#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %38 = "neura.data_mov"(%25#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = "neura.data_mov"(%25#5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %40:2 = "neura.fused_op"(%13, %34) <{frequency = 8 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>):
      %138 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<i32, i1>
      %139 = neura.phi_start %138, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %140 = neura.grant_predicate %139, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%139, %140 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %41 = "neura.data_mov"(%40#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %42 = "neura.data_mov"(%40#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %43 = "neura.data_mov"(%40#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %44 = "neura.data_mov"(%40#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %45 = "neura.data_mov"(%40#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %46:2 = "neura.fused_op"(%11, %33) <{frequency = 8 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>):
      %138 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<i32, i1>
      %139 = neura.phi_start %138, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %140 = neura.grant_predicate %139, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%139, %140 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %47 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %50 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %51 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %52:2 = "neura.fused_op"(%10, %32) <{frequency = 8 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %138 = "neura.grant_once"() <{constant_value = 129 : i64}> : () -> !neura.data<i64, i1>
      %139 = neura.phi_start %138, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %140 = neura.grant_predicate %139, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%139, %140 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %53 = "neura.data_mov"(%52#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = "neura.data_mov"(%52#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55:2 = "neura.fused_op"(%9, %31) <{frequency = 8 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %138 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %139 = neura.phi_start %138, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %140 = neura.grant_predicate %139, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%139, %140 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %56 = "neura.data_mov"(%55#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.data_mov"(%55#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58:2 = "neura.fused_op"(%21, %36, %38) <{frequency = 5 : i64, pattern_id = 0 : i64, pattern_name = "add->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %138 = "neura.add"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %139 = "neura.add"(%138, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%138, %139 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %59 = "neura.data_mov"(%58#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.data_mov"(%58#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = "neura.data_mov"(%58#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62 = "neura.data_mov"(%58#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %63 = "neura.data_mov"(%58#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64 = "neura.data_mov"(%58#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65:5 = "neura.fused_op"(%14, %30, %64, %50) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->grant_predicate->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i32, i1>):
      %138 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %139 = neura.phi_start %138, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %140 = neura.grant_predicate %139, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %141 = "neura.gep"(%139, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %142 = "neura.load"(%141) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %143 = "neura.mul"(%142, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%139, %140, %141, %142, %143 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %66 = "neura.data_mov"(%65#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %67 = "neura.data_mov"(%65#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %68 = "neura.data_mov"(%65#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %69 = "neura.data_mov"(%65#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.data_mov"(%65#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.data_mov"(%65#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %72 = "neura.data_mov"(%65#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %73:5 = "neura.fused_op"(%12, %29, %63, %49) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->grant_predicate->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i32, i1>):
      %138 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %139 = neura.phi_start %138, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %140 = neura.grant_predicate %139, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %141 = "neura.gep"(%139, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %142 = "neura.load"(%141) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %143 = "neura.mul"(%142, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%139, %140, %141, %142, %143 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %74 = "neura.data_mov"(%73#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %75 = "neura.data_mov"(%73#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %76 = "neura.data_mov"(%73#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = "neura.data_mov"(%73#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %78 = "neura.data_mov"(%73#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.data_mov"(%73#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %80 = "neura.data_mov"(%73#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %81:2 = "neura.fused_op"(%76, %62) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %138 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %139 = "neura.load"(%138) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%138, %139 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %82 = "neura.data_mov"(%81#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.data_mov"(%81#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %84 = "neura.data_mov"(%81#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %85:2 = "neura.fused_op"(%79, %44, %72, %84) <{frequency = 4 : i64, pattern_id = 8 : i64, pattern_name = "mul->fused_op:add->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>):
      %138 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %139 = "neura.add"(%138, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %140 = "neura.add"(%arg8, %139) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%139, %140 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %86 = "neura.data_mov"(%85#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %87 = "neura.data_mov"(%85#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %88 = "neura.fused_op"(%71, %43, %80) <{frequency = 4 : i64, pattern_id = 9 : i64, pattern_name = "mul->sub"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>):
      %138 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %139 = "neura.sub"(%138, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%139 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %89 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %90 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %91:3 = "neura.fused_op"(%68, %61, %90) <{frequency = 4 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:gep->load->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %138 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %139 = "neura.load"(%138) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %140 = "neura.sub"(%139, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%138, %139, %140 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %92 = "neura.data_mov"(%91#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %93 = "neura.data_mov"(%91#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %94 = "neura.data_mov"(%91#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%94, %70) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %95 = "neura.add"(%93, %89) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %96 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%96, %92) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %97 = "neura.sub"(%83, %86) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %98 = "neura.data_mov"(%97) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%98, %78) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%87, %82) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %99 = "neura.add"(%60, %53) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100 = "neura.data_mov"(%99) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %101:3 = "neura.fused_op"(%75, %100, %48) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %138 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %139 = "neura.load"(%138) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %140 = "neura.mul"(%139, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%138, %139, %140 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %102 = "neura.data_mov"(%101#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.data_mov"(%101#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %104 = "neura.data_mov"(%101#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %105 = "neura.data_mov"(%99) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %106:3 = "neura.fused_op"(%67, %105, %47, %42, %104) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:gep->load->mul->fused_op:mul->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %138 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %139 = "neura.load"(%138) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %140 = "neura.mul"(%139, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %141 = "neura.mul"(%139, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %142 = "neura.sub"(%141, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%138, %140, %142 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %107 = "neura.data_mov"(%106#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %108 = "neura.data_mov"(%106#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %109 = "neura.data_mov"(%106#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %110 = "neura.data_mov"(%106#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %111 = "neura.add"(%59, %56) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %112 = "neura.data_mov"(%111) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %113:3 = "neura.fused_op"(%66, %112, %110) <{frequency = 4 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:gep->load->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %138 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %139 = "neura.load"(%138) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %140 = "neura.sub"(%139, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%138, %139, %140 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %114 = "neura.data_mov"(%113#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %115 = "neura.data_mov"(%113#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %116 = "neura.data_mov"(%113#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %117 = "neura.data_mov"(%111) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %118:2 = "neura.fused_op"(%74, %117) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %138 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %139 = "neura.load"(%138) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%138, %139 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %119 = "neura.data_mov"(%118#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %120 = "neura.data_mov"(%118#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %121 = "neura.data_mov"(%118#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %122:2 = "neura.fused_op"(%103, %41, %108, %121) <{frequency = 4 : i64, pattern_id = 8 : i64, pattern_name = "mul->fused_op:add->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>):
      %138 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %139 = "neura.add"(%138, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %140 = "neura.add"(%arg8, %139) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%139, %140 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %123 = "neura.data_mov"(%122#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %124 = "neura.data_mov"(%122#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%116, %107) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %125 = "neura.add"(%115, %109) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %126 = "neura.data_mov"(%125) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%126, %114) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %127 = "neura.sub"(%120, %123) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %128 = "neura.data_mov"(%127) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%128, %102) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%124, %119) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %129 = "neura.not"(%28) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %35 -> %17 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %37 -> %16 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %39 -> %15 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %69 -> %14 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %45 -> %13 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %77 -> %12 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %51 -> %11 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %54 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %57 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %130 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %131 = neura.grant_predicate %130, %27 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %131 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %132 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %133 = neura.grant_predicate %132, %26 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %133 -> %3 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %134 = "neura.data_mov"(%129) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %135 = "neura.data_mov"(%129) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %136 = neura.grant_predicate %134, %135 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %137 = "neura.data_mov"(%136) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %137 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

