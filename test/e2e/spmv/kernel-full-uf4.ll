; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/spmv/kernel_uf4.c'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/spmv/kernel_uf4.c"
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
  br i1 %2, label %3, label %68

3:                                                ; preds = %0
  %4 = zext i32 %1 to i64
  br label %5

5:                                                ; preds = %5, %3
  %6 = phi i64 [ 0, %3 ], [ %66, %5 ]
  %7 = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %6
  %8 = load i32, i32* %7, align 16, !tbaa !2
  %9 = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %6
  %10 = load i32, i32* %9, align 16, !tbaa !2
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !2
  %14 = mul nsw i32 %13, %8
  %15 = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %6
  %16 = load i32, i32* %15, align 16, !tbaa !2
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %17
  %19 = load i32, i32* %18, align 4, !tbaa !2
  %20 = add nsw i32 %19, %14
  store i32 %20, i32* %18, align 4, !tbaa !2
  %21 = or i64 %6, 1
  %22 = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %21
  %23 = load i32, i32* %22, align 4, !tbaa !2
  %24 = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %21
  %25 = load i32, i32* %24, align 4, !tbaa !2
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !2
  %29 = mul nsw i32 %28, %23
  %30 = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %21
  %31 = load i32, i32* %30, align 4, !tbaa !2
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %32
  %34 = load i32, i32* %33, align 4, !tbaa !2
  %35 = add nsw i32 %34, %29
  store i32 %35, i32* %33, align 4, !tbaa !2
  %36 = or i64 %6, 2
  %37 = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %36
  %38 = load i32, i32* %37, align 8, !tbaa !2
  %39 = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %36
  %40 = load i32, i32* %39, align 8, !tbaa !2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !2
  %44 = mul nsw i32 %43, %38
  %45 = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %36
  %46 = load i32, i32* %45, align 8, !tbaa !2
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %47
  %49 = load i32, i32* %48, align 4, !tbaa !2
  %50 = add nsw i32 %49, %44
  store i32 %50, i32* %48, align 4, !tbaa !2
  %51 = or i64 %6, 3
  %52 = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %51
  %53 = load i32, i32* %52, align 4, !tbaa !2
  %54 = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %51
  %55 = load i32, i32* %54, align 4, !tbaa !2
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %56
  %58 = load i32, i32* %57, align 4, !tbaa !2
  %59 = mul nsw i32 %58, %53
  %60 = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %51
  %61 = load i32, i32* %60, align 4, !tbaa !2
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %62
  %64 = load i32, i32* %63, align 4, !tbaa !2
  %65 = add nsw i32 %64, %59
  store i32 %65, i32* %63, align 4, !tbaa !2
  %66 = add nuw nsw i64 %6, 4
  %67 = icmp ult i64 %66, %4
  br i1 %67, label %5, label %68, !llvm.loop !6

68:                                               ; preds = %5, %0
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32* nocapture readonly %1, i32* nocapture readonly %2, i32* nocapture readonly %3, i32* nocapture readonly %4, i32* nocapture %5) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %8, label %73

8:                                                ; preds = %6
  %9 = zext i32 %0 to i64
  br label %10

10:                                               ; preds = %8, %10
  %11 = phi i64 [ 0, %8 ], [ %71, %10 ]
  %12 = getelementptr inbounds i32, i32* %1, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !2
  %14 = getelementptr inbounds i32, i32* %2, i64 %11
  %15 = load i32, i32* %14, align 4, !tbaa !2
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32* %4, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !2
  %19 = mul nsw i32 %18, %13
  %20 = getelementptr inbounds i32, i32* %3, i64 %11
  %21 = load i32, i32* %20, align 4, !tbaa !2
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32* %5, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !2
  %25 = add nsw i32 %24, %19
  store i32 %25, i32* %23, align 4, !tbaa !2
  %26 = or i64 %11, 1
  %27 = getelementptr inbounds i32, i32* %1, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !2
  %29 = getelementptr inbounds i32, i32* %2, i64 %26
  %30 = load i32, i32* %29, align 4, !tbaa !2
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32* %4, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !2
  %34 = mul nsw i32 %33, %28
  %35 = getelementptr inbounds i32, i32* %3, i64 %26
  %36 = load i32, i32* %35, align 4, !tbaa !2
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32* %5, i64 %37
  %39 = load i32, i32* %38, align 4, !tbaa !2
  %40 = add nsw i32 %39, %34
  store i32 %40, i32* %38, align 4, !tbaa !2
  %41 = or i64 %11, 2
  %42 = getelementptr inbounds i32, i32* %1, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !2
  %44 = getelementptr inbounds i32, i32* %2, i64 %41
  %45 = load i32, i32* %44, align 4, !tbaa !2
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32* %4, i64 %46
  %48 = load i32, i32* %47, align 4, !tbaa !2
  %49 = mul nsw i32 %48, %43
  %50 = getelementptr inbounds i32, i32* %3, i64 %41
  %51 = load i32, i32* %50, align 4, !tbaa !2
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32* %5, i64 %52
  %54 = load i32, i32* %53, align 4, !tbaa !2
  %55 = add nsw i32 %54, %49
  store i32 %55, i32* %53, align 4, !tbaa !2
  %56 = or i64 %11, 3
  %57 = getelementptr inbounds i32, i32* %1, i64 %56
  %58 = load i32, i32* %57, align 4, !tbaa !2
  %59 = getelementptr inbounds i32, i32* %2, i64 %56
  %60 = load i32, i32* %59, align 4, !tbaa !2
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32* %4, i64 %61
  %63 = load i32, i32* %62, align 4, !tbaa !2
  %64 = mul nsw i32 %63, %58
  %65 = getelementptr inbounds i32, i32* %3, i64 %56
  %66 = load i32, i32* %65, align 4, !tbaa !2
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32* %5, i64 %67
  %69 = load i32, i32* %68, align 4, !tbaa !2
  %70 = add nsw i32 %69, %64
  store i32 %70, i32* %68, align 4, !tbaa !2
  %71 = add nuw nsw i64 %11, 4
  %72 = icmp ult i64 %71, %9
  br i1 %72, label %10, label %73, !llvm.loop !6

73:                                               ; preds = %10, %6
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
