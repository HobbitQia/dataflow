; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_ZZ4mainE1A = internal unnamed_addr global [4096 x i32] zeroinitializer, align 16
@_ZZ4mainE2x1 = internal unnamed_addr global [64 x i32] zeroinitializer, align 16
@_ZZ4mainE2x2 = internal unnamed_addr global [64 x i32] zeroinitializer, align 16
@_ZZ4mainE2y1 = internal unnamed_addr global [64 x i32] zeroinitializer, align 16
@_ZZ4mainE2y2 = internal unnamed_addr global [64 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(256) bitcast ([64 x i32]* @_ZZ4mainE2x1 to i8*), i8 0, i64 256, i1 false), !tbaa !5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(256) bitcast ([64 x i32]* @_ZZ4mainE2x2 to i8*), i8 0, i64 256, i1 false), !tbaa !5
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %9, %1 ]
  %3 = getelementptr inbounds [64 x i32], [64 x i32]* @_ZZ4mainE2y1, i64 0, i64 %2
  %4 = trunc i64 %2 to i32
  %5 = add i32 %4, 3
  store i32 %5, i32* %3, align 4, !tbaa !5
  %6 = getelementptr inbounds [64 x i32], [64 x i32]* @_ZZ4mainE2y2, i64 0, i64 %2
  %7 = trunc i64 %2 to i32
  %8 = add i32 %7, 4
  store i32 %8, i32* %6, align 4, !tbaa !5
  %9 = add nuw nsw i64 %2, 1
  %10 = icmp eq i64 %9, 64
  br i1 %10, label %11, label %1, !llvm.loop !9

11:                                               ; preds = %1, %11
  %12 = phi i64 [ %19, %11 ], [ 0, %1 ]
  %13 = trunc i64 %12 to i32
  %14 = lshr i32 %13, 6
  %15 = and i32 %13, 63
  %16 = mul nuw nsw i32 %14, %15
  %17 = and i32 %16, 63
  %18 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1A, i64 0, i64 %12
  store i32 %17, i32* %18, align 4, !tbaa !5
  %19 = add nuw nsw i64 %12, 1
  %20 = icmp eq i64 %19, 4096
  br i1 %20, label %21, label %11, !llvm.loop !12

21:                                               ; preds = %11, %47
  %22 = phi i64 [ %48, %47 ], [ 0, %11 ]
  %23 = getelementptr inbounds [64 x i32], [64 x i32]* @_ZZ4mainE2y1, i64 0, i64 %22
  %24 = shl nsw i64 %22, 6
  %25 = getelementptr inbounds [64 x i32], [64 x i32]* @_ZZ4mainE2y2, i64 0, i64 %22
  %26 = load i32, i32* %23, align 4, !tbaa !5
  %27 = load i32, i32* %25, align 4, !tbaa !5
  br label %28

28:                                               ; preds = %28, %21
  %29 = phi i64 [ 0, %21 ], [ %45, %28 ]
  %30 = getelementptr inbounds [64 x i32], [64 x i32]* @_ZZ4mainE2x1, i64 0, i64 %29
  %31 = load i32, i32* %30, align 4, !tbaa !5
  %32 = shl nuw nsw i64 %29, 6
  %33 = add nuw nsw i64 %32, %22
  %34 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1A, i64 0, i64 %33
  %35 = load i32, i32* %34, align 4, !tbaa !5
  %36 = mul nsw i32 %26, %35
  %37 = add nsw i32 %36, %31
  store i32 %37, i32* %30, align 4, !tbaa !5
  %38 = getelementptr inbounds [64 x i32], [64 x i32]* @_ZZ4mainE2x2, i64 0, i64 %29
  %39 = load i32, i32* %38, align 4, !tbaa !5
  %40 = add nuw nsw i64 %29, %24
  %41 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1A, i64 0, i64 %40
  %42 = load i32, i32* %41, align 4, !tbaa !5
  %43 = mul nsw i32 %27, %42
  %44 = add nsw i32 %43, %39
  store i32 %44, i32* %38, align 4, !tbaa !5
  %45 = add nuw nsw i64 %29, 1
  %46 = icmp eq i64 %45, 64
  br i1 %46, label %47, label %28, !llvm.loop !13

47:                                               ; preds = %28
  %48 = add nuw nsw i64 %22, 1
  %49 = icmp eq i64 %48, 64
  br i1 %49, label %50, label %21, !llvm.loop !14

50:                                               ; preds = %47
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPiS_PKiS1_S1_(i32* nocapture noundef %0, i32* nocapture noundef %1, i32* nocapture noundef readonly %2, i32* nocapture noundef readonly %3, i32* nocapture noundef readonly %4) local_unnamed_addr #0 {
  br label %6

6:                                                ; preds = %5, %32
  %7 = phi i64 [ 0, %5 ], [ %33, %32 ]
  %8 = getelementptr inbounds i32, i32* %3, i64 %7
  %9 = shl nsw i64 %7, 6
  %10 = getelementptr inbounds i32, i32* %4, i64 %7
  br label %11

11:                                               ; preds = %6, %11
  %12 = phi i64 [ 0, %6 ], [ %30, %11 ]
  %13 = getelementptr inbounds i32, i32* %0, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !5
  %15 = shl nuw nsw i64 %12, 6
  %16 = add nuw nsw i64 %15, %7
  %17 = getelementptr inbounds i32, i32* %2, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !5
  %19 = load i32, i32* %8, align 4, !tbaa !5
  %20 = mul nsw i32 %19, %18
  %21 = add nsw i32 %20, %14
  store i32 %21, i32* %13, align 4, !tbaa !5
  %22 = getelementptr inbounds i32, i32* %1, i64 %12
  %23 = load i32, i32* %22, align 4, !tbaa !5
  %24 = add nuw nsw i64 %12, %9
  %25 = getelementptr inbounds i32, i32* %2, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !5
  %27 = load i32, i32* %10, align 4, !tbaa !5
  %28 = mul nsw i32 %27, %26
  %29 = add nsw i32 %28, %23
  store i32 %29, i32* %22, align 4, !tbaa !5
  %30 = add nuw nsw i64 %12, 1
  %31 = icmp eq i64 %30, 64
  br i1 %31, label %32, label %11, !llvm.loop !13

32:                                               ; preds = %11
  %33 = add nuw nsw i64 %7, 1
  %34 = icmp eq i64 %33, 64
  br i1 %34, label %35, label %6, !llvm.loop !14

35:                                               ; preds = %32
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
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !10, !11}
