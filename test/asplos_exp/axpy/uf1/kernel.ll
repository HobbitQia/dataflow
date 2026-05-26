; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_ZZ4mainE1x = internal unnamed_addr global [1024 x i32] zeroinitializer, align 16
@_ZZ4mainE1y = internal unnamed_addr global [1024 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %9, %1 ]
  %3 = trunc i64 %2 to i32
  %4 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE1x, i64 0, i64 %2
  store i32 %3, i32* %4, align 4, !tbaa !5
  %5 = trunc i64 %2 to i16
  %6 = urem i16 %5, 7
  %7 = zext i16 %6 to i32
  %8 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE1y, i64 0, i64 %2
  store i32 %7, i32* %8, align 4, !tbaa !5
  %9 = add nuw nsw i64 %2, 1
  %10 = icmp eq i64 %9, 1024
  br i1 %10, label %11, label %1, !llvm.loop !9

11:                                               ; preds = %1, %11
  %12 = phi i64 [ %19, %11 ], [ 0, %1 ]
  %13 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE1x, i64 0, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !5
  %15 = mul nsw i32 %14, 3
  %16 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE1y, i64 0, i64 %12
  %17 = load i32, i32* %16, align 4, !tbaa !5
  %18 = add nsw i32 %15, %17
  store i32 %18, i32* %16, align 4, !tbaa !5
  %19 = add nuw nsw i64 %12, 1
  %20 = icmp eq i64 %19, 1024
  br i1 %20, label %21, label %11, !llvm.loop !12

21:                                               ; preds = %11
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPKiPi(i32* nocapture noundef readonly %0, i32* nocapture noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %2, %3
  %4 = phi i64 [ 0, %2 ], [ %11, %3 ]
  %5 = getelementptr inbounds i32, i32* %0, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !5
  %7 = mul nsw i32 %6, 3
  %8 = getelementptr inbounds i32, i32* %1, i64 %4
  %9 = load i32, i32* %8, align 4, !tbaa !5
  %10 = add nsw i32 %7, %9
  store i32 %10, i32* %8, align 4, !tbaa !5
  %11 = add nuw nsw i64 %4, 1
  %12 = icmp eq i64 %11, 1024
  br i1 %12, label %13, label %3, !llvm.loop !12

13:                                               ; preds = %3
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
