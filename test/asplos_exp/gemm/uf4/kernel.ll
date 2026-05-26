; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_ZZ4mainE1C = internal unnamed_addr global [4096 x i32] zeroinitializer, align 16
@_ZZ4mainE1A = internal unnamed_addr global [4096 x i32] zeroinitializer, align 16
@_ZZ4mainE1B = internal unnamed_addr global [4096 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16384) bitcast ([4096 x i32]* @_ZZ4mainE1C to i8*), i8 0, i64 16384, i1 false), !tbaa !5
  br label %1

1:                                                ; preds = %0, %15
  %2 = phi i64 [ 0, %0 ], [ %16, %15 ]
  %3 = shl nsw i64 %2, 6
  br label %4

4:                                                ; preds = %1, %4
  %5 = phi i64 [ 0, %1 ], [ %13, %4 ]
  %6 = add nuw nsw i64 %5, %3
  %7 = add nuw nsw i64 %5, %2
  %8 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1A, i64 0, i64 %6
  %9 = trunc i64 %7 to i32
  store i32 %9, i32* %8, align 4, !tbaa !5
  %10 = sub nsw i64 %2, %5
  %11 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1B, i64 0, i64 %6
  %12 = trunc i64 %10 to i32
  store i32 %12, i32* %11, align 4, !tbaa !5
  %13 = add nuw nsw i64 %5, 1
  %14 = icmp eq i64 %13, 64
  br i1 %14, label %15, label %4, !llvm.loop !9

15:                                               ; preds = %4
  %16 = add nuw nsw i64 %2, 1
  %17 = icmp eq i64 %16, 64
  br i1 %17, label %18, label %1, !llvm.loop !12

18:                                               ; preds = %15, %47
  %19 = phi i64 [ %48, %47 ], [ 0, %15 ]
  %20 = shl nsw i64 %19, 6
  br label %21

21:                                               ; preds = %44, %18
  %22 = phi i64 [ 0, %18 ], [ %45, %44 ]
  %23 = add nuw nsw i64 %22, %20
  %24 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1A, i64 0, i64 %23
  %25 = shl nsw i64 %22, 6
  %26 = load i32, i32* %24, align 4, !tbaa !5
  %27 = insertelement <4 x i32> poison, i32 %26, i64 0
  %28 = shufflevector <4 x i32> %27, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %29

29:                                               ; preds = %29, %21
  %30 = phi i64 [ 0, %21 ], [ %42, %29 ]
  %31 = add nuw nsw i64 %30, %25
  %32 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1B, i64 0, i64 %31
  %33 = add nuw nsw i64 %30, %20
  %34 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1C, i64 0, i64 %33
  %35 = bitcast i32* %32 to <4 x i32>*
  %36 = load <4 x i32>, <4 x i32>* %35, align 16, !tbaa !5
  %37 = mul nsw <4 x i32> %36, %28
  %38 = bitcast i32* %34 to <4 x i32>*
  %39 = load <4 x i32>, <4 x i32>* %38, align 16, !tbaa !5
  %40 = add nsw <4 x i32> %39, %37
  %41 = bitcast i32* %34 to <4 x i32>*
  store <4 x i32> %40, <4 x i32>* %41, align 16, !tbaa !5
  %42 = add nuw nsw i64 %30, 4
  %43 = icmp ult i64 %30, 60
  br i1 %43, label %29, label %44, !llvm.loop !13

44:                                               ; preds = %29
  %45 = add nuw nsw i64 %22, 1
  %46 = icmp eq i64 %45, 64
  br i1 %46, label %47, label %21, !llvm.loop !14

47:                                               ; preds = %44
  %48 = add nuw nsw i64 %19, 1
  %49 = icmp eq i64 %48, 64
  br i1 %49, label %50, label %18, !llvm.loop !15

50:                                               ; preds = %47
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPiS_S_(i32* nocapture noundef %0, i32* nocapture noundef readonly %1, i32* nocapture noundef readonly %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %3, %55
  %5 = phi i64 [ 0, %3 ], [ %56, %55 ]
  %6 = shl nsw i64 %5, 6
  br label %7

7:                                                ; preds = %4, %52
  %8 = phi i64 [ 0, %4 ], [ %53, %52 ]
  %9 = add nuw nsw i64 %8, %6
  %10 = getelementptr inbounds i32, i32* %1, i64 %9
  %11 = shl nsw i64 %8, 6
  br label %12

12:                                               ; preds = %7, %12
  %13 = phi i64 [ 0, %7 ], [ %50, %12 ]
  %14 = load i32, i32* %10, align 4, !tbaa !5
  %15 = add nuw nsw i64 %13, %11
  %16 = getelementptr inbounds i32, i32* %2, i64 %15
  %17 = load i32, i32* %16, align 4, !tbaa !5
  %18 = mul nsw i32 %17, %14
  %19 = add nuw nsw i64 %13, %6
  %20 = getelementptr inbounds i32, i32* %0, i64 %19
  %21 = load i32, i32* %20, align 4, !tbaa !5
  %22 = add nsw i32 %21, %18
  store i32 %22, i32* %20, align 4, !tbaa !5
  %23 = load i32, i32* %10, align 4, !tbaa !5
  %24 = or i64 %15, 1
  %25 = getelementptr inbounds i32, i32* %2, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !5
  %27 = mul nsw i32 %26, %23
  %28 = or i64 %19, 1
  %29 = getelementptr inbounds i32, i32* %0, i64 %28
  %30 = load i32, i32* %29, align 4, !tbaa !5
  %31 = add nsw i32 %30, %27
  store i32 %31, i32* %29, align 4, !tbaa !5
  %32 = load i32, i32* %10, align 4, !tbaa !5
  %33 = or i64 %15, 2
  %34 = getelementptr inbounds i32, i32* %2, i64 %33
  %35 = load i32, i32* %34, align 4, !tbaa !5
  %36 = mul nsw i32 %35, %32
  %37 = or i64 %19, 2
  %38 = getelementptr inbounds i32, i32* %0, i64 %37
  %39 = load i32, i32* %38, align 4, !tbaa !5
  %40 = add nsw i32 %39, %36
  store i32 %40, i32* %38, align 4, !tbaa !5
  %41 = load i32, i32* %10, align 4, !tbaa !5
  %42 = or i64 %15, 3
  %43 = getelementptr inbounds i32, i32* %2, i64 %42
  %44 = load i32, i32* %43, align 4, !tbaa !5
  %45 = mul nsw i32 %44, %41
  %46 = or i64 %19, 3
  %47 = getelementptr inbounds i32, i32* %0, i64 %46
  %48 = load i32, i32* %47, align 4, !tbaa !5
  %49 = add nsw i32 %48, %45
  store i32 %49, i32* %47, align 4, !tbaa !5
  %50 = add nuw nsw i64 %13, 4
  %51 = icmp ult i64 %13, 60
  br i1 %51, label %12, label %52, !llvm.loop !13

52:                                               ; preds = %12
  %53 = add nuw nsw i64 %8, 1
  %54 = icmp eq i64 %53, 64
  br i1 %54, label %55, label %7, !llvm.loop !14

55:                                               ; preds = %52
  %56 = add nuw nsw i64 %5, 1
  %57 = icmp eq i64 %56, 64
  br i1 %57, label %58, label %4, !llvm.loop !15

58:                                               ; preds = %55
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
!15 = distinct !{!15, !10, !11}
