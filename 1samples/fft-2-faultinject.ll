; ModuleID = '.\fft-1-clang.ll'
source_filename = ".\5Cfft.c"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.14.26431"

%struct.__crt_locale_pointers = type { %struct.__crt_locale_data*, %struct.__crt_multibyte_data* }
%struct.__crt_locale_data = type opaque
%struct.__crt_multibyte_data = type opaque
%struct._cplx = type { double, double }
%struct._iobuf = type { i8* }

$sprintf = comdat any

$vsprintf = comdat any

$_snprintf = comdat any

$_vsnprintf = comdat any

$printf = comdat any

$_vsprintf_l = comdat any

$_vsnprintf_l = comdat any

$__local_stdio_printf_options = comdat any

$_vfprintf_l = comdat any

$"??_C@_02DKCKIIND@?$CFs?$AA@" = comdat any

$"??_C@_03JBELIGOI@?$CFg?5?$AA@" = comdat any

$"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@" = comdat any

$"??_C@_06CCMPDPJJ@Data?3?5?$AA@" = comdat any

$"??_C@_07CEBOBHLN@?6FFT?5?3?5?$AA@" = comdat any

@PI = dso_local global double 0x400921FB54411744, align 8
@"??_C@_02DKCKIIND@?$CFs?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"%s\00", comdat, align 1
@"??_C@_03JBELIGOI@?$CFg?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"%g \00", comdat, align 1
@"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"(%g, %g) \00", comdat, align 1
@"??_C@_06CCMPDPJJ@Data?3?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"Data: \00", comdat, align 1
@"??_C@_07CEBOBHLN@?6FFT?5?3?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"\0AFFT : \00", comdat, align 1
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
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #5
  %8 = bitcast i8** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #5
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
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %16) #5
  %17 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5
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
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #5
  %10 = bitcast i8** %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %10) #5
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
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #5
  %20 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #5
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
define dso_local double @ccc(double) #1 {
  %2 = alloca double, align 8
  %3 = alloca i8*, align 8
  store double %0, double* %2, align 8, !tbaa !11
  %4 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #5
  %5 = bitcast double* %2 to i8*
  store i8* %5, i8** %3, align 8, !tbaa !3
  %6 = load double, double* %2, align 8, !tbaa !11
  %7 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %7) #5
  ret double %6
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local void @make(%struct._cplx* noalias sret, double, double) #1 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store double %2, double* %4, align 8, !tbaa !11
  store double %1, double* %5, align 8, !tbaa !11
  %6 = load double, double* %5, align 8, !tbaa !11
  %7 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i32 0, i32 0
  store double %6, double* %7, align 8, !tbaa !13
  %8 = load double, double* %4, align 8, !tbaa !11
  %9 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i32 0, i32 1
  store double %8, double* %9, align 8, !tbaa !15
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @mul(%struct._cplx* noalias sret, %struct._cplx*, %struct._cplx*) #1 {
  %4 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i32 0, i32 0
  %5 = load double, double* %4, align 8, !tbaa !13
  %6 = getelementptr inbounds %struct._cplx, %struct._cplx* %2, i32 0, i32 0
  %7 = load double, double* %6, align 8, !tbaa !13
  %8 = fmul double %5, %7
  %9 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i32 0, i32 1
  %10 = load double, double* %9, align 8, !tbaa !15
  %11 = getelementptr inbounds %struct._cplx, %struct._cplx* %2, i32 0, i32 1
  %12 = load double, double* %11, align 8, !tbaa !15
  %13 = fmul double %10, %12
  %14 = fsub double %8, %13
  %15 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i32 0, i32 0
  store double %14, double* %15, align 8, !tbaa !13
  %16 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i32 0, i32 0
  %17 = load double, double* %16, align 8, !tbaa !13
  %18 = getelementptr inbounds %struct._cplx, %struct._cplx* %2, i32 0, i32 0
  %19 = load double, double* %18, align 8, !tbaa !13
  %20 = fmul double %17, %19
  %21 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i32 0, i32 1
  %22 = load double, double* %21, align 8, !tbaa !15
  %23 = getelementptr inbounds %struct._cplx, %struct._cplx* %2, i32 0, i32 1
  %24 = load double, double* %23, align 8, !tbaa !15
  %25 = fmul double %22, %24
  %26 = fadd double %20, %25
  %27 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i32 0, i32 1
  store double %26, double* %27, align 8, !tbaa !15
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @plus(%struct._cplx* noalias sret, %struct._cplx*, %struct._cplx*) #1 {
  %4 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i32 0, i32 0
  %5 = load double, double* %4, align 8, !tbaa !13
  %6 = getelementptr inbounds %struct._cplx, %struct._cplx* %2, i32 0, i32 0
  %7 = load double, double* %6, align 8, !tbaa !13
  %8 = fadd double %5, %7
  %9 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i32 0, i32 0
  store double %8, double* %9, align 8, !tbaa !13
  %10 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i32 0, i32 1
  %11 = load double, double* %10, align 8, !tbaa !15
  %12 = getelementptr inbounds %struct._cplx, %struct._cplx* %2, i32 0, i32 1
  %13 = load double, double* %12, align 8, !tbaa !15
  %14 = fadd double %11, %13
  %15 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i32 0, i32 1
  store double %14, double* %15, align 8, !tbaa !15
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local double @creal(%struct._cplx*) #1 {
  %2 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i32 0, i32 0
  %3 = load double, double* %2, align 8, !tbaa !13
  ret double %3
}

