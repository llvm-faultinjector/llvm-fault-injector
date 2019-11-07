; ModuleID = 'test-double.c'
source_filename = "test-double.c"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.14.26431"

%struct._iobuf = type { i8* }
%struct.__crt_locale_pointers = type { %struct.__crt_locale_data*, %struct.__crt_multibyte_data* }
%struct.__crt_locale_data = type opaque
%struct.__crt_multibyte_data = type opaque

$scanf = comdat any

$printf = comdat any

$__local_stdio_printf_options = comdat any

$__local_stdio_scanf_options = comdat any

$"??_C@_03DLDNIBIK@?$CFlf?$AA@" = comdat any

@"??_C@_03DLDNIBIK@?$CFlf?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"%lf\00", comdat, align 1
@__local_stdio_printf_options._OptionsStorage = internal global i64 0, align 8
@__local_stdio_scanf_options._OptionsStorage = internal global i64 0, align 8

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @ccc(double) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = and i64 %2, -256
  %4 = or i64 %3, 1
  %5 = bitcast i64 %4 to double
  ret double %5
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @sss(double) local_unnamed_addr #0 {
  %2 = bitcast double %0 to i64
  %3 = xor i64 %2, 10
  %4 = bitcast i64 %3 to double
  ret double %4
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
  %1 = alloca double, align 8
  %2 = bitcast double* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #4
  %3 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03DLDNIBIK@?$CFlf?$AA@", i64 0, i64 0), double* nonnull %1)
  %4 = bitcast double* %1 to i64*
  %5 = load i64, i64* %4, align 8, !tbaa !3
  %6 = and i64 %5, -256
  %7 = or i64 %6, 1
  %8 = bitcast i64 %7 to double
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03DLDNIBIK@?$CFlf?$AA@", i64 0, i64 0), double %8)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #4
  ret i32 0
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @scanf(i8*, ...) local_unnamed_addr #3 comdat {
  %2 = alloca i8*, align 8
  %3 = bitcast i8** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3) #4
  call void @llvm.va_start(i8* nonnull %3)
  %4 = load i8*, i8** %2, align 8, !tbaa !7
  %5 = call %struct._iobuf* @__acrt_iob_func(i32 0) #4
  %6 = call i64* @__local_stdio_scanf_options() #4
  %7 = load i64, i64* %6, align 8, !tbaa !9
  %8 = call i32 @__stdio_common_vfscanf(i64 %7, %struct._iobuf* %5, i8* %0, %struct.__crt_locale_pointers* null, i8* %4) #4
  call void @llvm.va_end(i8* nonnull %3)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3) #4
  ret i32 %8
}

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

declare dso_local i32 @__stdio_common_vfscanf(i64, %struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) local_unnamed_addr #6

; Function Attrs: noinline norecurse nounwind uwtable
define linkonce_odr dso_local i64* @__local_stdio_scanf_options() local_unnamed_addr #5 comdat {
  ret i64* @__local_stdio_scanf_options._OptionsStorage
}

declare dso_local i32 @__stdio_common_vfprintf(i64, %struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) local_unnamed_addr #6

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"long long", !5, i64 0}
