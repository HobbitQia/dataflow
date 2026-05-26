#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr constant @_ZZ4mainE11coefficient(dense<[25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560]> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<16 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5state(dense<0> : tensor<12xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<12 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.addressof @_ZZ4mainE5state : !llvm.ptr
    %3 = llvm.mlir.constant(12 : i64) : i64
    %4 = llvm.getelementptr inbounds %2[%0, %1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %5 = llvm.mlir.addressof @_ZZ4mainE11coefficient : !llvm.ptr
    %6 = llvm.mlir.constant(2 : i64) : i64
    %7 = llvm.mlir.constant(3 : i64) : i64
    %8 = llvm.mlir.constant(6 : i64) : i64
    %9 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb1
    %11 = llvm.add %10, %1 overflow<nsw, nuw> : i64
    %12 = llvm.getelementptr inbounds %2[%0, %10] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %13 = llvm.trunc %11 : i64 to i32
    llvm.store %13, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %14 = llvm.icmp "eq" %11, %3 : i64
    llvm.cond_br %14, ^bb2, ^bb1(%11 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %15 = llvm.load %2 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.load %4 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb3(%16, %15, %0 : i32, i32, i64)
  ^bb3(%17: i32, %18: i32, %19: i64):  // 2 preds: ^bb2, ^bb3
    %20 = llvm.shl %19, %1 overflow<nsw, nuw> : i64
    %21 = llvm.getelementptr inbounds %5[%0, %20] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %22 = llvm.load %21 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.or %20, %1 : i64
    %24 = llvm.getelementptr inbounds %5[%0, %23] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.add %19, %6 overflow<nsw, nuw> : i64
    %27 = llvm.getelementptr inbounds %2[%0, %26] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %28 = llvm.load %27 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %17, %27 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %29 = llvm.mul %25, %18 overflow<nsw> : i32
    %30 = llvm.mul %28, %22 overflow<nsw> : i32
    %31 = llvm.sub %29, %30 overflow<nsw> : i32
    %32 = llvm.mul %28, %25 overflow<nsw> : i32
    %33 = llvm.mul %22, %18 overflow<nsw> : i32
    %34 = llvm.add %32, %33 overflow<nsw> : i32
    %35 = llvm.or %20, %6 : i64
    %36 = llvm.getelementptr inbounds %5[%0, %35] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %37 = llvm.load %36 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %38 = llvm.or %20, %7 : i64
    %39 = llvm.getelementptr inbounds %5[%0, %38] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.add %19, %7 overflow<nsw, nuw> : i64
    %42 = llvm.getelementptr inbounds %2[%0, %41] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %43 = llvm.load %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %34, %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %44 = llvm.mul %40, %31 overflow<nsw> : i32
    %45 = llvm.mul %43, %37 overflow<nsw> : i32
    %46 = llvm.sub %44, %45 overflow<nsw> : i32
    llvm.store %46, %2 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.mul %43, %40 overflow<nsw> : i32
    %48 = llvm.mul %37, %31 overflow<nsw> : i32
    %49 = llvm.add %47, %48 overflow<nsw> : i32
    llvm.store %49, %4 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.icmp "ult" %19, %8 : i64
    llvm.cond_br %50, ^bb3(%49, %46, %26 : i32, i32, i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %9 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiPKi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(0 : i64) : i64
    %2 = llvm.mlir.constant(2 : i64) : i64
    %3 = llvm.mlir.constant(3 : i64) : i64
    %4 = llvm.mlir.constant(6 : i64) : i64
    %5 = llvm.getelementptr inbounds %arg0[%0] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %6 = llvm.load %arg0 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %7 = llvm.load %5 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb1(%7, %6, %1 : i32, i32, i64)
  ^bb1(%8: i32, %9: i32, %10: i64):  // 2 preds: ^bb0, ^bb1
    %11 = llvm.shl %10, %0 overflow<nsw, nuw> : i64
    %12 = llvm.getelementptr inbounds %arg1[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %13 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %14 = llvm.or %11, %0 : i64
    %15 = llvm.getelementptr inbounds %arg1[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %16 = llvm.load %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %17 = llvm.add %10, %2 overflow<nsw, nuw> : i64
    %18 = llvm.getelementptr inbounds %arg0[%17] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %19 = llvm.load %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %8, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.mul %9, %16 overflow<nsw> : i32
    %21 = llvm.mul %19, %13 overflow<nsw> : i32
    %22 = llvm.sub %20, %21 overflow<nsw> : i32
    %23 = llvm.mul %19, %16 overflow<nsw> : i32
    %24 = llvm.mul %9, %13 overflow<nsw> : i32
    %25 = llvm.add %23, %24 overflow<nsw> : i32
    %26 = llvm.or %11, %2 : i64
    %27 = llvm.getelementptr inbounds %arg1[%26] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %28 = llvm.load %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.or %11, %3 : i64
    %30 = llvm.getelementptr inbounds %arg1[%29] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %31 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %32 = llvm.add %10, %3 overflow<nsw, nuw> : i64
    %33 = llvm.getelementptr inbounds %arg0[%32] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %34 = llvm.load %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %25, %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %35 = llvm.mul %31, %22 overflow<nsw> : i32
    %36 = llvm.mul %34, %28 overflow<nsw> : i32
    %37 = llvm.sub %35, %36 overflow<nsw> : i32
    llvm.store %37, %arg0 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %38 = llvm.mul %34, %31 overflow<nsw> : i32
    %39 = llvm.mul %28, %22 overflow<nsw> : i32
    %40 = llvm.add %38, %39 overflow<nsw> : i32
    llvm.store %40, %5 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %41 = llvm.icmp "ult" %10, %4 : i64
    llvm.cond_br %41, ^bb1(%40, %37, %17 : i32, i32, i64), ^bb2 {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
