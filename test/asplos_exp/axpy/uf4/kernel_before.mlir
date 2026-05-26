#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1x(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1y(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE1x : !llvm.ptr
    %2 = llvm.mlir.constant(7 : i16) : i16
    %3 = llvm.mlir.addressof @_ZZ4mainE1y : !llvm.ptr
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(1024 : i64) : i64
    %6 = llvm.mlir.constant(dense<3> : vector<4xi32>) : vector<4xi32>
    %7 = llvm.mlir.constant(4 : i64) : i64
    %8 = llvm.mlir.constant(1020 : i64) : i64
    %9 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb1
    %11 = llvm.trunc %10 : i64 to i32
    %12 = llvm.getelementptr inbounds %1[0, %10] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %11, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %13 = llvm.trunc %10 : i64 to i16
    %14 = llvm.urem %13, %2 : i16
    %15 = llvm.zext %14 : i16 to i32
    %16 = llvm.getelementptr inbounds %3[0, %10] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %15, %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.add %10, %4 overflow<nsw, nuw> : i64
    %18 = llvm.icmp "eq" %17, %5 : i64
    llvm.cond_br %18, ^bb2(%0 : i64), ^bb1(%17 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%19: i64):  // 2 preds: ^bb1, ^bb2
    %20 = llvm.getelementptr inbounds %1[0, %19] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %21 = llvm.getelementptr inbounds %3[0, %19] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %22 = llvm.load %20 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> vector<4xi32>
    %23 = llvm.mul %22, %6 overflow<nsw> : vector<4xi32>
    %24 = llvm.load %21 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> vector<4xi32>
    %25 = llvm.add %23, %24 overflow<nsw> : vector<4xi32>
    llvm.store %25, %21 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : vector<4xi32>, !llvm.ptr
    %26 = llvm.add %19, %7 overflow<nsw, nuw> : i64
    %27 = llvm.icmp "ult" %19, %8 : i64
    llvm.cond_br %27, ^bb2(%26 : i64), ^bb3 {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.return %9 : i32
  }
  func.func @_Z6kernelPKiPi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %3 = "neura.constant"() <{value = 3 : i32}> : () -> !neura.data<i32, i1>
    %4 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = 3 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 4 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.constant"() <{value = 1020 : i64}> : () -> !neura.data<i64, i1>
    neura.br %2, %0, %3, %1, %4, %5, %6, %7, %8 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%9: !neura.data<i64, i1>, %10: !neura.data<!llvm.ptr, i1>, %11: !neura.data<i32, i1>, %12: !neura.data<!llvm.ptr, i1>, %13: !neura.data<i64, i1>, %14: !neura.data<i64, i1>, %15: !neura.data<i64, i1>, %16: !neura.data<i64, i1>, %17: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb1
    %18 = "neura.gep"(%10, %9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %19 = "neura.load"(%18) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %20 = "neura.mul"(%19, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %21 = "neura.gep"(%12, %9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = "neura.load"(%21) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %23 = "neura.add"(%20, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%23, %21) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %24 = "neura.or"(%9, %13) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.gep"(%10, %24) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %26 = "neura.load"(%25) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %27 = "neura.mul"(%26, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %28 = "neura.gep"(%12, %24) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = "neura.load"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %30 = "neura.add"(%27, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%30, %28) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %31 = "neura.or"(%9, %14) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = "neura.gep"(%10, %31) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.load"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %34 = "neura.mul"(%33, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %35 = "neura.gep"(%12, %31) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %36 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %37 = "neura.add"(%34, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%37, %35) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %38 = "neura.or"(%9, %15) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = "neura.gep"(%10, %38) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = "neura.load"(%39) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %41 = "neura.mul"(%40, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %42 = "neura.gep"(%12, %38) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %44 = "neura.add"(%41, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%44, %42) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %45 = "neura.add"(%9, %16) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %46 = "neura.icmp"(%9, %17) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %47 = "neura.not"(%46) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.cond_br %46 : !neura.data<i1, i1> then %45, %10, %11, %12, %13, %14, %15, %16, %17 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1 else %47 : !neura.data<i1, i1> to ^bb2
  ^bb2(%48: !neura.data<i1, i1>):  // pred: ^bb1
    "neura.return"(%48) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

