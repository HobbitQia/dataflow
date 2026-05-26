; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@A = dso_local local_unnamed_addr global [256 x [256 x i32]] zeroinitializer, align 16
@r = dso_local local_unnamed_addr global [256 x i32] zeroinitializer, align 16
@p = dso_local local_unnamed_addr global [256 x i32] zeroinitializer, align 16
@s = dso_local local_unnamed_addr global [256 x i32] zeroinitializer, align 16
@q = dso_local local_unnamed_addr global [256 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %13
  %2 = phi i64 [ 0, %0 ], [ %14, %13 ]
  %3 = getelementptr inbounds [256 x i32], [256 x i32]* @r, i64 0, i64 %2
  %4 = trunc i64 %2 to i32
  store i32 %4, i32* %3, align 4, !tbaa !5
  br label %5

5:                                                ; preds = %1, %5
  %6 = phi i64 [ 0, %1 ], [ %7, %5 ]
  %7 = add nuw nsw i64 %6, 1
  %8 = mul nuw nsw i64 %7, %2
  %9 = trunc i64 %8 to i32
  %10 = and i32 %9, 255
  %11 = getelementptr inbounds [256 x [256 x i32]], [256 x [256 x i32]]* @A, i64 0, i64 %2, i64 %6
  store i32 %10, i32* %11, align 4, !tbaa !5
  %12 = icmp eq i64 %7, 256
  br i1 %12, label %13, label %5, !llvm.loop !9

13:                                               ; preds = %5
  %14 = add nuw nsw i64 %2, 1
  %15 = icmp eq i64 %14, 256
  br i1 %15, label %16, label %1, !llvm.loop !12

16:                                               ; preds = %13, %16
  %17 = phi i64 [ %20, %16 ], [ 0, %13 ]
  %18 = getelementptr inbounds [256 x i32], [256 x i32]* @p, i64 0, i64 %17
  %19 = trunc i64 %17 to i32
  store i32 %19, i32* %18, align 4, !tbaa !5
  %20 = add nuw nsw i64 %17, 1
  %21 = icmp eq i64 %20, 256
  br i1 %21, label %22, label %16, !llvm.loop !13

22:                                               ; preds = %16
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(1024) bitcast ([256 x i32]* @s to i8*), i8 0, i64 1024, i1 false) #2, !tbaa !5
  br label %23

23:                                               ; preds = %54, %22
  %24 = phi i64 [ 0, %22 ], [ %55, %54 ]
  %25 = getelementptr inbounds [256 x i32], [256 x i32]* @q, i64 0, i64 %24
  %26 = getelementptr inbounds [256 x i32], [256 x i32]* @r, i64 0, i64 %24
  %27 = load i32, i32* %26, align 4, !tbaa !5
  br label %28

28:                                               ; preds = %28, %23
  %29 = phi i32 [ 0, %23 ], [ %51, %28 ]
  %30 = phi i64 [ 0, %23 ], [ %52, %28 ]
  %31 = getelementptr inbounds [256 x i32], [256 x i32]* @s, i64 0, i64 %30
  %32 = load i32, i32* %31, align 8, !tbaa !5
  %33 = getelementptr inbounds [256 x [256 x i32]], [256 x [256 x i32]]* @A, i64 0, i64 %24, i64 %30
  %34 = load i32, i32* %33, align 8, !tbaa !5
  %35 = mul nsw i32 %34, %27
  %36 = add nsw i32 %35, %32
  store i32 %36, i32* %31, align 8, !tbaa !5
  %37 = getelementptr inbounds [256 x i32], [256 x i32]* @p, i64 0, i64 %30
  %38 = load i32, i32* %37, align 8, !tbaa !5
  %39 = mul nsw i32 %38, %34
  %40 = add nsw i32 %39, %29
  %41 = or i64 %30, 1
  %42 = getelementptr inbounds [256 x i32], [256 x i32]* @s, i64 0, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !5
  %44 = getelementptr inbounds [256 x [256 x i32]], [256 x [256 x i32]]* @A, i64 0, i64 %24, i64 %41
  %45 = load i32, i32* %44, align 4, !tbaa !5
  %46 = mul nsw i32 %45, %27
  %47 = add nsw i32 %46, %43
  store i32 %47, i32* %42, align 4, !tbaa !5
  %48 = getelementptr inbounds [256 x i32], [256 x i32]* @p, i64 0, i64 %41
  %49 = load i32, i32* %48, align 4, !tbaa !5
  %50 = mul nsw i32 %49, %45
  %51 = add nsw i32 %50, %40
  %52 = add nuw nsw i64 %30, 2
  %53 = icmp ult i64 %30, 254
  br i1 %53, label %28, label %54, !llvm.loop !14

