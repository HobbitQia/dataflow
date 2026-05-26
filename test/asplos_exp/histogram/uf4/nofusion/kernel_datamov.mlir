#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external local_unnamed_addr @input_data(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global external local_unnamed_addr @hist(dense<0> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<16 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @input_data : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(1024 : i64) : i64
    %4 = llvm.mlir.addressof @hist : !llvm.ptr
    %5 = llvm.mlir.constant(0 : i8) : i8
    %6 = llvm.mlir.constant(64 : i64) : i64
    %7 = llvm.mlir.constant(4 : i32) : i32
    %8 = llvm.mlir.constant(1023 : i32) : i32
    %9 = llvm.mlir.constant(1 : i32) : i32
    %10 = llvm.mlir.constant(2 : i64) : i64
    %11 = llvm.mlir.constant(3 : i64) : i64
    %12 = llvm.mlir.constant(4 : i64) : i64
    %13 = llvm.mlir.constant(1020 : i64) : i64
    %14 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%15: i64):  // 2 preds: ^bb0, ^bb1
    %16 = llvm.getelementptr inbounds %1[0, %15] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %17 = llvm.trunc %15 : i64 to i32
    llvm.store %17, %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %18 = llvm.add %15, %2 overflow<nsw, nuw> : i64
    %19 = llvm.icmp "eq" %18, %3 : i64
    llvm.cond_br %19, ^bb2, ^bb1(%18 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    "llvm.intr.memset"(%4, %5, %6) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb3(%0 : i64)
  ^bb3(%20: i64):  // 2 preds: ^bb2, ^bb3
    %21 = llvm.getelementptr inbounds %1[0, %20] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %22 = llvm.load %21 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.shl %22, %7 overflow<nsw> : i32
    %24 = llvm.sdiv %23, %8 : i32
    %25 = llvm.sext %24 : i32 to i64
    %26 = llvm.getelementptr inbounds %4[0, %25] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %27 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %28 = llvm.add %27, %9 overflow<nsw> : i32
    llvm.store %28, %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %29 = llvm.or %20, %2 : i64
    %30 = llvm.getelementptr inbounds %1[0, %29] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %31 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %32 = llvm.shl %31, %7 overflow<nsw> : i32
    %33 = llvm.sdiv %32, %8 : i32
    %34 = llvm.sext %33 : i32 to i64
    %35 = llvm.getelementptr inbounds %4[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %36 = llvm.load %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.add %36, %9 overflow<nsw> : i32
    llvm.store %37, %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %38 = llvm.or %20, %10 : i64
    %39 = llvm.getelementptr inbounds %1[0, %38] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %40 = llvm.load %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.shl %40, %7 overflow<nsw> : i32
    %42 = llvm.sdiv %41, %8 : i32
    %43 = llvm.sext %42 : i32 to i64
    %44 = llvm.getelementptr inbounds %4[0, %43] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %45 = llvm.load %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.add %45, %9 overflow<nsw> : i32
    llvm.store %46, %44 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.or %20, %11 : i64
    %48 = llvm.getelementptr inbounds %1[0, %47] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %49 = llvm.load %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.shl %49, %7 overflow<nsw> : i32
    %51 = llvm.sdiv %50, %8 : i32
    %52 = llvm.sext %51 : i32 to i64
    %53 = llvm.getelementptr inbounds %4[0, %52] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %54 = llvm.load %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.add %54, %9 overflow<nsw> : i32
    llvm.store %55, %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %56 = llvm.add %20, %12 overflow<nsw, nuw> : i64
    %57 = llvm.icmp "ult" %20, %13 : i64
    llvm.cond_br %57, ^bb3(%56 : i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %14 : i32
  }
  func.func @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 4 : i32}> : () -> !neura.data<i32, i1>
    %4 = "neura.grant_once"() <{constant_value = 1023 : i32}> : () -> !neura.data<i32, i1>
    %5 = "neura.grant_once"() <{constant_value = 1 : i32}> : () -> !neura.data<i32, i1>
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
    %26 = neura.reserve : !neura.data<i32, i1>
    %27 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %28 = neura.phi_start %27, %26 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %29 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %30 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %31 = neura.phi_start %30, %29 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %32 = neura.reserve : !neura.data<i32, i1>
    %33 = "neura.data_mov"(%4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %34 = neura.phi_start %33, %32 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %35 = neura.reserve : !neura.data<i32, i1>
    %36 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %37 = neura.phi_start %36, %35 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %38 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %39 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = neura.phi_start %39, %38 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = neura.phi_start %42, %41 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %46 = "neura.gep"(%44, %45) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %47 = "neura.data_mov"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %48 = "neura.load"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %49 = "neura.data_mov"(%48) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %50 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %51 = "neura.shl"(%49, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %52 = "neura.data_mov"(%51) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %53 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %54 = "neura.div"(%52, %53) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %56 = neura.sext %55 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %57 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %58 = "neura.data_mov"(%56) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.gep"(%57, %58) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %60 = "neura.data_mov"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %61 = "neura.load"(%60) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %63 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %64 = "neura.add"(%62, %63) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %65 = "neura.data_mov"(%64) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %66 = "neura.data_mov"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%65, %66) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %67 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = "neura.data_mov"(%25) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.or"(%67, %68) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.data_mov"(%69) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %72 = "neura.gep"(%70, %71) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %73 = "neura.data_mov"(%72) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %74 = "neura.load"(%73) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %76 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %77 = "neura.shl"(%75, %76) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %78 = "neura.data_mov"(%77) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %79 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %80 = "neura.div"(%78, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %82 = neura.sext %81 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %83 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.data_mov"(%82) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %85 = "neura.gep"(%83, %84) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %86 = "neura.data_mov"(%85) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = "neura.load"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %88 = "neura.data_mov"(%87) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %89 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %90 = "neura.add"(%88, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %91 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %92 = "neura.data_mov"(%85) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%91, %92) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %93 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %94 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %95 = "neura.or"(%93, %94) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %97 = "neura.data_mov"(%95) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.gep"(%96, %97) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %99 = "neura.data_mov"(%98) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %100 = "neura.load"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %101 = "neura.data_mov"(%100) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %102 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %103 = "neura.shl"(%101, %102) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %104 = "neura.data_mov"(%103) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %105 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %106 = "neura.div"(%104, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %107 = "neura.data_mov"(%106) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %108 = neura.sext %107 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %109 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %110 = "neura.data_mov"(%108) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %111 = "neura.gep"(%109, %110) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %112 = "neura.data_mov"(%111) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %113 = "neura.load"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %114 = "neura.data_mov"(%113) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %115 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %116 = "neura.add"(%114, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %117 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %118 = "neura.data_mov"(%111) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%117, %118) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %119 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %120 = "neura.data_mov"(%19) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %121 = "neura.or"(%119, %120) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %122 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %123 = "neura.data_mov"(%121) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %124 = "neura.gep"(%122, %123) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %125 = "neura.data_mov"(%124) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %126 = "neura.load"(%125) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %127 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %128 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %129 = "neura.shl"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %130 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %131 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %132 = "neura.div"(%130, %131) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %133 = "neura.data_mov"(%132) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %134 = neura.sext %133 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %135 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %136 = "neura.data_mov"(%134) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %137 = "neura.gep"(%135, %136) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %138 = "neura.data_mov"(%137) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %139 = "neura.load"(%138) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %140 = "neura.data_mov"(%139) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %141 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %142 = "neura.add"(%140, %141) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %143 = "neura.data_mov"(%142) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %144 = "neura.data_mov"(%137) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%143, %144) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %145 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %146 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %147 = "neura.add"(%145, %146) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %148 = "neura.data_mov"(%43) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %149 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %150 = "neura.icmp"(%148, %149) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %151 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %152 = "neura.not"(%151) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %153 = "neura.data_mov"(%147) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %154 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %155 = neura.grant_predicate %153, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %155 -> %41 : !neura.data<i64, i1> !neura.data<i64, i1>
    %156 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %157 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %158 = neura.grant_predicate %156, %157 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %158 -> %38 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %159 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %160 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %161 = neura.grant_predicate %159, %160 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %161 -> %35 : !neura.data<i32, i1> !neura.data<i32, i1>
    %162 = "neura.data_mov"(%34) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %163 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %164 = neura.grant_predicate %162, %163 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %164 -> %32 : !neura.data<i32, i1> !neura.data<i32, i1>
    %165 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %166 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %167 = neura.grant_predicate %165, %166 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %167 -> %29 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %168 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %169 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %170 = neura.grant_predicate %168, %169 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %170 -> %26 : !neura.data<i32, i1> !neura.data<i32, i1>
    %171 = "neura.data_mov"(%25) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %172 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %173 = neura.grant_predicate %171, %172 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %173 -> %23 : !neura.data<i64, i1> !neura.data<i64, i1>
    %174 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %175 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %176 = neura.grant_predicate %174, %175 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %176 -> %20 : !neura.data<i64, i1> !neura.data<i64, i1>
    %177 = "neura.data_mov"(%19) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %178 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %179 = neura.grant_predicate %177, %178 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %179 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    %180 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %181 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %182 = neura.grant_predicate %180, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %182 -> %14 : !neura.data<i64, i1> !neura.data<i64, i1>
    %183 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %184 = "neura.data_mov"(%150) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %185 = neura.grant_predicate %183, %184 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %185 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %186 = "neura.data_mov"(%152) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %187 = "neura.data_mov"(%152) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %188 = neura.grant_predicate %186, %187 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %189 = "neura.data_mov"(%188) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %189 : !neura.data<i1, i1>
    neura.yield
  }
}

