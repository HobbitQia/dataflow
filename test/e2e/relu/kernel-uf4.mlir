#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr {llvm.nocapture}, %arg4: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture, llvm.readnone}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(70 : i16) : i16
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(70 : i32) : i32
    %4 = llvm.mlir.constant(2 : i32) : i32
    %5 = llvm.mlir.constant(3 : i32) : i32
    %6 = llvm.mlir.constant(4 : i32) : i32
    %7 = llvm.mlir.constant(4196 : i32) : i32
    llvm.br ^bb1(%0 : i32)
  ^bb1(%8: i32):  // 2 preds: ^bb0, ^bb1
    %9 = llvm.trunc %8 : i32 to i16
    %10 = llvm.udiv %9, %1 : i16
    %11 = llvm.urem %9, %1 : i16
    %12 = llvm.zext %10 : i16 to i64
    %13 = llvm.zext %11 : i16 to i64
    %14 = llvm.getelementptr inbounds %arg4[%12, %13] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    %15 = llvm.load %14 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.icmp "sgt" %15, %0 : i32
    %17 = llvm.select %16, %15, %0 : i1, i32
    %18 = llvm.getelementptr inbounds %arg3[%12, %13] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    llvm.store %17, %18 {alignment = 4 : i64} : i32, !llvm.ptr
    %19 = llvm.or %8, %2 : i32
    %20 = llvm.urem %19, %3 : i32
    %21 = llvm.zext %20 : i32 to i64
    %22 = llvm.getelementptr inbounds %arg4[%12, %21] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    %23 = llvm.load %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.icmp "sgt" %23, %0 : i32
    %25 = llvm.select %24, %23, %0 : i1, i32
    %26 = llvm.getelementptr inbounds %arg3[%12, %21] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    llvm.store %25, %26 {alignment = 4 : i64} : i32, !llvm.ptr
    %27 = llvm.or %8, %4 : i32
    %28 = llvm.udiv %27, %3 : i32
    %29 = llvm.urem %27, %3 : i32
    %30 = llvm.zext %28 : i32 to i64
    %31 = llvm.zext %29 : i32 to i64
    %32 = llvm.getelementptr inbounds %arg4[%30, %31] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    %33 = llvm.load %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %34 = llvm.icmp "sgt" %33, %0 : i32
    %35 = llvm.select %34, %33, %0 : i1, i32
    %36 = llvm.getelementptr inbounds %arg3[%30, %31] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    llvm.store %35, %36 {alignment = 4 : i64} : i32, !llvm.ptr
    %37 = llvm.or %8, %5 : i32
    %38 = llvm.udiv %37, %3 : i32
    %39 = llvm.urem %37, %3 : i32
    %40 = llvm.zext %38 : i32 to i64
    %41 = llvm.zext %39 : i32 to i64
    %42 = llvm.getelementptr inbounds %arg4[%40, %41] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    %43 = llvm.load %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.icmp "sgt" %43, %0 : i32
    %45 = llvm.select %44, %43, %0 : i1, i32
    %46 = llvm.getelementptr inbounds %arg3[%40, %41] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    llvm.store %45, %46 {alignment = 4 : i64} : i32, !llvm.ptr
    %47 = llvm.add %8, %6 overflow<nsw, nuw> : i32
    %48 = llvm.icmp "ult" %8, %7 : i32
    llvm.cond_br %48, ^bb1(%47 : i32), ^bb2 {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
