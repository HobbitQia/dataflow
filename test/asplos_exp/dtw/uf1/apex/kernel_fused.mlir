#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1S(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<512 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1T(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<512 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3DTW(dense<0> : tensor<263169xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<263169 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.addressof @_ZZ4mainE1S : !llvm.ptr
    %3 = llvm.mlir.addressof @_ZZ4mainE1T : !llvm.ptr
    %4 = llvm.mlir.constant(3 : i32) : i32
    %5 = llvm.mlir.constant(512 : i64) : i64
    %6 = llvm.mlir.addressof @_ZZ4mainE3DTW : !llvm.ptr
    %7 = llvm.mlir.constant(65535 : i32) : i32
    %8 = llvm.mlir.constant(263169 : i64) : i64
    %9 = llvm.mlir.constant(0 : i32) : i32
    %10 = llvm.mlir.constant(513 : i64) : i64
    %11 = llvm.mlir.constant(-513 : i64) : i64
    %12 = llvm.mlir.constant(-1 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb1
    %14 = llvm.add %13, %1 overflow<nsw, nuw> : i64
    %15 = llvm.getelementptr inbounds %2[0, %13] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %16 = llvm.trunc %14 : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.getelementptr inbounds %3[0, %13] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %18 = llvm.trunc %13 : i64 to i32
    %19 = llvm.add %18, %4 : i32
    llvm.store %19, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.icmp "eq" %14, %5 : i64
    llvm.cond_br %20, ^bb2(%0 : i64), ^bb1(%14 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%21: i64):  // 2 preds: ^bb1, ^bb2
    %22 = llvm.getelementptr inbounds %6[0, %21] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %7, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %21, %1 overflow<nsw, nuw> : i64
    %24 = llvm.icmp "eq" %23, %8 : i64
    llvm.cond_br %24, ^bb3, ^bb2(%23 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.store %9, %6 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb4(%1 : i64)
  ^bb4(%25: i64):  // 2 preds: ^bb3, ^bb6
    %26 = llvm.getelementptr inbounds %2[0, %25] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %27 = llvm.mul %25, %10 overflow<nsw, nuw> : i64
    %28 = llvm.add %27, %10 overflow<nsw, nuw> : i64
    %29 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb5(%1 : i64)
  ^bb5(%30: i64):  // 2 preds: ^bb4, ^bb5
    %31 = llvm.getelementptr inbounds %3[0, %30] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.sub %29, %32 overflow<nsw> : i32
    %34 = llvm.sub %32, %29 overflow<nsw> : i32
    %35 = llvm.icmp "sgt" %34, %33 : i32
    %36 = llvm.select %35, %34, %33 : i1, i32
    %37 = llvm.add %30, %27 overflow<nsw, nuw> : i64
    %38 = llvm.add %37, %11 overflow<nsw> : i64
    %39 = llvm.getelementptr inbounds %6[0, %38] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.getelementptr inbounds %6[0, %37] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %42 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.add %37, %12 overflow<nsw> : i64
    %44 = llvm.getelementptr inbounds %6[0, %43] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %45 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.icmp "slt" %42, %40 : i32
    %47 = llvm.select %46, %42, %40 : i1, i32
    %48 = llvm.icmp "slt" %45, %47 : i32
    %49 = llvm.select %48, %45, %47 : i1, i32
    %50 = llvm.add %49, %36 overflow<nsw> : i32
    %51 = llvm.add %30, %1 overflow<nsw, nuw> : i64
    %52 = llvm.add %28, %51 overflow<nsw, nuw> : i64
    %53 = llvm.getelementptr inbounds %6[0, %52] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %50, %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %54 = llvm.icmp "eq" %51, %5 : i64
    llvm.cond_br %54, ^bb6, ^bb5(%51 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    %55 = llvm.add %25, %1 overflow<nsw, nuw> : i64
    %56 = llvm.icmp "eq" %55, %5 : i64
    llvm.cond_br %56, ^bb7, ^bb4(%55 : i64) {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    llvm.return %9 : i32
  }
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = neura.reserve : !neura.data<i64, i1>
    %1 = neura.reserve : !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6:2 = "neura.fused_op"(%5) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %71 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %72 = neura.phi_start %71, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%71, %72 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = "neura.fused_op"(%7) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %71 = "neura.grant_once"() <{constant_value = 513 : i64}> : () -> !neura.data<i64, i1>
      %72 = neura.phi_start %71, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%72 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %10 = "neura.fused_op"(%9) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %72 = neura.phi_start %71, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12:2 = "neura.fused_op"(%6#0, %11, %8) <{frequency = 2 : i64, pattern_id = 18 : i64, pattern_name = "phi_start->mul"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %71 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %72 = "neura.mul"(%71, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%71, %72 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %13 = "neura.gep"(%10, %12#0) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %14 = "neura.add"(%12#1, %8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = "neura.fused_op"(%0, %18) <{frequency = 7 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %71 = "neura.grant_once"() <{constant_value = 512 : i64}> : () -> !neura.data<i64, i1>
      %72 = neura.phi_start %71, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %73 = neura.phi_start %72, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%73 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = neura.phi_start %6#1, %21 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = "neura.fused_op"(%1, %23) <{frequency = 7 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %71 = "neura.grant_once"() <{constant_value = -1 : i64}> : () -> !neura.data<i64, i1>
      %72 = neura.phi_start %71, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %73 = neura.phi_start %72, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%73 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %26 = "neura.fused_op"(%2, %25) <{frequency = 7 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %72 = neura.phi_start %71, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %73 = neura.phi_start %72, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%73 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %27 = neura.reserve : !neura.data<i64, i1>
    %28 = "neura.fused_op"(%3, %27) <{frequency = 7 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %71 = "neura.grant_once"() <{constant_value = -513 : i64}> : () -> !neura.data<i64, i1>
      %72 = neura.phi_start %71, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %73 = neura.phi_start %72, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%73 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = neura.phi_start %12#1, %29 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %32 = "neura.fused_op"(%4, %31) <{frequency = 7 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %72 = neura.phi_start %71, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %73 = neura.phi_start %72, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%73 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %34 = neura.phi_start %13, %33 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %35 = neura.reserve : !neura.data<i64, i1>
    %36:3 = "neura.fused_op"(%6#1, %35, %30, %26) <{frequency = 9 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->fused_op:add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %71 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %72 = "neura.add"(%71, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %73 = "neura.gep"(%arg6, %72) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%71, %72, %73 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %37 = "neura.fused_op"(%36#1, %24, %26) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->gep->load"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %72 = "neura.gep"(%arg5, %71) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %73 = "neura.load"(%72) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%73 : !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %38 = "neura.fused_op"(%36#1, %28, %26) <{frequency = 3 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->gep->load"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %72 = "neura.gep"(%arg5, %71) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %73 = "neura.load"(%72) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%73 : !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %39 = "neura.fused_op"(%36#2, %38) <{frequency = 3 : i64, pattern_id = 13 : i64, pattern_name = "load->fused_op:icmp->sel"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i32, i1>):
      %71 = "neura.load"(%arg3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %72 = "neura.icmp"(%71, %arg4) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %73 = "neura.sel"(%72, %71, %arg4) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%73 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %40:4 = "neura.fused_op"(%36#0, %22, %19) <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->icmp->fused_op:not->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %71 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %72 = "neura.icmp"(%71, %arg5) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %73 = "neura.not"(%72) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %74 = neura.grant_predicate %71, %73 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%71, %72, %73, %74 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>)
    %41:2 = "neura.fused_op"(%14, %20, %40#0, %26) <{frequency = 9 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->fused_op:add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %71 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %72 = "neura.add"(%71, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %73 = "neura.gep"(%arg6, %72) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%71, %73 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %42:2 = "neura.fused_op"(%8, %15, %40#2, %40#1) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:phi_start->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>, %arg6: !neura.data<i1, i1>):
      %71 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %72 = neura.grant_predicate %71, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %73 = neura.grant_predicate %71, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%72, %73 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %43:2 = "neura.fused_op"(%10, %16, %40#2, %40#1) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:phi_start->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>, %arg6: !neura.data<i1, i1>):
      %71 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %72 = neura.grant_predicate %71, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %73 = neura.grant_predicate %71, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72, %73 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %44:2 = "neura.fused_op"(%12#0, %17, %40#2, %40#1) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:phi_start->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>, %arg6: !neura.data<i1, i1>):
      %71 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %72 = neura.grant_predicate %71, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %73 = neura.grant_predicate %71, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%72, %73 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %45 = "neura.fused_op"(%32, %36#0) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %71 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %72 = "neura.load"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %46:2 = "neura.fused_op"(%34, %45) <{frequency = 4 : i64, pattern_id = 13 : i64, pattern_name = "load->sub"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i32, i1>):
      %71 = "neura.load"(%arg3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %72 = "neura.sub"(%71, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%71, %72 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %47 = "neura.sub"(%45, %46#0) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48 = "neura.fused_op"(%47, %46#1) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "icmp->sel"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>):
      %71 = "neura.icmp"(%arg3, %arg4) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %72 = "neura.sel"(%71, %arg3, %arg4) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.fused_op"(%37, %39, %48) <{frequency = 2 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:icmp->sel->add"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>):
      %71 = "neura.icmp"(%arg3, %arg4) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %72 = "neura.sel"(%71, %arg3, %arg4) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %73 = "neura.add"(%72, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%73 : !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%49, %41#1) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    neura.ctrl_mov %40#3 -> %35 : !neura.data<i64, i1> !neura.data<i64, i1>
    %50 = neura.grant_predicate %34, %40#2 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %50 -> %33 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %51 = neura.grant_predicate %32, %40#2 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %51 -> %31 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %52 = neura.grant_predicate %30, %40#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %52 -> %29 : !neura.data<i64, i1> !neura.data<i64, i1>
    %53 = neura.grant_predicate %28, %40#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %53 -> %27 : !neura.data<i64, i1> !neura.data<i64, i1>
    %54 = neura.grant_predicate %26, %40#2 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %54 -> %25 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %55 = neura.grant_predicate %24, %40#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %55 -> %23 : !neura.data<i64, i1> !neura.data<i64, i1>
    %56 = neura.grant_predicate %22, %40#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %56 -> %21 : !neura.data<i64, i1> !neura.data<i64, i1>
    %57 = neura.grant_predicate %41#0, %40#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %57 -> %20 : !neura.data<i64, i1> !neura.data<i64, i1>
    %58 = neura.grant_predicate %19, %40#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %58 -> %18 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %44#0 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %43#0 -> %16 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %42#0 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %59 = neura.grant_predicate %22, %40#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %60 = neura.grant_predicate %19, %40#1 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %61:4 = "neura.fused_op"(%44#1, %59, %60) <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:add->icmp->fused_op:not->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %71 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %72 = "neura.icmp"(%71, %arg5) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %73 = "neura.not"(%72) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %74 = neura.grant_predicate %arg4, %73 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%71, %72, %73, %74 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>)
    %62 = "neura.fused_op"(%24, %40#1, %61#2) <{frequency = 7 : i64, pattern_id = 12 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %71 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %72 = neura.grant_predicate %71, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%72 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %63 = "neura.fused_op"(%26, %40#1, %61#2) <{frequency = 7 : i64, pattern_id = 12 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %71 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %72 = neura.grant_predicate %71, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %64 = "neura.fused_op"(%28, %40#1, %61#2) <{frequency = 7 : i64, pattern_id = 12 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %71 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %72 = neura.grant_predicate %71, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%72 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %65 = "neura.fused_op"(%32, %40#1, %61#2) <{frequency = 7 : i64, pattern_id = 12 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %71 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %72 = neura.grant_predicate %71, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %66 = neura.grant_predicate %61#0, %61#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %66 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %67 = neura.grant_predicate %43#1, %61#2 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %67 -> %9 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %68 = neura.grant_predicate %42#1, %61#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %68 -> %7 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %61#3 -> %5 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %65 -> %4 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %64 -> %3 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %63 -> %2 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %62 -> %1 : !neura.data<i64, i1> !neura.data<i64, i1>
    %69 = neura.grant_predicate %60, %61#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %69 -> %0 : !neura.data<i64, i1> !neura.data<i64, i1>
    %70 = neura.grant_predicate %61#1, %61#1 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %70 : !neura.data<i1, i1>
    neura.yield
  }
}

