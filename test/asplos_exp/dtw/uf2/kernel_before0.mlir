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
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 513 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = -513 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = -1 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 510 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 512 : i64}> : () -> !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.phi_start %9, %10 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.phi_start %8, %12 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.phi_start %7, %14 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.phi_start %6, %16 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = neura.phi_start %2, %18 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %20 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %21 = neura.phi_start %1, %20 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.phi_start %3, %22 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.phi_start %5, %24 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = neura.phi_start %4, %26 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %29 = neura.phi_start %0, %28 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.phi_start %3, %30 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %32 = "neura.gep"(%29, %31) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.mul"(%31, %27) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %34 = "neura.add"(%33, %25) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %35 = "neura.add"(%33, %27) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = neura.phi_start %25, %36 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = neura.phi_start %27, %38 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %41 = neura.phi_start %29, %40 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.phi_start %11, %42 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = neura.reserve : !neura.data<i64, i1>
    %45 = neura.phi_start %31, %44 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<i64, i1>
    %47 = neura.phi_start %13, %46 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = neura.phi_start %15, %48 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = neura.phi_start %35, %50 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %52 = neura.reserve : !neura.data<i64, i1>
    %53 = neura.phi_start %23, %52 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %54 = neura.reserve : !neura.data<i64, i1>
    %55 = neura.phi_start %17, %54 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %56 = neura.reserve : !neura.data<i64, i1>
    %57 = neura.phi_start %33, %56 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %58 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %59 = neura.phi_start %19, %58 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61 = neura.phi_start %34, %60 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %62 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %63 = neura.phi_start %21, %62 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %64 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %65 = neura.phi_start %32, %64 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %66 = neura.reserve : !neura.data<i64, i1>
    %67 = neura.phi_start %23, %66 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %68 = "neura.load"(%65) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %69 = "neura.gep"(%63, %67) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.load"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %71 = "neura.sub"(%68, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %72 = "neura.sub"(%70, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %73 = "neura.icmp"(%72, %71) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %74 = "neura.sel"(%73, %72, %71) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %75 = "neura.add"(%67, %61) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %76 = "neura.gep"(%59, %75) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = "neura.load"(%76) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %78 = "neura.add"(%67, %57) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %79 = "neura.gep"(%59, %78) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %80 = "neura.load"(%79) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %81 = "neura.add"(%78, %55) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.gep"(%59, %81) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.load"(%82) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %84 = "neura.icmp"(%80, %77) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %85 = "neura.sel"(%84, %80, %77) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %86 = "neura.icmp"(%83, %85) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %87 = "neura.sel"(%86, %83, %85) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %88 = "neura.add"(%87, %74) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %89 = "neura.add"(%67, %53) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %90 = "neura.add"(%89, %51) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %91 = "neura.gep"(%59, %90) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%88, %91) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %92 = "neura.gep"(%63, %89) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %93 = "neura.load"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %94 = "neura.sub"(%68, %93) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %95 = "neura.sub"(%93, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %96 = "neura.icmp"(%95, %94) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %97 = "neura.sel"(%96, %95, %94) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %98 = "neura.add"(%89, %61) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %99 = "neura.gep"(%59, %98) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %101 = "neura.add"(%89, %57) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = "neura.gep"(%59, %101) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.load"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %104 = "neura.load"(%79) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %105 = "neura.icmp"(%103, %100) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %106 = "neura.sel"(%105, %103, %100) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %107 = "neura.icmp"(%104, %106) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %108 = "neura.sel"(%107, %104, %106) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %109 = "neura.add"(%108, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %110 = "neura.add"(%67, %49) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %111 = "neura.add"(%110, %51) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %112 = "neura.gep"(%59, %111) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%109, %112) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %113 = "neura.icmp"(%67, %47) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %114 = neura.grant_predicate %110, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %114 -> %66 : !neura.data<i64, i1> !neura.data<i64, i1>
    %115 = neura.grant_predicate %65, %113 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %115 -> %64 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %116 = neura.grant_predicate %63, %113 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %116 -> %62 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %117 = neura.grant_predicate %61, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %117 -> %60 : !neura.data<i64, i1> !neura.data<i64, i1>
    %118 = neura.grant_predicate %59, %113 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %118 -> %58 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %119 = neura.grant_predicate %57, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %119 -> %56 : !neura.data<i64, i1> !neura.data<i64, i1>
    %120 = neura.grant_predicate %55, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %120 -> %54 : !neura.data<i64, i1> !neura.data<i64, i1>
    %121 = neura.grant_predicate %53, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %121 -> %52 : !neura.data<i64, i1> !neura.data<i64, i1>
    %122 = neura.grant_predicate %51, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %122 -> %50 : !neura.data<i64, i1> !neura.data<i64, i1>
    %123 = neura.grant_predicate %49, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %123 -> %48 : !neura.data<i64, i1> !neura.data<i64, i1>
    %124 = neura.grant_predicate %47, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %124 -> %46 : !neura.data<i64, i1> !neura.data<i64, i1>
    %125 = neura.grant_predicate %45, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %125 -> %44 : !neura.data<i64, i1> !neura.data<i64, i1>
    %126 = neura.grant_predicate %43, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %126 -> %42 : !neura.data<i64, i1> !neura.data<i64, i1>
    %127 = neura.grant_predicate %41, %113 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %127 -> %40 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %128 = neura.grant_predicate %39, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %128 -> %38 : !neura.data<i64, i1> !neura.data<i64, i1>
    %129 = neura.grant_predicate %37, %113 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %129 -> %36 : !neura.data<i64, i1> !neura.data<i64, i1>
    %130 = "neura.not"(%113) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %131 = neura.grant_predicate %45, %130 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %132 = neura.grant_predicate %53, %130 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %133 = neura.grant_predicate %43, %130 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %134 = neura.grant_predicate %41, %130 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %135 = neura.grant_predicate %39, %130 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %136 = neura.grant_predicate %37, %130 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %137 = neura.grant_predicate %63, %130 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %138 = neura.grant_predicate %59, %130 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %139 = neura.grant_predicate %55, %130 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %140 = neura.grant_predicate %49, %130 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %141 = neura.grant_predicate %47, %130 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %142 = "neura.add"(%131, %132) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %143 = "neura.icmp"(%142, %133) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %144 = "neura.not"(%143) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %145 = neura.grant_predicate %142, %144 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %145 -> %30 : !neura.data<i64, i1> !neura.data<i64, i1>
    %146 = neura.grant_predicate %134, %144 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %146 -> %28 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %147 = neura.grant_predicate %135, %144 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %147 -> %26 : !neura.data<i64, i1> !neura.data<i64, i1>
    %148 = neura.grant_predicate %136, %144 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %148 -> %24 : !neura.data<i64, i1> !neura.data<i64, i1>
    %149 = neura.grant_predicate %132, %144 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %149 -> %22 : !neura.data<i64, i1> !neura.data<i64, i1>
    %150 = neura.grant_predicate %137, %144 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %150 -> %20 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %151 = neura.grant_predicate %138, %144 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %151 -> %18 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %152 = neura.grant_predicate %139, %144 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %152 -> %16 : !neura.data<i64, i1> !neura.data<i64, i1>
    %153 = neura.grant_predicate %140, %144 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %153 -> %14 : !neura.data<i64, i1> !neura.data<i64, i1>
    %154 = neura.grant_predicate %141, %144 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %154 -> %12 : !neura.data<i64, i1> !neura.data<i64, i1>
    %155 = neura.grant_predicate %133, %144 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %155 -> %10 : !neura.data<i64, i1> !neura.data<i64, i1>
    %156 = neura.grant_predicate %143, %143 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %156 : !neura.data<i1, i1>
    neura.yield
  }
}

