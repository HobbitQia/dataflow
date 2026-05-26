#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE9data_real(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE9data_imag(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE9data_real : !llvm.ptr
    %2 = llvm.mlir.addressof @_ZZ4mainE9data_imag : !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(256 : i64) : i64
    %6 = llvm.mlir.constant(128 : i64) : i64
    %7 = llvm.mlir.constant(129 : i64) : i64
    %8 = llvm.mlir.constant(2 : i64) : i64
    %9 = llvm.mlir.constant(126 : i64) : i64
    %10 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%11: i64):  // 2 preds: ^bb0, ^bb1
    %12 = llvm.getelementptr inbounds %1[%0, %11] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %13 = llvm.trunc %11 : i64 to i32
    llvm.store %13, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %14 = llvm.getelementptr inbounds %2[%0, %11] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    llvm.store %3, %14 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %15 = llvm.add %11, %4 overflow<nsw, nuw> : i64
    %16 = llvm.icmp "eq" %15, %5 : i64
    llvm.cond_br %16, ^bb2(%0 : i64), ^bb1(%15 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%17: i64):  // 2 preds: ^bb1, ^bb2
    %18 = llvm.add %17, %6 overflow<nsw, nuw> : i64
    %19 = llvm.getelementptr inbounds %1[%0, %18] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %20 = llvm.load %19 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.shl %20, %3 overflow<nsw> : i32
    %22 = llvm.getelementptr inbounds %2[%0, %18] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %23 = llvm.load %22 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.shl %23, %3 overflow<nsw> : i32
    %25 = llvm.sub %21, %24 overflow<nsw> : i32
    %26 = llvm.add %24, %21 overflow<nsw> : i32
    %27 = llvm.getelementptr inbounds %1[%0, %17] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %28 = llvm.load %27 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.sub %28, %25 overflow<nsw> : i32
    llvm.store %29, %19 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %30 = llvm.add %25, %28 overflow<nsw> : i32
    llvm.store %30, %27 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %31 = llvm.getelementptr inbounds %2[%0, %17] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %32 = llvm.load %31 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.sub %32, %26 overflow<nsw> : i32
    llvm.store %33, %22 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %34 = llvm.add %32, %26 overflow<nsw> : i32
    llvm.store %34, %31 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %35 = llvm.add %17, %7 overflow<nsw, nuw> : i64
    %36 = llvm.getelementptr inbounds %1[%0, %35] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %37 = llvm.load %36 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %38 = llvm.shl %37, %3 overflow<nsw> : i32
    %39 = llvm.getelementptr inbounds %2[%0, %35] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.shl %40, %3 overflow<nsw> : i32
    %42 = llvm.sub %38, %41 overflow<nsw> : i32
    %43 = llvm.add %41, %38 overflow<nsw> : i32
    %44 = llvm.or %17, %4 : i64
    %45 = llvm.getelementptr inbounds %1[%0, %44] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %46 = llvm.load %45 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %47 = llvm.sub %46, %42 overflow<nsw> : i32
    llvm.store %47, %36 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %48 = llvm.add %42, %46 overflow<nsw> : i32
    llvm.store %48, %45 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %49 = llvm.getelementptr inbounds %2[%0, %44] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %50 = llvm.load %49 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %51 = llvm.sub %50, %43 overflow<nsw> : i32
    llvm.store %51, %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %52 = llvm.add %50, %43 overflow<nsw> : i32
    llvm.store %52, %49 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %53 = llvm.add %17, %8 overflow<nsw, nuw> : i64
    %54 = llvm.icmp "ult" %17, %9 : i64
    llvm.cond_br %54, ^bb2(%53 : i64), ^bb3 {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.return %10 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiS_iil(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: i32 {llvm.noundef}, %arg3: i32 {llvm.noundef}, %arg4: i64 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(128 : i64) : i64
    %2 = llvm.mlir.constant(129 : i64) : i64
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.mlir.constant(2 : i64) : i64
    %5 = llvm.mlir.constant(126 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%6: i64):  // 2 preds: ^bb0, ^bb1
    %7 = llvm.add %6, %arg4 overflow<nsw> : i64
    %8 = llvm.add %7, %1 : i64
    %9 = llvm.getelementptr inbounds %arg0[%8] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %10 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %11 = llvm.mul %10, %arg2 overflow<nsw> : i32
    %12 = llvm.getelementptr inbounds %arg1[%8] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %13 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %14 = llvm.mul %13, %arg3 overflow<nsw> : i32
    %15 = llvm.sub %11, %14 overflow<nsw> : i32
    %16 = llvm.mul %10, %arg3 overflow<nsw> : i32
    %17 = llvm.mul %13, %arg2 overflow<nsw> : i32
    %18 = llvm.add %17, %16 overflow<nsw> : i32
    %19 = llvm.getelementptr inbounds %arg0[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %20 = llvm.load %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.sub %20, %15 overflow<nsw> : i32
    llvm.store %21, %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.add %20, %15 overflow<nsw> : i32
    llvm.store %22, %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.getelementptr inbounds %arg1[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %24 = llvm.load %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.sub %24, %18 overflow<nsw> : i32
    llvm.store %25, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %26 = llvm.add %24, %18 overflow<nsw> : i32
    llvm.store %26, %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %27 = llvm.add %7, %2 : i64
    %28 = llvm.getelementptr inbounds %arg0[%27] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %29 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.mul %29, %arg2 overflow<nsw> : i32
    %31 = llvm.getelementptr inbounds %arg1[%27] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.mul %32, %arg3 overflow<nsw> : i32
    %34 = llvm.sub %30, %33 overflow<nsw> : i32
    %35 = llvm.mul %29, %arg3 overflow<nsw> : i32
    %36 = llvm.mul %32, %arg2 overflow<nsw> : i32
    %37 = llvm.add %36, %35 overflow<nsw> : i32
    %38 = llvm.add %7, %3 overflow<nsw> : i64
    %39 = llvm.getelementptr inbounds %arg0[%38] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.sub %40, %34 overflow<nsw> : i32
    llvm.store %41, %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %42 = llvm.add %40, %34 overflow<nsw> : i32
    llvm.store %42, %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %43 = llvm.getelementptr inbounds %arg1[%38] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %44 = llvm.load %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.sub %44, %37 overflow<nsw> : i32
    llvm.store %45, %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %46 = llvm.add %44, %37 overflow<nsw> : i32
    llvm.store %46, %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.add %6, %4 overflow<nsw, nuw> : i64
    %48 = llvm.icmp "ult" %6, %5 : i64
    llvm.cond_br %48, ^bb1(%47 : i64), ^bb2 {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
