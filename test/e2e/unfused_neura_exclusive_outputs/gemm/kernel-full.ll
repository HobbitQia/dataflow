; ModuleID = '/mnt/public/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/gemm/gemm_int.c'
source_filename = "/mnt/public/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/gemm/gemm_int.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@stderr = external local_unnamed_addr global ptr, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @kernel_int(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, ptr nocapture noundef %C, ptr nocapture noundef readonly %A, ptr nocapture noundef readonly %B) local_unnamed_addr #0 {
entry:
  %cmp36 = icmp sgt i32 %ni, 0
  %cmp234 = icmp sgt i32 %nk, 0
  %or.cond = and i1 %cmp36, %cmp234
  %cmp532 = icmp sgt i32 %nj, 0
  %or.cond57 = and i1 %or.cond, %cmp532
  br i1 %or.cond57, label %for.cond1.preheader.us.us.preheader, label %for.end22

for.cond1.preheader.us.us.preheader:              ; preds = %entry
  %wide.trip.count55 = zext nneg i32 %ni to i64
  %wide.trip.count50 = zext nneg i32 %nk to i64
  %wide.trip.count = zext nneg i32 %nj to i64
  br label %for.cond1.preheader.us.us

for.cond1.preheader.us.us:                        ; preds = %for.cond1.preheader.us.us.preheader, %for.cond1.for.inc20_crit_edge.split.us.us.us
  %indvars.iv52 = phi i64 [ 0, %for.cond1.preheader.us.us.preheader ], [ %indvars.iv.next53, %for.cond1.for.inc20_crit_edge.split.us.us.us ]
  br label %for.cond4.preheader.us.us.us

for.cond4.preheader.us.us.us:                     ; preds = %for.cond4.for.inc17_crit_edge.us.us.us, %for.cond1.preheader.us.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.cond4.for.inc17_crit_edge.us.us.us ], [ 0, %for.cond1.preheader.us.us ]
  %arrayidx8.us.us.us = getelementptr inbounds nuw [1200 x i32], ptr %A, i64 %indvars.iv52, i64 %indvars.iv47
  br label %for.body6.us.us.us

for.body6.us.us.us:                               ; preds = %for.body6.us.us.us, %for.cond4.preheader.us.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body6.us.us.us ], [ 0, %for.cond4.preheader.us.us.us ]
  %0 = load i32, ptr %arrayidx8.us.us.us, align 4, !tbaa !5
  %arrayidx12.us.us.us = getelementptr inbounds nuw [1100 x i32], ptr %B, i64 %indvars.iv47, i64 %indvars.iv
  %1 = load i32, ptr %arrayidx12.us.us.us, align 4, !tbaa !5
  %mul.us.us.us = mul nsw i32 %1, %0
  %arrayidx16.us.us.us = getelementptr inbounds nuw [1100 x i32], ptr %C, i64 %indvars.iv52, i64 %indvars.iv
  %2 = load i32, ptr %arrayidx16.us.us.us, align 4, !tbaa !5
  %add.us.us.us = add nsw i32 %2, %mul.us.us.us
  store i32 %add.us.us.us, ptr %arrayidx16.us.us.us, align 4, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond4.for.inc17_crit_edge.us.us.us, label %for.body6.us.us.us, !llvm.loop !9

for.cond4.for.inc17_crit_edge.us.us.us:           ; preds = %for.body6.us.us.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond51.not = icmp eq i64 %indvars.iv.next48, %wide.trip.count50
  br i1 %exitcond51.not, label %for.cond1.for.inc20_crit_edge.split.us.us.us, label %for.cond4.preheader.us.us.us, !llvm.loop !16

for.cond1.for.inc20_crit_edge.split.us.us.us:     ; preds = %for.cond4.for.inc17_crit_edge.us.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond56.not = icmp eq i64 %indvars.iv.next53, %wide.trip.count55
  br i1 %exitcond56.not, label %for.end22, label %for.cond1.preheader.us.us, !llvm.loop !18

