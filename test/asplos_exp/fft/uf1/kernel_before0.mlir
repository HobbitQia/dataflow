#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE9data_real(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE9data_imag(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE9data_real : !llvm.ptr
    %2 = llvm.mlir.addressof @_ZZ4mainE9data_imag : !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(256 : i64) : i64
    %6 = llvm.mlir.constant(128 : i64) : i64
    %7 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%8: i64):  // 2 preds: ^bb0, ^bb1
    %9 = llvm.getelementptr inbounds %1[0, %8] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %10 = llvm.trunc %8 : i64 to i32
    llvm.store %10, %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %11 = llvm.getelementptr inbounds %2[0, %8] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    llvm.store %3, %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %12 = llvm.add %8, %4 overflow<nsw, nuw> : i64
    %13 = llvm.icmp "eq" %12, %5 : i64
    llvm.cond_br %13, ^bb2(%0 : i64), ^bb1(%12 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%14: i64):  // 2 preds: ^bb1, ^bb2
    %15 = llvm.add %14, %6 overflow<nsw, nuw> : i64
    %16 = llvm.getelementptr inbounds %1[0, %15] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %17 = llvm.load %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.shl %17, %3 overflow<nsw> : i32
    %19 = llvm.getelementptr inbounds %2[0, %15] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %20 = llvm.load %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.shl %20, %3 overflow<nsw> : i32
    %22 = llvm.sub %18, %21 overflow<nsw> : i32
    %23 = llvm.add %21, %18 overflow<nsw> : i32
    %24 = llvm.getelementptr inbounds %1[0, %14] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.sub %25, %22 overflow<nsw> : i32
    llvm.store %26, %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %27 = llvm.add %22, %25 overflow<nsw> : i32
    llvm.store %27, %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %28 = llvm.getelementptr inbounds %2[0, %14] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %29 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.sub %29, %23 overflow<nsw> : i32
    llvm.store %30, %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %31 = llvm.add %29, %23 overflow<nsw> : i32
    llvm.store %31, %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %32 = llvm.add %14, %4 overflow<nsw, nuw> : i64
    %33 = llvm.icmp "eq" %32, %6 : i64
    llvm.cond_br %33, ^bb3, ^bb2(%32 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.return %7 : i32
  }
  func.func @_Z6kernelPiS_iil(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: i32 {llvm.noundef}, %arg3: i32 {llvm.noundef}, %arg4: i64 {llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<i32, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<i32, i1>
    %4 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 128 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9 = neura.phi_start %7, %8 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i32, i1>
    %11 = neura.phi_start %3, %10 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.phi_start %1, %12 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve : !neura.data<i32, i1>
    %15 = neura.phi_start %2, %14 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = neura.phi_start %0, %16 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.phi_start %6, %18 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = neura.phi_start %4, %20 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.phi_start %5, %22 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %24 = "neura.add"(%23, %21) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.add"(%24, %19) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.gep"(%17, %25) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %27 = "neura.load"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %28 = "neura.mul"(%27, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %29 = "neura.gep"(%13, %25) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %30 = "neura.load"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %31 = "neura.mul"(%30, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %32 = "neura.sub"(%28, %31) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %33 = "neura.mul"(%27, %11) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %34 = "neura.mul"(%30, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %35 = "neura.add"(%34, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %36 = "neura.gep"(%17, %24) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = "neura.load"(%36) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %38 = "neura.sub"(%37, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%38, %26) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %39 = "neura.add"(%37, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%39, %36) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %40 = "neura.gep"(%13, %24) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %41 = "neura.load"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %42 = "neura.sub"(%41, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%42, %29) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %43 = "neura.add"(%41, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%43, %40) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %44 = "neura.add"(%23, %9) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.icmp"(%44, %19) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %46 = "neura.not"(%45) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %47 = neura.grant_predicate %44, %46 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %47 -> %22 : !neura.data<i64, i1> !neura.data<i64, i1>
    %48 = neura.grant_predicate %21, %46 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %48 -> %20 : !neura.data<i64, i1> !neura.data<i64, i1>
    %49 = neura.grant_predicate %19, %46 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %49 -> %18 : !neura.data<i64, i1> !neura.data<i64, i1>
    %50 = neura.grant_predicate %17, %46 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %50 -> %16 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %51 = neura.grant_predicate %15, %46 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %51 -> %14 : !neura.data<i32, i1> !neura.data<i32, i1>
    %52 = neura.grant_predicate %13, %46 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %52 -> %12 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %53 = neura.grant_predicate %11, %46 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %53 -> %10 : !neura.data<i32, i1> !neura.data<i32, i1>
    %54 = neura.grant_predicate %9, %46 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %54 -> %8 : !neura.data<i64, i1> !neura.data<i64, i1>
    %55 = neura.grant_predicate %45, %45 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %55 : !neura.data<i1, i1>
    neura.yield
  }
}

