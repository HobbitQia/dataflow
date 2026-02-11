; ModuleID = '/mnt/public/sichuan_a/qjj/dataflow/test/e2e/../benchmark/CGRA-Bench/kernels/histogram/histogram_int.cpp'
source_filename = "/mnt/public/sichuan_a/qjj/dataflow/test/e2e/../benchmark/CGRA-Bench/kernels/histogram/histogram_int.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@input_data = dso_local local_unnamed_addr global [20 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 14, i32 14, i32 14, i32 14, i32 14, i32 19], align 16
@histogram = dso_local local_unnamed_addr global [5 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [27 x i8] c"DATA_LEN %d BUCKET_LEN %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"len %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"min %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"del %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d \00", align 1

; Function Attrs: nofree norecurse nounwind uwtable mustprogress
define dso_local i32 @main(i32 %0, i8** nocapture readnone %1) local_unnamed_addr #0 {
  %3 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0), i32 20, i32 5)
  br label %4

4:                                                ; preds = %4, %2
  %5 = phi i64 [ 0, %2 ], [ %15, %4 ]
  %6 = getelementptr inbounds [20 x i32], [20 x i32]* @input_data, i64 0, i64 %5
  %7 = load i32, i32* %6, align 4, !tbaa !2
  %8 = mul i32 %7, 5
  %9 = add i32 %8, -5
  %10 = sdiv i32 %9, 18
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [5 x i32], [5 x i32]* @histogram, i64 0, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !2
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %12, align 4, !tbaa !2
  %15 = add nuw nsw i64 %5, 1
  %16 = icmp eq i64 %15, 20
  br i1 %16, label %17, label %4, !llvm.loop !6

17:                                               ; preds = %4
  %18 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 5) #4
  %19 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 1) #4
  %20 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), i32 18) #4
  br label %21

21:                                               ; preds = %21, %17
  %22 = phi i64 [ 0, %17 ], [ %26, %21 ]
  %23 = getelementptr inbounds [5 x i32], [5 x i32]* @histogram, i64 0, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !2
  %25 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 %24) #4
  %26 = add nuw nsw i64 %22, 1
  %27 = icmp eq i64 %26, 5
  br i1 %27, label %28, label %21, !llvm.loop !9

28:                                               ; preds = %21
  %29 = tail call i32 @putchar(i32 10) #4
  ret i32 0
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree norecurse nounwind uwtable mustprogress
define dso_local void @_Z6kernelPiS_(i32* nocapture readonly %0, i32* nocapture %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %2, %3
  %4 = phi i64 [ 0, %2 ], [ %14, %3 ]
  %5 = getelementptr inbounds i32, i32* %0, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !2
  %7 = mul i32 %6, 5
  %8 = add i32 %7, -5
  %9 = sdiv i32 %8, 18
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i32, i32* %1, i64 %10
  %12 = load i32, i32* %11, align 4, !tbaa !2
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %11, align 4, !tbaa !2
  %14 = add nuw nsw i64 %4, 1
  %15 = icmp eq i64 %14, 20
  br i1 %15, label %16, label %3, !llvm.loop !6

16:                                               ; preds = %3
  ret void
}

; Function Attrs: nofree nounwind uwtable mustprogress
define dso_local void @_Z6outputv() local_unnamed_addr #2 {
  %1 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 5)
  %2 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 1)
  %3 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), i32 18)
  br label %6

4:                                                ; preds = %6
  %5 = tail call i32 @putchar(i32 10)
  ret void

6:                                                ; preds = %0, %6
  %7 = phi i64 [ 0, %0 ], [ %11, %6 ]
  %8 = getelementptr inbounds [5 x i32], [5 x i32]* @histogram, i64 0, i64 %7
  %9 = load i32, i32* %8, align 4, !tbaa !2
  %10 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 %9)
  %11 = add nuw nsw i64 %7, 1
  %12 = icmp eq i64 %11, 5
  br i1 %12, label %4, label %6, !llvm.loop !9
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
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !7, !8}
