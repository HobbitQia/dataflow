; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_ZZ4mainE11coefficient = internal unnamed_addr constant [16 x i32] [i32 25, i32 150, i32 375, i32 -225, i32 50, i32 75, i32 -300, i32 125, i32 20, i32 22, i32 230, i32 210, i32 48, i32 28, i32 -240, i32 560], align 16
@_ZZ4mainE5state = internal unnamed_addr global [12 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %3, %1 ]
  %3 = add nuw nsw i64 %2, 1
  %4 = getelementptr inbounds [12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 %2
  %5 = trunc i64 %3 to i32
  store i32 %5, i32* %4, align 4, !tbaa !5
  %6 = icmp eq i64 %3, 12
  br i1 %6, label %7, label %1, !llvm.loop !9

7:                                                ; preds = %1
  %8 = load i32, i32* getelementptr inbounds ([12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 0), align 16, !tbaa !5
  %9 = load i32, i32* getelementptr inbounds ([12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 1), align 4, !tbaa !5
  br label %10

10:                                               ; preds = %10, %7
  %11 = phi i32 [ %9, %7 ], [ %74, %10 ]
  %12 = phi i32 [ %8, %7 ], [ %71, %10 ]
  %13 = phi i1 [ true, %7 ], [ false, %10 ]
  %14 = phi i64 [ 0, %7 ], [ 4, %10 ]
  %15 = shl nuw nsw i64 %14, 1
  %16 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %15
  %17 = load i32, i32* %16, align 16, !tbaa !5
  %18 = or i64 %15, 1
  %19 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %18
  %20 = load i32, i32* %19, align 4, !tbaa !5
  %21 = or i64 %14, 2
  %22 = getelementptr inbounds [12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 %21
  %23 = load i32, i32* %22, align 8, !tbaa !5
  store i32 %11, i32* %22, align 8, !tbaa !5
  %24 = mul nsw i32 %20, %12
  %25 = mul nsw i32 %23, %17
  %26 = sub nsw i32 %24, %25
  %27 = mul nsw i32 %23, %20
  %28 = mul nsw i32 %17, %12
  %29 = add nsw i32 %27, %28
  %30 = or i64 %15, 2
  %31 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %30
  %32 = load i32, i32* %31, align 8, !tbaa !5
  %33 = or i64 %15, 3
  %34 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %33
  %35 = load i32, i32* %34, align 4, !tbaa !5
  %36 = or i64 %14, 3
  %37 = getelementptr inbounds [12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 %36
  %38 = load i32, i32* %37, align 4, !tbaa !5
  store i32 %29, i32* %37, align 4, !tbaa !5
  %39 = mul nsw i32 %35, %26
  %40 = mul nsw i32 %38, %32
  %41 = sub nsw i32 %39, %40
  %42 = mul nsw i32 %38, %35
  %43 = mul nsw i32 %32, %26
  %44 = add nsw i32 %42, %43
  %45 = shl nuw nsw i64 %21, 1
  %46 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %45
  %47 = load i32, i32* %46, align 16, !tbaa !5
  %48 = or i64 %45, 1
  %49 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %48
  %50 = load i32, i32* %49, align 4, !tbaa !5
  %51 = add nuw nsw i64 %14, 4
  %52 = getelementptr inbounds [12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 %51
  %53 = load i32, i32* %52, align 16, !tbaa !5
  store i32 %44, i32* %52, align 16, !tbaa !5
  %54 = mul nsw i32 %50, %41
  %55 = mul nsw i32 %53, %47
  %56 = sub nsw i32 %54, %55
  %57 = mul nsw i32 %53, %50
  %58 = mul nsw i32 %47, %41
  %59 = add nsw i32 %57, %58
  %60 = shl nuw nsw i64 %36, 1
  %61 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %60
  %62 = load i32, i32* %61, align 8, !tbaa !5
  %63 = or i64 %60, 1
  %64 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %63
  %65 = load i32, i32* %64, align 4, !tbaa !5
  %66 = add nuw nsw i64 %14, 5
  %67 = getelementptr inbounds [12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 %66
  %68 = load i32, i32* %67, align 4, !tbaa !5
  store i32 %59, i32* %67, align 4, !tbaa !5
  %69 = mul nsw i32 %65, %56
  %70 = mul nsw i32 %68, %62
  %71 = sub nsw i32 %69, %70
  %72 = mul nsw i32 %68, %65
  %73 = mul nsw i32 %62, %56
  %74 = add nsw i32 %72, %73
  br i1 %13, label %10, label %75, !llvm.loop !12

75:                                               ; preds = %10
  store i32 %71, i32* getelementptr inbounds ([12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 0), align 16, !tbaa !5
  store i32 %74, i32* getelementptr inbounds ([12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 1), align 4, !tbaa !5
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPiPKi(i32* nocapture noundef %0, i32* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds i32, i32* %0, i64 1
  %4 = load i32, i32* %0, align 4, !tbaa !5
  %5 = load i32, i32* %3, align 4, !tbaa !5
  br label %6

6:                                                ; preds = %2, %6
  %7 = phi i32 [ %5, %2 ], [ %70, %6 ]
  %8 = phi i32 [ %4, %2 ], [ %67, %6 ]
  %9 = phi i1 [ true, %2 ], [ false, %6 ]
  %10 = phi i64 [ 0, %2 ], [ 4, %6 ]
  %11 = shl nuw nsw i64 %10, 1
  %12 = getelementptr inbounds i32, i32* %1, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !5
  %14 = or i64 %11, 1
  %15 = getelementptr inbounds i32, i32* %1, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !5
  %17 = or i64 %10, 2
  %18 = getelementptr inbounds i32, i32* %0, i64 %17
  %19 = load i32, i32* %18, align 4, !tbaa !5
  store i32 %7, i32* %18, align 4, !tbaa !5
  %20 = mul nsw i32 %8, %16
  %21 = mul nsw i32 %19, %13
  %22 = sub nsw i32 %20, %21
  %23 = mul nsw i32 %19, %16
  %24 = mul nsw i32 %8, %13
  %25 = add nsw i32 %23, %24
  %26 = or i64 %11, 2
  %27 = getelementptr inbounds i32, i32* %1, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !5
  %29 = or i64 %11, 3
  %30 = getelementptr inbounds i32, i32* %1, i64 %29
  %31 = load i32, i32* %30, align 4, !tbaa !5
  %32 = or i64 %10, 3
  %33 = getelementptr inbounds i32, i32* %0, i64 %32
  %34 = load i32, i32* %33, align 4, !tbaa !5
  store i32 %25, i32* %33, align 4, !tbaa !5
  %35 = mul nsw i32 %31, %22
  %36 = mul nsw i32 %34, %28
  %37 = sub nsw i32 %35, %36
  %38 = mul nsw i32 %34, %31
  %39 = mul nsw i32 %28, %22
  %40 = add nsw i32 %38, %39
  %41 = shl nuw nsw i64 %17, 1
  %42 = getelementptr inbounds i32, i32* %1, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !5
  %44 = or i64 %41, 1
  %45 = getelementptr inbounds i32, i32* %1, i64 %44
  %46 = load i32, i32* %45, align 4, !tbaa !5
  %47 = add nuw nsw i64 %10, 4
  %48 = getelementptr inbounds i32, i32* %0, i64 %47
  %49 = load i32, i32* %48, align 4, !tbaa !5
  store i32 %40, i32* %48, align 4, !tbaa !5
  %50 = mul nsw i32 %46, %37
  %51 = mul nsw i32 %49, %43
  %52 = sub nsw i32 %50, %51
  %53 = mul nsw i32 %49, %46
  %54 = mul nsw i32 %43, %37
  %55 = add nsw i32 %53, %54
  %56 = shl nuw nsw i64 %32, 1
  %57 = getelementptr inbounds i32, i32* %1, i64 %56
  %58 = load i32, i32* %57, align 4, !tbaa !5
  %59 = or i64 %56, 1
  %60 = getelementptr inbounds i32, i32* %1, i64 %59
  %61 = load i32, i32* %60, align 4, !tbaa !5
  %62 = add nuw nsw i64 %10, 5
  %63 = getelementptr inbounds i32, i32* %0, i64 %62
  %64 = load i32, i32* %63, align 4, !tbaa !5
  store i32 %55, i32* %63, align 4, !tbaa !5
  %65 = mul nsw i32 %61, %52
  %66 = mul nsw i32 %64, %58
  %67 = sub nsw i32 %65, %66
  store i32 %67, i32* %0, align 4, !tbaa !5
  %68 = mul nsw i32 %64, %61
  %69 = mul nsw i32 %58, %52
  %70 = add nsw i32 %68, %69
  store i32 %70, i32* %3, align 4, !tbaa !5
  br i1 %9, label %6, label %71, !llvm.loop !12

71:                                               ; preds = %6
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
