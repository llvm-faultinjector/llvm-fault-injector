; ModuleID = 'test-float-1-clang.ll'
source_filename = "test-float.c"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.14.26431"

%struct.__crt_locale_pointers = type { %struct.__crt_locale_data*, %struct.__crt_multibyte_data* }
%struct.__crt_locale_data = type opaque
%struct.__crt_multibyte_data = type opaque

$sprintf = comdat any

$vsprintf = comdat any

$_snprintf = comdat any

$_vsnprintf = comdat any

$_vsprintf_l = comdat any

$_vsnprintf_l = comdat any

$__local_stdio_printf_options = comdat any

@__local_stdio_printf_options._OptionsStorage = internal global i64 0, align 8

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @sprintf(i8*, i8*, ...) #0 comdat {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  store i8* %1, i8** %3, align 8, !tbaa !3
  store i8* %0, i8** %4, align 8, !tbaa !3
  %7 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #4
  %8 = bitcast i8** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #4
  %9 = bitcast i8** %6 to i8*
  call void @llvm.va_start(i8* %9)
  %10 = load i8*, i8** %6, align 8, !tbaa !3
  %11 = load i8*, i8** %3, align 8, !tbaa !3
  %12 = load i8*, i8** %4, align 8, !tbaa !3
  %13 = call i32 @_vsprintf_l(i8* %12, i8* %11, %struct.__crt_locale_pointers* null, i8* %10)
  store i32 %13, i32* %5, align 4, !tbaa !7
  %14 = bitcast i8** %6 to i8*
  call void @llvm.va_end(i8* %14)
  %15 = load i32, i32* %5, align 4, !tbaa !7
  %16 = bitcast i8** %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %16) #4
  %17 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #4
  ret i32 %15
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @vsprintf(i8*, i8*, i8*) #0 comdat {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store i8* %2, i8** %4, align 8, !tbaa !3
  store i8* %1, i8** %5, align 8, !tbaa !3
  store i8* %0, i8** %6, align 8, !tbaa !3
  %7 = load i8*, i8** %4, align 8, !tbaa !3
  %8 = load i8*, i8** %5, align 8, !tbaa !3
  %9 = load i8*, i8** %6, align 8, !tbaa !3
  %10 = call i32 @_vsnprintf_l(i8* %9, i64 -1, i8* %8, %struct.__crt_locale_pointers* null, i8* %7)
  ret i32 %10
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @_snprintf(i8*, i64, i8*, ...) #0 comdat {
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store i8* %2, i8** %4, align 8, !tbaa !3
  store i64 %1, i64* %5, align 8, !tbaa !9
  store i8* %0, i8** %6, align 8, !tbaa !3
  %9 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #4
  %10 = bitcast i8** %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %10) #4
  %11 = bitcast i8** %8 to i8*
  call void @llvm.va_start(i8* %11)
  %12 = load i8*, i8** %8, align 8, !tbaa !3
  %13 = load i8*, i8** %4, align 8, !tbaa !3
  %14 = load i64, i64* %5, align 8, !tbaa !9
  %15 = load i8*, i8** %6, align 8, !tbaa !3
  %16 = call i32 @_vsnprintf(i8* %15, i64 %14, i8* %13, i8* %12)
  store i32 %16, i32* %7, align 4, !tbaa !7
  %17 = bitcast i8** %8 to i8*
  call void @llvm.va_end(i8* %17)
  %18 = load i32, i32* %7, align 4, !tbaa !7
  %19 = bitcast i8** %8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #4
  %20 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #4
  ret i32 %18
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @_vsnprintf(i8*, i64, i8*, i8*) #0 comdat {
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  store i8* %3, i8** %5, align 8, !tbaa !3
  store i8* %2, i8** %6, align 8, !tbaa !3
  store i64 %1, i64* %7, align 8, !tbaa !9
  store i8* %0, i8** %8, align 8, !tbaa !3
  %9 = load i8*, i8** %5, align 8, !tbaa !3
  %10 = load i8*, i8** %6, align 8, !tbaa !3
  %11 = load i64, i64* %7, align 8, !tbaa !9
  %12 = load i8*, i8** %8, align 8, !tbaa !3
  %13 = call i32 @_vsnprintf_l(i8* %12, i64 %11, i8* %10, %struct.__crt_locale_pointers* null, i8* %9)
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define dso_local float @test(float) #1 {
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  store float %0, float* %2, align 4, !tbaa !11
  %4 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4
  store i32 0, i32* %3, align 4, !tbaa !7
  br label %5

; <label>:5:                                      ; preds = %23, %1
  %6 = load i32, i32* %3, align 4, !tbaa !7
  %7 = icmp slt i32 %6, 1000
  br i1 %7, label %10, label %8

; <label>:8:                                      ; preds = %5
  %9 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #4
  br label %26

