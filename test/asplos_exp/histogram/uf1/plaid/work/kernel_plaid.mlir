#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external local_unnamed_addr @input_data(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global external local_unnamed_addr @hist(dense<0> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<16 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @input_data : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(1024 : i64) : i64
    %4 = llvm.mlir.addressof @hist : !llvm.ptr
    %5 = llvm.mlir.constant(0 : i8) : i8
    %6 = llvm.mlir.constant(64 : i64) : i64
    %7 = llvm.mlir.constant(4 : i32) : i32
    %8 = llvm.mlir.constant(1023 : i32) : i32
    %9 = llvm.mlir.constant(1 : i32) : i32
    %10 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%11: i64):  // 2 preds: ^bb0, ^bb1
    %12 = llvm.getelementptr inbounds %1[0, %11] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %13 = llvm.trunc %11 : i64 to i32
    llvm.store %13, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %14 = llvm.add %11, %2 overflow<nsw, nuw> : i64
    %15 = llvm.icmp "eq" %14, %3 : i64
    llvm.cond_br %15, ^bb2, ^bb1(%14 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    "llvm.intr.memset"(%4, %5, %6) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb3(%0 : i64)
  ^bb3(%16: i64):  // 2 preds: ^bb2, ^bb3
    %17 = llvm.getelementptr inbounds %1[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %18 = llvm.load %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.shl %18, %7 overflow<nsw> : i32
    %20 = llvm.sdiv %19, %8 : i32
    %21 = llvm.sext %20 : i32 to i64
    %22 = llvm.getelementptr inbounds %4[0, %21] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %23 = llvm.load %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.add %23, %9 overflow<nsw> : i32
    llvm.store %24, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %16, %2 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %3 : i64
    llvm.cond_br %26, ^bb4, ^bb3(%25 : i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %10 : i32
  }
  func.func @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 4 : i32}> : () -> !neura.data<i32, i1>
    %4 = "neura.grant_once"() <{constant_value = 1023 : i32}> : () -> !neura.data<i32, i1>
    %5 = "neura.grant_once"() <{constant_value = 1 : i32}> : () -> !neura.data<i32, i1>
    %6 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 1024 : i64}> : () -> !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.phi_start %7, %8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.phi_start %6, %10 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i32, i1>
    %13 = neura.phi_start %5, %12 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = neura.phi_start %1, %14 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<i32, i1>
    %17 = neura.phi_start %4, %16 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %18 = neura.reserve : !neura.data<i32, i1>
    %19 = neura.phi_start %3, %18 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %20 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %21 = neura.phi_start %0, %20 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.phi_start %2, %22 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %plaid_fused_0 = "neura.fused_op"(%21, %23, %19) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:gep->load->shl"}> ({
    ^bb0(%plaid_arg1_0: !neura.data<!llvm.ptr, i1>, %plaid_arg1_1: !neura.data<i64, i1>, %plaid_arg1_2: !neura.data<i32, i1>):
      %24 = "neura.gep"(%plaid_arg1_0, %plaid_arg1_1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %25 = "neura.load"(%24) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %26 = "neura.shl"(%25, %plaid_arg1_2) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%26 : !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %plaid_fused_1 = "neura.fused_op"(%plaid_fused_0, %17, %15) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:div->sext->gep"}> ({
    ^bb0(%plaid_arg2_0: !neura.data<i32, i1>, %plaid_arg2_1: !neura.data<i32, i1>, %plaid_arg2_2: !neura.data<!llvm.ptr, i1>):
      %27 = "neura.div"(%plaid_arg2_0, %plaid_arg2_1) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %28 = neura.sext %27 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      %29 = "neura.gep"(%plaid_arg2_2, %28) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%29 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %30 = "neura.load"(%plaid_fused_1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %31 = "neura.add"(%30, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%31, %plaid_fused_1) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %plaid_fused_2:3 = "neura.fused_op"(%23, %11, %9) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->icmp->not"}> ({
    ^bb0(%plaid_arg3_0: !neura.data<i64, i1>, %plaid_arg3_1: !neura.data<i64, i1>, %plaid_arg3_2: !neura.data<i64, i1>):
      %32 = "neura.add"(%plaid_arg3_0, %plaid_arg3_1) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %33 = "neura.icmp"(%32, %plaid_arg3_2) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %34 = "neura.not"(%33) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      neura.yield results(%32, %33, %34 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %35 = neura.grant_predicate %plaid_fused_2#0, %plaid_fused_2#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %35 -> %22 : !neura.data<i64, i1> !neura.data<i64, i1>
    %36 = neura.grant_predicate %21, %plaid_fused_2#2 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %36 -> %20 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %37 = neura.grant_predicate %19, %plaid_fused_2#2 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %37 -> %18 : !neura.data<i32, i1> !neura.data<i32, i1>
    %38 = neura.grant_predicate %17, %plaid_fused_2#2 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %38 -> %16 : !neura.data<i32, i1> !neura.data<i32, i1>
    %39 = neura.grant_predicate %15, %plaid_fused_2#2 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %39 -> %14 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %40 = neura.grant_predicate %13, %plaid_fused_2#2 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %40 -> %12 : !neura.data<i32, i1> !neura.data<i32, i1>
    %41 = neura.grant_predicate %11, %plaid_fused_2#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %41 -> %10 : !neura.data<i64, i1> !neura.data<i64, i1>
    %42 = neura.grant_predicate %9, %plaid_fused_2#2 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %42 -> %8 : !neura.data<i64, i1> !neura.data<i64, i1>
    %43 = neura.grant_predicate %plaid_fused_2#1, %plaid_fused_2#1 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %43 : !neura.data<i1, i1>
    neura.yield
  }
}

