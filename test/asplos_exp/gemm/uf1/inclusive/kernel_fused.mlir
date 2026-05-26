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
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %10 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.phi_start %2, %11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.phi_start %3, %13 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17:2 = "neura.fused_op"(%2, %15, %14, %16) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->shl->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %99 = "neura.shl"(%98, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %100 = neura.phi_start %98, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%99, %100 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.phi_start %12, %22 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.phi_start %14, %24 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %27 = "neura.fused_op"(%10, %26) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %98 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %99 = neura.phi_start %98, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %100 = neura.phi_start %99, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%100 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = neura.reserve : !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30:2 = "neura.fused_op"(%12, %29, %25) <{frequency = 4 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->shl"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %99 = "neura.shl"(%98, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%98, %99 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %31:2 = "neura.fused_op"(%17#0, %28, %30#0) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %99 = "neura.add"(%arg5, %98) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%98, %99 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %32 = "neura.gep"(%27, %31#1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = neura.phi_start %30#0, %37 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = "neura.fused_op"(%5, %6, %18, %39) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %99 = neura.phi_start %98, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %100 = neura.phi_start %99, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%100 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = "neura.fused_op"(%4, %7, %19, %41) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %99 = neura.phi_start %98, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %100 = neura.phi_start %99, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%100 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %44 = "neura.fused_op"(%0, %8, %20, %43) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %99 = neura.phi_start %98, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %100 = neura.phi_start %99, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%100 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %47 = "neura.fused_op"(%1, %9, %21, %46) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:phi_start->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %99 = neura.phi_start %98, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %100 = neura.phi_start %99, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%100 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %50 = neura.phi_start %32, %49 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %51 = neura.reserve : !neura.data<i64, i1>
    %52:2 = "neura.fused_op"(%23, %51, %42) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %99 = "neura.add"(%98, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%98, %99 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %53:2 = "neura.fused_op"(%31#0, %45, %52#0) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %99 = "neura.add"(%arg5, %98) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%98, %99 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %54:2 = "neura.fused_op"(%30#1, %48, %52#0) <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %99 = "neura.add"(%arg5, %98) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%98, %99 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %55 = "neura.load"(%50) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %56 = "neura.gep"(%47, %54#1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.load"(%56) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %58 = "neura.mul"(%57, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %59 = "neura.gep"(%44, %53#1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %60 = "neura.load"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %61 = "neura.add"(%60, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%61, %59) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %62:2 = "neura.fused_op"(%52#1, %40, %38) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %98 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %99 = neura.grant_predicate %arg5, %98 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%98, %99 : !neura.data<i1, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>)
    %63:4 = "neura.fused_op"(%62#0, %52#1, %17#1, %36) <{frequency = 9 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->fused_op:phi_start->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %98 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %99 = neura.grant_predicate %arg4, %98 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %100 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %101 = neura.grant_predicate %100, %98 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %102 = neura.grant_predicate %100, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%98, %99, %101, %102 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %64:2 = "neura.fused_op"(%23, %33, %63#0) <{frequency = 22 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%98, %99 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %65:2 = "neura.fused_op"(%25, %34, %63#0) <{frequency = 22 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%98, %99 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %66:2 = "neura.fused_op"(%27, %35, %63#0) <{frequency = 22 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%98, %99 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    neura.ctrl_mov %63#1 -> %51 : !neura.data<i64, i1> !neura.data<i64, i1>
    %67 = neura.grant_predicate %50, %63#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %67 -> %49 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %68 = neura.grant_predicate %54#0, %63#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %68 -> %48 : !neura.data<i64, i1> !neura.data<i64, i1>
    %69 = neura.grant_predicate %47, %63#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %69 -> %46 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %70 = neura.grant_predicate %53#0, %63#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %70 -> %45 : !neura.data<i64, i1> !neura.data<i64, i1>
    %71 = neura.grant_predicate %44, %63#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %71 -> %43 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %72 = neura.grant_predicate %42, %63#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %72 -> %41 : !neura.data<i64, i1> !neura.data<i64, i1>
    %73 = neura.grant_predicate %40, %63#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %73 -> %39 : !neura.data<i64, i1> !neura.data<i64, i1>
    %74 = neura.grant_predicate %38, %63#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %74 -> %37 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %63#2 -> %36 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %66#1 -> %35 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %65#1 -> %34 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %64#1 -> %33 : !neura.data<i64, i1> !neura.data<i64, i1>
    %75 = neura.grant_predicate %42, %62#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %76 = neura.grant_predicate %40, %62#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %77 = "neura.add"(%62#1, %75) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78:3 = "neura.fused_op"(%77, %76, %63#3, %75) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:icmp->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %98 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %99 = neura.grant_predicate %arg5, %98 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %100 = neura.grant_predicate %arg6, %98 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%98, %99, %100 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %79:4 = "neura.fused_op"(%78#0, %77, %64#0, %62#0) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->fused_op:grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %98 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %99 = neura.grant_predicate %arg4, %98 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %100 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %101 = neura.grant_predicate %100, %98 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %102 = neura.grant_predicate %100, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%98, %99, %101, %102 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %80:2 = "neura.fused_op"(%44, %62#0, %79#0) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%98, %99 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %81:2 = "neura.fused_op"(%47, %62#0, %79#0) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%98, %99 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %82:2 = "neura.fused_op"(%65#0, %62#0, %79#0) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%98, %99 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %83:2 = "neura.fused_op"(%66#0, %62#0, %79#0) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%98, %99 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %84 = "neura.fused_op"(%53#0, %62#0, %79#0) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%99 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %79#1 -> %29 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %84 -> %28 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %83#1 -> %26 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %82#1 -> %24 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %79#2 -> %22 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %81#1 -> %21 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %80#1 -> %20 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %85 = neura.grant_predicate %75, %79#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %85 -> %19 : !neura.data<i64, i1> !neura.data<i64, i1>
    %86 = neura.grant_predicate %76, %79#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %86 -> %18 : !neura.data<i64, i1> !neura.data<i64, i1>
    %87 = neura.grant_predicate %63#3, %79#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %87 -> %16 : !neura.data<i64, i1> !neura.data<i64, i1>
    %88 = neura.grant_predicate %76, %78#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %89 = "neura.add"(%78#1, %78#2) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %90:2 = "neura.fused_op"(%89, %88) <{frequency = 20 : i64, pattern_id = 3 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %98 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %99 = neura.grant_predicate %98, %98 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%98, %99 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %91:3 = "neura.fused_op"(%90#0, %79#3, %78#2) <{frequency = 14 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:not->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %98 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %99 = neura.grant_predicate %arg4, %98 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %100 = neura.grant_predicate %arg5, %98 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%98, %99, %100 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %92 = "neura.fused_op"(%80#0, %78#0, %91#0) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%99 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %93 = "neura.fused_op"(%81#0, %78#0, %91#0) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%99 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %94 = "neura.fused_op"(%82#0, %78#0, %91#0) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%99 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %95 = "neura.fused_op"(%83#0, %78#0, %91#0) <{frequency = 24 : i64, pattern_id = 2 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %98 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %99 = neura.grant_predicate %98, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%99 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %96 = neura.grant_predicate %89, %91#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %96 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %94 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %91#1 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %95 -> %10 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %93 -> %9 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %92 -> %8 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %91#2 -> %7 : !neura.data<i64, i1> !neura.data<i64, i1>
    %97 = neura.grant_predicate %88, %91#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %97 -> %6 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %90#1 : !neura.data<i1, i1>
    neura.yield
  }
}

