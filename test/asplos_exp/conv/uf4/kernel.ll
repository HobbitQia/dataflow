; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPKiS0_Pi(i32* nocapture noundef readonly %0, i32* nocapture noundef readonly %1, i32* nocapture noundef %2) local_unnamed_addr #0 {
  store i32 0, i32* %2, align 4, !tbaa !5
  br label %4

4:                                                ; preds = %3, %4
  %5 = phi i32 [ 0, %3 ], [ %15, %4 ]
  %6 = phi i64 [ 0, %3 ], [ %16, %4 ]
  %7 = getelementptr inbounds i32, i32* %0, i64 %6
  %8 = getelementptr inbounds i32, i32* %1, i64 %6
  %9 = bitcast i32* %7 to <4 x i32>*
  %10 = load <4 x i32>, <4 x i32>* %9, align 4, !tbaa !5
  %11 = bitcast i32* %8 to <4 x i32>*
  %12 = load <4 x i32>, <4 x i32>* %11, align 4, !tbaa !5
  %13 = mul nsw <4 x i32> %12, %10
  %14 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %13)
  %15 = add nsw i32 %14, %5
  store i32 %15, i32* %2, align 4, !tbaa !5
  %16 = add nuw nsw i64 %6, 4
  %17 = icmp ult i64 %6, 1020
  br i1 %17, label %4, label %18, !llvm.loop !9

18:                                               ; preds = %4
  ret void
}

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone willreturn }

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
