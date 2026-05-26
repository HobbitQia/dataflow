#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3val(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3col(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3row(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE7feature(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE6output(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(7 : i16) : i16
    %2 = llvm.mlir.constant(1 : i16) : i16
    %3 = llvm.mlir.addressof @_ZZ4mainE3val : !llvm.ptr
    %4 = llvm.mlir.addressof @_ZZ4mainE3col : !llvm.ptr
    %5 = llvm.mlir.addressof @_ZZ4mainE3row : !llvm.ptr
    %6 = llvm.mlir.constant(1 : i64) : i64
    %7 = llvm.mlir.constant(1024 : i64) : i64
    %8 = llvm.mlir.constant(13 : i16) : i16
    %9 = llvm.mlir.addressof @_ZZ4mainE7feature : !llvm.ptr
    %10 = llvm.mlir.addressof @_ZZ4mainE6output : !llvm.ptr
    %11 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%12: i64):  // 2 preds: ^bb0, ^bb1
    %13 = llvm.trunc %12 : i64 to i32
    %14 = llvm.trunc %12 : i64 to i16
    %15 = llvm.urem %14, %1 : i16
    %16 = llvm.add %15, %2 overflow<nsw, nuw> : i16
    %17 = llvm.zext %16 : i16 to i32
    %18 = llvm.getelementptr inbounds %3[0, %12] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %17, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.getelementptr inbounds %4[0, %12] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %13, %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.getelementptr inbounds %5[0, %12] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %13, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.add %12, %6 overflow<nsw, nuw> : i64
    %22 = llvm.icmp "eq" %21, %7 : i64
    llvm.cond_br %22, ^bb2(%0 : i64), ^bb1(%21 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%23: i64):  // 2 preds: ^bb1, ^bb2
    %24 = llvm.trunc %23 : i64 to i16
    %25 = llvm.urem %24, %8 : i16
    %26 = llvm.zext %25 : i16 to i32
    %27 = llvm.getelementptr inbounds %9[0, %23] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %26, %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %28 = llvm.add %23, %6 overflow<nsw, nuw> : i64
    %29 = llvm.icmp "eq" %28, %7 : i64
    llvm.cond_br %29, ^bb3(%0 : i64), ^bb2(%28 : i64) {loop_annotation = #loop_annotation}
  ^bb3(%30: i64):  // 2 preds: ^bb2, ^bb3
    %31 = llvm.getelementptr inbounds %3[0, %30] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.getelementptr inbounds %4[0, %30] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %34 = llvm.load %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.sext %34 : i32 to i64
    %36 = llvm.getelementptr inbounds %9[0, %35] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %37 = llvm.load %36 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %38 = llvm.mul %37, %32 overflow<nsw> : i32
    %39 = llvm.getelementptr inbounds %5[0, %30] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.sext %40 : i32 to i64
    %42 = llvm.getelementptr inbounds %10[0, %41] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %43 = llvm.load %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.add %43, %38 overflow<nsw> : i32
    llvm.store %44, %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %45 = llvm.add %30, %6 overflow<nsw, nuw> : i64
    %46 = llvm.icmp "eq" %45, %7 : i64
    llvm.cond_br %46, ^bb4, ^bb3(%45 : i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %11 : i32
  }
  func.func @_Z6kernelPiS_S_S_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = neura.reserve : !neura.data<i64, i1>
    %1 = "neura.fused_op"(%0) <{frequency = 8 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %29 = "neura.grant_once"() <{constant_value = 1024 : i64}> : () -> !neura.data<i64, i1>
      %30 = neura.phi_start %29, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%30 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<i64, i1>
    %3 = "neura.fused_op"(%2) <{frequency = 8 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %29 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %30 = neura.phi_start %29, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%30 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %4 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %5 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %6 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %7 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %8 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = "neura.fused_op"(%9) <{frequency = 8 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %29 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %30 = neura.phi_start %29, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%30 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11:2 = "neura.fused_op"(%8, %10) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %29 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %30 = neura.phi_start %29, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %31 = "neura.gep"(%30, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %32 = "neura.load"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%30, %32 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %12:2 = "neura.fused_op"(%7, %10) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %29 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %30 = neura.phi_start %29, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %31 = "neura.gep"(%30, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %32 = "neura.load"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%30, %32 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %13:2 = "neura.fused_op"(%5, %10) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %29 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %30 = neura.phi_start %29, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %31 = "neura.gep"(%30, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %32 = "neura.load"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%30, %32 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %14 = neura.sext %12#1 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %15:2 = "neura.fused_op"(%6, %14) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %29 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %30 = neura.phi_start %29, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %31 = "neura.gep"(%30, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %32 = "neura.load"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%30, %32 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %16 = "neura.mul"(%15#1, %11#1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %17 = neura.sext %13#1 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %18:3 = "neura.fused_op"(%4, %17) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %29 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %30 = neura.phi_start %29, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %31 = "neura.gep"(%30, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %32 = "neura.load"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%30, %31, %32 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %19 = "neura.add"(%18#2, %16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%19, %18#1) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %20 = "neura.add"(%10, %3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21 = "neura.icmp"(%20, %1) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %22:4 = "neura.fused_op"(%21, %20, %3, %1) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i1, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %29 = "neura.not"(%arg5) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %30 = neura.grant_predicate %arg6, %29 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %31 = neura.grant_predicate %arg7, %29 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %32 = neura.grant_predicate %arg8, %29 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%29, %30, %31, %32 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    neura.ctrl_mov %22#1 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    %23 = neura.grant_predicate %11#0, %22#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %23 -> %8 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %24 = neura.grant_predicate %12#0, %22#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %24 -> %7 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %25 = neura.grant_predicate %15#0, %22#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %25 -> %6 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %26 = neura.grant_predicate %13#0, %22#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %26 -> %5 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %27 = neura.grant_predicate %18#0, %22#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %27 -> %4 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %22#2 -> %2 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %22#3 -> %0 : !neura.data<i64, i1> !neura.data<i64, i1>
    %28 = neura.grant_predicate %21, %21 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %28 : !neura.data<i1, i1>
    neura.yield
  }
}

