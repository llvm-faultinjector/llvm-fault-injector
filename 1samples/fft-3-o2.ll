; ModuleID = '.\fft-2-faultinject.ll'
source_filename = ".\5Cfft.c"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.14.26431"

%struct._cplx = type { double, double }
%struct._iobuf = type { i8* }
%struct.__crt_locale_pointers = type { %struct.__crt_locale_data*, %struct.__crt_multibyte_data* }
%struct.__crt_locale_data = type opaque
%struct.__crt_multibyte_data = type opaque

$printf = comdat any

$__local_stdio_printf_options = comdat any

$"??_C@_02DKCKIIND@?$CFs?$AA@" = comdat any

$"??_C@_03JBELIGOI@?$CFg?5?$AA@" = comdat any

$"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@" = comdat any

$"??_C@_06CCMPDPJJ@Data?3?5?$AA@" = comdat any

$"??_C@_07CEBOBHLN@?6FFT?5?3?5?$AA@" = comdat any

@PI = dso_local local_unnamed_addr global double 0x400921FB54411744, align 8
@"??_C@_02DKCKIIND@?$CFs?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"%s\00", comdat, align 1
@"??_C@_03JBELIGOI@?$CFg?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"%g \00", comdat, align 1
@"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"(%g, %g) \00", comdat, align 1
@"??_C@_06CCMPDPJJ@Data?3?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"Data: \00", comdat, align 1
@"??_C@_07CEBOBHLN@?6FFT?5?3?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"\0AFFT : \00", comdat, align 1
@__local_stdio_printf_options._OptionsStorage = internal global i64 0, align 8

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @ccc(double returned) local_unnamed_addr #0 {
  ret double %0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind uwtable writeonly
define dso_local void @make(%struct._cplx* noalias nocapture sret, double, double) local_unnamed_addr #2 {
  %4 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 0, i32 0
  store double %1, double* %4, align 8, !tbaa !3
  %5 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 0, i32 1
  store double %2, double* %5, align 8, !tbaa !8
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @mul(%struct._cplx* noalias nocapture sret, %struct._cplx* nocapture readonly, %struct._cplx* nocapture readonly) local_unnamed_addr #3 {
  %4 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 0, i32 0
  %5 = load double, double* %4, align 8, !tbaa !3
  %6 = getelementptr inbounds %struct._cplx, %struct._cplx* %2, i64 0, i32 0
  %7 = load double, double* %6, align 8, !tbaa !3
  %8 = fmul double %5, %7
  %9 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 0, i32 1
  %10 = load double, double* %9, align 8, !tbaa !8
  %11 = getelementptr inbounds %struct._cplx, %struct._cplx* %2, i64 0, i32 1
  %12 = load double, double* %11, align 8, !tbaa !8
  %13 = fmul double %10, %12
  %14 = fsub double %8, %13
  %15 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 0, i32 0
  store double %14, double* %15, align 8, !tbaa !3
  %16 = fadd double %8, %13
  %17 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 0, i32 1
  store double %16, double* %17, align 8, !tbaa !8
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @plus(%struct._cplx* noalias nocapture sret, %struct._cplx* nocapture readonly, %struct._cplx* nocapture readonly) local_unnamed_addr #3 {
  %4 = bitcast %struct._cplx* %1 to <2 x double>*
  %5 = load <2 x double>, <2 x double>* %4, align 8, !tbaa !9
  %6 = bitcast %struct._cplx* %2 to <2 x double>*
  %7 = load <2 x double>, <2 x double>* %6, align 8, !tbaa !9
  %8 = fadd <2 x double> %5, %7
  %9 = bitcast %struct._cplx* %0 to <2 x double>*
  store <2 x double> %8, <2 x double>* %9, align 8, !tbaa !9
  ret void
}

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local double @creal(%struct._cplx* nocapture readonly) local_unnamed_addr #4 {
  %2 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 0, i32 0
  %3 = load double, double* %2, align 8, !tbaa !3
  ret double %3
}

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local double @cimag(%struct._cplx* nocapture readonly) local_unnamed_addr #4 {
  %2 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 0, i32 1
  %3 = load double, double* %2, align 8, !tbaa !8
  ret double %3
}

; Function Attrs: nounwind uwtable
define dso_local void @_fft(%struct._cplx* nocapture, %struct._cplx* nocapture, i32, i32) local_unnamed_addr #5 {
  %5 = icmp slt i32 %3, %2
  br i1 %5, label %6, label %.loopexit

