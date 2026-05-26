#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.writeonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.constant"() <{value = 9 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.constant"() <{value = 0 : i32}> : () -> !neura.data<i32, i1>
    %6 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 512 : i64}> : () -> !neura.data<i64, i1>
    neura.br %3, %4, %3, %5, %0, %1, %6, %7, %2 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1> to ^bb1
  ^bb1(%8: !neura.data<i64, i1>, %9: !neura.data<i64, i1>, %10: !neura.data<i64, i1>, %11: !neura.data<i32, i1>, %12: !neura.data<!llvm.ptr, i1>, %13: !neura.data<!llvm.ptr, i1>, %14: !neura.data<i64, i1>, %15: !neura.data<i64, i1>, %16: !neura.data<!llvm.ptr, i1>):  // 2 preds: ^bb0, ^bb3
    %17 = "neura.shl"(%8, %9) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.br %10, %11, %17, %12, %13, %14, %15, %16, %8, %9, %10, %11 : !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb2
  ^bb2(%18: !neura.data<i64, i1>, %19: !neura.data<i32, i1>, %20: !neura.data<i64, i1>, %21: !neura.data<!llvm.ptr, i1>, %22: !neura.data<!llvm.ptr, i1>, %23: !neura.data<i64, i1>, %24: !neura.data<i64, i1>, %25: !neura.data<!llvm.ptr, i1>, %26: !neura.data<i64, i1>, %27: !neura.data<i64, i1>, %28: !neura.data<i64, i1>, %29: !neura.data<i32, i1>):  // 2 preds: ^bb1, ^bb2
    %30 = "neura.add"(%18, %20) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = "neura.gep"(%21, %30) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %32 = "neura.load"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %33 = "neura.gep"(%22, %18) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.load"(%33) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %35 = "neura.mul"(%34, %32) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %36 = "neura.add"(%35, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %37 = "neura.add"(%18, %23) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %38 = "neura.icmp"(%37, %24) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %38 : !neura.data<i1, i1> then %25, %26, %36, %23, %24, %27, %28, %29, %21, %22 : !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> to ^bb3 else %37, %36, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29 : !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb2
  ^bb3(%39: !neura.data<!llvm.ptr, i1>, %40: !neura.data<i64, i1>, %41: !neura.data<i32, i1>, %42: !neura.data<i64, i1>, %43: !neura.data<i64, i1>, %44: !neura.data<i64, i1>, %45: !neura.data<i64, i1>, %46: !neura.data<i32, i1>, %47: !neura.data<!llvm.ptr, i1>, %48: !neura.data<!llvm.ptr, i1>):  // pred: ^bb2
    %49 = "neura.gep"(%39, %40) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%41, %49) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %50 = "neura.add"(%40, %42) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.icmp"(%50, %43) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %51 : !neura.data<i1, i1> then %51 : !neura.data<i1, i1> to ^bb4 else %50, %44, %45, %46, %47, %48, %42, %43, %39 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1> to ^bb1
  ^bb4(%52: !neura.data<i1, i1>):  // pred: ^bb3
    "neura.return"(%52) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

