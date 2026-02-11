; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/relu/kernel_uf4.c'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/relu/kernel_uf4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, i32 %2, [70 x i32]* nocapture %3, [70 x i32]* nocapture readonly %4, [70 x i32]* nocapture readnone %5) local_unnamed_addr #0 {
  br label %7

7:                                                ; preds = %6, %7
  %8 = phi i32 [ 0, %6 ], [ %47, %7 ]
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
  %19 = or i32 %8, 1
  %20 = urem i32 %19, 70
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds [70 x i32], [70 x i32]* %4, i64 %12, i64 %21
  %23 = load i32, i32* %22, align 4, !tbaa !2
  %24 = icmp sgt i32 %23, 0
  %25 = select i1 %24, i32 %23, i32 0
  %26 = getelementptr inbounds [70 x i32], [70 x i32]* %3, i64 %12, i64 %21
  store i32 %25, i32* %26, align 4
  %27 = or i32 %8, 2
  %28 = udiv i32 %27, 70
  %29 = urem i32 %27, 70
  %30 = zext i32 %28 to i64
  %31 = zext i32 %29 to i64
  %32 = getelementptr inbounds [70 x i32], [70 x i32]* %4, i64 %30, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !2
  %34 = icmp sgt i32 %33, 0
  %35 = select i1 %34, i32 %33, i32 0
  %36 = getelementptr inbounds [70 x i32], [70 x i32]* %3, i64 %30, i64 %31
  store i32 %35, i32* %36, align 4
  %37 = or i32 %8, 3
  %38 = udiv i32 %37, 70
  %39 = urem i32 %37, 70
  %40 = zext i32 %38 to i64
  %41 = zext i32 %39 to i64
  %42 = getelementptr inbounds [70 x i32], [70 x i32]* %4, i64 %40, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !2
  %44 = icmp sgt i32 %43, 0
  %45 = select i1 %44, i32 %43, i32 0
  %46 = getelementptr inbounds [70 x i32], [70 x i32]* %3, i64 %40, i64 %41
  store i32 %45, i32* %46, align 4
  %47 = add nuw nsw i32 %8, 4
  %48 = icmp ult i32 %8, 4196
  br i1 %48, label %7, label %49, !llvm.loop !6

49:                                               ; preds = %7
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %0, i8** nocapture readnone %1) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 4200, i32 4) #3
  %4 = tail call i8* @polybench_alloc_data(i64 4200, i32 4) #3
  %5 = tail call i8* @polybench_alloc_data(i64 4200, i32 4) #3
  %6 = bitcast i8* %3 to [70 x i32]*
  %7 = bitcast i8* %4 to [70 x i32]*
  br label %8

8:                                                ; preds = %8, %2
  %9 = phi i32 [ 0, %2 ], [ %48, %8 ]
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
  %20 = or i32 %9, 1
  %21 = urem i32 %20, 70
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds [70 x i32], [70 x i32]* %7, i64 %13, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !2
  %25 = icmp sgt i32 %24, 0
  %26 = select i1 %25, i32 %24, i32 0
  %27 = getelementptr inbounds [70 x i32], [70 x i32]* %6, i64 %13, i64 %22
  store i32 %26, i32* %27, align 4
  %28 = or i32 %9, 2
  %29 = udiv i32 %28, 70
  %30 = urem i32 %28, 70
  %31 = zext i32 %29 to i64
  %32 = zext i32 %30 to i64
  %33 = getelementptr inbounds [70 x i32], [70 x i32]* %7, i64 %31, i64 %32
  %34 = load i32, i32* %33, align 4, !tbaa !2
  %35 = icmp sgt i32 %34, 0
  %36 = select i1 %35, i32 %34, i32 0
  %37 = getelementptr inbounds [70 x i32], [70 x i32]* %6, i64 %31, i64 %32
  store i32 %36, i32* %37, align 4
  %38 = or i32 %9, 3
  %39 = udiv i32 %38, 70
  %40 = urem i32 %38, 70
  %41 = zext i32 %39 to i64
  %42 = zext i32 %40 to i64
  %43 = getelementptr inbounds [70 x i32], [70 x i32]* %7, i64 %41, i64 %42
  %44 = load i32, i32* %43, align 4, !tbaa !2
  %45 = icmp sgt i32 %44, 0
  %46 = select i1 %45, i32 %44, i32 0
  %47 = getelementptr inbounds [70 x i32], [70 x i32]* %6, i64 %41, i64 %42
  store i32 %46, i32* %47, align 4
  %48 = add nuw nsw i32 %9, 4
  %49 = icmp ult i32 %9, 4196
  br i1 %49, label %8, label %50, !llvm.loop !6

50:                                               ; preds = %8
  ret i32 0
}

declare dso_local i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