54:                                               ; preds = %28
  store i32 %51, i32* %25, align 4, !tbaa !5
  %55 = add nuw nsw i64 %24, 1
  %56 = icmp eq i64 %55, 256
  br i1 %56, label %57, label %23, !llvm.loop !15

57:                                               ; preds = %54
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPA256_iPiS1_S1_S1_([256 x i32]* nocapture noundef readonly %0, i32* nocapture noundef %1, i32* nocapture noundef %2, i32* nocapture noundef readonly %3, i32* nocapture noundef readonly %4) local_unnamed_addr #0 {
  %6 = bitcast i32* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(1024) %6, i8 0, i64 1024, i1 false), !tbaa !5
  br label %7

7:                                                ; preds = %5, %42
  %8 = phi i64 [ 0, %5 ], [ %43, %42 ]
  %9 = getelementptr inbounds i32, i32* %2, i64 %8
  store i32 0, i32* %9, align 4, !tbaa !5
  %10 = getelementptr inbounds i32, i32* %4, i64 %8
  br label %11

11:                                               ; preds = %7, %11
  %12 = phi i64 [ 0, %7 ], [ %40, %11 ]
  %13 = getelementptr inbounds i32, i32* %1, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !5
  %15 = load i32, i32* %10, align 4, !tbaa !5
  %16 = getelementptr inbounds [256 x i32], [256 x i32]* %0, i64 %8, i64 %12
  %17 = load i32, i32* %16, align 4, !tbaa !5
  %18 = mul nsw i32 %17, %15
  %19 = add nsw i32 %18, %14
  store i32 %19, i32* %13, align 4, !tbaa !5
  %20 = load i32, i32* %9, align 4, !tbaa !5
  %21 = load i32, i32* %16, align 4, !tbaa !5
  %22 = getelementptr inbounds i32, i32* %3, i64 %12
  %23 = load i32, i32* %22, align 4, !tbaa !5
  %24 = mul nsw i32 %23, %21
  %25 = add nsw i32 %24, %20
  store i32 %25, i32* %9, align 4, !tbaa !5
  %26 = or i64 %12, 1
  %27 = getelementptr inbounds i32, i32* %1, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !5
  %29 = load i32, i32* %10, align 4, !tbaa !5
  %30 = getelementptr inbounds [256 x i32], [256 x i32]* %0, i64 %8, i64 %26
  %31 = load i32, i32* %30, align 4, !tbaa !5
  %32 = mul nsw i32 %31, %29
  %33 = add nsw i32 %32, %28
  store i32 %33, i32* %27, align 4, !tbaa !5
  %34 = load i32, i32* %9, align 4, !tbaa !5
  %35 = load i32, i32* %30, align 4, !tbaa !5
  %36 = getelementptr inbounds i32, i32* %3, i64 %26
  %37 = load i32, i32* %36, align 4, !tbaa !5
  %38 = mul nsw i32 %37, %35
  %39 = add nsw i32 %38, %34
  store i32 %39, i32* %9, align 4, !tbaa !5
  %40 = add nuw nsw i64 %12, 2
  %41 = icmp ult i64 %12, 254
  br i1 %41, label %11, label %42, !llvm.loop !14

42:                                               ; preds = %11
  %43 = add nuw nsw i64 %8, 1
  %44 = icmp eq i64 %43, 256
  br i1 %44, label %45, label %7, !llvm.loop !15

45:                                               ; preds = %42
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn writeonly }
attributes #2 = { nounwind }

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
