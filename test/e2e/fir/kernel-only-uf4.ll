; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/fir/kernel-full-uf4.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/fir/kernel_uf4.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress norecurse nounwind readonly uwtable willreturn
define dso_local i32 @_Z6kernelPiS_S_(i32* nocapture readonly %0, i32* nocapture readnone %1, i32* nocapture readonly %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %4, %3
  %5 = phi i64 [ 0, %3 ], [ %16, %4 ]
  %6 = phi i32 [ 0, %3 ], [ %15, %4 ]
  %7 = getelementptr inbounds i32, i32* %0, i64 %5
  %8 = getelementptr inbounds i32, i32* %2, i64 %5
  %9 = bitcast i32* %7 to <4 x i32>*
  %10 = load <4 x i32>, <4 x i32>* %9, align 4, !tbaa !2
  %11 = bitcast i32* %8 to <4 x i32>*
  %12 = load <4 x i32>, <4 x i32>* %11, align 4, !tbaa !2
  %13 = mul nsw <4 x i32> %12, %10
  %14 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %13)
  %15 = add nsw i32 %14, %6
  %16 = add nuw nsw i64 %5, 4
  %17 = icmp ult i64 %5, 28
  br i1 %17, label %4, label %18, !llvm.loop !6

18:                                               ; preds = %4
  ret i32 %15
}

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #1

attributes #0 = { mustprogress norecurse nounwind readonly uwtable willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone willreturn }

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
