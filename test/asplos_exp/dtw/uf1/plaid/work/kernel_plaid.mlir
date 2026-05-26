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
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 513 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = -513 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = -1 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 512 : i64}> : () -> !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.phi_start %7, %8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.phi_start %6, %10 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.phi_start %2, %12 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.phi_start %5, %14 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = neura.phi_start %1, %16 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.phi_start %3, %18 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = neura.phi_start %4, %20 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %22 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %23 = neura.phi_start %0, %22 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.phi_start %3, %24 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %26 = "neura.gep"(%23, %25) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %27 = "neura.mul"(%25, %21) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.add"(%27, %21) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = neura.phi_start %21, %29 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %32 = neura.phi_start %23, %31 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = neura.phi_start %25, %33 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %35 = neura.reserve : !neura.data<i64, i1>
    %36 = neura.phi_start %9, %35 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = neura.phi_start %28, %37 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = neura.phi_start %19, %39 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = neura.phi_start %11, %41 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %43 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %44 = neura.phi_start %13, %43 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = neura.phi_start %15, %45 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = neura.phi_start %27, %47 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %49 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %50 = neura.phi_start %17, %49 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %51 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %52 = neura.phi_start %26, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %53 = neura.reserve : !neura.data<i64, i1>
    %54 = neura.phi_start %19, %53 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %55 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %plaid_fused_0:2 = "neura.fused_op"(%50, %54, %55) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:gep->load->sub"}> ({
    ^bb0(%plaid_arg1_0: !neura.data<!llvm.ptr, i1>, %plaid_arg1_1: !neura.data<i64, i1>, %plaid_arg1_2: !neura.data<i32, i1>):
      %56 = "neura.gep"(%plaid_arg1_0, %plaid_arg1_1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %57 = "neura.load"(%56) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %58 = "neura.sub"(%plaid_arg1_2, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%57, %58 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %plaid_fused_1 = "neura.fused_op"(%plaid_fused_0#0, %55, %plaid_fused_0#1) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:sub->icmp->sel"}> ({
    ^bb0(%plaid_arg2_0: !neura.data<i32, i1>, %plaid_arg2_1: !neura.data<i32, i1>, %plaid_arg2_2: !neura.data<i32, i1>):
      %59 = "neura.sub"(%plaid_arg2_0, %plaid_arg2_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %60 = "neura.icmp"(%59, %plaid_arg2_2) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %61 = "neura.sel"(%60, %59, %plaid_arg2_2) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%61 : !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %plaid_fused_2:2 = "neura.fused_op"(%54, %48, %46, %44) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->add->gep"}> ({
    ^bb0(%plaid_arg3_0: !neura.data<i64, i1>, %plaid_arg3_1: !neura.data<i64, i1>, %plaid_arg3_2: !neura.data<i64, i1>, %plaid_arg3_3: !neura.data<!llvm.ptr, i1>):
      %62 = "neura.add"(%plaid_arg3_0, %plaid_arg3_1) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %63 = "neura.add"(%62, %plaid_arg3_2) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %64 = "neura.gep"(%plaid_arg3_3, %63) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%62, %64 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %65 = "neura.load"(%plaid_fused_2#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %66 = "neura.gep"(%44, %plaid_fused_2#0) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %67 = "neura.load"(%66) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %plaid_fused_3 = "neura.fused_op"(%plaid_fused_2#0, %42, %44) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.unicast:add->gep->load"}> ({
    ^bb0(%plaid_arg4_0: !neura.data<i64, i1>, %plaid_arg4_1: !neura.data<i64, i1>, %plaid_arg4_2: !neura.data<!llvm.ptr, i1>):
      %68 = "neura.add"(%plaid_arg4_0, %plaid_arg4_1) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %69 = "neura.gep"(%plaid_arg4_2, %68) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %70 = "neura.load"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%70 : !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %plaid_fused_4:2 = "neura.fused_op"(%67, %65, %plaid_fused_3) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:icmp->sel->icmp"}> ({
    ^bb0(%plaid_arg5_0: !neura.data<i32, i1>, %plaid_arg5_1: !neura.data<i32, i1>, %plaid_arg5_2: !neura.data<i32, i1>):
      %71 = "neura.icmp"(%plaid_arg5_0, %plaid_arg5_1) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %72 = "neura.sel"(%71, %plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %73 = "neura.icmp"(%plaid_arg5_2, %72) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      neura.yield results(%72, %73 : !neura.data<i32, i1>, !neura.data<i1, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i1, i1>)
    %74 = "neura.sel"(%plaid_fused_4#1, %plaid_fused_3, %plaid_fused_4#0) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %75 = "neura.add"(%74, %plaid_fused_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %plaid_fused_5:2 = "neura.fused_op"(%54, %40, %38, %44) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.unicast:add->add->gep"}> ({
    ^bb0(%plaid_arg6_0: !neura.data<i64, i1>, %plaid_arg6_1: !neura.data<i64, i1>, %plaid_arg6_2: !neura.data<i64, i1>, %plaid_arg6_3: !neura.data<!llvm.ptr, i1>):
      %76 = "neura.add"(%plaid_arg6_0, %plaid_arg6_1) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %77 = "neura.add"(%plaid_arg6_2, %76) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %78 = "neura.gep"(%plaid_arg6_3, %77) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%76, %78 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    "neura.store"(%75, %plaid_fused_5#1) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %79 = "neura.icmp"(%plaid_fused_5#0, %36) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %80 = "neura.not"(%79) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %81 = neura.grant_predicate %plaid_fused_5#0, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %81 -> %53 : !neura.data<i64, i1> !neura.data<i64, i1>
    %82 = neura.grant_predicate %52, %80 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %82 -> %51 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %83 = neura.grant_predicate %50, %80 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %83 -> %49 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %84 = neura.grant_predicate %48, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %84 -> %47 : !neura.data<i64, i1> !neura.data<i64, i1>
    %85 = neura.grant_predicate %46, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %85 -> %45 : !neura.data<i64, i1> !neura.data<i64, i1>
    %86 = neura.grant_predicate %44, %80 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %86 -> %43 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %87 = neura.grant_predicate %42, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %87 -> %41 : !neura.data<i64, i1> !neura.data<i64, i1>
    %88 = neura.grant_predicate %40, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %88 -> %39 : !neura.data<i64, i1> !neura.data<i64, i1>
    %89 = neura.grant_predicate %38, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %89 -> %37 : !neura.data<i64, i1> !neura.data<i64, i1>
    %90 = neura.grant_predicate %36, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %90 -> %35 : !neura.data<i64, i1> !neura.data<i64, i1>
    %91 = neura.grant_predicate %34, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %91 -> %33 : !neura.data<i64, i1> !neura.data<i64, i1>
    %92 = neura.grant_predicate %32, %80 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %92 -> %31 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %93 = neura.grant_predicate %30, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %93 -> %29 : !neura.data<i64, i1> !neura.data<i64, i1>
    %94 = neura.grant_predicate %34, %79 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %95 = neura.grant_predicate %40, %79 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %96 = neura.grant_predicate %36, %79 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %97 = neura.grant_predicate %32, %79 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %98 = neura.grant_predicate %30, %79 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %99 = neura.grant_predicate %50, %79 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %100 = neura.grant_predicate %46, %79 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %101 = neura.grant_predicate %44, %79 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %102 = neura.grant_predicate %42, %79 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %plaid_fused_6:3 = "neura.fused_op"(%94, %95, %96) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.unicast:add->icmp->not"}> ({
    ^bb0(%plaid_arg7_0: !neura.data<i64, i1>, %plaid_arg7_1: !neura.data<i64, i1>, %plaid_arg7_2: !neura.data<i64, i1>):
      %103 = "neura.add"(%plaid_arg7_0, %plaid_arg7_1) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %104 = "neura.icmp"(%103, %plaid_arg7_2) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %105 = "neura.not"(%104) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      neura.yield results(%103, %104, %105 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %106 = neura.grant_predicate %plaid_fused_6#0, %plaid_fused_6#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %106 -> %24 : !neura.data<i64, i1> !neura.data<i64, i1>
    %107 = neura.grant_predicate %97, %plaid_fused_6#2 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %107 -> %22 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %108 = neura.grant_predicate %98, %plaid_fused_6#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %108 -> %20 : !neura.data<i64, i1> !neura.data<i64, i1>
    %109 = neura.grant_predicate %95, %plaid_fused_6#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %109 -> %18 : !neura.data<i64, i1> !neura.data<i64, i1>
    %110 = neura.grant_predicate %99, %plaid_fused_6#2 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %110 -> %16 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %111 = neura.grant_predicate %100, %plaid_fused_6#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %111 -> %14 : !neura.data<i64, i1> !neura.data<i64, i1>
    %112 = neura.grant_predicate %101, %plaid_fused_6#2 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %112 -> %12 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %113 = neura.grant_predicate %102, %plaid_fused_6#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %113 -> %10 : !neura.data<i64, i1> !neura.data<i64, i1>
    %114 = neura.grant_predicate %96, %plaid_fused_6#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %114 -> %8 : !neura.data<i64, i1> !neura.data<i64, i1>
    %115 = neura.grant_predicate %plaid_fused_6#1, %plaid_fused_6#1 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %115 : !neura.data<i1, i1>
    neura.yield
  }
}

