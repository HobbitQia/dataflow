#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %13 = llvm.mlir.constant(2 : i64) : i64
    %14 = llvm.mlir.constant(510 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%15: i64):  // 2 preds: ^bb0, ^bb1
    %16 = llvm.add %15, %1 overflow<nsw, nuw> : i64
    %17 = llvm.getelementptr inbounds %2[%0, %15] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %18 = llvm.trunc %16 : i64 to i32
    llvm.store %18, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.getelementptr inbounds %3[%0, %15] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %20 = llvm.trunc %15 : i64 to i32
    %21 = llvm.add %20, %4 : i32
    llvm.store %21, %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.icmp "eq" %16, %5 : i64
    llvm.cond_br %22, ^bb2(%0 : i64), ^bb1(%16 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%23: i64):  // 2 preds: ^bb1, ^bb2
    %24 = llvm.getelementptr inbounds %6[%0, %23] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %7, %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %23, %1 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %8 : i64
    llvm.cond_br %26, ^bb3, ^bb2(%25 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.store %9, %6 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb4(%1 : i64)
  ^bb4(%27: i64):  // 2 preds: ^bb3, ^bb6
    %28 = llvm.getelementptr inbounds %2[%0, %27] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %29 = llvm.mul %27, %10 overflow<nsw, nuw> : i64
    %30 = llvm.add %29, %11 overflow<nsw> : i64
    %31 = llvm.add %29, %10 overflow<nsw, nuw> : i64
    %32 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb5(%1 : i64)
  ^bb5(%33: i64):  // 2 preds: ^bb4, ^bb5
    %34 = llvm.getelementptr inbounds %3[%0, %33] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %35 = llvm.load %34 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %36 = llvm.sub %32, %35 overflow<nsw> : i32
    %37 = llvm.sub %35, %32 overflow<nsw> : i32
    %38 = llvm.icmp "sgt" %37, %36 : i32
    %39 = llvm.select %38, %37, %36 : i1, i32
    %40 = llvm.add %33, %30 overflow<nsw, nuw> : i64
    %41 = llvm.getelementptr inbounds %6[%0, %40] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %42 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.add %33, %29 overflow<nsw, nuw> : i64
    %44 = llvm.getelementptr inbounds %6[%0, %43] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %45 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.add %43, %12 overflow<nsw> : i64
    %47 = llvm.getelementptr inbounds %6[%0, %46] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %48 = llvm.load %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.icmp "slt" %45, %42 : i32
    %50 = llvm.select %49, %45, %42 : i1, i32
    %51 = llvm.icmp "slt" %48, %50 : i32
    %52 = llvm.select %51, %48, %50 : i1, i32
    %53 = llvm.add %52, %39 overflow<nsw> : i32
    %54 = llvm.add %33, %1 overflow<nsw, nuw> : i64
    %55 = llvm.add %54, %31 overflow<nsw, nuw> : i64
    %56 = llvm.getelementptr inbounds %6[%0, %55] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %53, %56 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %57 = llvm.getelementptr inbounds %3[%0, %54] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %58 = llvm.load %57 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %59 = llvm.sub %32, %58 overflow<nsw> : i32
    %60 = llvm.sub %58, %32 overflow<nsw> : i32
    %61 = llvm.icmp "sgt" %60, %59 : i32
    %62 = llvm.select %61, %60, %59 : i1, i32
    %63 = llvm.add %54, %30 overflow<nsw, nuw> : i64
    %64 = llvm.getelementptr inbounds %6[%0, %63] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %65 = llvm.load %64 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %66 = llvm.add %54, %29 overflow<nsw, nuw> : i64
    %67 = llvm.getelementptr inbounds %6[%0, %66] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %68 = llvm.load %67 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %69 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %70 = llvm.icmp "slt" %68, %65 : i32
    %71 = llvm.select %70, %68, %65 : i1, i32
    %72 = llvm.icmp "slt" %69, %71 : i32
    %73 = llvm.select %72, %69, %71 : i1, i32
    %74 = llvm.add %73, %62 overflow<nsw> : i32
    %75 = llvm.add %33, %13 overflow<nsw, nuw> : i64
    %76 = llvm.add %75, %31 overflow<nsw, nuw> : i64
    %77 = llvm.getelementptr inbounds %6[%0, %76] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %74, %77 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %78 = llvm.icmp "ult" %33, %14 : i64
    llvm.cond_br %78, ^bb5(%75 : i64), ^bb6 {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    %79 = llvm.add %27, %1 overflow<nsw, nuw> : i64
    %80 = llvm.icmp "eq" %79, %5 : i64
    llvm.cond_br %80, ^bb7, ^bb4(%79 : i64) {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    llvm.return %9 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(513 : i64) : i64
    %2 = llvm.mlir.constant(-513 : i64) : i64
    %3 = llvm.mlir.constant(-1 : i64) : i64
    %4 = llvm.mlir.constant(2 : i64) : i64
    %5 = llvm.mlir.constant(510 : i64) : i64
    %6 = llvm.mlir.constant(512 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%7: i64):  // 2 preds: ^bb0, ^bb3
    %8 = llvm.getelementptr inbounds %arg0[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %9 = llvm.mul %7, %1 overflow<nsw, nuw> : i64
    %10 = llvm.add %9, %2 overflow<nsw> : i64
    %11 = llvm.add %9, %1 overflow<nsw, nuw> : i64
    llvm.br ^bb2(%0 : i64)
  ^bb2(%12: i64):  // 2 preds: ^bb1, ^bb2
    %13 = llvm.load %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %14 = llvm.getelementptr inbounds %arg1[%12] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %15 = llvm.load %14 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.sub %13, %15 overflow<nsw> : i32
    %17 = llvm.sub %15, %13 overflow<nsw> : i32
    %18 = llvm.icmp "sgt" %17, %16 : i32
    %19 = llvm.select %18, %17, %16 : i1, i32
    %20 = llvm.add %12, %10 overflow<nsw, nuw> : i64
    %21 = llvm.getelementptr inbounds %arg2[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %22 = llvm.load %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.add %12, %9 overflow<nsw, nuw> : i64
    %24 = llvm.getelementptr inbounds %arg2[%23] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.add %23, %3 overflow<nsw> : i64
    %27 = llvm.getelementptr inbounds %arg2[%26] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %28 = llvm.load %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.icmp "slt" %25, %22 : i32
    %30 = llvm.select %29, %25, %22 : i1, i32
    %31 = llvm.icmp "slt" %28, %30 : i32
    %32 = llvm.select %31, %28, %30 : i1, i32
    %33 = llvm.add %32, %19 overflow<nsw> : i32
    %34 = llvm.add %12, %0 overflow<nsw, nuw> : i64
    %35 = llvm.add %34, %11 overflow<nsw, nuw> : i64
    %36 = llvm.getelementptr inbounds %arg2[%35] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %33, %36 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %37 = llvm.getelementptr inbounds %arg1[%34] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %38 = llvm.load %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.sub %13, %38 overflow<nsw> : i32
    %40 = llvm.sub %38, %13 overflow<nsw> : i32
    %41 = llvm.icmp "sgt" %40, %39 : i32
    %42 = llvm.select %41, %40, %39 : i1, i32
    %43 = llvm.add %34, %10 overflow<nsw, nuw> : i64
    %44 = llvm.getelementptr inbounds %arg2[%43] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %45 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.add %34, %9 overflow<nsw, nuw> : i64
    %47 = llvm.getelementptr inbounds %arg2[%46] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %48 = llvm.load %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.icmp "slt" %48, %45 : i32
    %51 = llvm.select %50, %48, %45 : i1, i32
    %52 = llvm.icmp "slt" %49, %51 : i32
    %53 = llvm.select %52, %49, %51 : i1, i32
    %54 = llvm.add %53, %42 overflow<nsw> : i32
    %55 = llvm.add %12, %4 overflow<nsw, nuw> : i64
    %56 = llvm.add %55, %11 overflow<nsw, nuw> : i64
    %57 = llvm.getelementptr inbounds %arg2[%56] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %54, %57 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %58 = llvm.icmp "ult" %12, %5 : i64
    llvm.cond_br %58, ^bb2(%55 : i64), ^bb3 {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %59 = llvm.add %7, %0 overflow<nsw, nuw> : i64
    %60 = llvm.icmp "eq" %59, %6 : i64
    llvm.cond_br %60, ^bb4, ^bb1(%59 : i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return
  }
}
