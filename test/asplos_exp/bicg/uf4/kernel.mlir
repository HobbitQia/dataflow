#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external @A(dense<0> : tensor<256x256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x array<256 x i32>>
  llvm.mlir.global external @r(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external @p(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external @s(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external @q(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @r : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(255 : i32) : i32
    %4 = llvm.mlir.addressof @A : !llvm.ptr
    %5 = llvm.mlir.constant(256 : i64) : i64
    %6 = llvm.mlir.addressof @p : !llvm.ptr
    %7 = llvm.mlir.addressof @s : !llvm.ptr
    %8 = llvm.mlir.addressof @q : !llvm.ptr
    %9 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb3
    %11 = llvm.getelementptr inbounds %1[%0, %10] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %12 = llvm.trunc %10 : i64 to i32
    llvm.store %12, %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb2(%0 : i64)
  ^bb2(%13: i64):  // 2 preds: ^bb1, ^bb2
    %14 = llvm.add %13, %2 overflow<nsw, nuw> : i64
    %15 = llvm.mul %14, %10 overflow<nsw, nuw> : i64
    %16 = llvm.trunc %15 : i64 to i32
    %17 = llvm.and %16, %3 : i32
    %18 = llvm.getelementptr inbounds %4[%0, %10, %13] : (!llvm.ptr, i64, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    llvm.store %17, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.icmp "eq" %14, %5 : i64
    llvm.cond_br %19, ^bb3, ^bb2(%14 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %20 = llvm.add %10, %2 overflow<nsw, nuw> : i64
    %21 = llvm.icmp "eq" %20, %5 : i64
    llvm.cond_br %21, ^bb4(%0 : i64), ^bb1(%20 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%22: i64):  // 2 preds: ^bb3, ^bb4
    %23 = llvm.getelementptr inbounds %6[%0, %22] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %24 = llvm.trunc %22 : i64 to i32
    llvm.store %24, %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %22, %2 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %5 : i64
    llvm.cond_br %26, ^bb5, ^bb4(%25 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    llvm.call tail @_Z6kernelPA256_iPiS1_S1_S1_(%4, %7, %8, %6, %1) {no_unwind} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.return %9 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPA256_iPiS1_S1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i8) : i8
    %1 = llvm.mlir.constant(1024 : i64) : i64
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.mlir.constant(0 : i32) : i32
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(2 : i64) : i64
    %6 = llvm.mlir.constant(3 : i64) : i64
    %7 = llvm.mlir.constant(4 : i64) : i64
    %8 = llvm.mlir.constant(252 : i64) : i64
    %9 = llvm.mlir.constant(256 : i64) : i64
    %10 = llvm.bitcast %arg1 : !llvm.ptr to !llvm.ptr
    "llvm.intr.memset"(%10, %0, %1) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%2 : i64)
  ^bb1(%11: i64):  // 2 preds: ^bb0, ^bb3
    %12 = llvm.getelementptr inbounds %arg2[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %3, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %13 = llvm.getelementptr inbounds %arg4[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.br ^bb2(%2 : i64)
  ^bb2(%14: i64):  // 2 preds: ^bb1, ^bb2
    %15 = llvm.getelementptr inbounds %arg1[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %16 = llvm.load %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %17 = llvm.load %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.getelementptr inbounds %arg0[%11, %14] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %19 = llvm.load %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %20 = llvm.mul %19, %17 overflow<nsw> : i32
    %21 = llvm.add %20, %16 overflow<nsw> : i32
    llvm.store %21, %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.load %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.getelementptr inbounds %arg3[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.mul %25, %23 overflow<nsw> : i32
    %27 = llvm.add %26, %22 overflow<nsw> : i32
    llvm.store %27, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %28 = llvm.or %14, %4 : i64
    %29 = llvm.getelementptr inbounds %arg1[%28] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %30 = llvm.load %29 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %31 = llvm.load %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %32 = llvm.getelementptr inbounds %arg0[%11, %28] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %33 = llvm.load %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %34 = llvm.mul %33, %31 overflow<nsw> : i32
    %35 = llvm.add %34, %30 overflow<nsw> : i32
    llvm.store %35, %29 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %36 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.load %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %38 = llvm.getelementptr inbounds %arg3[%28] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %39 = llvm.load %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %40 = llvm.mul %39, %37 overflow<nsw> : i32
    %41 = llvm.add %40, %36 overflow<nsw> : i32
    llvm.store %41, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %42 = llvm.or %14, %5 : i64
    %43 = llvm.getelementptr inbounds %arg1[%42] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %44 = llvm.load %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.load %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.getelementptr inbounds %arg0[%11, %42] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.mul %47, %45 overflow<nsw> : i32
    %49 = llvm.add %48, %44 overflow<nsw> : i32
    llvm.store %49, %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %51 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.getelementptr inbounds %arg3[%42] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %53 = llvm.load %52 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %54 = llvm.mul %53, %51 overflow<nsw> : i32
    %55 = llvm.add %54, %50 overflow<nsw> : i32
    llvm.store %55, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %56 = llvm.or %14, %6 : i64
    %57 = llvm.getelementptr inbounds %arg1[%56] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %58 = llvm.load %57 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %59 = llvm.load %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %60 = llvm.getelementptr inbounds %arg0[%11, %56] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %61 = llvm.load %60 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %62 = llvm.mul %61, %59 overflow<nsw> : i32
    %63 = llvm.add %62, %58 overflow<nsw> : i32
    llvm.store %63, %57 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %64 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %65 = llvm.load %60 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %66 = llvm.getelementptr inbounds %arg3[%56] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %67 = llvm.load %66 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %68 = llvm.mul %67, %65 overflow<nsw> : i32
    %69 = llvm.add %68, %64 overflow<nsw> : i32
    llvm.store %69, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %70 = llvm.add %14, %7 overflow<nsw, nuw> : i64
    %71 = llvm.icmp "ult" %14, %8 : i64
    llvm.cond_br %71, ^bb2(%70 : i64), ^bb3 {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %72 = llvm.add %11, %4 overflow<nsw, nuw> : i64
    %73 = llvm.icmp "eq" %72, %9 : i64
    llvm.cond_br %73, ^bb4, ^bb1(%72 : i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return
  }
}