; Function Attrs: nounwind uwtable
define dso_local double @cimag(%struct._cplx*) #1 {
  %2 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i32 0, i32 1
  %3 = load double, double* %2, align 8, !tbaa !15
  ret double %3
}

; Function Attrs: nounwind uwtable
define dso_local void @_fft(%struct._cplx*, %struct._cplx*, i32, i32) #1 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct._cplx*, align 8
  %8 = alloca %struct._cplx*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct._cplx, align 8
  %11 = alloca %struct._cplx, align 8
  %12 = alloca %struct._cplx, align 8
  %13 = alloca %struct._cplx, align 8
  %14 = alloca %struct._cplx, align 8
  %15 = alloca %struct._cplx, align 8
  %16 = alloca %struct._cplx, align 8
  %17 = alloca %struct._cplx, align 8
  %18 = alloca %struct._cplx, align 8
  store i32 %3, i32* %5, align 4, !tbaa !7
  store i32 %2, i32* %6, align 4, !tbaa !7
  store %struct._cplx* %1, %struct._cplx** %7, align 8, !tbaa !3
  store %struct._cplx* %0, %struct._cplx** %8, align 8, !tbaa !3
  %19 = load i32, i32* %5, align 4, !tbaa !7
  %20 = load i32, i32* %6, align 4, !tbaa !7
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %108

; <label>:22:                                     ; preds = %4
  %23 = load i32, i32* %5, align 4, !tbaa !7
  %24 = mul nsw i32 %23, 2
  %25 = load i32, i32* %6, align 4, !tbaa !7
  %26 = load %struct._cplx*, %struct._cplx** %8, align 8, !tbaa !3
  %27 = load %struct._cplx*, %struct._cplx** %7, align 8, !tbaa !3
  call void @_fft(%struct._cplx* %27, %struct._cplx* %26, i32 %25, i32 %24)
  %28 = load i32, i32* %5, align 4, !tbaa !7
  %29 = mul nsw i32 %28, 2
  %30 = load i32, i32* %6, align 4, !tbaa !7
  %31 = load %struct._cplx*, %struct._cplx** %8, align 8, !tbaa !3
  %32 = load i32, i32* %5, align 4, !tbaa !7
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct._cplx, %struct._cplx* %31, i64 %33
  %35 = load %struct._cplx*, %struct._cplx** %7, align 8, !tbaa !3
  %36 = load i32, i32* %5, align 4, !tbaa !7
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %struct._cplx, %struct._cplx* %35, i64 %37
  call void @_fft(%struct._cplx* %38, %struct._cplx* %34, i32 %30, i32 %29)
  %39 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %39) #5
  store i32 0, i32* %9, align 4, !tbaa !7
  br label %40

