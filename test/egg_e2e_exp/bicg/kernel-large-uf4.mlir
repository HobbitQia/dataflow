#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "double", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture}, %arg4: !llvm.ptr {llvm.nocapture}, %arg5: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg6: !llvm.ptr {llvm.nocapture, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(3 : i64) : i64
    %2 = llvm.mlir.constant(0 : i8) : i8
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %5 = llvm.mlir.constant(1 : i64) : i64
    %6 = llvm.mlir.constant(2 : i64) : i64
    %7 = llvm.mlir.constant(4 : i64) : i64
    %8 = llvm.bitcast %arg4 : !llvm.ptr to !llvm.ptr
    %9 = llvm.icmp "sgt" %arg0, %0 : i32
    llvm.cond_br %9, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %10 = llvm.bitcast %arg3 : !llvm.ptr to !llvm.ptr
    %11 = llvm.zext %arg0 : i32 to i64
    %12 = llvm.shl %11, %1 overflow<nsw, nuw> : i64
    "llvm.intr.memset"(%10, %2, %12) <{isVolatile = false}> : (!llvm.ptr, i8, i64) -> ()
    %13 = llvm.icmp "sgt" %arg1, %0 : i32
    llvm.cond_br %13, ^bb4, ^bb8
  ^bb2:  // pred: ^bb0
    %14 = llvm.icmp "sgt" %arg1, %0 : i32
    llvm.cond_br %14, ^bb3, ^bb8
  ^bb3:  // pred: ^bb2
    %15 = llvm.zext %arg1 : i32 to i64
    %16 = llvm.shl %15, %1 overflow<nsw, nuw> : i64
    "llvm.intr.memset"(%8, %2, %16) <{isVolatile = false}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb8
  ^bb4:  // pred: ^bb1
    %17 = llvm.sext %arg0 : i32 to i64
    %18 = llvm.zext %arg1 : i32 to i64
    llvm.br ^bb5(%3 : i64)
  ^bb5(%19: i64):  // 2 preds: ^bb4, ^bb7
    %20 = llvm.getelementptr inbounds %arg4[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %4, %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %21 = llvm.getelementptr inbounds %arg6[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.br ^bb6(%3 : i64)
  ^bb6(%22: i64):  // 2 preds: ^bb5, ^bb6
    %23 = llvm.getelementptr inbounds %arg3[%22] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %24 = llvm.load %23 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %25 = llvm.load %21 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %26 = llvm.getelementptr inbounds %arg2[%19, %22] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1900 x f64>
    %27 = llvm.load %26 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %28 = llvm.fmul %25, %27 : f64
    %29 = llvm.fadd %24, %28 : f64
    llvm.store %29, %23 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %30 = llvm.load %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %31 = llvm.load %26 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %32 = llvm.getelementptr inbounds %arg5[%22] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %33 = llvm.load %32 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %34 = llvm.fmul %31, %33 : f64
    %35 = llvm.fadd %30, %34 : f64
    llvm.store %35, %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %36 = llvm.or %22, %5 : i64
    %37 = llvm.getelementptr inbounds %arg3[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %38 = llvm.load %37 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %39 = llvm.load %21 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %40 = llvm.getelementptr inbounds %arg2[%19, %36] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1900 x f64>
    %41 = llvm.load %40 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %42 = llvm.fmul %39, %41 : f64
    %43 = llvm.fadd %38, %42 : f64
    llvm.store %43, %37 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %44 = llvm.load %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %45 = llvm.load %40 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %46 = llvm.getelementptr inbounds %arg5[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %47 = llvm.load %46 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %48 = llvm.fmul %45, %47 : f64
    %49 = llvm.fadd %44, %48 : f64
    llvm.store %49, %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %50 = llvm.or %22, %6 : i64
    %51 = llvm.getelementptr inbounds %arg3[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %52 = llvm.load %51 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %53 = llvm.load %21 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %54 = llvm.getelementptr inbounds %arg2[%19, %50] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1900 x f64>
    %55 = llvm.load %54 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %56 = llvm.fmul %53, %55 : f64
    %57 = llvm.fadd %52, %56 : f64
    llvm.store %57, %51 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %58 = llvm.load %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %59 = llvm.load %54 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %60 = llvm.getelementptr inbounds %arg5[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %61 = llvm.load %60 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %62 = llvm.fmul %59, %61 : f64
    %63 = llvm.fadd %58, %62 : f64
    llvm.store %63, %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %64 = llvm.or %22, %1 : i64
    %65 = llvm.getelementptr inbounds %arg3[%64] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %66 = llvm.load %65 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %67 = llvm.load %21 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %68 = llvm.getelementptr inbounds %arg2[%19, %64] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1900 x f64>
    %69 = llvm.load %68 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %70 = llvm.fmul %67, %69 : f64
    %71 = llvm.fadd %66, %70 : f64
    llvm.store %71, %65 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %72 = llvm.load %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %73 = llvm.load %68 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %74 = llvm.getelementptr inbounds %arg5[%64] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %75 = llvm.load %74 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> f64
    %76 = llvm.fmul %73, %75 : f64
    %77 = llvm.fadd %72, %76 : f64
    llvm.store %77, %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : f64, !llvm.ptr
    %78 = llvm.add %22, %7 overflow<nsw, nuw> : i64
    %79 = llvm.icmp "slt" %78, %17 : i64
    llvm.cond_br %79, ^bb6(%78 : i64), ^bb7 {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %80 = llvm.add %19, %5 overflow<nsw, nuw> : i64
    %81 = llvm.icmp "eq" %80, %18 : i64
    llvm.cond_br %81, ^bb8, ^bb5(%80 : i64) {loop_annotation = #loop_annotation}
  ^bb8:  // 4 preds: ^bb1, ^bb2, ^bb3, ^bb7
    llvm.return
  }
}
