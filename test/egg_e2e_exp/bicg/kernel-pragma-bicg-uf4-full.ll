; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/bicg/bicg_standalone_uf4.c'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/bicg/bicg_standalone_uf4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@r = dso_local global [256 x i32] zeroinitializer, align 16
@A = dso_local global [256 x [256 x i32]] zeroinitializer, align 16
@p = dso_local global [256 x i32] zeroinitializer, align 16
@s = dso_local global [256 x i32] zeroinitializer, align 16
@q = dso_local global [256 x i32] zeroinitializer, align 16

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %13
  %2 = phi i64 [ 0, %0 ], [ %14, %13 ]
  %3 = getelementptr inbounds [256 x i32], [256 x i32]* @r, i64 0, i64 %2
  %4 = trunc i64 %2 to i32
  store i32 %4, i32* %3, align 4, !tbaa !2
  br label %5

5:                                                ; preds = %1, %5
  %6 = phi i64 [ 0, %1 ], [ %7, %5 ]
  %7 = add nuw nsw i64 %6, 1
  %8 = mul nuw nsw i64 %7, %2
  %9 = trunc i64 %8 to i32
  %10 = and i32 %9, 255
  %11 = getelementptr inbounds [256 x [256 x i32]], [256 x [256 x i32]]* @A, i64 0, i64 %2, i64 %6
  store i32 %10, i32* %11, align 4, !tbaa !2
  %12 = icmp eq i64 %7, 256
  br i1 %12, label %13, label %5, !llvm.loop !6

13:                                               ; preds = %5
  %14 = add nuw nsw i64 %2, 1
  %15 = icmp eq i64 %14, 256
  br i1 %15, label %16, label %1, !llvm.loop !9

16:                                               ; preds = %13, %16
  %17 = phi i64 [ %20, %16 ], [ 0, %13 ]
  %18 = getelementptr inbounds [256 x i32], [256 x i32]* @p, i64 0, i64 %17
  %19 = trunc i64 %17 to i32
  store i32 %19, i32* %18, align 4, !tbaa !2
  %20 = add nuw nsw i64 %17, 1
  %21 = icmp eq i64 %20, 256
  br i1 %21, label %22, label %16, !llvm.loop !10

