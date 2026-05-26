#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal @_ZZ4mainE9data_real(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global internal @_ZZ4mainE9data_imag(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE9data_real : !llvm.ptr
    %2 = llvm.mlir.addressof @_ZZ4mainE9data_imag : !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(256 : i64) : i64
    %6 = llvm.mlir.constant(2 : i32) : i32
    %7 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%8: i64):  // 2 preds: ^bb0, ^bb1
    %9 = llvm.getelementptr inbounds %1[%0, %8] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %10 = llvm.trunc %8 : i64 to i32
    llvm.store %10, %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %11 = llvm.getelementptr inbounds %2[%0, %8] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    llvm.store %3, %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %12 = llvm.add %8, %4 overflow<nsw, nuw> : i64
    %13 = llvm.icmp "eq" %12, %5 : i64
    llvm.cond_br %13, ^bb2, ^bb1(%12 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.call tail @_Z6kernelPiS_iil(%1, %2, %6, %6, %0) {no_unwind} : (!llvm.ptr, !llvm.ptr, i32, i32, i64) -> ()
    llvm.return %7 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiS_iil(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: i32 {llvm.noundef}, %arg3: i32 {llvm.noundef}, %arg4: i64 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(128 : i64) : i64
    %2 = llvm.mlir.constant(129 : i64) : i64
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.mlir.constant(130 : i64) : i64
    %5 = llvm.mlir.constant(2 : i64) : i64
    %6 = llvm.mlir.constant(131 : i64) : i64
    %7 = llvm.mlir.constant(3 : i64) : i64
    %8 = llvm.mlir.constant(4 : i64) : i64
    %9 = llvm.mlir.constant(124 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb1
    %11 = llvm.add %10, %arg4 overflow<nsw> : i64
    %12 = llvm.add %11, %1 : i64
    %13 = llvm.getelementptr inbounds %arg0[%12] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %14 = llvm.load %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %15 = llvm.mul %14, %arg2 overflow<nsw> : i32
    %16 = llvm.getelementptr inbounds %arg1[%12] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %17 = llvm.load %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.mul %17, %arg3 overflow<nsw> : i32
    %19 = llvm.sub %15, %18 overflow<nsw> : i32
    %20 = llvm.mul %14, %arg3 overflow<nsw> : i32
    %21 = llvm.mul %17, %arg2 overflow<nsw> : i32
    %22 = llvm.add %21, %20 overflow<nsw> : i32
    %23 = llvm.getelementptr inbounds %arg0[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %24 = llvm.load %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.sub %24, %19 overflow<nsw> : i32
    llvm.store %25, %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %26 = llvm.add %24, %19 overflow<nsw> : i32
    llvm.store %26, %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %27 = llvm.getelementptr inbounds %arg1[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %28 = llvm.load %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.sub %28, %22 overflow<nsw> : i32
    llvm.store %29, %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %30 = llvm.add %28, %22 overflow<nsw> : i32
    llvm.store %30, %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %31 = llvm.add %11, %2 : i64
    %32 = llvm.getelementptr inbounds %arg0[%31] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %33 = llvm.load %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %34 = llvm.mul %33, %arg2 overflow<nsw> : i32
    %35 = llvm.getelementptr inbounds %arg1[%31] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %36 = llvm.load %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.mul %36, %arg3 overflow<nsw> : i32
    %38 = llvm.sub %34, %37 overflow<nsw> : i32
    %39 = llvm.mul %33, %arg3 overflow<nsw> : i32
    %40 = llvm.mul %36, %arg2 overflow<nsw> : i32
    %41 = llvm.add %40, %39 overflow<nsw> : i32
    %42 = llvm.add %11, %3 overflow<nsw> : i64
    %43 = llvm.getelementptr inbounds %arg0[%42] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %44 = llvm.load %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.sub %44, %38 overflow<nsw> : i32
    llvm.store %45, %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %46 = llvm.add %44, %38 overflow<nsw> : i32
    llvm.store %46, %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.getelementptr inbounds %arg1[%42] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %48 = llvm.load %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.sub %48, %41 overflow<nsw> : i32
    llvm.store %49, %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.add %48, %41 overflow<nsw> : i32
    llvm.store %50, %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %51 = llvm.add %11, %4 : i64
    %52 = llvm.getelementptr inbounds %arg0[%51] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %53 = llvm.load %52 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %54 = llvm.mul %53, %arg2 overflow<nsw> : i32
    %55 = llvm.getelementptr inbounds %arg1[%51] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %56 = llvm.load %55 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.mul %56, %arg3 overflow<nsw> : i32
    %58 = llvm.sub %54, %57 overflow<nsw> : i32
    %59 = llvm.mul %53, %arg3 overflow<nsw> : i32
    %60 = llvm.mul %56, %arg2 overflow<nsw> : i32
    %61 = llvm.add %60, %59 overflow<nsw> : i32
    %62 = llvm.add %11, %5 overflow<nsw> : i64
    %63 = llvm.getelementptr inbounds %arg0[%62] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %64 = llvm.load %63 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %65 = llvm.sub %64, %58 overflow<nsw> : i32
    llvm.store %65, %52 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %66 = llvm.add %64, %58 overflow<nsw> : i32
    llvm.store %66, %63 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %67 = llvm.getelementptr inbounds %arg1[%62] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %68 = llvm.load %67 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %69 = llvm.sub %68, %61 overflow<nsw> : i32
    llvm.store %69, %55 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %70 = llvm.add %68, %61 overflow<nsw> : i32
    llvm.store %70, %67 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %71 = llvm.add %11, %6 : i64
    %72 = llvm.getelementptr inbounds %arg0[%71] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %73 = llvm.load %72 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %74 = llvm.mul %73, %arg2 overflow<nsw> : i32
    %75 = llvm.getelementptr inbounds %arg1[%71] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %76 = llvm.load %75 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %77 = llvm.mul %76, %arg3 overflow<nsw> : i32
    %78 = llvm.sub %74, %77 overflow<nsw> : i32
    %79 = llvm.mul %73, %arg3 overflow<nsw> : i32
    %80 = llvm.mul %76, %arg2 overflow<nsw> : i32
    %81 = llvm.add %80, %79 overflow<nsw> : i32
    %82 = llvm.add %11, %7 overflow<nsw> : i64
    %83 = llvm.getelementptr inbounds %arg0[%82] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %84 = llvm.load %83 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %85 = llvm.sub %84, %78 overflow<nsw> : i32
    llvm.store %85, %72 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %86 = llvm.add %84, %78 overflow<nsw> : i32
    llvm.store %86, %83 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %87 = llvm.getelementptr inbounds %arg1[%82] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %88 = llvm.load %87 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %89 = llvm.sub %88, %81 overflow<nsw> : i32
    llvm.store %89, %75 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %90 = llvm.add %88, %81 overflow<nsw> : i32
    llvm.store %90, %87 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %91 = llvm.add %10, %8 overflow<nsw, nuw> : i64
    %92 = llvm.icmp "ult" %10, %9 : i64
    llvm.cond_br %92, ^bb1(%91 : i64), ^bb2 {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