; <label>:40:                                     ; preds = %102, %22
  %41 = load i32, i32* %9, align 4, !tbaa !7
  %42 = load i32, i32* %6, align 4, !tbaa !7
  %43 = call i32 @__faultinject_selected_target(i32 %42)
  %44 = icmp slt i32 %41, %43
  br i1 %44, label %47, label %45

; <label>:45:                                     ; preds = %40
  %46 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %46) #5
  br label %107

; <label>:47:                                     ; preds = %40
  %48 = bitcast %struct._cplx* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* %48) #5
  %49 = load %struct._cplx*, %struct._cplx** %7, align 8, !tbaa !3
  %50 = load i32, i32* %9, align 4, !tbaa !7
  %51 = load i32, i32* %5, align 4, !tbaa !7
  %52 = add nsw i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds %struct._cplx, %struct._cplx* %49, i64 %53
  %55 = load double, double* @PI, align 8, !tbaa !11
  %56 = fsub double -0.000000e+00, %55
  %57 = load i32, i32* %9, align 4, !tbaa !7
  %58 = sitofp i32 %57 to double
  %59 = fmul double %56, %58
  %60 = load i32, i32* %6, align 4, !tbaa !7
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %59, %61
  call void @make(%struct._cplx* sret %11, double 0.000000e+00, double %62)
  %63 = bitcast %struct._cplx* %12 to i8*
  %64 = bitcast %struct._cplx* %54 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %63, i8* align 8 %64, i64 16, i1 false), !tbaa.struct !16
  call void @mul(%struct._cplx* sret %10, %struct._cplx* %11, %struct._cplx* %12)
  %65 = load %struct._cplx*, %struct._cplx** %8, align 8, !tbaa !3
  %66 = load i32, i32* %9, align 4, !tbaa !7
  %67 = sdiv i32 %66, 2
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds %struct._cplx, %struct._cplx* %65, i64 %68
  %70 = bitcast %struct._cplx* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* %70) #5
  %71 = load %struct._cplx*, %struct._cplx** %7, align 8, !tbaa !3
  %72 = load i32, i32* %9, align 4, !tbaa !7
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds %struct._cplx, %struct._cplx* %71, i64 %73
  %75 = bitcast %struct._cplx* %14 to i8*
  %76 = bitcast %struct._cplx* %74 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %75, i8* align 8 %76, i64 16, i1 false), !tbaa.struct !16
  %77 = bitcast %struct._cplx* %15 to i8*
  %78 = bitcast %struct._cplx* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %77, i8* align 8 %78, i64 16, i1 false), !tbaa.struct !16
  call void @plus(%struct._cplx* sret %13, %struct._cplx* %14, %struct._cplx* %15)
  %79 = bitcast %struct._cplx* %69 to i8*
  %80 = bitcast %struct._cplx* %13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %79, i8* align 8 %80, i64 16, i1 false), !tbaa.struct !16
  %81 = bitcast %struct._cplx* %13 to i8*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* %81) #5
  %82 = load %struct._cplx*, %struct._cplx** %8, align 8, !tbaa !3
  %83 = load i32, i32* %9, align 4, !tbaa !7
  %84 = load i32, i32* %6, align 4, !tbaa !7
  %85 = add nsw i32 %83, %84
  %86 = sdiv i32 %85, 2
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds %struct._cplx, %struct._cplx* %82, i64 %87
  %89 = bitcast %struct._cplx* %16 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* %89) #5
  %90 = load %struct._cplx*, %struct._cplx** %7, align 8, !tbaa !3
  %91 = load i32, i32* %9, align 4, !tbaa !7
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds %struct._cplx, %struct._cplx* %90, i64 %92
  %94 = bitcast %struct._cplx* %17 to i8*
  %95 = bitcast %struct._cplx* %93 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %94, i8* align 8 %95, i64 16, i1 false), !tbaa.struct !16
  %96 = bitcast %struct._cplx* %18 to i8*
  %97 = bitcast %struct._cplx* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %96, i8* align 8 %97, i64 16, i1 false), !tbaa.struct !16
  call void @plus(%struct._cplx* sret %16, %struct._cplx* %17, %struct._cplx* %18)
  %98 = bitcast %struct._cplx* %88 to i8*
  %99 = bitcast %struct._cplx* %16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %98, i8* align 8 %99, i64 16, i1 false), !tbaa.struct !16
  %100 = bitcast %struct._cplx* %16 to i8*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* %100) #5
  %101 = bitcast %struct._cplx* %10 to i8*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* %101) #5
  br label %102

