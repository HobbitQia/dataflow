#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external local_unnamed_addr @A(dense<0> : tensor<256x256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x array<256 x i32>>
  llvm.mlir.global external local_unnamed_addr @r(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @p(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @s(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @q(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @r : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(255 : i32) : i32
    %4 = llvm.mlir.addressof @A : !llvm.ptr
    %5 = llvm.mlir.constant(256 : i64) : i64
    %6 = llvm.mlir.addressof @p : !llvm.ptr
    %7 = llvm.mlir.addressof @s : !llvm.ptr
    %8 = llvm.mlir.constant(0 : i8) : i8
    %9 = llvm.mlir.constant(1024 : i64) : i64
    %10 = llvm.mlir.addressof @q : !llvm.ptr
    %11 = llvm.mlir.constant(0 : i32) : i32
    %12 = llvm.mlir.constant(2 : i64) : i64
    %13 = llvm.mlir.constant(254 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%14: i64):  // 2 preds: ^bb0, ^bb3
    %15 = llvm.getelementptr inbounds %1[0, %14] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %16 = llvm.trunc %14 : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb2(%0 : i64)
  ^bb2(%17: i64):  // 2 preds: ^bb1, ^bb2
    %18 = llvm.add %17, %2 overflow<nsw, nuw> : i64
    %19 = llvm.mul %18, %14 overflow<nsw, nuw> : i64
    %20 = llvm.trunc %19 : i64 to i32
    %21 = llvm.and %20, %3 : i32
    %22 = llvm.getelementptr inbounds %4[0, %14, %17] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    llvm.store %21, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.icmp "eq" %18, %5 : i64
    llvm.cond_br %23, ^bb3, ^bb2(%18 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %24 = llvm.add %14, %2 overflow<nsw, nuw> : i64
    %25 = llvm.icmp "eq" %24, %5 : i64
    llvm.cond_br %25, ^bb4(%0 : i64), ^bb1(%24 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%26: i64):  // 2 preds: ^bb3, ^bb4
    %27 = llvm.getelementptr inbounds %6[0, %26] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %28 = llvm.trunc %26 : i64 to i32
    llvm.store %28, %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %29 = llvm.add %26, %2 overflow<nsw, nuw> : i64
    %30 = llvm.icmp "eq" %29, %5 : i64
    llvm.cond_br %30, ^bb5, ^bb4(%29 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    "llvm.intr.memset"(%7, %8, %9) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb6(%0 : i64)
  ^bb6(%31: i64):  // 2 preds: ^bb5, ^bb8
    %32 = llvm.getelementptr inbounds %10[0, %31] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %33 = llvm.getelementptr inbounds %1[0, %31] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %34 = llvm.load %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb7(%11, %0 : i32, i64)
  ^bb7(%35: i32, %36: i64):  // 2 preds: ^bb6, ^bb7
    %37 = llvm.getelementptr inbounds %7[0, %36] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %38 = llvm.load %37 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.getelementptr inbounds %4[0, %31, %36] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    %40 = llvm.load %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.mul %40, %34 overflow<nsw> : i32
    %42 = llvm.add %41, %38 overflow<nsw> : i32
    llvm.store %42, %37 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %43 = llvm.getelementptr inbounds %6[0, %36] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %44 = llvm.load %43 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.mul %44, %40 overflow<nsw> : i32
    %46 = llvm.add %45, %35 overflow<nsw> : i32
    %47 = llvm.or %36, %2 : i64
    %48 = llvm.getelementptr inbounds %7[0, %47] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %49 = llvm.load %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.getelementptr inbounds %4[0, %31, %47] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.mul %51, %34 overflow<nsw> : i32
    %53 = llvm.add %52, %49 overflow<nsw> : i32
    llvm.store %53, %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %54 = llvm.getelementptr inbounds %6[0, %47] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %55 = llvm.load %54 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %56 = llvm.mul %55, %51 overflow<nsw> : i32
    %57 = llvm.add %56, %46 overflow<nsw> : i32
    %58 = llvm.add %36, %12 overflow<nsw, nuw> : i64
    %59 = llvm.icmp "ult" %36, %13 : i64
    llvm.cond_br %59, ^bb7(%57, %58 : i32, i64), ^bb8 {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    llvm.store %57, %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %60 = llvm.add %31, %2 overflow<nsw, nuw> : i64
    %61 = llvm.icmp "eq" %60, %5 : i64
    llvm.cond_br %61, ^bb9, ^bb6(%60 : i64) {loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return %11 : i32
  }
  func.func @_Z6kernelPA256_iPiS1_S1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.constant"() <{value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.constant"() <{value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
    %5 = "neura.constant"() <{value = 0 : i8}> : () -> !neura.data<i8, i1>
    %6 = "neura.constant"() <{value = 1024 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.constant"() <{value = 0 : i32}> : () -> !neura.data<i32, i1>
    %9 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %10 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %11 = "neura.constant"() <{value = 254 : i64}> : () -> !neura.data<i64, i1>
    %12 = "neura.constant"() <{value = 256 : i64}> : () -> !neura.data<i64, i1>
    "neura.memset"(%1, %5, %6) <{is_volatile = false}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i64, i1>) -> ()
    neura.br %7, %2, %8, %4, %7, %1, %0, %3, %9, %10, %11, %12 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%13: !neura.data<i64, i1>, %14: !neura.data<!llvm.ptr, i1>, %15: !neura.data<i32, i1>, %16: !neura.data<!llvm.ptr, i1>, %17: !neura.data<i64, i1>, %18: !neura.data<!llvm.ptr, i1>, %19: !neura.data<!llvm.ptr, i1>, %20: !neura.data<!llvm.ptr, i1>, %21: !neura.data<i64, i1>, %22: !neura.data<i64, i1>, %23: !neura.data<i64, i1>, %24: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb3
    %25 = "neura.gep"(%14, %13) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%15, %25) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %26 = "neura.gep"(%16, %13) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.br %17, %18, %26, %19, %13, %25, %20, %21, %22, %23, %24, %14, %15, %16, %17 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1> to ^bb2
  ^bb2(%27: !neura.data<i64, i1>, %28: !neura.data<!llvm.ptr, i1>, %29: !neura.data<!llvm.ptr, i1>, %30: !neura.data<!llvm.ptr, i1>, %31: !neura.data<i64, i1>, %32: !neura.data<!llvm.ptr, i1>, %33: !neura.data<!llvm.ptr, i1>, %34: !neura.data<i64, i1>, %35: !neura.data<i64, i1>, %36: !neura.data<i64, i1>, %37: !neura.data<i64, i1>, %38: !neura.data<!llvm.ptr, i1>, %39: !neura.data<i32, i1>, %40: !neura.data<!llvm.ptr, i1>, %41: !neura.data<i64, i1>):  // 2 preds: ^bb1, ^bb2
    %42 = "neura.gep"(%28, %27) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %44 = "neura.load"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %45 = "neura.gep"(%30, %31, %27) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %47 = "neura.mul"(%46, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48 = "neura.add"(%47, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%48, %42) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %49 = "neura.load"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %50 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %51 = "neura.gep"(%33, %27) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %52 = "neura.load"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %53 = "neura.mul"(%52, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %54 = "neura.add"(%53, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%54, %32) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %55 = "neura.or"(%27, %34) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56 = "neura.gep"(%28, %55) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.load"(%56) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %58 = "neura.load"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %59 = "neura.gep"(%30, %31, %55) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %60 = "neura.load"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %61 = "neura.mul"(%60, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %62 = "neura.add"(%61, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%62, %56) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %63 = "neura.load"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %64 = "neura.load"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %65 = "neura.gep"(%33, %55) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %66 = "neura.load"(%65) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %67 = "neura.mul"(%66, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %68 = "neura.add"(%67, %63) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%68, %32) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %69 = "neura.add"(%27, %35) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.icmp"(%27, %36) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %70 : !neura.data<i1, i1> then %69, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1> to ^bb2 else %31, %34, %37, %38, %39, %40, %41, %28, %30, %33, %35, %36 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb3
  ^bb3(%71: !neura.data<i64, i1>, %72: !neura.data<i64, i1>, %73: !neura.data<i64, i1>, %74: !neura.data<!llvm.ptr, i1>, %75: !neura.data<i32, i1>, %76: !neura.data<!llvm.ptr, i1>, %77: !neura.data<i64, i1>, %78: !neura.data<!llvm.ptr, i1>, %79: !neura.data<!llvm.ptr, i1>, %80: !neura.data<!llvm.ptr, i1>, %81: !neura.data<i64, i1>, %82: !neura.data<i64, i1>):  // pred: ^bb2
    %83 = "neura.add"(%71, %72) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %84 = "neura.icmp"(%83, %73) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %84 : !neura.data<i1, i1> then %84 : !neura.data<i1, i1> to ^bb4 else %83, %74, %75, %76, %77, %78, %79, %80, %72, %81, %82, %73 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb4(%85: !neura.data<i1, i1>):  // pred: ^bb3
    "neura.return"(%85) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

