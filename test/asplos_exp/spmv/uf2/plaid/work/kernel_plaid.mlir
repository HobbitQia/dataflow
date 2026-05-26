#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %11 = llvm.mlir.constant(2 : i64) : i64
    %12 = llvm.mlir.constant(1022 : i64) : i64
    %13 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%14: i64):  // 2 preds: ^bb0, ^bb1
    %15 = llvm.trunc %14 : i64 to i32
    %16 = llvm.trunc %14 : i64 to i16
    %17 = llvm.urem %16, %1 : i16
    %18 = llvm.add %17, %2 overflow<nsw, nuw> : i16
    %19 = llvm.zext %18 : i16 to i32
    %20 = llvm.getelementptr inbounds %3[0, %14] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %19, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.getelementptr inbounds %4[0, %14] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %15, %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.getelementptr inbounds %5[0, %14] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %15, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %14, %6 overflow<nsw, nuw> : i64
    %24 = llvm.icmp "eq" %23, %7 : i64
    llvm.cond_br %24, ^bb2(%0 : i64), ^bb1(%23 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%25: i64):  // 2 preds: ^bb1, ^bb2
    %26 = llvm.trunc %25 : i64 to i16
    %27 = llvm.urem %26, %8 : i16
    %28 = llvm.zext %27 : i16 to i32
    %29 = llvm.getelementptr inbounds %9[0, %25] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %28, %29 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %30 = llvm.add %25, %6 overflow<nsw, nuw> : i64
    %31 = llvm.icmp "eq" %30, %7 : i64
    llvm.cond_br %31, ^bb3(%0 : i64), ^bb2(%30 : i64) {loop_annotation = #loop_annotation}
  ^bb3(%32: i64):  // 2 preds: ^bb2, ^bb3
    %33 = llvm.getelementptr inbounds %3[0, %32] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %34 = llvm.load %33 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.getelementptr inbounds %4[0, %32] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %36 = llvm.load %35 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.sext %36 : i32 to i64
    %38 = llvm.getelementptr inbounds %9[0, %37] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %39 = llvm.load %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %40 = llvm.mul %39, %34 overflow<nsw> : i32
    %41 = llvm.getelementptr inbounds %5[0, %32] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %42 = llvm.load %41 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.sext %42 : i32 to i64
    %44 = llvm.getelementptr inbounds %10[0, %43] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %45 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.add %45, %40 overflow<nsw> : i32
    llvm.store %46, %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.or %32, %6 : i64
    %48 = llvm.getelementptr inbounds %3[0, %47] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %49 = llvm.load %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.getelementptr inbounds %4[0, %47] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.sext %51 : i32 to i64
    %53 = llvm.getelementptr inbounds %9[0, %52] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %54 = llvm.load %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.mul %54, %49 overflow<nsw> : i32
    %56 = llvm.getelementptr inbounds %5[0, %47] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %57 = llvm.load %56 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %58 = llvm.sext %57 : i32 to i64
    %59 = llvm.getelementptr inbounds %10[0, %58] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %60 = llvm.load %59 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %61 = llvm.add %60, %55 overflow<nsw> : i32
    llvm.store %61, %59 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %62 = llvm.add %32, %11 overflow<nsw, nuw> : i64
    %63 = llvm.icmp "ult" %32, %12 : i64
    llvm.cond_br %63, ^bb3(%62 : i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %13 : i32
  }
  func.func @_Z6kernelPiS_S_S_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
    %5 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 1022 : i64}> : () -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.phi_start %8, %9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.phi_start %7, %11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.phi_start %6, %13 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = neura.phi_start %4, %15 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %18 = neura.phi_start %2, %17 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %19 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %20 = neura.phi_start %3, %19 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = neura.phi_start %1, %21 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %23 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %24 = neura.phi_start %0, %23 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.phi_start %5, %25 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %27 = "neura.gep"(%24, %26) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = "neura.load"(%27) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %plaid_fused_0 = "neura.fused_op"(%22, %26) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:gep->load->sext"}> ({
    ^bb0(%plaid_arg1_0: !neura.data<!llvm.ptr, i1>, %plaid_arg1_1: !neura.data<i64, i1>):
      %29 = "neura.gep"(%plaid_arg1_0, %plaid_arg1_1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %30 = "neura.load"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %31 = neura.sext %30 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      neura.yield results(%31 : !neura.data<i64, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %plaid_fused_1 = "neura.fused_op"(%20, %plaid_fused_0, %28) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:gep->load->mul"}> ({
    ^bb0(%plaid_arg2_0: !neura.data<!llvm.ptr, i1>, %plaid_arg2_1: !neura.data<i64, i1>, %plaid_arg2_2: !neura.data<i32, i1>):
      %32 = "neura.gep"(%plaid_arg2_0, %plaid_arg2_1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %33 = "neura.load"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %34 = "neura.mul"(%33, %plaid_arg2_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%34 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %plaid_fused_2 = "neura.fused_op"(%18, %26) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:gep->load->sext"}> ({
    ^bb0(%plaid_arg3_0: !neura.data<!llvm.ptr, i1>, %plaid_arg3_1: !neura.data<i64, i1>):
      %35 = "neura.gep"(%plaid_arg3_0, %plaid_arg3_1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %36 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %37 = neura.sext %36 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      neura.yield results(%37 : !neura.data<i64, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %plaid_fused_3:2 = "neura.fused_op"(%16, %plaid_fused_2, %plaid_fused_1) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.unicast:gep->load->add"}> ({
    ^bb0(%plaid_arg4_0: !neura.data<!llvm.ptr, i1>, %plaid_arg4_1: !neura.data<i64, i1>, %plaid_arg4_2: !neura.data<i32, i1>):
      %38 = "neura.gep"(%plaid_arg4_0, %plaid_arg4_1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %39 = "neura.load"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %40 = "neura.add"(%39, %plaid_arg4_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%38, %40 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%plaid_fused_3#1, %plaid_fused_3#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %plaid_fused_4:2 = "neura.fused_op"(%26, %14, %24) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:or->gep->load"}> ({
    ^bb0(%plaid_arg5_0: !neura.data<i64, i1>, %plaid_arg5_1: !neura.data<i64, i1>, %plaid_arg5_2: !neura.data<!llvm.ptr, i1>):
      %41 = "neura.or"(%plaid_arg5_0, %plaid_arg5_1) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %42 = "neura.gep"(%plaid_arg5_2, %41) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%41, %43 : !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>)
    %plaid_fused_5 = "neura.fused_op"(%22, %plaid_fused_4#0) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.unicast:gep->load->sext"}> ({
    ^bb0(%plaid_arg6_0: !neura.data<!llvm.ptr, i1>, %plaid_arg6_1: !neura.data<i64, i1>):
      %44 = "neura.gep"(%plaid_arg6_0, %plaid_arg6_1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.load"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %46 = neura.sext %45 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      neura.yield results(%46 : !neura.data<i64, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %plaid_fused_6 = "neura.fused_op"(%20, %plaid_fused_5, %plaid_fused_4#1) <{frequency = 1 : i64, pattern_id = 6 : i64, pattern_name = "plaid.unicast:gep->load->mul"}> ({
    ^bb0(%plaid_arg7_0: !neura.data<!llvm.ptr, i1>, %plaid_arg7_1: !neura.data<i64, i1>, %plaid_arg7_2: !neura.data<i32, i1>):
      %47 = "neura.gep"(%plaid_arg7_0, %plaid_arg7_1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %48 = "neura.load"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %49 = "neura.mul"(%48, %plaid_arg7_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%49 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %plaid_fused_7 = "neura.fused_op"(%18, %plaid_fused_4#0) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "plaid.unicast:gep->load->sext"}> ({
    ^bb0(%plaid_arg8_0: !neura.data<!llvm.ptr, i1>, %plaid_arg8_1: !neura.data<i64, i1>):
      %50 = "neura.gep"(%plaid_arg8_0, %plaid_arg8_1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %51 = "neura.load"(%50) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %52 = neura.sext %51 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      neura.yield results(%52 : !neura.data<i64, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %plaid_fused_8:2 = "neura.fused_op"(%16, %plaid_fused_7, %plaid_fused_6) <{frequency = 1 : i64, pattern_id = 8 : i64, pattern_name = "plaid.unicast:gep->load->add"}> ({
    ^bb0(%plaid_arg9_0: !neura.data<!llvm.ptr, i1>, %plaid_arg9_1: !neura.data<i64, i1>, %plaid_arg9_2: !neura.data<i32, i1>):
      %53 = "neura.gep"(%plaid_arg9_0, %plaid_arg9_1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %54 = "neura.load"(%53) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %55 = "neura.add"(%54, %plaid_arg9_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%53, %55 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    "neura.store"(%plaid_fused_8#1, %plaid_fused_8#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %56 = "neura.add"(%26, %12) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.icmp"(%26, %10) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %58 = "neura.not"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %59 = neura.grant_predicate %56, %57 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %59 -> %25 : !neura.data<i64, i1> !neura.data<i64, i1>
    %60 = neura.grant_predicate %24, %57 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %60 -> %23 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %61 = neura.grant_predicate %22, %57 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %61 -> %21 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %62 = neura.grant_predicate %20, %57 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %62 -> %19 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %63 = neura.grant_predicate %18, %57 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %63 -> %17 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %64 = neura.grant_predicate %16, %57 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %64 -> %15 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %65 = neura.grant_predicate %14, %57 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %65 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    %66 = neura.grant_predicate %12, %57 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %66 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %67 = neura.grant_predicate %10, %57 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %67 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    %68 = neura.grant_predicate %58, %58 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %68 : !neura.data<i1, i1>
    neura.yield
  }
}

