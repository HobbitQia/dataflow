#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32, %arg1: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(0 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(2 : i64) : i64
    %4 = llvm.mlir.constant(3 : i64) : i64
    %5 = llvm.mlir.constant(4 : i64) : i64
    %6 = llvm.icmp "sgt" %arg0, %0 : i32
    llvm.cond_br %6, ^bb1, ^bb3
  ^bb1:  // pred: ^bb0
    %7 = llvm.zext %arg0 : i32 to i64
    llvm.br ^bb2(%1 : i64)
  ^bb2(%8: i64):  // 2 preds: ^bb1, ^bb2
    %9 = llvm.getelementptr inbounds %arg1[%8] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %10 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %11 = llvm.getelementptr inbounds %arg2[%8] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %12 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %13 = llvm.sext %12 : i32 to i64
    %14 = llvm.getelementptr inbounds %arg4[%13] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %15 = llvm.load %14 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.mul %15, %10 overflow<nsw> : i32
    %17 = llvm.getelementptr inbounds %arg3[%8] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %18 = llvm.load %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.sext %18 : i32 to i64
    %20 = llvm.getelementptr inbounds %arg5[%19] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %21 = llvm.load %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.add %21, %16 overflow<nsw> : i32
    llvm.store %22, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.or %8, %2 : i64
    %24 = llvm.getelementptr inbounds %arg1[%23] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.getelementptr inbounds %arg2[%23] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %27 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %28 = llvm.sext %27 : i32 to i64
    %29 = llvm.getelementptr inbounds %arg4[%28] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %30 = llvm.load %29 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %31 = llvm.mul %30, %25 overflow<nsw> : i32
    %32 = llvm.getelementptr inbounds %arg3[%23] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %33 = llvm.load %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %34 = llvm.sext %33 : i32 to i64
    %35 = llvm.getelementptr inbounds %arg5[%34] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %36 = llvm.load %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.add %36, %31 overflow<nsw> : i32
    llvm.store %37, %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %38 = llvm.or %8, %3 : i64
    %39 = llvm.getelementptr inbounds %arg1[%38] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.getelementptr inbounds %arg2[%38] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %42 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.sext %42 : i32 to i64
    %44 = llvm.getelementptr inbounds %arg4[%43] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %45 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.mul %45, %40 overflow<nsw> : i32
    %47 = llvm.getelementptr inbounds %arg3[%38] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %48 = llvm.load %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.sext %48 : i32 to i64
    %50 = llvm.getelementptr inbounds %arg5[%49] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.add %51, %46 overflow<nsw> : i32
    llvm.store %52, %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %53 = llvm.or %8, %4 : i64
    %54 = llvm.getelementptr inbounds %arg1[%53] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %55 = llvm.load %54 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %56 = llvm.getelementptr inbounds %arg2[%53] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %57 = llvm.load %56 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %58 = llvm.sext %57 : i32 to i64
    %59 = llvm.getelementptr inbounds %arg4[%58] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %60 = llvm.load %59 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %61 = llvm.mul %60, %55 overflow<nsw> : i32
    %62 = llvm.getelementptr inbounds %arg3[%53] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %63 = llvm.load %62 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %64 = llvm.sext %63 : i32 to i64
    %65 = llvm.getelementptr inbounds %arg5[%64] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %66 = llvm.load %65 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %67 = llvm.add %66, %61 overflow<nsw> : i32
    llvm.store %67, %65 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %68 = llvm.add %8, %5 overflow<nsw, nuw> : i64
    %69 = llvm.icmp "ult" %68, %7 : i64
    llvm.cond_br %69, ^bb2(%68 : i64), ^bb3 {loop_annotation = #loop_annotation}
  ^bb3:  // 2 preds: ^bb0, ^bb2
    llvm.return
  }
}
