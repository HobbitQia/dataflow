; ModuleID = '/mnt/public/sichuan_a/qjj/dataflow/test/e2e/../benchmark/CGRA-Bench/kernels/relu/relu.c'
source_filename = "/mnt/public/sichuan_a/qjj/dataflow/test/e2e/../benchmark/CGRA-Bench/kernels/relu/relu.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, i32 %2, [70 x i32]* nocapture %3, [70 x i32]* nocapture readonly %4, [70 x i32]* nocapture readnone %5) local_unnamed_addr #0 {
  br label %7

7:                                                ; preds = %6, %7
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

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %0, i8** nocapture readonly %1) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 4200, i32 4) #7
  %4 = tail call i8* @polybench_alloc_data(i64 4200, i32 4) #7
  %5 = tail call i8* @polybench_alloc_data(i64 4200, i32 4) #7
  %6 = bitcast i8* %3 to [70 x i32]*
  %7 = bitcast i8* %4 to [70 x i32]*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(16800) %3, i8 0, i64 16800, i1 false) #7
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(16800) %4, i8 0, i64 16800, i1 false) #7
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(16800) %5, i8 0, i64 16800, i1 false) #7
  br label %8

8:                                                ; preds = %8, %2
  %9 = phi i32 [ 0, %2 ], [ %20, %8 ]
  %10 = trunc i32 %9 to i16
  %11 = udiv i16 %10, 70
  %12 = urem i16 %10, 70
  %13 = zext i16 %11 to i64
  %14 = zext i16 %12 to i64
  %15 = getelementptr inbounds [70 x i32], [70 x i32]* %7, i64 %13, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !2
  %17 = icmp sgt i32 %16, 0
  %18 = select i1 %17, i32 %16, i32 0
  %19 = getelementptr inbounds [70 x i32], [70 x i32]* %6, i64 %13, i64 %14
  store i32 %18, i32* %19, align 4
  %20 = add nuw nsw i32 %9, 1
  %21 = icmp eq i32 %20, 4200
  br i1 %21, label %22, label %8, !llvm.loop !6

22:                                               ; preds = %8
  %23 = icmp sgt i32 %0, 42
  br i1 %23, label %24, label %60

24:                                               ; preds = %22
  %25 = load i8*, i8** %1, align 8, !tbaa !13
  %26 = load i8, i8* %25, align 1
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %28, label %60

28:                                               ; preds = %24
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #8
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #8
  br label %33

33:                                               ; preds = %52, %28
  %34 = phi i64 [ 0, %28 ], [ %53, %52 ]
  %35 = mul nuw nsw i64 %34, 60
  br label %36

36:                                               ; preds = %45, %33
  %37 = phi i64 [ 0, %33 ], [ %50, %45 ]
  %38 = add nuw nsw i64 %37, %35
  %39 = trunc i64 %38 to i32
  %40 = urem i32 %39, 20
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %45

42:                                               ; preds = %36
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %44 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %43) #7
  br label %45

45:                                               ; preds = %42, %36
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %47 = getelementptr inbounds [70 x i32], [70 x i32]* %6, i64 %34, i64 %37
  %48 = load i32, i32* %47, align 4, !tbaa !2
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %48) #8
  %50 = add nuw nsw i64 %37, 1
  %51 = icmp eq i64 %50, 70
  br i1 %51, label %52, label %36, !llvm.loop !15

52:                                               ; preds = %45
  %53 = add nuw nsw i64 %34, 1
  %54 = icmp eq i64 %53, 60
  br i1 %54, label %55, label %33, !llvm.loop !17

55:                                               ; preds = %52
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #8
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %59 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %58) #8
  br label %60

60:                                               ; preds = %55, %24, %22
  tail call void @free(i8* nonnull %3) #7
  tail call void @free(i8* %4) #7
  tail call void @free(i8* %5) #7
  ret i32 0
}

declare dso_local i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: inaccessiblemem_or_argmemonly nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @fputc(i32 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #5

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inaccessiblemem_or_argmemonly nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree nounwind }
attributes #6 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #7 = { nounwind }
attributes #8 = { cold nounwind }

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
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !4, i64 0}
!15 = distinct !{!15, !7, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !7, !16}
