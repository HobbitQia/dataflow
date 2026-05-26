#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1A(dense<0> : tensor<262144xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<262144 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1x(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<512 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(11 : i16) : i16
    %2 = llvm.mlir.addressof @_ZZ4mainE1x : !llvm.ptr
    %3 = llvm.mlir.constant(9 : i64) : i64
    %4 = llvm.mlir.constant(13 : i32) : i32
    %5 = llvm.mlir.addressof @_ZZ4mainE1A : !llvm.ptr
    %6 = llvm.mlir.constant(1 : i64) : i64
    %7 = llvm.mlir.constant(512 : i64) : i64
    %8 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%9: i64):  // 2 preds: ^bb0, ^bb3
    %10 = llvm.trunc %9 : i64 to i16
    %11 = llvm.urem %10, %1 : i16
    %12 = llvm.zext %11 : i16 to i32
    %13 = llvm.getelementptr inbounds %2[0, %9] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    llvm.store %12, %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %14 = llvm.shl %9, %3 overflow<nsw> : i64
    llvm.br ^bb2(%0 : i64)
  ^bb2(%15: i64):  // 2 preds: ^bb1, ^bb2
    %16 = llvm.add %15, %9 overflow<nsw, nuw> : i64
    %17 = llvm.trunc %16 : i64 to i32
    %18 = llvm.urem %17, %4 : i32
    %19 = llvm.add %15, %14 overflow<nsw, nuw> : i64
    %20 = llvm.getelementptr inbounds %5[0, %19] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<262144 x i32>
    llvm.store %18, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.add %15, %6 overflow<nsw, nuw> : i64
    %22 = llvm.icmp "eq" %21, %7 : i64
    llvm.cond_br %22, ^bb3, ^bb2(%21 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %23 = llvm.add %9, %6 overflow<nsw, nuw> : i64
    %24 = llvm.icmp "eq" %23, %7 : i64
    llvm.cond_br %24, ^bb4, ^bb1(%23 : i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %8 : i32
  }
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.writeonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 9 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
    %6 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 508 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 512 : i64}> : () -> !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.phi_start %9, %10 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.phi_start %8, %12 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = neura.phi_start %2, %14 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.phi_start %7, %16 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.phi_start %6, %18 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %21 = neura.phi_start %1, %20 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %23 = neura.phi_start %0, %22 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<i32, i1>
    %25 = neura.phi_start %5, %24 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = neura.phi_start %3, %26 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<i64, i1>
    %29 = neura.phi_start %4, %28 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.phi_start %3, %30 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %32 = "neura.shl"(%31, %29) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<i32, i1>
    %34 = neura.phi_start %25, %33 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %35 = neura.reserve : !neura.data<i64, i1>
    %36 = neura.phi_start %27, %35 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = neura.phi_start %29, %37 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = neura.phi_start %11, %39 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %41 = neura.reserve : !neura.data<i64, i1>
    %42 = neura.phi_start %13, %41 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %43 = neura.reserve : !neura.data<i64, i1>
    %44 = neura.phi_start %31, %43 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %45 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %46 = neura.phi_start %15, %45 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = neura.phi_start %17, %47 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %49 = neura.reserve : !neura.data<i64, i1>
    %50 = neura.phi_start %19, %49 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %51 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %52 = neura.phi_start %21, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %53 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %54 = neura.phi_start %23, %53 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %55 = neura.reserve : !neura.data<i64, i1>
    %56 = neura.phi_start %32, %55 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %57 = neura.reserve : !neura.data<i32, i1>
    %58 = neura.phi_start %25, %57 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %59 = neura.reserve : !neura.data<i64, i1>
    %60 = neura.phi_start %27, %59 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %61 = "neura.add"(%60, %56) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62 = "neura.gep"(%54, %61) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %63 = "neura.gep"(%52, %60) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %64 = "neura.load"(%62) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
    %65 = "neura.load"(%63) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
    %66 = "neura.vmul"(%65, %64) : (!neura.data<vector<4xi32>, i1>, !neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %67 = "neura.vector.reduce.add"(%66) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<i32, i1>
    %68 = "neura.add"(%67, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %69 = "neura.add"(%60, %50) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.icmp"(%60, %48) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %71 = neura.grant_predicate %69, %70 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %71 -> %59 : !neura.data<i64, i1> !neura.data<i64, i1>
    %72 = neura.grant_predicate %68, %70 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %72 -> %57 : !neura.data<i32, i1> !neura.data<i32, i1>
    %73 = neura.grant_predicate %56, %70 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %73 -> %55 : !neura.data<i64, i1> !neura.data<i64, i1>
    %74 = neura.grant_predicate %54, %70 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %74 -> %53 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %75 = neura.grant_predicate %52, %70 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %75 -> %51 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %76 = neura.grant_predicate %50, %70 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %76 -> %49 : !neura.data<i64, i1> !neura.data<i64, i1>
    %77 = neura.grant_predicate %48, %70 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %77 -> %47 : !neura.data<i64, i1> !neura.data<i64, i1>
    %78 = neura.grant_predicate %46, %70 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %78 -> %45 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %79 = neura.grant_predicate %44, %70 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %79 -> %43 : !neura.data<i64, i1> !neura.data<i64, i1>
    %80 = neura.grant_predicate %42, %70 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %80 -> %41 : !neura.data<i64, i1> !neura.data<i64, i1>
    %81 = neura.grant_predicate %40, %70 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %81 -> %39 : !neura.data<i64, i1> !neura.data<i64, i1>
    %82 = neura.grant_predicate %38, %70 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %82 -> %37 : !neura.data<i64, i1> !neura.data<i64, i1>
    %83 = neura.grant_predicate %36, %70 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %83 -> %35 : !neura.data<i64, i1> !neura.data<i64, i1>
    %84 = neura.grant_predicate %34, %70 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %84 -> %33 : !neura.data<i32, i1> !neura.data<i32, i1>
    %85 = "neura.not"(%70) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %86 = neura.grant_predicate %46, %85 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %87 = neura.grant_predicate %44, %85 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %88 = neura.grant_predicate %68, %85 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %89 = neura.grant_predicate %42, %85 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %90 = neura.grant_predicate %40, %85 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %91 = neura.grant_predicate %38, %85 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %92 = neura.grant_predicate %36, %85 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %93 = neura.grant_predicate %34, %85 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %94 = neura.grant_predicate %54, %85 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %95 = neura.grant_predicate %52, %85 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %96 = neura.grant_predicate %50, %85 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %97 = neura.grant_predicate %48, %85 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %98 = "neura.gep"(%86, %87) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%88, %98) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %99 = "neura.add"(%87, %89) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100 = "neura.icmp"(%99, %90) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %101 = "neura.not"(%100) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %102 = neura.grant_predicate %99, %101 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %102 -> %30 : !neura.data<i64, i1> !neura.data<i64, i1>
    %103 = neura.grant_predicate %91, %101 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %103 -> %28 : !neura.data<i64, i1> !neura.data<i64, i1>
    %104 = neura.grant_predicate %92, %101 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %104 -> %26 : !neura.data<i64, i1> !neura.data<i64, i1>
    %105 = neura.grant_predicate %93, %101 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %105 -> %24 : !neura.data<i32, i1> !neura.data<i32, i1>
    %106 = neura.grant_predicate %94, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %106 -> %22 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %107 = neura.grant_predicate %95, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %107 -> %20 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %108 = neura.grant_predicate %96, %101 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %108 -> %18 : !neura.data<i64, i1> !neura.data<i64, i1>
    %109 = neura.grant_predicate %97, %101 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %109 -> %16 : !neura.data<i64, i1> !neura.data<i64, i1>
    %110 = neura.grant_predicate %86, %101 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %110 -> %14 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %111 = neura.grant_predicate %89, %101 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %111 -> %12 : !neura.data<i64, i1> !neura.data<i64, i1>
    %112 = neura.grant_predicate %90, %101 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %112 -> %10 : !neura.data<i64, i1> !neura.data<i64, i1>
    %113 = neura.grant_predicate %100, %100 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %113 : !neura.data<i1, i1>
    neura.yield
  }
}

