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

18:                                               ; preds = %15, %50
  %19 = phi i64 [ %51, %50 ], [ 0, %15 ]
  %20 = shl nsw i64 %19, 6
  br label %21

21:                                               ; preds = %47, %18
  %22 = phi i64 [ 0, %18 ], [ %48, %47 ]
  %23 = add nuw nsw i64 %22, %20
  %24 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1A, i64 0, i64 %23
  %25 = shl nsw i64 %22, 6
  %26 = load i32, i32* %24, align 4, !tbaa !5
  br label %27

27:                                               ; preds = %27, %21
  %28 = phi i64 [ 0, %21 ], [ %45, %27 ]
  %29 = add nuw nsw i64 %28, %25
  %30 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1B, i64 0, i64 %29
  %31 = load i32, i32* %30, align 8, !tbaa !5
  %32 = mul nsw i32 %31, %26
  %33 = add nuw nsw i64 %28, %20
  %34 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1C, i64 0, i64 %33
  %35 = load i32, i32* %34, align 8, !tbaa !5
  %36 = add nsw i32 %35, %32
  store i32 %36, i32* %34, align 8, !tbaa !5
  %37 = or i64 %29, 1
  %38 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1B, i64 0, i64 %37
  %39 = load i32, i32* %38, align 4, !tbaa !5
  %40 = mul nsw i32 %39, %26
  %41 = or i64 %33, 1
  %42 = getelementptr inbounds [4096 x i32], [4096 x i32]* @_ZZ4mainE1C, i64 0, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !5
  %44 = add nsw i32 %43, %40
  store i32 %44, i32* %42, align 4, !tbaa !5
  %45 = add nuw nsw i64 %28, 2
  %46 = icmp ult i64 %28, 62
  br i1 %46, label %27, label %47, !llvm.loop !13

47:                                               ; preds = %27
  %48 = add nuw nsw i64 %22, 1
  %49 = icmp eq i64 %48, 64
  br i1 %49, label %50, label %21, !llvm.loop !14

50:                                               ; preds = %47
  %51 = add nuw nsw i64 %19, 1
  %52 = icmp eq i64 %51, 64
  br i1 %52, label %53, label %18, !llvm.loop !15

53:                                               ; preds = %50
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPiS_S_(i32* nocapture noundef %0, i32* nocapture noundef readonly %1, i32* nocapture noundef readonly %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %3, %37
  %5 = phi i64 [ 0, %3 ], [ %38, %37 ]
  %6 = shl nsw i64 %5, 6
  br label %7

7:                                                ; preds = %4, %34
  %8 = phi i64 [ 0, %4 ], [ %35, %34 ]
  %9 = add nuw nsw i64 %8, %6
  %10 = getelementptr inbounds i32, i32* %1, i64 %9
  %11 = shl nsw i64 %8, 6
  br label %12

12:                                               ; preds = %7, %12
  %13 = phi i64 [ 0, %7 ], [ %32, %12 ]
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
  %32 = add nuw nsw i64 %13, 2
  %33 = icmp ult i64 %13, 62
  br i1 %33, label %12, label %34, !llvm.loop !13

34:                                               ; preds = %12
  %35 = add nuw nsw i64 %8, 1
  %36 = icmp eq i64 %35, 64
  br i1 %36, label %37, label %7, !llvm.loop !14

37:                                               ; preds = %34
  %38 = add nuw nsw i64 %5, 1
  %39 = icmp eq i64 %38, 64
  br i1 %39, label %40, label %4, !llvm.loop !15

40:                                               ; preds = %37
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