22:                                               ; preds = %16
  tail call void @kernel([256 x i32]* getelementptr inbounds ([256 x [256 x i32]], [256 x [256 x i32]]* @A, i64 0, i64 0), i32* getelementptr inbounds ([256 x i32], [256 x i32]* @s, i64 0, i64 0), i32* getelementptr inbounds ([256 x i32], [256 x i32]* @q, i64 0, i64 0), i32* getelementptr inbounds ([256 x i32], [256 x i32]* @p, i64 0, i64 0), i32* getelementptr inbounds ([256 x i32], [256 x i32]* @r, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel([256 x i32]* nocapture readonly %0, i32* nocapture %1, i32* nocapture %2, i32* nocapture readonly %3, i32* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = bitcast i32* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(1024) %6, i8 0, i64 1024, i1 false)
  br label %7

7:                                                ; preds = %5, %70
  %8 = phi i64 [ 0, %5 ], [ %71, %70 ]
  %9 = getelementptr inbounds i32, i32* %2, i64 %8
  store i32 0, i32* %9, align 4, !tbaa !2
  %10 = getelementptr inbounds i32, i32* %4, i64 %8
  br label %11

11:                                               ; preds = %11, %7
  %12 = phi i64 [ 0, %7 ], [ %68, %11 ]
  %13 = getelementptr inbounds i32, i32* %1, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !2
  %15 = load i32, i32* %10, align 4, !tbaa !2
  %16 = getelementptr inbounds [256 x i32], [256 x i32]* %0, i64 %8, i64 %12
  %17 = load i32, i32* %16, align 4, !tbaa !2
  %18 = mul nsw i32 %17, %15
  %19 = add nsw i32 %18, %14
  store i32 %19, i32* %13, align 4, !tbaa !2
  %20 = load i32, i32* %9, align 4, !tbaa !2
  %21 = load i32, i32* %16, align 4, !tbaa !2
  %22 = getelementptr inbounds i32, i32* %3, i64 %12
  %23 = load i32, i32* %22, align 4, !tbaa !2
  %24 = mul nsw i32 %23, %21
  %25 = add nsw i32 %24, %20
  store i32 %25, i32* %9, align 4, !tbaa !2
  %26 = or i64 %12, 1
  %27 = getelementptr inbounds i32, i32* %1, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !2
  %29 = load i32, i32* %10, align 4, !tbaa !2
  %30 = getelementptr inbounds [256 x i32], [256 x i32]* %0, i64 %8, i64 %26
  %31 = load i32, i32* %30, align 4, !tbaa !2
  %32 = mul nsw i32 %31, %29
  %33 = add nsw i32 %32, %28
  store i32 %33, i32* %27, align 4, !tbaa !2
  %34 = load i32, i32* %9, align 4, !tbaa !2
  %35 = load i32, i32* %30, align 4, !tbaa !2
  %36 = getelementptr inbounds i32, i32* %3, i64 %26
  %37 = load i32, i32* %36, align 4, !tbaa !2
  %38 = mul nsw i32 %37, %35
  %39 = add nsw i32 %38, %34
  store i32 %39, i32* %9, align 4, !tbaa !2
  %40 = or i64 %12, 2
  %41 = getelementptr inbounds i32, i32* %1, i64 %40
  %42 = load i32, i32* %41, align 4, !tbaa !2
  %43 = load i32, i32* %10, align 4, !tbaa !2
  %44 = getelementptr inbounds [256 x i32], [256 x i32]* %0, i64 %8, i64 %40
  %45 = load i32, i32* %44, align 4, !tbaa !2
  %46 = mul nsw i32 %45, %43
  %47 = add nsw i32 %46, %42
  store i32 %47, i32* %41, align 4, !tbaa !2
  %48 = load i32, i32* %9, align 4, !tbaa !2
  %49 = load i32, i32* %44, align 4, !tbaa !2
  %50 = getelementptr inbounds i32, i32* %3, i64 %40
  %51 = load i32, i32* %50, align 4, !tbaa !2
  %52 = mul nsw i32 %51, %49
  %53 = add nsw i32 %52, %48
  store i32 %53, i32* %9, align 4, !tbaa !2
  %54 = or i64 %12, 3
  %55 = getelementptr inbounds i32, i32* %1, i64 %54
  %56 = load i32, i32* %55, align 4, !tbaa !2
  %57 = load i32, i32* %10, align 4, !tbaa !2
  %58 = getelementptr inbounds [256 x i32], [256 x i32]* %0, i64 %8, i64 %54
  %59 = load i32, i32* %58, align 4, !tbaa !2
  %60 = mul nsw i32 %59, %57
  %61 = add nsw i32 %60, %56
  store i32 %61, i32* %55, align 4, !tbaa !2
  %62 = load i32, i32* %9, align 4, !tbaa !2
  %63 = load i32, i32* %58, align 4, !tbaa !2
  %64 = getelementptr inbounds i32, i32* %3, i64 %54
  %65 = load i32, i32* %64, align 4, !tbaa !2
  %66 = mul nsw i32 %65, %63
  %67 = add nsw i32 %66, %62
  store i32 %67, i32* %9, align 4, !tbaa !2
  %68 = add nuw nsw i64 %12, 4
  %69 = icmp eq i64 %68, 256
  br i1 %69, label %70, label %11, !llvm.loop !11

70:                                               ; preds = %11
  %71 = add nuw nsw i64 %8, 1
  %72 = icmp eq i64 %71, 256
  br i1 %72, label %73, label %7, !llvm.loop !12

73:                                               ; preds = %70
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn writeonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = distinct !{!11, !7, !8}
!12 = distinct !{!12, !7, !8}
