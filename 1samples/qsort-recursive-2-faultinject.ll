; ModuleID = '.\qsort-recursive-1-clang.ll'
source_filename = ".\5Cqsort-recursive.c"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.14.26431"

%struct.__crt_locale_pointers = type { %struct.__crt_locale_data*, %struct.__crt_multibyte_data* }
%struct.__crt_locale_data = type opaque
%struct.__crt_multibyte_data = type opaque
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

$"??_C@_03JDANDILB@?$CFd?5?$AA@" = comdat any

@main.arr = private unnamed_addr constant [97 x i32] [i32 7, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0], align 16
@"??_C@_03JDANDILB@?$CFd?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"%d \00", comdat, align 1
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
define dso_local void @qsort(i32*, i32, i32) #1 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %2, i32* %4, align 4, !tbaa !7
  store i32 %1, i32* %5, align 4, !tbaa !7
  store i32* %0, i32** %6, align 8, !tbaa !3
  %10 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #4
  %11 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #4
  %12 = load i32, i32* %5, align 4, !tbaa !7
  %13 = load i32, i32* %4, align 4, !tbaa !7
  %14 = icmp sge i32 %12, %13
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %3
  store i32 1, i32* %9, align 4
  br label %64

; <label>:16:                                     ; preds = %3
  %17 = load i32, i32* %5, align 4, !tbaa !7
  %18 = load i32, i32* %4, align 4, !tbaa !7
  %19 = add nsw i32 %17, %18
  %20 = sdiv i32 %19, 2
  %21 = load i32, i32* %5, align 4, !tbaa !7
  %22 = load i32*, i32** %6, align 8, !tbaa !3
  call void @swap(i32* %22, i32 %21, i32 %20)
  %23 = load i32, i32* %5, align 4, !tbaa !7
  store i32 %23, i32* %8, align 4, !tbaa !7
  %24 = load i32, i32* %5, align 4, !tbaa !7
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %7, align 4, !tbaa !7
  br label %26

; <label>:26:                                     ; preds = %49, %16
  %27 = load i32, i32* %7, align 4, !tbaa !7
  %28 = load i32, i32* %4, align 4, !tbaa !7
  %29 = icmp sle i32 %27, %28
  br i1 %29, label %30, label %52

; <label>:30:                                     ; preds = %26
  %31 = load i32*, i32** %6, align 8, !tbaa !3
  %32 = load i32, i32* %7, align 4, !tbaa !7
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32* %31, i64 %33
  %35 = load i32, i32* %34, align 4, !tbaa !7
  %36 = load i32*, i32** %6, align 8, !tbaa !3
  %37 = load i32, i32* %5, align 4, !tbaa !7
  %38 = call i32 @__faultinject_selected_target(i32 %37)
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32* %36, i64 %39
  %41 = load i32, i32* %40, align 4, !tbaa !7
  %42 = icmp slt i32 %35, %41
  br i1 %42, label %43, label %48

; <label>:43:                                     ; preds = %30
  %44 = load i32, i32* %7, align 4, !tbaa !7
  %45 = load i32, i32* %8, align 4, !tbaa !7
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %8, align 4, !tbaa !7
  %47 = load i32*, i32** %6, align 8, !tbaa !3
  call void @swap(i32* %47, i32 %46, i32 %44)
  br label %48

; <label>:48:                                     ; preds = %43, %30
  br label %49

; <label>:49:                                     ; preds = %48
  %50 = load i32, i32* %7, align 4, !tbaa !7
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %7, align 4, !tbaa !7
  br label %26

