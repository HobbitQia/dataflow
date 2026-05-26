#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1C(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1B(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.addressof @_ZZ4mainE1C : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i8) : i8
    %2 = llvm.mlir.constant(16384 : i64) : i64
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(6 : i64) : i64
    %5 = llvm.mlir.addressof @_ZZ4mainE1A : !llvm.ptr
    %6 = llvm.mlir.addressof @_ZZ4mainE1B : !llvm.ptr
    %7 = llvm.mlir.constant(1 : i64) : i64
    %8 = llvm.mlir.constant(64 : i64) : i64
    %9 = llvm.mlir.poison : vector<4xi32>
    %10 = llvm.mlir.constant(4 : i64) : i64
    %11 = llvm.mlir.constant(60 : i64) : i64
    %12 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%3 : i64)
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb3
    %14 = llvm.shl %13, %4 overflow<nsw> : i64
    llvm.br ^bb2(%3 : i64)
  ^bb2(%15: i64):  // 2 preds: ^bb1, ^bb2
    %16 = llvm.add %15, %14 overflow<nsw, nuw> : i64
    %17 = llvm.add %15, %13 overflow<nsw, nuw> : i64
    %18 = llvm.getelementptr inbounds %5[%3, %16] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %19 = llvm.trunc %17 : i64 to i32
    llvm.store %19, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.sub %13, %15 overflow<nsw> : i64
    %21 = llvm.getelementptr inbounds %6[%3, %16] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %22 = llvm.trunc %20 : i64 to i32
    llvm.store %22, %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %15, %7 overflow<nsw, nuw> : i64
    %24 = llvm.icmp "eq" %23, %8 : i64
    llvm.cond_br %24, ^bb3, ^bb2(%23 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %25 = llvm.add %13, %7 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %8 : i64
    llvm.cond_br %26, ^bb4(%3 : i64), ^bb1(%25 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%27: i64):  // 2 preds: ^bb3, ^bb8
    %28 = llvm.shl %27, %4 overflow<nsw> : i64
    llvm.br ^bb5(%3 : i64)
  ^bb5(%29: i64):  // 2 preds: ^bb4, ^bb7
    %30 = llvm.add %29, %28 overflow<nsw, nuw> : i64
    %31 = llvm.getelementptr inbounds %5[%3, %30] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %32 = llvm.shl %29, %4 overflow<nsw> : i64
    %33 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %34 = llvm.insertelement %33, %9[%3 : i64] : vector<4xi32>
    %35 = llvm.shufflevector %34, %9 [0, 0, 0, 0] : vector<4xi32> 
    llvm.br ^bb6(%3 : i64)
  ^bb6(%36: i64):  // 2 preds: ^bb5, ^bb6
    %37 = llvm.add %36, %32 overflow<nsw, nuw> : i64
    %38 = llvm.getelementptr inbounds %6[%3, %37] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %39 = llvm.add %36, %28 overflow<nsw, nuw> : i64
    %40 = llvm.getelementptr inbounds %0[%3, %39] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %41 = llvm.bitcast %38 : !llvm.ptr to !llvm.ptr
    %42 = llvm.load %41 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> vector<4xi32>
    %43 = llvm.mul %42, %35 overflow<nsw> : vector<4xi32>
    %44 = llvm.bitcast %40 : !llvm.ptr to !llvm.ptr
    %45 = llvm.load %44 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> vector<4xi32>
    %46 = llvm.add %45, %43 overflow<nsw> : vector<4xi32>
    %47 = llvm.bitcast %40 : !llvm.ptr to !llvm.ptr
    llvm.store %46, %47 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : vector<4xi32>, !llvm.ptr
    %48 = llvm.add %36, %10 overflow<nsw, nuw> : i64
    %49 = llvm.icmp "ult" %36, %11 : i64
    llvm.cond_br %49, ^bb6(%48 : i64), ^bb7 {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %50 = llvm.add %29, %7 overflow<nsw, nuw> : i64
    %51 = llvm.icmp "eq" %50, %8 : i64
    llvm.cond_br %51, ^bb8, ^bb5(%50 : i64) {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    %52 = llvm.add %27, %7 overflow<nsw, nuw> : i64
    %53 = llvm.icmp "eq" %52, %8 : i64
    llvm.cond_br %53, ^bb9, ^bb4(%52 : i64) {loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return %12 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(6 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(2 : i64) : i64
    %4 = llvm.mlir.constant(3 : i64) : i64
    %5 = llvm.mlir.constant(4 : i64) : i64
    %6 = llvm.mlir.constant(60 : i64) : i64
    %7 = llvm.mlir.constant(64 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%8: i64):  // 2 preds: ^bb0, ^bb5
    %9 = llvm.shl %8, %1 overflow<nsw> : i64
    llvm.br ^bb2(%0 : i64)
  ^bb2(%10: i64):  // 2 preds: ^bb1, ^bb4
    %11 = llvm.add %10, %9 overflow<nsw, nuw> : i64
    %12 = llvm.getelementptr inbounds %arg1[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %13 = llvm.shl %10, %1 overflow<nsw> : i64
    llvm.br ^bb3(%0 : i64)
  ^bb3(%14: i64):  // 2 preds: ^bb2, ^bb3
    %15 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.add %14, %13 overflow<nsw, nuw> : i64
    %17 = llvm.getelementptr inbounds %arg2[%16] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %18 = llvm.load %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.mul %18, %15 overflow<nsw> : i32
    %20 = llvm.add %14, %9 overflow<nsw, nuw> : i64
    %21 = llvm.getelementptr inbounds %arg0[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %22 = llvm.load %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.add %22, %19 overflow<nsw> : i32
    llvm.store %23, %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.or %16, %2 : i64
    %26 = llvm.getelementptr inbounds %arg2[%25] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %27 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %28 = llvm.mul %27, %24 overflow<nsw> : i32
    %29 = llvm.or %20, %2 : i64
    %30 = llvm.getelementptr inbounds %arg0[%29] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %31 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %32 = llvm.add %31, %28 overflow<nsw> : i32
    llvm.store %32, %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %34 = llvm.or %16, %3 : i64
    %35 = llvm.getelementptr inbounds %arg2[%34] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %36 = llvm.load %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.mul %36, %33 overflow<nsw> : i32
    %38 = llvm.or %20, %3 : i64
    %39 = llvm.getelementptr inbounds %arg0[%38] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.add %40, %37 overflow<nsw> : i32
    llvm.store %41, %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %42 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.or %16, %4 : i64
    %44 = llvm.getelementptr inbounds %arg2[%43] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %45 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.mul %45, %42 overflow<nsw> : i32
    %47 = llvm.or %20, %4 : i64
    %48 = llvm.getelementptr inbounds %arg0[%47] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %49 = llvm.load %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.add %49, %46 overflow<nsw> : i32
    llvm.store %50, %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %51 = llvm.add %14, %5 overflow<nsw, nuw> : i64
    %52 = llvm.icmp "ult" %14, %6 : i64
    llvm.cond_br %52, ^bb3(%51 : i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    %53 = llvm.add %10, %2 overflow<nsw, nuw> : i64
    %54 = llvm.icmp "eq" %53, %7 : i64
    llvm.cond_br %54, ^bb5, ^bb2(%53 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %55 = llvm.add %8, %2 overflow<nsw, nuw> : i64
    %56 = llvm.icmp "eq" %55, %7 : i64
    llvm.cond_br %56, ^bb6, ^bb1(%55 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    llvm.return
  }
}
