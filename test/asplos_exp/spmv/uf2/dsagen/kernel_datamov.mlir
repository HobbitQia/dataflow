#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3val(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3col(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3row(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE7feature(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE6output(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(7 : i16) : i16
    %2 = llvm.mlir.constant(1 : i16) : i16
    %3 = llvm.mlir.addressof @_ZZ4mainE3val : !llvm.ptr
    %4 = llvm.mlir.addressof @_ZZ4mainE3col : !llvm.ptr
    %5 = llvm.mlir.addressof @_ZZ4mainE3row : !llvm.ptr
    %6 = llvm.mlir.constant(1 : i64) : i64
    %7 = llvm.mlir.constant(1024 : i64) : i64
    %8 = llvm.mlir.constant(13 : i16) : i16
    %9 = llvm.mlir.addressof @_ZZ4mainE7feature : !llvm.ptr
    %10 = llvm.mlir.addressof @_ZZ4mainE6output : !llvm.ptr
    %11 = llvm.mlir.constant(2 : i64) : i64
    %12 = llvm.mlir.constant(1022 : i64) : i64
    %13 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%14: i64):  // 2 preds: ^bb0, ^bb1
    %15 = llvm.trunc %14 : i64 to i32
    %16 = llvm.trunc %14 : i64 to i16
    %17 = llvm.urem %16, %1 : i16
    %18 = llvm.add %17, %2 overflow<nsw, nuw> : i16
    %19 = llvm.zext %18 : i16 to i32
    %20 = llvm.getelementptr inbounds %3[0, %14] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %19, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.getelementptr inbounds %4[0, %14] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %15, %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.getelementptr inbounds %5[0, %14] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %15, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %14, %6 overflow<nsw, nuw> : i64
    %24 = llvm.icmp "eq" %23, %7 : i64
    llvm.cond_br %24, ^bb2(%0 : i64), ^bb1(%23 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%25: i64):  // 2 preds: ^bb1, ^bb2
    %26 = llvm.trunc %25 : i64 to i16
    %27 = llvm.urem %26, %8 : i16
    %28 = llvm.zext %27 : i16 to i32
    %29 = llvm.getelementptr inbounds %9[0, %25] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %28, %29 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %30 = llvm.add %25, %6 overflow<nsw, nuw> : i64
    %31 = llvm.icmp "eq" %30, %7 : i64
    llvm.cond_br %31, ^bb3(%0 : i64), ^bb2(%30 : i64) {loop_annotation = #loop_annotation}
  ^bb3(%32: i64):  // 2 preds: ^bb2, ^bb3
    %33 = llvm.getelementptr inbounds %3[0, %32] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %34 = llvm.load %33 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.getelementptr inbounds %4[0, %32] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %36 = llvm.load %35 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.sext %36 : i32 to i64
    %38 = llvm.getelementptr inbounds %9[0, %37] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %39 = llvm.load %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %40 = llvm.mul %39, %34 overflow<nsw> : i32
    %41 = llvm.getelementptr inbounds %5[0, %32] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %42 = llvm.load %41 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.sext %42 : i32 to i64
    %44 = llvm.getelementptr inbounds %10[0, %43] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %45 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.add %45, %40 overflow<nsw> : i32
    llvm.store %46, %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.or %32, %6 : i64
    %48 = llvm.getelementptr inbounds %3[0, %47] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %49 = llvm.load %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.getelementptr inbounds %4[0, %47] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.sext %51 : i32 to i64
    %53 = llvm.getelementptr inbounds %9[0, %52] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %54 = llvm.load %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.mul %54, %49 overflow<nsw> : i32
    %56 = llvm.getelementptr inbounds %5[0, %47] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %57 = llvm.load %56 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %58 = llvm.sext %57 : i32 to i64
    %59 = llvm.getelementptr inbounds %10[0, %58] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %60 = llvm.load %59 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %61 = llvm.add %60, %55 overflow<nsw> : i32
    llvm.store %61, %59 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %62 = llvm.add %32, %11 overflow<nsw, nuw> : i64
    %63 = llvm.icmp "ult" %32, %12 : i64
    llvm.cond_br %63, ^bb3(%62 : i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %13 : i32
  }
  func.func @_Z6kernelPiS_S_S_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
    %5 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 1022 : i64}> : () -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11 = neura.phi_start %10, %9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = neura.phi_start %13, %12 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = neura.phi_start %16, %15 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = "neura.data_mov"(%4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %20 = neura.phi_start %19, %18 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = "neura.data_mov"(%2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = neura.phi_start %22, %21 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %25 = "neura.data_mov"(%3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %26 = neura.phi_start %25, %24 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %27 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %28 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = neura.phi_start %28, %27 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %31 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %32 = neura.phi_start %31, %30 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %35 = neura.phi_start %34, %33 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %36 = "neura.data_mov"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = "neura.data_mov"(%35) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %38 = "neura.gep"(%36, %37) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %39 = "neura.data_mov"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = "neura.load"(%39) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %41 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %42 = "neura.data_mov"(%35) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = "neura.gep"(%41, %42) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = "neura.data_mov"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.load"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %46 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %47 = neura.sext %46 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %48 = "neura.data_mov"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %49 = "neura.data_mov"(%47) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = "neura.gep"(%48, %49) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %51 = "neura.data_mov"(%50) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %52 = "neura.load"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %54 = "neura.data_mov"(%40) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %55 = "neura.mul"(%53, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %56 = "neura.data_mov"(%23) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.data_mov"(%35) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = "neura.gep"(%56, %57) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %59 = "neura.data_mov"(%58) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %60 = "neura.load"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %62 = neura.sext %61 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %63 = "neura.data_mov"(%20) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %64 = "neura.data_mov"(%62) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.gep"(%63, %64) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %66 = "neura.data_mov"(%65) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %67 = "neura.load"(%66) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %68 = "neura.data_mov"(%67) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %69 = "neura.data_mov"(%55) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %70 = "neura.add"(%68, %69) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %72 = "neura.data_mov"(%65) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%71, %72) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %73 = "neura.data_mov"(%35) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %74 = "neura.data_mov"(%17) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %75 = "neura.or"(%73, %74) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %76 = "neura.data_mov"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = "neura.data_mov"(%75) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = "neura.gep"(%76, %77) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.data_mov"(%78) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %80 = "neura.load"(%79) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %81 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %82 = "neura.data_mov"(%75) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = "neura.gep"(%81, %82) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.data_mov"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85 = "neura.load"(%84) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %87 = neura.sext %86 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %88 = "neura.data_mov"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %89 = "neura.data_mov"(%87) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %90 = "neura.gep"(%88, %89) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %91 = "neura.data_mov"(%90) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %92 = "neura.load"(%91) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %94 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %95 = "neura.mul"(%93, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %96 = "neura.data_mov"(%23) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %97 = "neura.data_mov"(%75) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.gep"(%96, %97) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %99 = "neura.data_mov"(%98) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %101 = "neura.data_mov"(%100) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %102 = neura.sext %101 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %103 = "neura.data_mov"(%20) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %104 = "neura.data_mov"(%102) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %105 = "neura.gep"(%103, %104) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %106 = "neura.data_mov"(%105) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %107 = "neura.load"(%106) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %108 = "neura.data_mov"(%107) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %109 = "neura.data_mov"(%95) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %110 = "neura.add"(%108, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %111 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %112 = "neura.data_mov"(%105) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%111, %112) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %113 = "neura.data_mov"(%35) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %114 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %115 = "neura.add"(%113, %114) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %116 = "neura.data_mov"(%35) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %117 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %118 = "neura.icmp"(%116, %117) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %119 = "neura.data_mov"(%118) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %120 = "neura.not"(%119) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %121 = "neura.data_mov"(%115) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %122 = "neura.data_mov"(%118) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %123 = neura.grant_predicate %121, %122 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %123 -> %33 : !neura.data<i64, i1> !neura.data<i64, i1>
    %124 = "neura.data_mov"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %125 = "neura.data_mov"(%118) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %126 = neura.grant_predicate %124, %125 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %126 -> %30 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %127 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %128 = "neura.data_mov"(%118) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %129 = neura.grant_predicate %127, %128 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %129 -> %27 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %130 = "neura.data_mov"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %131 = "neura.data_mov"(%118) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %132 = neura.grant_predicate %130, %131 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %132 -> %24 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %133 = "neura.data_mov"(%23) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %134 = "neura.data_mov"(%118) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %135 = neura.grant_predicate %133, %134 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %135 -> %21 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %136 = "neura.data_mov"(%20) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %137 = "neura.data_mov"(%118) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %138 = neura.grant_predicate %136, %137 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %138 -> %18 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %139 = "neura.data_mov"(%17) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %140 = "neura.data_mov"(%118) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %141 = neura.grant_predicate %139, %140 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %141 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %142 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %143 = "neura.data_mov"(%118) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %144 = neura.grant_predicate %142, %143 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %144 -> %12 : !neura.data<i64, i1> !neura.data<i64, i1>
    %145 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %146 = "neura.data_mov"(%118) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %147 = neura.grant_predicate %145, %146 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %147 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    %148 = "neura.data_mov"(%120) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %149 = "neura.data_mov"(%120) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %150 = neura.grant_predicate %148, %149 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %151 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %151 : !neura.data<i1, i1>
    neura.yield
  }
}

