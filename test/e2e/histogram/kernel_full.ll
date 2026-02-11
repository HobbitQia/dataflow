; ModuleID = '/mnt/public/sichuan_a/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/histogram/histogram.cpp'
source_filename = "/mnt/public/sichuan_a/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/histogram/histogram.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@input_data = dso_local local_unnamed_addr global [20 x float] [float 1.000000e+00, float 2.000000e+00, float 3.000000e+00, float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00, float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01, float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.400000e+01, float 1.400000e+01, float 1.400000e+01, float 1.400000e+01, float 1.400000e+01, float 1.900000e+01], align 16
@histogram = dso_local local_unnamed_addr global [5 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [27 x i8] c"DATA_LEN %d BUCKET_LEN %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"len %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"min %f\0A\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"del %f\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d \00", align 1

; Function Attrs: nofree norecurse nounwind uwtable mustprogress
define dso_local i32 @main(i32 %0, i8** nocapture readnone %1) local_unnamed_addr #0 {
  %3 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0), i32 20, i32 5)
  br label %4

4:                                                ; preds = %4, %2
  %5 = phi i64 [ 0, %2 ], [ %16, %4 ]
  %6 = getelementptr inbounds [20 x float], [20 x float]* @input_data, i64 0, i64 %5
  %7 = load float, float* %6, align 4, !tbaa !2
  %8 = fadd float %7, -1.000000e+00
  %9 = fmul float %8, 5.000000e+00
  %10 = fdiv float %9, 1.800000e+01
  %11 = fptosi float %10 to i32
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [5 x i32], [5 x i32]* @histogram, i64 0, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !6
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %13, align 4, !tbaa !6
  %16 = add nuw nsw i64 %5, 1
  %17 = icmp eq i64 %16, 20
  br i1 %17, label %18, label %4, !llvm.loop !8

18:                                               ; preds = %4
  %19 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 5) #4
  %20 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), double 1.000000e+00) #4
  %21 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), double 1.800000e+01) #4
  br label %22

22:                                               ; preds = %22, %18
  %23 = phi i64 [ 0, %18 ], [ %27, %22 ]
  %24 = getelementptr inbounds [5 x i32], [5 x i32]* @histogram, i64 0, i64 %23
  %25 = load i32, i32* %24, align 4, !tbaa !6
  %26 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 %25) #4
  %27 = add nuw nsw i64 %23, 1
  %28 = icmp eq i64 %27, 5
  br i1 %28, label %29, label %22, !llvm.loop !17

29:                                               ; preds = %22
  %30 = tail call i32 @putchar(i32 10) #4
  ret i32 0
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree norecurse nounwind uwtable mustprogress
define dso_local void @_Z6kernelPfPi(float* nocapture readonly %0, i32* nocapture %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %2, %3
  %4 = phi i64 [ 0, %2 ], [ %15, %3 ]
  %5 = getelementptr inbounds float, float* %0, i64 %4
  %6 = load float, float* %5, align 4, !tbaa !2
  %7 = fadd float %6, -1.000000e+00
  %8 = fmul float %7, 5.000000e+00
  %9 = fdiv float %8, 1.800000e+01
  %10 = fptosi float %9 to i32
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32* %1, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !6
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %12, align 4, !tbaa !6
  %15 = add nuw nsw i64 %4, 1
  %16 = icmp eq i64 %15, 20
  br i1 %16, label %17, label %3, !llvm.loop !8

17:                                               ; preds = %3
  ret void
}

; Function Attrs: nofree nounwind uwtable mustprogress
define dso_local void @_Z6outputv() local_unnamed_addr #2 {
  %1 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 5)
  %2 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), double 1.000000e+00)
  %3 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), double 1.800000e+01)
  br label %6

4:                                                ; preds = %6
  %5 = tail call i32 @putchar(i32 10)
  ret void

6:                                                ; preds = %0, %6
  %7 = phi i64 [ 0, %0 ], [ %11, %6 ]
  %8 = getelementptr inbounds [5 x i32], [5 x i32]* @histogram, i64 0, i64 %7
  %9 = load i32, i32* %8, align 4, !tbaa !6
  %10 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 %9)
  %11 = add nuw nsw i64 %7, 1
  %12 = icmp eq i64 %11, 5
  br i1 %12, label %4, label %6, !llvm.loop !17
}

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #3

attributes #0 = { nofree norecurse nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!2 = !{!3, !3, i64 0}
!3 = !{!"float", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = distinct !{!8, !9, !10, !11, !12, !13}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.vectorize.width", i32 4}
!11 = !{!"llvm.loop.vectorize.scalable.enable", i1 false}
!12 = !{!"llvm.loop.vectorize.enable", i1 true}
!13 = !{!"llvm.loop.vectorize.followup_all", !14}
!14 = distinct !{!14, !9, !15, !16}
!15 = !{!"llvm.loop.isvectorized"}
!16 = !{!"llvm.loop.unroll.count", i32 4}
!17 = distinct !{!17, !9, !18}
!18 = !{!"llvm.loop.unroll.disable"}
