#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %9 = llvm.mlir.constant(2 : i64) : i64
    %10 = llvm.mlir.constant(62 : i64) : i64
    %11 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%3 : i64)
  ^bb1(%12: i64):  // 2 preds: ^bb0, ^bb3
    %13 = llvm.shl %12, %4 overflow<nsw> : i64
    llvm.br ^bb2(%3 : i64)
  ^bb2(%14: i64):  // 2 preds: ^bb1, ^bb2
    %15 = llvm.add %14, %13 overflow<nsw, nuw> : i64
    %16 = llvm.add %14, %12 overflow<nsw, nuw> : i64
    %17 = llvm.getelementptr inbounds %5[0, %15] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %18 = llvm.trunc %16 : i64 to i32
    llvm.store %18, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.sub %12, %14 overflow<nsw> : i64
    %20 = llvm.getelementptr inbounds %6[0, %15] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %21 = llvm.trunc %19 : i64 to i32
    llvm.store %21, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.add %14, %7 overflow<nsw, nuw> : i64
    %23 = llvm.icmp "eq" %22, %8 : i64
    llvm.cond_br %23, ^bb3, ^bb2(%22 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %24 = llvm.add %12, %7 overflow<nsw, nuw> : i64
    %25 = llvm.icmp "eq" %24, %8 : i64
    llvm.cond_br %25, ^bb4(%3 : i64), ^bb1(%24 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%26: i64):  // 2 preds: ^bb3, ^bb8
    %27 = llvm.shl %26, %4 overflow<nsw> : i64
    llvm.br ^bb5(%3 : i64)
  ^bb5(%28: i64):  // 2 preds: ^bb4, ^bb7
    %29 = llvm.add %28, %27 overflow<nsw, nuw> : i64
    %30 = llvm.getelementptr inbounds %5[0, %29] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %31 = llvm.shl %28, %4 overflow<nsw> : i64
    %32 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb6(%3 : i64)
  ^bb6(%33: i64):  // 2 preds: ^bb5, ^bb6
    %34 = llvm.add %33, %31 overflow<nsw, nuw> : i64
    %35 = llvm.getelementptr inbounds %6[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %36 = llvm.load %35 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.mul %36, %32 overflow<nsw> : i32
    %38 = llvm.add %33, %27 overflow<nsw, nuw> : i64
    %39 = llvm.getelementptr inbounds %0[0, %38] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %40 = llvm.load %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.add %40, %37 overflow<nsw> : i32
    llvm.store %41, %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %42 = llvm.or %34, %7 : i64
    %43 = llvm.getelementptr inbounds %6[0, %42] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %44 = llvm.load %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.mul %44, %32 overflow<nsw> : i32
    %46 = llvm.or %38, %7 : i64
    %47 = llvm.getelementptr inbounds %0[0, %46] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %48 = llvm.load %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.add %48, %45 overflow<nsw> : i32
    llvm.store %49, %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.add %33, %9 overflow<nsw, nuw> : i64
    %51 = llvm.icmp "ult" %33, %10 : i64
    llvm.cond_br %51, ^bb6(%50 : i64), ^bb7 {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %52 = llvm.add %28, %7 overflow<nsw, nuw> : i64
    %53 = llvm.icmp "eq" %52, %8 : i64
    llvm.cond_br %53, ^bb8, ^bb5(%52 : i64) {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    %54 = llvm.add %26, %7 overflow<nsw, nuw> : i64
    %55 = llvm.icmp "eq" %54, %8 : i64
    llvm.cond_br %55, ^bb9, ^bb4(%54 : i64) {loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return %11 : i32
  }
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = neura.reserve : !neura.data<i64, i1>
    %1 = neura.reserve : !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %5 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %6 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8:2 = "neura.fused_op"(%7) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %104 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %105 = neura.phi_start %104, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%104, %105 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = "neura.fused_op"(%9) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %104 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %105 = neura.phi_start %104, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%105 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12:2 = "neura.fused_op"(%8#0, %11, %10) <{frequency = 4 : i64, pattern_id = 11 : i64, pattern_name = "phi_start->shl"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %104 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %105 = "neura.shl"(%104, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%104, %105 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = "neura.fused_op"(%1, %15) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %104 = "neura.grant_once"() <{constant_value = 62 : i64}> : () -> !neura.data<i64, i1>
      %105 = neura.phi_start %104, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %106 = neura.phi_start %105, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%106 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = "neura.fused_op"(%3, %18) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %104 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %105 = neura.phi_start %104, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %106 = neura.phi_start %105, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%106 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %21 = "neura.fused_op"(%4, %20) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %104 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %105 = neura.phi_start %104, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %106 = neura.phi_start %105, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%106 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %23 = "neura.fused_op"(%5, %22) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %104 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %105 = neura.phi_start %104, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %106 = neura.phi_start %105, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%106 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.phi_start %8#1, %24 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = neura.phi_start %10, %26 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %29 = "neura.fused_op"(%6, %28) <{frequency = 7 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %104 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %105 = neura.phi_start %104, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %106 = neura.phi_start %105, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%106 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.phi_start %12#1, %30 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = neura.phi_start %8#1, %32 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %34 = "neura.fused_op"(%33, %31, %29) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %104 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %105 = "neura.gep"(%arg5, %104) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%105 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = "neura.shl"(%33, %27) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.phi_start %16, %42 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = neura.reserve : !neura.data<i64, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %49 = neura.reserve : !neura.data<i64, i1>
    %50 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %51 = neura.reserve : !neura.data<i64, i1>
    %52 = neura.phi_start %25, %51 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %53:6 = "neura.fused_op"(%52, %43, %19, %45, %33, %41) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:icmp->not->fused_op:phi_start->grant_predicate->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %104 = "neura.icmp"(%arg3, %arg4) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %105 = "neura.not"(%104) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %106 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %107 = neura.grant_predicate %106, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %108 = neura.phi_start %arg7, %arg8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %109 = neura.grant_predicate %108, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%104, %105, %106, %107, %108, %109 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %54:2 = "neura.fused_op"(%2, %17, %44, %53#0) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %104 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %105 = neura.phi_start %104, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %106 = neura.phi_start %105, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %107 = neura.phi_start %106, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %108 = neura.grant_predicate %107, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%107, %108 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %55:2 = "neura.fused_op"(%0, %14, %40, %53#0) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %104 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %105 = neura.phi_start %104, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %106 = neura.phi_start %105, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %107 = neura.phi_start %106, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %108 = neura.grant_predicate %107, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%107, %108 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %56:2 = "neura.fused_op"(%31, %47, %52) <{frequency = 3 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %104 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %105 = "neura.add"(%arg5, %104) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%104, %105 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %57:2 = "neura.fused_op"(%12#0, %13, %39, %53#0) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "phi_start->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %104 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %105 = neura.phi_start %104, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %106 = neura.grant_predicate %105, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%105, %106 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %58:2 = "neura.fused_op"(%25, %36, %53#0) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%104, %105 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %59:2 = "neura.fused_op"(%27, %37, %53#0) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%104, %105 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %60:2 = "neura.fused_op"(%29, %38, %53#0) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%104, %105 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %61 = "neura.fused_op"(%52, %54#0, %53#0) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "add->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %104 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%105 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %62:2 = "neura.fused_op"(%35, %49, %53#0) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%104, %105 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %63:2 = "neura.fused_op"(%34, %50, %53#0) <{frequency = 26 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%104, %105 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %64 = "neura.load"(%63#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %65 = "neura.add"(%52, %62#0) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66:3 = "neura.fused_op"(%23, %48, %53#0, %65) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:phi_start->grant_predicate->fused_op:gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>):
      %104 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %106 = "neura.gep"(%104, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %107 = "neura.load"(%106) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%104, %105, %107 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %67 = "neura.mul"(%66#2, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %68:4 = "neura.fused_op"(%21, %46, %53#0, %56#1) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:phi_start->grant_predicate->fused_op:gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>):
      %104 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %106 = "neura.gep"(%104, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %107 = "neura.load"(%106) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%104, %105, %106, %107 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %69 = "neura.add"(%68#3, %67) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%69, %68#2) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %70 = "neura.load"(%63#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %71 = "neura.or"(%65, %53#2) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %72 = "neura.fused_op"(%66#0, %71) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %104 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %105 = "neura.load"(%104) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%105 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %73 = "neura.mul"(%72, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %74 = "neura.or"(%56#1, %53#2) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %75:2 = "neura.fused_op"(%68#0, %74) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %104 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %105 = "neura.load"(%104) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%104, %105 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %76 = "neura.add"(%75#1, %73) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%76, %75#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    neura.ctrl_mov %61 -> %51 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %63#1 -> %50 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %62#1 -> %49 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %66#1 -> %48 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %77 = neura.grant_predicate %56#0, %53#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %77 -> %47 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %68#1 -> %46 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %53#3 -> %45 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %54#1 -> %44 : !neura.data<i64, i1> !neura.data<i64, i1>
    %78 = neura.grant_predicate %43, %53#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %78 -> %42 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %53#5 -> %41 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %55#1 -> %40 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %57#1 -> %39 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %60#1 -> %38 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %59#1 -> %37 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %58#1 -> %36 : !neura.data<i64, i1> !neura.data<i64, i1>
    %79 = neura.grant_predicate %53#2, %53#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %80 = "neura.fused_op"(%53#4, %53#1, %79) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "grant_predicate->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i64, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %105 = "neura.add"(%104, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%105 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81 = neura.grant_predicate %55#0, %53#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %82:7 = "neura.fused_op"(%80, %81, %43, %53#1, %57#0, %79) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->not->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %104 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %105 = "neura.not"(%104) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %106 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %107 = neura.grant_predicate %106, %105 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %108 = neura.grant_predicate %arg7, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %109 = neura.grant_predicate %108, %105 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %110 = neura.grant_predicate %arg8, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%104, %105, %106, %107, %108, %109, %110 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %83:2 = "neura.fused_op"(%54#0, %53#1, %82#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%104, %105 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %84:2 = "neura.fused_op"(%68#0, %53#1, %82#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%104, %105 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %85:2 = "neura.fused_op"(%66#0, %53#1, %82#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%104, %105 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %86:2 = "neura.fused_op"(%58#0, %53#1, %82#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%104, %105 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %87:2 = "neura.fused_op"(%59#0, %53#1, %82#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%104, %105 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %88:2 = "neura.fused_op"(%60#0, %53#1, %82#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%104, %105 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %89 = "neura.fused_op"(%56#0, %53#1, %82#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%105 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %90 = neura.grant_predicate %80, %82#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %90 -> %32 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %89 -> %30 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %88#1 -> %28 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %87#1 -> %26 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %86#1 -> %24 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %85#1 -> %22 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %84#1 -> %20 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %91 = neura.grant_predicate %79, %82#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %91 -> %18 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %83#1 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %82#3 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %92 = neura.grant_predicate %81, %82#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %92 -> %14 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %82#5 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    %93 = "neura.fused_op"(%82#4, %82#0, %82#6) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "grant_predicate->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i64, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %105 = "neura.add"(%104, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%105 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %94 = neura.grant_predicate %81, %82#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %95:5 = "neura.fused_op"(%93, %94, %86#0, %82#0, %82#2) <{frequency = 10 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->not->fused_op:grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %104 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %105 = "neura.not"(%104) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %106 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %107 = neura.grant_predicate %106, %105 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %108 = neura.grant_predicate %arg7, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %109 = neura.grant_predicate %108, %105 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %110 = neura.grant_predicate %arg3, %105 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%104, %105, %107, %109, %110 : !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %96 = "neura.fused_op"(%83#0, %82#0, %95#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%105 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %97 = "neura.fused_op"(%84#0, %82#0, %95#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%105 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %98 = "neura.fused_op"(%85#0, %82#0, %95#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%105 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %99 = "neura.fused_op"(%87#0, %82#0, %95#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%105 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %100 = "neura.fused_op"(%88#0, %82#0, %95#1) <{frequency = 30 : i64, pattern_id = 5 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %104 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %105 = neura.grant_predicate %104, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%105 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %95#4 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %99 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %95#2 -> %7 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %100 -> %6 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %98 -> %5 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %97 -> %4 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %101 = neura.grant_predicate %82#6, %95#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %101 -> %3 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %96 -> %2 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %95#3 -> %1 : !neura.data<i64, i1> !neura.data<i64, i1>
    %102 = neura.grant_predicate %94, %95#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %102 -> %0 : !neura.data<i64, i1> !neura.data<i64, i1>
    %103 = neura.grant_predicate %95#0, %95#0 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %103 : !neura.data<i1, i1>
    neura.yield
  }
}

