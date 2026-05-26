#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr constant @_ZZ4mainE11coefficient(dense<[25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560]> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<16 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5state(dense<0> : tensor<12xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<12 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.addressof @_ZZ4mainE5state : !llvm.ptr
    %3 = llvm.mlir.constant(12 : i64) : i64
    %4 = llvm.getelementptr inbounds %2[%0, %1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %5 = llvm.mlir.constant(true) : i1
    %6 = llvm.mlir.addressof @_ZZ4mainE11coefficient : !llvm.ptr
    %7 = llvm.mlir.constant(2 : i64) : i64
    %8 = llvm.mlir.constant(3 : i64) : i64
    %9 = llvm.mlir.constant(4 : i64) : i64
    %10 = llvm.mlir.constant(5 : i64) : i64
    %11 = llvm.mlir.constant(false) : i1
    %12 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb1
    %14 = llvm.add %13, %1 overflow<nsw, nuw> : i64
    %15 = llvm.getelementptr inbounds %2[%0, %13] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %16 = llvm.trunc %14 : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.icmp "eq" %14, %3 : i64
    llvm.cond_br %17, ^bb2, ^bb1(%14 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %18 = llvm.load %2 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.load %4 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb3(%19, %18, %5, %0 : i32, i32, i1, i64)
  ^bb3(%20: i32, %21: i32, %22: i1, %23: i64):  // 2 preds: ^bb2, ^bb3
    %24 = llvm.shl %23, %1 overflow<nsw, nuw> : i64
    %25 = llvm.getelementptr inbounds %6[%0, %24] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %26 = llvm.load %25 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %27 = llvm.or %24, %1 : i64
    %28 = llvm.getelementptr inbounds %6[%0, %27] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %29 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.or %23, %7 : i64
    %31 = llvm.getelementptr inbounds %2[%0, %30] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %32 = llvm.load %31 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %20, %31 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.mul %29, %21 overflow<nsw> : i32
    %34 = llvm.mul %32, %26 overflow<nsw> : i32
    %35 = llvm.sub %33, %34 overflow<nsw> : i32
    %36 = llvm.mul %32, %29 overflow<nsw> : i32
    %37 = llvm.mul %26, %21 overflow<nsw> : i32
    %38 = llvm.add %36, %37 overflow<nsw> : i32
    %39 = llvm.or %24, %7 : i64
    %40 = llvm.getelementptr inbounds %6[%0, %39] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %41 = llvm.load %40 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.or %24, %8 : i64
    %43 = llvm.getelementptr inbounds %6[%0, %42] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %44 = llvm.load %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.or %23, %8 : i64
    %46 = llvm.getelementptr inbounds %2[%0, %45] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %38, %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %48 = llvm.mul %44, %35 overflow<nsw> : i32
    %49 = llvm.mul %47, %41 overflow<nsw> : i32
    %50 = llvm.sub %48, %49 overflow<nsw> : i32
    %51 = llvm.mul %47, %44 overflow<nsw> : i32
    %52 = llvm.mul %41, %35 overflow<nsw> : i32
    %53 = llvm.add %51, %52 overflow<nsw> : i32
    %54 = llvm.shl %30, %1 overflow<nsw, nuw> : i64
    %55 = llvm.getelementptr inbounds %6[%0, %54] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %56 = llvm.load %55 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.or %54, %1 : i64
    %58 = llvm.getelementptr inbounds %6[%0, %57] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %59 = llvm.load %58 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %60 = llvm.add %23, %9 overflow<nsw, nuw> : i64
    %61 = llvm.getelementptr inbounds %2[%0, %60] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %62 = llvm.load %61 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %53, %61 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %63 = llvm.mul %59, %50 overflow<nsw> : i32
    %64 = llvm.mul %62, %56 overflow<nsw> : i32
    %65 = llvm.sub %63, %64 overflow<nsw> : i32
    %66 = llvm.mul %62, %59 overflow<nsw> : i32
    %67 = llvm.mul %56, %50 overflow<nsw> : i32
    %68 = llvm.add %66, %67 overflow<nsw> : i32
    %69 = llvm.shl %45, %1 overflow<nsw, nuw> : i64
    %70 = llvm.getelementptr inbounds %6[%0, %69] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %71 = llvm.load %70 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %72 = llvm.or %69, %1 : i64
    %73 = llvm.getelementptr inbounds %6[%0, %72] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %74 = llvm.load %73 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %75 = llvm.add %23, %10 overflow<nsw, nuw> : i64
    %76 = llvm.getelementptr inbounds %2[%0, %75] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %77 = llvm.load %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %68, %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %78 = llvm.mul %74, %65 overflow<nsw> : i32
    %79 = llvm.mul %77, %71 overflow<nsw> : i32
    %80 = llvm.sub %78, %79 overflow<nsw> : i32
    %81 = llvm.mul %77, %74 overflow<nsw> : i32
    %82 = llvm.mul %71, %65 overflow<nsw> : i32
    %83 = llvm.add %81, %82 overflow<nsw> : i32
    llvm.cond_br %22, ^bb3(%83, %80, %11, %9 : i32, i32, i1, i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.store %80, %2 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.store %83, %4 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.return %12 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiPKi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(true) : i1
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.mlir.constant(2 : i64) : i64
    %4 = llvm.mlir.constant(3 : i64) : i64
    %5 = llvm.mlir.constant(4 : i64) : i64
    %6 = llvm.mlir.constant(5 : i64) : i64
    %7 = llvm.mlir.constant(false) : i1
    %8 = llvm.getelementptr inbounds %arg0[%0] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %9 = llvm.load %arg0 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %10 = llvm.load %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb1(%10, %9, %1, %2 : i32, i32, i1, i64)
  ^bb1(%11: i32, %12: i32, %13: i1, %14: i64):  // 2 preds: ^bb0, ^bb1
    %15 = llvm.shl %14, %0 overflow<nsw, nuw> : i64
    %16 = llvm.getelementptr inbounds %arg1[%15] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %17 = llvm.load %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.or %15, %0 : i64
    %19 = llvm.getelementptr inbounds %arg1[%18] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %20 = llvm.load %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.or %14, %3 : i64
    %22 = llvm.getelementptr inbounds %arg0[%21] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %23 = llvm.load %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %11, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.mul %12, %20 overflow<nsw> : i32
    %25 = llvm.mul %23, %17 overflow<nsw> : i32
    %26 = llvm.sub %24, %25 overflow<nsw> : i32
    %27 = llvm.mul %23, %20 overflow<nsw> : i32
    %28 = llvm.mul %12, %17 overflow<nsw> : i32
    %29 = llvm.add %27, %28 overflow<nsw> : i32
    %30 = llvm.or %15, %3 : i64
    %31 = llvm.getelementptr inbounds %arg1[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.or %15, %4 : i64
    %34 = llvm.getelementptr inbounds %arg1[%33] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %35 = llvm.load %34 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %36 = llvm.or %14, %4 : i64
    %37 = llvm.getelementptr inbounds %arg0[%36] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %38 = llvm.load %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %29, %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %39 = llvm.mul %35, %26 overflow<nsw> : i32
    %40 = llvm.mul %38, %32 overflow<nsw> : i32
    %41 = llvm.sub %39, %40 overflow<nsw> : i32
    %42 = llvm.mul %38, %35 overflow<nsw> : i32
    %43 = llvm.mul %32, %26 overflow<nsw> : i32
    %44 = llvm.add %42, %43 overflow<nsw> : i32
    %45 = llvm.shl %21, %0 overflow<nsw, nuw> : i64
    %46 = llvm.getelementptr inbounds %arg1[%45] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.or %45, %0 : i64
    %49 = llvm.getelementptr inbounds %arg1[%48] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %50 = llvm.load %49 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %51 = llvm.add %14, %5 overflow<nsw, nuw> : i64
    %52 = llvm.getelementptr inbounds %arg0[%51] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %53 = llvm.load %52 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %44, %52 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %54 = llvm.mul %50, %41 overflow<nsw> : i32
    %55 = llvm.mul %53, %47 overflow<nsw> : i32
    %56 = llvm.sub %54, %55 overflow<nsw> : i32
    %57 = llvm.mul %53, %50 overflow<nsw> : i32
    %58 = llvm.mul %47, %41 overflow<nsw> : i32
    %59 = llvm.add %57, %58 overflow<nsw> : i32
    %60 = llvm.shl %36, %0 overflow<nsw, nuw> : i64
    %61 = llvm.getelementptr inbounds %arg1[%60] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %62 = llvm.load %61 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %63 = llvm.or %60, %0 : i64
    %64 = llvm.getelementptr inbounds %arg1[%63] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %65 = llvm.load %64 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %66 = llvm.add %14, %6 overflow<nsw, nuw> : i64
    %67 = llvm.getelementptr inbounds %arg0[%66] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %68 = llvm.load %67 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %59, %67 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %69 = llvm.mul %65, %56 overflow<nsw> : i32
    %70 = llvm.mul %68, %62 overflow<nsw> : i32
    %71 = llvm.sub %69, %70 overflow<nsw> : i32
    llvm.store %71, %arg0 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %72 = llvm.mul %68, %65 overflow<nsw> : i32
    %73 = llvm.mul %62, %56 overflow<nsw> : i32
    %74 = llvm.add %72, %73 overflow<nsw> : i32
    llvm.store %74, %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.cond_br %13, ^bb1(%74, %71, %7, %5 : i32, i32, i1, i64), ^bb2 {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
