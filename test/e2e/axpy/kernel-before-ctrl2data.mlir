module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  func.func @kernel_axpy_int(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, unsafe_fp_math = false, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<i32, i1>
    %1 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %2 = "neura.icmp"(%0) <{cmpType = "sgt"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    %3 = "neura.not"(%2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.cond_br %2 : !neura.data<i1, i1> then %0, %1 : !neura.data<i32, i1>, !neura.data<i64, i1> to ^bb1 else %3 : !neura.data<i1, i1> to ^bb2
  ^bb1(%4: !neura.data<i32, i1>, %5: !neura.data<i64, i1>):  // pred: ^bb0
    %6 = neura.zext %4 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    neura.br %5 : !neura.data<i64, i1> to ^bb3
  ^bb2(%7: !neura.data<i1, i1>):  // 2 preds: ^bb0, ^bb3
    "neura.return"(%7) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  ^bb3(%8: !neura.data<i64, i1>):  // 2 preds: ^bb1, ^bb3
    %9 = "neura.gep"(%8) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %10 = "neura.load"(%9) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %11 = "neura.mul"(%10) {rhs_value = "%arg1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %12 = "neura.gep"(%8) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %13 = "neura.load"(%12) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %14 = "neura.add"(%11, %13) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%14, %12) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %15 = "neura.add"(%8) {rhs_value = 1 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = "neura.icmp"(%15, %6) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %16 : !neura.data<i1, i1> then %16 : !neura.data<i1, i1> to ^bb2 else %15 : !neura.data<i64, i1> to ^bb3
  }
}