; <label>:6:                                      ; preds = %4
  %7 = shl i32 %3, 1
  tail call void @_fft(%struct._cplx* %1, %struct._cplx* %0, i32 %2, i32 %7)
  %8 = sext i32 %3 to i64
  %9 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 %8
  %10 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 %8
  tail call void @_fft(%struct._cplx* %10, %struct._cplx* %9, i32 %2, i32 %7)
  %11 = tail call i32 @__faultinject_selected_target(i32 %2) #8
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %6
  %13 = sitofp i32 %2 to double
  %14 = sext i32 %7 to i64
  br label %15

; <label>:15:                                     ; preds = %.lr.ph, %15
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %15 ]
  %16 = add nsw i64 %indvars.iv, %8
  %17 = load double, double* @PI, align 8, !tbaa !9
  %18 = trunc i64 %indvars.iv to i32
  %19 = sitofp i32 %18 to double
  %20 = fmul double %17, %19
  %21 = fsub double -0.000000e+00, %20
  %22 = fdiv double %21, %13
  %.sroa.051.0..sroa_idx = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 %16, i32 0
  %.sroa.051.0.copyload = load double, double* %.sroa.051.0..sroa_idx, align 8
  %.sroa.252.0..sroa_idx53 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 %16, i32 1
  %.sroa.252.0.copyload = load double, double* %.sroa.252.0..sroa_idx53, align 8
  %23 = fmul double %.sroa.051.0.copyload, 0.000000e+00
  %24 = fmul double %22, %.sroa.252.0.copyload
  %25 = fsub double %23, %24
  %26 = fadd double %23, %24
  %27 = sdiv i32 %18, 2
  %28 = sext i32 %27 to i64
  %.sroa.043.0..sroa_idx = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 %indvars.iv, i32 0
  %.sroa.043.0.copyload = load double, double* %.sroa.043.0..sroa_idx, align 8
  %.sroa.244.0..sroa_idx45 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 %indvars.iv, i32 1
  %.sroa.244.0.copyload = load double, double* %.sroa.244.0..sroa_idx45, align 8
  %29 = fadd double %.sroa.043.0.copyload, %25
  %30 = fadd double %.sroa.244.0.copyload, %26
  %.sroa.046.0..sroa_idx = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 %28, i32 0
  store double %29, double* %.sroa.046.0..sroa_idx, align 8
  %.sroa.448.0..sroa_idx49 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 %28, i32 1
  store double %30, double* %.sroa.448.0..sroa_idx49, align 8
  %31 = trunc i64 %indvars.iv to i32
  %32 = add i32 %31, %2
  %33 = sdiv i32 %32, 2
  %34 = sext i32 %33 to i64
  %.sroa.033.0.copyload = load double, double* %.sroa.043.0..sroa_idx, align 8
  %.sroa.234.0.copyload = load double, double* %.sroa.244.0..sroa_idx45, align 8
  %35 = fadd double %25, %.sroa.033.0.copyload
  %36 = fadd double %26, %.sroa.234.0.copyload
  %.sroa.036.0..sroa_idx = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 %34, i32 0
  store double %35, double* %.sroa.036.0..sroa_idx, align 8
  %.sroa.4.0..sroa_idx38 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 %34, i32 1
  store double %36, double* %.sroa.4.0..sroa_idx38, align 8
  %indvars.iv.next = add i64 %indvars.iv, %14
  %37 = tail call i32 @__faultinject_selected_target(i32 %2) #8
  %38 = sext i32 %37 to i64
  %39 = icmp slt i64 %indvars.iv.next, %38
  br i1 %39, label %15, label %.loopexit

.loopexit:                                        ; preds = %15, %6, %4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

