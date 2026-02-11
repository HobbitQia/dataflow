; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/gemv/kernel-full-uf1.ll'
source_filename = "/mnt/public/qjj/dataflow/test/benchmark/gemv/gemv_int.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nounwind uwtable
define dso_local void @kernel_gemv_int(i32* nocapture readonly %0, i32* nocapture readonly %1, i32* nocapture %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %8, %3
  %5 = phi i64 [ 0, %3 ], [ %10, %8 ]
  %6 = shl nsw i64 %5, 2
  br label %12

7:                                                ; preds = %8
  ret void

8:                                                ; preds = %12
  %9 = getelementptr inbounds i32, i32* %2, i64 %5
  store i32 %21, i32* %9, align 4, !tbaa !2
  %10 = add nuw nsw i64 %5, 1
  %11 = icmp eq i64 %10, 4
  br i1 %11, label %7, label %4, !llvm.loop !6

12:                                               ; preds = %12, %4
  %13 = phi i64 [ 0, %4 ], [ %22, %12 ]
  %14 = phi i32 [ 0, %4 ], [ %21, %12 ]
  %15 = add nuw nsw i64 %13, %6
  %16 = getelementptr inbounds i32, i32* %0, i64 %15
  %17 = load i32, i32* %16, align 4, !tbaa !2
  %18 = getelementptr inbounds i32, i32* %1, i64 %13
  %19 = load i32, i32* %18, align 4, !tbaa !2
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %14
  %22 = add nuw nsw i64 %13, 1
  %23 = icmp eq i64 %22, 4
  br i1 %23, label %8, label %12, !llvm.loop !9
}

attributes #0 = { mustprogress nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !7, !8}