; <label>:102:                                    ; preds = %47
  %103 = load i32, i32* %5, align 4, !tbaa !7
  %104 = mul nsw i32 2, %103
  %105 = load i32, i32* %9, align 4, !tbaa !7
  %106 = add nsw i32 %105, %104
  store i32 %106, i32* %9, align 4, !tbaa !7
  br label %40

; <label>:107:                                    ; preds = %45
  br label %108

; <label>:108:                                    ; preds = %107, %4
  ret void
}

declare dso_local void @__marking_faultinject_intptr(i32*) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2

; Function Attrs: nounwind uwtable
define dso_local void @fft(%struct._cplx*, i32) #1 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._cplx*, align 8
  %5 = alloca [16 x %struct._cplx], align 16
  %6 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !7
  store %struct._cplx* %0, %struct._cplx** %4, align 8, !tbaa !3
  %7 = bitcast [16 x %struct._cplx]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* %7) #5
  %8 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #5
  store i32 0, i32* %6, align 4, !tbaa !7
  br label %9

; <label>:9:                                      ; preds = %25, %2
  %10 = load i32, i32* %6, align 4, !tbaa !7
  %11 = load i32, i32* %3, align 4, !tbaa !7
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %15, label %13

; <label>:13:                                     ; preds = %9
  %14 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #5
  br label %28

; <label>:15:                                     ; preds = %9
  %16 = load i32, i32* %6, align 4, !tbaa !7
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %5, i64 0, i64 %17
  %19 = load %struct._cplx*, %struct._cplx** %4, align 8, !tbaa !3
  %20 = load i32, i32* %6, align 4, !tbaa !7
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct._cplx, %struct._cplx* %19, i64 %21
  %23 = bitcast %struct._cplx* %18 to i8*
  %24 = bitcast %struct._cplx* %22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %23, i8* align 8 %24, i64 16, i1 false), !tbaa.struct !16
  br label %25

; <label>:25:                                     ; preds = %15
  %26 = load i32, i32* %6, align 4, !tbaa !7
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %6, align 4, !tbaa !7
  br label %9

; <label>:28:                                     ; preds = %13
  %29 = load i32, i32* %3, align 4, !tbaa !7
  %30 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %5, i32 0, i32 0
  %31 = load %struct._cplx*, %struct._cplx** %4, align 8, !tbaa !3
  call void @_fft(%struct._cplx* %31, %struct._cplx* %30, i32 %29, i32 1)
  %32 = bitcast [16 x %struct._cplx]* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 256, i8* %32) #5
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @show(i8*, %struct._cplx*) #1 {
  %3 = alloca %struct._cplx*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct._cplx, align 8
  %7 = alloca %struct._cplx, align 8
  %8 = alloca %struct._cplx, align 8
  %9 = alloca %struct._cplx, align 8
  store %struct._cplx* %1, %struct._cplx** %3, align 8, !tbaa !3
  store i8* %0, i8** %4, align 8, !tbaa !3
  %10 = load i8*, i8** %4, align 8, !tbaa !3
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @"??_C@_02DKCKIIND@?$CFs?$AA@", i32 0, i32 0), i8* %10)
  %12 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #5
  store i32 0, i32* %5, align 4, !tbaa !7
  br label %13

; <label>:13:                                     ; preds = %53, %2
  %14 = load i32, i32* %5, align 4, !tbaa !7
  %15 = icmp slt i32 %14, 8
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %13
  %17 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5
  br label %56

