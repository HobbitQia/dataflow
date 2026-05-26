#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    llvm.br ^bb1(%0 : i64)
  ^bb1(%12: i64):  // 2 preds: ^bb0, ^bb3
    %13 = llvm.getelementptr inbounds %1[0, %12] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %14 = llvm.trunc %12 : i64 to i32
    llvm.store %14, %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb2(%0 : i64)
  ^bb2(%15: i64):  // 2 preds: ^bb1, ^bb2
    %16 = llvm.add %15, %2 overflow<nsw, nuw> : i64
    %17 = llvm.mul %16, %12 overflow<nsw, nuw> : i64
    %18 = llvm.trunc %17 : i64 to i32
    %19 = llvm.and %18, %3 : i32
    %20 = llvm.getelementptr inbounds %4[0, %12, %15] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    llvm.store %19, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.icmp "eq" %16, %5 : i64
    llvm.cond_br %21, ^bb3, ^bb2(%16 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %22 = llvm.add %12, %2 overflow<nsw, nuw> : i64
    %23 = llvm.icmp "eq" %22, %5 : i64
    llvm.cond_br %23, ^bb4(%0 : i64), ^bb1(%22 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%24: i64):  // 2 preds: ^bb3, ^bb4
    %25 = llvm.getelementptr inbounds %6[0, %24] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %26 = llvm.trunc %24 : i64 to i32
    llvm.store %26, %25 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %27 = llvm.add %24, %2 overflow<nsw, nuw> : i64
    %28 = llvm.icmp "eq" %27, %5 : i64
    llvm.cond_br %28, ^bb5, ^bb4(%27 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    "llvm.intr.memset"(%7, %8, %9) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb6(%0 : i64)
  ^bb6(%29: i64):  // 2 preds: ^bb5, ^bb8
    %30 = llvm.getelementptr inbounds %10[0, %29] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %31 = llvm.getelementptr inbounds %1[0, %29] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb7(%11, %0 : i32, i64)
  ^bb7(%33: i32, %34: i64):  // 2 preds: ^bb6, ^bb7
    %35 = llvm.getelementptr inbounds %7[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %36 = llvm.load %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.getelementptr inbounds %4[0, %29, %34] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    %38 = llvm.load %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.mul %38, %32 overflow<nsw> : i32
    %40 = llvm.add %39, %36 overflow<nsw> : i32
    llvm.store %40, %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %41 = llvm.getelementptr inbounds %6[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %42 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.mul %42, %38 overflow<nsw> : i32
    %44 = llvm.add %43, %33 overflow<nsw> : i32
    %45 = llvm.add %34, %2 overflow<nsw, nuw> : i64
    %46 = llvm.icmp "eq" %45, %5 : i64
    llvm.cond_br %46, ^bb8, ^bb7(%44, %45 : i32, i64) {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    llvm.store %44, %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.add %29, %2 overflow<nsw, nuw> : i64
    %48 = llvm.icmp "eq" %47, %5 : i64
    llvm.cond_br %48, ^bb9, ^bb6(%47 : i64) {loop_annotation = #loop_annotation}
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
    %11 = "neura.grant_once"() <{constant_value = 256 : i64}> : () -> !neura.data<i64, i1>
    "neura.memset"(%2, %6, %7) <{is_volatile = false}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i64, i1>) -> ()
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.phi_start %11, %12 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.phi_start %10, %14 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = neura.phi_start %4, %16 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = neura.phi_start %0, %18 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %20 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %21 = neura.phi_start %1, %20 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.phi_start %8, %22 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %25 = neura.phi_start %5, %24 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %26 = neura.reserve : !neura.data<i32, i1>
    %27 = neura.phi_start %9, %26 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %28 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %29 = neura.phi_start %3, %28 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.phi_start %8, %30 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %32 = "neura.gep"(%29, %31) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%27, %32) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %33 = "neura.gep"(%25, %31) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = neura.phi_start %23, %34 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %37 = neura.phi_start %25, %36 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %38 = neura.reserve : !neura.data<i32, i1>
    %39 = neura.phi_start %27, %38 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %40 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %41 = neura.phi_start %29, %40 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.phi_start %13, %42 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = neura.reserve : !neura.data<i64, i1>
    %45 = neura.phi_start %15, %44 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %47 = neura.phi_start %17, %46 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %48 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %49 = neura.phi_start %32, %48 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = neura.phi_start %31, %50 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %52 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %53 = neura.phi_start %19, %52 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %54 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %55 = neura.phi_start %33, %54 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %56 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %57 = neura.phi_start %21, %56 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %58 = neura.reserve : !neura.data<i64, i1>
    %59 = neura.phi_start %23, %58 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %60 = "neura.gep"(%57, %59) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %61 = "neura.load"(%60) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %62 = "neura.load"(%55) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %63 = "neura.gep"(%53, %51, %59) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %64 = "neura.load"(%63) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %65 = "neura.mul"(%64, %62) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %66 = "neura.add"(%65, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%66, %60) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %67 = "neura.load"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %68 = "neura.load"(%63) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %69 = "neura.gep"(%47, %59) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.load"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %71 = "neura.mul"(%70, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %72 = "neura.add"(%71, %67) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%72, %49) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %73 = "neura.add"(%59, %45) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %74 = "neura.icmp"(%73, %43) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %75 = "neura.not"(%74) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %76 = neura.grant_predicate %73, %75 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %76 -> %58 : !neura.data<i64, i1> !neura.data<i64, i1>
    %77 = neura.grant_predicate %57, %75 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %77 -> %56 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %78 = neura.grant_predicate %55, %75 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %78 -> %54 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %79 = neura.grant_predicate %53, %75 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %79 -> %52 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %80 = neura.grant_predicate %51, %75 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %80 -> %50 : !neura.data<i64, i1> !neura.data<i64, i1>
    %81 = neura.grant_predicate %49, %75 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %81 -> %48 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %82 = neura.grant_predicate %47, %75 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %82 -> %46 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %83 = neura.grant_predicate %45, %75 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %83 -> %44 : !neura.data<i64, i1> !neura.data<i64, i1>
    %84 = neura.grant_predicate %43, %75 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %84 -> %42 : !neura.data<i64, i1> !neura.data<i64, i1>
    %85 = neura.grant_predicate %41, %75 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %85 -> %40 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %86 = neura.grant_predicate %39, %75 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %86 -> %38 : !neura.data<i32, i1> !neura.data<i32, i1>
    %87 = neura.grant_predicate %37, %75 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %87 -> %36 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %88 = neura.grant_predicate %35, %75 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %88 -> %34 : !neura.data<i64, i1> !neura.data<i64, i1>
    %89 = neura.grant_predicate %51, %74 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %90 = neura.grant_predicate %45, %74 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %91 = neura.grant_predicate %43, %74 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %92 = neura.grant_predicate %41, %74 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %93 = neura.grant_predicate %39, %74 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %94 = neura.grant_predicate %37, %74 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %95 = neura.grant_predicate %35, %74 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %96 = neura.grant_predicate %57, %74 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %97 = neura.grant_predicate %53, %74 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %98 = neura.grant_predicate %47, %74 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %99 = "neura.add"(%89, %90) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100 = "neura.icmp"(%99, %91) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %101 = "neura.not"(%100) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %102 = neura.grant_predicate %99, %101 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %102 -> %30 : !neura.data<i64, i1> !neura.data<i64, i1>
    %103 = neura.grant_predicate %92, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %103 -> %28 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %104 = neura.grant_predicate %93, %101 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %104 -> %26 : !neura.data<i32, i1> !neura.data<i32, i1>
    %105 = neura.grant_predicate %94, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %105 -> %24 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %106 = neura.grant_predicate %95, %101 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %106 -> %22 : !neura.data<i64, i1> !neura.data<i64, i1>
    %107 = neura.grant_predicate %96, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %107 -> %20 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %108 = neura.grant_predicate %97, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %108 -> %18 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %109 = neura.grant_predicate %98, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %109 -> %16 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %110 = neura.grant_predicate %90, %101 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %110 -> %14 : !neura.data<i64, i1> !neura.data<i64, i1>
    %111 = neura.grant_predicate %91, %101 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %111 -> %12 : !neura.data<i64, i1> !neura.data<i64, i1>
    %112 = neura.grant_predicate %100, %100 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %112 : !neura.data<i1, i1>
    neura.yield
  }
}

