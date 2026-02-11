module attributes {dlti.dl_spec = #dlti.dl_spec<f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  func.func @kernel_gemv_int(%arg0: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, unsafe_fp_math = false, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %1 = "neura.constant"() <{value = 0 : i32}> : () -> !neura.data<i32, i1>
    neura.br %0, %0, %1 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb1
  ^bb1(%2: !neura.data<i64, i1>, %3: !neura.data<i64, i1>, %4: !neura.data<i32, i1>):  // 2 preds: ^bb0, ^bb3
    %5 = "neura.shl"(%2) {rhs_value = 2 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.br %3, %4, %2, %3, %4 : !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb4
  ^bb2(%6: !neura.data<i1, i1>):  // pred: ^bb3
    "neura.return"(%6) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  ^bb3(%7: !neura.data<i64, i1>, %8: !neura.data<i32, i1>, %9: !neura.data<i64, i1>, %10: !neura.data<i32, i1>):  // pred: ^bb4
    %11 = "neura.gep"(%7) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%8, %11) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %12 = "neura.add"(%7) {rhs_value = 1 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = "neura.icmp"(%12) <{cmpType = "eq"}> {rhs_value = 4 : i64} : (!neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %13 : !neura.data<i1, i1> then %13 : !neura.data<i1, i1> to ^bb2 else %12, %9, %10 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb1
  ^bb4(%14: !neura.data<i64, i1>, %15: !neura.data<i32, i1>, %16: !neura.data<i64, i1>, %17: !neura.data<i64, i1>, %18: !neura.data<i32, i1>):  // 2 preds: ^bb1, ^bb4
    %19 = "neura.add"(%14, %5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20 = "neura.gep"(%19) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg0"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %21 = "neura.load"(%20) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %22 = "neura.gep"(%14) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg1"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = "neura.load"(%22) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %24 = "neura.mul"(%23, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %25 = "neura.add"(%24, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %26 = "neura.add"(%14) {rhs_value = 1 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.icmp"(%26) <{cmpType = "eq"}> {rhs_value = 4 : i64} : (!neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %27 : !neura.data<i1, i1> then %16, %25, %17, %18 : !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb3 else %26, %25, %16, %17, %18 : !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb4
  }
}

