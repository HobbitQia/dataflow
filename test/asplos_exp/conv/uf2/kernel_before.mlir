module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.constant"() <{value = 0 : i32}> : () -> !neura.data<i32, i1>
    %4 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 1022 : i64}> : () -> !neura.data<i64, i1>
    "neura.store"(%3, %2) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    neura.br %3, %4, %0, %1, %5, %2, %6, %7 : !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%8: !neura.data<i32, i1>, %9: !neura.data<i64, i1>, %10: !neura.data<!llvm.ptr, i1>, %11: !neura.data<!llvm.ptr, i1>, %12: !neura.data<i64, i1>, %13: !neura.data<!llvm.ptr, i1>, %14: !neura.data<i64, i1>, %15: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb1
    %16 = "neura.gep"(%10, %9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %17 = "neura.load"(%16) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %18 = "neura.gep"(%11, %9) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %19 = "neura.load"(%18) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %20 = "neura.mul"(%19, %17) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %21 = "neura.or"(%9, %12) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = "neura.gep"(%10, %21) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = "neura.load"(%22) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %24 = "neura.gep"(%11, %21) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %25 = "neura.load"(%24) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %26 = "neura.mul"(%25, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %27 = "neura.add"(%26, %20) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %28 = "neura.add"(%27, %8) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%28, %13) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %29 = "neura.add"(%9, %14) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.icmp"(%9, %15) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %31 = "neura.not"(%30) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.cond_br %30 : !neura.data<i1, i1> then %28, %29, %10, %11, %12, %13, %14, %15 : !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1 else %31 : !neura.data<i1, i1> to ^bb2
  ^bb2(%32: !neura.data<i1, i1>):  // pred: ^bb1
    "neura.return"(%32) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

