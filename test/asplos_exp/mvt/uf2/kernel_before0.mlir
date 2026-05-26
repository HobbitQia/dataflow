#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2x1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2x2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2y1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2y2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.addressof @_ZZ4mainE2x1 : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i8) : i8
    %2 = llvm.mlir.constant(256 : i64) : i64
    %3 = llvm.mlir.addressof @_ZZ4mainE2x2 : !llvm.ptr
    %4 = llvm.mlir.constant(0 : i64) : i64
    %5 = llvm.mlir.addressof @_ZZ4mainE2y1 : !llvm.ptr
    %6 = llvm.mlir.constant(3 : i32) : i32
    %7 = llvm.mlir.addressof @_ZZ4mainE2y2 : !llvm.ptr
    %8 = llvm.mlir.constant(4 : i32) : i32
    %9 = llvm.mlir.constant(1 : i64) : i64
    %10 = llvm.mlir.constant(64 : i64) : i64
    %11 = llvm.mlir.constant(6 : i32) : i32
    %12 = llvm.mlir.constant(63 : i32) : i32
    %13 = llvm.mlir.addressof @_ZZ4mainE1A : !llvm.ptr
    %14 = llvm.mlir.constant(4096 : i64) : i64
    %15 = llvm.mlir.constant(6 : i64) : i64
    %16 = llvm.mlir.constant(2 : i64) : i64
    %17 = llvm.mlir.constant(62 : i64) : i64
    %18 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    "llvm.intr.memset"(%3, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%4 : i64)
  ^bb1(%19: i64):  // 2 preds: ^bb0, ^bb1
    %20 = llvm.getelementptr inbounds %5[0, %19] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %21 = llvm.trunc %19 : i64 to i32
    %22 = llvm.add %21, %6 : i32
    llvm.store %22, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.getelementptr inbounds %7[0, %19] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %24 = llvm.trunc %19 : i64 to i32
    %25 = llvm.add %24, %8 : i32
    llvm.store %25, %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %26 = llvm.add %19, %9 overflow<nsw, nuw> : i64
    %27 = llvm.icmp "eq" %26, %10 : i64
    llvm.cond_br %27, ^bb2(%4 : i64), ^bb1(%26 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%28: i64):  // 2 preds: ^bb1, ^bb2
    %29 = llvm.trunc %28 : i64 to i32
    %30 = llvm.lshr %29, %11 : i32
    %31 = llvm.and %29, %12 : i32
    %32 = llvm.mul %30, %31 overflow<nsw, nuw> : i32
    %33 = llvm.and %32, %12 : i32
    %34 = llvm.getelementptr inbounds %13[0, %28] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    llvm.store %33, %34 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %35 = llvm.add %28, %9 overflow<nsw, nuw> : i64
    %36 = llvm.icmp "eq" %35, %14 : i64
    llvm.cond_br %36, ^bb3(%4 : i64), ^bb2(%35 : i64) {loop_annotation = #loop_annotation}
  ^bb3(%37: i64):  // 2 preds: ^bb2, ^bb5
    %38 = llvm.getelementptr inbounds %5[0, %37] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %39 = llvm.shl %37, %15 overflow<nsw> : i64
    %40 = llvm.getelementptr inbounds %7[0, %37] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %41 = llvm.load %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.load %40 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb4(%4 : i64)
  ^bb4(%43: i64):  // 2 preds: ^bb3, ^bb4
    %44 = llvm.getelementptr inbounds %0[0, %43] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %45 = llvm.load %44 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.shl %43, %15 overflow<nsw, nuw> : i64
    %47 = llvm.add %46, %37 overflow<nsw, nuw> : i64
    %48 = llvm.getelementptr inbounds %13[0, %47] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %49 = llvm.load %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.mul %41, %49 overflow<nsw> : i32
    %51 = llvm.add %50, %45 overflow<nsw> : i32
    llvm.store %51, %44 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %52 = llvm.getelementptr inbounds %3[0, %43] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %53 = llvm.load %52 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %54 = llvm.add %43, %39 overflow<nsw, nuw> : i64
    %55 = llvm.getelementptr inbounds %13[0, %54] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %56 = llvm.load %55 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.mul %42, %56 overflow<nsw> : i32
    %58 = llvm.add %57, %53 overflow<nsw> : i32
    llvm.store %58, %52 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %59 = llvm.or %43, %9 : i64
    %60 = llvm.getelementptr inbounds %0[0, %59] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %61 = llvm.load %60 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %62 = llvm.shl %59, %15 overflow<nsw> : i64
    %63 = llvm.add %62, %37 overflow<nsw, nuw> : i64
    %64 = llvm.getelementptr inbounds %13[0, %63] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %65 = llvm.load %64 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %66 = llvm.mul %65, %41 overflow<nsw> : i32
    %67 = llvm.add %66, %61 overflow<nsw> : i32
    llvm.store %67, %60 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %68 = llvm.getelementptr inbounds %3[0, %59] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %69 = llvm.load %68 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %70 = llvm.add %59, %39 overflow<nsw, nuw> : i64
    %71 = llvm.getelementptr inbounds %13[0, %70] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %72 = llvm.load %71 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %73 = llvm.mul %72, %42 overflow<nsw> : i32
    %74 = llvm.add %73, %69 overflow<nsw> : i32
    llvm.store %74, %68 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %75 = llvm.add %43, %16 overflow<nsw, nuw> : i64
    %76 = llvm.icmp "ult" %43, %17 : i64
    llvm.cond_br %76, ^bb4(%75 : i64), ^bb5 {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %77 = llvm.add %37, %9 overflow<nsw, nuw> : i64
    %78 = llvm.icmp "eq" %77, %10 : i64
    llvm.cond_br %78, ^bb6, ^bb3(%77 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    llvm.return %18 : i32
  }
  func.func @_Z6kernelPiS_PKiS1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
    %5 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 62 : i64}> : () -> !neura.data<i64, i1>
    %10 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.phi_start %10, %11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.phi_start %9, %13 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.phi_start %8, %15 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.phi_start %7, %17 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %20 = neura.phi_start %1, %19 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = neura.phi_start %2, %21 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %23 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %24 = neura.phi_start %0, %23 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.phi_start %5, %25 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %27 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %28 = neura.phi_start %4, %27 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = neura.phi_start %6, %29 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %32 = neura.phi_start %3, %31 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = neura.phi_start %5, %33 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %35 = "neura.gep"(%32, %34) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %36 = "neura.shl"(%34, %30) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = "neura.gep"(%28, %34) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = neura.phi_start %26, %38 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %41 = neura.phi_start %28, %40 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %42 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %43 = neura.phi_start %32, %42 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %44 = neura.reserve : !neura.data<i64, i1>
    %45 = neura.phi_start %12, %44 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<i64, i1>
    %47 = neura.phi_start %14, %46 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = neura.phi_start %16, %48 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = neura.phi_start %18, %50 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %52 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %53 = neura.phi_start %37, %52 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %54 = neura.reserve : !neura.data<i64, i1>
    %55 = neura.phi_start %36, %54 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %56 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %57 = neura.phi_start %20, %56 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %58 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %59 = neura.phi_start %35, %58 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %60 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %61 = neura.phi_start %22, %60 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %62 = neura.reserve : !neura.data<i64, i1>
    %63 = neura.phi_start %34, %62 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %64 = neura.reserve : !neura.data<i64, i1>
    %65 = neura.phi_start %30, %64 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %66 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %67 = neura.phi_start %24, %66 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %68 = neura.reserve : !neura.data<i64, i1>
    %69 = neura.phi_start %26, %68 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %70 = "neura.gep"(%67, %69) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.load"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %72 = "neura.shl"(%69, %65) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %73 = "neura.add"(%72, %63) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %74 = "neura.gep"(%61, %73) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %75 = "neura.load"(%74) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %76 = "neura.load"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %77 = "neura.mul"(%76, %75) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %78 = "neura.add"(%77, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%78, %70) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %79 = "neura.gep"(%57, %69) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %80 = "neura.load"(%79) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %81 = "neura.add"(%69, %55) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.gep"(%61, %81) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.load"(%82) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %84 = "neura.load"(%53) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %85 = "neura.mul"(%84, %83) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %86 = "neura.add"(%85, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%86, %79) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %87 = "neura.or"(%69, %51) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %88 = "neura.gep"(%67, %87) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %89 = "neura.load"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %90 = "neura.shl"(%87, %65) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %91 = "neura.add"(%90, %63) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %92 = "neura.gep"(%61, %91) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %93 = "neura.load"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %94 = "neura.load"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %95 = "neura.mul"(%94, %93) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %96 = "neura.add"(%95, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%96, %88) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %97 = "neura.gep"(%57, %87) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %98 = "neura.load"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %99 = "neura.add"(%87, %55) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100 = "neura.gep"(%61, %99) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %101 = "neura.load"(%100) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %102 = "neura.load"(%53) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %103 = "neura.mul"(%102, %101) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %104 = "neura.add"(%103, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%104, %97) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %105 = "neura.add"(%69, %49) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %106 = "neura.icmp"(%69, %47) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %107 = neura.grant_predicate %105, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %107 -> %68 : !neura.data<i64, i1> !neura.data<i64, i1>
    %108 = neura.grant_predicate %67, %106 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %108 -> %66 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %109 = neura.grant_predicate %65, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %109 -> %64 : !neura.data<i64, i1> !neura.data<i64, i1>
    %110 = neura.grant_predicate %63, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %110 -> %62 : !neura.data<i64, i1> !neura.data<i64, i1>
    %111 = neura.grant_predicate %61, %106 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %111 -> %60 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %112 = neura.grant_predicate %59, %106 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %112 -> %58 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %113 = neura.grant_predicate %57, %106 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %113 -> %56 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %114 = neura.grant_predicate %55, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %114 -> %54 : !neura.data<i64, i1> !neura.data<i64, i1>
    %115 = neura.grant_predicate %53, %106 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %115 -> %52 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %116 = neura.grant_predicate %51, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %116 -> %50 : !neura.data<i64, i1> !neura.data<i64, i1>
    %117 = neura.grant_predicate %49, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %117 -> %48 : !neura.data<i64, i1> !neura.data<i64, i1>
    %118 = neura.grant_predicate %47, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %118 -> %46 : !neura.data<i64, i1> !neura.data<i64, i1>
    %119 = neura.grant_predicate %45, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %119 -> %44 : !neura.data<i64, i1> !neura.data<i64, i1>
    %120 = neura.grant_predicate %43, %106 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %120 -> %42 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %121 = neura.grant_predicate %41, %106 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %121 -> %40 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %122 = neura.grant_predicate %39, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %122 -> %38 : !neura.data<i64, i1> !neura.data<i64, i1>
    %123 = "neura.not"(%106) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %124 = neura.grant_predicate %63, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %125 = neura.grant_predicate %51, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %126 = neura.grant_predicate %45, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %127 = neura.grant_predicate %43, %123 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %128 = neura.grant_predicate %65, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %129 = neura.grant_predicate %41, %123 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %130 = neura.grant_predicate %39, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %131 = neura.grant_predicate %67, %123 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %132 = neura.grant_predicate %61, %123 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %133 = neura.grant_predicate %57, %123 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %134 = neura.grant_predicate %49, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %135 = neura.grant_predicate %47, %123 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %136 = "neura.add"(%124, %125) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %137 = "neura.icmp"(%136, %126) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %138 = "neura.not"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %139 = neura.grant_predicate %136, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %139 -> %33 : !neura.data<i64, i1> !neura.data<i64, i1>
    %140 = neura.grant_predicate %127, %138 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %140 -> %31 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %141 = neura.grant_predicate %128, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %141 -> %29 : !neura.data<i64, i1> !neura.data<i64, i1>
    %142 = neura.grant_predicate %129, %138 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %142 -> %27 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %143 = neura.grant_predicate %130, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %143 -> %25 : !neura.data<i64, i1> !neura.data<i64, i1>
    %144 = neura.grant_predicate %131, %138 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %144 -> %23 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %145 = neura.grant_predicate %132, %138 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %145 -> %21 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %146 = neura.grant_predicate %133, %138 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %146 -> %19 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %147 = neura.grant_predicate %125, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %147 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    %148 = neura.grant_predicate %134, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %148 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %149 = neura.grant_predicate %135, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %149 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    %150 = neura.grant_predicate %126, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %150 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %151 = neura.grant_predicate %137, %137 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %151 : !neura.data<i1, i1>
    neura.yield
  }
}

