#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external local_unnamed_addr @input_data(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global external local_unnamed_addr @hist(dense<0> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<16 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @input_data : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(1024 : i64) : i64
    %4 = llvm.mlir.addressof @hist : !llvm.ptr
    %5 = llvm.mlir.constant(0 : i8) : i8
    %6 = llvm.mlir.constant(64 : i64) : i64
    %7 = llvm.mlir.constant(4 : i32) : i32
    %8 = llvm.mlir.constant(1023 : i32) : i32
    %9 = llvm.mlir.constant(1 : i32) : i32
    %10 = llvm.mlir.constant(2 : i64) : i64
    %11 = llvm.mlir.constant(3 : i64) : i64
    %12 = llvm.mlir.constant(4 : i64) : i64
    %13 = llvm.mlir.constant(1020 : i64) : i64
    %14 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%15: i64):  // 2 preds: ^bb0, ^bb1
    %16 = llvm.getelementptr inbounds %1[%0, %15] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %17 = llvm.trunc %15 : i64 to i32
    llvm.store %17, %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %18 = llvm.add %15, %2 overflow<nsw, nuw> : i64
    %19 = llvm.icmp "eq" %18, %3 : i64
    llvm.cond_br %19, ^bb2, ^bb1(%18 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    "llvm.intr.memset"(%4, %5, %6) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb3(%0 : i64)
  ^bb3(%20: i64):  // 2 preds: ^bb2, ^bb3
    %21 = llvm.getelementptr inbounds %1[%0, %20] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %22 = llvm.load %21 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.shl %22, %7 overflow<nsw> : i32
    %24 = llvm.sdiv %23, %8 : i32
    %25 = llvm.sext %24 : i32 to i64
    %26 = llvm.getelementptr inbounds %4[%0, %25] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %27 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %28 = llvm.add %27, %9 overflow<nsw> : i32
    llvm.store %28, %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %29 = llvm.or %20, %2 : i64
    %30 = llvm.getelementptr inbounds %1[%0, %29] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %31 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %32 = llvm.shl %31, %7 overflow<nsw> : i32
    %33 = llvm.sdiv %32, %8 : i32
    %34 = llvm.sext %33 : i32 to i64
    %35 = llvm.getelementptr inbounds %4[%0, %34] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %36 = llvm.load %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.add %36, %9 overflow<nsw> : i32
    llvm.store %37, %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %38 = llvm.or %20, %10 : i64
    %39 = llvm.getelementptr inbounds %1[%0, %38] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %40 = llvm.load %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.shl %40, %7 overflow<nsw> : i32
    %42 = llvm.sdiv %41, %8 : i32
    %43 = llvm.sext %42 : i32 to i64
    %44 = llvm.getelementptr inbounds %4[%0, %43] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %45 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.add %45, %9 overflow<nsw> : i32
    llvm.store %46, %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.or %20, %11 : i64
    %48 = llvm.getelementptr inbounds %1[%0, %47] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %49 = llvm.load %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.shl %49, %7 overflow<nsw> : i32
    %51 = llvm.sdiv %50, %8 : i32
    %52 = llvm.sext %51 : i32 to i64
    %53 = llvm.getelementptr inbounds %4[%0, %52] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %54 = llvm.load %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.add %54, %9 overflow<nsw> : i32
    llvm.store %55, %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %56 = llvm.add %20, %12 overflow<nsw, nuw> : i64
    %57 = llvm.icmp "ult" %20, %13 : i64
    llvm.cond_br %57, ^bb3(%56 : i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %14 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(4 : i32) : i32
    %2 = llvm.mlir.constant(1023 : i32) : i32
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(2 : i64) : i64
    %6 = llvm.mlir.constant(3 : i64) : i64
    %7 = llvm.mlir.constant(4 : i64) : i64
    %8 = llvm.mlir.constant(1020 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%9: i64):  // 2 preds: ^bb0, ^bb1
    %10 = llvm.getelementptr inbounds %arg0[%9] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %11 = llvm.load %10 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %12 = llvm.shl %11, %1 overflow<nsw> : i32
    %13 = llvm.sdiv %12, %2 : i32
    %14 = llvm.sext %13 : i32 to i64
    %15 = llvm.getelementptr inbounds %arg1[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %16 = llvm.load %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %17 = llvm.add %16, %3 overflow<nsw> : i32
    llvm.store %17, %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %18 = llvm.or %9, %4 : i64
    %19 = llvm.getelementptr inbounds %arg0[%18] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %20 = llvm.load %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.shl %20, %1 overflow<nsw> : i32
    %22 = llvm.sdiv %21, %2 : i32
    %23 = llvm.sext %22 : i32 to i64
    %24 = llvm.getelementptr inbounds %arg1[%23] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.add %25, %3 overflow<nsw> : i32
    llvm.store %26, %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %27 = llvm.or %9, %5 : i64
    %28 = llvm.getelementptr inbounds %arg0[%27] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %29 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.shl %29, %1 overflow<nsw> : i32
    %31 = llvm.sdiv %30, %2 : i32
    %32 = llvm.sext %31 : i32 to i64
    %33 = llvm.getelementptr inbounds %arg1[%32] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %34 = llvm.load %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.add %34, %3 overflow<nsw> : i32
    llvm.store %35, %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %36 = llvm.or %9, %6 : i64
    %37 = llvm.getelementptr inbounds %arg0[%36] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %38 = llvm.load %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.shl %38, %1 overflow<nsw> : i32
    %40 = llvm.sdiv %39, %2 : i32
    %41 = llvm.sext %40 : i32 to i64
    %42 = llvm.getelementptr inbounds %arg1[%41] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %43 = llvm.load %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.add %43, %3 overflow<nsw> : i32
    llvm.store %44, %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %45 = llvm.add %9, %7 overflow<nsw, nuw> : i64
    %46 = llvm.icmp "ult" %9, %8 : i64
    llvm.cond_br %46, ^bb1(%45 : i64), ^bb2 {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
