#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#loop_annotation1 = #llvm.loop_annotation<unroll = #loop_unroll>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f80 = dense<128> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "clang version 20.1.7 (https://github.com/llvm/llvm-project.git 6146a88f60492b520a36f8f8f3231e15f3cc6082)"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture, llvm.noundef}) attributes {memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = none>, no_unwind, passthrough = ["nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(3 : i64) : i64
    %2 = llvm.mlir.constant(4 : i32) : i32
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(2147483644 : i64) : i64
    %5 = llvm.mlir.constant(1 : i64) : i64
    %6 = llvm.mlir.constant(2 : i64) : i64
    %7 = llvm.mlir.constant(4 : i64) : i64
    %8 = llvm.icmp "sgt" %arg0, %0 : i32
    llvm.cond_br %8, ^bb1, ^bb6
  ^bb1:  // pred: ^bb0
    %9 = llvm.zext nneg %arg0 : i32 to i64
    %10 = llvm.and %9, %1 : i64
    %11 = llvm.icmp "ult" %arg0, %2 : i32
    llvm.cond_br %11, ^bb4(%3 : i64), ^bb2
  ^bb2:  // pred: ^bb1
    %12 = llvm.and %9, %4 : i64
    llvm.br ^bb3(%3, %3 : i64, i64)
  ^bb3(%13: i64, %14: i64):  // 2 preds: ^bb2, ^bb3
    %15 = llvm.getelementptr inbounds %arg1[%13] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %16 = llvm.load %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %17 = llvm.getelementptr inbounds %arg2[%13] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %18 = llvm.load %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.sext %18 : i32 to i64
    %20 = llvm.getelementptr inbounds %arg4[%19] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %21 = llvm.load %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.mul %21, %16 overflow<nsw> : i32
    %23 = llvm.getelementptr inbounds %arg3[%13] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %24 = llvm.load %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.sext %24 : i32 to i64
    %26 = llvm.getelementptr inbounds %arg5[%25] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %27 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %28 = llvm.add %27, %22 overflow<nsw> : i32
    llvm.store %28, %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %29 = llvm.or disjoint %13, %5 : i64
    %30 = llvm.getelementptr inbounds %arg1[%29] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %31 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %32 = llvm.getelementptr inbounds %arg2[%29] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %33 = llvm.load %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %34 = llvm.sext %33 : i32 to i64
    %35 = llvm.getelementptr inbounds %arg4[%34] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %36 = llvm.load %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.mul %36, %31 overflow<nsw> : i32
    %38 = llvm.getelementptr inbounds %arg3[%29] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %39 = llvm.load %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %40 = llvm.sext %39 : i32 to i64
    %41 = llvm.getelementptr inbounds %arg5[%40] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %42 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.add %42, %37 overflow<nsw> : i32
    llvm.store %43, %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %44 = llvm.or disjoint %13, %6 : i64
    %45 = llvm.getelementptr inbounds %arg1[%44] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %46 = llvm.load %45 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %47 = llvm.getelementptr inbounds %arg2[%44] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %48 = llvm.load %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.sext %48 : i32 to i64
    %50 = llvm.getelementptr inbounds %arg4[%49] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.mul %51, %46 overflow<nsw> : i32
    %53 = llvm.getelementptr inbounds %arg3[%44] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %54 = llvm.load %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.sext %54 : i32 to i64
    %56 = llvm.getelementptr inbounds %arg5[%55] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %57 = llvm.load %56 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %58 = llvm.add %57, %52 overflow<nsw> : i32
    llvm.store %58, %56 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %59 = llvm.or disjoint %13, %1 : i64
    %60 = llvm.getelementptr inbounds %arg1[%59] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %61 = llvm.load %60 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %62 = llvm.getelementptr inbounds %arg2[%59] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %63 = llvm.load %62 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %64 = llvm.sext %63 : i32 to i64
    %65 = llvm.getelementptr inbounds %arg4[%64] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %66 = llvm.load %65 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %67 = llvm.mul %66, %61 overflow<nsw> : i32
    %68 = llvm.getelementptr inbounds %arg3[%59] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %69 = llvm.load %68 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %70 = llvm.sext %69 : i32 to i64
    %71 = llvm.getelementptr inbounds %arg5[%70] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %72 = llvm.load %71 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %73 = llvm.add %72, %67 overflow<nsw> : i32
    llvm.store %73, %71 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %74 = llvm.add %13, %7 overflow<nsw, nuw> : i64
    %75 = llvm.add %14, %7 overflow<nuw> : i64
    %76 = llvm.icmp "eq" %75, %12 : i64
    llvm.cond_br %76, ^bb4(%74 : i64), ^bb3(%74, %75 : i64, i64) {loop_annotation = #loop_annotation}
  ^bb4(%77: i64):  // 2 preds: ^bb1, ^bb3
    %78 = llvm.icmp "eq" %10, %3 : i64
    llvm.cond_br %78, ^bb6, ^bb5(%77, %3 : i64, i64)
  ^bb5(%79: i64, %80: i64):  // 2 preds: ^bb4, ^bb5
    %81 = llvm.getelementptr inbounds %arg1[%79] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %82 = llvm.load %81 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %83 = llvm.getelementptr inbounds %arg2[%79] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %84 = llvm.load %83 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %85 = llvm.sext %84 : i32 to i64
    %86 = llvm.getelementptr inbounds %arg4[%85] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %87 = llvm.load %86 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %88 = llvm.mul %87, %82 overflow<nsw> : i32
    %89 = llvm.getelementptr inbounds %arg3[%79] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %90 = llvm.load %89 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %91 = llvm.sext %90 : i32 to i64
    %92 = llvm.getelementptr inbounds %arg5[%91] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %93 = llvm.load %92 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %94 = llvm.add %93, %88 overflow<nsw> : i32
    llvm.store %94, %92 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %95 = llvm.add %79, %5 overflow<nsw, nuw> : i64
    %96 = llvm.add %80, %5 : i64
    %97 = llvm.icmp "eq" %96, %10 : i64
    llvm.cond_br %97, ^bb6, ^bb5(%95, %96 : i64, i64) {loop_annotation = #loop_annotation1}
  ^bb6:  // 3 preds: ^bb0, ^bb4, ^bb5
    llvm.return
  }
}
