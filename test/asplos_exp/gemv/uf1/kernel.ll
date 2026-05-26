; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_ZZ4mainE1A = internal unnamed_addr global [262144 x i32] zeroinitializer, align 16
@_ZZ4mainE1x = internal unnamed_addr global [512 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %17
  %2 = phi i64 [ 0, %0 ], [ %18, %17 ]
  %3 = trunc i64 %2 to i16
  %4 = urem i16 %3, 11
  %5 = zext i16 %4 to i32
  %6 = getelementptr inbounds [512 x i32], [512 x i32]* @_ZZ4mainE1x, i64 0, i64 %2
  store i32 %5, i32* %6, align 4, !tbaa !5
  %7 = shl nsw i64 %2, 9
  br label %8

8:                                                ; preds = %1, %8
  %9 = phi i64 [ 0, %1 ], [ %15, %8 ]
  %10 = add nuw nsw i64 %9, %2
  %11 = trunc i64 %10 to i32
  %12 = urem i32 %11, 13
  %13 = add nuw nsw i64 %9, %7
  %14 = getelementptr inbounds [262144 x i32], [262144 x i32]* @_ZZ4mainE1A, i64 0, i64 %13
  store i32 %12, i32* %14, align 4, !tbaa !5
  %15 = add nuw nsw i64 %9, 1
  %16 = icmp eq i64 %15, 512
  br i1 %16, label %17, label %8, !llvm.loop !9

17:                                               ; preds = %8
  %18 = add nuw nsw i64 %2, 1
  %19 = icmp eq i64 %18, 512
  br i1 %19, label %20, label %1, !llvm.loop !12

20:                                               ; preds = %17
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPKiS0_Pi(i32* nocapture noundef readonly %0, i32* nocapture noundef readonly %1, i32* nocapture noundef writeonly %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %3, %19
  %5 = phi i64 [ 0, %3 ], [ %21, %19 ]
  %6 = shl nsw i64 %5, 9
  br label %7

7:                                                ; preds = %4, %7
  %8 = phi i64 [ 0, %4 ], [ %17, %7 ]
  %9 = phi i32 [ 0, %4 ], [ %16, %7 ]
  %10 = add nuw nsw i64 %8, %6
  %11 = getelementptr inbounds i32, i32* %0, i64 %10
  %12 = load i32, i32* %11, align 4, !tbaa !5
  %13 = getelementptr inbounds i32, i32* %1, i64 %8
  %14 = load i32, i32* %13, align 4, !tbaa !5
  %15 = mul nsw i32 %14, %12
  %16 = add nsw i32 %15, %9
  %17 = add nuw nsw i64 %8, 1
  %18 = icmp eq i64 %17, 512
  br i1 %18, label %19, label %7, !llvm.loop !13

19:                                               ; preds = %7
  %20 = getelementptr inbounds i32, i32* %2, i64 %5
  store i32 %16, i32* %20, align 4, !tbaa !5
  %21 = add nuw nsw i64 %5, 1
  %22 = icmp eq i64 %21, 512
  br i1 %22, label %23, label %4, !llvm.loop !14

23:                                               ; preds = %19
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
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !10, !11}
