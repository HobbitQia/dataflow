#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1A(dense<0> : tensor<262144xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<262144 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1x(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<512 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.constant(11 : i16) {latency = 1 : i32} : i16
    %2 = llvm.mlir.addressof @_ZZ4mainE1x {latency = 1 : i32} : !llvm.ptr
    %3 = llvm.mlir.constant(9 : i64) {latency = 1 : i32} : i64
    %4 = llvm.mlir.constant(13 : i32) {latency = 1 : i32} : i32
    %5 = llvm.mlir.addressof @_ZZ4mainE1A {latency = 1 : i32} : !llvm.ptr
    %6 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %7 = llvm.mlir.constant(512 : i64) {latency = 1 : i32} : i64
    %8 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%9: i64):  // 2 preds: ^bb0, ^bb3
    %10 = llvm.trunc %9 {latency = 1 : i32} : i64 to i16
    %11 = llvm.urem %10, %1 {latency = 1 : i32} : i16
    %12 = llvm.zext %11 {latency = 1 : i32} : i16 to i32
    %13 = llvm.getelementptr inbounds %2[0, %9] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    llvm.store %12, %13 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %14 = llvm.shl %9, %3 overflow<nsw> {latency = 1 : i32} : i64
    llvm.br ^bb2(%0 : i64) {latency = 1 : i32}
  ^bb2(%15: i64):  // 2 preds: ^bb1, ^bb2
    %16 = llvm.add %15, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %17 = llvm.trunc %16 {latency = 1 : i32} : i64 to i32
    %18 = llvm.urem %17, %4 {latency = 1 : i32} : i32
    %19 = llvm.add %15, %14 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %20 = llvm.getelementptr inbounds %5[0, %19] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<262144 x i32>
    llvm.store %18, %20 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.add %15, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %22 = llvm.icmp "eq" %21, %7 {latency = 1 : i32} : i64
    llvm.cond_br %22, ^bb3, ^bb2(%21 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %23 = llvm.add %9, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %24 = llvm.icmp "eq" %23, %7 {latency = 1 : i32} : i64
    llvm.cond_br %24, ^bb4, ^bb1(%23 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return {latency = 1 : i32} %8 : i32
  }
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.writeonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %1 = "neura.grant_once"() <{constant_value = 512 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %8 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<i32, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = "neura.fused_op"(%11) <{frequency = 3 : i64, pattern_id = 9 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %153 = "neura.grant_once"() <{constant_value = 9 : i64}> : () -> !neura.data<i64, i1>
      %154 = neura.phi_start %153, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%154 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = "neura.data_mov"(%12) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = "neura.data_mov"(%12) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16:3 = "neura.fused_op"(%10, %15, %14) <{frequency = 2 : i64, pattern_id = 11 : i64, pattern_name = "fused_op:grant_once->phi_start->fused_op:phi_start->shl"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %153 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %154 = neura.phi_start %153, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %155 = neura.phi_start %153, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %156 = "neura.shl"(%155, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%154, %155, %156 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %17 = "neura.data_mov"(%16#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18 = "neura.data_mov"(%16#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = "neura.data_mov"(%16#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20 = "neura.data_mov"(%16#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i32, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = neura.phi_start %13, %23 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = neura.reserve : !neura.data<i64, i1>
    %28 = neura.phi_start %19, %27 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = "neura.fused_op"(%5, %30) <{frequency = 3 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %153 = "neura.grant_once"() <{constant_value = 508 : i64}> : () -> !neura.data<i64, i1>
      %154 = neura.phi_start %153, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %155 = neura.phi_start %154, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%155 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = "neura.data_mov"(%31) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = "neura.data_mov"(%31) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %34 = "neura.data_mov"(%31) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %35 = neura.reserve : !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %37 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<i32, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = neura.phi_start %18, %40 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %42 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = "neura.data_mov"(%0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = "neura.data_mov"(%1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45:8 = "neura.fused_op"(%42, %34, %17, %22, %43, %3, %26, %44, %2, %25) <{frequency = 4 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->not->fused_op:phi_start->grant_predicate->fused_op:fused_op:fused_op:phi_start->phi_start->grant_predicate->grant_predicate->fused_op:fused_op:fused_op:phi_start->phi_start->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i64, i1>, %arg10: !neura.data<i64, i1>, %arg11: !neura.data<i64, i1>, %arg12: !neura.data<i64, i1>):
      %153 = "neura.icmp"(%arg3, %arg4) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %154 = "neura.not"(%153) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %155 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %156 = neura.grant_predicate %155, %153 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %157 = neura.phi_start %arg7, %arg8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %158 = neura.phi_start %157, %arg9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %159 = neura.grant_predicate %158, %153 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %160 = neura.grant_predicate %158, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %161 = neura.phi_start %arg10, %arg11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %162 = neura.phi_start %161, %arg12 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %163 = neura.grant_predicate %162, %153 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %164 = neura.grant_predicate %162, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%153, %154, %155, %156, %159, %160, %163, %164 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %46 = "neura.data_mov"(%45#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %47 = "neura.data_mov"(%45#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %48 = "neura.data_mov"(%45#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %49 = "neura.data_mov"(%45#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %50 = "neura.data_mov"(%45#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %51 = "neura.data_mov"(%45#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %52 = "neura.data_mov"(%45#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %53 = "neura.data_mov"(%45#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %54 = "neura.data_mov"(%45#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %55 = "neura.data_mov"(%45#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %56 = "neura.data_mov"(%45#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %57 = "neura.data_mov"(%45#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %58 = "neura.data_mov"(%45#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %59 = "neura.data_mov"(%45#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %60 = "neura.data_mov"(%45#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %61 = "neura.data_mov"(%45#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %62 = "neura.data_mov"(%45#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %63 = "neura.data_mov"(%45#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %64 = "neura.data_mov"(%45#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %65 = "neura.data_mov"(%45#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.data_mov"(%45#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = "neura.data_mov"(%45#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = "neura.data_mov"(%45#5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.data_mov"(%45#5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.data_mov"(%45#6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71 = "neura.data_mov"(%45#7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %72 = "neura.data_mov"(%45#7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %73:2 = "neura.fused_op"(%4, %29, %56, %64) <{frequency = 2 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->fused_op:fused_op:fused_op:phi_start->phi_start->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>, %arg6: !neura.data<i1, i1>):
      %153 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %154 = neura.phi_start %153, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %155 = neura.phi_start %154, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %156 = neura.grant_predicate %155, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %157 = neura.grant_predicate %155, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%156, %157 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %74 = "neura.data_mov"(%73#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %75 = "neura.data_mov"(%73#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %76 = "neura.data_mov"(%73#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %77:3 = "neura.fused_op"(%9, %21, %55) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i1, i1>):
      %153 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %154 = neura.phi_start %153, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %155 = neura.phi_start %154, %arg4 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %156 = neura.grant_predicate %155, %arg5 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%154, %155, %156 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %78 = "neura.data_mov"(%77#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %79 = "neura.data_mov"(%77#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %80 = "neura.data_mov"(%77#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %81:2 = "neura.fused_op"(%7, %36, %54) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %153 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %154 = neura.phi_start %153, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %155 = neura.phi_start %154, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %156 = neura.grant_predicate %155, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%155, %156 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %82 = "neura.data_mov"(%81#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.data_mov"(%81#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.data_mov"(%81#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85:2 = "neura.fused_op"(%8, %37, %53) <{frequency = 5 : i64, pattern_id = 10 : i64, pattern_name = "grant_once->fused_op:fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %153 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %154 = neura.phi_start %153, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %155 = neura.phi_start %154, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %156 = neura.grant_predicate %155, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%155, %156 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %86 = "neura.data_mov"(%85#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = "neura.data_mov"(%85#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = "neura.data_mov"(%85#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %89:2 = "neura.fused_op"(%6, %35, %52) <{frequency = 5 : i64, pattern_id = 10 : i64, pattern_name = "grant_once->fused_op:fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %153 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
      %154 = neura.phi_start %153, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %155 = neura.phi_start %154, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %156 = neura.grant_predicate %155, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%155, %156 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %90 = "neura.data_mov"(%89#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %91 = "neura.data_mov"(%89#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %92 = "neura.data_mov"(%89#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %93 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %94 = "neura.fused_op"(%93, %91, %51) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "add->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %153 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %154 = neura.grant_predicate %153, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%154 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %95 = "neura.data_mov"(%94) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96:2 = "neura.fused_op"(%20, %38, %50) <{frequency = 23 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %153 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %154 = neura.grant_predicate %153, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%153, %154 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %97 = "neura.data_mov"(%96#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.data_mov"(%96#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %99 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100 = "neura.add"(%99, %97) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %101 = "neura.data_mov"(%100) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = "neura.fused_op"(%87, %101) <{frequency = 2 : i64, pattern_id = 1 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %153 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %154 = "neura.load"(%153) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
      neura.yield results(%154 : !neura.data<vector<4xi32>, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<vector<4xi32>, i1>
    %103 = "neura.data_mov"(%102) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %104 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %105 = "neura.fused_op"(%83, %104, %103) <{frequency = 2 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:gep->load->vmul"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<vector<4xi32>, i1>):
      %153 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %154 = "neura.load"(%153) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
      %155 = "neura.vmul"(%154, %arg5) : (!neura.data<vector<4xi32>, i1>, !neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
      neura.yield results(%155 : !neura.data<vector<4xi32>, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %106 = "neura.data_mov"(%105) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %107 = "neura.vector.reduce.add"(%106) {latency = 1 : i32} : (!neura.data<vector<4xi32>, i1>) -> !neura.data<i32, i1>
    %108 = "neura.data_mov"(%107) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %109:2 = "neura.fused_op"(%78, %39, %108, %49) <{frequency = 2 : i64, pattern_id = 10 : i64, pattern_name = "phi_start->fused_op:add->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>):
      %153 = neura.phi_start %arg3, %arg4 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %154 = "neura.add"(%arg5, %153) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %155 = neura.grant_predicate %154, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%154, %155 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %110 = "neura.data_mov"(%109#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %111 = "neura.data_mov"(%109#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    neura.ctrl_mov %95 -> %40 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %111 -> %39 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %98 -> %38 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %88 -> %37 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %84 -> %36 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %92 -> %35 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %112 = neura.grant_predicate %33, %48 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %112 -> %30 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %74 -> %29 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %113 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %114 = neura.grant_predicate %113, %47 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %114 -> %27 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %67 -> %26 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %70 -> %25 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %115 = "neura.data_mov"(%24) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %116 = neura.grant_predicate %115, %46 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %116 -> %23 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %66 -> %22 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %80 -> %21 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %117 = neura.grant_predicate %110, %63 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %118 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %119:2 = "neura.fused_op"(%118, %62, %69) <{frequency = 2 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i64, i1>):
      %153 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %154 = "neura.add"(%153, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%153, %154 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %120 = "neura.data_mov"(%119#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %121 = "neura.data_mov"(%119#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %122 = "neura.data_mov"(%24) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %123:6 = "neura.fused_op"(%121, %72, %32, %61, %65, %122) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:fused_op:icmp->not->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %153 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %154 = "neura.not"(%153) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %155 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %156 = neura.grant_predicate %155, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %157 = neura.grant_predicate %arg7, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %158 = neura.grant_predicate %157, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %159 = neura.grant_predicate %arg8, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %160 = neura.grant_predicate %159, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %161 = neura.grant_predicate %arg3, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%153, %154, %156, %158, %160, %161 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %124 = "neura.data_mov"(%123#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %125 = "neura.data_mov"(%123#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %126 = "neura.data_mov"(%123#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %127 = "neura.data_mov"(%123#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %128 = "neura.data_mov"(%123#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %129 = "neura.data_mov"(%123#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %130 = "neura.data_mov"(%123#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %131 = "neura.data_mov"(%123#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %132 = "neura.data_mov"(%123#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %133 = "neura.data_mov"(%123#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134 = "neura.data_mov"(%123#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %135 = "neura.data_mov"(%123#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %136 = "neura.data_mov"(%123#5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %137 = "neura.gep"(%76, %120) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %138 = "neura.data_mov"(%117) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %139 = "neura.data_mov"(%137) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%138, %139) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %140 = "neura.fused_op"(%90, %60, %132) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %153 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %154 = neura.grant_predicate %153, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%154 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %141 = "neura.data_mov"(%140) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %142 = "neura.fused_op"(%82, %59, %131) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %153 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %154 = neura.grant_predicate %153, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%154 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %143 = "neura.data_mov"(%142) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %144 = "neura.fused_op"(%86, %58, %130) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %153 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %154 = neura.grant_predicate %153, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%154 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %145 = "neura.data_mov"(%144) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %146 = "neura.fused_op"(%79, %57, %129) <{frequency = 10 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %153 = neura.grant_predicate %arg3, %arg4 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %154 = neura.grant_predicate %153, %arg5 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%154 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i32, i1>
    %147 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    neura.ctrl_mov %136 -> %15 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %135 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %134 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %147 -> %9 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %145 -> %8 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %143 -> %7 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %141 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %133 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %148 = neura.grant_predicate %75, %128 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %148 -> %4 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %149 = neura.grant_predicate %68, %127 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %149 -> %3 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %150 = neura.grant_predicate %71, %126 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %150 -> %2 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %151 = neura.grant_predicate %125, %124 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %152 = "neura.data_mov"(%151) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %152 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

