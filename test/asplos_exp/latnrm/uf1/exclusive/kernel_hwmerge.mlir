#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr constant @_ZZ4mainE11coefficient(dense<[25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560]> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<16 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5state(dense<0> : tensor<12xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<12 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(8 : i64) : i64
    %2 = llvm.mlir.constant(2 : i64) : i64
    %3 = llvm.mlir.addressof @_ZZ4mainE11coefficient : !llvm.ptr
    %4 = llvm.mlir.constant(0 : i64) : i64
    %5 = llvm.mlir.constant(1 : i64) : i64
    %6 = llvm.mlir.addressof @_ZZ4mainE5state : !llvm.ptr
    %7 = llvm.mlir.constant(12 : i64) : i64
    %8 = llvm.getelementptr inbounds %6[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<12 x i32>
    llvm.br ^bb1(%4 : i64)
  ^bb1(%9: i64):  // 2 preds: ^bb0, ^bb1
    %10 = llvm.add %9, %5 overflow<nsw, nuw> : i64
    %11 = llvm.getelementptr inbounds %6[0, %9] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %12 = llvm.trunc %10 : i64 to i32
    llvm.store %12, %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %13 = llvm.icmp "eq" %10, %7 : i64
    llvm.cond_br %13, ^bb2, ^bb1(%10 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %14 = llvm.load %6 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %15 = llvm.load %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb3(%15, %14, %4 : i32, i32, i64)
  ^bb3(%16: i32, %17: i32, %18: i64):  // 2 preds: ^bb2, ^bb3
    %19 = llvm.shl %18, %5 overflow<nsw, nuw> : i64
    %20 = llvm.getelementptr inbounds %3[0, %19] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %21 = llvm.load %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.or %19, %5 : i64
    %23 = llvm.getelementptr inbounds %3[0, %22] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %24 = llvm.load %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.add %18, %2 overflow<nsw, nuw> : i64
    %26 = llvm.getelementptr inbounds %6[0, %25] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %27 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %16, %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %28 = llvm.mul %24, %17 overflow<nsw> : i32
    %29 = llvm.mul %27, %21 overflow<nsw> : i32
    %30 = llvm.sub %28, %29 overflow<nsw> : i32
    llvm.store %30, %6 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %31 = llvm.mul %27, %24 overflow<nsw> : i32
    %32 = llvm.mul %21, %17 overflow<nsw> : i32
    %33 = llvm.add %31, %32 overflow<nsw> : i32
    llvm.store %33, %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %34 = llvm.add %18, %5 overflow<nsw, nuw> : i64
    %35 = llvm.icmp "eq" %34, %1 : i64
    llvm.cond_br %35, ^bb4, ^bb3(%33, %30, %34 : i32, i32, i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %0 : i32
  }
  func.func @_Z6kernelPiPKi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 8 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %7:2 = "neura.fused_op"(%1, %6) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %44 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.load"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%44, %45 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %8 = "neura.grant_once"(%7#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %9 = "neura.load"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.phi_start %5, %10 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.phi_start %8, %12 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.phi_start %4, %15 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.phi_start %3, %18 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = "neura.fused_op"(%20) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %44 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %45 = neura.phi_start %44, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%45 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = neura.reserve : !neura.data<i32, i1>
    %23 = "neura.fused_op"(%9, %22) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>):
      %44 = "neura.grant_once"(%arg2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %45 = neura.phi_start %44, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%45 : !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %24 = neura.reserve : !neura.data<i32, i1>
    %25 = "neura.fused_op"(%7#1, %24) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>):
      %44 = "neura.grant_once"(%arg2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %45 = neura.phi_start %44, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%45 : !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %26 = "neura.shl"(%21, %19) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.or"(%26, %19) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28:3 = "neura.fused_op"(%2, %17, %27, %23) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "phi_start->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i32, i1>):
      %44 = neura.phi_start %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.gep"(%44, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %47 = "neura.mul"(%arg5, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%44, %46, %47 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %29 = "neura.add"(%21, %16) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30:4 = "neura.fused_op"(%0, %14, %29, %28#1) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "phi_start->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i32, i1>):
      %44 = neura.phi_start %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.gep"(%44, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %47 = "neura.mul"(%46, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%44, %45, %46, %47 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %31:2 = "neura.fused_op"(%28#0, %26, %30#2) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i32, i1>):
      %44 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.load"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %46 = "neura.mul"(%arg4, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%45, %46 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    "neura.store"(%25, %30#1) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %32 = "neura.sub"(%28#2, %31#1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%32, %30#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %33 = "neura.mul"(%23, %31#0) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %34 = "neura.add"(%30#3, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%34, %13) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %35 = "neura.add"(%21, %19) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = "neura.icmp"(%35, %11) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %37:5 = "neura.fused_op"(%36, %35, %19, %34, %32) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>):
      %44 = "neura.not"(%arg2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %45 = neura.grant_predicate %arg3, %44 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %46 = neura.grant_predicate %arg4, %44 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %47 = neura.grant_predicate %arg5, %44 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %48 = neura.grant_predicate %arg6, %44 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%44, %45, %46, %47, %48 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    neura.ctrl_mov %37#3 -> %24 : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %37#4 -> %22 : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %37#1 -> %20 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %37#2 -> %18 : !neura.data<i64, i1> !neura.data<i64, i1>
    %38 = neura.grant_predicate %28#0, %37#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %38 -> %17 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %39 = neura.grant_predicate %16, %37#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %39 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %40 = neura.grant_predicate %30#0, %37#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %40 -> %14 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %41 = neura.grant_predicate %13, %37#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %41 -> %12 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %42 = neura.grant_predicate %11, %37#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %42 -> %10 : !neura.data<i64, i1> !neura.data<i64, i1>
    %43 = neura.grant_predicate %36, %36 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %43 : !neura.data<i1, i1>
    neura.yield
  }
}

