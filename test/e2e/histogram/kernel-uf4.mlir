#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(5 : i32) : i32
    %2 = llvm.mlir.constant(-5 : i32) : i32
    %3 = llvm.mlir.constant(18 : i32) : i32
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.mlir.constant(1 : i64) : i64
    %6 = llvm.mlir.constant(2 : i64) : i64
    %7 = llvm.mlir.constant(3 : i64) : i64
    %8 = llvm.mlir.constant(4 : i64) : i64
    %9 = llvm.mlir.constant(16 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb1
    %11 = llvm.getelementptr inbounds %arg0[%10] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %12 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %13 = llvm.mul %12, %1 : i32
    %14 = llvm.add %13, %2 : i32
    %15 = llvm.sdiv %14, %3 : i32
    %16 = llvm.sext %15 : i32 to i64
    %17 = llvm.getelementptr inbounds %arg1[%16] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %18 = llvm.load %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.add %18, %4 overflow<nsw> : i32
    llvm.store %19, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.or %10, %5 : i64
    %21 = llvm.getelementptr inbounds %arg0[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %22 = llvm.load %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.mul %22, %1 : i32
    %24 = llvm.add %23, %2 : i32
    %25 = llvm.sdiv %24, %3 : i32
    %26 = llvm.sext %25 : i32 to i64
    %27 = llvm.getelementptr inbounds %arg1[%26] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %28 = llvm.load %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.add %28, %4 overflow<nsw> : i32
    llvm.store %29, %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %30 = llvm.or %10, %6 : i64
    %31 = llvm.getelementptr inbounds %arg0[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.mul %32, %1 : i32
    %34 = llvm.add %33, %2 : i32
    %35 = llvm.sdiv %34, %3 : i32
    %36 = llvm.sext %35 : i32 to i64
    %37 = llvm.getelementptr inbounds %arg1[%36] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %38 = llvm.load %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.add %38, %4 overflow<nsw> : i32
    llvm.store %39, %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %40 = llvm.or %10, %7 : i64
    %41 = llvm.getelementptr inbounds %arg0[%40] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %42 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.mul %42, %1 : i32
    %44 = llvm.add %43, %2 : i32
    %45 = llvm.sdiv %44, %3 : i32
    %46 = llvm.sext %45 : i32 to i64
    %47 = llvm.getelementptr inbounds %arg1[%46] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %48 = llvm.load %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.add %48, %4 overflow<nsw> : i32
    llvm.store %49, %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.add %10, %8 overflow<nsw, nuw> : i64
    %51 = llvm.icmp "ult" %10, %9 : i64
    llvm.cond_br %51, ^bb1(%50 : i64), ^bb2 {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
