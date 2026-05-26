; ModuleID = '/mnt/public/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/spmv/spmv.c'
source_filename = "/mnt/public/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/spmv/spmv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@nnz = dso_local local_unnamed_addr global i32 100, align 4
@val = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@col = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@row = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@feature = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@output = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none) uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load i32, ptr @nnz, align 4, !tbaa !5
  %cmp13.i = icmp sgt i32 %0, 0
  br i1 %cmp13.i, label %for.body.preheader.i, label %kernel.exit

for.body.preheader.i:                             ; preds = %entry
  %wide.trip.count.i = zext nneg i32 %0 to i64
  %xtraiter = and i64 %wide.trip.count.i, 3
  %1 = icmp ult i32 %0, 4
  br i1 %1, label %kernel.exit.loopexit.unr-lcssa, label %for.body.preheader.i.new

for.body.preheader.i.new:                         ; preds = %for.body.preheader.i
  %unroll_iter = and i64 %wide.trip.count.i, 2147483644
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.body.preheader.i.new
  %indvars.iv.i = phi i64 [ 0, %for.body.preheader.i.new ], [ %indvars.iv.next.i.3, %for.body.i ]
  %niter = phi i64 [ 0, %for.body.preheader.i.new ], [ %niter.next.3, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i32, ptr @val, i64 %indvars.iv.i
  %2 = load i32, ptr %arrayidx.i, align 16, !tbaa !5
  %arrayidx2.i = getelementptr inbounds nuw i32, ptr @col, i64 %indvars.iv.i
  %3 = load i32, ptr %arrayidx2.i, align 16, !tbaa !5
  %idxprom3.i = sext i32 %3 to i64
  %arrayidx4.i = getelementptr inbounds i32, ptr @feature, i64 %idxprom3.i
  %4 = load i32, ptr %arrayidx4.i, align 4, !tbaa !5
  %mul.i = mul nsw i32 %4, %2
  %arrayidx6.i = getelementptr inbounds nuw i32, ptr @row, i64 %indvars.iv.i
  %5 = load i32, ptr %arrayidx6.i, align 16, !tbaa !5
  %idxprom7.i = sext i32 %5 to i64
  %arrayidx8.i = getelementptr inbounds i32, ptr @output, i64 %idxprom7.i
  %6 = load i32, ptr %arrayidx8.i, align 4, !tbaa !5
  %add.i = add nsw i32 %6, %mul.i
  store i32 %add.i, ptr %arrayidx8.i, align 4, !tbaa !5
  %indvars.iv.next.i = or disjoint i64 %indvars.iv.i, 1
  %arrayidx.i.1 = getelementptr inbounds nuw i32, ptr @val, i64 %indvars.iv.next.i
  %7 = load i32, ptr %arrayidx.i.1, align 4, !tbaa !5
  %arrayidx2.i.1 = getelementptr inbounds nuw i32, ptr @col, i64 %indvars.iv.next.i
  %8 = load i32, ptr %arrayidx2.i.1, align 4, !tbaa !5
  %idxprom3.i.1 = sext i32 %8 to i64
  %arrayidx4.i.1 = getelementptr inbounds i32, ptr @feature, i64 %idxprom3.i.1
  %9 = load i32, ptr %arrayidx4.i.1, align 4, !tbaa !5
  %mul.i.1 = mul nsw i32 %9, %7
  %arrayidx6.i.1 = getelementptr inbounds nuw i32, ptr @row, i64 %indvars.iv.next.i
  %10 = load i32, ptr %arrayidx6.i.1, align 4, !tbaa !5
  %idxprom7.i.1 = sext i32 %10 to i64
  %arrayidx8.i.1 = getelementptr inbounds i32, ptr @output, i64 %idxprom7.i.1
  %11 = load i32, ptr %arrayidx8.i.1, align 4, !tbaa !5
  %add.i.1 = add nsw i32 %11, %mul.i.1
  store i32 %add.i.1, ptr %arrayidx8.i.1, align 4, !tbaa !5
  %indvars.iv.next.i.1 = or disjoint i64 %indvars.iv.i, 2
  %arrayidx.i.2 = getelementptr inbounds nuw i32, ptr @val, i64 %indvars.iv.next.i.1
  %12 = load i32, ptr %arrayidx.i.2, align 8, !tbaa !5
  %arrayidx2.i.2 = getelementptr inbounds nuw i32, ptr @col, i64 %indvars.iv.next.i.1
  %13 = load i32, ptr %arrayidx2.i.2, align 8, !tbaa !5
  %idxprom3.i.2 = sext i32 %13 to i64
  %arrayidx4.i.2 = getelementptr inbounds i32, ptr @feature, i64 %idxprom3.i.2
  %14 = load i32, ptr %arrayidx4.i.2, align 4, !tbaa !5
  %mul.i.2 = mul nsw i32 %14, %12
  %arrayidx6.i.2 = getelementptr inbounds nuw i32, ptr @row, i64 %indvars.iv.next.i.1
  %15 = load i32, ptr %arrayidx6.i.2, align 8, !tbaa !5
  %idxprom7.i.2 = sext i32 %15 to i64
  %arrayidx8.i.2 = getelementptr inbounds i32, ptr @output, i64 %idxprom7.i.2
  %16 = load i32, ptr %arrayidx8.i.2, align 4, !tbaa !5
  %add.i.2 = add nsw i32 %16, %mul.i.2
  store i32 %add.i.2, ptr %arrayidx8.i.2, align 4, !tbaa !5
  %indvars.iv.next.i.2 = or disjoint i64 %indvars.iv.i, 3
  %arrayidx.i.3 = getelementptr inbounds nuw i32, ptr @val, i64 %indvars.iv.next.i.2
  %17 = load i32, ptr %arrayidx.i.3, align 4, !tbaa !5
  %arrayidx2.i.3 = getelementptr inbounds nuw i32, ptr @col, i64 %indvars.iv.next.i.2
  %18 = load i32, ptr %arrayidx2.i.3, align 4, !tbaa !5
  %idxprom3.i.3 = sext i32 %18 to i64
  %arrayidx4.i.3 = getelementptr inbounds i32, ptr @feature, i64 %idxprom3.i.3
  %19 = load i32, ptr %arrayidx4.i.3, align 4, !tbaa !5
  %mul.i.3 = mul nsw i32 %19, %17
  %arrayidx6.i.3 = getelementptr inbounds nuw i32, ptr @row, i64 %indvars.iv.next.i.2
  %20 = load i32, ptr %arrayidx6.i.3, align 4, !tbaa !5
  %idxprom7.i.3 = sext i32 %20 to i64
  %arrayidx8.i.3 = getelementptr inbounds i32, ptr @output, i64 %idxprom7.i.3
  %21 = load i32, ptr %arrayidx8.i.3, align 4, !tbaa !5
  %add.i.3 = add nsw i32 %21, %mul.i.3
  store i32 %add.i.3, ptr %arrayidx8.i.3, align 4, !tbaa !5
  %indvars.iv.next.i.3 = add nuw nsw i64 %indvars.iv.i, 4
  %niter.next.3 = add nuw i64 %niter, 4
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %kernel.exit.loopexit.unr-lcssa, label %for.body.i, !llvm.loop !9

kernel.exit.loopexit.unr-lcssa:                   ; preds = %for.body.i, %for.body.preheader.i
  %indvars.iv.i.unr = phi i64 [ 0, %for.body.preheader.i ], [ %indvars.iv.next.i.3, %for.body.i ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %kernel.exit, label %for.body.i.epil

for.body.i.epil:                                  ; preds = %kernel.exit.loopexit.unr-lcssa, %for.body.i.epil
  %indvars.iv.i.epil = phi i64 [ %indvars.iv.next.i.epil, %for.body.i.epil ], [ %indvars.iv.i.unr, %kernel.exit.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.body.i.epil ], [ 0, %kernel.exit.loopexit.unr-lcssa ]
  %arrayidx.i.epil = getelementptr inbounds nuw i32, ptr @val, i64 %indvars.iv.i.epil
  %22 = load i32, ptr %arrayidx.i.epil, align 4, !tbaa !5
  %arrayidx2.i.epil = getelementptr inbounds nuw i32, ptr @col, i64 %indvars.iv.i.epil
  %23 = load i32, ptr %arrayidx2.i.epil, align 4, !tbaa !5
  %idxprom3.i.epil = sext i32 %23 to i64
  %arrayidx4.i.epil = getelementptr inbounds i32, ptr @feature, i64 %idxprom3.i.epil
  %24 = load i32, ptr %arrayidx4.i.epil, align 4, !tbaa !5
  %mul.i.epil = mul nsw i32 %24, %22
  %arrayidx6.i.epil = getelementptr inbounds nuw i32, ptr @row, i64 %indvars.iv.i.epil
  %25 = load i32, ptr %arrayidx6.i.epil, align 4, !tbaa !5
  %idxprom7.i.epil = sext i32 %25 to i64
  %arrayidx8.i.epil = getelementptr inbounds i32, ptr @output, i64 %idxprom7.i.epil
  %26 = load i32, ptr %arrayidx8.i.epil, align 4, !tbaa !5
  %add.i.epil = add nsw i32 %26, %mul.i.epil
  store i32 %add.i.epil, ptr %arrayidx8.i.epil, align 4, !tbaa !5
  %indvars.iv.next.i.epil = add nuw nsw i64 %indvars.iv.i.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %kernel.exit, label %for.body.i.epil, !llvm.loop !12

kernel.exit:                                      ; preds = %kernel.exit.loopexit.unr-lcssa, %for.body.i.epil, %entry
  ret i32 0
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @kernel(i32 noundef %nnz, ptr nocapture noundef readonly %val, ptr nocapture noundef readonly %col, ptr nocapture noundef readonly %row, ptr nocapture noundef readonly %feature, ptr nocapture noundef %output) local_unnamed_addr #1 {
entry:
  %cmp13 = icmp sgt i32 %nnz, 0
  br i1 %cmp13, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext nneg i32 %nnz to i64
  %xtraiter = and i64 %wide.trip.count, 3
  %0 = icmp ult i32 %nnz, 4
  br i1 %0, label %for.end.loopexit.unr-lcssa, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %wide.trip.count, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %indvars.iv = phi i64 [ 0, %for.body.preheader.new ], [ %indvars.iv.next.3, %for.body ]
  %niter = phi i64 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
  %arrayidx = getelementptr inbounds nuw i32, ptr %val, i64 %indvars.iv
  %1 = load i32, ptr %arrayidx, align 4, !tbaa !5
  %arrayidx2 = getelementptr inbounds nuw i32, ptr %col, i64 %indvars.iv
  %2 = load i32, ptr %arrayidx2, align 4, !tbaa !5
  %idxprom3 = sext i32 %2 to i64
  %arrayidx4 = getelementptr inbounds i32, ptr %feature, i64 %idxprom3
  %3 = load i32, ptr %arrayidx4, align 4, !tbaa !5
  %mul = mul nsw i32 %3, %1
  %arrayidx6 = getelementptr inbounds nuw i32, ptr %row, i64 %indvars.iv
  %4 = load i32, ptr %arrayidx6, align 4, !tbaa !5
  %idxprom7 = sext i32 %4 to i64
  %arrayidx8 = getelementptr inbounds i32, ptr %output, i64 %idxprom7
  %5 = load i32, ptr %arrayidx8, align 4, !tbaa !5
  %add = add nsw i32 %5, %mul
  store i32 %add, ptr %arrayidx8, align 4, !tbaa !5
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1
  %arrayidx.1 = getelementptr inbounds nuw i32, ptr %val, i64 %indvars.iv.next
  %6 = load i32, ptr %arrayidx.1, align 4, !tbaa !5
  %arrayidx2.1 = getelementptr inbounds nuw i32, ptr %col, i64 %indvars.iv.next
  %7 = load i32, ptr %arrayidx2.1, align 4, !tbaa !5
  %idxprom3.1 = sext i32 %7 to i64
  %arrayidx4.1 = getelementptr inbounds i32, ptr %feature, i64 %idxprom3.1
  %8 = load i32, ptr %arrayidx4.1, align 4, !tbaa !5
  %mul.1 = mul nsw i32 %8, %6
  %arrayidx6.1 = getelementptr inbounds nuw i32, ptr %row, i64 %indvars.iv.next
  %9 = load i32, ptr %arrayidx6.1, align 4, !tbaa !5
  %idxprom7.1 = sext i32 %9 to i64
  %arrayidx8.1 = getelementptr inbounds i32, ptr %output, i64 %idxprom7.1
  %10 = load i32, ptr %arrayidx8.1, align 4, !tbaa !5
  %add.1 = add nsw i32 %10, %mul.1
  store i32 %add.1, ptr %arrayidx8.1, align 4, !tbaa !5
  %indvars.iv.next.1 = or disjoint i64 %indvars.iv, 2
  %arrayidx.2 = getelementptr inbounds nuw i32, ptr %val, i64 %indvars.iv.next.1
  %11 = load i32, ptr %arrayidx.2, align 4, !tbaa !5
  %arrayidx2.2 = getelementptr inbounds nuw i32, ptr %col, i64 %indvars.iv.next.1
  %12 = load i32, ptr %arrayidx2.2, align 4, !tbaa !5
  %idxprom3.2 = sext i32 %12 to i64
  %arrayidx4.2 = getelementptr inbounds i32, ptr %feature, i64 %idxprom3.2
  %13 = load i32, ptr %arrayidx4.2, align 4, !tbaa !5
  %mul.2 = mul nsw i32 %13, %11
  %arrayidx6.2 = getelementptr inbounds nuw i32, ptr %row, i64 %indvars.iv.next.1
  %14 = load i32, ptr %arrayidx6.2, align 4, !tbaa !5
  %idxprom7.2 = sext i32 %14 to i64
  %arrayidx8.2 = getelementptr inbounds i32, ptr %output, i64 %idxprom7.2
  %15 = load i32, ptr %arrayidx8.2, align 4, !tbaa !5
  %add.2 = add nsw i32 %15, %mul.2
  store i32 %add.2, ptr %arrayidx8.2, align 4, !tbaa !5
  %indvars.iv.next.2 = or disjoint i64 %indvars.iv, 3
  %arrayidx.3 = getelementptr inbounds nuw i32, ptr %val, i64 %indvars.iv.next.2
  %16 = load i32, ptr %arrayidx.3, align 4, !tbaa !5
  %arrayidx2.3 = getelementptr inbounds nuw i32, ptr %col, i64 %indvars.iv.next.2
  %17 = load i32, ptr %arrayidx2.3, align 4, !tbaa !5
  %idxprom3.3 = sext i32 %17 to i64
  %arrayidx4.3 = getelementptr inbounds i32, ptr %feature, i64 %idxprom3.3
  %18 = load i32, ptr %arrayidx4.3, align 4, !tbaa !5
  %mul.3 = mul nsw i32 %18, %16
  %arrayidx6.3 = getelementptr inbounds nuw i32, ptr %row, i64 %indvars.iv.next.2
  %19 = load i32, ptr %arrayidx6.3, align 4, !tbaa !5
  %idxprom7.3 = sext i32 %19 to i64
  %arrayidx8.3 = getelementptr inbounds i32, ptr %output, i64 %idxprom7.3
  %20 = load i32, ptr %arrayidx8.3, align 4, !tbaa !5
  %add.3 = add nsw i32 %20, %mul.3
  store i32 %add.3, ptr %arrayidx8.3, align 4, !tbaa !5
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.next.3 = add nuw i64 %niter, 4
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !13

for.end.loopexit.unr-lcssa:                       ; preds = %for.body, %for.body.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next.3, %for.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil

for.body.epil:                                    ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %for.body.epil ], [ %indvars.iv.unr, %for.end.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.body.epil ], [ 0, %for.end.loopexit.unr-lcssa ]
  %arrayidx.epil = getelementptr inbounds nuw i32, ptr %val, i64 %indvars.iv.epil
  %21 = load i32, ptr %arrayidx.epil, align 4, !tbaa !5
  %arrayidx2.epil = getelementptr inbounds nuw i32, ptr %col, i64 %indvars.iv.epil
  %22 = load i32, ptr %arrayidx2.epil, align 4, !tbaa !5
  %idxprom3.epil = sext i32 %22 to i64
  %arrayidx4.epil = getelementptr inbounds i32, ptr %feature, i64 %idxprom3.epil
  %23 = load i32, ptr %arrayidx4.epil, align 4, !tbaa !5
  %mul.epil = mul nsw i32 %23, %21
  %arrayidx6.epil = getelementptr inbounds nuw i32, ptr %row, i64 %indvars.iv.epil
  %24 = load i32, ptr %arrayidx6.epil, align 4, !tbaa !5
  %idxprom7.epil = sext i32 %24 to i64
  %arrayidx8.epil = getelementptr inbounds i32, ptr %output, i64 %idxprom7.epil
  %25 = load i32, ptr %arrayidx8.epil, align 4, !tbaa !5
  %add.epil = add nsw i32 %25, %mul.epil
  store i32 %add.epil, ptr %arrayidx8.epil, align 4, !tbaa !5
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !llvm.loop !14

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %entry
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 20.1.7 (https://github.com/llvm/llvm-project.git 6146a88f60492b520a36f8f8f3231e15f3cc6082)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !11}
