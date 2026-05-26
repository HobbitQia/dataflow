#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %11 = llvm.mlir.constant(1022 : i64) : i64
    %12 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb1
    %14 = llvm.getelementptr inbounds %1[0, %13] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %15 = llvm.trunc %13 : i64 to i32
    llvm.store %15, %14 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %16 = llvm.add %13, %2 overflow<nsw, nuw> : i64
    %17 = llvm.icmp "eq" %16, %3 : i64
    llvm.cond_br %17, ^bb2, ^bb1(%16 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    "llvm.intr.memset"(%4, %5, %6) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb3(%0 : i64)
  ^bb3(%18: i64):  // 2 preds: ^bb2, ^bb3
    %19 = llvm.getelementptr inbounds %1[0, %18] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %20 = llvm.load %19 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.shl %20, %7 overflow<nsw> : i32
    %22 = llvm.sdiv %21, %8 : i32
    %23 = llvm.sext %22 : i32 to i64
    %24 = llvm.getelementptr inbounds %4[0, %23] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.add %25, %9 overflow<nsw> : i32
    llvm.store %26, %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %27 = llvm.or %18, %2 : i64
    %28 = llvm.getelementptr inbounds %1[0, %27] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %29 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.shl %29, %7 overflow<nsw> : i32
    %31 = llvm.sdiv %30, %8 : i32
    %32 = llvm.sext %31 : i32 to i64
    %33 = llvm.getelementptr inbounds %4[0, %32] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %34 = llvm.load %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.add %34, %9 overflow<nsw> : i32
    llvm.store %35, %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %36 = llvm.add %18, %10 overflow<nsw, nuw> : i64
    %37 = llvm.icmp "ult" %18, %11 : i64
    llvm.cond_br %37, ^bb3(%36 : i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %12 : i32
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
    %8 = "neura.grant_once"() <{constant_value = 1022 : i64}> : () -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.phi_start %8, %9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.phi_start %7, %11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.phi_start %6, %13 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i32, i1>
    %16 = neura.phi_start %5, %15 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %17 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %18 = neura.phi_start %1, %17 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %19 = neura.reserve : !neura.data<i32, i1>
    %20 = neura.phi_start %4, %19 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %21 = neura.reserve : !neura.data<i32, i1>
    %22 = neura.phi_start %3, %21 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %23 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %24 = neura.phi_start %0, %23 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.phi_start %2, %25 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %27 = "neura.gep"(%24, %26) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = "neura.load"(%27) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %29 = "neura.shl"(%28, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %30 = "neura.div"(%29, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %31 = neura.sext %30 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %32 = "neura.gep"(%18, %31) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.load"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %34 = "neura.add"(%33, %16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%34, %32) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %35 = "neura.or"(%26, %14) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = "neura.gep"(%24, %35) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = "neura.load"(%36) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %38 = "neura.shl"(%37, %22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %39 = "neura.div"(%38, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %40 = neura.sext %39 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %41 = "neura.gep"(%18, %40) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %42 = "neura.load"(%41) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %43 = "neura.add"(%42, %16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%43, %41) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %44 = "neura.add"(%26, %12) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.icmp"(%26, %10) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %46 = "neura.not"(%45) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %47 = neura.grant_predicate %44, %45 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %47 -> %25 : !neura.data<i64, i1> !neura.data<i64, i1>
    %48 = neura.grant_predicate %24, %45 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %48 -> %23 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %49 = neura.grant_predicate %22, %45 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %49 -> %21 : !neura.data<i32, i1> !neura.data<i32, i1>
    %50 = neura.grant_predicate %20, %45 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %50 -> %19 : !neura.data<i32, i1> !neura.data<i32, i1>
    %51 = neura.grant_predicate %18, %45 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %51 -> %17 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %52 = neura.grant_predicate %16, %45 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %52 -> %15 : !neura.data<i32, i1> !neura.data<i32, i1>
    %53 = neura.grant_predicate %14, %45 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %53 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    %54 = neura.grant_predicate %12, %45 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %54 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %55 = neura.grant_predicate %10, %45 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %55 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    %56 = neura.grant_predicate %46, %46 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %56 : !neura.data<i1, i1>
    neura.yield
  }
}

