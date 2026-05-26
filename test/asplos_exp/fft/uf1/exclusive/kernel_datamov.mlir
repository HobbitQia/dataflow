#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %7 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%8: i64):  // 2 preds: ^bb0, ^bb1
    %9 = llvm.getelementptr inbounds %1[0, %8] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %10 = llvm.trunc %8 {latency = 1 : i32} : i64 to i32
    llvm.store %10, %9 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %11 = llvm.getelementptr inbounds %2[0, %8] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    llvm.store %3, %11 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %12 = llvm.add %8, %4 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %13 = llvm.icmp "eq" %12, %5 {latency = 1 : i32} : i64
    llvm.cond_br %13, ^bb2(%0 : i64), ^bb1(%12 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%14: i64):  // 2 preds: ^bb1, ^bb2
    %15 = llvm.add %14, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %16 = llvm.getelementptr inbounds %1[0, %15] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %17 = llvm.load %16 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.shl %17, %3 overflow<nsw> {latency = 1 : i32} : i32
    %19 = llvm.getelementptr inbounds %2[0, %15] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %20 = llvm.load %19 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.shl %20, %3 overflow<nsw> {latency = 1 : i32} : i32
    %22 = llvm.sub %18, %21 overflow<nsw> {latency = 1 : i32} : i32
    %23 = llvm.add %21, %18 overflow<nsw> {latency = 1 : i32} : i32
    %24 = llvm.getelementptr inbounds %1[0, %14] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %25 = llvm.load %24 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.sub %25, %22 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %26, %16 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %27 = llvm.add %22, %25 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %27, %24 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %28 = llvm.getelementptr inbounds %2[0, %14] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %29 = llvm.load %28 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.sub %29, %23 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %30, %19 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %31 = llvm.add %29, %23 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %31, %28 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %32 = llvm.add %14, %4 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %33 = llvm.icmp "eq" %32, %6 {latency = 1 : i32} : i64
    llvm.cond_br %33, ^bb3, ^bb2(%32 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.return {latency = 1 : i32} %7 : i32
  }
  func.func @_Z6kernelPiS_iil(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: i32 {llvm.noundef}, %arg3: i32 {llvm.noundef}, %arg4: i64 {llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg3"}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
    %4 = neura.reserve : !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<i32, i1>
    %6 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %7 = neura.phi_start %6, %5 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %8 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<i32, i1>
    %10 = "neura.data_mov"(%2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %11 = neura.phi_start %10, %9 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = "neura.fused_op"(%15) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %99 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %100 = neura.phi_start %99, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%100 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19:2 = "neura.fused_op"(%4, %18) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->fused_op:phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %99 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %100 = neura.phi_start %99, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %101 = "neura.add"(%arg6, %100) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%100, %101 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %20 = "neura.data_mov"(%19#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21 = "neura.data_mov"(%19#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = "neura.data_mov"(%19#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23:2 = "neura.fused_op"(%14, %17) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->fused_op:phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %99 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<i64, i1>
      %100 = neura.phi_start %99, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %101 = "neura.add"(%arg6, %100) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%100, %101 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %24 = "neura.data_mov"(%23#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.data_mov"(%23#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.data_mov"(%23#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.data_mov"(%23#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28:2 = "neura.fused_op"(%13, %27) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->fused_op:phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %99 = "neura.grant_once"() <{constant_value = 128 : i64}> : () -> !neura.data<i64, i1>
      %100 = neura.phi_start %99, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %101 = "neura.add"(%arg6, %100) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%100, %101 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %29 = "neura.data_mov"(%28#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.data_mov"(%28#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = "neura.data_mov"(%28#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = "neura.data_mov"(%28#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34:3 = "neura.fused_op"(%33, %12, %26) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i64, i1>):
      %99 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.gep"(%99, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %101 = "neura.load"(%100) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%99, %100, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %35 = "neura.data_mov"(%34#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %36 = "neura.data_mov"(%34#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = "neura.data_mov"(%34#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = "neura.data_mov"(%34#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %39 = "neura.data_mov"(%34#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %40 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %41:3 = "neura.fused_op"(%40, %8, %25) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i64, i1>):
      %99 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.gep"(%99, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %101 = "neura.load"(%100) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%99, %100, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %42 = "neura.data_mov"(%41#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = "neura.data_mov"(%41#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = "neura.data_mov"(%41#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.data_mov"(%41#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %46 = "neura.data_mov"(%41#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %47 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48:3 = "neura.fused_op"(%43, %32, %47) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %99 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %101 = "neura.mul"(%100, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%99, %100, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %49 = "neura.data_mov"(%48#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %50 = "neura.data_mov"(%48#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %51 = "neura.data_mov"(%48#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %52 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %53:3 = "neura.fused_op"(%36, %31, %52) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %99 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %101 = "neura.mul"(%100, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%99, %100, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %54 = "neura.data_mov"(%53#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %55 = "neura.data_mov"(%53#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %56 = "neura.data_mov"(%53#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %57 = "neura.sub"(%56, %51) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %58 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %59 = "neura.mul"(%55, %58) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %60 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %61 = "neura.mul"(%50, %60) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %63 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %64 = "neura.add"(%62, %63) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %65 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %66 = "neura.sub"(%39, %65) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %67 = "neura.data_mov"(%66) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%67, %54) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %68 = "neura.data_mov"(%57) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %69 = "neura.add"(%38, %68) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %70 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%70, %37) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %71 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %72 = "neura.sub"(%46, %71) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%73, %49) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %74 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %75 = "neura.add"(%45, %74) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %76 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%76, %44) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %77 = "neura.icmp"(%22, %30) <{cmpType = "eq"}> {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %78 = "neura.data_mov"(%77) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %79:4 = "neura.fused_op"(%78, %21, %20, %24) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %99 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %100 = neura.grant_predicate %arg6, %99 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %101 = neura.grant_predicate %arg7, %99 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %102 = neura.grant_predicate %arg8, %99 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%99, %100, %101, %102 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %80 = "neura.data_mov"(%79#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %81 = "neura.data_mov"(%79#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %82 = "neura.data_mov"(%79#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %83 = "neura.data_mov"(%79#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %84 = "neura.data_mov"(%79#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %85 = "neura.data_mov"(%79#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %86 = "neura.data_mov"(%79#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %87 = "neura.data_mov"(%79#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %85 -> %15 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %87 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %88 = neura.grant_predicate %29, %84 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %88 -> %13 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %89 = neura.grant_predicate %35, %83 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %89 -> %12 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %90 = "neura.data_mov"(%11) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %91 = neura.grant_predicate %90, %82 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %91 -> %9 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %92 = neura.grant_predicate %42, %81 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %92 -> %8 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %93 = "neura.data_mov"(%7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %94 = neura.grant_predicate %93, %80 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %94 -> %5 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %86 -> %4 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %95 = "neura.data_mov"(%77) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %96 = "neura.data_mov"(%77) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %97 = neura.grant_predicate %95, %96 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %98 = "neura.data_mov"(%97) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %98 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

