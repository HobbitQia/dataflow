#loop_unroll = #llvm.loop_unroll<disable = true>
#loop_vectorize = #llvm.loop_vectorize<width = 1 : i32>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<vectorize = #loop_vectorize, mustProgress = true>
#loop_annotation1 = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "clang version 20.1.7 (https://github.com/llvm/llvm-project.git 6146a88f60492b520a36f8f8f3231e15f3cc6082)"} {
  llvm.func local_unnamed_addr @kernel_int(%arg0: i32 {llvm.noundef}, %arg1: i32 {llvm.noundef}, %arg2: i32 {llvm.noundef}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = none>, no_unwind, passthrough = ["nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(0 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.icmp "sgt" %arg0, %0 : i32
    %4 = llvm.icmp "sgt" %arg2, %0 : i32
    %5 = llvm.and %3, %4 : i1
    %6 = llvm.icmp "sgt" %arg1, %0 : i32
    %7 = llvm.and %5, %6 : i1
    llvm.cond_br %7, ^bb1, ^bb7
  ^bb1:  // pred: ^bb0
    %8 = llvm.zext nneg %arg0 : i32 to i64
    %9 = llvm.zext nneg %arg2 : i32 to i64
    %10 = llvm.zext nneg %arg1 : i32 to i64
    llvm.br ^bb2(%1 : i64)
  ^bb2(%11: i64):  // 2 preds: ^bb1, ^bb6
    llvm.br ^bb3(%1 : i64)
  ^bb3(%12: i64):  // 2 preds: ^bb2, ^bb5
    %13 = llvm.getelementptr inbounds %arg4[%11, %12] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1200 x i32>
    llvm.br ^bb4(%1 : i64)
  ^bb4(%14: i64):  // 2 preds: ^bb3, ^bb4
    %15 = llvm.load %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.getelementptr inbounds %arg5[%12, %14] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x i32>
    %17 = llvm.load %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.mul %17, %15 overflow<nsw> : i32
    %19 = llvm.getelementptr inbounds %arg3[%11, %14] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1100 x i32>
    %20 = llvm.load %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.add %20, %18 overflow<nsw> : i32
    llvm.store %21, %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.add %14, %2 overflow<nsw, nuw> : i64
    %23 = llvm.icmp "eq" %22, %10 : i64
    llvm.cond_br %23, ^bb5, ^bb4(%22 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %24 = llvm.add %12, %2 overflow<nsw, nuw> : i64
    %25 = llvm.icmp "eq" %24, %9 : i64
    llvm.cond_br %25, ^bb6, ^bb3(%24 : i64) {loop_annotation = #loop_annotation1}
  ^bb6:  // pred: ^bb5
    %26 = llvm.add %11, %2 overflow<nsw, nuw> : i64
    %27 = llvm.icmp "eq" %26, %8 : i64
    llvm.cond_br %27, ^bb7, ^bb2(%26 : i64) {loop_annotation = #loop_annotation1}
  ^bb7:  // 2 preds: ^bb0, ^bb6
    llvm.return
  }
}