for.end22:                                        ; preds = %for.cond1.for.inc20_crit_edge.split.us.us.us, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nocapture noundef readonly %argv) local_unnamed_addr #1 {
entry:
  %call = tail call ptr @polybench_alloc_data(i64 noundef 1100000, i32 noundef 4) #7
  %call1 = tail call ptr @polybench_alloc_data(i64 noundef 1200000, i32 noundef 4) #7
  %call2 = tail call ptr @polybench_alloc_data(i64 noundef 1320000, i32 noundef 4) #7
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.inc6.i, %entry
  %indvars.iv79.i = phi i64 [ 0, %entry ], [ %indvars.iv.next80.i, %for.inc6.i ]
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i, %for.body3.i ]
  %0 = mul nuw nsw i64 %indvars.iv.i, %indvars.iv79.i
  %1 = trunc nuw nsw i64 %0 to i32
  %rem.i = urem i32 %1, 13
  %arrayidx5.i = getelementptr inbounds nuw [1100 x i32], ptr %call, i64 %indvars.iv79.i, i64 %indvars.iv.i
  store i32 %rem.i, ptr %arrayidx5.i, align 4, !tbaa !5
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 1100
  br i1 %exitcond.not.i, label %for.inc6.i, label %for.body3.i, !llvm.loop !19

for.inc6.i:                                       ; preds = %for.body3.i
  %indvars.iv.next80.i = add nuw nsw i64 %indvars.iv79.i, 1
  %exitcond82.not.i = icmp eq i64 %indvars.iv.next80.i, 1000
  br i1 %exitcond82.not.i, label %for.cond12.preheader.i, label %for.cond1.preheader.i, !llvm.loop !20

for.cond12.preheader.i:                           ; preds = %for.inc6.i, %for.inc24.i
  %indvars.iv88.i = phi i64 [ %indvars.iv.next89.i, %for.inc24.i ], [ 0, %for.inc6.i ]
  br label %for.body14.i

for.body14.i:                                     ; preds = %for.body14.i, %for.cond12.preheader.i
  %indvars.iv83.i = phi i64 [ 0, %for.cond12.preheader.i ], [ %indvars.iv.next84.i, %for.body14.i ]
  %indvars.iv.next84.i = add nuw nsw i64 %indvars.iv83.i, 1
  %2 = mul nuw nsw i64 %indvars.iv.next84.i, %indvars.iv88.i
  %3 = trunc nuw nsw i64 %2 to i32
  %rem16.i = urem i32 %3, 17
  %arrayidx20.i = getelementptr inbounds nuw [1200 x i32], ptr %call1, i64 %indvars.iv88.i, i64 %indvars.iv83.i
  store i32 %rem16.i, ptr %arrayidx20.i, align 4, !tbaa !5
  %exitcond87.not.i = icmp eq i64 %indvars.iv.next84.i, 1200
  br i1 %exitcond87.not.i, label %for.inc24.i, label %for.body14.i, !llvm.loop !21

for.inc24.i:                                      ; preds = %for.body14.i
  %indvars.iv.next89.i = add nuw nsw i64 %indvars.iv88.i, 1
  %exitcond91.not.i = icmp eq i64 %indvars.iv.next89.i, 1000
  br i1 %exitcond91.not.i, label %for.cond30.preheader.i, label %for.cond12.preheader.i, !llvm.loop !22

for.cond30.preheader.i:                           ; preds = %for.inc24.i, %for.inc43.i
  %indvars.iv98.i = phi i64 [ %indvars.iv.next99.i, %for.inc43.i ], [ 0, %for.inc24.i ]
  br label %for.body32.i

for.body32.i:                                     ; preds = %for.body32.i, %for.cond30.preheader.i
  %indvars.iv92.i = phi i64 [ 0, %for.cond30.preheader.i ], [ %indvars.iv.next93.i, %for.body32.i ]
  %4 = add nuw nsw i64 %indvars.iv92.i, 2
  %5 = mul nuw nsw i64 %4, %indvars.iv98.i
  %6 = trunc nuw nsw i64 %5 to i32
  %rem35.i = urem i32 %6, 19
  %arrayidx39.i = getelementptr inbounds nuw [1100 x i32], ptr %call2, i64 %indvars.iv98.i, i64 %indvars.iv92.i
  store i32 %rem35.i, ptr %arrayidx39.i, align 4, !tbaa !5
  %indvars.iv.next93.i = add nuw nsw i64 %indvars.iv92.i, 1
  %exitcond97.not.i = icmp eq i64 %indvars.iv.next93.i, 1100
  br i1 %exitcond97.not.i, label %for.inc43.i, label %for.body32.i, !llvm.loop !23

