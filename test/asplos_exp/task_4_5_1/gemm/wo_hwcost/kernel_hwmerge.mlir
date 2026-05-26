#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %9 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%3 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb3
    %11 = llvm.shl %10, %4 overflow<nsw> : i64
    llvm.br ^bb2(%3 : i64)
  ^bb2(%12: i64):  // 2 preds: ^bb1, ^bb2
    %13 = llvm.add %12, %11 overflow<nsw, nuw> : i64
    %14 = llvm.add %12, %10 overflow<nsw, nuw> : i64
    %15 = llvm.getelementptr inbounds %5[0, %13] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %16 = llvm.trunc %14 : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.sub %10, %12 overflow<nsw> : i64
    %18 = llvm.getelementptr inbounds %6[0, %13] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %19 = llvm.trunc %17 : i64 to i32
    llvm.store %19, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.add %12, %7 overflow<nsw, nuw> : i64
    %21 = llvm.icmp "eq" %20, %8 : i64
    llvm.cond_br %21, ^bb3, ^bb2(%20 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %22 = llvm.add %10, %7 overflow<nsw, nuw> : i64
    %23 = llvm.icmp "eq" %22, %8 : i64
    llvm.cond_br %23, ^bb4(%3 : i64), ^bb1(%22 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%24: i64):  // 2 preds: ^bb3, ^bb8
    %25 = llvm.shl %24, %4 overflow<nsw> : i64
    llvm.br ^bb5(%3 : i64)
  ^bb5(%26: i64):  // 2 preds: ^bb4, ^bb7
    %27 = llvm.add %26, %25 overflow<nsw, nuw> : i64
    %28 = llvm.getelementptr inbounds %5[0, %27] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %29 = llvm.shl %26, %4 overflow<nsw> : i64
    %30 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb6(%3 : i64)
  ^bb6(%31: i64):  // 2 preds: ^bb5, ^bb6
    %32 = llvm.add %31, %29 overflow<nsw, nuw> : i64
    %33 = llvm.getelementptr inbounds %6[0, %32] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %34 = llvm.load %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.mul %34, %30 overflow<nsw> : i32
    %36 = llvm.add %31, %25 overflow<nsw, nuw> : i64
    %37 = llvm.getelementptr inbounds %0[0, %36] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %38 = llvm.load %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.add %38, %35 overflow<nsw> : i32
    llvm.store %39, %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %40 = llvm.add %31, %7 overflow<nsw, nuw> : i64
    %41 = llvm.icmp "eq" %40, %8 : i64
    llvm.cond_br %41, ^bb7, ^bb6(%40 : i64) {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %42 = llvm.add %26, %7 overflow<nsw, nuw> : i64
    %43 = llvm.icmp "eq" %42, %8 : i64
    llvm.cond_br %43, ^bb8, ^bb5(%42 : i64) {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    %44 = llvm.add %24, %7 overflow<nsw, nuw> : i64
    %45 = llvm.icmp "eq" %44, %8 : i64
    llvm.cond_br %45, ^bb9, ^bb4(%44 : i64) {loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return %9 : i32
  }
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = neura.reserve : !neura.data<i64, i1>
    %1 = neura.reserve : !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %3 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %4 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6:2 = "neura.fused_op"(%5) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %88 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %89 = neura.phi_start %88, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%88, %89 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = "neura.fused_op"(%7) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %88 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %89 = neura.phi_start %88, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%89 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10:2 = "neura.fused_op"(%6#0, %9, %8) <{frequency = 4 : i64, pattern_id = 16 : i64, pattern_name = "phi_start->shl"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %88 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %89 = "neura.shl"(%88, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%88, %89 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.phi_start %10#0, %11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.phi_start %6#1, %17 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.phi_start %8, %19 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = "neura.fused_op"(%4, %21) <{frequency = 5 : i64, pattern_id = 9 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %88 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %89 = neura.phi_start %88, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %90 = neura.phi_start %89, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%90 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = neura.phi_start %10#1, %23 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.phi_start %6#1, %25 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %27 = "neura.fused_op"(%26, %24, %22) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %88 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %89 = "neura.gep"(%arg5, %88) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%89 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = "neura.shl"(%26, %20) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = "neura.fused_op"(%0, %13, %34) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %88 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %89 = neura.phi_start %88, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %90 = neura.phi_start %89, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %91 = neura.phi_start %90, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%91 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = "neura.fused_op"(%1, %14, %36) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %88 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %89 = neura.phi_start %88, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %90 = neura.phi_start %89, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %91 = neura.phi_start %90, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%91 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %39 = "neura.fused_op"(%2, %15, %38) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %88 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %89 = neura.phi_start %88, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %90 = neura.phi_start %89, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %91 = neura.phi_start %90, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%91 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %42 = "neura.fused_op"(%3, %16, %41) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %88 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %89 = neura.phi_start %88, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %90 = neura.phi_start %89, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %91 = neura.phi_start %90, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%91 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = neura.reserve : !neura.data<i64, i1>
    %44 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %45 = neura.phi_start %27, %44 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %46 = neura.reserve : !neura.data<i64, i1>
    %47:3 = "neura.fused_op"(%28, %43, %18, %46, %42) <{frequency = 3 : i64, pattern_id = 7 : i64, pattern_name = "phi_start->fused_op:phi_start->fused_op:add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %88 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %89 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %90 = "neura.add"(%89, %88) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %91 = "neura.gep"(%arg7, %90) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%88, %89, %91 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %48:5 = "neura.fused_op"(%47#1, %37, %35, %26, %33) <{frequency = 5 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:add->icmp->fused_op:not->grant_predicate->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %88 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %89 = "neura.icmp"(%88, %arg5) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %90 = "neura.not"(%89) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %91 = neura.grant_predicate %88, %90 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %92 = neura.phi_start %arg6, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %93 = neura.grant_predicate %92, %90 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%89, %90, %91, %92, %93 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %49:2 = "neura.fused_op"(%24, %40, %47#1, %39) <{frequency = 8 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->fused_op:add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %88 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %89 = "neura.add"(%arg5, %88) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %90 = "neura.gep"(%arg6, %89) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%88, %90 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %50 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %51 = "neura.load"(%47#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %52 = "neura.mul"(%51, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %53 = "neura.load"(%49#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %54 = "neura.add"(%53, %52) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%54, %49#1) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %55:2 = "neura.fused_op"(%18, %29, %48#1) <{frequency = 22 : i64, pattern_id = 11 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%88, %89 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %56:2 = "neura.fused_op"(%20, %30, %48#1) <{frequency = 22 : i64, pattern_id = 11 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%88, %89 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %57:2 = "neura.fused_op"(%22, %31, %48#1) <{frequency = 22 : i64, pattern_id = 11 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%88, %89 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %58:2 = "neura.fused_op"(%12, %32, %48#1) <{frequency = 22 : i64, pattern_id = 11 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%88, %89 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    neura.ctrl_mov %48#2 -> %46 : !neura.data<i64, i1> !neura.data<i64, i1>
    %59 = neura.grant_predicate %45, %48#1 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %59 -> %44 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %60 = neura.grant_predicate %47#0, %48#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %60 -> %43 : !neura.data<i64, i1> !neura.data<i64, i1>
    %61 = neura.grant_predicate %42, %48#1 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %61 -> %41 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %62 = neura.grant_predicate %49#0, %48#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %62 -> %40 : !neura.data<i64, i1> !neura.data<i64, i1>
    %63 = neura.grant_predicate %39, %48#1 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %63 -> %38 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %64 = neura.grant_predicate %37, %48#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %64 -> %36 : !neura.data<i64, i1> !neura.data<i64, i1>
    %65 = neura.grant_predicate %35, %48#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %65 -> %34 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %48#4 -> %33 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %58#1 -> %32 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %57#1 -> %31 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %56#1 -> %30 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %55#1 -> %29 : !neura.data<i64, i1> !neura.data<i64, i1>
    %66 = neura.grant_predicate %37, %48#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %67 = neura.grant_predicate %35, %48#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %68:5 = "neura.fused_op"(%48#3, %48#0, %66, %67, %55#0) <{frequency = 7 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->fused_op:fused_op:fused_op:add->icmp->fused_op:not->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %88 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %89 = "neura.add"(%88, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %90 = "neura.icmp"(%89, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %91 = "neura.not"(%90) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %92 = neura.grant_predicate %89, %91 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %93 = neura.grant_predicate %arg7, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %94 = neura.grant_predicate %93, %91 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%90, %91, %92, %93, %94 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %69:2 = "neura.fused_op"(%58#0, %48#0, %68#1) <{frequency = 24 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%88, %89 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %70:2 = "neura.fused_op"(%39, %48#0, %68#1) <{frequency = 24 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%88, %89 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %71:2 = "neura.fused_op"(%42, %48#0, %68#1) <{frequency = 24 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%88, %89 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %72:2 = "neura.fused_op"(%56#0, %48#0, %68#1) <{frequency = 24 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%88, %89 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %73:2 = "neura.fused_op"(%57#0, %48#0, %68#1) <{frequency = 24 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%88, %89 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %74 = "neura.fused_op"(%49#0, %48#0, %68#1) <{frequency = 24 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%89 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %68#2 -> %25 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %74 -> %23 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %73#1 -> %21 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %72#1 -> %19 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %68#4 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %71#1 -> %16 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %70#1 -> %15 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %75 = neura.grant_predicate %66, %68#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %75 -> %14 : !neura.data<i64, i1> !neura.data<i64, i1>
    %76 = neura.grant_predicate %67, %68#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %76 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %69#1 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %77 = neura.grant_predicate %66, %68#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %78 = neura.grant_predicate %67, %68#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %79 = neura.grant_predicate %68#3, %68#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %80:5 = "neura.fused_op"(%69#0, %68#0, %77, %78, %79, %72#0) <{frequency = 7 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->fused_op:fused_op:fused_op:add->icmp->fused_op:not->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %88 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %89 = "neura.add"(%88, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %90 = "neura.icmp"(%89, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %91 = "neura.not"(%90) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %92 = neura.grant_predicate %arg7, %91 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %93 = neura.grant_predicate %arg8, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %94 = neura.grant_predicate %93, %91 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%89, %90, %91, %92, %94 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %81 = "neura.fused_op"(%70#0, %68#0, %80#2) <{frequency = 24 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%89 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %82 = "neura.fused_op"(%71#0, %68#0, %80#2) <{frequency = 24 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%89 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.fused_op"(%73#0, %68#0, %80#2) <{frequency = 24 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %88 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %89 = neura.grant_predicate %88, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%89 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = neura.grant_predicate %80#0, %80#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %84 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %80#4 -> %7 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %80#3 -> %5 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %83 -> %4 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %82 -> %3 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %81 -> %2 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %85 = neura.grant_predicate %77, %80#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %85 -> %1 : !neura.data<i64, i1> !neura.data<i64, i1>
    %86 = neura.grant_predicate %78, %80#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %86 -> %0 : !neura.data<i64, i1> !neura.data<i64, i1>
    %87 = neura.grant_predicate %80#1, %80#1 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %87 : !neura.data<i1, i1>
    neura.yield
  }
}

