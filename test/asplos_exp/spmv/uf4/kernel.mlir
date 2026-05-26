#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3val(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3col(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3row(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE7feature(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE6output(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(7 : i16) : i16
    %2 = llvm.mlir.constant(1 : i16) : i16
    %3 = llvm.mlir.addressof @_ZZ4mainE3val : !llvm.ptr
    %4 = llvm.mlir.addressof @_ZZ4mainE3col : !llvm.ptr
    %5 = llvm.mlir.addressof @_ZZ4mainE3row : !llvm.ptr
    %6 = llvm.mlir.constant(1 : i64) : i64
    %7 = llvm.mlir.constant(1024 : i64) : i64
    %8 = llvm.mlir.constant(13 : i16) : i16
    %9 = llvm.mlir.addressof @_ZZ4mainE7feature : !llvm.ptr
    %10 = llvm.mlir.addressof @_ZZ4mainE6output : !llvm.ptr
    %11 = llvm.mlir.constant(2 : i64) : i64
    %12 = llvm.mlir.constant(3 : i64) : i64
    %13 = llvm.mlir.constant(4 : i64) : i64
    %14 = llvm.mlir.constant(1020 : i64) : i64
    %15 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%16: i64):  // 2 preds: ^bb0, ^bb1
    %17 = llvm.trunc %16 : i64 to i32
    %18 = llvm.trunc %16 : i64 to i16
    %19 = llvm.urem %18, %1 : i16
    %20 = llvm.add %19, %2 overflow<nsw, nuw> : i16
    %21 = llvm.zext %20 : i16 to i32
    %22 = llvm.getelementptr inbounds %3[%0, %16] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %21, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.getelementptr inbounds %4[%0, %16] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %17, %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.getelementptr inbounds %5[%0, %16] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %17, %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %16, %6 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %7 : i64
    llvm.cond_br %26, ^bb2(%0 : i64), ^bb1(%25 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%27: i64):  // 2 preds: ^bb1, ^bb2
    %28 = llvm.trunc %27 : i64 to i16
    %29 = llvm.urem %28, %8 : i16
    %30 = llvm.zext %29 : i16 to i32
    %31 = llvm.getelementptr inbounds %9[%0, %27] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %30, %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %32 = llvm.add %27, %6 overflow<nsw, nuw> : i64
    %33 = llvm.icmp "eq" %32, %7 : i64
    llvm.cond_br %33, ^bb3(%0 : i64), ^bb2(%32 : i64) {loop_annotation = #loop_annotation}
  ^bb3(%34: i64):  // 2 preds: ^bb2, ^bb3
    %35 = llvm.getelementptr inbounds %3[%0, %34] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %36 = llvm.load %35 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.getelementptr inbounds %4[%0, %34] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %38 = llvm.load %37 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.sext %38 : i32 to i64
    %40 = llvm.getelementptr inbounds %9[%0, %39] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %41 = llvm.load %40 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.mul %41, %36 overflow<nsw> : i32
    %43 = llvm.getelementptr inbounds %5[%0, %34] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %44 = llvm.load %43 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.sext %44 : i32 to i64
    %46 = llvm.getelementptr inbounds %10[%0, %45] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.add %47, %42 overflow<nsw> : i32
    llvm.store %48, %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %49 = llvm.or %34, %6 : i64
    %50 = llvm.getelementptr inbounds %3[%0, %49] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.getelementptr inbounds %4[%0, %49] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %53 = llvm.load %52 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %54 = llvm.sext %53 : i32 to i64
    %55 = llvm.getelementptr inbounds %9[%0, %54] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %56 = llvm.load %55 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.mul %56, %51 overflow<nsw> : i32
    %58 = llvm.getelementptr inbounds %5[%0, %49] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %59 = llvm.load %58 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %60 = llvm.sext %59 : i32 to i64
    %61 = llvm.getelementptr inbounds %10[%0, %60] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %62 = llvm.load %61 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %63 = llvm.add %62, %57 overflow<nsw> : i32
    llvm.store %63, %61 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %64 = llvm.or %34, %11 : i64
    %65 = llvm.getelementptr inbounds %3[%0, %64] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %66 = llvm.load %65 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %67 = llvm.getelementptr inbounds %4[%0, %64] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %68 = llvm.load %67 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %69 = llvm.sext %68 : i32 to i64
    %70 = llvm.getelementptr inbounds %9[%0, %69] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %71 = llvm.load %70 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %72 = llvm.mul %71, %66 overflow<nsw> : i32
    %73 = llvm.getelementptr inbounds %5[%0, %64] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %74 = llvm.load %73 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %75 = llvm.sext %74 : i32 to i64
    %76 = llvm.getelementptr inbounds %10[%0, %75] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %77 = llvm.load %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %78 = llvm.add %77, %72 overflow<nsw> : i32
    llvm.store %78, %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %79 = llvm.or %34, %12 : i64
    %80 = llvm.getelementptr inbounds %3[%0, %79] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %81 = llvm.load %80 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %82 = llvm.getelementptr inbounds %4[%0, %79] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %83 = llvm.load %82 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %84 = llvm.sext %83 : i32 to i64
    %85 = llvm.getelementptr inbounds %9[%0, %84] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %86 = llvm.load %85 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %87 = llvm.mul %86, %81 overflow<nsw> : i32
    %88 = llvm.getelementptr inbounds %5[%0, %79] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %89 = llvm.load %88 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %90 = llvm.sext %89 : i32 to i64
    %91 = llvm.getelementptr inbounds %10[%0, %90] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %92 = llvm.load %91 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %93 = llvm.add %92, %87 overflow<nsw> : i32
    llvm.store %93, %91 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %94 = llvm.add %34, %13 overflow<nsw, nuw> : i64
    %95 = llvm.icmp "ult" %34, %14 : i64
    llvm.cond_br %95, ^bb3(%94 : i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %15 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiS_S_S_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(2 : i64) : i64
    %3 = llvm.mlir.constant(3 : i64) : i64
    %4 = llvm.mlir.constant(4 : i64) : i64
    %5 = llvm.mlir.constant(1020 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%6: i64):  // 2 preds: ^bb0, ^bb1
    %7 = llvm.getelementptr inbounds %arg0[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %8 = llvm.load %7 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %9 = llvm.getelementptr inbounds %arg1[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %10 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %11 = llvm.sext %10 : i32 to i64
    %12 = llvm.getelementptr inbounds %arg3[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %13 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %14 = llvm.mul %13, %8 overflow<nsw> : i32
    %15 = llvm.getelementptr inbounds %arg2[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %16 = llvm.load %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %17 = llvm.sext %16 : i32 to i64
    %18 = llvm.getelementptr inbounds %arg4[%17] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %19 = llvm.load %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %20 = llvm.add %19, %14 overflow<nsw> : i32
    llvm.store %20, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.or %6, %1 : i64
    %22 = llvm.getelementptr inbounds %arg0[%21] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %23 = llvm.load %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.getelementptr inbounds %arg1[%21] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.sext %25 : i32 to i64
    %27 = llvm.getelementptr inbounds %arg3[%26] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %28 = llvm.load %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.mul %28, %23 overflow<nsw> : i32
    %30 = llvm.getelementptr inbounds %arg2[%21] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %31 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %32 = llvm.sext %31 : i32 to i64
    %33 = llvm.getelementptr inbounds %arg4[%32] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %34 = llvm.load %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.add %34, %29 overflow<nsw> : i32
    llvm.store %35, %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %36 = llvm.or %6, %2 : i64
    %37 = llvm.getelementptr inbounds %arg0[%36] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %38 = llvm.load %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.getelementptr inbounds %arg1[%36] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.sext %40 : i32 to i64
    %42 = llvm.getelementptr inbounds %arg3[%41] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %43 = llvm.load %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.mul %43, %38 overflow<nsw> : i32
    %45 = llvm.getelementptr inbounds %arg2[%36] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %46 = llvm.load %45 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %47 = llvm.sext %46 : i32 to i64
    %48 = llvm.getelementptr inbounds %arg4[%47] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %49 = llvm.load %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.add %49, %44 overflow<nsw> : i32
    llvm.store %50, %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %51 = llvm.or %6, %3 : i64
    %52 = llvm.getelementptr inbounds %arg0[%51] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %53 = llvm.load %52 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %54 = llvm.getelementptr inbounds %arg1[%51] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %55 = llvm.load %54 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %56 = llvm.sext %55 : i32 to i64
    %57 = llvm.getelementptr inbounds %arg3[%56] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %58 = llvm.load %57 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %59 = llvm.mul %58, %53 overflow<nsw> : i32
    %60 = llvm.getelementptr inbounds %arg2[%51] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %61 = llvm.load %60 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %62 = llvm.sext %61 : i32 to i64
    %63 = llvm.getelementptr inbounds %arg4[%62] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %64 = llvm.load %63 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %65 = llvm.add %64, %59 overflow<nsw> : i32
    llvm.store %65, %63 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %66 = llvm.add %6, %4 overflow<nsw, nuw> : i64
    %67 = llvm.icmp "ult" %6, %5 : i64
    llvm.cond_br %67, ^bb1(%66 : i64), ^bb2 {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
