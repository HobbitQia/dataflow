; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/fft/kernel-full-uf4.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/fft/kernel_uf4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32* nocapture %0, i32* nocapture %1, i32* nocapture readonly %2, i32* nocapture readonly %3) local_unnamed_addr #0 {
  br label %5

5:                                                ; preds = %128, %4
  %6 = phi i32 [ 0, %4 ], [ %133, %128 ]
  %7 = phi i32 [ 0, %4 ], [ %132, %128 ]
  %8 = phi i32 [ 128, %4 ], [ %130, %128 ]
  %9 = phi i32 [ 1, %4 ], [ %129, %128 ]
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %128, label %11

11:                                               ; preds = %5
  %12 = icmp sgt i32 %8, 0
  %13 = sext i32 %8 to i64
  %14 = sext i32 %7 to i64
  %15 = zext i32 %9 to i64
  br label %16

16:                                               ; preds = %125, %11
  %17 = phi i64 [ 0, %11 ], [ %126, %125 ]
  %18 = add nsw i64 %17, %14
  %19 = getelementptr inbounds i32, i32* %2, i64 %18
  %20 = load i32, i32* %19, align 4, !tbaa !2
  %21 = getelementptr inbounds i32, i32* %3, i64 %18
  %22 = load i32, i32* %21, align 4, !tbaa !2
  br i1 %12, label %23, label %125

23:                                               ; preds = %16
  %24 = trunc i64 %17 to i32
  %25 = shl i32 %24, 1
  %26 = mul nsw i32 %25, %8
  %27 = sext i32 %26 to i64
  br label %28

