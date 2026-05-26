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
    %12 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %13 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = "neura.gep"(%12, %13) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %15 = "neura.data_mov"(%14) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %16 = "neura.grant_once"(%15) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %17 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %18 = "neura.load"(%17) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %19 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %20 = "neura.grant_once"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %21 = "neura.data_mov"(%14) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = "neura.load"(%21) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %24 = "neura.grant_once"(%23) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %25 = neura.reserve : !neura.data<i1, i1>
    %26 = "neura.data_mov"(%10) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %27 = neura.phi_start %26, %25 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %28 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %29 = "neura.data_mov"(%16) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %30 = neura.phi_start %29, %28 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %31 = neura.reserve : !neura.data<i64, i1>
    %32 = "neura.data_mov"(%9) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = neura.phi_start %32, %31 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = neura.phi_start %35, %34 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = neura.phi_start %38, %37 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %41 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %42 = neura.phi_start %41, %40 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %43 = neura.reserve : !neura.data<i64, i1>
    %44 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = neura.phi_start %44, %43 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %47 = "neura.data_mov"(%2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %48 = neura.phi_start %47, %46 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %49 = neura.reserve : !neura.data<i64, i1>
    %50 = "neura.data_mov"(%3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = neura.phi_start %50, %49 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %52 = neura.reserve : !neura.data<i64, i1>
    %53 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = neura.phi_start %53, %52 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %55 = neura.reserve : !neura.data<i1, i1>
    %56 = "neura.data_mov"(%4) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %57 = neura.phi_start %56, %55 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %58 = neura.reserve : !neura.data<i32, i1>
    %59 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %60 = neura.phi_start %59, %58 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %61 = neura.reserve : !neura.data<i32, i1>
    %62 = "neura.data_mov"(%24) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %63 = neura.phi_start %62, %61 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %64 = "neura.data_mov"(%54) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.shl"(%64, %65) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %68 = "neura.data_mov"(%66) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.gep"(%67, %68) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.load"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %72 = "neura.data_mov"(%66) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %73 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %74 = "neura.or"(%72, %73) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %75 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %76 = "neura.data_mov"(%74) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %77 = "neura.gep"(%75, %76) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %78 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.load"(%78) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %80 = "neura.data_mov"(%54) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81 = "neura.data_mov"(%45) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.or"(%80, %81) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = "neura.data_mov"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.data_mov"(%82) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %85 = "neura.gep"(%83, %84) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %86 = "neura.data_mov"(%85) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = "neura.load"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %88 = "neura.data_mov"(%63) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %89 = "neura.data_mov"(%85) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%88, %89) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %90 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %91 = "neura.data_mov"(%79) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %92 = "neura.mul"(%90, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %93 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %94 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %95 = "neura.mul"(%93, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %96 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %97 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %98 = "neura.sub"(%96, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %99 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %100 = "neura.data_mov"(%79) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %101 = "neura.mul"(%99, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %102 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %103 = "neura.data_mov"(%71) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %104 = "neura.mul"(%102, %103) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %105 = "neura.data_mov"(%101) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %106 = "neura.data_mov"(%104) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %107 = "neura.add"(%105, %106) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %108 = "neura.data_mov"(%66) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %109 = "neura.data_mov"(%45) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %110 = "neura.or"(%108, %109) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %111 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %112 = "neura.data_mov"(%110) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %113 = "neura.gep"(%111, %112) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %114 = "neura.data_mov"(%113) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %116 = "neura.data_mov"(%66) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %117 = "neura.data_mov"(%39) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %118 = "neura.or"(%116, %117) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %119 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %120 = "neura.data_mov"(%118) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %121 = "neura.gep"(%119, %120) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %122 = "neura.data_mov"(%121) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %123 = "neura.load"(%122) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %124 = "neura.data_mov"(%54) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %125 = "neura.data_mov"(%39) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %126 = "neura.or"(%124, %125) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %127 = "neura.data_mov"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %128 = "neura.data_mov"(%126) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %129 = "neura.gep"(%127, %128) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %130 = "neura.data_mov"(%129) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %131 = "neura.load"(%130) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %132 = "neura.data_mov"(%107) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %133 = "neura.data_mov"(%129) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%132, %133) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %134 = "neura.data_mov"(%123) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %135 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %136 = "neura.mul"(%134, %135) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %137 = "neura.data_mov"(%131) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %138 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %139 = "neura.mul"(%137, %138) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %140 = "neura.data_mov"(%136) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %141 = "neura.data_mov"(%139) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %142 = "neura.sub"(%140, %141) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %143 = "neura.data_mov"(%131) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %144 = "neura.data_mov"(%123) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %145 = "neura.mul"(%143, %144) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %146 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %147 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %148 = "neura.mul"(%146, %147) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %149 = "neura.data_mov"(%145) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %150 = "neura.data_mov"(%148) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %151 = "neura.add"(%149, %150) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %152 = "neura.data_mov"(%82) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %153 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %154 = "neura.shl"(%152, %153) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %155 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %156 = "neura.data_mov"(%154) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %157 = "neura.gep"(%155, %156) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %158 = "neura.data_mov"(%157) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %159 = "neura.load"(%158) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %160 = "neura.data_mov"(%154) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %161 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %162 = "neura.or"(%160, %161) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %163 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %164 = "neura.data_mov"(%162) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %165 = "neura.gep"(%163, %164) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %166 = "neura.data_mov"(%165) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %167 = "neura.load"(%166) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %168 = "neura.data_mov"(%54) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %169 = "neura.data_mov"(%36) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %170 = "neura.add"(%168, %169) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %171 = "neura.data_mov"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %172 = "neura.data_mov"(%170) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %173 = "neura.gep"(%171, %172) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %174 = "neura.data_mov"(%173) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %175 = "neura.load"(%174) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %176 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %177 = "neura.data_mov"(%173) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%176, %177) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %178 = "neura.data_mov"(%167) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %179 = "neura.data_mov"(%142) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %180 = "neura.mul"(%178, %179) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %181 = "neura.data_mov"(%175) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %182 = "neura.data_mov"(%159) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %183 = "neura.mul"(%181, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %184 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %185 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %186 = "neura.sub"(%184, %185) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %187 = "neura.data_mov"(%175) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %188 = "neura.data_mov"(%167) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %189 = "neura.mul"(%187, %188) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %190 = "neura.data_mov"(%159) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %191 = "neura.data_mov"(%142) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %192 = "neura.mul"(%190, %191) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %193 = "neura.data_mov"(%189) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %194 = "neura.data_mov"(%192) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %195 = "neura.add"(%193, %194) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %196 = "neura.data_mov"(%126) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %197 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %198 = "neura.shl"(%196, %197) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %199 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %200 = "neura.data_mov"(%198) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %201 = "neura.gep"(%199, %200) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %202 = "neura.data_mov"(%201) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %203 = "neura.load"(%202) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %204 = "neura.data_mov"(%198) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %205 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %206 = "neura.or"(%204, %205) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %207 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %208 = "neura.data_mov"(%206) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %209 = "neura.gep"(%207, %208) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %210 = "neura.data_mov"(%209) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %211 = "neura.load"(%210) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %212 = "neura.data_mov"(%54) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %213 = "neura.data_mov"(%33) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %214 = "neura.add"(%212, %213) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %215 = "neura.data_mov"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %216 = "neura.data_mov"(%214) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %217 = "neura.gep"(%215, %216) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %218 = "neura.data_mov"(%217) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %219 = "neura.load"(%218) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %220 = "neura.data_mov"(%195) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %221 = "neura.data_mov"(%217) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%220, %221) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %222 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %223 = "neura.data_mov"(%186) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %224 = "neura.mul"(%222, %223) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %225 = "neura.data_mov"(%219) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %226 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %227 = "neura.mul"(%225, %226) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %228 = "neura.data_mov"(%224) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %229 = "neura.data_mov"(%227) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %230 = "neura.sub"(%228, %229) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %231 = "neura.data_mov"(%230) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %232 = "neura.data_mov"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%231, %232) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %233 = "neura.data_mov"(%219) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %234 = "neura.data_mov"(%211) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %235 = "neura.mul"(%233, %234) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %236 = "neura.data_mov"(%203) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %237 = "neura.data_mov"(%186) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %238 = "neura.mul"(%236, %237) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %239 = "neura.data_mov"(%235) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %240 = "neura.data_mov"(%238) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %241 = "neura.add"(%239, %240) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %242 = "neura.data_mov"(%241) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %243 = "neura.data_mov"(%30) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%242, %243) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %244 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %245 = "neura.not"(%244) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %246 = "neura.data_mov"(%241) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %247 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %248 = neura.grant_predicate %246, %247 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %248 -> %61 : !neura.data<i32, i1> !neura.data<i32, i1>
    %249 = "neura.data_mov"(%230) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %250 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %251 = neura.grant_predicate %249, %250 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %251 -> %58 : !neura.data<i32, i1> !neura.data<i32, i1>
    %252 = "neura.data_mov"(%27) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %253 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %254 = neura.grant_predicate %252, %253 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.ctrl_mov %254 -> %55 : !neura.data<i1, i1> !neura.data<i1, i1>
    %255 = "neura.data_mov"(%36) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %256 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %257 = neura.grant_predicate %255, %256 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %257 -> %52 : !neura.data<i64, i1> !neura.data<i64, i1>
    %258 = "neura.data_mov"(%51) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %259 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %260 = neura.grant_predicate %258, %259 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %260 -> %49 : !neura.data<i64, i1> !neura.data<i64, i1>
    %261 = "neura.data_mov"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %262 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %263 = neura.grant_predicate %261, %262 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %263 -> %46 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %264 = "neura.data_mov"(%45) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %265 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %266 = neura.grant_predicate %264, %265 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %266 -> %43 : !neura.data<i64, i1> !neura.data<i64, i1>
    %267 = "neura.data_mov"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %268 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %269 = neura.grant_predicate %267, %268 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %269 -> %40 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %270 = "neura.data_mov"(%39) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %271 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %272 = neura.grant_predicate %270, %271 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %272 -> %37 : !neura.data<i64, i1> !neura.data<i64, i1>
    %273 = "neura.data_mov"(%36) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %274 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %275 = neura.grant_predicate %273, %274 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %275 -> %34 : !neura.data<i64, i1> !neura.data<i64, i1>
    %276 = "neura.data_mov"(%33) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %277 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %278 = neura.grant_predicate %276, %277 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %278 -> %31 : !neura.data<i64, i1> !neura.data<i64, i1>
    %279 = "neura.data_mov"(%30) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %280 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %281 = neura.grant_predicate %279, %280 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %281 -> %28 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %282 = "neura.data_mov"(%27) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %283 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %284 = neura.grant_predicate %282, %283 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.ctrl_mov %284 -> %25 : !neura.data<i1, i1> !neura.data<i1, i1>
    %285 = "neura.data_mov"(%245) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %286 = "neura.data_mov"(%245) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %287 = neura.grant_predicate %285, %286 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %288 = "neura.data_mov"(%287) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %288 : !neura.data<i1, i1>
    neura.yield
  }
}