; Function Attrs: nounwind uwtable
define dso_local void @fft(%struct._cplx* nocapture, i32) local_unnamed_addr #5 {
  %3 = alloca [16 x %struct._cplx], align 16
  %4 = bitcast [16 x %struct._cplx]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %4) #8
  %5 = icmp sgt i32 %1, 0
  br i1 %5, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %1 to i64
  %6 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %7 = icmp ult i64 %6, 3
  br i1 %7, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = sub nsw i64 %wide.trip.count, %xtraiter
  br label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph, %.lr.ph.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.3, %.lr.ph ]
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge, label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.epil
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %.lr.ph.epil ], [ %indvars.iv.unr, %._crit_edge.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %.lr.ph.epil ], [ %xtraiter, %._crit_edge.loopexit.unr-lcssa ]
  %8 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %3, i64 0, i64 %indvars.iv.epil
  %9 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 %indvars.iv.epil
  %10 = bitcast %struct._cplx* %8 to i8*
  %11 = bitcast %struct._cplx* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %10, i8* align 8 %11, i64 16, i1 false), !tbaa.struct !10
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %._crit_edge, label %.lr.ph.epil, !llvm.loop !11

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.epil, %2
  %12 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %3, i64 0, i64 0
  call void @_fft(%struct._cplx* %0, %struct._cplx* nonnull %12, i32 %1, i32 1)
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %4) #8
  ret void

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader.new ], [ %indvars.iv.next.3, %.lr.ph ]
  %niter = phi i64 [ %unroll_iter, %.lr.ph.preheader.new ], [ %niter.nsub.3, %.lr.ph ]
  %13 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %3, i64 0, i64 %indvars.iv
  %14 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 %indvars.iv
  %15 = bitcast %struct._cplx* %13 to i8*
  %16 = bitcast %struct._cplx* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %15, i8* align 8 %16, i64 16, i1 false), !tbaa.struct !10
  %indvars.iv.next = or i64 %indvars.iv, 1
  %17 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %3, i64 0, i64 %indvars.iv.next
  %18 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 %indvars.iv.next
  %19 = bitcast %struct._cplx* %17 to i8*
  %20 = bitcast %struct._cplx* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %19, i8* align 8 %20, i64 16, i1 false), !tbaa.struct !10
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %21 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %3, i64 0, i64 %indvars.iv.next.1
  %22 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 %indvars.iv.next.1
  %23 = bitcast %struct._cplx* %21 to i8*
  %24 = bitcast %struct._cplx* %22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %23, i8* align 8 %24, i64 16, i1 false), !tbaa.struct !10
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %25 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %3, i64 0, i64 %indvars.iv.next.2
  %26 = getelementptr inbounds %struct._cplx, %struct._cplx* %0, i64 %indvars.iv.next.2
  %27 = bitcast %struct._cplx* %25 to i8*
  %28 = bitcast %struct._cplx* %26 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %27, i8* align 8 %28, i64 16, i1 false), !tbaa.struct !10
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph
}

; Function Attrs: nounwind uwtable
define dso_local void @show(i8*, %struct._cplx* nocapture readonly) local_unnamed_addr #5 {
  %3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @"??_C@_02DKCKIIND@?$CFs?$AA@", i64 0, i64 0), i8* %0)
  %.sroa.015.0..sroa_idx = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 0, i32 0
  %.sroa.116.0..sroa_idx17 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 0, i32 1
  %.sroa.116.0.copyload = load double, double* %.sroa.116.0..sroa_idx17, align 8
  %4 = fcmp une double %.sroa.116.0.copyload, 0.000000e+00
  %.sroa.0.0.copyload = load double, double* %.sroa.015.0..sroa_idx, align 8
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %2
  %6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03JBELIGOI@?$CFg?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload)
  br label %9

; <label>:7:                                      ; preds = %2
  %8 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload, double %.sroa.116.0.copyload)
  br label %9

; <label>:9:                                      ; preds = %5, %7
  %.sroa.015.0..sroa_idx.1 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 1, i32 0
  %.sroa.116.0..sroa_idx17.1 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 1, i32 1
  %.sroa.116.0.copyload.1 = load double, double* %.sroa.116.0..sroa_idx17.1, align 8
  %10 = fcmp une double %.sroa.116.0.copyload.1, 0.000000e+00
  %.sroa.0.0.copyload.1 = load double, double* %.sroa.015.0..sroa_idx.1, align 8
  br i1 %10, label %13, label %11

; <label>:11:                                     ; preds = %9
  %12 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03JBELIGOI@?$CFg?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.1)
  br label %15

; <label>:13:                                     ; preds = %9
  %14 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.1, double %.sroa.116.0.copyload.1)
  br label %15

; <label>:15:                                     ; preds = %13, %11
  %.sroa.015.0..sroa_idx.2 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 2, i32 0
  %.sroa.116.0..sroa_idx17.2 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 2, i32 1
  %.sroa.116.0.copyload.2 = load double, double* %.sroa.116.0..sroa_idx17.2, align 8
  %16 = fcmp une double %.sroa.116.0.copyload.2, 0.000000e+00
  %.sroa.0.0.copyload.2 = load double, double* %.sroa.015.0..sroa_idx.2, align 8
  br i1 %16, label %19, label %17

; <label>:17:                                     ; preds = %15
  %18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03JBELIGOI@?$CFg?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.2)
  br label %21

; <label>:19:                                     ; preds = %15
  %20 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.2, double %.sroa.116.0.copyload.2)
  br label %21

