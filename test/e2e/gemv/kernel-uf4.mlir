#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel_gemv_int(%arg0: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(2 : i64) : i64
    %2 = llvm.mlir.constant(3 : i64) : i64
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(4 : i64) : i64
    %5 = llvm.getelementptr inbounds %arg1[%0] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %6 = llvm.getelementptr inbounds %arg1[%1] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %7 = llvm.getelementptr inbounds %arg1[%2] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.br ^bb1(%3 : i64)
  ^bb1(%8: i64):  // 2 preds: ^bb0, ^bb1
    %9 = llvm.shl %8, %1 overflow<nsw> : i64
    %10 = llvm.getelementptr inbounds %arg0[%9] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %11 = llvm.load %10 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %12 = llvm.load %arg1 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %13 = llvm.mul %12, %11 overflow<nsw> : i32
    %14 = llvm.or %9, %0 : i64
    %15 = llvm.getelementptr inbounds %arg0[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %16 = llvm.load %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %17 = llvm.load %5 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.mul %17, %16 overflow<nsw> : i32
    %19 = llvm.add %13, %18 overflow<nsw> : i32
    %20 = llvm.or %9, %1 : i64
    %21 = llvm.getelementptr inbounds %arg0[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %22 = llvm.load %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.load %6 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.mul %23, %22 overflow<nsw> : i32
    %25 = llvm.add %19, %24 overflow<nsw> : i32
    %26 = llvm.or %9, %2 : i64
    %27 = llvm.getelementptr inbounds %arg0[%26] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %28 = llvm.load %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.load %7 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.mul %29, %28 overflow<nsw> : i32
    %31 = llvm.add %25, %30 overflow<nsw> : i32
    %32 = llvm.getelementptr inbounds %arg2[%8] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %31, %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.add %8, %0 overflow<nsw, nuw> : i64
    %34 = llvm.icmp "eq" %33, %4 : i64
    llvm.cond_br %34, ^bb2, ^bb1(%33 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
