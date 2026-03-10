; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/relu/relu.c'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/relu/relu.c"
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
define dso_local void @kernel(i32 %0, i32 %1, i32 %2, [1100 x i32]* nocapture %3, [1100 x i32]* nocapture readonly %4, [1100 x i32]* nocapture readnone %5) local_unnamed_addr #0 {
  br label %7

7:                                                ; preds = %6, %7
  %8 = phi i32 [ 0, %6 ], [ %18, %7 ]
  %9 = udiv i32 %8, 1100
  %10 = urem i32 %8, 1100
  %11 = zext i32 %9 to i64
  %12 = zext i32 %10 to i64
  %13 = getelementptr inbounds [1100 x i32], [1100 x i32]* %4, i64 %11, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !2
  %15 = icmp sgt i32 %14, 0
  %16 = select i1 %15, i32 %14, i32 0
  %17 = getelementptr inbounds [1100 x i32], [1100 x i32]* %3, i64 %11, i64 %12
  store i32 %16, i32* %17, align 4
  %18 = add nuw nsw i32 %8, 1
  %19 = icmp eq i32 %18, 1100000
  br i1 %19, label %20, label %7, !llvm.loop !6

20:                                               ; preds = %7
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %0, i8** nocapture readonly %1) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 1100000, i32 4) #7
  %4 = tail call i8* @polybench_alloc_data(i64 1100000, i32 4) #7
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 4) #7
  %6 = bitcast i8* %3 to [1100 x i32]*
  %7 = bitcast i8* %4 to [1100 x i32]*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(4400000) %3, i8 0, i64 4400000, i1 false) #7
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(4400000) %4, i8 0, i64 4400000, i1 false) #7
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(4400000) %5, i8 0, i64 4400000, i1 false) #7
  br label %8

8:                                                ; preds = %8, %2
  %9 = phi i32 [ 0, %2 ], [ %19, %8 ]
  %10 = udiv i32 %9, 1100
  %11 = urem i32 %9, 1100
  %12 = zext i32 %10 to i64
  %13 = zext i32 %11 to i64
  %14 = getelementptr inbounds [1100 x i32], [1100 x i32]* %7, i64 %12, i64 %13
  %15 = load i32, i32* %14, align 4, !tbaa !2
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 %15, i32 0
  %18 = getelementptr inbounds [1100 x i32], [1100 x i32]* %6, i64 %12, i64 %13
  store i32 %17, i32* %18, align 4
  %19 = add nuw nsw i32 %9, 1
  %20 = icmp eq i32 %19, 1100000
  br i1 %20, label %21, label %8, !llvm.loop !6

21:                                               ; preds = %8
  %22 = icmp sgt i32 %0, 42
  br i1 %22, label %23, label %59

23:                                               ; preds = %21
  %24 = load i8*, i8** %1, align 8, !tbaa !13
  %25 = load i8, i8* %24, align 1
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %27, label %59

27:                                               ; preds = %23
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #8
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #8
  br label %32

32:                                               ; preds = %51, %27
  %33 = phi i64 [ 0, %27 ], [ %52, %51 ]
  %34 = mul nuw nsw i64 %33, 1000
  br label %35

35:                                               ; preds = %44, %32
  %36 = phi i64 [ 0, %32 ], [ %49, %44 ]
  %37 = add nuw nsw i64 %36, %34
  %38 = trunc i64 %37 to i32
  %39 = urem i32 %38, 20
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %44

41:                                               ; preds = %35
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %43 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %42) #7
  br label %44

44:                                               ; preds = %41, %35
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %46 = getelementptr inbounds [1100 x i32], [1100 x i32]* %6, i64 %33, i64 %36
  %47 = load i32, i32* %46, align 4, !tbaa !2
  %48 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %47) #8
  %49 = add nuw nsw i64 %36, 1
  %50 = icmp eq i64 %49, 1100
  br i1 %50, label %51, label %35, !llvm.loop !15

51:                                               ; preds = %44
  %52 = add nuw nsw i64 %33, 1
  %53 = icmp eq i64 %52, 1000
  br i1 %53, label %54, label %32, !llvm.loop !17

54:                                               ; preds = %51
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %56 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %55, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #8
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %58 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %57) #8
  br label %59

59:                                               ; preds = %54, %23, %21
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
