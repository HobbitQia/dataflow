; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@A = dso_local global [256 x [256 x i32]] zeroinitializer, align 16
@r = dso_local global [256 x i32] zeroinitializer, align 16
@p = dso_local global [256 x i32] zeroinitializer, align 16
@s = dso_local global [256 x i32] zeroinitializer, align 16
@q = dso_local global [256 x i32] zeroinitializer, align 16

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
  tail call void @_Z6kernelPA256_iPiS1_S1_S1_([256 x i32]* noundef getelementptr inbounds ([256 x [256 x i32]], [256 x [256 x i32]]* @A, i64 0, i64 0), i32* noundef getelementptr inbounds ([256 x i32], [256 x i32]* @s, i64 0, i64 0), i32* noundef getelementptr inbounds ([256 x i32], [256 x i32]* @q, i64 0, i64 0), i32* noundef getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 0), i32* noundef getelementptr inbounds ([256 x i32], [256 x i32]* @r, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPA256_iPiS1_S1_S1_([256 x i32]* nocapture noundef readonly %0, i32* nocapture noundef %1, i32* nocapture noundef %2, i32* nocapture noundef readonly %3, i32* nocapture noundef readonly %4) local_unnamed_addr #0 {
  %6 = bitcast i32* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(1024) %6, i8 0, i64 1024, i1 false), !tbaa !5
  br label %7

7:                                                ; preds = %5, %70
  %8 = phi i64 [ 0, %5 ], [ %71, %70 ]
  %9 = getelementptr inbounds i32, i32* %2, i64 %8
  store i32 0, i32* %9, align 4, !tbaa !5
  %10 = getelementptr inbounds i32, i32* %4, i64 %8
  br label %11

11:                                               ; preds = %7, %11
  %12 = phi i64 [ 0, %7 ], [ %68, %11 ]
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
  %40 = or i64 %12, 2
  %41 = getelementptr inbounds i32, i32* %1, i64 %40
  %42 = load i32, i32* %41, align 4, !tbaa !5
  %43 = load i32, i32* %10, align 4, !tbaa !5
  %44 = getelementptr inbounds [256 x i32], [256 x i32]* %0, i64 %8, i64 %40
  %45 = load i32, i32* %44, align 4, !tbaa !5
  %46 = mul nsw i32 %45, %43
  %47 = add nsw i32 %46, %42
  store i32 %47, i32* %41, align 4, !tbaa !5
  %48 = load i32, i32* %9, align 4, !tbaa !5
  %49 = load i32, i32* %44, align 4, !tbaa !5
  %50 = getelementptr inbounds i32, i32* %3, i64 %40
  %51 = load i32, i32* %50, align 4, !tbaa !5
  %52 = mul nsw i32 %51, %49
  %53 = add nsw i32 %52, %48
  store i32 %53, i32* %9, align 4, !tbaa !5
  %54 = or i64 %12, 3
  %55 = getelementptr inbounds i32, i32* %1, i64 %54
  %56 = load i32, i32* %55, align 4, !tbaa !5
  %57 = load i32, i32* %10, align 4, !tbaa !5
  %58 = getelementptr inbounds [256 x i32], [256 x i32]* %0, i64 %8, i64 %54
  %59 = load i32, i32* %58, align 4, !tbaa !5
  %60 = mul nsw i32 %59, %57
  %61 = add nsw i32 %60, %56
  store i32 %61, i32* %55, align 4, !tbaa !5
  %62 = load i32, i32* %9, align 4, !tbaa !5
  %63 = load i32, i32* %58, align 4, !tbaa !5
  %64 = getelementptr inbounds i32, i32* %3, i64 %54
  %65 = load i32, i32* %64, align 4, !tbaa !5
  %66 = mul nsw i32 %65, %63
  %67 = add nsw i32 %66, %62
  store i32 %67, i32* %9, align 4, !tbaa !5
  %68 = add nuw nsw i64 %12, 4
  %69 = icmp ult i64 %12, 252
  br i1 %69, label %11, label %70, !llvm.loop !14

70:                                               ; preds = %11
  %71 = add nuw nsw i64 %8, 1
  %72 = icmp eq i64 %71, 256
  br i1 %72, label %73, label %7, !llvm.loop !15

73:                                               ; preds = %70
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
