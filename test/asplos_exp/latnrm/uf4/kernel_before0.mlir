#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr constant @_ZZ4mainE11coefficient(dense<[25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560]> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<16 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5state(dense<0> : tensor<12xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<12 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(false) : i1
    %2 = llvm.mlir.constant(5 : i64) : i64
    %3 = llvm.mlir.constant(4 : i64) : i64
    %4 = llvm.mlir.constant(3 : i64) : i64
    %5 = llvm.mlir.constant(2 : i64) : i64
    %6 = llvm.mlir.addressof @_ZZ4mainE11coefficient : !llvm.ptr
    %7 = llvm.mlir.constant(true) : i1
    %8 = llvm.mlir.constant(0 : i64) : i64
    %9 = llvm.mlir.constant(1 : i64) : i64
    %10 = llvm.mlir.addressof @_ZZ4mainE5state : !llvm.ptr
    %11 = llvm.mlir.constant(12 : i64) : i64
    %12 = llvm.getelementptr inbounds %10[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<12 x i32>
    llvm.br ^bb1(%8 : i64)
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb1
    %14 = llvm.add %13, %9 overflow<nsw, nuw> : i64
    %15 = llvm.getelementptr inbounds %10[0, %13] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %16 = llvm.trunc %14 : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.icmp "eq" %14, %11 : i64
    llvm.cond_br %17, ^bb2, ^bb1(%14 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %18 = llvm.load %10 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb3(%19, %18, %7, %8 : i32, i32, i1, i64)
  ^bb3(%20: i32, %21: i32, %22: i1, %23: i64):  // 2 preds: ^bb2, ^bb3
    %24 = llvm.shl %23, %9 overflow<nsw, nuw> : i64
    %25 = llvm.getelementptr inbounds %6[0, %24] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %26 = llvm.load %25 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %27 = llvm.or %24, %9 : i64
    %28 = llvm.getelementptr inbounds %6[0, %27] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %29 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.or %23, %5 : i64
    %31 = llvm.getelementptr inbounds %10[0, %30] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %32 = llvm.load %31 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %20, %31 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.mul %29, %21 overflow<nsw> : i32
    %34 = llvm.mul %32, %26 overflow<nsw> : i32
    %35 = llvm.sub %33, %34 overflow<nsw> : i32
    %36 = llvm.mul %32, %29 overflow<nsw> : i32
    %37 = llvm.mul %26, %21 overflow<nsw> : i32
    %38 = llvm.add %36, %37 overflow<nsw> : i32
    %39 = llvm.or %24, %5 : i64
    %40 = llvm.getelementptr inbounds %6[0, %39] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %41 = llvm.load %40 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.or %24, %4 : i64
    %43 = llvm.getelementptr inbounds %6[0, %42] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %44 = llvm.load %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.or %23, %4 : i64
    %46 = llvm.getelementptr inbounds %10[0, %45] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %38, %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %48 = llvm.mul %44, %35 overflow<nsw> : i32
    %49 = llvm.mul %47, %41 overflow<nsw> : i32
    %50 = llvm.sub %48, %49 overflow<nsw> : i32
    %51 = llvm.mul %47, %44 overflow<nsw> : i32
    %52 = llvm.mul %41, %35 overflow<nsw> : i32
    %53 = llvm.add %51, %52 overflow<nsw> : i32
    %54 = llvm.shl %30, %9 overflow<nsw, nuw> : i64
    %55 = llvm.getelementptr inbounds %6[0, %54] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %56 = llvm.load %55 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.or %54, %9 : i64
    %58 = llvm.getelementptr inbounds %6[0, %57] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %59 = llvm.load %58 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %60 = llvm.add %23, %3 overflow<nsw, nuw> : i64
    %61 = llvm.getelementptr inbounds %10[0, %60] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %62 = llvm.load %61 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %53, %61 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %63 = llvm.mul %59, %50 overflow<nsw> : i32
    %64 = llvm.mul %62, %56 overflow<nsw> : i32
    %65 = llvm.sub %63, %64 overflow<nsw> : i32
    %66 = llvm.mul %62, %59 overflow<nsw> : i32
    %67 = llvm.mul %56, %50 overflow<nsw> : i32
    %68 = llvm.add %66, %67 overflow<nsw> : i32
    %69 = llvm.shl %45, %9 overflow<nsw, nuw> : i64
    %70 = llvm.getelementptr inbounds %6[0, %69] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %71 = llvm.load %70 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %72 = llvm.or %69, %9 : i64
    %73 = llvm.getelementptr inbounds %6[0, %72] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %74 = llvm.load %73 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %75 = llvm.add %23, %2 overflow<nsw, nuw> : i64
    %76 = llvm.getelementptr inbounds %10[0, %75] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %77 = llvm.load %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %68, %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %78 = llvm.mul %74, %65 overflow<nsw> : i32
    %79 = llvm.mul %77, %71 overflow<nsw> : i32
    %80 = llvm.sub %78, %79 overflow<nsw> : i32
    %81 = llvm.mul %77, %74 overflow<nsw> : i32
    %82 = llvm.mul %71, %65 overflow<nsw> : i32
    %83 = llvm.add %81, %82 overflow<nsw> : i32
    llvm.cond_br %22, ^bb3(%83, %80, %1, %3 : i32, i32, i1, i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.store %80, %10 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.store %83, %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.return %0 : i32
  }
  func.func @_Z6kernelPiPKi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = true}> : () -> !neura.data<i1, i1>
    %5 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 5 : i64}> : () -> !neura.data<i64, i1>
    %10 = "neura.grant_once"() <{constant_value = false}> : () -> !neura.data<i1, i1>
    %11 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %12 = "neura.gep"(%1, %11) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %13 = "neura.grant_once"(%12) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %14 = "neura.load"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %15 = "neura.grant_once"(%14) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %16 = "neura.load"(%12) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %17 = "neura.grant_once"(%16) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %18 = neura.reserve : !neura.data<i1, i1>
    %19 = neura.phi_start %10, %18 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %20 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %21 = neura.phi_start %13, %20 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.phi_start %9, %22 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.phi_start %8, %24 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = neura.phi_start %7, %26 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %29 = neura.phi_start %0, %28 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.phi_start %6, %30 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %33 = neura.phi_start %2, %32 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = neura.phi_start %3, %34 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = neura.phi_start %5, %36 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<i1, i1>
    %39 = neura.phi_start %4, %38 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %40 = neura.reserve : !neura.data<i32, i1>
    %41 = neura.phi_start %15, %40 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %42 = neura.reserve : !neura.data<i32, i1>
    %43 = neura.phi_start %17, %42 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %44 = "neura.shl"(%37, %35) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.gep"(%33, %44) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %47 = "neura.or"(%44, %35) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %48 = "neura.gep"(%33, %47) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %49 = "neura.load"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %50 = "neura.or"(%37, %31) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.gep"(%29, %50) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %52 = "neura.load"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    "neura.store"(%43, %51) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %53 = "neura.mul"(%41, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %54 = "neura.mul"(%52, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %55 = "neura.sub"(%53, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %56 = "neura.mul"(%52, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %57 = "neura.mul"(%41, %46) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %58 = "neura.add"(%56, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %59 = "neura.or"(%44, %31) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.gep"(%33, %59) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %61 = "neura.load"(%60) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %62 = "neura.or"(%44, %27) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %63 = "neura.gep"(%33, %62) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %64 = "neura.load"(%63) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %65 = "neura.or"(%37, %27) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.gep"(%29, %65) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %67 = "neura.load"(%66) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    "neura.store"(%58, %66) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %68 = "neura.mul"(%64, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %69 = "neura.mul"(%67, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %70 = "neura.sub"(%68, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %71 = "neura.mul"(%67, %64) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %72 = "neura.mul"(%61, %55) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %73 = "neura.add"(%71, %72) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %74 = "neura.shl"(%50, %35) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %75 = "neura.gep"(%33, %74) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %76 = "neura.load"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %77 = "neura.or"(%74, %35) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = "neura.gep"(%33, %77) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.load"(%78) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %80 = "neura.add"(%37, %25) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81 = "neura.gep"(%29, %80) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %82 = "neura.load"(%81) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    "neura.store"(%73, %81) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %83 = "neura.mul"(%79, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %84 = "neura.mul"(%82, %76) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %85 = "neura.sub"(%83, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %86 = "neura.mul"(%82, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %87 = "neura.mul"(%76, %70) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %88 = "neura.add"(%86, %87) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %89 = "neura.shl"(%65, %35) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %90 = "neura.gep"(%33, %89) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %91 = "neura.load"(%90) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %92 = "neura.or"(%89, %35) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %93 = "neura.gep"(%33, %92) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %94 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %95 = "neura.add"(%37, %23) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96 = "neura.gep"(%29, %95) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %97 = "neura.load"(%96) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    "neura.store"(%88, %96) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %98 = "neura.mul"(%94, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %99 = "neura.mul"(%97, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %100 = "neura.sub"(%98, %99) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%100, %29) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %101 = "neura.mul"(%97, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %102 = "neura.mul"(%91, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %103 = "neura.add"(%101, %102) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%103, %21) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %104 = "neura.not"(%39) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %105 = neura.grant_predicate %103, %39 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %105 -> %42 : !neura.data<i32, i1> !neura.data<i32, i1>
    %106 = neura.grant_predicate %100, %39 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %106 -> %40 : !neura.data<i32, i1> !neura.data<i32, i1>
    %107 = neura.grant_predicate %19, %39 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.ctrl_mov %107 -> %38 : !neura.data<i1, i1> !neura.data<i1, i1>
    %108 = neura.grant_predicate %25, %39 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %108 -> %36 : !neura.data<i64, i1> !neura.data<i64, i1>
    %109 = neura.grant_predicate %35, %39 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %109 -> %34 : !neura.data<i64, i1> !neura.data<i64, i1>
    %110 = neura.grant_predicate %33, %39 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %110 -> %32 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %111 = neura.grant_predicate %31, %39 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %111 -> %30 : !neura.data<i64, i1> !neura.data<i64, i1>
    %112 = neura.grant_predicate %29, %39 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %112 -> %28 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %113 = neura.grant_predicate %27, %39 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %113 -> %26 : !neura.data<i64, i1> !neura.data<i64, i1>
    %114 = neura.grant_predicate %25, %39 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %114 -> %24 : !neura.data<i64, i1> !neura.data<i64, i1>
    %115 = neura.grant_predicate %23, %39 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %115 -> %22 : !neura.data<i64, i1> !neura.data<i64, i1>
    %116 = neura.grant_predicate %21, %39 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %116 -> %20 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %117 = neura.grant_predicate %19, %39 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.ctrl_mov %117 -> %18 : !neura.data<i1, i1> !neura.data<i1, i1>
    %118 = neura.grant_predicate %104, %104 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %118 : !neura.data<i1, i1>
    neura.yield
  }
}

