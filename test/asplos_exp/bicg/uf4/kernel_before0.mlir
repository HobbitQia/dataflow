#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external @A(dense<0> : tensor<256x256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x array<256 x i32>>
  llvm.mlir.global external @r(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external @p(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external @s(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external @q(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @r : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(255 : i32) : i32
    %4 = llvm.mlir.addressof @A : !llvm.ptr
    %5 = llvm.mlir.constant(256 : i64) : i64
    %6 = llvm.mlir.addressof @p : !llvm.ptr
    %7 = llvm.mlir.addressof @s : !llvm.ptr
    %8 = llvm.mlir.addressof @q : !llvm.ptr
    %9 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb3
    %11 = llvm.getelementptr inbounds %1[0, %10] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %12 = llvm.trunc %10 : i64 to i32
    llvm.store %12, %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb2(%0 : i64)
  ^bb2(%13: i64):  // 2 preds: ^bb1, ^bb2
    %14 = llvm.add %13, %2 overflow<nsw, nuw> : i64
    %15 = llvm.mul %14, %10 overflow<nsw, nuw> : i64
    %16 = llvm.trunc %15 : i64 to i32
    %17 = llvm.and %16, %3 : i32
    %18 = llvm.getelementptr inbounds %4[0, %10, %13] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    llvm.store %17, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.icmp "eq" %14, %5 : i64
    llvm.cond_br %19, ^bb3, ^bb2(%14 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %20 = llvm.add %10, %2 overflow<nsw, nuw> : i64
    %21 = llvm.icmp "eq" %20, %5 : i64
    llvm.cond_br %21, ^bb4(%0 : i64), ^bb1(%20 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%22: i64):  // 2 preds: ^bb3, ^bb4
    %23 = llvm.getelementptr inbounds %6[0, %22] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %24 = llvm.trunc %22 : i64 to i32
    llvm.store %24, %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %22, %2 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %5 : i64
    llvm.cond_br %26, ^bb5, ^bb4(%25 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %27 = func.call @_Z6kernelPA256_iPiS1_S1_S1_(%4, %7, %8, %6, %1) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.void
    llvm.return %9 : i32
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
    %12 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
    %13 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
    %14 = "neura.grant_once"() <{constant_value = 252 : i64}> : () -> !neura.data<i64, i1>
    %15 = "neura.grant_once"() <{constant_value = 256 : i64}> : () -> !neura.data<i64, i1>
    "neura.memset"(%2, %6, %7) <{is_volatile = false}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i64, i1>) -> ()
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.phi_start %15, %16 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.phi_start %14, %18 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = neura.phi_start %13, %20 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.phi_start %12, %22 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.phi_start %11, %24 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = neura.phi_start %10, %26 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %29 = neura.phi_start %4, %28 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %31 = neura.phi_start %0, %30 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %32 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %33 = neura.phi_start %1, %32 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = neura.phi_start %8, %34 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %37 = neura.phi_start %5, %36 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %38 = neura.reserve : !neura.data<i32, i1>
    %39 = neura.phi_start %9, %38 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %40 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %41 = neura.phi_start %3, %40 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.phi_start %8, %42 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = "neura.gep"(%41, %43) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%39, %44) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %45 = "neura.gep"(%37, %43) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = neura.reserve : !neura.data<i64, i1>
    %47 = neura.phi_start %35, %46 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %49 = neura.phi_start %37, %48 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %50 = neura.reserve : !neura.data<i32, i1>
    %51 = neura.phi_start %39, %50 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %52 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %53 = neura.phi_start %41, %52 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %54 = neura.reserve : !neura.data<i64, i1>
    %55 = neura.phi_start %17, %54 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %56 = neura.reserve : !neura.data<i64, i1>
    %57 = neura.phi_start %19, %56 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %58 = neura.reserve : !neura.data<i64, i1>
    %59 = neura.phi_start %21, %58 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61 = neura.phi_start %23, %60 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %62 = neura.reserve : !neura.data<i64, i1>
    %63 = neura.phi_start %25, %62 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %64 = neura.reserve : !neura.data<i64, i1>
    %65 = neura.phi_start %27, %64 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %66 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %67 = neura.phi_start %29, %66 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %68 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %69 = neura.phi_start %44, %68 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %70 = neura.reserve : !neura.data<i64, i1>
    %71 = neura.phi_start %43, %70 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %72 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %73 = neura.phi_start %31, %72 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %74 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %75 = neura.phi_start %45, %74 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %76 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %77 = neura.phi_start %33, %76 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %78 = neura.reserve : !neura.data<i64, i1>
    %79 = neura.phi_start %35, %78 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %80 = "neura.gep"(%77, %79) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %81 = "neura.load"(%80) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %82 = "neura.load"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %83 = "neura.gep"(%73, %71, %79) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.load"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %85 = "neura.mul"(%84, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %86 = "neura.add"(%85, %81) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%86, %80) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %87 = "neura.load"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %88 = "neura.load"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %89 = "neura.gep"(%67, %79) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %90 = "neura.load"(%89) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %91 = "neura.mul"(%90, %88) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %92 = "neura.add"(%91, %87) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%92, %69) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %93 = "neura.or"(%79, %65) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %94 = "neura.gep"(%77, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %95 = "neura.load"(%94) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %96 = "neura.load"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %97 = "neura.gep"(%73, %71, %93) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %98 = "neura.load"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %99 = "neura.mul"(%98, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %100 = "neura.add"(%99, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%100, %94) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %101 = "neura.load"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %102 = "neura.load"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %103 = "neura.gep"(%67, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %104 = "neura.load"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %105 = "neura.mul"(%104, %102) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %106 = "neura.add"(%105, %101) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%106, %69) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %107 = "neura.or"(%79, %63) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %108 = "neura.gep"(%77, %107) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %109 = "neura.load"(%108) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %110 = "neura.load"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %111 = "neura.gep"(%73, %71, %107) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %112 = "neura.load"(%111) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %113 = "neura.mul"(%112, %110) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %114 = "neura.add"(%113, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%114, %108) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %115 = "neura.load"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %116 = "neura.load"(%111) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %117 = "neura.gep"(%67, %107) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %118 = "neura.load"(%117) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %119 = "neura.mul"(%118, %116) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %120 = "neura.add"(%119, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%120, %69) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %121 = "neura.or"(%79, %61) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %122 = "neura.gep"(%77, %121) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %123 = "neura.load"(%122) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %124 = "neura.load"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %125 = "neura.gep"(%73, %71, %121) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %126 = "neura.load"(%125) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %127 = "neura.mul"(%126, %124) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %128 = "neura.add"(%127, %123) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%128, %122) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %129 = "neura.load"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %130 = "neura.load"(%125) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %131 = "neura.gep"(%67, %121) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %132 = "neura.load"(%131) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %133 = "neura.mul"(%132, %130) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %134 = "neura.add"(%133, %129) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%134, %69) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %135 = "neura.add"(%79, %59) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %136 = "neura.icmp"(%79, %57) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %137 = neura.grant_predicate %135, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %137 -> %78 : !neura.data<i64, i1> !neura.data<i64, i1>
    %138 = neura.grant_predicate %77, %136 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %138 -> %76 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %139 = neura.grant_predicate %75, %136 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %139 -> %74 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %140 = neura.grant_predicate %73, %136 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %140 -> %72 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %141 = neura.grant_predicate %71, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %141 -> %70 : !neura.data<i64, i1> !neura.data<i64, i1>
    %142 = neura.grant_predicate %69, %136 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %142 -> %68 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %143 = neura.grant_predicate %67, %136 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %143 -> %66 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %144 = neura.grant_predicate %65, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %144 -> %64 : !neura.data<i64, i1> !neura.data<i64, i1>
    %145 = neura.grant_predicate %63, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %145 -> %62 : !neura.data<i64, i1> !neura.data<i64, i1>
    %146 = neura.grant_predicate %61, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %146 -> %60 : !neura.data<i64, i1> !neura.data<i64, i1>
    %147 = neura.grant_predicate %59, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %147 -> %58 : !neura.data<i64, i1> !neura.data<i64, i1>
    %148 = neura.grant_predicate %57, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %148 -> %56 : !neura.data<i64, i1> !neura.data<i64, i1>
    %149 = neura.grant_predicate %55, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %149 -> %54 : !neura.data<i64, i1> !neura.data<i64, i1>
    %150 = neura.grant_predicate %53, %136 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %150 -> %52 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %151 = neura.grant_predicate %51, %136 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %151 -> %50 : !neura.data<i32, i1> !neura.data<i32, i1>
    %152 = neura.grant_predicate %49, %136 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %152 -> %48 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %153 = neura.grant_predicate %47, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %153 -> %46 : !neura.data<i64, i1> !neura.data<i64, i1>
    %154 = "neura.not"(%136) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %155 = neura.grant_predicate %71, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %156 = neura.grant_predicate %65, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %157 = neura.grant_predicate %55, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %158 = neura.grant_predicate %53, %154 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %159 = neura.grant_predicate %51, %154 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %160 = neura.grant_predicate %49, %154 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %161 = neura.grant_predicate %47, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %162 = neura.grant_predicate %77, %154 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %163 = neura.grant_predicate %73, %154 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %164 = neura.grant_predicate %67, %154 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %165 = neura.grant_predicate %63, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %166 = neura.grant_predicate %61, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %167 = neura.grant_predicate %59, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %168 = neura.grant_predicate %57, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %169 = "neura.add"(%155, %156) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %170 = "neura.icmp"(%169, %157) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %171 = "neura.not"(%170) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %172 = neura.grant_predicate %169, %171 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %172 -> %42 : !neura.data<i64, i1> !neura.data<i64, i1>
    %173 = neura.grant_predicate %158, %171 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %173 -> %40 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %174 = neura.grant_predicate %159, %171 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %174 -> %38 : !neura.data<i32, i1> !neura.data<i32, i1>
    %175 = neura.grant_predicate %160, %171 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %175 -> %36 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %176 = neura.grant_predicate %161, %171 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %176 -> %34 : !neura.data<i64, i1> !neura.data<i64, i1>
    %177 = neura.grant_predicate %162, %171 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %177 -> %32 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %178 = neura.grant_predicate %163, %171 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %178 -> %30 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %179 = neura.grant_predicate %164, %171 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %179 -> %28 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %180 = neura.grant_predicate %156, %171 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %180 -> %26 : !neura.data<i64, i1> !neura.data<i64, i1>
    %181 = neura.grant_predicate %165, %171 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %181 -> %24 : !neura.data<i64, i1> !neura.data<i64, i1>
    %182 = neura.grant_predicate %166, %171 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %182 -> %22 : !neura.data<i64, i1> !neura.data<i64, i1>
    %183 = neura.grant_predicate %167, %171 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %183 -> %20 : !neura.data<i64, i1> !neura.data<i64, i1>
    %184 = neura.grant_predicate %168, %171 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %184 -> %18 : !neura.data<i64, i1> !neura.data<i64, i1>
    %185 = neura.grant_predicate %157, %171 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %185 -> %16 : !neura.data<i64, i1> !neura.data<i64, i1>
    %186 = neura.grant_predicate %170, %170 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %186 : !neura.data<i1, i1>
    neura.yield
  }
}