for.inc43.i:                                      ; preds = %for.body32.i
  %indvars.iv.next99.i = add nuw nsw i64 %indvars.iv98.i, 1
  %exitcond101.not.i = icmp eq i64 %indvars.iv.next99.i, 1200
  br i1 %exitcond101.not.i, label %for.cond1.preheader.us.us.i, label %for.cond30.preheader.i, !llvm.loop !24

for.cond1.preheader.us.us.i:                      ; preds = %for.inc43.i, %for.cond1.for.inc20_crit_edge.split.us.us.us.i
  %indvars.iv52.i = phi i64 [ %indvars.iv.next53.i, %for.cond1.for.inc20_crit_edge.split.us.us.us.i ], [ 0, %for.inc43.i ]
  br label %for.cond4.preheader.us.us.us.i

for.cond4.preheader.us.us.us.i:                   ; preds = %for.cond4.for.inc17_crit_edge.us.us.us.i, %for.cond1.preheader.us.us.i
  %indvars.iv47.i = phi i64 [ %indvars.iv.next48.i, %for.cond4.for.inc17_crit_edge.us.us.us.i ], [ 0, %for.cond1.preheader.us.us.i ]
  %arrayidx8.us.us.us.i = getelementptr inbounds nuw [1200 x i32], ptr %call1, i64 %indvars.iv52.i, i64 %indvars.iv47.i
  br label %for.body6.us.us.us.i

for.body6.us.us.us.i:                             ; preds = %for.body6.us.us.us.i, %for.cond4.preheader.us.us.us.i
  %indvars.iv.i22 = phi i64 [ %indvars.iv.next.i23, %for.body6.us.us.us.i ], [ 0, %for.cond4.preheader.us.us.us.i ]
  %7 = load i32, ptr %arrayidx8.us.us.us.i, align 4, !tbaa !5
  %arrayidx12.us.us.us.i = getelementptr inbounds nuw [1100 x i32], ptr %call2, i64 %indvars.iv47.i, i64 %indvars.iv.i22
  %8 = load i32, ptr %arrayidx12.us.us.us.i, align 4, !tbaa !5
  %mul.us.us.us.i = mul nsw i32 %8, %7
  %arrayidx16.us.us.us.i = getelementptr inbounds nuw [1100 x i32], ptr %call, i64 %indvars.iv52.i, i64 %indvars.iv.i22
  %9 = load i32, ptr %arrayidx16.us.us.us.i, align 4, !tbaa !5
  %add.us.us.us.i = add nsw i32 %9, %mul.us.us.us.i
  store i32 %add.us.us.us.i, ptr %arrayidx16.us.us.us.i, align 4, !tbaa !5
  %indvars.iv.next.i23 = add nuw nsw i64 %indvars.iv.i22, 1
  %exitcond.not.i24 = icmp eq i64 %indvars.iv.next.i23, 1100
  br i1 %exitcond.not.i24, label %for.cond4.for.inc17_crit_edge.us.us.us.i, label %for.body6.us.us.us.i, !llvm.loop !9

for.cond4.for.inc17_crit_edge.us.us.us.i:         ; preds = %for.body6.us.us.us.i
  %indvars.iv.next48.i = add nuw nsw i64 %indvars.iv47.i, 1
  %exitcond51.not.i = icmp eq i64 %indvars.iv.next48.i, 1200
  br i1 %exitcond51.not.i, label %for.cond1.for.inc20_crit_edge.split.us.us.us.i, label %for.cond4.preheader.us.us.us.i, !llvm.loop !16

