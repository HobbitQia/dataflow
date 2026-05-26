#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal @_ZZ4mainE9data_real(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global internal @_ZZ4mainE9data_imag(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE9data_real : !llvm.ptr
    %2 = llvm.mlir.addressof @_ZZ4mainE9data_imag : !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(256 : i64) : i64
    %6 = llvm.mlir.constant(2 : i32) : i32
    %7 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%8: i64):  // 2 preds: ^bb0, ^bb1
    %9 = llvm.getelementptr inbounds %1[0, %8] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %10 = llvm.trunc %8 : i64 to i32
    llvm.store %10, %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %11 = llvm.getelementptr inbounds %2[0, %8] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    llvm.store %3, %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %12 = llvm.add %8, %4 overflow<nsw, nuw> : i64
    %13 = llvm.icmp "eq" %12, %5 : i64
    llvm.cond_br %13, ^bb2, ^bb1(%12 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %14 = func.call @_Z6kernelPiS_iil(%1, %2, %6, %6, %0) : (!llvm.ptr, !llvm.ptr, i32, i32, i64) -> !llvm.void
    llvm.return %7 : i32
  }
  func.func @_Z6kernelPiS_iil(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: i32 {llvm.noundef}, %arg3: i32 {llvm.noundef}, %arg4: i64 {llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %1 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
    %2 = "neura.grant_once"() <{constant_value = 124 : i64}> : () -> !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = neura.phi_start %2, %3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = neura.phi_start %1, %5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i32, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = neura.reserve : !neura.data<i32, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20:2 = "neura.fused_op"(%0, %19, %6) <{frequency = 11 : i64, pattern_id = 11 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %46 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %47 = "neura.add"(%46, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%46, %47 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %21:4 = "neura.fused_op"(%20#0, %4, %20#1, %17) <{frequency = 4 : i64, pattern_id = 14 : i64, pattern_name = "fused_op:icmp->grant_predicate->fused_op:grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>):
      %46 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %47 = neura.grant_predicate %arg7, %46 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %48 = "neura.grant_once"() <{constant_value = 128 : i64}> : () -> !neura.data<i64, i1>
      %49 = neura.phi_start %48, %arg8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %50 = neura.grant_predicate %49, %46 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%46, %47, %49, %50 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %22:2 = "neura.fused_op"(%15, %21#0) <{frequency = 12 : i64, pattern_id = 16 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>):
      %46 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<i32, i1>
      %47 = neura.phi_start %46, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %48 = neura.grant_predicate %47, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%47, %48 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %23:2 = "neura.fused_op"(%13, %21#0) <{frequency = 12 : i64, pattern_id = 16 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i1, i1>):
      %46 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<i32, i1>
      %47 = neura.phi_start %46, %arg5 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %48 = neura.grant_predicate %47, %arg6 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%47, %48 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %24:2 = "neura.fused_op"(%12, %21#0) <{frequency = 12 : i64, pattern_id = 16 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %46 = "neura.grant_once"() <{constant_value = 129 : i64}> : () -> !neura.data<i64, i1>
      %47 = neura.phi_start %46, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %48 = neura.grant_predicate %47, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%47, %48 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %25:6 = "neura.fused_op"(%18, %21#0, %20#0, %21#2, %24#0, %7) <{frequency = 5 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->fused_op:fused_op:add->add->add->fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<i64, i1>, %arg10: !neura.data<i64, i1>):
      %46 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<i64, i1>
      %47 = neura.phi_start %46, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %48 = neura.grant_predicate %47, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %49 = "neura.add"(%arg7, %47) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %50 = "neura.add"(%49, %arg8) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %51 = "neura.add"(%49, %arg9) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %52 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
      %53 = neura.phi_start %52, %arg10 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %54 = neura.grant_predicate %53, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %55 = "neura.add"(%49, %53) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%48, %49, %50, %51, %54, %55 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %26:8 = "neura.fused_op"(%16, %21#0, %25#2, %23#0, %25#3) <{frequency = 6 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->fused_op:fused_op:gep->load->mul->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i64, i1>):
      %46 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %47 = neura.phi_start %46, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %48 = neura.grant_predicate %47, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %49 = "neura.gep"(%47, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %50 = "neura.load"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %51 = "neura.mul"(%50, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %52 = "neura.gep"(%47, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %54 = "neura.mul"(%53, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%47, %48, %49, %50, %51, %52, %53, %54 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %27:8 = "neura.fused_op"(%14, %21#0, %25#2, %23#0, %25#3) <{frequency = 6 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->fused_op:fused_op:gep->load->mul->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i64, i1>):
      %46 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %47 = neura.phi_start %46, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %48 = neura.grant_predicate %47, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %49 = "neura.gep"(%47, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %50 = "neura.load"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %51 = "neura.mul"(%50, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %52 = "neura.gep"(%47, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %54 = "neura.mul"(%53, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%47, %48, %49, %50, %51, %52, %53, %54 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %28:5 = "neura.fused_op"(%8, %21#0, %25#1, %27#0, %23#0) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->add->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i32, i1>):
      %46 = "neura.grant_once"() <{constant_value = 131 : i64}> : () -> !neura.data<i64, i1>
      %47 = neura.phi_start %46, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %48 = neura.grant_predicate %47, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %49 = "neura.add"(%arg7, %47) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %50 = "neura.gep"(%arg8, %49) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %51 = "neura.load"(%50) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %52 = "neura.mul"(%51, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%48, %49, %50, %51, %52 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %29:5 = "neura.fused_op"(%10, %21#0, %25#1, %27#0, %23#0) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:grant_once->fused_op:phi_start->grant_predicate->add->fused_op:fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i32, i1>):
      %46 = "neura.grant_once"() <{constant_value = 130 : i64}> : () -> !neura.data<i64, i1>
      %47 = neura.phi_start %46, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %48 = neura.grant_predicate %47, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %49 = "neura.add"(%arg7, %47) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %50 = "neura.gep"(%arg8, %49) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %51 = "neura.load"(%50) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %52 = "neura.mul"(%51, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%48, %49, %50, %51, %52 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %30:3 = "neura.fused_op"(%27#0, %25#1, %27#3, %22#0, %26#4) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:gep->load->fused_op:fused_op:mul->fused_op:add->add->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %46 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %48 = "neura.mul"(%arg7, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %49 = "neura.add"(%48, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %50 = "neura.add"(%47, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %51 = "neura.sub"(%47, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%46, %50, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %31:3 = "neura.fused_op"(%26#3, %22#0, %27#4, %26#0, %25#1) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:mul->sub->fused_op:fused_op:gep->load->sub->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %46 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %47 = "neura.sub"(%46, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %48 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %49 = "neura.load"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %50 = "neura.sub"(%49, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %51 = "neura.add"(%49, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%48, %50, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %32:2 = "neura.fused_op"(%9, %21#0, %25#1) <{frequency = 5 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->grant_predicate->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %46 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %47 = neura.phi_start %46, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %48 = neura.grant_predicate %47, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %49 = "neura.add"(%arg7, %47) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%48, %49 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %33:2 = "neura.fused_op"(%11, %21#0, %25#1) <{frequency = 5 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->grant_predicate->add"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>, %arg7: !neura.data<i64, i1>):
      %46 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %47 = neura.phi_start %46, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %48 = neura.grant_predicate %47, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %49 = "neura.add"(%arg7, %47) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%48, %49 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    "neura.store"(%31#1, %26#2) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%31#2, %31#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%30#2, %27#2) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%30#1, %30#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %34:3 = "neura.fused_op"(%27#0, %33#1, %27#6, %22#0, %26#7) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:gep->load->fused_op:fused_op:mul->fused_op:add->add->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %46 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %48 = "neura.mul"(%arg7, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %49 = "neura.add"(%48, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %50 = "neura.add"(%47, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %51 = "neura.sub"(%47, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%46, %50, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %35:3 = "neura.fused_op"(%26#6, %22#0, %27#7, %26#0, %33#1) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:mul->sub->fused_op:fused_op:gep->load->sub->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %46 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %47 = "neura.sub"(%46, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %48 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %49 = "neura.load"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %50 = "neura.sub"(%49, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %51 = "neura.add"(%49, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%48, %50, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    "neura.store"(%35#1, %26#5) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%35#2, %35#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%34#2, %27#5) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%34#1, %34#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %36:3 = "neura.fused_op"(%26#0, %29#1, %23#0) <{frequency = 12 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %46 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %48 = "neura.mul"(%47, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%46, %47, %48 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %37:3 = "neura.fused_op"(%27#0, %32#1, %29#3, %22#0, %36#2) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:gep->load->fused_op:fused_op:mul->fused_op:add->add->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %46 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %48 = "neura.mul"(%arg7, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %49 = "neura.add"(%48, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %50 = "neura.add"(%47, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %51 = "neura.sub"(%47, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%46, %50, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %38:3 = "neura.fused_op"(%36#1, %22#0, %29#4, %26#0, %32#1) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:mul->sub->fused_op:fused_op:gep->load->sub->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %46 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %47 = "neura.sub"(%46, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %48 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %49 = "neura.load"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %50 = "neura.sub"(%49, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %51 = "neura.add"(%49, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%48, %50, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    "neura.store"(%38#1, %36#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%38#2, %38#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%37#2, %29#2) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%37#1, %37#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %39:3 = "neura.fused_op"(%26#0, %28#1, %23#0) <{frequency = 12 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %46 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %48 = "neura.mul"(%47, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%46, %47, %48 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %40:3 = "neura.fused_op"(%27#0, %25#5, %28#3, %22#0, %39#2) <{frequency = 4 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:gep->load->fused_op:fused_op:mul->fused_op:add->add->sub"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
      %46 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %48 = "neura.mul"(%arg7, %arg8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %49 = "neura.add"(%48, %arg9) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %50 = "neura.add"(%47, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %51 = "neura.sub"(%47, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%46, %50, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    %41:3 = "neura.fused_op"(%39#1, %22#0, %28#4, %26#0, %25#5) <{frequency = 8 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:mul->sub->fused_op:fused_op:gep->load->sub->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<i64, i1>):
      %46 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %47 = "neura.sub"(%46, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %48 = "neura.gep"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %49 = "neura.load"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %50 = "neura.sub"(%49, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %51 = "neura.add"(%49, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%48, %50, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
    "neura.store"(%41#1, %39#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%41#2, %41#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%40#2, %28#2) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%40#1, %40#0) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %42 = "neura.not"(%21#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %21#1 -> %19 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %25#0 -> %18 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %21#3 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %26#1 -> %16 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %22#1 -> %15 : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %27#1 -> %14 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %23#1 -> %13 : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %24#1 -> %12 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %33#0 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %29#0 -> %10 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %32#0 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %28#0 -> %8 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %25#4 -> %7 : !neura.data<i64, i1> !neura.data<i64, i1>
    %43 = neura.grant_predicate %6, %21#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %43 -> %5 : !neura.data<i64, i1> !neura.data<i64, i1>
    %44 = neura.grant_predicate %4, %21#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %44 -> %3 : !neura.data<i64, i1> !neura.data<i64, i1>
    %45 = neura.grant_predicate %42, %42 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %45 : !neura.data<i1, i1>
    neura.yield
  }
}

