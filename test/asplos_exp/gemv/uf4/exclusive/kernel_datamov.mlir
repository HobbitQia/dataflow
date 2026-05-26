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
    %1 = neura.reserve : !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %4 = neura.reserve : !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %7 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %8 = neura.reserve : !neura.data<i32, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10:2 = "neura.fused_op"(%9) <{frequency = 3 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %181 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %182 = neura.phi_start %181, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%181, %182 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %11 = "neura.data_mov"(%10#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %12 = "neura.data_mov"(%10#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = "neura.data_mov"(%10#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = "neura.fused_op"(%14) <{frequency = 3 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %181 = "neura.grant_once"() <{constant_value = 9 : i64}> : () -> !neura.data<i64, i1>
      %182 = neura.phi_start %181, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%182 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = "neura.data_mov"(%15) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = "neura.data_mov"(%15) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.phi_start %11, %18 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = "neura.data_mov"(%19) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21 = "neura.shl"(%20, %17) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = neura.reserve : !neura.data<i32, i1>
    %23:2 = "neura.fused_op"(%8, %22) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>):
      %181 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %182 = neura.phi_start %181, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %183 = neura.phi_start %182, %arg4 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%182, %183 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %24 = "neura.data_mov"(%23#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %25 = "neura.data_mov"(%23#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %26 = "neura.data_mov"(%23#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %27 = neura.reserve : !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<i64, i1>
    %29 = neura.phi_start %16, %28 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = "neura.data_mov"(%19) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %34 = neura.phi_start %33, %32 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %35 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = "neura.fused_op"(%4, %36) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %181 = "neura.grant_once"() <{constant_value = 508 : i64}> : () -> !neura.data<i64, i1>
      %182 = neura.phi_start %181, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %183 = neura.phi_start %182, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%183 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %38 = "neura.data_mov"(%37) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = "neura.data_mov"(%37) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %40 = "neura.data_mov"(%37) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %43 = "neura.fused_op"(%6, %42) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %181 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %182 = neura.phi_start %181, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %183 = neura.phi_start %182, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%183 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = "neura.data_mov"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.data_mov"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.data_mov"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %47 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %48 = "neura.fused_op"(%7, %47) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %181 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %182 = neura.phi_start %181, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %183 = neura.phi_start %182, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%183 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %49 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %50 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %51 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %52 = neura.reserve : !neura.data<i64, i1>
    %53 = "neura.data_mov"(%21) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = neura.phi_start %53, %52 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %55 = neura.reserve : !neura.data<i32, i1>
    %56 = neura.phi_start %24, %55 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %57 = neura.reserve : !neura.data<i64, i1>
    %58 = neura.phi_start %13, %57 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %59 = "neura.data_mov"(%58) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.data_mov"(%0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = "neura.data_mov"(%54) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62:4 = "neura.fused_op"(%59, %40, %60, %2, %31, %61) <{frequency = 8 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:icmp->fused_op:fused_op:phi_start->phi_start->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %181 = "neura.icmp"(%arg3, %arg4) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %182 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %183 = neura.phi_start %182, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %184 = neura.grant_predicate %183, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %185 = neura.grant_predicate %arg8, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%181, %183, %184, %185 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %63 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %64 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %65 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %66 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %67 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %68 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %69 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %70 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %71 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %72 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %73 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %74 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %75 = "neura.data_mov"(%62#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %76 = "neura.data_mov"(%62#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %77 = "neura.data_mov"(%62#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = "neura.data_mov"(%62#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %79:2 = "neura.fused_op"(%5, %41, %75) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %181 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
      %182 = neura.phi_start %181, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %183 = neura.phi_start %182, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %184 = neura.grant_predicate %183, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%183, %184 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %80 = "neura.data_mov"(%79#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81 = "neura.data_mov"(%79#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.data_mov"(%79#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83:2 = "neura.fused_op"(%3, %35, %74) <{frequency = 3 : i64, pattern_id = 3 : i64, pattern_name = "grant_once->fused_op:fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %181 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %182 = neura.phi_start %181, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %183 = neura.phi_start %182, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %184 = neura.grant_predicate %183, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%183, %184 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %84 = "neura.data_mov"(%83#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85 = "neura.data_mov"(%83#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %86:2 = "neura.fused_op"(%1, %30, %73) <{frequency = 3 : i64, pattern_id = 3 : i64, pattern_name = "grant_once->fused_op:fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %181 = "neura.grant_once"() <{constant_value = 512 : i64}> : () -> !neura.data<i64, i1>
      %182 = neura.phi_start %181, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %183 = neura.phi_start %182, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %184 = neura.grant_predicate %183, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%183, %184 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %87 = "neura.data_mov"(%86#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %88 = "neura.data_mov"(%86#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %89 = "neura.data_mov"(%34) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %90:4 = "neura.fused_op"(%72, %89, %76, %87) <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %181 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %182 = neura.grant_predicate %arg4, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %183 = neura.grant_predicate %arg5, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %184 = neura.grant_predicate %arg6, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%181, %182, %183, %184 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %91 = "neura.data_mov"(%90#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %92 = "neura.data_mov"(%90#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %93 = "neura.data_mov"(%90#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %94 = "neura.data_mov"(%90#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %95 = "neura.data_mov"(%90#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %96 = "neura.data_mov"(%90#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %97 = "neura.data_mov"(%90#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %98 = "neura.data_mov"(%90#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %99 = "neura.data_mov"(%90#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %100 = "neura.data_mov"(%90#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %101 = "neura.data_mov"(%90#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = "neura.data_mov"(%90#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %103 = "neura.data_mov"(%90#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %104 = "neura.data_mov"(%90#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %105 = "neura.data_mov"(%90#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %106 = "neura.data_mov"(%58) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %107 = "neura.data_mov"(%54) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %108 = "neura.add"(%106, %107) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %109 = "neura.data_mov"(%108) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %110 = "neura.gep"(%51, %109) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %111 = "neura.data_mov"(%58) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %112 = "neura.gep"(%46, %111) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %113 = "neura.data_mov"(%110) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %114 = "neura.load"(%113) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
    %115 = "neura.data_mov"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %116 = "neura.load"(%115) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
    %117 = "neura.data_mov"(%116) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %118 = "neura.data_mov"(%114) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %119 = "neura.vmul"(%117, %118) {latency = 1 : i32} : (!neura.data<vector<4xi32>, i1>, !neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %120 = "neura.data_mov"(%119) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %121 = "neura.vector.reduce.add"(%120) {latency = 1 : i32} : (!neura.data<vector<4xi32>, i1>) -> !neura.data<i32, i1>
    %122 = "neura.data_mov"(%121) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %123 = "neura.data_mov"(%56) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %124:2 = "neura.fused_op"(%122, %123, %71) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "add->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i1, i1>):
      %181 = "neura.add"(%arg3, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %182 = neura.grant_predicate %181, %arg5 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%181, %182 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %125 = "neura.data_mov"(%124#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %126 = "neura.data_mov"(%124#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %127 = "neura.data_mov"(%58) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %128 = "neura.fused_op"(%127, %81, %70) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "add->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %181 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %182 = neura.grant_predicate %181, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%182 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %129 = "neura.data_mov"(%128) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %130:2 = "neura.fused_op"(%12, %27, %69) <{frequency = 23 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %181 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %182 = neura.grant_predicate %181, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%181, %182 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %131 = "neura.data_mov"(%130#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %132 = "neura.data_mov"(%130#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %129 -> %57 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %126 -> %55 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %78 -> %52 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %133 = neura.grant_predicate %50, %68 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %133 -> %47 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %134 = neura.grant_predicate %45, %67 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %134 -> %42 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %82 -> %41 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %135 = neura.grant_predicate %39, %66 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %135 -> %36 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %85 -> %35 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %136 = "neura.data_mov"(%34) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %137 = neura.grant_predicate %136, %65 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %137 -> %32 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %77 -> %31 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %88 -> %30 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %138 = "neura.data_mov"(%29) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %139 = neura.grant_predicate %138, %64 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %139 -> %28 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %132 -> %27 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %140 = neura.grant_predicate %26, %63 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %140 -> %22 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %141 = neura.grant_predicate %84, %99 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %142 = neura.grant_predicate %125, %98 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %143 = neura.grant_predicate %131, %97 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %144 = "neura.data_mov"(%141) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %145 = "neura.gep"(%144, %101) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %146 = "neura.data_mov"(%142) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %147 = "neura.data_mov"(%145) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%146, %147) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %148 = "neura.add"(%100, %103) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %149 = "neura.data_mov"(%148) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %150:2 = "neura.fused_op"(%149, %105) <{frequency = 16 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %181 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %182 = neura.grant_predicate %181, %181 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%181, %182 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %151 = "neura.data_mov"(%150#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %152 = "neura.data_mov"(%150#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %153 = "neura.data_mov"(%143) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %154 = "neura.data_mov"(%148) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %155 = "neura.data_mov"(%141) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %156:5 = "neura.fused_op"(%151, %153, %154, %80, %96, %155) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:not->grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %181 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %182 = neura.grant_predicate %arg4, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %183 = neura.grant_predicate %arg5, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %184 = neura.grant_predicate %arg6, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %185 = neura.grant_predicate %184, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %186 = neura.grant_predicate %arg8, %181 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%181, %182, %183, %185, %186 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %157 = "neura.data_mov"(%156#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %158 = "neura.data_mov"(%156#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %159 = "neura.data_mov"(%156#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %160 = "neura.data_mov"(%156#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %161 = "neura.data_mov"(%156#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %162 = "neura.data_mov"(%156#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %163 = "neura.data_mov"(%156#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %164 = "neura.data_mov"(%156#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %165 = "neura.data_mov"(%156#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %166 = "neura.data_mov"(%156#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %167 = "neura.data_mov"(%156#4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %168 = "neura.fused_op"(%38, %95, %163) <{frequency = 10 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %181 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %182 = neura.grant_predicate %181, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%182 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %169 = "neura.data_mov"(%168) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %170 = "neura.fused_op"(%44, %94, %162) <{frequency = 10 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %181 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %182 = neura.grant_predicate %181, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%182 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %171 = "neura.data_mov"(%170) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %172 = "neura.fused_op"(%49, %93, %161) <{frequency = 10 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %181 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %182 = neura.grant_predicate %181, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%182 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %173 = "neura.data_mov"(%172) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %174 = "neura.fused_op"(%25, %92, %160) <{frequency = 10 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %181 = neura.grant_predicate %arg3, %arg4 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %182 = neura.grant_predicate %181, %arg5 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%182 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i32, i1>
    %175 = "neura.data_mov"(%174) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %176 = "neura.data_mov"(%29) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %177 = "neura.fused_op"(%176, %91, %159) <{frequency = 10 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %181 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %182 = neura.grant_predicate %181, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%182 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %178 = "neura.data_mov"(%177) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %165 -> %18 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %178 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %164 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %175 -> %8 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %173 -> %7 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %171 -> %6 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %166 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %169 -> %4 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %167 -> %3 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %179 = neura.grant_predicate %102, %158 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %179 -> %2 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %180 = neura.grant_predicate %104, %157 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %180 -> %1 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %152 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

