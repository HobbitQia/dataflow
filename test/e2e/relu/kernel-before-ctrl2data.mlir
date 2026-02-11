module attributes {dlti.dl_spec = #dlti.dl_spec<i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  func.func @kernel(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr {llvm.nocapture}, %arg4: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture, llvm.readnone}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, unsafe_fp_math = false, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = 0 : i32}> : () -> !neura.data<i32, i1>
    neura.br %0, %0 : !neura.data<i32, i1>, !neura.data<i32, i1> to ^bb1
  ^bb1(%1: !neura.data<i32, i1>, %2: !neura.data<i32, i1>):  // 2 preds: ^bb0, ^bb1
    %3 = "neura.cast"(%1) <{cast_type = "trunc"}> : (!neura.data<i32, i1>) -> !neura.data<i16, i1>
    %4 = "neura.div"(%3) {rhs_value = 70 : i16} : (!neura.data<i16, i1>) -> !neura.data<i16, i1>
    %5 = "neura.rem"(%3) {rhs_value = 70 : i16} : (!neura.data<i16, i1>) -> !neura.data<i16, i1>
    %6 = neura.zext %4 : !neura.data<i16, i1> -> !neura.data<i64, i1>
    %7 = neura.zext %5 : !neura.data<i16, i1> -> !neura.data<i64, i1>
    %8 = "neura.gep"(%6, %7) <{operandSegmentSizes = array<i32: 0, 2>}> {lhs_value = "%arg4"} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %9 = "neura.load"(%8) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %10 = "neura.icmp"(%9) <{cmpType = "sgt"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    %11 = "neura.sel"(%10, %9, %2) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %12 = "neura.gep"(%6, %7) <{operandSegmentSizes = array<i32: 0, 2>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%11, %12) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %13 = "neura.add"(%1) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %14 = "neura.icmp"(%13) <{cmpType = "eq"}> {rhs_value = 4200 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    neura.cond_br %14 : !neura.data<i1, i1> then %14 : !neura.data<i1, i1> to ^bb2 else %13, %2 : !neura.data<i32, i1>, !neura.data<i32, i1> to ^bb1
  ^bb2(%15: !neura.data<i1, i1>):  // pred: ^bb1
    "neura.return"(%15) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

