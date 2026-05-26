#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1S(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<512 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1T(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<512 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3DTW(dense<0> : tensor<263169xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<263169 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.addressof @_ZZ4mainE1S : !llvm.ptr
    %3 = llvm.mlir.addressof @_ZZ4mainE1T : !llvm.ptr
    %4 = llvm.mlir.constant(3 : i32) : i32
    %5 = llvm.mlir.constant(512 : i64) : i64
    %6 = llvm.mlir.addressof @_ZZ4mainE3DTW : !llvm.ptr
    %7 = llvm.mlir.constant(65535 : i32) : i32
    %8 = llvm.mlir.constant(263169 : i64) : i64
    %9 = llvm.mlir.constant(0 : i32) : i32
    %10 = llvm.mlir.constant(513 : i64) : i64
    %11 = llvm.mlir.constant(-513 : i64) : i64
    %12 = llvm.mlir.constant(-1 : i64) : i64
    %13 = llvm.mlir.constant(2 : i64) : i64
    %14 = llvm.mlir.constant(510 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%15: i64):  // 2 preds: ^bb0, ^bb1
    %16 = llvm.add %15, %1 overflow<nsw, nuw> : i64
    %17 = llvm.getelementptr inbounds %2[0, %15] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %18 = llvm.trunc %16 : i64 to i32
    llvm.store %18, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.getelementptr inbounds %3[0, %15] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %20 = llvm.trunc %15 : i64 to i32
    %21 = llvm.add %20, %4 : i32
    llvm.store %21, %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.icmp "eq" %16, %5 : i64
    llvm.cond_br %22, ^bb2(%0 : i64), ^bb1(%16 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%23: i64):  // 2 preds: ^bb1, ^bb2
    %24 = llvm.getelementptr inbounds %6[0, %23] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %7, %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %23, %1 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %8 : i64
    llvm.cond_br %26, ^bb3, ^bb2(%25 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.store %9, %6 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb4(%1 : i64)
  ^bb4(%27: i64):  // 2 preds: ^bb3, ^bb6
    %28 = llvm.getelementptr inbounds %2[0, %27] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %29 = llvm.mul %27, %10 overflow<nsw, nuw> : i64
    %30 = llvm.add %29, %11 overflow<nsw> : i64
    %31 = llvm.add %29, %10 overflow<nsw, nuw> : i64
    %32 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb5(%1 : i64)
  ^bb5(%33: i64):  // 2 preds: ^bb4, ^bb5
    %34 = llvm.getelementptr inbounds %3[0, %33] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %35 = llvm.load %34 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %36 = llvm.sub %32, %35 overflow<nsw> : i32
    %37 = llvm.sub %35, %32 overflow<nsw> : i32
    %38 = llvm.icmp "sgt" %37, %36 : i32
    %39 = llvm.select %38, %37, %36 : i1, i32
    %40 = llvm.add %33, %30 overflow<nsw, nuw> : i64
    %41 = llvm.getelementptr inbounds %6[0, %40] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %42 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.add %33, %29 overflow<nsw, nuw> : i64
    %44 = llvm.getelementptr inbounds %6[0, %43] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %45 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.add %43, %12 overflow<nsw> : i64
    %47 = llvm.getelementptr inbounds %6[0, %46] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %48 = llvm.load %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.icmp "slt" %45, %42 : i32
    %50 = llvm.select %49, %45, %42 : i1, i32
    %51 = llvm.icmp "slt" %48, %50 : i32
    %52 = llvm.select %51, %48, %50 : i1, i32
    %53 = llvm.add %52, %39 overflow<nsw> : i32
    %54 = llvm.add %33, %1 overflow<nsw, nuw> : i64
    %55 = llvm.add %54, %31 overflow<nsw, nuw> : i64
    %56 = llvm.getelementptr inbounds %6[0, %55] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %53, %56 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %57 = llvm.getelementptr inbounds %3[0, %54] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %58 = llvm.load %57 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %59 = llvm.sub %32, %58 overflow<nsw> : i32
    %60 = llvm.sub %58, %32 overflow<nsw> : i32
    %61 = llvm.icmp "sgt" %60, %59 : i32
    %62 = llvm.select %61, %60, %59 : i1, i32
    %63 = llvm.add %54, %30 overflow<nsw, nuw> : i64
    %64 = llvm.getelementptr inbounds %6[0, %63] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %65 = llvm.load %64 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %66 = llvm.add %54, %29 overflow<nsw, nuw> : i64
    %67 = llvm.getelementptr inbounds %6[0, %66] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %68 = llvm.load %67 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %69 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %70 = llvm.icmp "slt" %68, %65 : i32
    %71 = llvm.select %70, %68, %65 : i1, i32
    %72 = llvm.icmp "slt" %69, %71 : i32
    %73 = llvm.select %72, %69, %71 : i1, i32
    %74 = llvm.add %73, %62 overflow<nsw> : i32
    %75 = llvm.add %33, %13 overflow<nsw, nuw> : i64
    %76 = llvm.add %75, %31 overflow<nsw, nuw> : i64
    %77 = llvm.getelementptr inbounds %6[0, %76] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %74, %77 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %78 = llvm.icmp "ult" %33, %14 : i64
    llvm.cond_br %78, ^bb5(%75 : i64), ^bb6 {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    %79 = llvm.add %27, %1 overflow<nsw, nuw> : i64
    %80 = llvm.icmp "eq" %79, %5 : i64
    llvm.cond_br %80, ^bb7, ^bb4(%79 : i64) {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    llvm.return %9 : i32
  }
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.constant"() <{value = 513 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.constant"() <{value = -513 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = -1 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.constant"() <{value = 510 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.constant"() <{value = 512 : i64}> : () -> !neura.data<i64, i1>
    neura.br %3, %0, %4, %5, %3, %1, %2, %6, %7, %8, %9 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%10: !neura.data<i64, i1>, %11: !neura.data<!llvm.ptr, i1>, %12: !neura.data<i64, i1>, %13: !neura.data<i64, i1>, %14: !neura.data<i64, i1>, %15: !neura.data<!llvm.ptr, i1>, %16: !neura.data<!llvm.ptr, i1>, %17: !neura.data<i64, i1>, %18: !neura.data<i64, i1>, %19: !neura.data<i64, i1>, %20: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb3
    %21 = "neura.gep"(%11, %10) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = "neura.mul"(%10, %12) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23 = "neura.add"(%22, %13) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = "neura.add"(%22, %12) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.br %14, %21, %15, %23, %16, %22, %17, %14, %24, %18, %19, %10, %20, %11, %12, %13 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2
  ^bb2(%25: !neura.data<i64, i1>, %26: !neura.data<!llvm.ptr, i1>, %27: !neura.data<!llvm.ptr, i1>, %28: !neura.data<i64, i1>, %29: !neura.data<!llvm.ptr, i1>, %30: !neura.data<i64, i1>, %31: !neura.data<i64, i1>, %32: !neura.data<i64, i1>, %33: !neura.data<i64, i1>, %34: !neura.data<i64, i1>, %35: !neura.data<i64, i1>, %36: !neura.data<i64, i1>, %37: !neura.data<i64, i1>, %38: !neura.data<!llvm.ptr, i1>, %39: !neura.data<i64, i1>, %40: !neura.data<i64, i1>):  // 2 preds: ^bb1, ^bb2
    %41 = "neura.load"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %42 = "neura.gep"(%27, %25) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %44 = "neura.sub"(%41, %43) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %45 = "neura.sub"(%43, %41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %46 = "neura.icmp"(%45, %44) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %47 = "neura.sel"(%46, %45, %44) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48 = "neura.add"(%25, %28) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %49 = "neura.gep"(%29, %48) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %50 = "neura.load"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %51 = "neura.add"(%25, %30) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.gep"(%29, %51) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %54 = "neura.add"(%51, %31) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = "neura.gep"(%29, %54) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = "neura.load"(%55) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %57 = "neura.icmp"(%53, %50) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %58 = "neura.sel"(%57, %53, %50) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %59 = "neura.icmp"(%56, %58) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %60 = "neura.sel"(%59, %56, %58) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %61 = "neura.add"(%60, %47) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %62 = "neura.add"(%25, %32) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %63 = "neura.add"(%62, %33) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64 = "neura.gep"(%29, %63) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%61, %64) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %65 = "neura.gep"(%27, %62) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %66 = "neura.load"(%65) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %67 = "neura.sub"(%41, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %68 = "neura.sub"(%66, %41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %69 = "neura.icmp"(%68, %67) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %70 = "neura.sel"(%69, %68, %67) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %71 = "neura.add"(%62, %28) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %72 = "neura.gep"(%29, %71) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %73 = "neura.load"(%72) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %74 = "neura.add"(%62, %30) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %75 = "neura.gep"(%29, %74) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %76 = "neura.load"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %77 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %78 = "neura.icmp"(%76, %73) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %79 = "neura.sel"(%78, %76, %73) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %80 = "neura.icmp"(%77, %79) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %81 = "neura.sel"(%80, %77, %79) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %82 = "neura.add"(%81, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %83 = "neura.add"(%25, %34) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %84 = "neura.add"(%83, %33) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %85 = "neura.gep"(%29, %84) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%82, %85) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %86 = "neura.icmp"(%25, %35) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %86 : !neura.data<i1, i1> then %83, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2 else %36, %32, %37, %38, %39, %40, %27, %29, %31, %34, %35 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb3
  ^bb3(%87: !neura.data<i64, i1>, %88: !neura.data<i64, i1>, %89: !neura.data<i64, i1>, %90: !neura.data<!llvm.ptr, i1>, %91: !neura.data<i64, i1>, %92: !neura.data<i64, i1>, %93: !neura.data<!llvm.ptr, i1>, %94: !neura.data<!llvm.ptr, i1>, %95: !neura.data<i64, i1>, %96: !neura.data<i64, i1>, %97: !neura.data<i64, i1>):  // pred: ^bb2
    %98 = "neura.add"(%87, %88) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %99 = "neura.icmp"(%98, %89) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %99 : !neura.data<i1, i1> then %99 : !neura.data<i1, i1> to ^bb4 else %98, %90, %91, %92, %88, %93, %94, %95, %96, %97, %89 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb4(%100: !neura.data<i1, i1>):  // pred: ^bb3
    "neura.return"(%100) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

