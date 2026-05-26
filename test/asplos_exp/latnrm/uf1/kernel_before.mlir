#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr constant @_ZZ4mainE11coefficient(dense<[25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560]> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<16 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5state(dense<0> : tensor<12xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<12 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(8 : i64) : i64
    %2 = llvm.mlir.constant(2 : i64) : i64
    %3 = llvm.mlir.addressof @_ZZ4mainE11coefficient : !llvm.ptr
    %4 = llvm.mlir.constant(0 : i64) : i64
    %5 = llvm.mlir.constant(1 : i64) : i64
    %6 = llvm.mlir.addressof @_ZZ4mainE5state : !llvm.ptr
    %7 = llvm.mlir.constant(12 : i64) : i64
    %8 = llvm.getelementptr inbounds %6[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<12 x i32>
    llvm.br ^bb1(%4 : i64)
  ^bb1(%9: i64):  // 2 preds: ^bb0, ^bb1
    %10 = llvm.add %9, %5 overflow<nsw, nuw> : i64
    %11 = llvm.getelementptr inbounds %6[0, %9] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %12 = llvm.trunc %10 : i64 to i32
    llvm.store %12, %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %13 = llvm.icmp "eq" %10, %7 : i64
    llvm.cond_br %13, ^bb2, ^bb1(%10 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %14 = llvm.load %6 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %15 = llvm.load %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb3(%15, %14, %4 : i32, i32, i64)
  ^bb3(%16: i32, %17: i32, %18: i64):  // 2 preds: ^bb2, ^bb3
    %19 = llvm.shl %18, %5 overflow<nsw, nuw> : i64
    %20 = llvm.getelementptr inbounds %3[0, %19] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %21 = llvm.load %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.or %19, %5 : i64
    %23 = llvm.getelementptr inbounds %3[0, %22] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %24 = llvm.load %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.add %18, %2 overflow<nsw, nuw> : i64
    %26 = llvm.getelementptr inbounds %6[0, %25] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %27 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %16, %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %28 = llvm.mul %24, %17 overflow<nsw> : i32
    %29 = llvm.mul %27, %21 overflow<nsw> : i32
    %30 = llvm.sub %28, %29 overflow<nsw> : i32
    llvm.store %30, %6 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %31 = llvm.mul %27, %24 overflow<nsw> : i32
    %32 = llvm.mul %21, %17 overflow<nsw> : i32
    %33 = llvm.add %31, %32 overflow<nsw> : i32
    llvm.store %33, %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %34 = llvm.add %18, %5 overflow<nsw, nuw> : i64
    %35 = llvm.icmp "eq" %34, %1 : i64
    llvm.cond_br %35, ^bb4, ^bb3(%33, %30, %34 : i32, i32, i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %0 : i32
  }
  func.func @_Z6kernelPiPKi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %3 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.constant"() <{value = 8 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.gep"(%0, %6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %8 = "neura.load"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %9 = "neura.load"(%7) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    neura.br %9, %8, %3, %2, %1, %4, %0, %7, %5 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%10: !neura.data<i32, i1>, %11: !neura.data<i32, i1>, %12: !neura.data<i64, i1>, %13: !neura.data<i64, i1>, %14: !neura.data<!llvm.ptr, i1>, %15: !neura.data<i64, i1>, %16: !neura.data<!llvm.ptr, i1>, %17: !neura.data<!llvm.ptr, i1>, %18: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb1
    %19 = "neura.shl"(%12, %13) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20 = "neura.gep"(%14, %19) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %21 = "neura.load"(%20) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %22 = "neura.or"(%19, %13) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23 = "neura.gep"(%14, %22) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %24 = "neura.load"(%23) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %25 = "neura.add"(%12, %15) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.gep"(%16, %25) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %27 = "neura.load"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    "neura.store"(%10, %26) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %28 = "neura.mul"(%11, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %29 = "neura.mul"(%27, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %30 = "neura.sub"(%28, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%30, %16) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %31 = "neura.mul"(%27, %24) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %32 = "neura.mul"(%11, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %33 = "neura.add"(%31, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%33, %17) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %34 = "neura.add"(%12, %13) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %35 = "neura.icmp"(%34, %18) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %35 : !neura.data<i1, i1> then %35 : !neura.data<i1, i1> to ^bb2 else %33, %30, %34, %13, %14, %15, %16, %17, %18 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1> to ^bb1
  ^bb2(%36: !neura.data<i1, i1>):  // pred: ^bb1
    "neura.return"(%36) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