; <label>:52:                                     ; preds = %26
  %53 = load i32, i32* %8, align 4, !tbaa !7
  %54 = load i32, i32* %5, align 4, !tbaa !7
  %55 = load i32*, i32** %6, align 8, !tbaa !3
  call void @swap(i32* %55, i32 %54, i32 %53)
  %56 = load i32, i32* %8, align 4, !tbaa !7
  %57 = sub nsw i32 %56, 1
  %58 = load i32, i32* %5, align 4, !tbaa !7
  %59 = load i32*, i32** %6, align 8, !tbaa !3
  call void @qsort(i32* %59, i32 %58, i32 %57)
  %60 = load i32, i32* %4, align 4, !tbaa !7
  %61 = load i32, i32* %8, align 4, !tbaa !7
  %62 = add nsw i32 %61, 1
  %63 = load i32*, i32** %6, align 8, !tbaa !3
  call void @qsort(i32* %63, i32 %62, i32 %60)
  store i32 0, i32* %9, align 4
  br label %64

; <label>:64:                                     ; preds = %52, %15
  %65 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %65) #4
  %66 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %66) #4
  %67 = load i32, i32* %9, align 4
  switch i32 %67, label %69 [
    i32 0, label %68
    i32 1, label %68
  ]

; <label>:68:                                     ; preds = %64, %64
  ret void

; <label>:69:                                     ; preds = %64
  unreachable
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local void @swap(i32*, i32, i32) #1 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  store i32 %2, i32* %4, align 4, !tbaa !7
  store i32 %1, i32* %5, align 4, !tbaa !7
  store i32* %0, i32** %6, align 8, !tbaa !3
  %8 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #4
  %9 = load i32*, i32** %6, align 8, !tbaa !3
  %10 = load i32, i32* %5, align 4, !tbaa !7
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32* %9, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !7
  store i32 %13, i32* %7, align 4, !tbaa !7
  %14 = load i32*, i32** %6, align 8, !tbaa !3
  %15 = load i32, i32* %4, align 4, !tbaa !7
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32* %14, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !7
  %19 = load i32*, i32** %6, align 8, !tbaa !3
  %20 = load i32, i32* %5, align 4, !tbaa !7
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32* %19, i64 %21
  store i32 %18, i32* %22, align 4, !tbaa !7
  %23 = load i32, i32* %7, align 4, !tbaa !7
  %24 = load i32*, i32** %6, align 8, !tbaa !3
  %25 = load i32, i32* %4, align 4, !tbaa !7
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32* %24, i64 %26
  store i32 %23, i32* %27, align 4, !tbaa !7
  %28 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #4
  ret void
}

declare dso_local void @__marking_faultinject_intptr(i32*) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #1 {
  %1 = alloca i32, align 4
  %2 = alloca [97 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %5 = bitcast [97 x i32]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 388, i8* %5) #4
  %6 = bitcast [97 x i32]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([97 x i32]* @main.arr to i8*), i64 388, i1 false)
  %7 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #4
  store i32 97, i32* %3, align 4, !tbaa !7
  %8 = load i32, i32* %3, align 4, !tbaa !7
  %9 = sub nsw i32 %8, 1
  %10 = getelementptr inbounds [97 x i32], [97 x i32]* %2, i32 0, i32 0
  call void @qsort(i32* %10, i32 0, i32 %9)
  %11 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #4
  store i32 0, i32* %4, align 4, !tbaa !7
  br label %12

; <label>:12:                                     ; preds = %24, %0
  %13 = load i32, i32* %4, align 4, !tbaa !7
  %14 = load i32, i32* %3, align 4, !tbaa !7
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %12
  %17 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #4
  br label %27

; <label>:18:                                     ; preds = %12
  %19 = load i32, i32* %4, align 4, !tbaa !7
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [97 x i32], [97 x i32]* %2, i64 0, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !7
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03JDANDILB@?$CFd?5?$AA@", i32 0, i32 0), i32 %22)
  br label %24

; <label>:24:                                     ; preds = %18
  %25 = load i32, i32* %4, align 4, !tbaa !7
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %4, align 4, !tbaa !7
  br label %12

; <label>:27:                                     ; preds = %16
  %28 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #4
  %29 = bitcast [97 x i32]* %2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 388, i8* %29) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @printf(i8*, ...) #0 comdat {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !3
  %5 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #4
  %6 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #4
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
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #4
  %15 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #4
  ret i32 %13
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
