#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal @_ZZ4mainE9data_real(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.mlir.global internal @_ZZ4mainE9data_imag(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE9data_real {latency = 1 : i32} : !llvm.ptr
    %2 = llvm.mlir.addressof @_ZZ4mainE9data_imag {latency = 1 : i32} : !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) {latency = 1 : i32} : i32
    %4 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.constant(256 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.constant(2 : i32) {latency = 1 : i32} : i32
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
    llvm.cond_br %13, ^bb2, ^bb1(%12 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %14 = func.call @_Z6kernelPiS_iil(%1, %2, %6, %6, %0) {latency = 1 : i32} : (!llvm.ptr, !llvm.ptr, i32, i32, i64) -> !llvm.void
    llvm.return {latency = 1 : i32} %7 : i32
  }
  func.func @_Z6kernelPiS_iil(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: i32 {llvm.noundef}, %arg3: i32 {llvm.noundef}, %arg4: i64 {llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %1 = "neura.grant_once"() <{constant_value = 4 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %2 = "neura.grant_once"() <{constant_value = 124 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %5 = neura.phi_start %4, %3 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = "neura.data_mov"(%1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %8 = neura.phi_start %7, %6 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i32, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<i32, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = "neura.data_mov"(%0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24:2 = "neura.fused_op"(%22, %21, %23) <{frequency = 11 : i64, pattern_id = 10 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %230 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %231 = "neura.add"(%230, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%230, %231 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %25 = "neura.data_mov"(%24#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.data_mov"(%24#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.data_mov"(%24#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29:4 = "neura.fused_op"(%26, %28, %27, %20) <{frequency = 12 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:icmp->grant_predicate->fused_op:grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %230 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %231 = neura.grant_predicate %arg7, %230 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %232 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<i64, i1>
      %233 = neura.phi_start %232, %arg8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %234 = neura.grant_predicate %233, %230 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%230, %231, %233, %234 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %30 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %31 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %32 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %33 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %34 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %35 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %36 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %37 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %38 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %39 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %40 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %41 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %42 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %43 = "neura.data_mov"(%29#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %44 = "neura.data_mov"(%29#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.data_mov"(%29#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %46 = "neura.data_mov"(%29#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47:2 = "neura.fused_op"(%19, %43) <{frequency = 12 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %230 = "neura.grant_once"() <{constant_value = 128 : i64}> : () -> !neura.data<i64, i1>
      %231 = neura.phi_start %230, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %232 = neura.grant_predicate %231, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%231, %232 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %48 = "neura.data_mov"(%47#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %49 = "neura.data_mov"(%47#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50:2 = "neura.fused_op"(%18, %42) <{frequency = 12 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>):
      %230 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %231 = neura.phi_start %230, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %232 = neura.grant_predicate %231, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%231, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %51 = "neura.data_mov"(%50#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %52 = "neura.data_mov"(%50#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %53 = "neura.data_mov"(%50#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %54 = "neura.data_mov"(%50#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %55 = "neura.data_mov"(%50#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = "neura.data_mov"(%50#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.data_mov"(%50#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %58 = "neura.data_mov"(%50#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %59 = "neura.data_mov"(%50#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %60:2 = "neura.fused_op"(%17, %41) <{frequency = 12 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>):
      %230 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<i32, i1>
      %231 = neura.phi_start %230, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %232 = neura.grant_predicate %231, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%231, %232 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %61 = "neura.data_mov"(%60#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %62 = "neura.data_mov"(%60#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %63 = "neura.data_mov"(%60#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %64 = "neura.data_mov"(%60#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %65 = "neura.data_mov"(%60#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %66 = "neura.data_mov"(%60#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %67 = "neura.data_mov"(%60#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %68 = "neura.data_mov"(%60#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %69 = "neura.data_mov"(%60#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %70:2 = "neura.fused_op"(%16, %40) <{frequency = 12 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>):
      %230 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %231 = neura.phi_start %230, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %232 = neura.grant_predicate %231, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%231, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %71 = "neura.data_mov"(%70#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = "neura.data_mov"(%70#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %73 = "neura.data_mov"(%70#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %74 = "neura.data_mov"(%70#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %75 = "neura.data_mov"(%70#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %76 = "neura.data_mov"(%70#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = "neura.data_mov"(%70#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %78 = "neura.data_mov"(%70#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.data_mov"(%70#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %80:2 = "neura.fused_op"(%15, %39) <{frequency = 12 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>):
      %230 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<i32, i1>
      %231 = neura.phi_start %230, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %232 = neura.grant_predicate %231, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%231, %232 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %81 = "neura.data_mov"(%80#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %82 = "neura.data_mov"(%80#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %83 = "neura.data_mov"(%80#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %84 = "neura.data_mov"(%80#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %85 = "neura.data_mov"(%80#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %86 = "neura.data_mov"(%80#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %87 = "neura.data_mov"(%80#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %88 = "neura.data_mov"(%80#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %89 = "neura.data_mov"(%80#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %90:2 = "neura.fused_op"(%14, %38) <{frequency = 12 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %230 = "neura.grant_once"() <{constant_value = 129 : i64}> : () -> !neura.data<i64, i1>
      %231 = neura.phi_start %230, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %232 = neura.grant_predicate %231, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%231, %232 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %91 = "neura.data_mov"(%90#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %92 = "neura.data_mov"(%90#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %93:3 = "neura.fused_op"(%25, %45, %48, %91) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->add->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %230 = "neura.add"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %231 = "neura.add"(%230, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %232 = "neura.add"(%230, %arg8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%230, %231, %232 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %94 = "neura.data_mov"(%93#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %95 = "neura.data_mov"(%93#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96 = "neura.data_mov"(%93#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %97 = "neura.data_mov"(%93#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.data_mov"(%93#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %99 = "neura.data_mov"(%93#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100 = "neura.data_mov"(%93#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %101 = "neura.data_mov"(%93#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = "neura.data_mov"(%93#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %103 = "neura.data_mov"(%93#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %104 = "neura.data_mov"(%93#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %105:2 = "neura.fused_op"(%9, %37, %100) <{frequency = 5 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->grant_predicate->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %230 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
      %231 = neura.phi_start %230, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %232 = neura.grant_predicate %231, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %233 = "neura.add"(%arg7, %231) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%232, %233 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %106 = "neura.data_mov"(%105#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %107 = "neura.data_mov"(%105#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %108 = "neura.data_mov"(%105#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %109:2 = "neura.fused_op"(%10, %36, %99) <{frequency = 5 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->grant_predicate->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %230 = "neura.grant_once"() <{constant_value = 131 : i64}> : () -> !neura.data<i64, i1>
      %231 = neura.phi_start %230, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %232 = neura.grant_predicate %231, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %233 = "neura.add"(%arg7, %231) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%232, %233 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %110 = "neura.data_mov"(%109#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %111 = "neura.data_mov"(%109#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %112 = "neura.data_mov"(%109#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %113:2 = "neura.fused_op"(%11, %35, %98) <{frequency = 5 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->grant_predicate->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %230 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %231 = neura.phi_start %230, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %232 = neura.grant_predicate %231, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %233 = "neura.add"(%arg7, %231) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%232, %233 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %114 = "neura.data_mov"(%113#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %115 = "neura.data_mov"(%113#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %116 = "neura.data_mov"(%113#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %117:2 = "neura.fused_op"(%12, %34, %97) <{frequency = 5 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->grant_predicate->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %230 = "neura.grant_once"() <{constant_value = 130 : i64}> : () -> !neura.data<i64, i1>
      %231 = neura.phi_start %230, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %232 = neura.grant_predicate %231, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %233 = "neura.add"(%arg7, %231) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%232, %233 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %118 = "neura.data_mov"(%117#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %119 = "neura.data_mov"(%117#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %120 = "neura.data_mov"(%117#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %121:2 = "neura.fused_op"(%13, %33, %96) <{frequency = 5 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->grant_predicate->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %230 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %231 = neura.phi_start %230, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %232 = neura.grant_predicate %231, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %233 = "neura.add"(%arg7, %231) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%232, %233 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %122 = "neura.data_mov"(%121#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %123 = "neura.data_mov"(%121#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %124 = "neura.data_mov"(%121#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %125:3 = "neura.fused_op"(%58, %102, %88) <{frequency = 12 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.mul"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %126 = "neura.data_mov"(%125#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %127 = "neura.data_mov"(%125#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %128 = "neura.data_mov"(%125#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %129:2 = "neura.fused_op"(%78, %95) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %130 = "neura.data_mov"(%129#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %131 = "neura.data_mov"(%129#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %132 = "neura.data_mov"(%129#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %133:4 = "neura.fused_op"(%77, %101, %87, %68, %128, %132) <{frequency = 8 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:gep->load->mul->fused_op:mul->fused_op:add->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>, %arg10: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.mul"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %233 = "neura.mul"(%231, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %234 = "neura.add"(%233, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %235 = "neura.add"(%arg10, %234) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %232, %234, %235 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %134 = "neura.data_mov"(%133#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %135 = "neura.data_mov"(%133#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %136 = "neura.data_mov"(%133#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %137 = "neura.data_mov"(%133#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %138 = "neura.fused_op"(%127, %67, %135) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "mul->sub"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>):
      %230 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %231 = "neura.sub"(%230, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%231 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %139 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %140 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %141:3 = "neura.fused_op"(%57, %94, %140) <{frequency = 8 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:gep->load->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.sub"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %142 = "neura.data_mov"(%141#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %143 = "neura.data_mov"(%141#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %144 = "neura.data_mov"(%141#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%144, %126) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %145 = "neura.add"(%143, %139) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %146 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%146, %142) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %147 = "neura.sub"(%131, %136) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %148 = "neura.data_mov"(%147) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%148, %134) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%137, %130) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %149:3 = "neura.fused_op"(%76, %104, %86) <{frequency = 12 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.mul"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %150 = "neura.data_mov"(%149#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %151 = "neura.data_mov"(%149#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %152 = "neura.data_mov"(%149#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %153:3 = "neura.fused_op"(%56, %103, %85, %66, %152) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:gep->load->mul->fused_op:mul->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.mul"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %233 = "neura.mul"(%231, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %234 = "neura.sub"(%233, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %232, %234 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %154 = "neura.data_mov"(%153#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %155 = "neura.data_mov"(%153#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %156 = "neura.data_mov"(%153#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %157 = "neura.data_mov"(%153#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %158:3 = "neura.fused_op"(%55, %124, %157) <{frequency = 8 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:gep->load->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.sub"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %159 = "neura.data_mov"(%158#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %160 = "neura.data_mov"(%158#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %161 = "neura.data_mov"(%158#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %162:2 = "neura.fused_op"(%75, %123) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %163 = "neura.data_mov"(%162#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %164 = "neura.data_mov"(%162#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %165 = "neura.data_mov"(%162#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %166:2 = "neura.fused_op"(%151, %65, %155, %165) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "mul->fused_op:add->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>):
      %230 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %231 = "neura.add"(%230, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %232 = "neura.add"(%arg8, %231) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%231, %232 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %167 = "neura.data_mov"(%166#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %168 = "neura.data_mov"(%166#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%161, %154) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %169 = "neura.add"(%160, %156) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%170, %159) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %171 = "neura.sub"(%164, %167) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %172 = "neura.data_mov"(%171) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%172, %150) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%168, %163) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %173:3 = "neura.fused_op"(%74, %120, %84) <{frequency = 12 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.mul"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %174 = "neura.data_mov"(%173#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %175 = "neura.data_mov"(%173#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %176 = "neura.data_mov"(%173#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %177:3 = "neura.fused_op"(%54, %119, %83, %64, %176) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:gep->load->mul->fused_op:mul->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.mul"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %233 = "neura.mul"(%231, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %234 = "neura.sub"(%233, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %232, %234 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %178 = "neura.data_mov"(%177#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %179 = "neura.data_mov"(%177#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %180 = "neura.data_mov"(%177#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %181 = "neura.data_mov"(%177#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %182:3 = "neura.fused_op"(%53, %116, %181) <{frequency = 8 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:gep->load->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.sub"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %183 = "neura.data_mov"(%182#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %184 = "neura.data_mov"(%182#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %185 = "neura.data_mov"(%182#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %186:2 = "neura.fused_op"(%73, %115) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %187 = "neura.data_mov"(%186#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %188 = "neura.data_mov"(%186#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %189 = "neura.data_mov"(%186#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %190:2 = "neura.fused_op"(%175, %63, %179, %189) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "mul->fused_op:add->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>):
      %230 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %231 = "neura.add"(%230, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %232 = "neura.add"(%arg8, %231) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%231, %232 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %191 = "neura.data_mov"(%190#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %192 = "neura.data_mov"(%190#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%185, %178) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %193 = "neura.add"(%184, %180) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %194 = "neura.data_mov"(%193) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%194, %183) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %195 = "neura.sub"(%188, %191) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %196 = "neura.data_mov"(%195) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%196, %174) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%192, %187) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %197:3 = "neura.fused_op"(%72, %112, %82) <{frequency = 12 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.mul"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %198 = "neura.data_mov"(%197#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %199 = "neura.data_mov"(%197#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %200 = "neura.data_mov"(%197#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %201:3 = "neura.fused_op"(%52, %111, %81, %62, %200) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:gep->load->mul->fused_op:mul->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.mul"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %233 = "neura.mul"(%231, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %234 = "neura.sub"(%233, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %232, %234 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %202 = "neura.data_mov"(%201#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %203 = "neura.data_mov"(%201#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %204 = "neura.data_mov"(%201#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %205 = "neura.data_mov"(%201#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %206:3 = "neura.fused_op"(%51, %108, %205) <{frequency = 8 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:gep->load->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %232 = "neura.sub"(%231, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %207 = "neura.data_mov"(%206#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %208 = "neura.data_mov"(%206#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %209 = "neura.data_mov"(%206#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %210:2 = "neura.fused_op"(%71, %107) <{frequency = 16 : i64, pattern_id = 2 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %230 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %231 = "neura.load"(%230) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%230, %231 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %211 = "neura.data_mov"(%210#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %212 = "neura.data_mov"(%210#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %213 = "neura.data_mov"(%210#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %214:2 = "neura.fused_op"(%199, %61, %203, %213) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "mul->fused_op:add->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>):
      %230 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %231 = "neura.add"(%230, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %232 = "neura.add"(%arg8, %231) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%231, %232 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %215 = "neura.data_mov"(%214#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %216 = "neura.data_mov"(%214#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%209, %202) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %217 = "neura.add"(%208, %204) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %218 = "neura.data_mov"(%217) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%218, %207) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %219 = "neura.sub"(%212, %215) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %220 = "neura.data_mov"(%219) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%220, %198) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%216, %211) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %221 = "neura.not"(%32) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %44 -> %21 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %46 -> %20 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %49 -> %19 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %59 -> %18 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %69 -> %17 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %79 -> %16 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %89 -> %15 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %92 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %122 -> %13 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %118 -> %12 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %114 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %110 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %106 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %222 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %223 = neura.grant_predicate %222, %31 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %223 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %224 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %225 = neura.grant_predicate %224, %30 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %225 -> %3 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %226 = "neura.data_mov"(%221) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %227 = "neura.data_mov"(%221) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %228 = neura.grant_predicate %226, %227 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %229 = "neura.data_mov"(%228) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %229 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