; <label>:18:                                     ; preds = %13
  %19 = load %struct._cplx*, %struct._cplx** %3, align 8, !tbaa !3
  %20 = load i32, i32* %5, align 4, !tbaa !7
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct._cplx, %struct._cplx* %19, i64 %21
  %23 = bitcast %struct._cplx* %6 to i8*
  %24 = bitcast %struct._cplx* %22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %23, i8* align 8 %24, i64 16, i1 false), !tbaa.struct !16
  %25 = call double @cimag(%struct._cplx* %6)
  %26 = fcmp une double %25, 0.000000e+00
  br i1 %26, label %36, label %27

; <label>:27:                                     ; preds = %18
  %28 = load %struct._cplx*, %struct._cplx** %3, align 8, !tbaa !3
  %29 = load i32, i32* %5, align 4, !tbaa !7
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct._cplx, %struct._cplx* %28, i64 %30
  %32 = bitcast %struct._cplx* %7 to i8*
  %33 = bitcast %struct._cplx* %31 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %32, i8* align 8 %33, i64 16, i1 false), !tbaa.struct !16
  %34 = call double @creal(%struct._cplx* %7)
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03JBELIGOI@?$CFg?5?$AA@", i32 0, i32 0), double %34)
  br label %52

; <label>:36:                                     ; preds = %18
  %37 = load %struct._cplx*, %struct._cplx** %3, align 8, !tbaa !3
  %38 = load i32, i32* %5, align 4, !tbaa !7
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct._cplx, %struct._cplx* %37, i64 %39
  %41 = bitcast %struct._cplx* %8 to i8*
  %42 = bitcast %struct._cplx* %40 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %41, i8* align 8 %42, i64 16, i1 false), !tbaa.struct !16
  %43 = call double @cimag(%struct._cplx* %8)
  %44 = load %struct._cplx*, %struct._cplx** %3, align 8, !tbaa !3
  %45 = load i32, i32* %5, align 4, !tbaa !7
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds %struct._cplx, %struct._cplx* %44, i64 %46
  %48 = bitcast %struct._cplx* %9 to i8*
  %49 = bitcast %struct._cplx* %47 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %48, i8* align 8 %49, i64 16, i1 false), !tbaa.struct !16
  %50 = call double @creal(%struct._cplx* %9)
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@", i32 0, i32 0), double %50, double %43)
  br label %52

; <label>:52:                                     ; preds = %36, %27
  br label %53

; <label>:53:                                     ; preds = %52
  %54 = load i32, i32* %5, align 4, !tbaa !7
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %5, align 4, !tbaa !7
  br label %13

