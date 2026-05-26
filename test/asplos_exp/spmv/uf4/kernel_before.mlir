#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3val(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3col(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3row(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE7feature(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE6output(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<1024 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(7 : i16) : i16
    %2 = llvm.mlir.constant(1 : i16) : i16
    %3 = llvm.mlir.addressof @_ZZ4mainE3val : !llvm.ptr
    %4 = llvm.mlir.addressof @_ZZ4mainE3col : !llvm.ptr
    %5 = llvm.mlir.addressof @_ZZ4mainE3row : !llvm.ptr
    %6 = llvm.mlir.constant(1 : i64) : i64
    %7 = llvm.mlir.constant(1024 : i64) : i64
    %8 = llvm.mlir.constant(13 : i16) : i16
    %9 = llvm.mlir.addressof @_ZZ4mainE7feature : !llvm.ptr
    %10 = llvm.mlir.addressof @_ZZ4mainE6output : !llvm.ptr
    %11 = llvm.mlir.constant(2 : i64) : i64
    %12 = llvm.mlir.constant(3 : i64) : i64
    %13 = llvm.mlir.constant(4 : i64) : i64
    %14 = llvm.mlir.constant(1020 : i64) : i64
    %15 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%16: i64):  // 2 preds: ^bb0, ^bb1
    %17 = llvm.trunc %16 : i64 to i32
    %18 = llvm.trunc %16 : i64 to i16
    %19 = llvm.urem %18, %1 : i16
    %20 = llvm.add %19, %2 overflow<nsw, nuw> : i16
    %21 = llvm.zext %20 : i16 to i32
    %22 = llvm.getelementptr inbounds %3[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %21, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.getelementptr inbounds %4[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %17, %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.getelementptr inbounds %5[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %17, %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %16, %6 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %7 : i64
    llvm.cond_br %26, ^bb2(%0 : i64), ^bb1(%25 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%27: i64):  // 2 preds: ^bb1, ^bb2
    %28 = llvm.trunc %27 : i64 to i16
    %29 = llvm.urem %28, %8 : i16
    %30 = llvm.zext %29 : i16 to i32
    %31 = llvm.getelementptr inbounds %9[0, %27] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %30, %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %32 = llvm.add %27, %6 overflow<nsw, nuw> : i64
    %33 = llvm.icmp "eq" %32, %7 : i64
    llvm.cond_br %33, ^bb3(%0 : i64), ^bb2(%32 : i64) {loop_annotation = #loop_annotation}
  ^bb3(%34: i64):  // 2 preds: ^bb2, ^bb3
    %35 = llvm.getelementptr inbounds %3[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %36 = llvm.load %35 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.getelementptr inbounds %4[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %38 = llvm.load %37 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.sext %38 : i32 to i64
    %40 = llvm.getelementptr inbounds %9[0, %39] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %41 = llvm.load %40 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.mul %41, %36 overflow<nsw> : i32
    %43 = llvm.getelementptr inbounds %5[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %44 = llvm.load %43 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.sext %44 : i32 to i64
    %46 = llvm.getelementptr inbounds %10[0, %45] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.add %47, %42 overflow<nsw> : i32
    llvm.store %48, %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %49 = llvm.or %34, %6 : i64
    %50 = llvm.getelementptr inbounds %3[0, %49] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.getelementptr inbounds %4[0, %49] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %53 = llvm.load %52 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %54 = llvm.sext %53 : i32 to i64
    %55 = llvm.getelementptr inbounds %9[0, %54] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %56 = llvm.load %55 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.mul %56, %51 overflow<nsw> : i32
    %58 = llvm.getelementptr inbounds %5[0, %49] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %59 = llvm.load %58 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %60 = llvm.sext %59 : i32 to i64
    %61 = llvm.getelementptr inbounds %10[0, %60] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %62 = llvm.load %61 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %63 = llvm.add %62, %57 overflow<nsw> : i32
    llvm.store %63, %61 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %64 = llvm.or %34, %11 : i64
    %65 = llvm.getelementptr inbounds %3[0, %64] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %66 = llvm.load %65 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %67 = llvm.getelementptr inbounds %4[0, %64] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %68 = llvm.load %67 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %69 = llvm.sext %68 : i32 to i64
    %70 = llvm.getelementptr inbounds %9[0, %69] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %71 = llvm.load %70 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %72 = llvm.mul %71, %66 overflow<nsw> : i32
    %73 = llvm.getelementptr inbounds %5[0, %64] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %74 = llvm.load %73 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %75 = llvm.sext %74 : i32 to i64
    %76 = llvm.getelementptr inbounds %10[0, %75] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %77 = llvm.load %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %78 = llvm.add %77, %72 overflow<nsw> : i32
    llvm.store %78, %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %79 = llvm.or %34, %12 : i64
    %80 = llvm.getelementptr inbounds %3[0, %79] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %81 = llvm.load %80 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %82 = llvm.getelementptr inbounds %4[0, %79] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %83 = llvm.load %82 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %84 = llvm.sext %83 : i32 to i64
    %85 = llvm.getelementptr inbounds %9[0, %84] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %86 = llvm.load %85 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %87 = llvm.mul %86, %81 overflow<nsw> : i32
    %88 = llvm.getelementptr inbounds %5[0, %79] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %89 = llvm.load %88 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %90 = llvm.sext %89 : i32 to i64
    %91 = llvm.getelementptr inbounds %10[0, %90] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %92 = llvm.load %91 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %93 = llvm.add %92, %87 overflow<nsw> : i32
    llvm.store %93, %91 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %94 = llvm.add %34, %13 overflow<nsw, nuw> : i64
    %95 = llvm.icmp "ult" %34, %14 : i64
    llvm.cond_br %95, ^bb3(%94 : i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %15 : i32
  }
  func.func @_Z6kernelPiS_S_S_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.constant"() <{value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.constant"() <{value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
    %5 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.constant"() <{value = 3 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.constant"() <{value = 4 : i64}> : () -> !neura.data<i64, i1>
    %10 = "neura.constant"() <{value = 1020 : i64}> : () -> !neura.data<i64, i1>
    neura.br %5, %0, %1, %3, %2, %4, %6, %7, %8, %9, %10 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%11: !neura.data<i64, i1>, %12: !neura.data<!llvm.ptr, i1>, %13: !neura.data<!llvm.ptr, i1>, %14: !neura.data<!llvm.ptr, i1>, %15: !neura.data<!llvm.ptr, i1>, %16: !neura.data<!llvm.ptr, i1>, %17: !neura.data<i64, i1>, %18: !neura.data<i64, i1>, %19: !neura.data<i64, i1>, %20: !neura.data<i64, i1>, %21: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb1
    %22 = "neura.gep"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = "neura.load"(%22) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %24 = "neura.gep"(%13, %11) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %25 = "neura.load"(%24) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %26 = neura.sext %25 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %27 = "neura.gep"(%14, %26) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = "neura.load"(%27) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %29 = "neura.mul"(%28, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %30 = "neura.gep"(%15, %11) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %31 = "neura.load"(%30) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %32 = neura.sext %31 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %33 = "neura.gep"(%16, %32) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.load"(%33) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %35 = "neura.add"(%34, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%35, %33) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %36 = "neura.or"(%11, %17) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = "neura.gep"(%12, %36) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = "neura.load"(%37) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %39 = "neura.gep"(%13, %36) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = "neura.load"(%39) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %41 = neura.sext %40 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %42 = "neura.gep"(%14, %41) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %44 = "neura.mul"(%43, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %45 = "neura.gep"(%15, %36) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %47 = neura.sext %46 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %48 = "neura.gep"(%16, %47) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %49 = "neura.load"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %50 = "neura.add"(%49, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%50, %48) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %51 = "neura.or"(%11, %18) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.gep"(%12, %51) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %54 = "neura.gep"(%13, %51) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %55 = "neura.load"(%54) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %56 = neura.sext %55 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %57 = "neura.gep"(%14, %56) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %58 = "neura.load"(%57) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %59 = "neura.mul"(%58, %53) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %60 = "neura.gep"(%15, %51) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %61 = "neura.load"(%60) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %62 = neura.sext %61 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %63 = "neura.gep"(%16, %62) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %64 = "neura.load"(%63) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %65 = "neura.add"(%64, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%65, %63) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %66 = "neura.or"(%11, %19) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = "neura.gep"(%12, %66) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %68 = "neura.load"(%67) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %69 = "neura.gep"(%13, %66) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.load"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %71 = neura.sext %70 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %72 = "neura.gep"(%14, %71) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %73 = "neura.load"(%72) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %74 = "neura.mul"(%73, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %75 = "neura.gep"(%15, %66) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %76 = "neura.load"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %77 = neura.sext %76 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %78 = "neura.gep"(%16, %77) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.load"(%78) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %80 = "neura.add"(%79, %74) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%80, %78) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %81 = "neura.add"(%11, %20) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.icmp"(%11, %21) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %83 = "neura.not"(%82) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.cond_br %82 : !neura.data<i1, i1> then %81, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1 else %83 : !neura.data<i1, i1> to ^bb2
  ^bb2(%84: !neura.data<i1, i1>):  // pred: ^bb1
    "neura.return"(%84) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