; <label>:10:                                     ; preds = %5
  %11 = load float, float* %2, align 4, !tbaa !11
  %12 = fpext float %11 to double
  %13 = fadd double %12, 1.000000e+01
  %14 = fptrunc double %13 to float
  store float %14, float* %2, align 4, !tbaa !11
  %15 = load float, float* %2, align 4, !tbaa !11
  %16 = call float @__faultinject_selected_target(float %15)
  %17 = fpext float %16 to double
  %18 = fcmp ogt double %17, 1.000000e+02
  br i1 %18, label %19, label %22

; <label>:19:                                     ; preds = %10
  %20 = load float, float* %2, align 4, !tbaa !11
  %21 = fdiv float %20, 1.000000e+01
  store float %21, float* %2, align 4, !tbaa !11
  br label %22

; <label>:22:                                     ; preds = %19, %10
  br label %23

; <label>:23:                                     ; preds = %22
  %24 = load i32, i32* %3, align 4, !tbaa !7
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %3, align 4, !tbaa !7
  br label %5

; <label>:26:                                     ; preds = %8
  %27 = load float, float* %2, align 4, !tbaa !11
  ret float %27
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

declare dso_local void @__marking_faultinject_float(float*) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local float @cast(float) #1 {
  %2 = alloca float, align 4
  %3 = alloca i32*, align 8
  store float %0, float* %2, align 4, !tbaa !11
  %4 = bitcast i32** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #4
  %5 = bitcast float* %2 to i32*
  store i32* %5, i32** %3, align 8, !tbaa !3
  %6 = load i32*, i32** %3, align 8, !tbaa !3
  %7 = getelementptr inbounds i32, i32* %6, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !7
  %9 = xor i32 %8, 1
  store i32 %9, i32* %7, align 4, !tbaa !7
  %10 = load float, float* %2, align 4, !tbaa !11
  %11 = bitcast i32** %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %11) #4
  ret float %10
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #1 {
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #4

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @_vsprintf_l(i8*, i8*, %struct.__crt_locale_pointers*, i8*) #0 comdat {
  %5 = alloca i8*, align 8
  %6 = alloca %struct.__crt_locale_pointers*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %3, i8** %5, align 8, !tbaa !3
  store %struct.__crt_locale_pointers* %2, %struct.__crt_locale_pointers** %6, align 8, !tbaa !3
  store i8* %1, i8** %7, align 8, !tbaa !3
  store i8* %0, i8** %8, align 8, !tbaa !3
  %9 = load i8*, i8** %5, align 8, !tbaa !3
  %10 = load %struct.__crt_locale_pointers*, %struct.__crt_locale_pointers** %6, align 8, !tbaa !3
  %11 = load i8*, i8** %7, align 8, !tbaa !3
  %12 = load i8*, i8** %8, align 8, !tbaa !3
  %13 = call i32 @_vsnprintf_l(i8* %12, i64 -1, i8* %11, %struct.__crt_locale_pointers* %10, i8* %9)
  ret i32 %13
}

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #4

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @_vsnprintf_l(i8*, i64, i8*, %struct.__crt_locale_pointers*, i8*) #0 comdat {
  %6 = alloca i8*, align 8
  %7 = alloca %struct.__crt_locale_pointers*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  store i8* %4, i8** %6, align 8, !tbaa !3
  store %struct.__crt_locale_pointers* %3, %struct.__crt_locale_pointers** %7, align 8, !tbaa !3
  store i8* %2, i8** %8, align 8, !tbaa !3
  store i64 %1, i64* %9, align 8, !tbaa !9
  store i8* %0, i8** %10, align 8, !tbaa !3
  %12 = bitcast i32* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #4
  %13 = load i8*, i8** %6, align 8, !tbaa !3
  %14 = load %struct.__crt_locale_pointers*, %struct.__crt_locale_pointers** %7, align 8, !tbaa !3
  %15 = load i8*, i8** %8, align 8, !tbaa !3
  %16 = load i64, i64* %9, align 8, !tbaa !9
  %17 = load i8*, i8** %10, align 8, !tbaa !3
  %18 = call i64* @__local_stdio_printf_options()
  %19 = load i64, i64* %18, align 8, !tbaa !9
  %20 = or i64 %19, 1
  %21 = call i32 @__stdio_common_vsprintf(i64 %20, i8* %17, i64 %16, i8* %15, %struct.__crt_locale_pointers* %14, i8* %13)
  store i32 %21, i32* %11, align 4, !tbaa !7
  %22 = load i32, i32* %11, align 4, !tbaa !7
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %5
  br label %27

; <label>:25:                                     ; preds = %5
  %26 = load i32, i32* %11, align 4, !tbaa !7
  br label %27

; <label>:27:                                     ; preds = %25, %24
  %28 = phi i32 [ -1, %24 ], [ %26, %25 ]
  %29 = bitcast i32* %11 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #4
  ret i32 %28
}

declare dso_local i32 @__stdio_common_vsprintf(i64, i8*, i64, i8*, %struct.__crt_locale_pointers*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local i64* @__local_stdio_printf_options() #5 comdat {
  ret i64* @__local_stdio_printf_options._OptionsStorage
}

declare float @__faultinject_selected_target(float)

attributes #0 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"long long", !5, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !5, i64 0}
