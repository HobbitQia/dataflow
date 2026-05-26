#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal @_ZZ4mainE9data_real(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global internal @_ZZ4mainE9data_imag(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE9data_real : !llvm.ptr
    %2 = llvm.mlir.addressof @_ZZ4mainE9data_imag : !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(256 : i64) : i64
    %6 = llvm.mlir.constant(2 : i32) : i32
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
    llvm.cond_br %13, ^bb2, ^bb1(%12 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %14 = func.call @_Z6kernelPiS_iil(%1, %2, %6, %6, %0) : (!llvm.ptr, !llvm.ptr, i32, i32, i64) -> !llvm.void
    llvm.return %7 : i32
  }
  func.func @_Z6kernelPiS_iil(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: i32 {llvm.noundef}, %arg3: i32 {llvm.noundef}, %arg4: i64 {llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg2"}> : () -> !neura.data<i32, i1>
    %3 = "neura.constant"() <{value = "%arg3"}> : () -> !neura.data<i32, i1>
    %4 = "neura.constant"() <{value = "%arg4"}> : () -> !neura.data<i64, i1>
    %5 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = 128 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 129 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.constant"() <{value = 130 : i64}> : () -> !neura.data<i64, i1>
    %10 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %11 = "neura.constant"() <{value = 131 : i64}> : () -> !neura.data<i64, i1>
    %12 = "neura.constant"() <{value = 3 : i64}> : () -> !neura.data<i64, i1>
    %13 = "neura.constant"() <{value = 4 : i64}> : () -> !neura.data<i64, i1>
    %14 = "neura.constant"() <{value = 124 : i64}> : () -> !neura.data<i64, i1>
    neura.br %5, %4, %6, %0, %2, %1, %3, %7, %8, %9, %10, %11, %12, %13, %14 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%15: !neura.data<i64, i1>, %16: !neura.data<i64, i1>, %17: !neura.data<i64, i1>, %18: !neura.data<!llvm.ptr, i1>, %19: !neura.data<i32, i1>, %20: !neura.data<!llvm.ptr, i1>, %21: !neura.data<i32, i1>, %22: !neura.data<i64, i1>, %23: !neura.data<i64, i1>, %24: !neura.data<i64, i1>, %25: !neura.data<i64, i1>, %26: !neura.data<i64, i1>, %27: !neura.data<i64, i1>, %28: !neura.data<i64, i1>, %29: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb1
    %30 = "neura.add"(%15, %16) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = "neura.add"(%30, %17) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = "neura.gep"(%18, %31) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.load"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %34 = "neura.mul"(%33, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %35 = "neura.gep"(%20, %31) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %36 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %37 = "neura.mul"(%36, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %38 = "neura.sub"(%34, %37) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %39 = "neura.mul"(%33, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %40 = "neura.mul"(%36, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %41 = "neura.add"(%40, %39) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %42 = "neura.gep"(%18, %30) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %44 = "neura.sub"(%43, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%44, %32) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %45 = "neura.add"(%43, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%45, %42) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %46 = "neura.gep"(%20, %30) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %48 = "neura.sub"(%47, %41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%48, %35) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %49 = "neura.add"(%47, %41) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%49, %46) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %50 = "neura.add"(%30, %22) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.gep"(%18, %50) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %52 = "neura.load"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %53 = "neura.mul"(%52, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %54 = "neura.gep"(%20, %50) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %55 = "neura.load"(%54) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %56 = "neura.mul"(%55, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %57 = "neura.sub"(%53, %56) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %58 = "neura.mul"(%52, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %59 = "neura.mul"(%55, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %60 = "neura.add"(%59, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %61 = "neura.add"(%30, %23) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62 = "neura.gep"(%18, %61) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %63 = "neura.load"(%62) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %64 = "neura.sub"(%63, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%64, %51) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %65 = "neura.add"(%63, %57) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%65, %62) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %66 = "neura.gep"(%20, %61) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %67 = "neura.load"(%66) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %68 = "neura.sub"(%67, %60) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%68, %54) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %69 = "neura.add"(%67, %60) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%69, %66) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %70 = "neura.add"(%30, %24) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71 = "neura.gep"(%18, %70) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = "neura.load"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %73 = "neura.mul"(%72, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %74 = "neura.gep"(%20, %70) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %75 = "neura.load"(%74) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %76 = "neura.mul"(%75, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %77 = "neura.sub"(%73, %76) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %78 = "neura.mul"(%72, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %79 = "neura.mul"(%75, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %80 = "neura.add"(%79, %78) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %81 = "neura.add"(%30, %25) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.gep"(%18, %81) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.load"(%82) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %84 = "neura.sub"(%83, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%84, %71) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %85 = "neura.add"(%83, %77) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%85, %82) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %86 = "neura.gep"(%20, %81) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %87 = "neura.load"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %88 = "neura.sub"(%87, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%88, %74) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %89 = "neura.add"(%87, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%89, %86) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %90 = "neura.add"(%30, %26) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %91 = "neura.gep"(%18, %90) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %92 = "neura.load"(%91) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %93 = "neura.mul"(%92, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %94 = "neura.gep"(%20, %90) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %95 = "neura.load"(%94) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %96 = "neura.mul"(%95, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %97 = "neura.sub"(%93, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %98 = "neura.mul"(%92, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %99 = "neura.mul"(%95, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %100 = "neura.add"(%99, %98) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %101 = "neura.add"(%30, %27) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = "neura.gep"(%18, %101) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.load"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %104 = "neura.sub"(%103, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%104, %91) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %105 = "neura.add"(%103, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%105, %102) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %106 = "neura.gep"(%20, %101) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %107 = "neura.load"(%106) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %108 = "neura.sub"(%107, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%108, %94) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %109 = "neura.add"(%107, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%109, %106) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %110 = "neura.add"(%15, %28) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %111 = "neura.icmp"(%15, %29) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %112 = "neura.not"(%111) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.cond_br %111 : !neura.data<i1, i1> then %110, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1 else %112 : !neura.data<i1, i1> to ^bb2
  ^bb2(%113: !neura.data<i1, i1>):  // pred: ^bb1
    "neura.return"(%113) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