; <label>:21:                                     ; preds = %19, %17
  %.sroa.015.0..sroa_idx.3 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 3, i32 0
  %.sroa.116.0..sroa_idx17.3 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 3, i32 1
  %.sroa.116.0.copyload.3 = load double, double* %.sroa.116.0..sroa_idx17.3, align 8
  %22 = fcmp une double %.sroa.116.0.copyload.3, 0.000000e+00
  %.sroa.0.0.copyload.3 = load double, double* %.sroa.015.0..sroa_idx.3, align 8
  br i1 %22, label %25, label %23

; <label>:23:                                     ; preds = %21
  %24 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03JBELIGOI@?$CFg?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.3)
  br label %27

; <label>:25:                                     ; preds = %21
  %26 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.3, double %.sroa.116.0.copyload.3)
  br label %27

; <label>:27:                                     ; preds = %25, %23
  %.sroa.015.0..sroa_idx.4 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 4, i32 0
  %.sroa.116.0..sroa_idx17.4 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 4, i32 1
  %.sroa.116.0.copyload.4 = load double, double* %.sroa.116.0..sroa_idx17.4, align 8
  %28 = fcmp une double %.sroa.116.0.copyload.4, 0.000000e+00
  %.sroa.0.0.copyload.4 = load double, double* %.sroa.015.0..sroa_idx.4, align 8
  br i1 %28, label %31, label %29

; <label>:29:                                     ; preds = %27
  %30 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03JBELIGOI@?$CFg?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.4)
  br label %33

; <label>:31:                                     ; preds = %27
  %32 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.4, double %.sroa.116.0.copyload.4)
  br label %33

; <label>:33:                                     ; preds = %31, %29
  %.sroa.015.0..sroa_idx.5 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 5, i32 0
  %.sroa.116.0..sroa_idx17.5 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 5, i32 1
  %.sroa.116.0.copyload.5 = load double, double* %.sroa.116.0..sroa_idx17.5, align 8
  %34 = fcmp une double %.sroa.116.0.copyload.5, 0.000000e+00
  %.sroa.0.0.copyload.5 = load double, double* %.sroa.015.0..sroa_idx.5, align 8
  br i1 %34, label %37, label %35

; <label>:35:                                     ; preds = %33
  %36 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03JBELIGOI@?$CFg?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.5)
  br label %39

; <label>:37:                                     ; preds = %33
  %38 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.5, double %.sroa.116.0.copyload.5)
  br label %39

; <label>:39:                                     ; preds = %37, %35
  %.sroa.015.0..sroa_idx.6 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 6, i32 0
  %.sroa.116.0..sroa_idx17.6 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 6, i32 1
  %.sroa.116.0.copyload.6 = load double, double* %.sroa.116.0..sroa_idx17.6, align 8
  %40 = fcmp une double %.sroa.116.0.copyload.6, 0.000000e+00
  %.sroa.0.0.copyload.6 = load double, double* %.sroa.015.0..sroa_idx.6, align 8
  br i1 %40, label %43, label %41

; <label>:41:                                     ; preds = %39
  %42 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03JBELIGOI@?$CFg?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.6)
  br label %45

; <label>:43:                                     ; preds = %39
  %44 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.6, double %.sroa.116.0.copyload.6)
  br label %45

; <label>:45:                                     ; preds = %43, %41
  %.sroa.015.0..sroa_idx.7 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 7, i32 0
  %.sroa.116.0..sroa_idx17.7 = getelementptr inbounds %struct._cplx, %struct._cplx* %1, i64 7, i32 1
  %.sroa.116.0.copyload.7 = load double, double* %.sroa.116.0..sroa_idx17.7, align 8
  %46 = fcmp une double %.sroa.116.0.copyload.7, 0.000000e+00
  %.sroa.0.0.copyload.7 = load double, double* %.sroa.015.0..sroa_idx.7, align 8
  br i1 %46, label %49, label %47

; <label>:47:                                     ; preds = %45
  %48 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"??_C@_03JBELIGOI@?$CFg?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.7)
  br label %51

; <label>:49:                                     ; preds = %45
  %50 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@", i64 0, i64 0), double %.sroa.0.0.copyload.7, double %.sroa.116.0.copyload.7)
  br label %51

