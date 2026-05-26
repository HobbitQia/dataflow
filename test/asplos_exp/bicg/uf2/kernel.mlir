#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external local_unnamed_addr @A(dense<0> : tensor<256x256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x array<256 x i32>>
  llvm.mlir.global external local_unnamed_addr @r(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @p(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @s(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @q(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @r : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(255 : i32) : i32
    %4 = llvm.mlir.addressof @A : !llvm.ptr
    %5 = llvm.mlir.constant(256 : i64) : i64
    %6 = llvm.mlir.addressof @p : !llvm.ptr
    %7 = llvm.mlir.addressof @s : !llvm.ptr
    %8 = llvm.mlir.constant(0 : i8) : i8
    %9 = llvm.mlir.constant(1024 : i64) : i64
    %10 = llvm.mlir.addressof @q : !llvm.ptr
    %11 = llvm.mlir.constant(0 : i32) : i32
    %12 = llvm.mlir.constant(2 : i64) : i64
    %13 = llvm.mlir.constant(254 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%14: i64):  // 2 preds: ^bb0, ^bb3
    %15 = llvm.getelementptr inbounds %1[%0, %14] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %16 = llvm.trunc %14 : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb2(%0 : i64)
  ^bb2(%17: i64):  // 2 preds: ^bb1, ^bb2
    %18 = llvm.add %17, %2 overflow<nsw, nuw> : i64
    %19 = llvm.mul %18, %14 overflow<nsw, nuw> : i64
    %20 = llvm.trunc %19 : i64 to i32
    %21 = llvm.and %20, %3 : i32
    %22 = llvm.getelementptr inbounds %4[%0, %14, %17] : (!llvm.ptr, i64, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    llvm.store %21, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.icmp "eq" %18, %5 : i64
    llvm.cond_br %23, ^bb3, ^bb2(%18 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %24 = llvm.add %14, %2 overflow<nsw, nuw> : i64
    %25 = llvm.icmp "eq" %24, %5 : i64
    llvm.cond_br %25, ^bb4(%0 : i64), ^bb1(%24 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%26: i64):  // 2 preds: ^bb3, ^bb4
    %27 = llvm.getelementptr inbounds %6[%0, %26] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %28 = llvm.trunc %26 : i64 to i32
    llvm.store %28, %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %29 = llvm.add %26, %2 overflow<nsw, nuw> : i64
    %30 = llvm.icmp "eq" %29, %5 : i64
    llvm.cond_br %30, ^bb5, ^bb4(%29 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    "llvm.intr.memset"(%7, %8, %9) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb6(%0 : i64)
  ^bb6(%31: i64):  // 2 preds: ^bb5, ^bb8
    %32 = llvm.getelementptr inbounds %10[%0, %31] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %33 = llvm.getelementptr inbounds %1[%0, %31] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %34 = llvm.load %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb7(%11, %0 : i32, i64)
  ^bb7(%35: i32, %36: i64):  // 2 preds: ^bb6, ^bb7
    %37 = llvm.getelementptr inbounds %7[%0, %36] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %38 = llvm.load %37 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.getelementptr inbounds %4[%0, %31, %36] : (!llvm.ptr, i64, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    %40 = llvm.load %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.mul %40, %34 overflow<nsw> : i32
    %42 = llvm.add %41, %38 overflow<nsw> : i32
    llvm.store %42, %37 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %43 = llvm.getelementptr inbounds %6[%0, %36] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %44 = llvm.load %43 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.mul %44, %40 overflow<nsw> : i32
    %46 = llvm.add %45, %35 overflow<nsw> : i32
    %47 = llvm.or %36, %2 : i64
    %48 = llvm.getelementptr inbounds %7[%0, %47] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %49 = llvm.load %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.getelementptr inbounds %4[%0, %31, %47] : (!llvm.ptr, i64, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.mul %51, %34 overflow<nsw> : i32
    %53 = llvm.add %52, %49 overflow<nsw> : i32
    llvm.store %53, %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %54 = llvm.getelementptr inbounds %6[%0, %47] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %55 = llvm.load %54 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %56 = llvm.mul %55, %51 overflow<nsw> : i32
    %57 = llvm.add %56, %46 overflow<nsw> : i32
    %58 = llvm.add %36, %12 overflow<nsw, nuw> : i64
    %59 = llvm.icmp "ult" %36, %13 : i64
    llvm.cond_br %59, ^bb7(%57, %58 : i32, i64), ^bb8 {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    llvm.store %57, %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %60 = llvm.add %31, %2 overflow<nsw, nuw> : i64
    %61 = llvm.icmp "eq" %60, %5 : i64
    llvm.cond_br %61, ^bb9, ^bb6(%60 : i64) {loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return %11 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPA256_iPiS1_S1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i8) : i8
    %1 = llvm.mlir.constant(1024 : i64) : i64
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.mlir.constant(0 : i32) : i32
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(2 : i64) : i64
    %6 = llvm.mlir.constant(254 : i64) : i64
    %7 = llvm.mlir.constant(256 : i64) : i64
    %8 = llvm.bitcast %arg1 : !llvm.ptr to !llvm.ptr
    "llvm.intr.memset"(%8, %0, %1) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%2 : i64)
  ^bb1(%9: i64):  // 2 preds: ^bb0, ^bb3
    %10 = llvm.getelementptr inbounds %arg2[%9] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %3, %10 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %11 = llvm.getelementptr inbounds %arg4[%9] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.br ^bb2(%2 : i64)
  ^bb2(%12: i64):  // 2 preds: ^bb1, ^bb2
    %13 = llvm.getelementptr inbounds %arg1[%12] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %14 = llvm.load %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %15 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.getelementptr inbounds %arg0[%9, %12] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %17 = llvm.load %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.mul %17, %15 overflow<nsw> : i32
    %19 = llvm.add %18, %14 overflow<nsw> : i32
    llvm.store %19, %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.load %10 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.load %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.getelementptr inbounds %arg3[%12] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %23 = llvm.load %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.mul %23, %21 overflow<nsw> : i32
    %25 = llvm.add %24, %20 overflow<nsw> : i32
    llvm.store %25, %10 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %26 = llvm.or %12, %4 : i64
    %27 = llvm.getelementptr inbounds %arg1[%26] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %28 = llvm.load %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.getelementptr inbounds %arg0[%9, %26] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %31 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %32 = llvm.mul %31, %29 overflow<nsw> : i32
    %33 = llvm.add %32, %28 overflow<nsw> : i32
    llvm.store %33, %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %34 = llvm.load %10 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %36 = llvm.getelementptr inbounds %arg3[%26] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %37 = llvm.load %36 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %38 = llvm.mul %37, %35 overflow<nsw> : i32
    %39 = llvm.add %38, %34 overflow<nsw> : i32
    llvm.store %39, %10 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %40 = llvm.add %12, %5 overflow<nsw, nuw> : i64
    %41 = llvm.icmp "ult" %12, %6 : i64
    llvm.cond_br %41, ^bb2(%40 : i64), ^bb3 {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %42 = llvm.add %9, %4 overflow<nsw, nuw> : i64
    %43 = llvm.icmp "eq" %42, %7 : i64
    llvm.cond_br %43, ^bb4, ^bb1(%42 : i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return
  }
}
