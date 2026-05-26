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
  func.func @_Z6kernelPA256_iPiS1_S1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
    %5 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
    %6 = "neura.constant"() <{value = 0 : i8}> : () -> !neura.data<i8, i1>
    %7 = "neura.constant"() <{value = 1024 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
    %10 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %11 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %12 = "neura.grant_once"() <{constant_value = 254 : i64}> : () -> !neura.data<i64, i1>
    %13 = "neura.grant_once"() <{constant_value = 256 : i64}> : () -> !neura.data<i64, i1>
    %14 = "neura.data_mov"(%2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %15 = "neura.data_mov"(%6) : (!neura.data<i8, i1>) -> !neura.data<i8, i1>
    %16 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    "neura.memset"(%14, %15, %16) <{is_volatile = false}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i64, i1>) -> ()
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = neura.phi_start %18, %17 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = "neura.data_mov"(%12) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = neura.phi_start %21, %20 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = neura.phi_start %24, %23 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = "neura.data_mov"(%10) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = neura.phi_start %27, %26 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %30 = "neura.data_mov"(%4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %31 = neura.phi_start %30, %29 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %32 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %33 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = neura.phi_start %33, %32 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %35 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %36 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = neura.phi_start %36, %35 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %40 = neura.phi_start %39, %38 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %42 = "neura.data_mov"(%5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = neura.phi_start %42, %41 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %44 = neura.reserve : !neura.data<i32, i1>
    %45 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %46 = neura.phi_start %45, %44 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %47 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %48 = "neura.data_mov"(%3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %49 = neura.phi_start %48, %47 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = neura.phi_start %51, %50 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %53 = "neura.data_mov"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %54 = "neura.data_mov"(%52) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = "neura.gep"(%53, %54) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %57 = "neura.data_mov"(%55) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%56, %57) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %58 = "neura.data_mov"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %59 = "neura.data_mov"(%52) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.gep"(%58, %59) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %61 = neura.reserve : !neura.data<i64, i1>
    %62 = "neura.data_mov"(%40) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %63 = neura.phi_start %62, %61 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %64 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %65 = "neura.data_mov"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %66 = neura.phi_start %65, %64 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %67 = neura.reserve : !neura.data<i32, i1>
    %68 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %69 = neura.phi_start %68, %67 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %70 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %71 = "neura.data_mov"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = neura.phi_start %71, %70 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %73 = neura.reserve : !neura.data<i64, i1>
    %74 = "neura.data_mov"(%19) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %75 = neura.phi_start %74, %73 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %76 = neura.reserve : !neura.data<i64, i1>
    %77 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = neura.phi_start %77, %76 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %79 = neura.reserve : !neura.data<i64, i1>
    %80 = "neura.data_mov"(%25) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81 = neura.phi_start %80, %79 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %82 = neura.reserve : !neura.data<i64, i1>
    %83 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %84 = neura.phi_start %83, %82 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %85 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %86 = "neura.data_mov"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = neura.phi_start %86, %85 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %88 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %89 = "neura.data_mov"(%55) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %90 = neura.phi_start %89, %88 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %91 = neura.reserve : !neura.data<i64, i1>
    %92 = "neura.data_mov"(%52) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %93 = neura.phi_start %92, %91 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %94 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %95 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %96 = neura.phi_start %95, %94 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %97 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %98 = "neura.data_mov"(%60) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %99 = neura.phi_start %98, %97 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %100 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %101 = "neura.data_mov"(%37) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %102 = neura.phi_start %101, %100 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %103 = neura.reserve : !neura.data<i64, i1>
    %104 = "neura.data_mov"(%40) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %105 = neura.phi_start %104, %103 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %106 = "neura.data_mov"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %107 = "neura.data_mov"(%105) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %108 = "neura.gep"(%106, %107) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %109 = "neura.data_mov"(%108) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %110 = "neura.load"(%109) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %111 = "neura.data_mov"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %112 = "neura.load"(%111) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %113 = "neura.data_mov"(%96) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %114 = "neura.data_mov"(%93) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %115 = "neura.data_mov"(%105) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %116 = "neura.gep"(%113, %114, %115) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %117 = "neura.data_mov"(%116) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %118 = "neura.load"(%117) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %120 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %121 = "neura.mul"(%119, %120) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %122 = "neura.data_mov"(%121) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %123 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %124 = "neura.add"(%122, %123) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %126 = "neura.data_mov"(%108) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%125, %126) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %127 = "neura.data_mov"(%90) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %128 = "neura.load"(%127) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %129 = "neura.data_mov"(%116) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %130 = "neura.load"(%129) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %131 = "neura.data_mov"(%87) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %132 = "neura.data_mov"(%105) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %133 = "neura.gep"(%131, %132) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %134 = "neura.data_mov"(%133) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %135 = "neura.load"(%134) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %137 = "neura.data_mov"(%130) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %138 = "neura.mul"(%136, %137) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %139 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %140 = "neura.data_mov"(%128) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %141 = "neura.add"(%139, %140) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %142 = "neura.data_mov"(%141) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %143 = "neura.data_mov"(%90) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%142, %143) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %144 = "neura.data_mov"(%105) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %145 = "neura.data_mov"(%84) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %146 = "neura.or"(%144, %145) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %147 = "neura.data_mov"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %148 = "neura.data_mov"(%146) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %149 = "neura.gep"(%147, %148) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %150 = "neura.data_mov"(%149) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %151 = "neura.load"(%150) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %152 = "neura.data_mov"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %153 = "neura.load"(%152) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %154 = "neura.data_mov"(%96) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %155 = "neura.data_mov"(%93) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %156 = "neura.data_mov"(%146) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %157 = "neura.gep"(%154, %155, %156) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %158 = "neura.data_mov"(%157) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %159 = "neura.load"(%158) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %160 = "neura.data_mov"(%159) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %161 = "neura.data_mov"(%153) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %162 = "neura.mul"(%160, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %163 = "neura.data_mov"(%162) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %164 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %165 = "neura.add"(%163, %164) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %166 = "neura.data_mov"(%165) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %167 = "neura.data_mov"(%149) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%166, %167) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %168 = "neura.data_mov"(%90) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %169 = "neura.load"(%168) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %170 = "neura.data_mov"(%157) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %171 = "neura.load"(%170) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %172 = "neura.data_mov"(%87) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %173 = "neura.data_mov"(%146) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %174 = "neura.gep"(%172, %173) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %175 = "neura.data_mov"(%174) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %176 = "neura.load"(%175) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %177 = "neura.data_mov"(%176) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %178 = "neura.data_mov"(%171) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %179 = "neura.mul"(%177, %178) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %180 = "neura.data_mov"(%179) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %181 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %182 = "neura.add"(%180, %181) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %183 = "neura.data_mov"(%182) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %184 = "neura.data_mov"(%90) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%183, %184) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %185 = "neura.data_mov"(%105) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %186 = "neura.data_mov"(%81) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %187 = "neura.add"(%185, %186) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %188 = "neura.data_mov"(%105) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %189 = "neura.data_mov"(%78) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %190 = "neura.icmp"(%188, %189) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %191 = "neura.data_mov"(%187) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %192 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %193 = neura.grant_predicate %191, %192 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %193 -> %103 : !neura.data<i64, i1> !neura.data<i64, i1>
    %194 = "neura.data_mov"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %195 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %196 = neura.grant_predicate %194, %195 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %196 -> %100 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %197 = "neura.data_mov"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %198 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %199 = neura.grant_predicate %197, %198 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %199 -> %97 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %200 = "neura.data_mov"(%96) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %201 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %202 = neura.grant_predicate %200, %201 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %202 -> %94 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %203 = "neura.data_mov"(%93) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %204 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %205 = neura.grant_predicate %203, %204 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %205 -> %91 : !neura.data<i64, i1> !neura.data<i64, i1>
    %206 = "neura.data_mov"(%90) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %207 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %208 = neura.grant_predicate %206, %207 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %208 -> %88 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %209 = "neura.data_mov"(%87) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %210 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %211 = neura.grant_predicate %209, %210 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %211 -> %85 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %212 = "neura.data_mov"(%84) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %213 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %214 = neura.grant_predicate %212, %213 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %214 -> %82 : !neura.data<i64, i1> !neura.data<i64, i1>
    %215 = "neura.data_mov"(%81) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %216 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %217 = neura.grant_predicate %215, %216 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %217 -> %79 : !neura.data<i64, i1> !neura.data<i64, i1>
    %218 = "neura.data_mov"(%78) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %219 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %220 = neura.grant_predicate %218, %219 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %220 -> %76 : !neura.data<i64, i1> !neura.data<i64, i1>
    %221 = "neura.data_mov"(%75) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %222 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %223 = neura.grant_predicate %221, %222 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %223 -> %73 : !neura.data<i64, i1> !neura.data<i64, i1>
    %224 = "neura.data_mov"(%72) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %225 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %226 = neura.grant_predicate %224, %225 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %226 -> %70 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %227 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %228 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %229 = neura.grant_predicate %227, %228 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %229 -> %67 : !neura.data<i32, i1> !neura.data<i32, i1>
    %230 = "neura.data_mov"(%66) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %231 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %232 = neura.grant_predicate %230, %231 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %232 -> %64 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %233 = "neura.data_mov"(%63) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %234 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %235 = neura.grant_predicate %233, %234 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %235 -> %61 : !neura.data<i64, i1> !neura.data<i64, i1>
    %236 = "neura.data_mov"(%190) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %237 = "neura.not"(%236) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %238 = "neura.data_mov"(%93) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %239 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %240 = neura.grant_predicate %238, %239 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %241 = "neura.data_mov"(%84) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %242 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %243 = neura.grant_predicate %241, %242 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %244 = "neura.data_mov"(%75) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %245 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %246 = neura.grant_predicate %244, %245 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %247 = "neura.data_mov"(%72) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %248 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %249 = neura.grant_predicate %247, %248 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %250 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %251 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %252 = neura.grant_predicate %250, %251 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %253 = "neura.data_mov"(%66) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %254 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %255 = neura.grant_predicate %253, %254 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %256 = "neura.data_mov"(%63) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %257 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %258 = neura.grant_predicate %256, %257 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %259 = "neura.data_mov"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %260 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %261 = neura.grant_predicate %259, %260 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %262 = "neura.data_mov"(%96) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %263 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %264 = neura.grant_predicate %262, %263 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %265 = "neura.data_mov"(%87) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %266 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %267 = neura.grant_predicate %265, %266 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %268 = "neura.data_mov"(%81) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %269 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %270 = neura.grant_predicate %268, %269 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %271 = "neura.data_mov"(%78) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %272 = "neura.data_mov"(%237) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %273 = neura.grant_predicate %271, %272 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %274 = "neura.data_mov"(%240) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %275 = "neura.data_mov"(%243) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %276 = "neura.add"(%274, %275) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %277 = "neura.data_mov"(%276) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %278 = "neura.data_mov"(%246) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %279 = "neura.icmp"(%277, %278) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %280 = "neura.data_mov"(%279) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %281 = "neura.not"(%280) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %282 = "neura.data_mov"(%276) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %283 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %284 = neura.grant_predicate %282, %283 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %284 -> %50 : !neura.data<i64, i1> !neura.data<i64, i1>
    %285 = "neura.data_mov"(%249) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %286 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %287 = neura.grant_predicate %285, %286 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %287 -> %47 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %288 = "neura.data_mov"(%252) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %289 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %290 = neura.grant_predicate %288, %289 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %290 -> %44 : !neura.data<i32, i1> !neura.data<i32, i1>
    %291 = "neura.data_mov"(%255) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %292 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %293 = neura.grant_predicate %291, %292 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %293 -> %41 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %294 = "neura.data_mov"(%258) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %295 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %296 = neura.grant_predicate %294, %295 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %296 -> %38 : !neura.data<i64, i1> !neura.data<i64, i1>
    %297 = "neura.data_mov"(%261) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %298 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %299 = neura.grant_predicate %297, %298 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %299 -> %35 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %300 = "neura.data_mov"(%264) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %301 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %302 = neura.grant_predicate %300, %301 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %302 -> %32 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %303 = "neura.data_mov"(%267) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %304 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %305 = neura.grant_predicate %303, %304 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %305 -> %29 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %306 = "neura.data_mov"(%243) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %307 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %308 = neura.grant_predicate %306, %307 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %308 -> %26 : !neura.data<i64, i1> !neura.data<i64, i1>
    %309 = "neura.data_mov"(%270) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %310 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %311 = neura.grant_predicate %309, %310 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %311 -> %23 : !neura.data<i64, i1> !neura.data<i64, i1>
    %312 = "neura.data_mov"(%273) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %313 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %314 = neura.grant_predicate %312, %313 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %314 -> %20 : !neura.data<i64, i1> !neura.data<i64, i1>
    %315 = "neura.data_mov"(%246) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %316 = "neura.data_mov"(%281) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %317 = neura.grant_predicate %315, %316 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %317 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    %318 = "neura.data_mov"(%279) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %319 = "neura.data_mov"(%279) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %320 = neura.grant_predicate %318, %319 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %321 = "neura.data_mov"(%320) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %321 : !neura.data<i1, i1>
    neura.yield
  }
}

