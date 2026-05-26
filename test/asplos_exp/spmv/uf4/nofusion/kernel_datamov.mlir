#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %12 = llvm.mlir.constant(3 : i64) : i64
    %13 = llvm.mlir.constant(4 : i64) : i64
    %14 = llvm.mlir.constant(1020 : i64) : i64
    %15 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%16: i64):  // 2 preds: ^bb0, ^bb1
    %17 = llvm.trunc %16 : i64 to i32
    %18 = llvm.trunc %16 : i64 to i16
    %19 = llvm.urem %18, %1 : i16
    %20 = llvm.add %19, %2 overflow<nsw, nuw> : i16
    %21 = llvm.zext %20 : i16 to i32
    %22 = llvm.getelementptr inbounds %3[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %21, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.getelementptr inbounds %4[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %17, %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.getelementptr inbounds %5[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %17, %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %16, %6 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %7 : i64
    llvm.cond_br %26, ^bb2(%0 : i64), ^bb1(%25 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%27: i64):  // 2 preds: ^bb1, ^bb2
    %28 = llvm.trunc %27 : i64 to i16
    %29 = llvm.urem %28, %8 : i16
    %30 = llvm.zext %29 : i16 to i32
    %31 = llvm.getelementptr inbounds %9[0, %27] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %30, %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %32 = llvm.add %27, %6 overflow<nsw, nuw> : i64
    %33 = llvm.icmp "eq" %32, %7 : i64
    llvm.cond_br %33, ^bb3(%0 : i64), ^bb2(%32 : i64) {loop_annotation = #loop_annotation}
  ^bb3(%34: i64):  // 2 preds: ^bb2, ^bb3
    %35 = llvm.getelementptr inbounds %3[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %36 = llvm.load %35 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.getelementptr inbounds %4[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %38 = llvm.load %37 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.sext %38 : i32 to i64
    %40 = llvm.getelementptr inbounds %9[0, %39] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %41 = llvm.load %40 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.mul %41, %36 overflow<nsw> : i32
    %43 = llvm.getelementptr inbounds %5[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %44 = llvm.load %43 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.sext %44 : i32 to i64
    %46 = llvm.getelementptr inbounds %10[0, %45] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.add %47, %42 overflow<nsw> : i32
    llvm.store %48, %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %49 = llvm.or %34, %6 : i64
    %50 = llvm.getelementptr inbounds %3[0, %49] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.getelementptr inbounds %4[0, %49] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %53 = llvm.load %52 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %54 = llvm.sext %53 : i32 to i64
    %55 = llvm.getelementptr inbounds %9[0, %54] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %56 = llvm.load %55 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.mul %56, %51 overflow<nsw> : i32
    %58 = llvm.getelementptr inbounds %5[0, %49] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %59 = llvm.load %58 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %60 = llvm.sext %59 : i32 to i64
    %61 = llvm.getelementptr inbounds %10[0, %60] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %62 = llvm.load %61 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %63 = llvm.add %62, %57 overflow<nsw> : i32
    llvm.store %63, %61 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %64 = llvm.or %34, %11 : i64
    %65 = llvm.getelementptr inbounds %3[0, %64] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %66 = llvm.load %65 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %67 = llvm.getelementptr inbounds %4[0, %64] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %68 = llvm.load %67 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %69 = llvm.sext %68 : i32 to i64
    %70 = llvm.getelementptr inbounds %9[0, %69] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %71 = llvm.load %70 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %72 = llvm.mul %71, %66 overflow<nsw> : i32
    %73 = llvm.getelementptr inbounds %5[0, %64] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %74 = llvm.load %73 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %75 = llvm.sext %74 : i32 to i64
    %76 = llvm.getelementptr inbounds %10[0, %75] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %77 = llvm.load %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %78 = llvm.add %77, %72 overflow<nsw> : i32
    llvm.store %78, %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %79 = llvm.or %34, %12 : i64
    %80 = llvm.getelementptr inbounds %3[0, %79] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %81 = llvm.load %80 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %82 = llvm.getelementptr inbounds %4[0, %79] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %83 = llvm.load %82 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %84 = llvm.sext %83 : i32 to i64
    %85 = llvm.getelementptr inbounds %9[0, %84] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %86 = llvm.load %85 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %87 = llvm.mul %86, %81 overflow<nsw> : i32
    %88 = llvm.getelementptr inbounds %5[0, %79] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %89 = llvm.load %88 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %90 = llvm.sext %89 : i32 to i64
    %91 = llvm.getelementptr inbounds %10[0, %90] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %92 = llvm.load %91 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %93 = llvm.add %92, %87 overflow<nsw> : i32
    llvm.store %93, %91 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %94 = llvm.add %34, %13 overflow<nsw, nuw> : i64
    %95 = llvm.icmp "ult" %34, %14 : i64
    llvm.cond_br %95, ^bb3(%94 : i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %15 : i32
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
    %8 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
    %10 = "neura.grant_once"() <{constant_value = 1020 : i64}> : () -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = "neura.data_mov"(%10) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = neura.phi_start %12, %11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = "neura.data_mov"(%9) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = neura.phi_start %15, %14 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = neura.phi_start %18, %17 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = neura.phi_start %21, %20 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = neura.phi_start %24, %23 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %27 = "neura.data_mov"(%4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = neura.phi_start %27, %26 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %29 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %30 = "neura.data_mov"(%2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %31 = neura.phi_start %30, %29 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %32 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %33 = "neura.data_mov"(%3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = neura.phi_start %33, %32 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %35 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %36 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = neura.phi_start %36, %35 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %38 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %39 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = neura.phi_start %39, %38 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = neura.phi_start %42, %41 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %46 = "neura.gep"(%44, %45) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %47 = "neura.data_mov"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %48 = "neura.load"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %49 = "neura.data_mov"(%37) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %50 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.gep"(%49, %50) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %52 = "neura.data_mov"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %54 = "neura.data_mov"(%53) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %55 = neura.sext %54 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %56 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.data_mov"(%55) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = "neura.gep"(%56, %57) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %59 = "neura.data_mov"(%58) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %60 = "neura.load"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %62 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %63 = "neura.mul"(%61, %62) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %64 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %65 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.gep"(%64, %65) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %67 = "neura.data_mov"(%66) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %68 = "neura.load"(%67) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %70 = neura.sext %69 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %71 = "neura.data_mov"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = "neura.data_mov"(%70) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %73 = "neura.gep"(%71, %72) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %74 = "neura.data_mov"(%73) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %75 = "neura.load"(%74) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %76 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %77 = "neura.data_mov"(%63) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %78 = "neura.add"(%76, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %80 = "neura.data_mov"(%73) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%79, %80) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %81 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.data_mov"(%25) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = "neura.or"(%81, %82) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %84 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85 = "neura.data_mov"(%83) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %86 = "neura.gep"(%84, %85) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = "neura.data_mov"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = "neura.load"(%87) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %89 = "neura.data_mov"(%37) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %90 = "neura.data_mov"(%83) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %91 = "neura.gep"(%89, %90) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %92 = "neura.data_mov"(%91) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %93 = "neura.load"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %94 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %95 = neura.sext %94 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %96 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %97 = "neura.data_mov"(%95) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.gep"(%96, %97) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %99 = "neura.data_mov"(%98) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %101 = "neura.data_mov"(%100) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %102 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %103 = "neura.mul"(%101, %102) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %104 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %105 = "neura.data_mov"(%83) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %106 = "neura.gep"(%104, %105) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %107 = "neura.data_mov"(%106) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %108 = "neura.load"(%107) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %109 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %110 = neura.sext %109 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %111 = "neura.data_mov"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %112 = "neura.data_mov"(%110) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %113 = "neura.gep"(%111, %112) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %114 = "neura.data_mov"(%113) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %116 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %117 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %118 = "neura.add"(%116, %117) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %120 = "neura.data_mov"(%113) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%119, %120) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %121 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %122 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %123 = "neura.or"(%121, %122) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %124 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %125 = "neura.data_mov"(%123) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %126 = "neura.gep"(%124, %125) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %127 = "neura.data_mov"(%126) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %128 = "neura.load"(%127) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %129 = "neura.data_mov"(%37) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %130 = "neura.data_mov"(%123) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %131 = "neura.gep"(%129, %130) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %132 = "neura.data_mov"(%131) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %133 = "neura.load"(%132) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %134 = "neura.data_mov"(%133) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %135 = neura.sext %134 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %136 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %137 = "neura.data_mov"(%135) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %138 = "neura.gep"(%136, %137) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %139 = "neura.data_mov"(%138) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %140 = "neura.load"(%139) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %141 = "neura.data_mov"(%140) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %142 = "neura.data_mov"(%128) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %143 = "neura.mul"(%141, %142) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %144 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %145 = "neura.data_mov"(%123) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %146 = "neura.gep"(%144, %145) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %147 = "neura.data_mov"(%146) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %148 = "neura.load"(%147) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %149 = "neura.data_mov"(%148) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %150 = neura.sext %149 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %151 = "neura.data_mov"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %152 = "neura.data_mov"(%150) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %153 = "neura.gep"(%151, %152) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %154 = "neura.data_mov"(%153) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %155 = "neura.load"(%154) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %156 = "neura.data_mov"(%155) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %157 = "neura.data_mov"(%143) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %158 = "neura.add"(%156, %157) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %159 = "neura.data_mov"(%158) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %160 = "neura.data_mov"(%153) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%159, %160) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %161 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %162 = "neura.data_mov"(%19) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %163 = "neura.or"(%161, %162) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %164 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %165 = "neura.data_mov"(%163) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %166 = "neura.gep"(%164, %165) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %167 = "neura.data_mov"(%166) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %168 = "neura.load"(%167) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %169 = "neura.data_mov"(%37) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %170 = "neura.data_mov"(%163) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %171 = "neura.gep"(%169, %170) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %172 = "neura.data_mov"(%171) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %173 = "neura.load"(%172) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %174 = "neura.data_mov"(%173) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %175 = neura.sext %174 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %176 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %177 = "neura.data_mov"(%175) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %178 = "neura.gep"(%176, %177) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %179 = "neura.data_mov"(%178) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %180 = "neura.load"(%179) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %181 = "neura.data_mov"(%180) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %182 = "neura.data_mov"(%168) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %183 = "neura.mul"(%181, %182) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %184 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %185 = "neura.data_mov"(%163) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %186 = "neura.gep"(%184, %185) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %187 = "neura.data_mov"(%186) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %188 = "neura.load"(%187) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %189 = "neura.data_mov"(%188) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %190 = neura.sext %189 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %191 = "neura.data_mov"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %192 = "neura.data_mov"(%190) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %193 = "neura.gep"(%191, %192) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %194 = "neura.data_mov"(%193) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %195 = "neura.load"(%194) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %196 = "neura.data_mov"(%195) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %197 = "neura.data_mov"(%183) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %198 = "neura.add"(%196, %197) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %199 = "neura.data_mov"(%198) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %200 = "neura.data_mov"(%193) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%199, %200) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %201 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %202 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %203 = "neura.add"(%201, %202) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %204 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %205 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %206 = "neura.icmp"(%204, %205) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %207 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %208 = "neura.not"(%207) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %209 = "neura.data_mov"(%203) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %210 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %211 = neura.grant_predicate %209, %210 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %211 -> %41 : !neura.data<i64, i1> !neura.data<i64, i1>
    %212 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %213 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %214 = neura.grant_predicate %212, %213 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %214 -> %38 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %215 = "neura.data_mov"(%37) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %216 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %217 = neura.grant_predicate %215, %216 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %217 -> %35 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %218 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %219 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %220 = neura.grant_predicate %218, %219 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %220 -> %32 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %221 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %222 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %223 = neura.grant_predicate %221, %222 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %223 -> %29 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %224 = "neura.data_mov"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %225 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %226 = neura.grant_predicate %224, %225 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %226 -> %26 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %227 = "neura.data_mov"(%25) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %228 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %229 = neura.grant_predicate %227, %228 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %229 -> %23 : !neura.data<i64, i1> !neura.data<i64, i1>
    %230 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %231 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %232 = neura.grant_predicate %230, %231 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %232 -> %20 : !neura.data<i64, i1> !neura.data<i64, i1>
    %233 = "neura.data_mov"(%19) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %234 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %235 = neura.grant_predicate %233, %234 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %235 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    %236 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %237 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %238 = neura.grant_predicate %236, %237 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %238 -> %14 : !neura.data<i64, i1> !neura.data<i64, i1>
    %239 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %240 = "neura.data_mov"(%206) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %241 = neura.grant_predicate %239, %240 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %241 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %242 = "neura.data_mov"(%208) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %243 = "neura.data_mov"(%208) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %244 = neura.grant_predicate %242, %243 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %245 = "neura.data_mov"(%244) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %245 : !neura.data<i1, i1>
    neura.yield
  }
}