; <label>:51:                                     ; preds = %49, %47
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local i32 @printf(i8*, ...) local_unnamed_addr #6 comdat {
  %2 = alloca i8*, align 8
  %3 = bitcast i8** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3) #8
  call void @llvm.va_start(i8* nonnull %3)
  %4 = load i8*, i8** %2, align 8, !tbaa !13
  %5 = call %struct._iobuf* @__acrt_iob_func(i32 1) #8
  %6 = call i64* @__local_stdio_printf_options() #8
  %7 = load i64, i64* %6, align 8, !tbaa !15
  %8 = call i32 @__stdio_common_vfprintf(i64 %7, %struct._iobuf* %5, i8* %0, %struct.__crt_locale_pointers* null, i8* %4) #8
  call void @llvm.va_end(i8* nonnull %3)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3) #8
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #5 {
.lr.ph.i:
  %0 = alloca [16 x %struct._cplx], align 16
  %1 = alloca [4 x %struct._cplx], align 16
  %2 = tail call double @atan2(double 1.000000e+00, double 1.000000e+00) #8
  store double 0x400921FB54442D18, double* @PI, align 8, !tbaa !9
  %3 = bitcast [4 x %struct._cplx]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %3) #8
  %4 = getelementptr inbounds [4 x %struct._cplx], [4 x %struct._cplx]* %1, i64 0, i64 2
  %5 = bitcast %struct._cplx* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 %5, i8 0, i64 32, i1 false)
  %6 = getelementptr inbounds [4 x %struct._cplx], [4 x %struct._cplx]* %1, i64 0, i64 0
  %7 = bitcast [4 x %struct._cplx]* %1 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %7, align 16
  %8 = getelementptr inbounds [4 x %struct._cplx], [4 x %struct._cplx]* %1, i64 0, i64 1, i32 0
  %9 = bitcast double* %8 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %9, align 16
  call void @show(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @"??_C@_06CCMPDPJJ@Data?3?5?$AA@", i64 0, i64 0), %struct._cplx* nonnull %6)
  %10 = bitcast [16 x %struct._cplx]* %0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %10) #8
  %11 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %0, i64 0, i64 0
  %12 = bitcast [16 x %struct._cplx]* %0 to i8*
  %13 = bitcast [4 x %struct._cplx]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %12, i8* nonnull align 16 %13, i64 16, i1 false) #8, !tbaa.struct !10
  %14 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %0, i64 0, i64 1
  %15 = getelementptr inbounds [4 x %struct._cplx], [4 x %struct._cplx]* %1, i64 0, i64 1
  %16 = bitcast %struct._cplx* %14 to i8*
  %17 = bitcast %struct._cplx* %15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %16, i8* nonnull align 16 %17, i64 16, i1 false) #8, !tbaa.struct !10
  %18 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %0, i64 0, i64 2
  %19 = getelementptr inbounds [4 x %struct._cplx], [4 x %struct._cplx]* %1, i64 0, i64 2
  %20 = bitcast %struct._cplx* %18 to i8*
  %21 = bitcast %struct._cplx* %19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %20, i8* nonnull align 16 %21, i64 16, i1 false) #8, !tbaa.struct !10
  %22 = getelementptr inbounds [16 x %struct._cplx], [16 x %struct._cplx]* %0, i64 0, i64 3
  %23 = getelementptr inbounds [4 x %struct._cplx], [4 x %struct._cplx]* %1, i64 0, i64 3
  %24 = bitcast %struct._cplx* %22 to i8*
  %25 = bitcast %struct._cplx* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %24, i8* nonnull align 16 %25, i64 16, i1 false) #8, !tbaa.struct !10
  call void @_fft(%struct._cplx* nonnull %6, %struct._cplx* nonnull %11, i32 8, i32 1) #8
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %10) #8
  call void @show(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @"??_C@_07CEBOBHLN@?6FFT?5?3?5?$AA@", i64 0, i64 0), %struct._cplx* nonnull %6)
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %3) #8
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) local_unnamed_addr #7

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #8

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #8

; Function Attrs: noinline norecurse nounwind uwtable
define linkonce_odr dso_local i64* @__local_stdio_printf_options() local_unnamed_addr #9 comdat {
  ret i64* @__local_stdio_printf_options._OptionsStorage
}

declare dso_local %struct._iobuf* @__acrt_iob_func(i32) local_unnamed_addr #10

declare dso_local i32 @__stdio_common_vfprintf(i64, %struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) local_unnamed_addr #10

declare i32 @__faultinject_selected_target(i32) local_unnamed_addr

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
!3 = !{!4, !5, i64 0}
!4 = !{!"_cplx", !5, i64 0, !5, i64 8}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 8}
!9 = !{!5, !5, i64 0}
!10 = !{i64 0, i64 8, !9, i64 8, i64 8, !9}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !6, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"long long", !6, i64 0}
