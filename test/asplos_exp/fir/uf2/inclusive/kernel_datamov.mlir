#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external local_unnamed_addr @coefficients(dense<[0, 1, 3, -2, 0, 0, -3, 1, 0, 1, 3, -2, 0, 0, -3, 1, 0, 1, 3, -2, 0, 0, -3, 1, 0, 1, 3, -2, 0, 0, -3, 1]> : tensor<32xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<32 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5input(dense<0> : tensor<32xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<32 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.constant(5 : i8) {latency = 1 : i32} : i8
    %2 = llvm.mlir.addressof @_ZZ4mainE5input {latency = 1 : i32} : !llvm.ptr
    %3 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %4 = llvm.mlir.constant(32 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%6: i64):  // 2 preds: ^bb0, ^bb1
    %7 = llvm.trunc %6 {latency = 1 : i32} : i64 to i8
    %8 = llvm.urem %7, %1 {latency = 1 : i32} : i8
    %9 = llvm.zext %8 {latency = 1 : i32} : i8 to i32
    %10 = llvm.getelementptr inbounds %2[0, %6] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<32 x i32>
    llvm.store %9, %10 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %11 = llvm.add %6, %3 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %12 = llvm.icmp "eq" %11, %4 {latency = 1 : i32} : i64
    llvm.cond_br %12, ^bb2, ^bb1(%11 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return {latency = 1 : i32} %5 : i32
  }
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = 0 : i32}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
    %2 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 30 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.data_mov"(%1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %5 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%4, %5) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = "neura.data_mov"(%3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %8 = neura.phi_start %7, %6 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17:2 = "neura.fused_op"(%15, %14, %16) <{frequency = 2 : i64, pattern_id = 11 : i64, pattern_name = "phi_start->icmp"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %72 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %73 = "neura.icmp"(%72, %arg5) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      neura.yield results(%72, %73 : !neura.data<i64, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>)
    %18 = "neura.data_mov"(%17#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = "neura.data_mov"(%17#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20 = "neura.data_mov"(%17#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21 = "neura.data_mov"(%17#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = "neura.data_mov"(%17#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %23 = "neura.data_mov"(%17#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %24 = "neura.data_mov"(%17#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %25 = "neura.data_mov"(%17#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %26 = "neura.data_mov"(%17#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %27 = "neura.data_mov"(%17#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %28 = "neura.data_mov"(%17#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %29 = "neura.data_mov"(%17#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %30 = "neura.data_mov"(%17#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %31:2 = "neura.fused_op"(%13, %30) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>):
      %72 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %73 = neura.phi_start %72, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %74 = neura.grant_predicate %73, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%73, %74 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %32 = "neura.data_mov"(%31#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.data_mov"(%31#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.data_mov"(%31#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35:2 = "neura.fused_op"(%12, %29) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>):
      %72 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %73 = neura.phi_start %72, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %74 = neura.grant_predicate %73, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%73, %74 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %36 = "neura.data_mov"(%35#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = "neura.data_mov"(%35#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = "neura.data_mov"(%35#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %39:2 = "neura.fused_op"(%11, %28) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %72 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %73 = neura.phi_start %72, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %74 = neura.grant_predicate %73, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%73, %74 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %40 = "neura.data_mov"(%39#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41 = "neura.data_mov"(%39#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %42:2 = "neura.fused_op"(%10, %27) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>):
      %72 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %73 = neura.phi_start %72, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %74 = neura.grant_predicate %73, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%73, %74 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %43 = "neura.data_mov"(%42#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = "neura.data_mov"(%42#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45:2 = "neura.fused_op"(%9, %26) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %72 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %73 = neura.phi_start %72, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %74 = neura.grant_predicate %73, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%73, %74 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %46 = "neura.data_mov"(%45#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = "neura.data_mov"(%45#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %48 = "neura.fused_op"(%25) <{frequency = 2 : i64, pattern_id = 6 : i64, pattern_name = "not->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>):
      %72 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %73 = neura.grant_predicate %72, %72 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%73 : !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %49 = "neura.data_mov"(%48) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %50 = "neura.fused_op"(%33, %21) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %72 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %73 = "neura.load"(%72) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%73 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %52 = "neura.fused_op"(%37, %20, %51) <{frequency = 2 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i32, i1>):
      %72 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %73 = "neura.load"(%72) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %74 = "neura.mul"(%73, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%74 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %54 = neura.reserve : !neura.data<i32, i1>
    %55 = "neura.fused_op"(%54) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>):
      %72 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %73 = neura.phi_start %72, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%73 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %56 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %57 = "neura.or"(%19, %40) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = "neura.data_mov"(%57) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.fused_op"(%32, %58) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %72 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %73 = "neura.load"(%72) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%73 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %60 = "neura.data_mov"(%59) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %61 = "neura.data_mov"(%57) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62 = "neura.fused_op"(%36, %61, %60, %53) <{frequency = 2 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>):
      %72 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %73 = "neura.load"(%72) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %74 = "neura.mul"(%73, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %75 = "neura.add"(%74, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%75 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %64 = "neura.add"(%63, %56) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%65, %43) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %66 = "neura.fused_op"(%18, %46, %24) <{frequency = 2 : i64, pattern_id = 0 : i64, pattern_name = "add->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %72 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %73 = neura.grant_predicate %72, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%73 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %67 = "neura.data_mov"(%66) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %69 = neura.grant_predicate %68, %23 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %69 -> %54 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %67 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %34 -> %13 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %38 -> %12 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %41 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %44 -> %10 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %47 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %70 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71 = neura.grant_predicate %70, %22 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %71 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %49 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

