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
  %11 = phi i32 [ %9, %7 ], [ %43, %10 ]
  %12 = phi i32 [ %8, %7 ], [ %40, %10 ]
  %13 = phi i64 [ 0, %7 ], [ %20, %10 ]
  %14 = shl nuw nsw i64 %13, 1
  %15 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %14
  %16 = load i32, i32* %15, align 16, !tbaa !5
  %17 = or i64 %14, 1
  %18 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %17
  %19 = load i32, i32* %18, align 4, !tbaa !5
  %20 = add nuw nsw i64 %13, 2
  %21 = getelementptr inbounds [12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 %20
  %22 = load i32, i32* %21, align 8, !tbaa !5
  store i32 %11, i32* %21, align 8, !tbaa !5
  %23 = mul nsw i32 %19, %12
  %24 = mul nsw i32 %22, %16
  %25 = sub nsw i32 %23, %24
  %26 = mul nsw i32 %22, %19
  %27 = mul nsw i32 %16, %12
  %28 = add nsw i32 %26, %27
  %29 = or i64 %14, 2
  %30 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %29
  %31 = load i32, i32* %30, align 8, !tbaa !5
  %32 = or i64 %14, 3
  %33 = getelementptr inbounds [16 x i32], [16 x i32]* @_ZZ4mainE11coefficient, i64 0, i64 %32
  %34 = load i32, i32* %33, align 4, !tbaa !5
  %35 = add nuw nsw i64 %13, 3
  %36 = getelementptr inbounds [12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 %35
  %37 = load i32, i32* %36, align 4, !tbaa !5
  store i32 %28, i32* %36, align 4, !tbaa !5
  %38 = mul nsw i32 %34, %25
  %39 = mul nsw i32 %37, %31
  %40 = sub nsw i32 %38, %39
  store i32 %40, i32* getelementptr inbounds ([12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 0), align 16, !tbaa !5
  %41 = mul nsw i32 %37, %34
  %42 = mul nsw i32 %31, %25
  %43 = add nsw i32 %41, %42
  store i32 %43, i32* getelementptr inbounds ([12 x i32], [12 x i32]* @_ZZ4mainE5state, i64 0, i64 1), align 4, !tbaa !5
  %44 = icmp ult i64 %13, 6
  br i1 %44, label %10, label %45, !llvm.loop !12

45:                                               ; preds = %10
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPiPKi(i32* nocapture noundef %0, i32* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds i32, i32* %0, i64 1
  %4 = load i32, i32* %0, align 4, !tbaa !5
  %5 = load i32, i32* %3, align 4, !tbaa !5
  br label %6

6:                                                ; preds = %2, %6
  %7 = phi i32 [ %5, %2 ], [ %39, %6 ]
  %8 = phi i32 [ %4, %2 ], [ %36, %6 ]
  %9 = phi i64 [ 0, %2 ], [ %16, %6 ]
  %10 = shl nuw nsw i64 %9, 1
  %11 = getelementptr inbounds i32, i32* %1, i64 %10
  %12 = load i32, i32* %11, align 4, !tbaa !5
  %13 = or i64 %10, 1
  %14 = getelementptr inbounds i32, i32* %1, i64 %13
  %15 = load i32, i32* %14, align 4, !tbaa !5
  %16 = add nuw nsw i64 %9, 2
  %17 = getelementptr inbounds i32, i32* %0, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !5
  store i32 %7, i32* %17, align 4, !tbaa !5
  %19 = mul nsw i32 %8, %15
  %20 = mul nsw i32 %18, %12
  %21 = sub nsw i32 %19, %20
  %22 = mul nsw i32 %18, %15
  %23 = mul nsw i32 %8, %12
  %24 = add nsw i32 %22, %23
  %25 = or i64 %10, 2
  %26 = getelementptr inbounds i32, i32* %1, i64 %25
  %27 = load i32, i32* %26, align 4, !tbaa !5
  %28 = or i64 %10, 3
  %29 = getelementptr inbounds i32, i32* %1, i64 %28
  %30 = load i32, i32* %29, align 4, !tbaa !5
  %31 = add nuw nsw i64 %9, 3
  %32 = getelementptr inbounds i32, i32* %0, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !5
  store i32 %24, i32* %32, align 4, !tbaa !5
  %34 = mul nsw i32 %30, %21
  %35 = mul nsw i32 %33, %27
  %36 = sub nsw i32 %34, %35
  store i32 %36, i32* %0, align 4, !tbaa !5
  %37 = mul nsw i32 %33, %30
  %38 = mul nsw i32 %27, %21
  %39 = add nsw i32 %37, %38
  store i32 %39, i32* %3, align 4, !tbaa !5
  %40 = icmp ult i64 %9, 6
  br i1 %40, label %6, label %41, !llvm.loop !12

41:                                               ; preds = %6
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
