#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2x1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2x2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2y1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2y2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.addressof @_ZZ4mainE2x1 : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i8) : i8
    %2 = llvm.mlir.constant(256 : i64) : i64
    %3 = llvm.mlir.addressof @_ZZ4mainE2x2 : !llvm.ptr
    %4 = llvm.mlir.constant(0 : i64) : i64
    %5 = llvm.mlir.addressof @_ZZ4mainE2y1 : !llvm.ptr
    %6 = llvm.mlir.constant(3 : i32) : i32
    %7 = llvm.mlir.addressof @_ZZ4mainE2y2 : !llvm.ptr
    %8 = llvm.mlir.constant(4 : i32) : i32
    %9 = llvm.mlir.constant(1 : i64) : i64
    %10 = llvm.mlir.constant(64 : i64) : i64
    %11 = llvm.mlir.constant(6 : i32) : i32
    %12 = llvm.mlir.constant(63 : i32) : i32
    %13 = llvm.mlir.addressof @_ZZ4mainE1A : !llvm.ptr
    %14 = llvm.mlir.constant(4096 : i64) : i64
    %15 = llvm.mlir.constant(6 : i64) : i64
    %16 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    "llvm.intr.memset"(%3, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%4 : i64)
  ^bb1(%17: i64):  // 2 preds: ^bb0, ^bb1
    %18 = llvm.getelementptr inbounds %5[0, %17] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %19 = llvm.trunc %17 : i64 to i32
    %20 = llvm.add %19, %6 : i32
    llvm.store %20, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.getelementptr inbounds %7[0, %17] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %22 = llvm.trunc %17 : i64 to i32
    %23 = llvm.add %22, %8 : i32
    llvm.store %23, %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.add %17, %9 overflow<nsw, nuw> : i64
    %25 = llvm.icmp "eq" %24, %10 : i64
    llvm.cond_br %25, ^bb2(%4 : i64), ^bb1(%24 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%26: i64):  // 2 preds: ^bb1, ^bb2
    %27 = llvm.trunc %26 : i64 to i32
    %28 = llvm.lshr %27, %11 : i32
    %29 = llvm.and %27, %12 : i32
    %30 = llvm.mul %28, %29 overflow<nsw, nuw> : i32
    %31 = llvm.and %30, %12 : i32
    %32 = llvm.getelementptr inbounds %13[0, %26] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    llvm.store %31, %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.add %26, %9 overflow<nsw, nuw> : i64
    %34 = llvm.icmp "eq" %33, %14 : i64
    llvm.cond_br %34, ^bb3(%4 : i64), ^bb2(%33 : i64) {loop_annotation = #loop_annotation}
  ^bb3(%35: i64):  // 2 preds: ^bb2, ^bb5
    %36 = llvm.getelementptr inbounds %5[0, %35] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %37 = llvm.shl %35, %15 overflow<nsw> : i64
    %38 = llvm.getelementptr inbounds %7[0, %35] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %39 = llvm.load %36 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %40 = llvm.load %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb4(%4 : i64)
  ^bb4(%41: i64):  // 2 preds: ^bb3, ^bb4
    %42 = llvm.getelementptr inbounds %0[0, %41] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %43 = llvm.load %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.shl %41, %15 overflow<nsw, nuw> : i64
    %45 = llvm.add %44, %35 overflow<nsw, nuw> : i64
    %46 = llvm.getelementptr inbounds %13[0, %45] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.mul %39, %47 overflow<nsw> : i32
    %49 = llvm.add %48, %43 overflow<nsw> : i32
    llvm.store %49, %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.getelementptr inbounds %3[0, %41] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.add %41, %37 overflow<nsw, nuw> : i64
    %53 = llvm.getelementptr inbounds %13[0, %52] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %54 = llvm.load %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.mul %40, %54 overflow<nsw> : i32
    %56 = llvm.add %55, %51 overflow<nsw> : i32
    llvm.store %56, %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %57 = llvm.add %41, %9 overflow<nsw, nuw> : i64
    %58 = llvm.icmp "eq" %57, %10 : i64
    llvm.cond_br %58, ^bb5, ^bb4(%57 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %59 = llvm.add %35, %9 overflow<nsw, nuw> : i64
    %60 = llvm.icmp "eq" %59, %10 : i64
    llvm.cond_br %60, ^bb6, ^bb3(%59 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    llvm.return %16 : i32
  }
  func.func @_Z6kernelPiS_PKiS1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = neura.reserve : !neura.data<i64, i1>
    %1 = neura.reserve : !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %3 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %4 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6:2 = "neura.fused_op"(%5) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %71 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %72 = neura.phi_start %71, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%71, %72 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %7 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %8 = "neura.fused_op"(%7) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %72 = neura.phi_start %71, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = "neura.fused_op"(%9) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %71 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %72 = neura.phi_start %71, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%72 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %12 = "neura.fused_op"(%11) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %72 = neura.phi_start %71, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14:2 = "neura.fused_op"(%6#0, %13, %10) <{frequency = 4 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->shl"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %71 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %72 = "neura.shl"(%71, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%71, %72 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %15 = "neura.gep"(%12, %14#0) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %16 = "neura.gep"(%8, %14#0) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = "neura.fused_op"(%0, %20) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %71 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %72 = neura.phi_start %71, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %73 = neura.phi_start %72, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%73 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %24 = neura.phi_start %16, %23 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %27 = "neura.fused_op"(%2, %26) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %72 = neura.phi_start %71, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %73 = neura.phi_start %72, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%73 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %29 = neura.phi_start %15, %28 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %31 = "neura.fused_op"(%3, %30) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %72 = neura.phi_start %71, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %73 = neura.phi_start %72, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%73 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = neura.phi_start %10, %33 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %35 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %36 = "neura.fused_op"(%4, %35) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %72 = neura.phi_start %71, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %73 = neura.phi_start %72, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%73 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38:5 = "neura.fused_op"(%1, %22, %6#1, %37, %27) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->fused_op:fused_op:phi_start->add->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %72 = neura.phi_start %71, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %73 = neura.phi_start %72, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %74 = neura.phi_start %arg7, %arg8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %75 = "neura.add"(%74, %73) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %76 = "neura.gep"(%arg9, %74) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %77 = "neura.load"(%76) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%73, %74, %75, %76, %77 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %39:2 = "neura.fused_op"(%14#1, %25, %38#1, %31) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:phi_start->add->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %71 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %72 = "neura.add"(%arg7, %71) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %73 = "neura.gep"(%arg8, %72) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %74 = "neura.load"(%73) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%71, %74 : !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>)
    %40:2 = "neura.fused_op"(%36, %38#1) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %71 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %72 = "neura.load"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%71, %72 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %41 = "neura.shl"(%38#1, %34) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %42:2 = "neura.fused_op"(%14#0, %32, %41, %31) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:phi_start->add->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %71 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %72 = "neura.add"(%arg7, %71) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %73 = "neura.gep"(%arg8, %72) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %74 = "neura.load"(%73) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%71, %74 : !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>)
    %43:4 = "neura.fused_op"(%38#2, %21, %42#0, %38#0) <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %71 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %72 = neura.grant_predicate %arg7, %71 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %73 = neura.grant_predicate %arg8, %71 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %74 = neura.grant_predicate %arg6, %71 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%71, %72, %73, %74 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %44:4 = "neura.fused_op"(%43#0, %38#2, %6#1, %17) <{frequency = 11 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->fused_op:phi_start->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %71 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %72 = neura.grant_predicate %arg6, %71 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %73 = neura.phi_start %arg7, %arg8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %74 = neura.grant_predicate %73, %71 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %75 = neura.grant_predicate %73, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%71, %72, %74, %75 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %45 = "neura.fused_op"(%29, %42#1) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i32, i1>):
      %71 = "neura.load"(%arg5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %72 = "neura.mul"(%71, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %46 = "neura.add"(%45, %40#1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%46, %40#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %47 = "neura.fused_op"(%24, %39#1) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i32, i1>):
      %71 = "neura.load"(%arg5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %72 = "neura.mul"(%71, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48 = "neura.add"(%47, %38#4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%48, %38#3) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %49:2 = "neura.fused_op"(%8, %18, %44#0) <{frequency = 9 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i1, i1>):
      %71 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %72 = neura.grant_predicate %71, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%71, %72 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %50:2 = "neura.fused_op"(%12, %19, %44#0) <{frequency = 9 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i1, i1>):
      %71 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %72 = neura.grant_predicate %71, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%71, %72 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    neura.ctrl_mov %44#1 -> %37 : !neura.data<i64, i1> !neura.data<i64, i1>
    %51 = neura.grant_predicate %36, %44#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %51 -> %35 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %52 = neura.grant_predicate %34, %44#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %52 -> %33 : !neura.data<i64, i1> !neura.data<i64, i1>
    %53 = neura.grant_predicate %42#0, %44#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %53 -> %32 : !neura.data<i64, i1> !neura.data<i64, i1>
    %54 = neura.grant_predicate %31, %44#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %54 -> %30 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %55 = neura.grant_predicate %29, %44#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %55 -> %28 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %56 = neura.grant_predicate %27, %44#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %56 -> %26 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %57 = neura.grant_predicate %39#0, %44#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %57 -> %25 : !neura.data<i64, i1> !neura.data<i64, i1>
    %58 = neura.grant_predicate %24, %44#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %58 -> %23 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %59 = neura.grant_predicate %38#0, %44#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %59 -> %22 : !neura.data<i64, i1> !neura.data<i64, i1>
    %60 = neura.grant_predicate %21, %44#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %60 -> %20 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %50#1 -> %19 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %49#1 -> %18 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %44#2 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    %61 = "neura.add"(%43#1, %43#2) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62:2 = "neura.fused_op"(%61, %43#3) <{frequency = 12 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %71 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %72 = neura.grant_predicate %71, %71 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%71, %72 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %63:4 = "neura.fused_op"(%62#0, %44#3, %61, %34, %43#0) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i1, i1>):
      %71 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %72 = neura.grant_predicate %arg6, %71 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %73 = neura.grant_predicate %arg7, %71 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %74 = neura.grant_predicate %arg8, %arg9 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %75 = neura.grant_predicate %74, %71 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%71, %72, %73, %75 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %64 = "neura.fused_op"(%27, %43#0, %63#0) <{frequency = 9 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %71 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %72 = neura.grant_predicate %71, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %65 = "neura.fused_op"(%31, %43#0, %63#0) <{frequency = 9 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %71 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %72 = neura.grant_predicate %71, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %66 = "neura.fused_op"(%36, %43#0, %63#0) <{frequency = 9 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %71 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %72 = neura.grant_predicate %71, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %67 = "neura.fused_op"(%49#0, %43#0, %63#0) <{frequency = 9 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %71 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %72 = neura.grant_predicate %71, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %68 = "neura.fused_op"(%50#0, %43#0, %63#0) <{frequency = 9 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %71 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %72 = neura.grant_predicate %71, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %63#2 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %68 -> %11 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %63#3 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %67 -> %7 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %63#1 -> %5 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %66 -> %4 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %65 -> %3 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %64 -> %2 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %69 = neura.grant_predicate %43#2, %63#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %69 -> %1 : !neura.data<i64, i1> !neura.data<i64, i1>
    %70 = neura.grant_predicate %43#3, %63#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %70 -> %0 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %62#1 : !neura.data<i1, i1>
    neura.yield
  }
}

