#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "double", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture}, %arg4: !llvm.ptr {llvm.nocapture}, %arg5: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg6: !llvm.ptr {llvm.nocapture, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(3 : i64) : i64
    %2 = llvm.mlir.constant(0 : i8) : i8
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %5 = llvm.mlir.constant(1 : i64) : i64
    %6 = llvm.bitcast %arg4 : !llvm.ptr to !llvm.ptr
    %7 = llvm.icmp "sgt" %arg0, %0 : i32
    llvm.cond_br %7, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %8 = llvm.bitcast %arg3 : !llvm.ptr to !llvm.ptr
    %9 = llvm.zext %arg0 : i32 to i64
    %10 = llvm.shl %9, %1 overflow<nsw, nuw> : i64
    "llvm.intr.memset"(%8, %2, %10) <{isVolatile = false}> : (!llvm.ptr, i8, i64) -> ()
    %11 = llvm.icmp "sgt" %arg1, %0 : i32
    llvm.cond_br %11, ^bb4, ^bb8
  ^bb2:  // pred: ^bb0
    %12 = llvm.icmp "sgt" %arg1, %0 : i32
    llvm.cond_br %12, ^bb3, ^bb8
  ^bb3:  // pred: ^bb2
    %13 = llvm.zext %arg1 : i32 to i64
    %14 = llvm.shl %13, %1 overflow<nsw, nuw> : i64
    "llvm.intr.memset"(%6, %2, %14) <{isVolatile = false}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb8
  ^bb4:  // pred: ^bb1
    %15 = llvm.zext %arg1 : i32 to i64
    %16 = llvm.zext %arg0 : i32 to i64
    llvm.br ^bb5(%3 : i64)
  ^bb5(%17: i64):  // 2 preds: ^bb4, ^bb7
    %18 = llvm.getelementptr inbounds %arg4[%17] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %4, %18 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %19 = llvm.getelementptr inbounds %arg6[%17] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.br ^bb6(%3 : i64)
  ^bb6(%20: i64):  // 2 preds: ^bb5, ^bb6
    %21 = llvm.getelementptr inbounds %arg3[%20] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %22 = llvm.load %21 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %23 = llvm.load %19 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %24 = llvm.getelementptr inbounds %arg2[%17, %20] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<116 x f64>
    %25 = llvm.load %24 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %26 = llvm.fmul %23, %25 : f64
    %27 = llvm.fadd %22, %26 : f64
    llvm.store %27, %21 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %28 = llvm.load %18 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %29 = llvm.load %24 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %30 = llvm.getelementptr inbounds %arg5[%20] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %31 = llvm.load %30 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %32 = llvm.fmul %29, %31 : f64
    %33 = llvm.fadd %28, %32 : f64
    llvm.store %33, %18 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %34 = llvm.add %20, %5 overflow<nsw, nuw> : i64
    %35 = llvm.icmp "eq" %34, %16 : i64
    llvm.cond_br %35, ^bb7, ^bb6(%34 : i64) {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %36 = llvm.add %17, %5 overflow<nsw, nuw> : i64
    %37 = llvm.icmp "eq" %36, %15 : i64
    llvm.cond_br %37, ^bb8, ^bb5(%36 : i64) {loop_annotation = #loop_annotation}
  ^bb8:  // 4 preds: ^bb1, ^bb2, ^bb3, ^bb7
    llvm.return
  }
}
