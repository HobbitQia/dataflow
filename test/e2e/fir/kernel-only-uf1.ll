; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/fir/kernel-full-uf1.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/fir/fir_int.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress norecurse nounwind readonly uwtable willreturn
define dso_local i32 @_Z6kernelPiS_S_(i32* nocapture readonly %0, i32* nocapture readnone %1, i32* nocapture readonly %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %4, %3
  %5 = phi i64 [ 0, %3 ], [ %13, %4 ]
  %6 = phi i32 [ 0, %3 ], [ %12, %4 ]
  %7 = getelementptr inbounds i32, i32* %0, i64 %5
  %8 = load i32, i32* %7, align 4, !tbaa !2
  %9 = getelementptr inbounds i32, i32* %2, i64 %5
  %10 = load i32, i32* %9, align 4, !tbaa !2
  %11 = mul nsw i32 %10, %8
  %12 = add nsw i32 %11, %6
  %13 = add nuw nsw i64 %5, 1
  %14 = icmp eq i64 %13, 32
  br i1 %14, label %15, label %4, !llvm.loop !6

15:                                               ; preds = %4
  ret i32 %12
}

attributes #0 = { mustprogress norecurse nounwind readonly uwtable willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

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
