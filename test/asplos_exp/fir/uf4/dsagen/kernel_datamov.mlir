#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external local_unnamed_addr @coefficients(dense<[0, 1, 3, -2, 0, 0, -3, 1, 0, 1, 3, -2, 0, 0, -3, 1, 0, 1, 3, -2, 0, 0, -3, 1, 0, 1, 3, -2, 0, 0, -3, 1]> : tensor<32xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<32 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5input(dense<0> : tensor<32xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<32 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(5 : i8) : i8
    %2 = llvm.mlir.addressof @_ZZ4mainE5input : !llvm.ptr
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.mlir.constant(32 : i64) : i64
    %5 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%6: i64):  // 2 preds: ^bb0, ^bb1
    %7 = llvm.trunc %6 : i64 to i8
    %8 = llvm.urem %7, %1 : i8
    %9 = llvm.zext %8 : i8 to i32
    %10 = llvm.getelementptr inbounds %2[0, %6] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<32 x i32>
    llvm.store %9, %10 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %11 = llvm.add %6, %3 overflow<nsw, nuw> : i64
    %12 = llvm.icmp "eq" %11, %4 : i64
    llvm.cond_br %12, ^bb2, ^bb1(%11 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return %5 : i32
  }
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
    %5 = "neura.constant"() <{value = 0 : i32}> : () -> !neura.data<i32, i1>
    %6 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 28 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %10 = "neura.data_mov"(%2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%9, %10) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = neura.phi_start %12, %11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = neura.phi_start %15, %14 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %18 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %19 = neura.phi_start %18, %17 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %20 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %21 = "neura.data_mov"(%3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = neura.phi_start %21, %20 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %23 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %24 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %25 = neura.phi_start %24, %23 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = neura.phi_start %27, %26 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %29 = neura.reserve : !neura.data<i32, i1>
    %30 = "neura.data_mov"(%4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %31 = neura.phi_start %30, %29 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %32 = "neura.data_mov"(%25) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %34 = "neura.gep"(%32, %33) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = "neura.data_mov"(%22) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %36 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = "neura.gep"(%35, %36) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %39 = "neura.load"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
    %40 = "neura.data_mov"(%37) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %41 = "neura.load"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
    %42 = "neura.data_mov"(%41) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %43 = "neura.data_mov"(%39) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %44 = "neura.vmul"(%42, %43) : (!neura.data<vector<4xi32>, i1>, !neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %45 = "neura.data_mov"(%44) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %46 = "neura.vector.reduce.add"(%45) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<i32, i1>
    %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48 = "neura.data_mov"(%31) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.add"(%47, %48) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %50 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %51 = "neura.data_mov"(%19) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%50, %51) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %52 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %53 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = "neura.add"(%52, %53) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.icmp"(%55, %56) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %58 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %59 = "neura.not"(%58) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %60 = "neura.data_mov"(%49) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %61 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %62 = neura.grant_predicate %60, %61 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %62 -> %29 : !neura.data<i32, i1> !neura.data<i32, i1>
    %63 = "neura.data_mov"(%54) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %65 = neura.grant_predicate %63, %64 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %65 -> %26 : !neura.data<i64, i1> !neura.data<i64, i1>
    %66 = "neura.data_mov"(%25) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %67 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %68 = neura.grant_predicate %66, %67 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %68 -> %23 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %69 = "neura.data_mov"(%22) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %71 = neura.grant_predicate %69, %70 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %71 -> %20 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %72 = "neura.data_mov"(%19) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %73 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %74 = neura.grant_predicate %72, %73 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %74 -> %17 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %75 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %76 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %77 = neura.grant_predicate %75, %76 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %77 -> %14 : !neura.data<i64, i1> !neura.data<i64, i1>
    %78 = "neura.data_mov"(%13) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %79 = "neura.data_mov"(%57) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %80 = neura.grant_predicate %78, %79 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %80 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %81 = "neura.data_mov"(%59) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %82 = "neura.data_mov"(%59) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %83 = neura.grant_predicate %81, %82 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %84 = "neura.data_mov"(%83) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %84 : !neura.data<i1, i1>
    neura.yield
  }
}

