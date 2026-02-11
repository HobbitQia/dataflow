; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/bicg/bicg.c'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/bicg/bicg.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, [116 x double]* nocapture readonly %2, double* nocapture %3, double* nocapture %4, double* nocapture readonly %5, double* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = bitcast double* %4 to i8*
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %10, label %15

10:                                               ; preds = %7
  %11 = bitcast double* %3 to i8*
  %12 = zext i32 %0 to i64
  %13 = shl nuw nsw i64 %12, 3
  call void @llvm.memset.p0i8.i64(i8* align 8 %11, i8 0, i64 %13, i1 false)
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %20, label %47

15:                                               ; preds = %7
  %16 = icmp sgt i32 %1, 0
  br i1 %16, label %17, label %47

17:                                               ; preds = %15
  %18 = zext i32 %1 to i64
  %19 = shl nuw nsw i64 %18, 3
  call void @llvm.memset.p0i8.i64(i8* align 8 %8, i8 0, i64 %19, i1 false)
  br label %47

20:                                               ; preds = %10
  %21 = zext i32 %1 to i64
  %22 = zext i32 %0 to i64
  br label %23

23:                                               ; preds = %20, %44
  %24 = phi i64 [ 0, %20 ], [ %45, %44 ]
  %25 = getelementptr inbounds double, double* %4, i64 %24
  store double 0.000000e+00, double* %25, align 8, !tbaa !2
  %26 = getelementptr inbounds double, double* %6, i64 %24
  br label %27

27:                                               ; preds = %23, %27
  %28 = phi i64 [ 0, %23 ], [ %42, %27 ]
  %29 = getelementptr inbounds double, double* %3, i64 %28
  %30 = load double, double* %29, align 8, !tbaa !2
  %31 = load double, double* %26, align 8, !tbaa !2
  %32 = getelementptr inbounds [116 x double], [116 x double]* %2, i64 %24, i64 %28
  %33 = load double, double* %32, align 8, !tbaa !2
  %34 = fmul double %31, %33
  %35 = fadd double %30, %34
  store double %35, double* %29, align 8, !tbaa !2
  %36 = load double, double* %25, align 8, !tbaa !2
  %37 = load double, double* %32, align 8, !tbaa !2
  %38 = getelementptr inbounds double, double* %5, i64 %28
  %39 = load double, double* %38, align 8, !tbaa !2
  %40 = fmul double %37, %39
  %41 = fadd double %36, %40
  store double %41, double* %25, align 8, !tbaa !2
  %42 = add nuw nsw i64 %28, 1
  %43 = icmp eq i64 %42, %22
  br i1 %43, label %44, label %27, !llvm.loop !6

44:                                               ; preds = %27
  %45 = add nuw nsw i64 %24, 1
  %46 = icmp eq i64 %45, %21
  br i1 %46, label %47, label %23, !llvm.loop !9

47:                                               ; preds = %44, %15, %17, %10
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %0, i8** nocapture readonly %1) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 14384, i32 8) #7
  %4 = tail call i8* @polybench_alloc_data(i64 116, i32 8) #7
  %5 = tail call i8* @polybench_alloc_data(i64 124, i32 8) #7
  %6 = tail call i8* @polybench_alloc_data(i64 116, i32 8) #7
  %7 = tail call i8* @polybench_alloc_data(i64 124, i32 8) #7
  %8 = bitcast i8* %3 to [116 x double]*
  %9 = bitcast i8* %6 to double*
  br label %10

10:                                               ; preds = %10, %2
  %11 = phi i64 [ 0, %2 ], [ %18, %10 ]
  %12 = phi i32 [ 0, %2 ], [ %19, %10 ]
  %13 = trunc i32 %12 to i8
  %14 = urem i8 %13, 116
  %15 = uitofp i8 %14 to double
  %16 = fdiv double %15, 1.160000e+02
  %17 = getelementptr inbounds double, double* %9, i64 %11
  store double %16, double* %17, align 8, !tbaa !2
  %18 = add nuw nsw i64 %11, 1
  %19 = add nuw nsw i32 %12, 1
  %20 = icmp eq i64 %18, 116
  br i1 %20, label %21, label %10, !llvm.loop !10

21:                                               ; preds = %10
  %22 = bitcast i8* %7 to double*
  br label %23

23:                                               ; preds = %21, %41
  %24 = phi i64 [ %42, %41 ], [ 0, %21 ]
  %25 = phi i32 [ %43, %41 ], [ 0, %21 ]
  %26 = trunc i32 %25 to i8
  %27 = urem i8 %26, 124
  %28 = uitofp i8 %27 to double
  %29 = fdiv double %28, 1.240000e+02
  %30 = getelementptr inbounds double, double* %22, i64 %24
  store double %29, double* %30, align 8, !tbaa !2
  br label %31

31:                                               ; preds = %31, %23
  %32 = phi i64 [ 0, %23 ], [ %33, %31 ]
  %33 = add nuw nsw i64 %32, 1
  %34 = mul nuw nsw i64 %33, %24
  %35 = trunc i64 %34 to i32
  %36 = urem i32 %35, 124
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.240000e+02
  %39 = getelementptr inbounds [116 x double], [116 x double]* %8, i64 %24, i64 %32
  store double %38, double* %39, align 8, !tbaa !2
  %40 = icmp eq i64 %33, 116
  br i1 %40, label %41, label %31, !llvm.loop !11

