module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  func.func @kernel(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr {llvm.nocapture}, %arg4: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, unsafe_fp_math = false, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<i32, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<i32, i1>
    %2 = "neura.constant"() <{value = "%arg2"}> : () -> !neura.data<i32, i1>
    %3 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.icmp"(%0) <{cmpType = "sgt"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    %5 = "neura.icmp"(%2) <{cmpType = "sgt"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    %6 = "neura.icmp"(%1) <{cmpType = "sgt"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    %7 = "neura.and"(%4, %5) : (!neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i1, i1>
    %8 = "neura.not"(%7) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.cond_br %7 : !neura.data<i1, i1> then %0, %2, %1, %3, %6 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i1, i1> to ^bb1 else %8 : !neura.data<i1, i1> to ^bb7
  ^bb1(%9: !neura.data<i32, i1>, %10: !neura.data<i32, i1>, %11: !neura.data<i32, i1>, %12: !neura.data<i64, i1>, %13: !neura.data<i1, i1>):  // pred: ^bb0
    %14 = neura.zext %9 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %15 = neura.zext %10 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %16 = neura.zext %11 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    neura.br %12, %13, %12, %16, %15 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2
  ^bb2(%17: !neura.data<i64, i1>, %18: !neura.data<i1, i1>, %19: !neura.data<i64, i1>, %20: !neura.data<i64, i1>, %21: !neura.data<i64, i1>):  // 2 preds: ^bb1, ^bb3
    neura.cond_br %18 : !neura.data<i1, i1> then %19, %17, %19, %20, %21, %18 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1> to ^bb4 else %18, %19, %20, %21 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb3
  ^bb3(%22: !neura.data<i1, i1>, %23: !neura.data<i64, i1>, %24: !neura.data<i64, i1>, %25: !neura.data<i64, i1>):  // 2 preds: ^bb2, ^bb5
    %26 = "neura.add"(%17) {rhs_value = 1 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.icmp"(%26, %14) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %27 : !neura.data<i1, i1> then %27 : !neura.data<i1, i1> to ^bb7 else %26, %22, %23, %24, %25 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2
  ^bb4(%28: !neura.data<i64, i1>, %29: !neura.data<i64, i1>, %30: !neura.data<i64, i1>, %31: !neura.data<i64, i1>, %32: !neura.data<i64, i1>, %33: !neura.data<i1, i1>):  // 2 preds: ^bb2, ^bb5
    %34 = "neura.gep"(%29, %28) <{operandSegmentSizes = array<i32: 0, 2>}> {lhs_value = "%arg4"} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.br %30, %29, %31, %32, %33, %30 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1> to ^bb6
  ^bb5(%35: !neura.data<i64, i1>, %36: !neura.data<i64, i1>, %37: !neura.data<i1, i1>, %38: !neura.data<i64, i1>, %39: !neura.data<i64, i1>, %40: !neura.data<i64, i1>):  // pred: ^bb6
    %41 = "neura.add"(%35) {rhs_value = 1 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %42 = "neura.icmp"(%41, %36) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %42 : !neura.data<i1, i1> then %37, %38, %40, %36 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb3 else %41, %39, %38, %40, %36, %37 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1> to ^bb4
  ^bb6(%43: !neura.data<i64, i1>, %44: !neura.data<i64, i1>, %45: !neura.data<i64, i1>, %46: !neura.data<i64, i1>, %47: !neura.data<i1, i1>, %48: !neura.data<i64, i1>):  // 2 preds: ^bb4, ^bb6
    %49 = "neura.load"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %50 = "neura.gep"(%28, %43) <{operandSegmentSizes = array<i32: 0, 2>}> {lhs_value = "%arg5"} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %51 = "neura.load"(%50) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %52 = "neura.fmul"(%49, %51) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    %53 = "neura.gep"(%44, %43) <{operandSegmentSizes = array<i32: 0, 2>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %54 = "neura.load"(%53) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %55 = "neura.fadd"(%54, %52) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    "neura.store"(%55, %53) : (!neura.data<f64, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %56 = "neura.add"(%43) {rhs_value = 1 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.icmp"(%56, %45) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %57 : !neura.data<i1, i1> then %28, %46, %47, %48, %44, %45 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb5 else %56, %44, %45, %46, %47, %48 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1> to ^bb6
  ^bb7(%58: !neura.data<i1, i1>):  // 2 preds: ^bb0, ^bb3
    "neura.return"(%58) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

