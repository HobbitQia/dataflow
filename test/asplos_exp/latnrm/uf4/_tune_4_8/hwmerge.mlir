#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr constant @_ZZ4mainE11coefficient(dense<[25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560]> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<16 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5state(dense<0> : tensor<12xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<12 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(false) : i1
    %2 = llvm.mlir.constant(5 : i64) : i64
    %3 = llvm.mlir.constant(4 : i64) : i64
    %4 = llvm.mlir.constant(3 : i64) : i64
    %5 = llvm.mlir.constant(2 : i64) : i64
    %6 = llvm.mlir.addressof @_ZZ4mainE11coefficient : !llvm.ptr
    %7 = llvm.mlir.constant(true) : i1
    %8 = llvm.mlir.constant(0 : i64) : i64
    %9 = llvm.mlir.constant(1 : i64) : i64
    %10 = llvm.mlir.addressof @_ZZ4mainE5state : !llvm.ptr
    %11 = llvm.mlir.constant(12 : i64) : i64
    %12 = llvm.getelementptr inbounds %10[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<12 x i32>
    llvm.br ^bb1(%8 : i64)
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb1
    %14 = llvm.add %13, %9 overflow<nsw, nuw> : i64
    %15 = llvm.getelementptr inbounds %10[0, %13] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %16 = llvm.trunc %14 : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.icmp "eq" %14, %11 : i64
    llvm.cond_br %17, ^bb2, ^bb1(%14 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %18 = llvm.load %10 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb3(%19, %18, %7, %8 : i32, i32, i1, i64)
  ^bb3(%20: i32, %21: i32, %22: i1, %23: i64):  // 2 preds: ^bb2, ^bb3
    %24 = llvm.shl %23, %9 overflow<nsw, nuw> : i64
    %25 = llvm.getelementptr inbounds %6[0, %24] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %26 = llvm.load %25 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %27 = llvm.or %24, %9 : i64
    %28 = llvm.getelementptr inbounds %6[0, %27] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %29 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.or %23, %5 : i64
    %31 = llvm.getelementptr inbounds %10[0, %30] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %32 = llvm.load %31 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %20, %31 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.mul %29, %21 overflow<nsw> : i32
    %34 = llvm.mul %32, %26 overflow<nsw> : i32
    %35 = llvm.sub %33, %34 overflow<nsw> : i32
    %36 = llvm.mul %32, %29 overflow<nsw> : i32
    %37 = llvm.mul %26, %21 overflow<nsw> : i32
    %38 = llvm.add %36, %37 overflow<nsw> : i32
    %39 = llvm.or %24, %5 : i64
    %40 = llvm.getelementptr inbounds %6[0, %39] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %41 = llvm.load %40 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.or %24, %4 : i64
    %43 = llvm.getelementptr inbounds %6[0, %42] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %44 = llvm.load %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.or %23, %4 : i64
    %46 = llvm.getelementptr inbounds %10[0, %45] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %38, %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %48 = llvm.mul %44, %35 overflow<nsw> : i32
    %49 = llvm.mul %47, %41 overflow<nsw> : i32
    %50 = llvm.sub %48, %49 overflow<nsw> : i32
    %51 = llvm.mul %47, %44 overflow<nsw> : i32
    %52 = llvm.mul %41, %35 overflow<nsw> : i32
    %53 = llvm.add %51, %52 overflow<nsw> : i32
    %54 = llvm.shl %30, %9 overflow<nsw, nuw> : i64
    %55 = llvm.getelementptr inbounds %6[0, %54] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %56 = llvm.load %55 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.or %54, %9 : i64
    %58 = llvm.getelementptr inbounds %6[0, %57] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %59 = llvm.load %58 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %60 = llvm.add %23, %3 overflow<nsw, nuw> : i64
    %61 = llvm.getelementptr inbounds %10[0, %60] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %62 = llvm.load %61 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %53, %61 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %63 = llvm.mul %59, %50 overflow<nsw> : i32
    %64 = llvm.mul %62, %56 overflow<nsw> : i32
    %65 = llvm.sub %63, %64 overflow<nsw> : i32
    %66 = llvm.mul %62, %59 overflow<nsw> : i32
    %67 = llvm.mul %56, %50 overflow<nsw> : i32
    %68 = llvm.add %66, %67 overflow<nsw> : i32
    %69 = llvm.shl %45, %9 overflow<nsw, nuw> : i64
    %70 = llvm.getelementptr inbounds %6[0, %69] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %71 = llvm.load %70 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %72 = llvm.or %69, %9 : i64
    %73 = llvm.getelementptr inbounds %6[0, %72] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %74 = llvm.load %73 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %75 = llvm.add %23, %2 overflow<nsw, nuw> : i64
    %76 = llvm.getelementptr inbounds %10[0, %75] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %77 = llvm.load %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %68, %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %78 = llvm.mul %74, %65 overflow<nsw> : i32
    %79 = llvm.mul %77, %71 overflow<nsw> : i32
    %80 = llvm.sub %78, %79 overflow<nsw> : i32
    %81 = llvm.mul %77, %74 overflow<nsw> : i32
    %82 = llvm.mul %71, %65 overflow<nsw> : i32
    %83 = llvm.add %81, %82 overflow<nsw> : i32
    llvm.cond_br %22, ^bb3(%83, %80, %1, %3 : i32, i32, i1, i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.store %80, %10 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.store %83, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.return %0 : i32
  }
  func.func @_Z6kernelPiPKi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %2:2 = "neura.fused_op"(%0, %1) <{frequency = 13 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %43 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %44 = "neura.load"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%43, %44 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %3 = "neura.load"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %4 = neura.reserve : !neura.data<i1, i1>
    %5 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = "neura.fused_op"(%12) <{frequency = 13 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %43 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %44 = neura.phi_start %43, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%44 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15:3 = "neura.fused_op"(%14, %13) <{frequency = 4 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:grant_once->phi_start->fused_op:shl->or"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %43 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %44 = neura.phi_start %43, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %45 = "neura.shl"(%44, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %46 = "neura.or"(%45, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%44, %45, %46 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %16 = neura.reserve : !neura.data<i1, i1>
    %17:5 = "neura.fused_op"(%16, %7, %4) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:grant_once->phi_start->fused_op:fused_op:grant_once->phi_start->grant_predicate->fused_op:fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %43 = "neura.grant_once"() <{constant_value = true}> : () -> !neura.data<i1, i1>
      %44 = neura.phi_start %43, %arg2 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      %45 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
      %46 = neura.phi_start %45, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %47 = neura.grant_predicate %46, %44 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %48 = "neura.grant_once"() <{constant_value = false}> : () -> !neura.data<i1, i1>
      %49 = neura.phi_start %48, %arg4 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      %50 = neura.grant_predicate %49, %44 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%44, %46, %47, %49, %50 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %18:3 = "neura.fused_op"(%8, %17#0, %15#1) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:grant_once->phi_start->grant_predicate->or"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>):
      %43 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
      %44 = neura.phi_start %43, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %45 = neura.grant_predicate %44, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %46 = "neura.or"(%arg4, %44) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%44, %45, %46 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %19:3 = "neura.fused_op"(%10, %17#0, %15#0) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:grant_once->phi_start->grant_predicate->or"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>):
      %43 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %44 = neura.phi_start %43, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %45 = neura.grant_predicate %44, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %46 = "neura.or"(%arg4, %44) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%44, %45, %46 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %20:2 = "neura.fused_op"(%2#0, %5, %17#0) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>):
      %43 = "neura.grant_once"(%arg2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
      %44 = neura.phi_start %43, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %45 = neura.grant_predicate %44, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%44, %45 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %21:2 = "neura.fused_op"(%6, %17#0) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>):
      %43 = "neura.grant_once"() <{constant_value = 5 : i64}> : () -> !neura.data<i64, i1>
      %44 = neura.phi_start %43, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %45 = neura.grant_predicate %44, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%44, %45 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %22:2 = "neura.fused_op"(%9, %17#0) <{frequency = 24 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>):
      %43 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %44 = neura.phi_start %43, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %45 = neura.grant_predicate %44, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%44, %45 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %23 = neura.reserve : !neura.data<i32, i1>
    %24 = "neura.fused_op"(%3, %23) <{frequency = 13 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>):
      %43 = "neura.grant_once"(%arg2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %44 = neura.phi_start %43, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%44 : !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %25:7 = "neura.fused_op"(%11, %17#0, %15#1, %24, %22#0, %19#2, %15#2) <{frequency = 5 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:grant_once->phi_start->grant_predicate->fused_op:fused_op:gep->load->mul->fused_op:fused_op:fused_op:gep->load->mul->fused_op:fused_op:gep->load->fused_op:mul->sub"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %43 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %44 = neura.phi_start %43, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %45 = neura.grant_predicate %44, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.gep"(%44, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %48 = "neura.mul"(%arg5, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %49 = "neura.gep"(%arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %50 = "neura.load"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %51 = "neura.mul"(%50, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %52 = "neura.gep"(%44, %arg8) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %54 = "neura.mul"(%arg5, %53) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %55 = "neura.sub"(%54, %51) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%44, %45, %48, %49, %50, %53, %55 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %26 = neura.reserve : !neura.data<i32, i1>
    %27 = "neura.fused_op"(%2#1, %26) <{frequency = 13 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>):
      %43 = "neura.grant_once"(%arg2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %44 = neura.phi_start %43, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%44 : !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%27, %25#3) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %28 = "neura.fused_op"(%25#4, %25#5, %25#2) <{frequency = 8 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>):
      %43 = "neura.mul"(%arg2, %arg3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %44 = "neura.add"(%43, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%44 : !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %29 = "neura.or"(%15#1, %19#0) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.or"(%15#0, %18#0) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31:3 = "neura.fused_op"(%25#0, %29, %25#6, %22#0, %30, %18#2) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:gep->load->mul->fused_op:fused_op:fused_op:fused_op:gep->load->mul->fused_op:fused_op:gep->load->fused_op:mul->sub->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %43 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %44 = "neura.load"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %45 = "neura.mul"(%44, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %46 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %48 = "neura.mul"(%47, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %49 = "neura.gep"(%arg2, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %50 = "neura.load"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %51 = "neura.mul"(%50, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %52 = "neura.sub"(%51, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %53 = "neura.mul"(%47, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %54 = "neura.add"(%53, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%46, %52, %54 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    "neura.store"(%28, %31#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %32 = "neura.add"(%15#0, %17#1) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33:3 = "neura.fused_op"(%19#2, %13, %25#0, %31#1, %22#0, %32) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:shl->or->fused_op:fused_op:fused_op:gep->load->mul->fused_op:fused_op:fused_op:fused_op:gep->load->mul->fused_op:fused_op:gep->load->fused_op:mul->sub->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i64, i1>):
      %43 = "neura.shl"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %44 = "neura.or"(%43, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %45 = "neura.gep"(%arg4, %43) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %47 = "neura.mul"(%46, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %48 = "neura.gep"(%arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %49 = "neura.load"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %50 = "neura.mul"(%49, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %51 = "neura.gep"(%arg4, %44) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %52 = "neura.load"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %53 = "neura.mul"(%52, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %54 = "neura.sub"(%53, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %55 = "neura.mul"(%49, %52) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %56 = "neura.add"(%55, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%48, %54, %56 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    "neura.store"(%31#2, %33#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %34 = "neura.add"(%15#0, %21#0) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %35:3 = "neura.fused_op"(%30, %13, %25#0, %33#1, %22#0, %34) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:shl->or->fused_op:fused_op:fused_op:gep->load->mul->fused_op:fused_op:fused_op:fused_op:gep->load->mul->fused_op:fused_op:gep->load->fused_op:mul->sub->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i64, i1>):
      %43 = "neura.shl"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %44 = "neura.or"(%43, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %45 = "neura.gep"(%arg4, %43) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %47 = "neura.mul"(%46, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %48 = "neura.gep"(%arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %49 = "neura.load"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %50 = "neura.mul"(%49, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %51 = "neura.gep"(%arg4, %44) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %52 = "neura.load"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %53 = "neura.mul"(%52, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %54 = "neura.sub"(%53, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %55 = "neura.mul"(%49, %52) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %56 = "neura.add"(%55, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%48, %54, %56 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    "neura.store"(%33#2, %35#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%35#1, %22#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%35#2, %20#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %36 = "neura.not"(%17#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %37 = neura.grant_predicate %35#2, %17#0 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %37 -> %26 : !neura.data<i32, i1> !neura.data<i32, i1>
    %38 = neura.grant_predicate %35#1, %17#0 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %38 -> %23 : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %17#4 -> %16 : !neura.data<i1, i1> !neura.data<i1, i1>
    neura.ctrl_mov %17#2 -> %14 : !neura.data<i64, i1> !neura.data<i64, i1>
    %39 = neura.grant_predicate %13, %17#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %39 -> %12 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %25#1 -> %11 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %19#1 -> %10 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %22#1 -> %9 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %18#1 -> %8 : !neura.data<i64, i1> !neura.data<i64, i1>
    %40 = neura.grant_predicate %17#1, %17#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %40 -> %7 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %21#1 -> %6 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %20#1 -> %5 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %41 = neura.grant_predicate %17#3, %17#0 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.ctrl_mov %41 -> %4 : !neura.data<i1, i1> !neura.data<i1, i1>
    %42 = neura.grant_predicate %36, %36 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %42 : !neura.data<i1, i1>
    neura.yield
  }
}

