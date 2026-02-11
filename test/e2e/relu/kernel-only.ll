; ModuleID = '/mnt/public/sichuan_a/qjj/dataflow/test/e2e/relu/kernel-full.ll'
source_filename = "/mnt/public/sichuan_a/qjj/dataflow/test/e2e/../benchmark/CGRA-Bench/kernels/relu/relu.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, i32 %2, [70 x i32]* nocapture %3, [70 x i32]* nocapture readonly %4, [70 x i32]* nocapture readnone %5) local_unnamed_addr #0 {
  br label %7

7:                                                ; preds = %7, %6
  %8 = phi i32 [ 0, %6 ], [ %19, %7 ]
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
  %20 = icmp eq i32 %19, 4200
  br i1 %20, label %21, label %7, !llvm.loop !6

21:                                               ; preds = %7
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
!6 = distinct !{!6, !7, !8, !9}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.vectorize.followup_all", !10}
!10 = distinct !{!10, !7, !11, !12}
!11 = !{!"llvm.loop.isvectorized"}
!12 = !{!"llvm.loop.unroll.count", i32 4}
