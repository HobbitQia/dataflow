; ModuleID = '/mnt/public/sichuan_a/qjj/dataflow/test/e2e/../benchmark/CGRA-Bench/kernels/spmv/spmv.c'
source_filename = "/mnt/public/sichuan_a/qjj/dataflow/test/e2e/../benchmark/CGRA-Bench/kernels/spmv/spmv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@nnz = dso_local local_unnamed_addr global i32 100, align 4
@val = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@col = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@row = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@feature = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@output = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = load i32, i32* @nnz, align 4, !tbaa !2
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %97

3:                                                ; preds = %0
  %4 = add nsw i32 %1, -1
  %5 = and i32 %1, 3
  %6 = icmp ult i32 %4, 3
  br i1 %6, label %74, label %7

7:                                                ; preds = %3
  %8 = and i32 %1, -4
  br label %9

9:                                                ; preds = %9, %7
  %10 = phi i64 [ 0, %7 ], [ %71, %9 ]
  %11 = phi i32 [ %8, %7 ], [ %72, %9 ]
  %12 = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %10
  %13 = load i32, i32* %12, align 16, !tbaa !2
  %14 = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %10
  %15 = load i32, i32* %14, align 16, !tbaa !2
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !2
  %19 = mul nsw i32 %18, %13
  %20 = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %10
  %21 = load i32, i32* %20, align 16, !tbaa !2
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !2
  %25 = add nsw i32 %24, %19
  store i32 %25, i32* %23, align 4, !tbaa !2
  %26 = or i64 %10, 1
  %27 = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !2
  %29 = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %26
  %30 = load i32, i32* %29, align 4, !tbaa !2
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !2
  %34 = mul nsw i32 %33, %28
  %35 = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %26
  %36 = load i32, i32* %35, align 4, !tbaa !2
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %37
  %39 = load i32, i32* %38, align 4, !tbaa !2
  %40 = add nsw i32 %39, %34
  store i32 %40, i32* %38, align 4, !tbaa !2
  %41 = or i64 %10, 2
  %42 = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %41
  %43 = load i32, i32* %42, align 8, !tbaa !2
  %44 = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %41
  %45 = load i32, i32* %44, align 8, !tbaa !2
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %46
  %48 = load i32, i32* %47, align 4, !tbaa !2
  %49 = mul nsw i32 %48, %43
  %50 = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %41
  %51 = load i32, i32* %50, align 8, !tbaa !2
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %52
  %54 = load i32, i32* %53, align 4, !tbaa !2
  %55 = add nsw i32 %54, %49
  store i32 %55, i32* %53, align 4, !tbaa !2
  %56 = or i64 %10, 3
  %57 = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %56
  %58 = load i32, i32* %57, align 4, !tbaa !2
  %59 = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %56
  %60 = load i32, i32* %59, align 4, !tbaa !2
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %61
  %63 = load i32, i32* %62, align 4, !tbaa !2
  %64 = mul nsw i32 %63, %58
  %65 = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %56
  %66 = load i32, i32* %65, align 4, !tbaa !2
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %67
  %69 = load i32, i32* %68, align 4, !tbaa !2
  %70 = add nsw i32 %69, %64
  store i32 %70, i32* %68, align 4, !tbaa !2
  %71 = add nuw nsw i64 %10, 4
  %72 = add i32 %11, -4
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %9, !llvm.loop !6

74:                                               ; preds = %9, %3
  %75 = phi i64 [ 0, %3 ], [ %71, %9 ]
  %76 = icmp eq i32 %5, 0
  br i1 %76, label %97, label %77

77:                                               ; preds = %74, %77
  %78 = phi i64 [ %94, %77 ], [ %75, %74 ]
  %79 = phi i32 [ %95, %77 ], [ %5, %74 ]
  %80 = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %78
  %81 = load i32, i32* %80, align 4, !tbaa !2
  %82 = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %78
  %83 = load i32, i32* %82, align 4, !tbaa !2
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %84
  %86 = load i32, i32* %85, align 4, !tbaa !2
  %87 = mul nsw i32 %86, %81
  %88 = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %78
  %89 = load i32, i32* %88, align 4, !tbaa !2
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %90
  %92 = load i32, i32* %91, align 4, !tbaa !2
  %93 = add nsw i32 %92, %87
  store i32 %93, i32* %91, align 4, !tbaa !2
  %94 = add nuw nsw i64 %78, 1
  %95 = add nsw i32 %79, -1
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %97, label %77, !llvm.loop !9

97:                                               ; preds = %77, %0, %74
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32* nocapture readonly %1, i32* nocapture readonly %2, i32* nocapture readonly %3, i32* nocapture readonly %4, i32* nocapture %5) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %8, label %102

8:                                                ; preds = %6
  %9 = add nsw i32 %0, -1
  %10 = and i32 %0, 3
  %11 = icmp ult i32 %9, 3
  br i1 %11, label %79, label %12

