#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.mlir.global internal @_ZZ4mainE2x1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal @_ZZ4mainE2x2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal @_ZZ4mainE2y1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal @_ZZ4mainE2y2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
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
    %15 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    "llvm.intr.memset"(%3, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%4 : i64)
  ^bb1(%16: i64):  // 2 preds: ^bb0, ^bb1
    %17 = llvm.getelementptr inbounds %5[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %18 = llvm.trunc %16 : i64 to i32
    %19 = llvm.add %18, %6 : i32
    llvm.store %19, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.getelementptr inbounds %7[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %21 = llvm.trunc %16 : i64 to i32
    %22 = llvm.add %21, %8 : i32
    llvm.store %22, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %16, %9 overflow<nsw, nuw> : i64
    %24 = llvm.icmp "eq" %23, %10 : i64
    llvm.cond_br %24, ^bb2(%4 : i64), ^bb1(%23 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%25: i64):  // 2 preds: ^bb1, ^bb2
    %26 = llvm.trunc %25 : i64 to i32
    %27 = llvm.lshr %26, %11 : i32
    %28 = llvm.and %26, %12 : i32
    %29 = llvm.mul %27, %28 overflow<nsw, nuw> : i32
    %30 = llvm.and %29, %12 : i32
    %31 = llvm.getelementptr inbounds %13[0, %25] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    llvm.store %30, %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %32 = llvm.add %25, %9 overflow<nsw, nuw> : i64
    %33 = llvm.icmp "eq" %32, %14 : i64
    llvm.cond_br %33, ^bb3, ^bb2(%32 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %34 = func.call @_Z6kernelPiS_PKiS1_S1_(%0, %3, %13, %5, %7) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.void
    llvm.return %15 : i32
  }
  func.func @_Z6kernelPiS_PKiS1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 60 : i64}> : () -> !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %18 = "neura.fused_op"(%17) <{frequency = 5 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %110 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %111 = neura.phi_start %110, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%111 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = "neura.fused_op"(%19) <{frequency = 5 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %110 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %111 = neura.phi_start %110, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%111 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = "neura.fused_op"(%21) <{frequency = 5 : i64, pattern_id = 12 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>):
      %110 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %111 = neura.phi_start %110, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%111 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24:2 = "neura.fused_op"(%16, %23) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %110 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %111 = neura.phi_start %110, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %112 = neura.phi_start %110, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%111, %112 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %25 = "neura.gep"(%22, %24#1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %26 = "neura.shl"(%24#1, %20) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.gep"(%18, %24#1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = neura.reserve : !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %30 = neura.phi_start %18, %29 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %31 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %32 = neura.phi_start %22, %31 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = "neura.fused_op"(%7, %33) <{frequency = 9 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %110 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %111 = neura.phi_start %110, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %112 = neura.phi_start %111, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%112 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %35 = neura.reserve : !neura.data<i64, i1>
    %36 = "neura.fused_op"(%6, %8, %35) <{frequency = 15 : i64, pattern_id = 15 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %110 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %111 = neura.phi_start %110, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%111 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = "neura.fused_op"(%5, %9, %37) <{frequency = 15 : i64, pattern_id = 15 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %110 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %111 = neura.phi_start %110, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%111 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = "neura.fused_op"(%12, %41) <{frequency = 9 : i64, pattern_id = 11 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %110 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %111 = neura.phi_start %110, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %112 = neura.phi_start %111, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%112 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %44 = neura.phi_start %27, %43 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %47 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %48 = neura.phi_start %25, %47 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %49 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = neura.phi_start %24#1, %50 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %52 = neura.reserve : !neura.data<i64, i1>
    %53 = neura.phi_start %20, %52 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %54 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %55 = "neura.fused_op"(%0, %15, %54) <{frequency = 15 : i64, pattern_id = 15 : i64, pattern_name = "phi_start->phi_start"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %110 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %111 = neura.phi_start %110, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%111 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = neura.reserve : !neura.data<i64, i1>
    %57:2 = "neura.fused_op"(%24#0, %56, %38) <{frequency = 6 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %110 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %111 = "neura.add"(%110, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%110, %111 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %58:4 = "neura.fused_op"(%57#0, %36, %57#1, %55, %53) <{frequency = 15 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %110 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %111 = neura.grant_predicate %arg7, %110 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %112 = neura.grant_predicate %arg8, %110 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %113 = neura.grant_predicate %arg9, %110 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%110, %111, %112, %113 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    %59:2 = "neura.fused_op"(%4, %10, %39, %58#0) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i1, i1>):
      %110 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %111 = neura.phi_start %110, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %112 = neura.grant_predicate %111, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%111, %112 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %60:2 = "neura.fused_op"(%3, %11, %40, %58#0) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i1, i1>):
      %110 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %111 = neura.phi_start %110, %arg7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %112 = neura.grant_predicate %111, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%111, %112 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %61:2 = "neura.fused_op"(%1, %13, %46, %58#0) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i1, i1>):
      %110 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %111 = neura.phi_start %110, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %112 = neura.grant_predicate %111, %arg8 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%111, %112 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %62:2 = "neura.fused_op"(%2, %14, %49, %58#0) <{frequency = 6 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i1, i1>):
      %110 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %111 = neura.phi_start %110, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %112 = neura.grant_predicate %111, %arg8 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%111, %112 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %63:2 = "neura.fused_op"(%26, %45, %57#0) <{frequency = 6 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %110 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %111 = "neura.add"(%arg7, %110) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%110, %111 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %64:2 = "neura.fused_op"(%62#0, %63#1, %44, %61#0, %57#0) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %110 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %111 = "neura.load"(%110) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %112 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %113 = "neura.mul"(%112, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %114 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %116 = "neura.add"(%113, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%114, %116 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %65 = "neura.fused_op"(%57#0, %53, %51) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %110 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %111 = "neura.add"(%110, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%111 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66:2 = "neura.fused_op"(%62#0, %65, %48, %55, %57#0) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %110 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %111 = "neura.load"(%110) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %112 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %113 = "neura.mul"(%112, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %114 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %116 = "neura.add"(%113, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%114, %116 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%66#1, %66#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%64#1, %64#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %67 = "neura.or"(%57#0, %42) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = "neura.fused_op"(%67, %53, %51) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %110 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %111 = "neura.add"(%110, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%111 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69:2 = "neura.fused_op"(%62#0, %68, %48, %55, %67) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %110 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %111 = "neura.load"(%110) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %112 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %113 = "neura.mul"(%112, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %114 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %116 = "neura.add"(%113, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%114, %116 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%69#1, %69#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %70 = "neura.add"(%67, %63#0) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71:2 = "neura.fused_op"(%62#0, %70, %44, %61#0, %67) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %110 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %111 = "neura.load"(%110) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %112 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %113 = "neura.mul"(%112, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %114 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %116 = "neura.add"(%113, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%114, %116 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%71#1, %71#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %72 = "neura.or"(%57#0, %60#0) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %73 = "neura.fused_op"(%72, %53, %51) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %110 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %111 = "neura.add"(%110, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%111 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %74:2 = "neura.fused_op"(%62#0, %73, %48, %55, %72) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %110 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %111 = "neura.load"(%110) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %112 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %113 = "neura.mul"(%112, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %114 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %116 = "neura.add"(%113, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%114, %116 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%74#1, %74#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %75 = "neura.add"(%72, %63#0) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %76:2 = "neura.fused_op"(%62#0, %75, %44, %61#0, %72) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %110 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %111 = "neura.load"(%110) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %112 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %113 = "neura.mul"(%112, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %114 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %116 = "neura.add"(%113, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%114, %116 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%76#1, %76#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %77 = "neura.or"(%57#0, %59#0) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = "neura.fused_op"(%77, %53, %51) <{frequency = 4 : i64, pattern_id = 17 : i64, pattern_name = "shl->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %110 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %111 = "neura.add"(%110, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%111 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %79:2 = "neura.fused_op"(%62#0, %78, %48, %55, %77) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %110 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %111 = "neura.load"(%110) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %112 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %113 = "neura.mul"(%112, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %114 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %116 = "neura.add"(%113, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%114, %116 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%79#1, %79#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %80 = "neura.add"(%77, %63#0) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81:2 = "neura.fused_op"(%62#0, %80, %44, %61#0, %77) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:gep->load->fused_op:load->mul->fused_op:fused_op:gep->load->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %110 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %111 = "neura.load"(%110) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %112 = "neura.load"(%arg7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %113 = "neura.mul"(%112, %111) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %114 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %116 = "neura.add"(%113, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%114, %116 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%81#1, %81#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %82:3 = "neura.fused_op"(%58#0, %51, %42) <{frequency = 6 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:not->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %110 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %111 = neura.grant_predicate %arg6, %110 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %112 = neura.grant_predicate %arg7, %110 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%110, %111, %112 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %83:2 = "neura.fused_op"(%24#0, %28, %58#0) <{frequency = 31 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i1, i1>):
      %110 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %111 = neura.grant_predicate %110, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%110, %111 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    neura.ctrl_mov %58#1 -> %56 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %58#2 -> %54 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %58#3 -> %52 : !neura.data<i64, i1> !neura.data<i64, i1>
    %84 = neura.grant_predicate %51, %58#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %84 -> %50 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %62#1 -> %49 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %85 = neura.grant_predicate %48, %58#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %85 -> %47 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %61#1 -> %46 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %86 = neura.grant_predicate %63#0, %58#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %86 -> %45 : !neura.data<i64, i1> !neura.data<i64, i1>
    %87 = neura.grant_predicate %44, %58#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %87 -> %43 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %88 = neura.grant_predicate %42, %58#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %88 -> %41 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %60#1 -> %40 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %59#1 -> %39 : !neura.data<i64, i1> !neura.data<i64, i1>
    %89 = neura.grant_predicate %38, %58#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %89 -> %37 : !neura.data<i64, i1> !neura.data<i64, i1>
    %90 = neura.grant_predicate %36, %58#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %90 -> %35 : !neura.data<i64, i1> !neura.data<i64, i1>
    %91 = neura.grant_predicate %34, %58#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %91 -> %33 : !neura.data<i64, i1> !neura.data<i64, i1>
    %92 = neura.grant_predicate %32, %58#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %92 -> %31 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %93 = neura.grant_predicate %30, %58#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %93 -> %29 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %83#1 -> %28 : !neura.data<i64, i1> !neura.data<i64, i1>
    %94 = neura.grant_predicate %34, %82#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %95 = neura.grant_predicate %83#0, %82#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %96 = "neura.add"(%82#1, %82#2) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %97:2 = "neura.fused_op"(%96, %94) <{frequency = 20 : i64, pattern_id = 4 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %110 = "neura.icmp"(%arg5, %arg6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %111 = neura.grant_predicate %110, %110 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%110, %111 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %98:4 = "neura.fused_op"(%97#0, %95, %96, %36, %82#0) <{frequency = 20 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i1, i1>):
      %110 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %111 = neura.grant_predicate %arg6, %110 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %112 = neura.grant_predicate %arg7, %110 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %113 = neura.grant_predicate %arg8, %arg9 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %114 = neura.grant_predicate %113, %110 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%110, %111, %112, %114 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %99 = "neura.fused_op"(%38, %82#0, %98#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %110 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %111 = neura.grant_predicate %110, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%111 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %100 = "neura.fused_op"(%59#0, %82#0, %98#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %110 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %111 = neura.grant_predicate %110, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%111 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %101 = "neura.fused_op"(%60#0, %82#0, %98#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %110 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %111 = neura.grant_predicate %110, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%111 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %102 = "neura.fused_op"(%61#0, %82#0, %98#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %110 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %111 = neura.grant_predicate %110, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%111 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.fused_op"(%62#0, %82#0, %98#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %110 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %111 = neura.grant_predicate %110, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%111 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %104 = "neura.fused_op"(%55, %82#0, %98#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %110 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %111 = neura.grant_predicate %110, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%111 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %105 = "neura.fused_op"(%30, %82#0, %98#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %110 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %111 = neura.grant_predicate %110, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%111 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %106 = "neura.fused_op"(%53, %82#0, %98#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %110 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %111 = neura.grant_predicate %110, %arg7 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%111 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %107 = "neura.fused_op"(%32, %82#0, %98#0) <{frequency = 13 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i1, i1>):
      %110 = neura.grant_predicate %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %111 = neura.grant_predicate %110, %arg7 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%111 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %98#2 -> %23 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %107 -> %21 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %106 -> %19 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %105 -> %17 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %98#1 -> %16 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %104 -> %15 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %103 -> %14 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %102 -> %13 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %108 = neura.grant_predicate %82#2, %98#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %108 -> %12 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %101 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %100 -> %10 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %99 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %98#3 -> %8 : !neura.data<i64, i1> !neura.data<i64, i1>
    %109 = neura.grant_predicate %94, %98#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %109 -> %7 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %97#1 : !neura.data<i1, i1>
    neura.yield
  }
}