41:                                               ; preds = %31
  %42 = add nuw nsw i64 %24, 1
  %43 = add nuw nsw i32 %25, 1
  %44 = icmp eq i64 %42, 124
  br i1 %44, label %45, label %23, !llvm.loop !12

45:                                               ; preds = %41
  %46 = bitcast i8* %4 to double*
  %47 = bitcast i8* %5 to double*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(928) %4, i8 0, i64 928, i1 false) #7
  br label %48

48:                                               ; preds = %69, %45
  %49 = phi i64 [ 0, %45 ], [ %70, %69 ]
  %50 = getelementptr inbounds double, double* %47, i64 %49
  store double 0.000000e+00, double* %50, align 8, !tbaa !2
  %51 = getelementptr inbounds double, double* %22, i64 %49
  br label %52

52:                                               ; preds = %52, %48
  %53 = phi i64 [ 0, %48 ], [ %67, %52 ]
  %54 = getelementptr inbounds double, double* %46, i64 %53
  %55 = load double, double* %54, align 8, !tbaa !2
  %56 = load double, double* %51, align 8, !tbaa !2
  %57 = getelementptr inbounds [116 x double], [116 x double]* %8, i64 %49, i64 %53
  %58 = load double, double* %57, align 8, !tbaa !2
  %59 = fmul double %56, %58
  %60 = fadd double %55, %59
  store double %60, double* %54, align 8, !tbaa !2
  %61 = load double, double* %50, align 8, !tbaa !2
  %62 = load double, double* %57, align 8, !tbaa !2
  %63 = getelementptr inbounds double, double* %9, i64 %53
  %64 = load double, double* %63, align 8, !tbaa !2
  %65 = fmul double %62, %64
  %66 = fadd double %61, %65
  store double %66, double* %50, align 8, !tbaa !2
  %67 = add nuw nsw i64 %53, 1
  %68 = icmp eq i64 %67, 116
  br i1 %68, label %69, label %52, !llvm.loop !6

69:                                               ; preds = %52
  %70 = add nuw nsw i64 %49, 1
  %71 = icmp eq i64 %70, 124
  br i1 %71, label %72, label %48, !llvm.loop !9

72:                                               ; preds = %69
  %73 = icmp sgt i32 %0, 42
  br i1 %73, label %74, label %127

74:                                               ; preds = %72
  %75 = load i8*, i8** %1, align 8, !tbaa !13
  %76 = load i8, i8* %75, align 1
  %77 = icmp eq i8 %76, 0
  br i1 %77, label %78, label %127

78:                                               ; preds = %74
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %80 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %79) #8
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %82 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #8
  br label %83

83:                                               ; preds = %92, %78
  %84 = phi i64 [ 0, %78 ], [ %97, %92 ]
  %85 = phi i32 [ 0, %78 ], [ %98, %92 ]
  %86 = trunc i32 %85 to i8
  %87 = urem i8 %86, 20
  %88 = icmp eq i8 %87, 0
  br i1 %88, label %89, label %92

89:                                               ; preds = %83
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %91 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %90) #7
  br label %92

92:                                               ; preds = %89, %83
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %94 = getelementptr inbounds double, double* %46, i64 %84
  %95 = load double, double* %94, align 8, !tbaa !2
  %96 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %95) #8
  %97 = add nuw nsw i64 %84, 1
  %98 = add nuw nsw i32 %85, 1
  %99 = icmp eq i64 %97, 116
  br i1 %99, label %100, label %83, !llvm.loop !15

100:                                              ; preds = %92
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %102 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %101, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #8
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %104 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %103, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #8
  br label %105

105:                                              ; preds = %114, %100
  %106 = phi i64 [ 0, %100 ], [ %119, %114 ]
  %107 = phi i32 [ 0, %100 ], [ %120, %114 ]
  %108 = trunc i32 %107 to i8
  %109 = urem i8 %108, 20
  %110 = icmp eq i8 %109, 0
  br i1 %110, label %111, label %114

111:                                              ; preds = %105
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %113 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %112) #7
  br label %114

114:                                              ; preds = %111, %105
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %116 = getelementptr inbounds double, double* %47, i64 %106
  %117 = load double, double* %116, align 8, !tbaa !2
  %118 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %115, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %117) #8
  %119 = add nuw nsw i64 %106, 1
  %120 = add nuw nsw i32 %107, 1
  %121 = icmp eq i64 %119, 124
  br i1 %121, label %122, label %105, !llvm.loop !16

122:                                              ; preds = %114
  %123 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %124 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %123, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #8
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !13
  %126 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %125) #8
  br label %127

127:                                              ; preds = %122, %74, %72
  tail call void @free(i8* %3) #7
  tail call void @free(i8* %4) #7
  tail call void @free(i8* nonnull %5) #7
  tail call void @free(i8* %6) #7
  tail call void @free(i8* %7) #7
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
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = distinct !{!11, !7, !8}
!12 = distinct !{!12, !7, !8}
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !4, i64 0}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