; <label>:56:                                     ; preds = %16
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @printf(i8*, ...) #0 comdat {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !3
  %5 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #5
  %6 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #5
  %7 = bitcast i8** %4 to i8*
  call void @llvm.va_start(i8* %7)
  %8 = load i8*, i8** %4, align 8, !tbaa !3
  %9 = load i8*, i8** %2, align 8, !tbaa !3
  %10 = call %struct._iobuf* @__acrt_iob_func(i32 1)
  %11 = call i32 @_vfprintf_l(%struct._iobuf* %10, i8* %9, %struct.__crt_locale_pointers* null, i8* %8)
  store i32 %11, i32* %3, align 4, !tbaa !7
  %12 = bitcast i8** %4 to i8*
  call void @llvm.va_end(i8* %12)
  %13 = load i32, i32* %3, align 4, !tbaa !7
  %14 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #5
  %15 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #5
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #1 {
  %1 = alloca i32, align 4
  %2 = alloca [4 x %struct._cplx], align 16
  store i32 0, i32* %1, align 4
  %3 = call double @atan2(double 1.000000e+00, double 1.000000e+00) #5
  %4 = fmul double %3, 4.000000e+00
  store double %4, double* @PI, align 8, !tbaa !11
  %5 = bitcast [4 x %struct._cplx]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* %5) #5
  %6 = bitcast [4 x %struct._cplx]* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 64, i1 false)
  %7 = bitcast i8* %6 to [4 x %struct._cplx]*
  %8 = getelementptr inbounds [4 x %struct._cplx], [4 x %struct._cplx]* %7, i32 0, i32 0
  %9 = getelementptr inbounds %struct._cplx, %struct._cplx* %8, i32 0, i32 0
  store double 1.000000e+00, double* %9, align 16
  %10 = getelementptr inbounds %struct._cplx, %struct._cplx* %8, i32 0, i32 1
  store double 1.000000e+00, double* %10, align 8
  %11 = getelementptr inbounds [4 x %struct._cplx], [4 x %struct._cplx]* %7, i32 0, i32 1
  %12 = getelementptr inbounds %struct._cplx, %struct._cplx* %11, i32 0, i32 0
  store double 1.000000e+00, double* %12, align 16
  %13 = getelementptr inbounds %struct._cplx, %struct._cplx* %11, i32 0, i32 1
  store double 1.000000e+00, double* %13, align 8
  %14 = getelementptr inbounds [4 x %struct._cplx], [4 x %struct._cplx]* %2, i32 0, i32 0
  call void @show(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @"??_C@_06CCMPDPJJ@Data?3?5?$AA@", i32 0, i32 0), %struct._cplx* %14)
  %15 = getelementptr inbounds [4 x %struct._cplx], [4 x %struct._cplx]* %2, i32 0, i32 0
  call void @fft(%struct._cplx* %15, i32 8)
  %16 = getelementptr inbounds [4 x %struct._cplx], [4 x %struct._cplx]* %2, i32 0, i32 0
  call void @show(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @"??_C@_07CEBOBHLN@?6FFT?5?3?5?$AA@", i32 0, i32 0), %struct._cplx* %16)
  %17 = bitcast [4 x %struct._cplx]* %2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 64, i8* %17) #5
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #2

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #5

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
declare void @llvm.va_end(i8*) #5

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
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #5
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
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #5
  ret i32 %28
}

declare dso_local i32 @__stdio_common_vsprintf(i64, i8*, i64, i8*, %struct.__crt_locale_pointers*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local i64* @__local_stdio_printf_options() #6 comdat {
  ret i64* @__local_stdio_printf_options._OptionsStorage
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @_vfprintf_l(%struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) #0 comdat {
  %5 = alloca i8*, align 8
  %6 = alloca %struct.__crt_locale_pointers*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct._iobuf*, align 8
  store i8* %3, i8** %5, align 8, !tbaa !3
  store %struct.__crt_locale_pointers* %2, %struct.__crt_locale_pointers** %6, align 8, !tbaa !3
  store i8* %1, i8** %7, align 8, !tbaa !3
  store %struct._iobuf* %0, %struct._iobuf** %8, align 8, !tbaa !3
  %9 = load i8*, i8** %5, align 8, !tbaa !3
  %10 = load %struct.__crt_locale_pointers*, %struct.__crt_locale_pointers** %6, align 8, !tbaa !3
  %11 = load i8*, i8** %7, align 8, !tbaa !3
  %12 = load %struct._iobuf*, %struct._iobuf** %8, align 8, !tbaa !3
  %13 = call i64* @__local_stdio_printf_options()
  %14 = load i64, i64* %13, align 8, !tbaa !9
  %15 = call i32 @__stdio_common_vfprintf(i64 %14, %struct._iobuf* %12, i8* %11, %struct.__crt_locale_pointers* %10, i8* %9)
  ret i32 %15
}

declare dso_local %struct._iobuf* @__acrt_iob_func(i32) #3

declare dso_local i32 @__stdio_common_vfprintf(i64, %struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) #3

declare i32 @__faultinject_selected_target(i32)

attributes #0 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

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
!12 = !{!"double", !5, i64 0}
!13 = !{!14, !12, i64 0}
!14 = !{!"_cplx", !12, i64 0, !12, i64 8}
!15 = !{!14, !12, i64 8}
!16 = !{i64 0, i64 8, !11, i64 8, i64 8, !11}
