#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "clang version 20.1.7 (https://github.com/llvm/llvm-project.git 6146a88f60492b520a36f8f8f3231e15f3cc6082)"} {
  llvm.func local_unnamed_addr @kernel(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = none>, no_unwind, passthrough = ["nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(128 : i32) : i32
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(4294967294 : i64) : i64
    %6 = llvm.mlir.constant(2 : i32) : i32
    %7 = llvm.mlir.constant(8 : i32) : i32
    llvm.br ^bb1(%0, %1, %2, %0 : i32, i32, i32, i32)
  ^bb1(%8: i32, %9: i32, %10: i32, %11: i32):  // 2 preds: ^bb0, ^bb6
    %12 = llvm.icmp "sgt" %9, %0 : i32
    llvm.cond_br %12, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %13 = llvm.sext %8 : i32 to i64
    %14 = llvm.zext nneg %9 : i32 to i64
    %15 = llvm.zext %10 : i32 to i64
    %16 = llvm.zext nneg %9 : i32 to i64
    llvm.br ^bb3(%3 : i64)
  ^bb3(%17: i64):  // 2 preds: ^bb2, ^bb5
    %18 = llvm.add %17, %13 overflow<nsw> : i64
    %19 = llvm.getelementptr inbounds %arg2[%18] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %20 = llvm.load %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.getelementptr inbounds %arg3[%18] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %22 = llvm.load %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.shl %17, %4 overflow<nsw, nuw> : i64
    %24 = llvm.mul %23, %14 : i64
    %25 = llvm.trunc %24 : i64 to i32
    %26 = llvm.add %9, %25 : i32
    %27 = llvm.zext %26 : i32 to i64
    %28 = llvm.and %24, %5 : i64
    llvm.br ^bb4(%3 : i64)
  ^bb4(%29: i64):  // 2 preds: ^bb3, ^bb4
    %30 = llvm.add %29, %27 overflow<nsw, nuw> : i64
    %31 = llvm.getelementptr inbounds %arg0[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.mul %32, %20 overflow<nsw> : i32
    %34 = llvm.getelementptr inbounds %arg1[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %35 = llvm.load %34 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %36 = llvm.mul %35, %22 overflow<nsw> : i32
    %37 = llvm.sub %33, %36 overflow<nsw> : i32
    %38 = llvm.mul %32, %22 overflow<nsw> : i32
    %39 = llvm.mul %35, %20 overflow<nsw> : i32
    %40 = llvm.add %39, %38 overflow<nsw> : i32
    %41 = llvm.add %29, %28 overflow<nsw, nuw> : i64
    %42 = llvm.getelementptr inbounds %arg0[%41] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %43 = llvm.load %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.sub %43, %37 overflow<nsw> : i32
    llvm.store %44, %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %45 = llvm.add %43, %37 overflow<nsw> : i32
    llvm.store %45, %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %46 = llvm.getelementptr inbounds %arg1[%41] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.sub %47, %40 overflow<nsw> : i32
    llvm.store %48, %34 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %49 = llvm.add %47, %40 overflow<nsw> : i32
    llvm.store %49, %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.add %29, %4 overflow<nsw, nuw> : i64
    %51 = llvm.icmp "eq" %50, %16 : i64
    llvm.cond_br %51, ^bb5, ^bb4(%50 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %52 = llvm.add %17, %4 overflow<nsw, nuw> : i64
    %53 = llvm.icmp "eq" %52, %15 : i64
    llvm.cond_br %53, ^bb6, ^bb3(%52 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // 2 preds: ^bb1, ^bb5
    %54 = llvm.shl %10, %2 overflow<nsw> : i32
    %55 = llvm.sdiv %9, %6 : i32
    %56 = llvm.shl %8, %2 : i32
    %57 = llvm.or disjoint %56, %2 : i32
    %58 = llvm.add %11, %2 overflow<nsw, nuw> : i32
    %59 = llvm.icmp "eq" %58, %7 : i32
    llvm.cond_br %59, ^bb7, ^bb1(%57, %55, %54, %58 : i32, i32, i32, i32) {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    llvm.return
  }
}
