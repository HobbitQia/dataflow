#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32, %arg1: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(0 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.icmp "sgt" %arg0, %0 : i32
    llvm.cond_br %3, ^bb1, ^bb3
  ^bb1:  // pred: ^bb0
    %4 = llvm.zext %arg0 : i32 to i64
    llvm.br ^bb2(%1 : i64)
  ^bb2(%5: i64):  // 2 preds: ^bb1, ^bb2
    %6 = llvm.getelementptr inbounds %arg1[%5] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %7 = llvm.load %6 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %8 = llvm.getelementptr inbounds %arg2[%5] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %9 = llvm.load %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %10 = llvm.sext %9 : i32 to i64
    %11 = llvm.getelementptr inbounds %arg4[%10] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %12 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %13 = llvm.mul %12, %7 overflow<nsw> : i32
    %14 = llvm.getelementptr inbounds %arg3[%5] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %15 = llvm.load %14 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.sext %15 : i32 to i64
    %17 = llvm.getelementptr inbounds %arg5[%16] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %18 = llvm.load %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.add %18, %13 overflow<nsw> : i32
    llvm.store %19, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.add %5, %2 overflow<nsw, nuw> : i64
    %21 = llvm.icmp "eq" %20, %4 : i64
    llvm.cond_br %21, ^bb3, ^bb2(%20 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // 2 preds: ^bb0, ^bb2
    llvm.return
  }
}
