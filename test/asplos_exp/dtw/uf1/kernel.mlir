#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1S(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<512 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1T(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<512 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3DTW(dense<0> : tensor<263169xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<263169 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.addressof @_ZZ4mainE1S : !llvm.ptr
    %3 = llvm.mlir.addressof @_ZZ4mainE1T : !llvm.ptr
    %4 = llvm.mlir.constant(3 : i32) : i32
    %5 = llvm.mlir.constant(512 : i64) : i64
    %6 = llvm.mlir.addressof @_ZZ4mainE3DTW : !llvm.ptr
    %7 = llvm.mlir.constant(65535 : i32) : i32
    %8 = llvm.mlir.constant(263169 : i64) : i64
    %9 = llvm.mlir.constant(0 : i32) : i32
    %10 = llvm.mlir.constant(513 : i64) : i64
    %11 = llvm.mlir.constant(-513 : i64) : i64
    %12 = llvm.mlir.constant(-1 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb1
    %14 = llvm.add %13, %1 overflow<nsw, nuw> : i64
    %15 = llvm.getelementptr inbounds %2[%0, %13] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %16 = llvm.trunc %14 : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.getelementptr inbounds %3[%0, %13] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %18 = llvm.trunc %13 : i64 to i32
    %19 = llvm.add %18, %4 : i32
    llvm.store %19, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.icmp "eq" %14, %5 : i64
    llvm.cond_br %20, ^bb2(%0 : i64), ^bb1(%14 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%21: i64):  // 2 preds: ^bb1, ^bb2
    %22 = llvm.getelementptr inbounds %6[%0, %21] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %7, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %21, %1 overflow<nsw, nuw> : i64
    %24 = llvm.icmp "eq" %23, %8 : i64
    llvm.cond_br %24, ^bb3, ^bb2(%23 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.store %9, %6 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb4(%1 : i64)
  ^bb4(%25: i64):  // 2 preds: ^bb3, ^bb6
    %26 = llvm.getelementptr inbounds %2[%0, %25] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %27 = llvm.mul %25, %10 overflow<nsw, nuw> : i64
    %28 = llvm.add %27, %10 overflow<nsw, nuw> : i64
    %29 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb5(%1 : i64)
  ^bb5(%30: i64):  // 2 preds: ^bb4, ^bb5
    %31 = llvm.getelementptr inbounds %3[%0, %30] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.sub %29, %32 overflow<nsw> : i32
    %34 = llvm.sub %32, %29 overflow<nsw> : i32
    %35 = llvm.icmp "sgt" %34, %33 : i32
    %36 = llvm.select %35, %34, %33 : i1, i32
    %37 = llvm.add %30, %27 overflow<nsw, nuw> : i64
    %38 = llvm.add %37, %11 overflow<nsw> : i64
    %39 = llvm.getelementptr inbounds %6[%0, %38] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.getelementptr inbounds %6[%0, %37] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %42 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.add %37, %12 overflow<nsw> : i64
    %44 = llvm.getelementptr inbounds %6[%0, %43] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %45 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.icmp "slt" %42, %40 : i32
    %47 = llvm.select %46, %42, %40 : i1, i32
    %48 = llvm.icmp "slt" %45, %47 : i32
    %49 = llvm.select %48, %45, %47 : i1, i32
    %50 = llvm.add %49, %36 overflow<nsw> : i32
    %51 = llvm.add %30, %1 overflow<nsw, nuw> : i64
    %52 = llvm.add %28, %51 overflow<nsw, nuw> : i64
    %53 = llvm.getelementptr inbounds %6[%0, %52] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %50, %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %54 = llvm.icmp "eq" %51, %5 : i64
    llvm.cond_br %54, ^bb6, ^bb5(%51 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    %55 = llvm.add %25, %1 overflow<nsw, nuw> : i64
    %56 = llvm.icmp "eq" %55, %5 : i64
    llvm.cond_br %56, ^bb7, ^bb4(%55 : i64) {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    llvm.return %9 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(513 : i64) : i64
    %2 = llvm.mlir.constant(-513 : i64) : i64
    %3 = llvm.mlir.constant(-1 : i64) : i64
    %4 = llvm.mlir.constant(512 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%5: i64):  // 2 preds: ^bb0, ^bb3
    %6 = llvm.getelementptr inbounds %arg0[%5] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %7 = llvm.mul %5, %1 overflow<nsw, nuw> : i64
    %8 = llvm.add %7, %1 overflow<nsw, nuw> : i64
    llvm.br ^bb2(%0 : i64)
  ^bb2(%9: i64):  // 2 preds: ^bb1, ^bb2
    %10 = llvm.load %6 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %11 = llvm.getelementptr inbounds %arg1[%9] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %12 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %13 = llvm.sub %10, %12 overflow<nsw> : i32
    %14 = llvm.sub %12, %10 overflow<nsw> : i32
    %15 = llvm.icmp "sgt" %14, %13 : i32
    %16 = llvm.select %15, %14, %13 : i1, i32
    %17 = llvm.add %9, %7 overflow<nsw, nuw> : i64
    %18 = llvm.add %17, %2 overflow<nsw> : i64
    %19 = llvm.getelementptr inbounds %arg2[%18] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %20 = llvm.load %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.getelementptr inbounds %arg2[%17] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %22 = llvm.load %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.add %17, %3 overflow<nsw> : i64
    %24 = llvm.getelementptr inbounds %arg2[%23] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.icmp "slt" %22, %20 : i32
    %27 = llvm.select %26, %22, %20 : i1, i32
    %28 = llvm.icmp "slt" %25, %27 : i32
    %29 = llvm.select %28, %25, %27 : i1, i32
    %30 = llvm.add %29, %16 overflow<nsw> : i32
    %31 = llvm.add %9, %0 overflow<nsw, nuw> : i64
    %32 = llvm.add %8, %31 overflow<nsw, nuw> : i64
    %33 = llvm.getelementptr inbounds %arg2[%32] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %30, %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %34 = llvm.icmp "eq" %31, %4 : i64
    llvm.cond_br %34, ^bb3, ^bb2(%31 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %35 = llvm.add %5, %0 overflow<nsw, nuw> : i64
    %36 = llvm.icmp "eq" %35, %4 : i64
    llvm.cond_br %36, ^bb4, ^bb1(%35 : i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return
  }
}
