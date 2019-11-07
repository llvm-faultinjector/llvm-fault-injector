; ModuleID = '.\qsort-recursive-3-o2.ll'
source_filename = ".\5Cqsort-recursive.c"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.14.26431"

%struct._iobuf = type { i8* }
%struct.__crt_locale_pointers = type { %struct.__crt_locale_data*, %struct.__crt_multibyte_data* }
%struct.__crt_locale_data = type opaque
%struct.__crt_multibyte_data = type opaque

$printf = comdat any

$__local_stdio_printf_options = comdat any

$"??_C@_03JDANDILB@?$CFd?5?$AA@" = comdat any

@main.arr = private unnamed_addr constant [97 x i32] [i32 7, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0], align 16
@"??_C@_03JDANDILB@?$CFd?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"%d \00", comdat, align 1
@__local_stdio_printf_options._OptionsStorage = internal global i64 0, align 8

; Function Attrs: nounwind uwtable
define dso_local void @qsort(i32*, i32, i32) local_unnamed_addr #0 {
  %4 = icmp slt i32 %1, %2
  br i1 %4, label %.lr.ph39.preheader, label %tailrecurse._crit_edge

.lr.ph39.preheader:                               ; preds = %3
  %wide.trip.count = sext i32 %2 to i64
  br label %.lr.ph39

.lr.ph39:                                         ; preds = %tailrecurse, %.lr.ph39.preheader
  %.tr3237 = phi i32 [ %30, %tailrecurse ], [ %1, %.lr.ph39.preheader ]
  %5 = add nsw i32 %.tr3237, %2
  %6 = sdiv i32 %5, 2
  %7 = sext i32 %.tr3237 to i64
  %8 = getelementptr inbounds i32, i32* %0, i64 %7
  %9 = load i32, i32* %8, align 4, !tbaa !3
  %10 = sext i32 %6 to i64
  %11 = getelementptr inbounds i32, i32* %0, i64 %10
  %12 = load i32, i32* %11, align 4, !tbaa !3
  store i32 %12, i32* %8, align 4, !tbaa !3
  store i32 %9, i32* %11, align 4, !tbaa !3
  %13 = icmp slt i32 %.tr3237, %2
  br i1 %13, label %.lr.ph, label %tailrecurse

.lr.ph:                                           ; preds = %26, %.lr.ph39
  %indvars.iv = phi i64 [ %indvars.iv.next, %26 ], [ %7, %.lr.ph39 ]
  %.035 = phi i32 [ %.1, %26 ], [ %.tr3237, %.lr.ph39 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %14 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next
  %15 = load i32, i32* %14, align 4, !tbaa !3
  %16 = sext i32 %.tr3237 to i64
  %17 = getelementptr inbounds i32, i32* %0, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !3
  %19 = icmp slt i32 %15, %18
  br i1 %19, label %20, label %26

; <label>:20:                                     ; preds = %.lr.ph
  %21 = add nsw i32 %.035, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32* %0, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !3
  %25 = load i32, i32* %14, align 4, !tbaa !3
  store i32 %25, i32* %23, align 4, !tbaa !3
  store i32 %24, i32* %14, align 4, !tbaa !3
  br label %26

; <label>:26:                                     ; preds = %20, %.lr.ph
  %.1 = phi i32 [ %21, %20 ], [ %.035, %.lr.ph ]
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %tailrecurse.loopexit, label %.lr.ph

tailrecurse.loopexit:                             ; preds = %26
  %.pre = sext i32 %.1 to i64
  %.pre40 = getelementptr inbounds i32, i32* %0, i64 %.pre
  br label %tailrecurse

tailrecurse:                                      ; preds = %tailrecurse.loopexit, %.lr.ph39
  %.pre-phi41 = phi i32* [ %.pre40, %tailrecurse.loopexit ], [ %8, %.lr.ph39 ]
  %.0.lcssa = phi i32 [ %.1, %tailrecurse.loopexit ], [ %.tr3237, %.lr.ph39 ]
  %27 = load i32, i32* %8, align 4, !tbaa !3
  %28 = load i32, i32* %.pre-phi41, align 4, !tbaa !3
  store i32 %28, i32* %8, align 4, !tbaa !3
  store i32 %27, i32* %.pre-phi41, align 4, !tbaa !3
  %29 = add nsw i32 %.0.lcssa, -1
  tail call void @qsort(i32* nonnull %0, i32 %.tr3237, i32 %29)
  %30 = add nsw i32 %.0.lcssa, 1
  %31 = icmp slt i32 %30, %2
  br i1 %31, label %.lr.ph39, label %tailrecurse._crit_edge

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %3
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind uwtable
define dso_local void @swap(i32* nocapture, i32, i32) local_unnamed_addr #2 {
  %4 = sext i32 %1 to i64
  %5 = getelementptr inbounds i32, i32* %0, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !3
  %7 = sext i32 %2 to i64
  %8 = getelementptr inbounds i32, i32* %0, i64 %7
  %9 = load i32, i32* %8, align 4, !tbaa !3
  store i32 %9, i32* %5, align 4, !tbaa !3
  store i32 %6, i32* %8, align 4, !tbaa !3
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [97 x i32], align 16
  %2 = bitcast [97 x i32]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 388, i8* nonnull %2) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %2, i8* align 16 bitcast ([97 x i32]* @main.arr to i8*), i64 388, i1 false)
  %3 = getelementptr inbounds [97 x i32], [97 x i32]* %1, i64 0, i64 0
  call void @qsort(i32* nonnull %3, i32 0, i32 96)
  br label %5

; <label>:4:                                      ; preds = %5
  call void @llvm.lifetime.end.p0i8(i64 388, i8* nonnull %2) #4
  ret i32 0

; <label>:5:                                      ; preds = %5, %0
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %5 ]
  %6 = getelementptr inbounds [97 x i32], [97 x i32]* %1, i64 0, i64 %indvars.iv
  %7 = load i32, i32* %6, align 4, !tbaa !3
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03JDANDILB@?$CFd?5?$AA@", i64 0, i64 0), i32 %7)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 97
  br i1 %exitcond, label %4, label %5
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @printf(i8*, ...) local_unnamed_addr #3 comdat {
  %2 = alloca i8*, align 8
  %3 = bitcast i8** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3) #4
  call void @llvm.va_start(i8* nonnull %3)
  %4 = load i8*, i8** %2, align 8, !tbaa !7
  %5 = call %struct._iobuf* @__acrt_iob_func(i32 1) #4
  %6 = call i64* @__local_stdio_printf_options() #4
  %7 = load i64, i64* %6, align 8, !tbaa !9
  %8 = call i32 @__stdio_common_vfprintf(i64 %7, %struct._iobuf* %5, i8* %0, %struct.__crt_locale_pointers* null, i8* %4) #4
  call void @llvm.va_end(i8* nonnull %3)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3) #4
  ret i32 %8
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #4

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #4

; Function Attrs: noinline norecurse nounwind uwtable
define linkonce_odr dso_local i64* @__local_stdio_printf_options() local_unnamed_addr #5 comdat {
  ret i64* @__local_stdio_printf_options._OptionsStorage
}

declare dso_local %struct._iobuf* @__acrt_iob_func(i32) local_unnamed_addr #6

declare dso_local i32 @__stdio_common_vfprintf(i64, %struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) local_unnamed_addr #6

declare i32 @__faultinject_selected_target(i32) local_unnamed_addr

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"long long", !5, i64 0}
