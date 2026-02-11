#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel_gemv_int(%arg0: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(2 : i64) : i64
    %2 = llvm.mlir.constant(true) : i1
    %3 = llvm.mlir.constant(0 : i32) : i32
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(false) : i1
    %6 = llvm.mlir.constant(4 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%7: i64):  // 2 preds: ^bb0, ^bb3
    %8 = llvm.shl %7, %1 overflow<nsw> : i64
    llvm.br ^bb4(%2, %0, %3 : i1, i64, i32)
  ^bb2:  // pred: ^bb3
    llvm.return
  ^bb3:  // pred: ^bb4
    %9 = llvm.getelementptr inbounds %arg2[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %29, %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %10 = llvm.add %7, %4 overflow<nsw, nuw> : i64
    %11 = llvm.icmp "eq" %10, %6 : i64
    llvm.cond_br %11, ^bb2, ^bb1(%10 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%12: i1, %13: i64, %14: i32):  // 2 preds: ^bb1, ^bb4
    %15 = llvm.or %13, %8 : i64
    %16 = llvm.getelementptr inbounds %arg0[%15] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %17 = llvm.load %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.getelementptr inbounds %arg1[%13] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %19 = llvm.load %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %20 = llvm.mul %19, %17 overflow<nsw> : i32
    %21 = llvm.add %20, %14 overflow<nsw> : i32
    %22 = llvm.or %15, %4 : i64
    %23 = llvm.getelementptr inbounds %arg0[%22] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %24 = llvm.load %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.or %13, %4 : i64
    %26 = llvm.getelementptr inbounds %arg1[%25] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %27 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %28 = llvm.mul %27, %24 overflow<nsw> : i32
    %29 = llvm.add %21, %28 overflow<nsw> : i32
    llvm.cond_br %12, ^bb4(%5, %1, %29 : i1, i64, i32), ^bb3 {loop_annotation = #loop_annotation}
  }
}
