; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/unfused_neura_exclusive_outputs/bicg_int/kernel-full.ll'
source_filename = "/mnt/public/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/bicg/bicg_int.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @kernel_bicg_int(ptr nocapture noundef readonly %A, ptr nocapture noundef readonly %p, ptr nocapture noundef readonly %r, ptr nocapture noundef initializes((0, 32)) %s, ptr nocapture noundef %q) local_unnamed_addr #0 {
entry:
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(32) %s, i8 0, i64 32, i1 false), !tbaa !5
  br label %for.body4

for.cond.cleanup3:                                ; preds = %for.cond.cleanup10
  ret void

for.body4:                                        ; preds = %for.cond.cleanup10, %entry
  %indvars.iv52 = phi i64 [ 0, %entry ], [ %indvars.iv.next53, %for.cond.cleanup10 ]
  %arrayidx6 = getelementptr inbounds nuw i32, ptr %q, i64 %indvars.iv52
  store i32 0, ptr %arrayidx6, align 4, !tbaa !5
  %arrayidx15 = getelementptr inbounds nuw i32, ptr %r, i64 %indvars.iv52
  %arrayidx13.idx = shl nsw i64 %indvars.iv52, 5
  %invariant.gep = getelementptr inbounds nuw i8, ptr %A, i64 %arrayidx13.idx
  br label %for.body11

for.cond.cleanup10:                               ; preds = %for.body11
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond56.not = icmp eq i64 %indvars.iv.next53, 8
  br i1 %exitcond56.not, label %for.cond.cleanup3, label %for.body4, !llvm.loop !9

for.body11:                                       ; preds = %for.body11, %for.body4
  %indvars.iv = phi i64 [ 0, %for.body4 ], [ %indvars.iv.next, %for.body11 ]
  %gep = getelementptr inbounds nuw i32, ptr %invariant.gep, i64 %indvars.iv
  %0 = load i32, ptr %gep, align 4, !tbaa !5
  %1 = load i32, ptr %arrayidx15, align 4, !tbaa !5
  %mul16 = mul nsw i32 %1, %0
  %arrayidx18 = getelementptr inbounds nuw i32, ptr %s, i64 %indvars.iv
  %2 = load i32, ptr %arrayidx18, align 4, !tbaa !5
  %add19 = add nsw i32 %2, %mul16
  store i32 %add19, ptr %arrayidx18, align 4, !tbaa !5
  %arrayidx21 = getelementptr inbounds nuw i32, ptr %p, i64 %indvars.iv
  %3 = load i32, ptr %arrayidx21, align 4, !tbaa !5
  %mul22 = mul nsw i32 %3, %0
  %4 = load i32, ptr %arrayidx6, align 4, !tbaa !5
  %add25 = add nsw i32 %4, %mul22
  store i32 %add25, ptr %arrayidx6, align 4, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond.not, label %for.cond.cleanup10, label %for.body11, !llvm.loop !12
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }

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
!12 = distinct !{!12, !10, !11}
