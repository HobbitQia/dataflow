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
    %24:2 = "neura.fused_op"(%22, %21, %23) <{frequency = 11 : i64, pattern_id = 11 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %179 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %180 = "neura.add"(%179, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%179, %180 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %25 = "neura.data_mov"(%24#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.data_mov"(%24#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.data_mov"(%24#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29:4 = "neura.fused_op"(%26, %28, %27, %19) <{frequency = 4 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:icmp->grant_predicate->fused_op:grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %179 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %180 = neura.grant_predicate %arg7, %179 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %181 = "neura.grant_once"() <{constant_value = 128 : i64}> : () -> !neura.data<i64, i1>
      %182 = neura.phi_start %181, %arg8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %183 = neura.grant_predicate %182, %179 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%179, %180, %182, %183 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
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
    %43 = "neura.data_mov"(%29#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = "neura.data_mov"(%29#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.data_mov"(%29#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %46:2 = "neura.fused_op"(%17, %42) <{frequency = 12 : i64, pattern_id = 16 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>):
      %179 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<i32, i1>
      %180 = neura.phi_start %179, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %181 = neura.grant_predicate %180, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%180, %181 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %47 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %50 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %51 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %52 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %53 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %54 = "neura.data_mov"(%46#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %55 = "neura.data_mov"(%46#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %56:2 = "neura.fused_op"(%15, %41) <{frequency = 12 : i64, pattern_id = 16 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>):
      %179 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<i32, i1>
      %180 = neura.phi_start %179, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %181 = neura.grant_predicate %180, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%180, %181 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %57 = "neura.data_mov"(%56#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %58 = "neura.data_mov"(%56#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %59 = "neura.data_mov"(%56#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %60 = "neura.data_mov"(%56#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %61 = "neura.data_mov"(%56#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %62 = "neura.data_mov"(%56#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %63 = "neura.data_mov"(%56#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %64:2 = "neura.fused_op"(%14, %40) <{frequency = 12 : i64, pattern_id = 16 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %179 = "neura.grant_once"() <{constant_value = 129 : i64}> : () -> !neura.data<i64, i1>
      %180 = neura.phi_start %179, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %181 = neura.grant_predicate %180, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%180, %181 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %65 = "neura.data_mov"(%64#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.data_mov"(%64#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67:6 = "neura.fused_op"(%20, %39, %25, %44, %65, %9) <{frequency = 5 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->fused_op:fused_op:add->add->add->fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i64, i1>, %arg10: !neura.data<i64, i1>):
      %179 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<i64, i1>
      %180 = neura.phi_start %179, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %181 = neura.grant_predicate %180, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %182 = "neura.add"(%arg7, %180) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %183 = "neura.add"(%182, %arg8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %184 = "neura.add"(%182, %arg9) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %185 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
      %186 = neura.phi_start %185, %arg10 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %187 = neura.grant_predicate %186, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %188 = "neura.add"(%182, %186) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%181, %182, %183, %184, %187, %188 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %68 = "neura.data_mov"(%67#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.data_mov"(%67#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.data_mov"(%67#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71 = "neura.data_mov"(%67#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %72 = "neura.data_mov"(%67#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %73 = "neura.data_mov"(%67#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %74 = "neura.data_mov"(%67#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %75 = "neura.data_mov"(%67#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %76 = "neura.data_mov"(%67#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %77 = "neura.data_mov"(%67#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = "neura.data_mov"(%67#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %79 = "neura.data_mov"(%67#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80 = "neura.data_mov"(%67#5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81 = "neura.data_mov"(%67#5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82:8 = "neura.fused_op"(%18, %38, %76, %62, %78) <{frequency = 6 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->fused_op:fused_op:gep->load->mul->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i64, i1>):
      %179 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %180 = neura.phi_start %179, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %181 = neura.grant_predicate %180, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %182 = "neura.gep"(%180, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %183 = "neura.load"(%182) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %184 = "neura.mul"(%183, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %185 = "neura.gep"(%180, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %186 = "neura.load"(%185) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %187 = "neura.mul"(%186, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%180, %181, %182, %183, %184, %185, %186, %187 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %83 = "neura.data_mov"(%82#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.data_mov"(%82#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85 = "neura.data_mov"(%82#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %86 = "neura.data_mov"(%82#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = "neura.data_mov"(%82#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = "neura.data_mov"(%82#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %89 = "neura.data_mov"(%82#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %90 = "neura.data_mov"(%82#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %91 = "neura.data_mov"(%82#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %92 = "neura.data_mov"(%82#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %93 = "neura.data_mov"(%82#5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %94 = "neura.data_mov"(%82#6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %95 = "neura.data_mov"(%82#7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %96:8 = "neura.fused_op"(%16, %37, %75, %61, %77) <{frequency = 6 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->fused_op:fused_op:gep->load->mul->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i64, i1>):
      %179 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %180 = neura.phi_start %179, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %181 = neura.grant_predicate %180, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %182 = "neura.gep"(%180, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %183 = "neura.load"(%182) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %184 = "neura.mul"(%183, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %185 = "neura.gep"(%180, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %186 = "neura.load"(%185) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %187 = "neura.mul"(%186, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%180, %181, %182, %183, %184, %185, %186, %187 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %97 = "neura.data_mov"(%96#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %98 = "neura.data_mov"(%96#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %99 = "neura.data_mov"(%96#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %100 = "neura.data_mov"(%96#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %101 = "neura.data_mov"(%96#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %102 = "neura.data_mov"(%96#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.data_mov"(%96#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %104 = "neura.data_mov"(%96#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %105 = "neura.data_mov"(%96#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %106 = "neura.data_mov"(%96#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %107 = "neura.data_mov"(%96#5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %108 = "neura.data_mov"(%96#6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %109 = "neura.data_mov"(%96#7) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %110:5 = "neura.fused_op"(%10, %36, %74, %102, %60) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->add->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i32, i1>):
      %179 = "neura.grant_once"() <{constant_value = 131 : i64}> : () -> !neura.data<i64, i1>
      %180 = neura.phi_start %179, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %181 = neura.grant_predicate %180, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %182 = "neura.add"(%arg7, %180) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %183 = "neura.gep"(%arg8, %182) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %184 = "neura.load"(%183) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %185 = "neura.mul"(%184, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%181, %182, %183, %184, %185 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %111 = "neura.data_mov"(%110#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %112 = "neura.data_mov"(%110#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %113 = "neura.data_mov"(%110#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %114 = "neura.data_mov"(%110#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %115 = "neura.data_mov"(%110#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %116:5 = "neura.fused_op"(%12, %35, %73, %101, %59) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->add->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i32, i1>):
      %179 = "neura.grant_once"() <{constant_value = 130 : i64}> : () -> !neura.data<i64, i1>
      %180 = neura.phi_start %179, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %181 = neura.grant_predicate %180, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %182 = "neura.add"(%arg7, %180) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %183 = "neura.gep"(%arg8, %182) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %184 = "neura.load"(%183) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %185 = "neura.mul"(%184, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%181, %182, %183, %184, %185 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %117 = "neura.data_mov"(%116#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %118 = "neura.data_mov"(%116#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %119 = "neura.data_mov"(%116#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %120 = "neura.data_mov"(%116#3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %121 = "neura.data_mov"(%116#4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %122:3 = "neura.fused_op"(%100, %72, %105, %54, %92) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:gep->load->fused_op:fused_op:mul->fused_op:add->add->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %179 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %180 = "neura.load"(%179) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %181 = "neura.mul"(%arg7, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %182 = "neura.add"(%181, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %183 = "neura.add"(%180, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %184 = "neura.sub"(%180, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%179, %183, %184 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %123 = "neura.data_mov"(%122#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %124 = "neura.data_mov"(%122#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %125 = "neura.data_mov"(%122#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %126:3 = "neura.fused_op"(%91, %53, %106, %88, %71) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:mul->sub->fused_op:fused_op:gep->load->sub->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %179 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %180 = "neura.sub"(%179, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %181 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %182 = "neura.load"(%181) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %183 = "neura.sub"(%182, %180) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %184 = "neura.add"(%182, %180) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%181, %183, %184 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %127 = "neura.data_mov"(%126#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %128 = "neura.data_mov"(%126#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %129 = "neura.data_mov"(%126#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %130:2 = "neura.fused_op"(%11, %34, %70) <{frequency = 5 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->grant_predicate->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %179 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %180 = neura.phi_start %179, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %181 = neura.grant_predicate %180, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %182 = "neura.add"(%arg7, %180) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%181, %182 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %131 = "neura.data_mov"(%130#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %132 = "neura.data_mov"(%130#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %133 = "neura.data_mov"(%130#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134:2 = "neura.fused_op"(%13, %33, %69) <{frequency = 5 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->grant_predicate->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %179 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %180 = neura.phi_start %179, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %181 = neura.grant_predicate %180, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %182 = "neura.add"(%arg7, %180) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%181, %182 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %135 = "neura.data_mov"(%134#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %136 = "neura.data_mov"(%134#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %137 = "neura.data_mov"(%134#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    "neura.store"(%128, %90) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%129, %127) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%125, %104) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%124, %123) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %138:3 = "neura.fused_op"(%99, %137, %108, %52, %95) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:gep->load->fused_op:fused_op:mul->fused_op:add->add->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %179 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %180 = "neura.load"(%179) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %181 = "neura.mul"(%arg7, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %182 = "neura.add"(%181, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %183 = "neura.add"(%180, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %184 = "neura.sub"(%180, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%179, %183, %184 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %139 = "neura.data_mov"(%138#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %140 = "neura.data_mov"(%138#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %141 = "neura.data_mov"(%138#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %142:3 = "neura.fused_op"(%94, %51, %109, %87, %136) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:mul->sub->fused_op:fused_op:gep->load->sub->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %179 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %180 = "neura.sub"(%179, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %181 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %182 = "neura.load"(%181) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %183 = "neura.sub"(%182, %180) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %184 = "neura.add"(%182, %180) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%181, %183, %184 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %143 = "neura.data_mov"(%142#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %144 = "neura.data_mov"(%142#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %145 = "neura.data_mov"(%142#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%144, %93) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%145, %143) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%141, %107) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%140, %139) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %146:3 = "neura.fused_op"(%86, %118, %58) <{frequency = 12 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %179 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %180 = "neura.load"(%179) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %181 = "neura.mul"(%180, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%179, %180, %181 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %147 = "neura.data_mov"(%146#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %148 = "neura.data_mov"(%146#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %149 = "neura.data_mov"(%146#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %150:3 = "neura.fused_op"(%98, %133, %120, %50, %149) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:gep->load->fused_op:fused_op:mul->fused_op:add->add->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %179 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %180 = "neura.load"(%179) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %181 = "neura.mul"(%arg7, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %182 = "neura.add"(%181, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %183 = "neura.add"(%180, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %184 = "neura.sub"(%180, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%179, %183, %184 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %151 = "neura.data_mov"(%150#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %152 = "neura.data_mov"(%150#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %153 = "neura.data_mov"(%150#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %154:3 = "neura.fused_op"(%148, %49, %121, %85, %132) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:mul->sub->fused_op:fused_op:gep->load->sub->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %179 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %180 = "neura.sub"(%179, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %181 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %182 = "neura.load"(%181) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %183 = "neura.sub"(%182, %180) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %184 = "neura.add"(%182, %180) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%181, %183, %184 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %155 = "neura.data_mov"(%154#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %156 = "neura.data_mov"(%154#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %157 = "neura.data_mov"(%154#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%156, %147) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%157, %155) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%153, %119) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%152, %151) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %158:3 = "neura.fused_op"(%84, %112, %57) <{frequency = 12 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %179 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %180 = "neura.load"(%179) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %181 = "neura.mul"(%180, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%179, %180, %181 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %159 = "neura.data_mov"(%158#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %160 = "neura.data_mov"(%158#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %161 = "neura.data_mov"(%158#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %162:3 = "neura.fused_op"(%97, %81, %114, %48, %161) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:gep->load->fused_op:fused_op:mul->fused_op:add->add->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %179 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %180 = "neura.load"(%179) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %181 = "neura.mul"(%arg7, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %182 = "neura.add"(%181, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %183 = "neura.add"(%180, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %184 = "neura.sub"(%180, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%179, %183, %184 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %163 = "neura.data_mov"(%162#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %164 = "neura.data_mov"(%162#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %165 = "neura.data_mov"(%162#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %166:3 = "neura.fused_op"(%160, %47, %115, %83, %80) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:mul->sub->fused_op:fused_op:gep->load->sub->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %179 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %180 = "neura.sub"(%179, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %181 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %182 = "neura.load"(%181) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %183 = "neura.sub"(%182, %180) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %184 = "neura.add"(%182, %180) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%181, %183, %184 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %167 = "neura.data_mov"(%166#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %168 = "neura.data_mov"(%166#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %169 = "neura.data_mov"(%166#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%168, %159) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%169, %167) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%165, %113) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%164, %163) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %170 = "neura.not"(%32) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %43 -> %21 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %68 -> %20 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %45 -> %19 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %89 -> %18 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %55 -> %17 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %103 -> %16 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %63 -> %15 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %66 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %135 -> %13 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %117 -> %12 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %131 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %111 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %79 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %171 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %172 = neura.grant_predicate %171, %31 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %172 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %173 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %174 = neura.grant_predicate %173, %30 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %174 -> %3 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %175 = "neura.data_mov"(%170) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %176 = "neura.data_mov"(%170) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %177 = neura.grant_predicate %175, %176 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %178 = "neura.data_mov"(%177) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %178 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

