; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/relu/kernel-only-uf4.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/relu/relu.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, i32 %2, [70 x i32]* nocapture %3, [70 x i32]* nocapture readonly %4, [70 x i32]* nocapture readnone %5) local_unnamed_addr #0 {
  br label %7

7:                                                ; preds = %7, %6
  %8 = phi i32 [ 0, %6 ], [ %52, %7 ]
  %9 = trunc i32 %8 to i16
  %10 = udiv i16 %9, 70
  %11 = urem i16 %9, 70
  %12 = zext i16 %10 to i64
  %13 = zext i16 %11 to i64
  %14 = getelementptr inbounds [70 x i32], [70 x i32]* %4, i64 %12, i64 %13
  %15 = load i32, i32* %14, align 4, !tbaa !2
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 %15, i32 0
  %18 = getelementptr inbounds [70 x i32], [70 x i32]* %3, i64 %12, i64 %13
  store i32 %17, i32* %18, align 4
  %19 = add nuw nsw i32 %8, 1
  %20 = trunc i32 %19 to i16
  %21 = udiv i16 %20, 70
  %22 = urem i16 %20, 70
  %23 = zext i16 %21 to i64
  %24 = zext i16 %22 to i64
  %25 = getelementptr inbounds [70 x i32], [70 x i32]* %4, i64 %23, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !2
  %27 = icmp sgt i32 %26, 0
  %28 = select i1 %27, i32 %26, i32 0
  %29 = getelementptr inbounds [70 x i32], [70 x i32]* %3, i64 %23, i64 %24
  store i32 %28, i32* %29, align 4
  %30 = add nuw nsw i32 %19, 1
  %31 = trunc i32 %30 to i16
  %32 = udiv i16 %31, 70
  %33 = urem i16 %31, 70
  %34 = zext i16 %32 to i64
  %35 = zext i16 %33 to i64
  %36 = getelementptr inbounds [70 x i32], [70 x i32]* %4, i64 %34, i64 %35
  %37 = load i32, i32* %36, align 4, !tbaa !2
  %38 = icmp sgt i32 %37, 0
  %39 = select i1 %38, i32 %37, i32 0
  %40 = getelementptr inbounds [70 x i32], [70 x i32]* %3, i64 %34, i64 %35
  store i32 %39, i32* %40, align 4
  %41 = add nuw nsw i32 %30, 1
  %42 = trunc i32 %41 to i16
  %43 = udiv i16 %42, 70
  %44 = urem i16 %42, 70
  %45 = zext i16 %43 to i64
  %46 = zext i16 %44 to i64
  %47 = getelementptr inbounds [70 x i32], [70 x i32]* %4, i64 %45, i64 %46
  %48 = load i32, i32* %47, align 4, !tbaa !2
  %49 = icmp sgt i32 %48, 0
  %50 = select i1 %49, i32 %48, i32 0
  %51 = getelementptr inbounds [70 x i32], [70 x i32]* %3, i64 %45, i64 %46
  store i32 %50, i32* %51, align 4
  %52 = add nuw nsw i32 %41, 1
  %53 = icmp eq i32 %52, 4200
  br i1 %53, label %54, label %7, !llvm.loop !6

54:                                               ; preds = %7
  ret void
}

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !8, !9, !13}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.vectorize.followup_all", !10}
!10 = distinct !{!10, !7, !11, !12}
!11 = !{!"llvm.loop.isvectorized"}
!12 = !{!"llvm.loop.unroll.count", i32 4}
!13 = !{!"llvm.loop.unroll.disable"}
