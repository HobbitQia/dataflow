#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr constant @_ZZ4mainE11coefficient(dense<[25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560]> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<16 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5state(dense<0> : tensor<12xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<12 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(6 : i64) : i64
    %2 = llvm.mlir.constant(3 : i64) : i64
    %3 = llvm.mlir.constant(2 : i64) : i64
    %4 = llvm.mlir.addressof @_ZZ4mainE11coefficient : !llvm.ptr
    %5 = llvm.mlir.constant(0 : i64) : i64
    %6 = llvm.mlir.constant(1 : i64) : i64
    %7 = llvm.mlir.addressof @_ZZ4mainE5state : !llvm.ptr
    %8 = llvm.mlir.constant(12 : i64) : i64
    %9 = llvm.getelementptr inbounds %7[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<12 x i32>
    llvm.br ^bb1(%5 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb1
    %11 = llvm.add %10, %6 overflow<nsw, nuw> : i64
    %12 = llvm.getelementptr inbounds %7[0, %10] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %13 = llvm.trunc %11 : i64 to i32
    llvm.store %13, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %14 = llvm.icmp "eq" %11, %8 : i64
    llvm.cond_br %14, ^bb2, ^bb1(%11 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %15 = llvm.load %7 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb3(%16, %15, %5 : i32, i32, i64)
  ^bb3(%17: i32, %18: i32, %19: i64):  // 2 preds: ^bb2, ^bb3
    %20 = llvm.shl %19, %6 overflow<nsw, nuw> : i64
    %21 = llvm.getelementptr inbounds %4[0, %20] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %22 = llvm.load %21 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.or %20, %6 : i64
    %24 = llvm.getelementptr inbounds %4[0, %23] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.add %19, %3 overflow<nsw, nuw> : i64
    %27 = llvm.getelementptr inbounds %7[0, %26] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %28 = llvm.load %27 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %17, %27 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %29 = llvm.mul %25, %18 overflow<nsw> : i32
    %30 = llvm.mul %28, %22 overflow<nsw> : i32
    %31 = llvm.sub %29, %30 overflow<nsw> : i32
    %32 = llvm.mul %28, %25 overflow<nsw> : i32
    %33 = llvm.mul %22, %18 overflow<nsw> : i32
    %34 = llvm.add %32, %33 overflow<nsw> : i32
    %35 = llvm.or %20, %3 : i64
    %36 = llvm.getelementptr inbounds %4[0, %35] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %37 = llvm.load %36 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %38 = llvm.or %20, %2 : i64
    %39 = llvm.getelementptr inbounds %4[0, %38] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.add %19, %2 overflow<nsw, nuw> : i64
    %42 = llvm.getelementptr inbounds %7[0, %41] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %43 = llvm.load %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %34, %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %44 = llvm.mul %40, %31 overflow<nsw> : i32
    %45 = llvm.mul %43, %37 overflow<nsw> : i32
    %46 = llvm.sub %44, %45 overflow<nsw> : i32
    llvm.store %46, %7 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.mul %43, %40 overflow<nsw> : i32
    %48 = llvm.mul %37, %31 overflow<nsw> : i32
    %49 = llvm.add %47, %48 overflow<nsw> : i32
    llvm.store %49, %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.icmp "ult" %19, %1 : i64
    llvm.cond_br %50, ^bb3(%49, %46, %26 : i32, i32, i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %0 : i32
  }
  func.func @_Z6kernelPiPKi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %3 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.constant"() <{value = 3 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = 6 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.gep"(%0, %7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %9 = "neura.load"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %10 = "neura.load"(%8) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    neura.br %10, %9, %3, %2, %1, %4, %0, %5, %8, %6 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%11: !neura.data<i32, i1>, %12: !neura.data<i32, i1>, %13: !neura.data<i64, i1>, %14: !neura.data<i64, i1>, %15: !neura.data<!llvm.ptr, i1>, %16: !neura.data<i64, i1>, %17: !neura.data<!llvm.ptr, i1>, %18: !neura.data<i64, i1>, %19: !neura.data<!llvm.ptr, i1>, %20: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb1
    %21 = "neura.shl"(%13, %14) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = "neura.gep"(%15, %21) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = "neura.load"(%22) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %24 = "neura.or"(%21, %14) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.gep"(%15, %24) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %26 = "neura.load"(%25) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %27 = "neura.add"(%13, %16) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.gep"(%17, %27) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = "neura.load"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    "neura.store"(%11, %28) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %30 = "neura.mul"(%12, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %31 = "neura.mul"(%29, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %32 = "neura.sub"(%30, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %33 = "neura.mul"(%29, %26) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %34 = "neura.mul"(%12, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %35 = "neura.add"(%33, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %36 = "neura.or"(%21, %16) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = "neura.gep"(%15, %36) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = "neura.load"(%37) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %39 = "neura.or"(%21, %18) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %40 = "neura.gep"(%15, %39) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %41 = "neura.load"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %42 = "neura.add"(%13, %18) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = "neura.gep"(%17, %42) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = "neura.load"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    "neura.store"(%35, %43) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %45 = "neura.mul"(%41, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %46 = "neura.mul"(%44, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %47 = "neura.sub"(%45, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%47, %17) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %48 = "neura.mul"(%44, %41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.mul"(%38, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %50 = "neura.add"(%48, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%50, %19) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %51 = "neura.icmp"(%13, %20) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %52 = "neura.not"(%51) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.cond_br %51 : !neura.data<i1, i1> then %50, %47, %27, %14, %15, %16, %17, %18, %19, %20 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1> to ^bb1 else %52 : !neura.data<i1, i1> to ^bb2
  ^bb2(%53: !neura.data<i1, i1>):  // pred: ^bb1
    "neura.return"(%53) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