12:                                               ; preds = %8
  %13 = and i32 %0, -4
  br label %14

14:                                               ; preds = %14, %12
  %15 = phi i64 [ 0, %12 ], [ %76, %14 ]
  %16 = phi i32 [ %13, %12 ], [ %77, %14 ]
  %17 = getelementptr inbounds i32, i32* %1, i64 %15
  %18 = load i32, i32* %17, align 4, !tbaa !2
  %19 = getelementptr inbounds i32, i32* %2, i64 %15
  %20 = load i32, i32* %19, align 4, !tbaa !2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32* %4, i64 %21
  %23 = load i32, i32* %22, align 4, !tbaa !2
  %24 = mul nsw i32 %23, %18
  %25 = getelementptr inbounds i32, i32* %3, i64 %15
  %26 = load i32, i32* %25, align 4, !tbaa !2
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32* %5, i64 %27
  %29 = load i32, i32* %28, align 4, !tbaa !2
  %30 = add nsw i32 %29, %24
  store i32 %30, i32* %28, align 4, !tbaa !2
  %31 = or i64 %15, 1
  %32 = getelementptr inbounds i32, i32* %1, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !2
  %34 = getelementptr inbounds i32, i32* %2, i64 %31
  %35 = load i32, i32* %34, align 4, !tbaa !2
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32* %4, i64 %36
  %38 = load i32, i32* %37, align 4, !tbaa !2
  %39 = mul nsw i32 %38, %33
  %40 = getelementptr inbounds i32, i32* %3, i64 %31
  %41 = load i32, i32* %40, align 4, !tbaa !2
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32* %5, i64 %42
  %44 = load i32, i32* %43, align 4, !tbaa !2
  %45 = add nsw i32 %44, %39
  store i32 %45, i32* %43, align 4, !tbaa !2
  %46 = or i64 %15, 2
  %47 = getelementptr inbounds i32, i32* %1, i64 %46
  %48 = load i32, i32* %47, align 4, !tbaa !2
  %49 = getelementptr inbounds i32, i32* %2, i64 %46
  %50 = load i32, i32* %49, align 4, !tbaa !2
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32* %4, i64 %51
  %53 = load i32, i32* %52, align 4, !tbaa !2
  %54 = mul nsw i32 %53, %48
  %55 = getelementptr inbounds i32, i32* %3, i64 %46
  %56 = load i32, i32* %55, align 4, !tbaa !2
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32* %5, i64 %57
  %59 = load i32, i32* %58, align 4, !tbaa !2
  %60 = add nsw i32 %59, %54
  store i32 %60, i32* %58, align 4, !tbaa !2
  %61 = or i64 %15, 3
  %62 = getelementptr inbounds i32, i32* %1, i64 %61
  %63 = load i32, i32* %62, align 4, !tbaa !2
  %64 = getelementptr inbounds i32, i32* %2, i64 %61
  %65 = load i32, i32* %64, align 4, !tbaa !2
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32* %4, i64 %66
  %68 = load i32, i32* %67, align 4, !tbaa !2
  %69 = mul nsw i32 %68, %63
  %70 = getelementptr inbounds i32, i32* %3, i64 %61
  %71 = load i32, i32* %70, align 4, !tbaa !2
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32* %5, i64 %72
  %74 = load i32, i32* %73, align 4, !tbaa !2
  %75 = add nsw i32 %74, %69
  store i32 %75, i32* %73, align 4, !tbaa !2
  %76 = add nuw nsw i64 %15, 4
  %77 = add i32 %16, -4
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %14, !llvm.loop !6

79:                                               ; preds = %14, %8
  %80 = phi i64 [ 0, %8 ], [ %76, %14 ]
  %81 = icmp eq i32 %10, 0
  br i1 %81, label %102, label %82

82:                                               ; preds = %79, %82
  %83 = phi i64 [ %99, %82 ], [ %80, %79 ]
  %84 = phi i32 [ %100, %82 ], [ %10, %79 ]
  %85 = getelementptr inbounds i32, i32* %1, i64 %83
  %86 = load i32, i32* %85, align 4, !tbaa !2
  %87 = getelementptr inbounds i32, i32* %2, i64 %83
  %88 = load i32, i32* %87, align 4, !tbaa !2
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32* %4, i64 %89
  %91 = load i32, i32* %90, align 4, !tbaa !2
  %92 = mul nsw i32 %91, %86
  %93 = getelementptr inbounds i32, i32* %3, i64 %83
  %94 = load i32, i32* %93, align 4, !tbaa !2
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32* %5, i64 %95
  %97 = load i32, i32* %96, align 4, !tbaa !2
  %98 = add nsw i32 %97, %92
  store i32 %98, i32* %96, align 4, !tbaa !2
  %99 = add nuw nsw i64 %83, 1
  %100 = add i32 %84, -1
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %82, !llvm.loop !9

102:                                              ; preds = %82, %79, %6
  ret void
}

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !8}