for.cond1.for.inc20_crit_edge.split.us.us.us.i:   ; preds = %for.cond4.for.inc17_crit_edge.us.us.us.i
  %indvars.iv.next53.i = add nuw nsw i64 %indvars.iv52.i, 1
  %exitcond56.not.i = icmp eq i64 %indvars.iv.next53.i, 1000
  br i1 %exitcond56.not.i, label %kernel_int.exit, label %for.cond1.preheader.us.us.i, !llvm.loop !18

kernel_int.exit:                                  ; preds = %for.cond1.for.inc20_crit_edge.split.us.us.us.i
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %kernel_int.exit
  %10 = load ptr, ptr %argv, align 8, !tbaa !25
  %strcmpload = load i8, ptr %10, align 1
  %tobool.not = icmp eq i8 %strcmpload, 0
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(ptr noundef nonnull %call)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %kernel_int.exit
  tail call void @free(ptr noundef nonnull %call) #7
  tail call void @free(ptr noundef nonnull %call1) #7
  tail call void @free(ptr noundef nonnull %call2) #7
  ret i32 0
}

declare ptr @polybench_alloc_data(i64 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: cold nofree nounwind uwtable
define internal fastcc void @print_array(ptr nocapture noundef readonly %C) unnamed_addr #3 {
entry:
  %0 = load ptr, ptr @stderr, align 8, !tbaa !28
  %1 = tail call i64 @fwrite(ptr nonnull @.str.1, i64 22, i64 1, ptr %0) #8
  %2 = load ptr, ptr @stderr, align 8, !tbaa !28
  %call1 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.3) #9
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %entry, %for.inc10
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next27, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv26, 1000
  br label %for.body4

for.body4:                                        ; preds = %for.cond2.preheader, %if.end
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc nuw nsw i64 %4 to i32
  %rem = urem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load ptr, ptr @stderr, align 8, !tbaa !28
  %fputc = tail call i32 @fputc(i32 10, ptr %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load ptr, ptr @stderr, align 8, !tbaa !28
  %arrayidx8 = getelementptr inbounds nuw [1100 x i32], ptr %C, i64 %indvars.iv26, i64 %indvars.iv
  %8 = load i32, ptr %arrayidx8, align 4, !tbaa !5
  %call9 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef nonnull @.str.5, i32 noundef %8) #9
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond.not, label %for.inc10, label %for.body4, !llvm.loop !30

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond30.not = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond30.not, label %for.end12, label %for.cond2.preheader, !llvm.loop !31

for.end12:                                        ; preds = %for.inc10
  %9 = load ptr, ptr @stderr, align 8, !tbaa !28
  %call13 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef nonnull @.str.6, ptr noundef nonnull @.str.3) #9
  %10 = load ptr, ptr @stderr, align 8, !tbaa !28
  %11 = tail call i64 @fwrite(ptr nonnull @.str.7, i64 22, i64 1, ptr %10) #8
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare noundef i32 @fputc(i32 noundef, ptr nocapture noundef) local_unnamed_addr #6

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind }
attributes #8 = { cold }
attributes #9 = { cold nounwind }

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
!9 = distinct !{!9, !10, !11, !12}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.vectorize.followup_all", !13}
!13 = distinct !{!13, !10, !14, !15}
!14 = !{!"llvm.loop.isvectorized"}
!15 = !{!"llvm.loop.unroll.count", i32 4}
!16 = distinct !{!16, !10, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !10, !17}
!19 = distinct !{!19, !10, !17}
!20 = distinct !{!20, !10, !17}
!21 = distinct !{!21, !10, !17}
!22 = distinct !{!22, !10, !17}
!23 = distinct !{!23, !10, !17}
!24 = distinct !{!24, !10, !17}
!25 = !{!26, !26, i64 0}
!26 = !{!"p1 omnipotent char", !27, i64 0}
!27 = !{!"any pointer", !7, i64 0}
!28 = !{!29, !29, i64 0}
!29 = !{!"p1 _ZTS8_IO_FILE", !27, i64 0}
!30 = distinct !{!30, !10, !17}
!31 = distinct !{!31, !10, !17}
