#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1x(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1y(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE1x : !llvm.ptr
    %2 = llvm.mlir.constant(7 : i16) : i16
    %3 = llvm.mlir.addressof @_ZZ4mainE1y : !llvm.ptr
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(1024 : i64) : i64
    %6 = llvm.mlir.constant(3 : i32) : i32
    %7 = llvm.mlir.constant(2 : i64) : i64
    %8 = llvm.mlir.constant(1022 : i64) : i64
    %9 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb1
    %11 = llvm.trunc %10 : i64 to i32
    %12 = llvm.getelementptr inbounds %1[0, %10] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %11, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %13 = llvm.trunc %10 : i64 to i16
    %14 = llvm.urem %13, %2 : i16
    %15 = llvm.zext %14 : i16 to i32
    %16 = llvm.getelementptr inbounds %3[0, %10] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %15, %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.add %10, %4 overflow<nsw, nuw> : i64
    %18 = llvm.icmp "eq" %17, %5 : i64
    llvm.cond_br %18, ^bb2(%0 : i64), ^bb1(%17 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%19: i64):  // 2 preds: ^bb1, ^bb2
    %20 = llvm.getelementptr inbounds %1[0, %19] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %21 = llvm.load %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.mul %21, %6 overflow<nsw> : i32
    %23 = llvm.getelementptr inbounds %3[0, %19] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %24 = llvm.load %23 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.add %22, %24 overflow<nsw> : i32
    llvm.store %25, %23 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %26 = llvm.or %19, %4 : i64
    %27 = llvm.getelementptr inbounds %1[0, %26] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %28 = llvm.load %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.mul %28, %6 overflow<nsw> : i32
    %30 = llvm.getelementptr inbounds %3[0, %26] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %31 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %32 = llvm.add %29, %31 overflow<nsw> : i32
    llvm.store %32, %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.add %19, %7 overflow<nsw, nuw> : i64
    %34 = llvm.icmp "ult" %19, %8 : i64
    llvm.cond_br %34, ^bb2(%33 : i64), ^bb3 {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.return %9 : i32
  }
  func.func @_Z6kernelPKiPi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 3 : i32}> : () -> !neura.data<i32, i1>
    %3 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 1022 : i64}> : () -> !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = neura.phi_start %5, %6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.phi_start %4, %8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.phi_start %3, %10 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<i32, i1>
    %14 = neura.phi_start %2, %13 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = "neura.fused_op"(%16) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %34 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %35 = neura.phi_start %34, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%35 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18:2 = "neura.fused_op"(%0, %15, %17) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %34 = neura.phi_start %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %35 = "neura.gep"(%34, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %36 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%34, %36 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %19:3 = "neura.fused_op"(%1, %12, %17) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %34 = neura.phi_start %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %35 = "neura.gep"(%34, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %36 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%34, %35, %36 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %20 = "neura.mul"(%18#1, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %21 = "neura.add"(%20, %19#2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%21, %19#1) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %22 = "neura.or"(%17, %11) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23:2 = "neura.fused_op"(%19#0, %22) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %34 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %35 = "neura.load"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%34, %35 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %24 = "neura.fused_op"(%18#0, %22) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %34 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %35 = "neura.load"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%35 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %25 = "neura.mul"(%24, %14) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %26 = "neura.add"(%25, %23#1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%26, %23#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %27 = "neura.add"(%17, %9) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28:5 = "neura.fused_op"(%17, %7, %27, %9, %18#0) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %34 = "neura.icmp"(%arg2, %arg3) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %35 = neura.grant_predicate %arg4, %34 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %36 = neura.grant_predicate %arg5, %34 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %37 = neura.grant_predicate %arg3, %34 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %38 = neura.grant_predicate %arg6, %34 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%34, %35, %36, %37, %38 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %29 = "neura.not"(%28#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %28#1 -> %16 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %28#4 -> %15 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %30 = neura.grant_predicate %14, %28#0 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %30 -> %13 : !neura.data<i32, i1> !neura.data<i32, i1>
    %31 = neura.grant_predicate %19#0, %28#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %31 -> %12 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %32 = neura.grant_predicate %11, %28#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %32 -> %10 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %28#2 -> %8 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %28#3 -> %6 : !neura.data<i64, i1> !neura.data<i64, i1>
    %33 = neura.grant_predicate %29, %29 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %33 : !neura.data<i1, i1>
    neura.yield
  }
}

