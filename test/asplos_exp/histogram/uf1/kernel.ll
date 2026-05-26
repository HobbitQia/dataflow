; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@input_data = dso_local local_unnamed_addr global [1024 x i32] zeroinitializer, align 16
@hist = dso_local local_unnamed_addr global [16 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %5, %1 ]
  %3 = getelementptr inbounds [1024 x i32], [1024 x i32]* @input_data, i64 0, i64 %2
  %4 = trunc i64 %2 to i32
  store i32 %4, i32* %3, align 4, !tbaa !5
  %5 = add nuw nsw i64 %2, 1
  %6 = icmp eq i64 %5, 1024
  br i1 %6, label %7, label %1, !llvm.loop !9

7:                                                ; preds = %1
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) bitcast ([16 x i32]* @hist to i8*), i8 0, i64 64, i1 false), !tbaa !5
  br label %8

8:                                                ; preds = %7, %8
  %9 = phi i64 [ %18, %8 ], [ 0, %7 ]
  %10 = getelementptr inbounds [1024 x i32], [1024 x i32]* @input_data, i64 0, i64 %9
  %11 = load i32, i32* %10, align 4, !tbaa !5
  %12 = shl nsw i32 %11, 4
  %13 = sdiv i32 %12, 1023
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [16 x i32], [16 x i32]* @hist, i64 0, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !5
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %15, align 4, !tbaa !5
  %18 = add nuw nsw i64 %9, 1
  %19 = icmp eq i64 %18, 1024
  br i1 %19, label %20, label %8, !llvm.loop !12

20:                                               ; preds = %8
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPiS_(i32* nocapture noundef readonly %0, i32* nocapture noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %2, %3
  %4 = phi i64 [ 0, %2 ], [ %13, %3 ]
  %5 = getelementptr inbounds i32, i32* %0, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !5
  %7 = shl nsw i32 %6, 4
  %8 = sdiv i32 %7, 1023
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i32, i32* %1, i64 %9
  %11 = load i32, i32* %10, align 4, !tbaa !5
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %10, align 4, !tbaa !5
  %13 = add nuw nsw i64 %4, 1
  %14 = icmp eq i64 %13, 1024
  br i1 %14, label %15, label %3, !llvm.loop !12

15:                                               ; preds = %3
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn writeonly }

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
