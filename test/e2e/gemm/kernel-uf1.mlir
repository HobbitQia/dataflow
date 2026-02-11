#loop_unroll = #llvm.loop_unroll<disable = true>
#loop_vectorize = #llvm.loop_vectorize<width = 1 : i32>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#loop_annotation1 = #llvm.loop_annotation<vectorize = #loop_vectorize, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "double", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr {llvm.nocapture}, %arg4: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(0 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.icmp "sgt" %arg0, %0 : i32
    %4 = llvm.icmp "sgt" %arg2, %0 : i32
    %5 = llvm.icmp "sgt" %arg1, %0 : i32
    %6 = llvm.and %3, %4 : i1
    llvm.cond_br %6, ^bb1, ^bb7
  ^bb1:  // pred: ^bb0
    %7 = llvm.zext %arg0 : i32 to i64
    %8 = llvm.zext %arg2 : i32 to i64
    %9 = llvm.zext %arg1 : i32 to i64
    llvm.br ^bb2(%1 : i64)
  ^bb2(%10: i64):  // 2 preds: ^bb1, ^bb3
    llvm.cond_br %5, ^bb4(%1 : i64), ^bb3
  ^bb3:  // 2 preds: ^bb2, ^bb5
    %11 = llvm.add %10, %2 overflow<nsw, nuw> : i64
    %12 = llvm.icmp "eq" %11, %7 : i64
    llvm.cond_br %12, ^bb7, ^bb2(%11 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%13: i64):  // 2 preds: ^bb2, ^bb5
    %14 = llvm.getelementptr inbounds %arg4[%10, %13] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1200 x f64>
    llvm.br ^bb6(%1 : i64)
  ^bb5:  // pred: ^bb6
    %15 = llvm.add %13, %2 overflow<nsw, nuw> : i64
    %16 = llvm.icmp "eq" %15, %8 : i64
    llvm.cond_br %16, ^bb3, ^bb4(%15 : i64) {loop_annotation = #loop_annotation}
  ^bb6(%17: i64):  // 2 preds: ^bb4, ^bb6
    %18 = llvm.load %14 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %19 = llvm.getelementptr inbounds %arg5[%13, %17] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %20 = llvm.load %19 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %21 = llvm.fmul %18, %20 : f64
    %22 = llvm.getelementptr inbounds %arg3[%10, %17] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %23 = llvm.load %22 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %24 = llvm.fadd %23, %21 : f64
    llvm.store %24, %22 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %25 = llvm.add %17, %2 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %9 : i64
    llvm.cond_br %26, ^bb5, ^bb6(%25 : i64) {loop_annotation = #loop_annotation1}
  ^bb7:  // 2 preds: ^bb0, ^bb3
    llvm.return
  }
}
