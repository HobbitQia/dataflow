#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "clang version 20.1.7 (https://github.com/llvm/llvm-project.git 6146a88f60492b520a36f8f8f3231e15f3cc6082)"} {
  llvm.func local_unnamed_addr @kernel_bicg_int(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef}) attributes {memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = none>, no_unwind, passthrough = ["nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i8) : i8
    %1 = llvm.mlir.constant(32 : i64) : i64
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.mlir.constant(0 : i32) : i32
    %4 = llvm.mlir.constant(5 : i64) : i64
    %5 = llvm.mlir.constant(1 : i64) : i64
    %6 = llvm.mlir.constant(8 : i64) : i64
    "llvm.intr.memset"(%arg3, %0, %1) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb2(%2 : i64)
  ^bb1:  // pred: ^bb3
    llvm.return
  ^bb2(%7: i64):  // 2 preds: ^bb0, ^bb3
    %8 = llvm.getelementptr inbounds %arg4[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %3, %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %9 = llvm.getelementptr inbounds %arg2[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %10 = llvm.shl %7, %4 overflow<nsw> : i64
    %11 = llvm.getelementptr inbounds %arg0[%10] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    llvm.br ^bb4(%2 : i64)
  ^bb3:  // pred: ^bb4
    %12 = llvm.add %7, %5 overflow<nsw, nuw> : i64
    %13 = llvm.icmp "eq" %12, %6 : i64
    llvm.cond_br %13, ^bb1, ^bb2(%12 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%14: i64):  // 2 preds: ^bb2, ^bb4
    %15 = llvm.getelementptr inbounds %11[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %16 = llvm.load %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %17 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.mul %17, %16 overflow<nsw> : i32
    %19 = llvm.getelementptr inbounds %arg3[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %20 = llvm.load %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.add %20, %18 overflow<nsw> : i32
    llvm.store %21, %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.getelementptr inbounds %arg1[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %23 = llvm.load %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.mul %23, %16 overflow<nsw> : i32
    %25 = llvm.load %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.add %25, %24 overflow<nsw> : i32
    llvm.store %26, %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %27 = llvm.add %14, %5 overflow<nsw, nuw> : i64
    %28 = llvm.icmp "eq" %27, %6 : i64
    llvm.cond_br %28, ^bb3, ^bb4(%27 : i64) {loop_annotation = #loop_annotation}
  }
}