28:                                               ; preds = %28, %23
  %29 = phi i64 [ 0, %23 ], [ %123, %28 ]
  %30 = add nsw i64 %29, %27
  %31 = trunc i64 %30 to i32
  %32 = add i32 %8, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32* %0, i64 %33
  %35 = load i32, i32* %34, align 4, !tbaa !2
  %36 = mul nsw i32 %35, %20
  %37 = getelementptr inbounds i32, i32* %1, i64 %33
  %38 = load i32, i32* %37, align 4, !tbaa !2
  %39 = mul nsw i32 %38, %22
  %40 = sub nsw i32 %36, %39
  %41 = mul nsw i32 %35, %22
  %42 = mul nsw i32 %38, %20
  %43 = add nsw i32 %42, %41
  %44 = getelementptr inbounds i32, i32* %0, i64 %30
  %45 = load i32, i32* %44, align 4, !tbaa !2
  %46 = sub nsw i32 %45, %40
  store i32 %46, i32* %34, align 4, !tbaa !2
  %47 = load i32, i32* %44, align 4, !tbaa !2
  %48 = add nsw i32 %47, %40
  store i32 %48, i32* %44, align 4, !tbaa !2
  %49 = getelementptr inbounds i32, i32* %1, i64 %30
  %50 = load i32, i32* %49, align 4, !tbaa !2
  %51 = sub nsw i32 %50, %43
  store i32 %51, i32* %37, align 4, !tbaa !2
  %52 = load i32, i32* %49, align 4, !tbaa !2
  %53 = add nsw i32 %52, %43
  store i32 %53, i32* %49, align 4, !tbaa !2
  %54 = add nsw i32 %32, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32* %0, i64 %55
  %57 = load i32, i32* %56, align 4, !tbaa !2
  %58 = mul nsw i32 %57, %20
  %59 = getelementptr inbounds i32, i32* %1, i64 %55
  %60 = load i32, i32* %59, align 4, !tbaa !2
  %61 = mul nsw i32 %60, %22
  %62 = sub nsw i32 %58, %61
  %63 = mul nsw i32 %57, %22
  %64 = mul nsw i32 %60, %20
  %65 = add nsw i32 %64, %63
  %66 = or i64 %30, 1
  %67 = getelementptr inbounds i32, i32* %0, i64 %66
  %68 = load i32, i32* %67, align 4, !tbaa !2
  %69 = sub nsw i32 %68, %62
  store i32 %69, i32* %56, align 4, !tbaa !2
  %70 = load i32, i32* %67, align 4, !tbaa !2
  %71 = add nsw i32 %70, %62
  store i32 %71, i32* %67, align 4, !tbaa !2
  %72 = getelementptr inbounds i32, i32* %1, i64 %66
  %73 = load i32, i32* %72, align 4, !tbaa !2
  %74 = sub nsw i32 %73, %65
  store i32 %74, i32* %59, align 4, !tbaa !2
  %75 = load i32, i32* %72, align 4, !tbaa !2
  %76 = add nsw i32 %75, %65
  store i32 %76, i32* %72, align 4, !tbaa !2
  %77 = add nsw i32 %32, 2
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32* %0, i64 %78
  %80 = load i32, i32* %79, align 4, !tbaa !2
  %81 = mul nsw i32 %80, %20
  %82 = getelementptr inbounds i32, i32* %1, i64 %78
  %83 = load i32, i32* %82, align 4, !tbaa !2
  %84 = mul nsw i32 %83, %22
  %85 = sub nsw i32 %81, %84
  %86 = mul nsw i32 %80, %22
  %87 = mul nsw i32 %83, %20
  %88 = add nsw i32 %87, %86
  %89 = add nsw i64 %30, 2
  %90 = getelementptr inbounds i32, i32* %0, i64 %89
  %91 = load i32, i32* %90, align 4, !tbaa !2
  %92 = sub nsw i32 %91, %85
  store i32 %92, i32* %79, align 4, !tbaa !2
  %93 = load i32, i32* %90, align 4, !tbaa !2
  %94 = add nsw i32 %93, %85
  store i32 %94, i32* %90, align 4, !tbaa !2
  %95 = getelementptr inbounds i32, i32* %1, i64 %89
  %96 = load i32, i32* %95, align 4, !tbaa !2
  %97 = sub nsw i32 %96, %88
  store i32 %97, i32* %82, align 4, !tbaa !2
  %98 = load i32, i32* %95, align 4, !tbaa !2
  %99 = add nsw i32 %98, %88
  store i32 %99, i32* %95, align 4, !tbaa !2
  %100 = add nsw i32 %32, 3
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32* %0, i64 %101
  %103 = load i32, i32* %102, align 4, !tbaa !2
  %104 = mul nsw i32 %103, %20
  %105 = getelementptr inbounds i32, i32* %1, i64 %101
  %106 = load i32, i32* %105, align 4, !tbaa !2
  %107 = mul nsw i32 %106, %22
  %108 = sub nsw i32 %104, %107
  %109 = mul nsw i32 %103, %22
  %110 = mul nsw i32 %106, %20
  %111 = add nsw i32 %110, %109
  %112 = add nsw i64 %30, 3
  %113 = getelementptr inbounds i32, i32* %0, i64 %112
  %114 = load i32, i32* %113, align 4, !tbaa !2
  %115 = sub nsw i32 %114, %108
  store i32 %115, i32* %102, align 4, !tbaa !2
  %116 = load i32, i32* %113, align 4, !tbaa !2
  %117 = add nsw i32 %116, %108
  store i32 %117, i32* %113, align 4, !tbaa !2
  %118 = getelementptr inbounds i32, i32* %1, i64 %112
  %119 = load i32, i32* %118, align 4, !tbaa !2
  %120 = sub nsw i32 %119, %111
  store i32 %120, i32* %105, align 4, !tbaa !2
  %121 = load i32, i32* %118, align 4, !tbaa !2
  %122 = add nsw i32 %121, %111
  store i32 %122, i32* %118, align 4, !tbaa !2
  %123 = add nuw nsw i64 %29, 4
  %124 = icmp slt i64 %123, %13
  br i1 %124, label %28, label %125, !llvm.loop !6

125:                                              ; preds = %28, %16
  %126 = add nuw nsw i64 %17, 1
  %127 = icmp eq i64 %126, %15
  br i1 %127, label %128, label %16, !llvm.loop !9

128:                                              ; preds = %125, %5
  %129 = shl nsw i32 %9, 1
  %130 = sdiv i32 %8, 2
  %131 = shl i32 %7, 1
  %132 = or i32 %131, 1
  %133 = add nuw nsw i32 %6, 1
  %134 = icmp eq i32 %133, 8
  br i1 %134, label %135, label %5, !llvm.loop !10

135:                                              ; preds = %128
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
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
