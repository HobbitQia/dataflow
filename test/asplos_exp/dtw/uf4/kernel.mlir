#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal @_ZZ4mainE1S(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<512 x i32>
  llvm.mlir.global internal @_ZZ4mainE1T(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<512 x i32>
  llvm.mlir.global internal @_ZZ4mainE3DTW(dense<0> : tensor<263169xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<263169 x i32>
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
    llvm.br ^bb1(%0 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb1
    %11 = llvm.add %10, %1 overflow<nsw, nuw> : i64
    %12 = llvm.getelementptr inbounds %2[%0, %10] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %13 = llvm.trunc %11 : i64 to i32
    llvm.store %13, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %14 = llvm.getelementptr inbounds %3[%0, %10] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %15 = llvm.trunc %10 : i64 to i32
    %16 = llvm.add %15, %4 : i32
    llvm.store %16, %14 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.icmp "eq" %11, %5 : i64
    llvm.cond_br %17, ^bb2(%0 : i64), ^bb1(%11 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%18: i64):  // 2 preds: ^bb1, ^bb2
    %19 = llvm.getelementptr inbounds %6[%0, %18] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %7, %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.add %18, %1 overflow<nsw, nuw> : i64
    %21 = llvm.icmp "eq" %20, %8 : i64
    llvm.cond_br %21, ^bb3, ^bb2(%20 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.store %9, %6 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.call tail @_Z6kernelPKiS0_Pi(%2, %3, %6) {no_unwind} : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.return %9 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(513 : i64) : i64
    %2 = llvm.mlir.constant(-513 : i64) : i64
    %3 = llvm.mlir.constant(-1 : i64) : i64
    %4 = llvm.mlir.constant(2 : i64) : i64
    %5 = llvm.mlir.constant(3 : i64) : i64
    %6 = llvm.mlir.constant(4 : i64) : i64
    %7 = llvm.mlir.constant(508 : i64) : i64
    %8 = llvm.mlir.constant(512 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%9: i64):  // 2 preds: ^bb0, ^bb3
    %10 = llvm.getelementptr inbounds %arg0[%9] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %11 = llvm.mul %9, %1 overflow<nsw, nuw> : i64
    %12 = llvm.add %11, %2 overflow<nsw> : i64
    %13 = llvm.add %11, %1 overflow<nsw, nuw> : i64
    llvm.br ^bb2(%0 : i64)
  ^bb2(%14: i64):  // 2 preds: ^bb1, ^bb2
    %15 = llvm.load %10 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.getelementptr inbounds %arg1[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %17 = llvm.load %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.sub %15, %17 overflow<nsw> : i32
    %19 = llvm.sub %17, %15 overflow<nsw> : i32
    %20 = llvm.icmp "sgt" %19, %18 : i32
    %21 = llvm.select %20, %19, %18 : i1, i32
    %22 = llvm.add %14, %12 overflow<nsw, nuw> : i64
    %23 = llvm.getelementptr inbounds %arg2[%22] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %24 = llvm.load %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.add %14, %11 overflow<nsw, nuw> : i64
    %26 = llvm.getelementptr inbounds %arg2[%25] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %27 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %28 = llvm.add %25, %3 overflow<nsw> : i64
    %29 = llvm.getelementptr inbounds %arg2[%28] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %30 = llvm.load %29 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %31 = llvm.icmp "slt" %27, %24 : i32
    %32 = llvm.select %31, %27, %24 : i1, i32
    %33 = llvm.icmp "slt" %30, %32 : i32
    %34 = llvm.select %33, %30, %32 : i1, i32
    %35 = llvm.add %34, %21 overflow<nsw> : i32
    %36 = llvm.add %14, %0 overflow<nsw, nuw> : i64
    %37 = llvm.add %36, %13 overflow<nsw, nuw> : i64
    %38 = llvm.getelementptr inbounds %arg2[%37] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %35, %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %39 = llvm.getelementptr inbounds %arg1[%36] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.sub %15, %40 overflow<nsw> : i32
    %42 = llvm.sub %40, %15 overflow<nsw> : i32
    %43 = llvm.icmp "sgt" %42, %41 : i32
    %44 = llvm.select %43, %42, %41 : i1, i32
    %45 = llvm.add %36, %12 overflow<nsw, nuw> : i64
    %46 = llvm.getelementptr inbounds %arg2[%45] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.add %36, %11 overflow<nsw, nuw> : i64
    %49 = llvm.getelementptr inbounds %arg2[%48] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %50 = llvm.load %49 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %51 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.icmp "slt" %50, %47 : i32
    %53 = llvm.select %52, %50, %47 : i1, i32
    %54 = llvm.icmp "slt" %51, %53 : i32
    %55 = llvm.select %54, %51, %53 : i1, i32
    %56 = llvm.add %55, %44 overflow<nsw> : i32
    %57 = llvm.add %14, %4 overflow<nsw, nuw> : i64
    %58 = llvm.add %57, %13 overflow<nsw, nuw> : i64
    %59 = llvm.getelementptr inbounds %arg2[%58] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %56, %59 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %60 = llvm.getelementptr inbounds %arg1[%57] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %61 = llvm.load %60 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %62 = llvm.sub %15, %61 overflow<nsw> : i32
    %63 = llvm.sub %61, %15 overflow<nsw> : i32
    %64 = llvm.icmp "sgt" %63, %62 : i32
    %65 = llvm.select %64, %63, %62 : i1, i32
    %66 = llvm.add %57, %12 overflow<nsw, nuw> : i64
    %67 = llvm.getelementptr inbounds %arg2[%66] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %68 = llvm.load %67 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %69 = llvm.add %57, %11 overflow<nsw, nuw> : i64
    %70 = llvm.getelementptr inbounds %arg2[%69] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %71 = llvm.load %70 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %72 = llvm.load %49 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %73 = llvm.icmp "slt" %71, %68 : i32
    %74 = llvm.select %73, %71, %68 : i1, i32
    %75 = llvm.icmp "slt" %72, %74 : i32
    %76 = llvm.select %75, %72, %74 : i1, i32
    %77 = llvm.add %76, %65 overflow<nsw> : i32
    %78 = llvm.add %14, %5 overflow<nsw, nuw> : i64
    %79 = llvm.add %78, %13 overflow<nsw, nuw> : i64
    %80 = llvm.getelementptr inbounds %arg2[%79] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %77, %80 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %81 = llvm.getelementptr inbounds %arg1[%78] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %82 = llvm.load %81 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %83 = llvm.sub %15, %82 overflow<nsw> : i32
    %84 = llvm.sub %82, %15 overflow<nsw> : i32
    %85 = llvm.icmp "sgt" %84, %83 : i32
    %86 = llvm.select %85, %84, %83 : i1, i32
    %87 = llvm.add %78, %12 overflow<nsw, nuw> : i64
    %88 = llvm.getelementptr inbounds %arg2[%87] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %89 = llvm.load %88 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %90 = llvm.add %78, %11 overflow<nsw, nuw> : i64
    %91 = llvm.getelementptr inbounds %arg2[%90] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %92 = llvm.load %91 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %93 = llvm.load %70 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %94 = llvm.icmp "slt" %92, %89 : i32
    %95 = llvm.select %94, %92, %89 : i1, i32
    %96 = llvm.icmp "slt" %93, %95 : i32
    %97 = llvm.select %96, %93, %95 : i1, i32
    %98 = llvm.add %97, %86 overflow<nsw> : i32
    %99 = llvm.add %14, %6 overflow<nsw, nuw> : i64
    %100 = llvm.add %99, %13 overflow<nsw, nuw> : i64
    %101 = llvm.getelementptr inbounds %arg2[%100] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %98, %101 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %102 = llvm.icmp "ult" %14, %7 : i64
    llvm.cond_br %102, ^bb2(%99 : i64), ^bb3 {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %103 = llvm.add %9, %0 overflow<nsw, nuw> : i64
    %104 = llvm.icmp "eq" %103, %8 : i64
    llvm.cond_br %104, ^bb4, ^bb1(%103 : i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return
  }
}
