#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1C(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1B(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.addressof @_ZZ4mainE1C : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i8) : i8
    %2 = llvm.mlir.constant(16384 : i64) : i64
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(6 : i64) : i64
    %5 = llvm.mlir.addressof @_ZZ4mainE1A : !llvm.ptr
    %6 = llvm.mlir.addressof @_ZZ4mainE1B : !llvm.ptr
    %7 = llvm.mlir.constant(1 : i64) : i64
    %8 = llvm.mlir.constant(64 : i64) : i64
    %9 = llvm.mlir.poison : vector<4xi32>
    %10 = llvm.mlir.constant(4 : i64) : i64
    %11 = llvm.mlir.constant(60 : i64) : i64
    %12 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%3 : i64)
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb3
    %14 = llvm.shl %13, %4 overflow<nsw> : i64
    llvm.br ^bb2(%3 : i64)
  ^bb2(%15: i64):  // 2 preds: ^bb1, ^bb2
    %16 = llvm.add %15, %14 overflow<nsw, nuw> : i64
    %17 = llvm.add %15, %13 overflow<nsw, nuw> : i64
    %18 = llvm.getelementptr inbounds %5[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %19 = llvm.trunc %17 : i64 to i32
    llvm.store %19, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.sub %13, %15 overflow<nsw> : i64
    %21 = llvm.getelementptr inbounds %6[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %22 = llvm.trunc %20 : i64 to i32
    llvm.store %22, %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %15, %7 overflow<nsw, nuw> : i64
    %24 = llvm.icmp "eq" %23, %8 : i64
    llvm.cond_br %24, ^bb3, ^bb2(%23 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %25 = llvm.add %13, %7 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %8 : i64
    llvm.cond_br %26, ^bb4(%3 : i64), ^bb1(%25 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%27: i64):  // 2 preds: ^bb3, ^bb8
    %28 = llvm.shl %27, %4 overflow<nsw> : i64
    llvm.br ^bb5(%3 : i64)
  ^bb5(%29: i64):  // 2 preds: ^bb4, ^bb7
    %30 = llvm.add %29, %28 overflow<nsw, nuw> : i64
    %31 = llvm.getelementptr inbounds %5[0, %30] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %32 = llvm.shl %29, %4 overflow<nsw> : i64
    %33 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %34 = llvm.insertelement %33, %9[%3 : i64] : vector<4xi32>
    %35 = llvm.shufflevector %34, %9 [0, 0, 0, 0] : vector<4xi32> 
    llvm.br ^bb6(%3 : i64)
  ^bb6(%36: i64):  // 2 preds: ^bb5, ^bb6
    %37 = llvm.add %36, %32 overflow<nsw, nuw> : i64
    %38 = llvm.getelementptr inbounds %6[0, %37] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %39 = llvm.add %36, %28 overflow<nsw, nuw> : i64
    %40 = llvm.getelementptr inbounds %0[0, %39] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %41 = llvm.load %38 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> vector<4xi32>
    %42 = llvm.mul %41, %35 overflow<nsw> : vector<4xi32>
    %43 = llvm.load %40 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> vector<4xi32>
    %44 = llvm.add %43, %42 overflow<nsw> : vector<4xi32>
    llvm.store %44, %40 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : vector<4xi32>, !llvm.ptr
    %45 = llvm.add %36, %10 overflow<nsw, nuw> : i64
    %46 = llvm.icmp "ult" %36, %11 : i64
    llvm.cond_br %46, ^bb6(%45 : i64), ^bb7 {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %47 = llvm.add %29, %7 overflow<nsw, nuw> : i64
    %48 = llvm.icmp "eq" %47, %8 : i64
    llvm.cond_br %48, ^bb8, ^bb5(%47 : i64) {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    %49 = llvm.add %27, %7 overflow<nsw, nuw> : i64
    %50 = llvm.icmp "eq" %49, %8 : i64
    llvm.cond_br %50, ^bb9, ^bb4(%49 : i64) {loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return %12 : i32
  }
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = neura.reserve : !neura.data<i64, i1>
    %1 = neura.reserve : !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = neura.reserve : !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %7 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %8 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10:2 = "neura.fused_op"(%9) <{frequency = 3 : i64, pattern_id = 14 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %112 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %113 = neura.phi_start %112, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = "neura.fused_op"(%11) <{frequency = 3 : i64, pattern_id = 14 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %112 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %113 = neura.phi_start %112, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%113 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14:2 = "neura.fused_op"(%10#0, %13, %12) <{frequency = 4 : i64, pattern_id = 19 : i64, pattern_name = "phi_start->shl"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %112 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %113 = "neura.shl"(%112, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%112, %113 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = "neura.fused_op"(%1, %17) <{frequency = 9 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %112 = "neura.grant_once"() <{constant_value = 60 : i64}> : () -> !neura.data<i64, i1>
      %113 = neura.phi_start %112, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %114 = neura.phi_start %113, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%114 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = "neura.fused_op"(%5, %22) <{frequency = 9 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %112 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %113 = neura.phi_start %112, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %114 = neura.phi_start %113, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%114 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %25 = "neura.fused_op"(%6, %24) <{frequency = 9 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %112 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %113 = neura.phi_start %112, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %114 = neura.phi_start %113, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%114 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %26 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %27 = neura.reserve : !neura.data<i64, i1>
    %28 = neura.phi_start %10#1, %27 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = neura.phi_start %12, %29 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %32 = "neura.fused_op"(%8, %31) <{frequency = 9 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %112 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %113 = neura.phi_start %112, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %114 = neura.phi_start %113, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%114 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = neura.phi_start %14#1, %33 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %35 = neura.reserve : !neura.data<i64, i1>
    %36 = neura.phi_start %10#1, %35 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %37 = "neura.fused_op"(%36, %34, %32) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %112 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %113 = "neura.gep"(%arg5, %112) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%113 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = "neura.shl"(%36, %30) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.reserve : !neura.data<i64, i1>
    %44 = neura.reserve : !neura.data<i64, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = neura.phi_start %18, %45 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = neura.reserve : !neura.data<i64, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %52 = neura.reserve : !neura.data<i64, i1>
    %53 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %54 = neura.reserve : !neura.data<i64, i1>
    %55 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %56 = neura.reserve : !neura.data<i64, i1>
    %57 = neura.phi_start %28, %56 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %58:6 = "neura.fused_op"(%57, %46, %23, %50, %0, %16, %43) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:icmp->not->fused_op:phi_start->grant_predicate->fused_op:fused_op:grant_once->fused_op:phi_start->phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i64, i1>):
      %112 = "neura.icmp"(%arg3, %arg4) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %113 = "neura.not"(%112) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %114 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %115 = neura.grant_predicate %114, %112 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %116 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %117 = neura.phi_start %116, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %118 = neura.phi_start %117, %arg8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %119 = neura.phi_start %118, %arg9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %120 = neura.grant_predicate %119, %112 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113, %114, %115, %119, %120 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %59:2 = "neura.fused_op"(%7, %26, %53, %58#0) <{frequency = 7 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>):
      %112 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %113 = neura.phi_start %112, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %114 = neura.phi_start %113, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %115 = neura.phi_start %114, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %116 = neura.grant_predicate %115, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%115, %116 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %60:2 = "neura.fused_op"(%4, %21, %49, %58#0) <{frequency = 7 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %112 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %113 = neura.phi_start %112, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %114 = neura.phi_start %113, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %115 = neura.phi_start %114, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %116 = neura.grant_predicate %115, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%115, %116 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %61:2 = "neura.fused_op"(%3, %20, %48, %58#0) <{frequency = 7 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %112 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
      %113 = neura.phi_start %112, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %114 = neura.phi_start %113, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %115 = neura.phi_start %114, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %116 = neura.grant_predicate %115, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%115, %116 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %62:2 = "neura.fused_op"(%2, %19, %47, %58#0) <{frequency = 7 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %112 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
      %113 = neura.phi_start %112, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %114 = neura.phi_start %113, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %115 = neura.phi_start %114, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %116 = neura.grant_predicate %115, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%115, %116 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %63:3 = "neura.fused_op"(%37, %55, %58#0) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:phi_start->grant_predicate->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %114 = "neura.load"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%112, %113, %114 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %64:2 = "neura.fused_op"(%14#0, %15, %42, %58#0) <{frequency = 4 : i64, pattern_id = 18 : i64, pattern_name = "phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %112 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %113 = neura.phi_start %112, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %114 = neura.grant_predicate %113, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%113, %114 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %65:2 = "neura.fused_op"(%28, %39, %58#0) <{frequency = 30 : i64, pattern_id = 16 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %66:2 = "neura.fused_op"(%30, %40, %58#0) <{frequency = 30 : i64, pattern_id = 16 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %67:2 = "neura.fused_op"(%32, %41, %58#0) <{frequency = 30 : i64, pattern_id = 16 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%112, %113 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %68:2 = "neura.fused_op"(%36, %44, %58#0) <{frequency = 30 : i64, pattern_id = 16 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %69 = "neura.fused_op"(%57, %62#0, %58#0) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "add->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %112 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%113 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %70:3 = "neura.fused_op"(%34, %52, %57, %58#2) <{frequency = 3 : i64, pattern_id = 17 : i64, pattern_name = "phi_start->fused_op:add->or"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %112 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %113 = "neura.add"(%arg5, %112) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %114 = "neura.or"(%113, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%112, %113, %114 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %71:4 = "neura.fused_op"(%25, %51, %58#0, %70#1) <{frequency = 8 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:phi_start->grant_predicate->fused_op:gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>):
      %112 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %114 = "neura.gep"(%112, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%112, %113, %114, %115 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %72:2 = "neura.fused_op"(%70#1, %61#0, %71#0) <{frequency = 4 : i64, pattern_id = 16 : i64, pattern_name = "or->fused_op:gep->load"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %112 = "neura.or"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %113 = "neura.gep"(%arg5, %112) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %114 = "neura.load"(%113) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%113, %114 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %73:2 = "neura.fused_op"(%70#1, %60#0, %71#0) <{frequency = 4 : i64, pattern_id = 16 : i64, pattern_name = "or->fused_op:gep->load"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %112 = "neura.or"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %113 = "neura.gep"(%arg5, %112) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %114 = "neura.load"(%113) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%113, %114 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %74:2 = "neura.fused_op"(%38, %54, %58#0) <{frequency = 30 : i64, pattern_id = 16 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %75:4 = "neura.fused_op"(%57, %74#0, %58#2, %60#0, %59#0, %63#2, %71#3) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:add->or->or->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %112 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %113 = "neura.or"(%112, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %114 = "neura.or"(%112, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %115 = "neura.gep"(%arg7, %112) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %116 = "neura.load"(%115) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %117 = "neura.mul"(%116, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %118 = "neura.add"(%arg9, %117) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%112, %113, %114, %118 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>)
    %76 = "neura.fused_op"(%63#0, %59#0, %75#2, %73#1) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "load->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i32, i1>):
      %112 = "neura.load"(%arg3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %113 = "neura.gep"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %114 = "neura.load"(%113) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %115 = "neura.mul"(%114, %112) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %116 = "neura.add"(%arg6, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%116 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%75#3, %71#2) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %77:2 = "neura.fused_op"(%71#0, %70#2) <{frequency = 8 : i64, pattern_id = 3 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %112 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %113 = "neura.load"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%112, %113 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %78 = "neura.fused_op"(%63#0, %59#0, %75#1, %77#1) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "load->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i32, i1>):
      %112 = "neura.load"(%arg3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %113 = "neura.gep"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %114 = "neura.load"(%113) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %115 = "neura.mul"(%114, %112) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %116 = "neura.add"(%arg6, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%116 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%78, %77#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%76, %73#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %79 = "neura.or"(%75#0, %61#0) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80 = "neura.fused_op"(%63#0, %59#0, %79, %72#1) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "load->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i32, i1>):
      %112 = "neura.load"(%arg3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %113 = "neura.gep"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %114 = "neura.load"(%113) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %115 = "neura.mul"(%114, %112) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %116 = "neura.add"(%arg6, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%116 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%80, %72#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    neura.ctrl_mov %69 -> %56 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %63#1 -> %55 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %74#1 -> %54 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %59#1 -> %53 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %81 = neura.grant_predicate %70#0, %58#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %81 -> %52 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %71#1 -> %51 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %58#3 -> %50 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %60#1 -> %49 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %61#1 -> %48 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %62#1 -> %47 : !neura.data<i64, i1> !neura.data<i64, i1>
    %82 = neura.grant_predicate %46, %58#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %82 -> %45 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %68#1 -> %44 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %58#5 -> %43 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %64#1 -> %42 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %67#1 -> %41 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %66#1 -> %40 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %65#1 -> %39 : !neura.data<i64, i1> !neura.data<i64, i1>
    %83 = neura.grant_predicate %58#2, %58#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %84 = "neura.fused_op"(%68#0, %58#1, %83) <{frequency = 4 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i64, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = "neura.add"(%112, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%113 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %85 = neura.grant_predicate %58#4, %58#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %86:7 = "neura.fused_op"(%84, %85, %46, %58#1, %64#0, %83) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->not->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %112 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %113 = "neura.not"(%112) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %114 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %115 = neura.grant_predicate %114, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %116 = neura.grant_predicate %arg7, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %117 = neura.grant_predicate %116, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %118 = neura.grant_predicate %arg8, %112 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113, %114, %115, %116, %117, %118 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %87:2 = "neura.fused_op"(%62#0, %58#1, %86#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %88:2 = "neura.fused_op"(%61#0, %58#1, %86#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %89:2 = "neura.fused_op"(%60#0, %58#1, %86#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %90:2 = "neura.fused_op"(%71#0, %58#1, %86#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%112, %113 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %91:2 = "neura.fused_op"(%59#0, %58#1, %86#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%112, %113 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %92:2 = "neura.fused_op"(%65#0, %58#1, %86#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %93:2 = "neura.fused_op"(%66#0, %58#1, %86#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %94:2 = "neura.fused_op"(%67#0, %58#1, %86#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%112, %113 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %95 = "neura.fused_op"(%70#0, %58#1, %86#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%113 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %96 = neura.grant_predicate %84, %86#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %96 -> %35 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %95 -> %33 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %94#1 -> %31 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %93#1 -> %29 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %92#1 -> %27 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %91#1 -> %26 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %90#1 -> %24 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %97 = neura.grant_predicate %83, %86#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %97 -> %22 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %89#1 -> %21 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %88#1 -> %20 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %87#1 -> %19 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %86#3 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    %98 = neura.grant_predicate %85, %86#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %98 -> %16 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %86#5 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %99 = "neura.fused_op"(%86#4, %86#0, %86#6) <{frequency = 4 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i64, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = "neura.add"(%112, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%113 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100 = neura.grant_predicate %85, %86#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %101:5 = "neura.fused_op"(%99, %100, %92#0, %86#0, %86#2) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->not->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %112 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %113 = "neura.not"(%112) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %114 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %115 = neura.grant_predicate %114, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %116 = neura.grant_predicate %arg7, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %117 = neura.grant_predicate %116, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %118 = neura.grant_predicate %arg3, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%112, %113, %115, %117, %118 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %102 = "neura.fused_op"(%87#0, %86#0, %101#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%113 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %103 = "neura.fused_op"(%88#0, %86#0, %101#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%113 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %104 = "neura.fused_op"(%89#0, %86#0, %101#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%113 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %105 = "neura.fused_op"(%90#0, %86#0, %101#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%113 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %106 = "neura.fused_op"(%91#0, %86#0, %101#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%113 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %107 = "neura.fused_op"(%93#0, %86#0, %101#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%113 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %108 = "neura.fused_op"(%94#0, %86#0, %101#1) <{frequency = 36 : i64, pattern_id = 6 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %112 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %113 = neura.grant_predicate %112, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%113 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %101#4 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %107 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %101#2 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %108 -> %8 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %106 -> %7 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %105 -> %6 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %109 = neura.grant_predicate %86#6, %101#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %109 -> %5 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %104 -> %4 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %103 -> %3 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %102 -> %2 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %101#3 -> %1 : !neura.data<i64, i1> !neura.data<i64, i1>
    %110 = neura.grant_predicate %100, %101#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %110 -> %0 : !neura.data<i64, i1> !neura.data<i64, i1>
    %111 = neura.grant_predicate %101#0, %101#0 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %111 : !neura.data<i1, i1>
    neura.yield
  }
}

