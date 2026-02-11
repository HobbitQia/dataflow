#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "double", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr {llvm.nocapture}, %arg4: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.mlir.constant(2 : i64) : i64
    %5 = llvm.mlir.constant(3 : i64) : i64
    %6 = llvm.mlir.constant(4 : i64) : i64
    %7 = llvm.icmp "sgt" %arg0, %0 : i32
    llvm.cond_br %7, ^bb1, ^bb7
  ^bb1:  // pred: ^bb0
    %8 = llvm.icmp "slt" %arg2, %1 : i32
    %9 = llvm.icmp "slt" %arg1, %1 : i32
    %10 = llvm.sext %arg1 : i32 to i64
    %11 = llvm.zext %arg0 : i32 to i64
    %12 = llvm.zext %arg2 : i32 to i64
    llvm.br ^bb2(%2 : i64)
  ^bb2(%13: i64):  // 2 preds: ^bb1, ^bb6
    %14 = llvm.or %8, %9 : i1
    llvm.cond_br %14, ^bb6, ^bb3(%2 : i64)
  ^bb3(%15: i64):  // 2 preds: ^bb2, ^bb5
    %16 = llvm.getelementptr inbounds %arg4[%13, %15] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1200 x f64>
    llvm.br ^bb4(%2 : i64)
  ^bb4(%17: i64):  // 2 preds: ^bb3, ^bb4
    %18 = llvm.load %16 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %19 = llvm.getelementptr inbounds %arg5[%15, %17] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %20 = llvm.load %19 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %21 = llvm.fmul %18, %20 : f64
    %22 = llvm.getelementptr inbounds %arg3[%13, %17] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %23 = llvm.load %22 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %24 = llvm.fadd %23, %21 : f64
    llvm.store %24, %22 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %25 = llvm.load %16 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %26 = llvm.or %17, %3 : i64
    %27 = llvm.getelementptr inbounds %arg5[%15, %26] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %28 = llvm.load %27 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %29 = llvm.fmul %25, %28 : f64
    %30 = llvm.getelementptr inbounds %arg3[%13, %26] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %31 = llvm.load %30 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %32 = llvm.fadd %31, %29 : f64
    llvm.store %32, %30 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %33 = llvm.load %16 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %34 = llvm.or %17, %4 : i64
    %35 = llvm.getelementptr inbounds %arg5[%15, %34] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %36 = llvm.load %35 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %37 = llvm.fmul %33, %36 : f64
    %38 = llvm.getelementptr inbounds %arg3[%13, %34] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %39 = llvm.load %38 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %40 = llvm.fadd %39, %37 : f64
    llvm.store %40, %38 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %41 = llvm.load %16 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %42 = llvm.or %17, %5 : i64
    %43 = llvm.getelementptr inbounds %arg5[%15, %42] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %44 = llvm.load %43 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %45 = llvm.fmul %41, %44 : f64
    %46 = llvm.getelementptr inbounds %arg3[%13, %42] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x f64>
    %47 = llvm.load %46 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %48 = llvm.fadd %47, %45 : f64
    llvm.store %48, %46 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %49 = llvm.add %17, %6 overflow<nsw, nuw> : i64
    %50 = llvm.icmp "slt" %49, %10 : i64
    llvm.cond_br %50, ^bb4(%49 : i64), ^bb5 {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %51 = llvm.add %15, %3 overflow<nsw, nuw> : i64
    %52 = llvm.icmp "eq" %51, %12 : i64
    llvm.cond_br %52, ^bb6, ^bb3(%51 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // 2 preds: ^bb2, ^bb5
    %53 = llvm.add %13, %3 overflow<nsw, nuw> : i64
    %54 = llvm.icmp "eq" %53, %11 : i64
    llvm.cond_br %54, ^bb7, ^bb2(%53 : i64) {loop_annotation = #loop_annotation}
  ^bb7:  // 2 preds: ^bb0, ^bb6
    llvm.return
  }
}
