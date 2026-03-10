#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "double", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr {llvm.nocapture}, %arg4: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(0 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(2 : i64) : i64
    %4 = llvm.icmp "sgt" %arg0, %0 : i32
    %5 = llvm.icmp "sgt" %arg2, %0 : i32
    %6 = llvm.icmp "sgt" %arg1, %0 : i32
    %7 = llvm.and %4, %5 : i1
    llvm.cond_br %7, ^bb1, ^bb7
  ^bb1:  // pred: ^bb0
    %8 = llvm.sext %arg1 : i32 to i64
    %9 = llvm.zext %arg0 : i32 to i64
    %10 = llvm.zext %arg2 : i32 to i64
    llvm.br ^bb2(%1 : i64)
  ^bb2(%11: i64):  // 2 preds: ^bb1, ^bb3
    llvm.cond_br %6, ^bb4(%1 : i64), ^bb3
  ^bb3:  // 2 preds: ^bb2, ^bb5
    %12 = llvm.add %11, %2 overflow<nsw, nuw> : i64
    %13 = llvm.icmp "eq" %12, %9 : i64
    llvm.cond_br %13, ^bb7, ^bb2(%12 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%14: i64):  // 2 preds: ^bb2, ^bb5
    %15 = llvm.getelementptr inbounds %arg4[%11, %14] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1200 x f64>
    llvm.br ^bb6(%1 : i64)
  ^bb5:  // pred: ^bb6
    %16 = llvm.add %14, %2 overflow<nsw, nuw> : i64
    %17 = llvm.icmp "eq" %16, %10 : i64
    llvm.cond_br %17, ^bb3, ^bb4(%16 : i64) {loop_annotation = #loop_annotation}
  ^bb6(%18: i64):  // 2 preds: ^bb4, ^bb6
    %19 = llvm.load %15 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %20 = llvm.getelementptr inbounds %arg5[%14, %18] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %21 = llvm.load %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %22 = llvm.fmul %19, %21 : f64
    %23 = llvm.getelementptr inbounds %arg3[%11, %18] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %24 = llvm.load %23 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %25 = llvm.fadd %24, %22 : f64
    llvm.store %25, %23 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %26 = llvm.load %15 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %27 = llvm.or %18, %2 : i64
    %28 = llvm.getelementptr inbounds %arg5[%14, %27] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %29 = llvm.load %28 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %30 = llvm.fmul %26, %29 : f64
    %31 = llvm.getelementptr inbounds %arg3[%11, %27] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %32 = llvm.load %31 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %33 = llvm.fadd %32, %30 : f64
    llvm.store %33, %31 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %34 = llvm.add %18, %3 overflow<nsw, nuw> : i64
    %35 = llvm.icmp "slt" %34, %8 : i64
    llvm.cond_br %35, ^bb6(%34 : i64), ^bb5 {loop_annotation = #loop_annotation}
  ^bb7:  // 2 preds: ^bb0, ^bb3
    llvm.return
  }
}
