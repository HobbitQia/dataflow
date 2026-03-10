#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "double", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture}, %arg4: !llvm.ptr {llvm.nocapture}, %arg5: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg6: !llvm.ptr {llvm.nocapture, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(3 : i64) : i64
    %2 = llvm.mlir.constant(0 : i8) : i8
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %5 = llvm.mlir.constant(1 : i64) : i64
    %6 = llvm.mlir.constant(2 : i64) : i64
    %7 = llvm.bitcast %arg4 : !llvm.ptr to !llvm.ptr
    %8 = llvm.icmp "sgt" %arg0, %0 : i32
    llvm.cond_br %8, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %9 = llvm.bitcast %arg3 : !llvm.ptr to !llvm.ptr
    %10 = llvm.zext %arg0 : i32 to i64
    %11 = llvm.shl %10, %1 overflow<nsw, nuw> : i64
    "llvm.intr.memset"(%9, %2, %11) <{isVolatile = false}> : (!llvm.ptr, i8, i64) -> ()
    %12 = llvm.icmp "sgt" %arg1, %0 : i32
    llvm.cond_br %12, ^bb4, ^bb8
  ^bb2:  // pred: ^bb0
    %13 = llvm.icmp "sgt" %arg1, %0 : i32
    llvm.cond_br %13, ^bb3, ^bb8
  ^bb3:  // pred: ^bb2
    %14 = llvm.zext %arg1 : i32 to i64
    %15 = llvm.shl %14, %1 overflow<nsw, nuw> : i64
    "llvm.intr.memset"(%7, %2, %15) <{isVolatile = false}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb8
  ^bb4:  // pred: ^bb1
    %16 = llvm.sext %arg0 : i32 to i64
    %17 = llvm.zext %arg1 : i32 to i64
    llvm.br ^bb5(%3 : i64)
  ^bb5(%18: i64):  // 2 preds: ^bb4, ^bb7
    %19 = llvm.getelementptr inbounds %arg4[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %4, %19 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %20 = llvm.getelementptr inbounds %arg6[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.br ^bb6(%3 : i64)
  ^bb6(%21: i64):  // 2 preds: ^bb5, ^bb6
    %22 = llvm.getelementptr inbounds %arg3[%21] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %23 = llvm.load %22 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %24 = llvm.load %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %25 = llvm.getelementptr inbounds %arg2[%18, %21] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1900 x f64>
    %26 = llvm.load %25 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %27 = llvm.fmul %24, %26 : f64
    %28 = llvm.fadd %23, %27 : f64
    llvm.store %28, %22 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %29 = llvm.load %19 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %30 = llvm.load %25 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %31 = llvm.getelementptr inbounds %arg5[%21] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %32 = llvm.load %31 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %33 = llvm.fmul %30, %32 : f64
    %34 = llvm.fadd %29, %33 : f64
    llvm.store %34, %19 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %35 = llvm.or %21, %5 : i64
    %36 = llvm.getelementptr inbounds %arg3[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %37 = llvm.load %36 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %38 = llvm.load %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %39 = llvm.getelementptr inbounds %arg2[%18, %35] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1900 x f64>
    %40 = llvm.load %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %41 = llvm.fmul %38, %40 : f64
    %42 = llvm.fadd %37, %41 : f64
    llvm.store %42, %36 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %43 = llvm.load %19 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %44 = llvm.load %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %45 = llvm.getelementptr inbounds %arg5[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %46 = llvm.load %45 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %47 = llvm.fmul %44, %46 : f64
    %48 = llvm.fadd %43, %47 : f64
    llvm.store %48, %19 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %49 = llvm.add %21, %6 overflow<nsw, nuw> : i64
    %50 = llvm.icmp "slt" %49, %16 : i64
    llvm.cond_br %50, ^bb6(%49 : i64), ^bb7 {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %51 = llvm.add %18, %5 overflow<nsw, nuw> : i64
    %52 = llvm.icmp "eq" %51, %17 : i64
    llvm.cond_br %52, ^bb8, ^bb5(%51 : i64) {loop_annotation = #loop_annotation}
  ^bb8:  // 4 preds: ^bb1, ^bb2, ^bb3, ^bb7
    llvm.return
  }
}
