	.text
	.def	 ccc;
	.scl	2;
	.type	32;
	.endef
	.globl	ccc                     # -- Begin function ccc
	.p2align	4, 0x90
ccc:                                    # @ccc
# %bb.0:
	retq
                                        # -- End function
	.def	 make;
	.scl	2;
	.type	32;
	.endef
	.globl	make                    # -- Begin function make
	.p2align	4, 0x90
make:                                   # @make
# %bb.0:
	movsd	%xmm1, (%rcx)
	movsd	%xmm2, 8(%rcx)
	movq	%rcx, %rax
	retq
                                        # -- End function
	.def	 mul;
	.scl	2;
	.type	32;
	.endef
	.globl	mul                     # -- Begin function mul
	.p2align	4, 0x90
mul:                                    # @mul
# %bb.0:
	movsd	(%rdx), %xmm0           # xmm0 = mem[0],zero
	movsd	8(%rdx), %xmm1          # xmm1 = mem[0],zero
	mulsd	(%r8), %xmm0
	mulsd	8(%r8), %xmm1
	movapd	%xmm0, %xmm2
	subsd	%xmm1, %xmm2
	movsd	%xmm2, (%rcx)
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rcx)
	movq	%rcx, %rax
	retq
                                        # -- End function
	.def	 plus;
	.scl	2;
	.type	32;
	.endef
	.globl	plus                    # -- Begin function plus
	.p2align	4, 0x90
plus:                                   # @plus
# %bb.0:
	movupd	(%rdx), %xmm0
	movupd	(%r8), %xmm1
	addpd	%xmm0, %xmm1
	movupd	%xmm1, (%rcx)
	movq	%rcx, %rax
	retq
                                        # -- End function
	.def	 creal;
	.scl	2;
	.type	32;
	.endef
	.globl	creal                   # -- Begin function creal
	.p2align	4, 0x90
creal:                                  # @creal
# %bb.0:
	movsd	(%rcx), %xmm0           # xmm0 = mem[0],zero
	retq
                                        # -- End function
	.def	 cimag;
	.scl	2;
	.type	32;
	.endef
	.globl	cimag                   # -- Begin function cimag
	.p2align	4, 0x90
cimag:                                  # @cimag
# %bb.0:
	movsd	8(%rcx), %xmm0          # xmm0 = mem[0],zero
	retq
                                        # -- End function
	.def	 _fft;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@80000000000000008000000000000000 # -- Begin function _fft
	.section	.rdata,"dr",discard,__xmm@80000000000000008000000000000000
	.p2align	4
__xmm@80000000000000008000000000000000:
	.quad	-9223372036854775808    # double -0
	.quad	-9223372036854775808    # double -0
	.text
	.globl	_fft
	.p2align	4, 0x90
_fft:                                   # @_fft
.seh_proc _fft
# %bb.0:
	pushq	%r15
	.seh_pushreg 15
	pushq	%r14
	.seh_pushreg 14
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbp
	.seh_pushreg 5
	pushq	%rbx
	.seh_pushreg 3
	subq	$56, %rsp
	.seh_stackalloc 56
	movapd	%xmm6, 32(%rsp)         # 16-byte Spill
	.seh_savexmm 6, 32
	.seh_endprologue
	cmpl	%r8d, %r9d
	jge	.LBB6_4
# %bb.1:
	movl	%r9d, %ebp
	movl	%r8d, %r15d
	movq	%rdx, %rdi
	movq	%rcx, %rbx
	leal	(%rbp,%rbp), %r14d
	movq	%rdx, %rcx
	movq	%rbx, %rdx
	movl	%r14d, %r9d
	callq	_fft
	movslq	%ebp, %rbp
	shlq	$4, %rbp
	leaq	(%rbx,%rbp), %rdx
	leaq	(%rdi,%rbp), %rcx
	movl	%r15d, %r8d
	movl	%r14d, %r9d
	callq	_fft
	testl	%r15d, %r15d
	jle	.LBB6_4
# %bb.2:                                # %.lr.ph
	cvtsi2sdl	%r15d, %xmm0
	movslq	%r14d, %r8
	addq	$8, %rdi
	movq	%r8, %rcx
	shlq	$4, %rcx
	xorl	%edx, %edx
	movapd	__xmm@80000000000000008000000000000000(%rip), %xmm1 # xmm1 = [-0.000000e+00,-0.000000e+00]
	xorpd	%xmm2, %xmm2
	movslq	%r15d, %r9
	.p2align	4, 0x90
.LBB6_3:                                # =>This Inner Loop Header: Depth=1
	xorps	%xmm3, %xmm3
	cvtsi2sdl	%edx, %xmm3
	mulsd	PI(%rip), %xmm3
	xorpd	%xmm1, %xmm3
	divsd	%xmm0, %xmm3
	movsd	-8(%rdi,%rbp), %xmm5    # xmm5 = mem[0],zero
	mulsd	%xmm2, %xmm5
	mulsd	(%rdi,%rbp), %xmm3
	movapd	%xmm5, %xmm4
	subsd	%xmm3, %xmm4
	addsd	%xmm5, %xmm3
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	sarl	%eax
	cltq
	movsd	-8(%rdi), %xmm5         # xmm5 = mem[0],zero
	addsd	%xmm4, %xmm5
	movsd	(%rdi), %xmm6           # xmm6 = mem[0],zero
	addsd	%xmm3, %xmm6
	shlq	$4, %rax
	movsd	%xmm5, (%rbx,%rax)
	movsd	%xmm6, 8(%rbx,%rax)
	leal	(%r15,%rdx), %esi
	movl	%esi, %eax
	shrl	$31, %eax
	addl	%esi, %eax
	sarl	%eax
	cltq
	addsd	-8(%rdi), %xmm4
	addsd	(%rdi), %xmm3
	shlq	$4, %rax
	movsd	%xmm4, (%rbx,%rax)
	movsd	%xmm3, 8(%rbx,%rax)
	addq	%r8, %rdx
	addq	%rcx, %rdi
	cmpq	%r9, %rdx
	jl	.LBB6_3
.LBB6_4:                                # %.loopexit
	movaps	32(%rsp), %xmm6         # 16-byte Reload
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 fft;
	.scl	2;
	.type	32;
	.endef
	.globl	fft                     # -- Begin function fft
	.p2align	4, 0x90
fft:                                    # @fft
.seh_proc fft
# %bb.0:
	subq	$296, %rsp              # imm = 0x128
	.seh_stackalloc 296
	.seh_endprologue
	movl	%edx, %r8d
	testl	%edx, %edx
	jle	.LBB7_6
# %bb.1:                                # %.lr.ph.preheader
	movl	%r8d, %r9d
	leaq	-1(%r9), %rax
	movl	%r9d, %r10d
	andl	$3, %r10d
	cmpq	$3, %rax
	jae	.LBB7_7
# %bb.2:
	xorl	%eax, %eax
	testq	%r10, %r10
	jne	.LBB7_4
	jmp	.LBB7_6
.LBB7_7:                                # %.lr.ph.preheader.new
	subq	%r10, %r9
	movl	$48, %edx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB7_8:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movups	-48(%rcx,%rdx), %xmm0
	movups	%xmm0, -16(%rsp,%rdx)
	movups	-32(%rcx,%rdx), %xmm0
	movups	%xmm0, (%rsp,%rdx)
	movups	-16(%rcx,%rdx), %xmm0
	movups	%xmm0, 16(%rsp,%rdx)
	movups	(%rcx,%rdx), %xmm0
	movups	%xmm0, 32(%rsp,%rdx)
	addq	$4, %rax
	addq	$64, %rdx
	cmpq	%rax, %r9
	jne	.LBB7_8
# %bb.3:                                # %._crit_edge.loopexit.unr-lcssa
	testq	%r10, %r10
	je	.LBB7_6
.LBB7_4:                                # %.lr.ph.epil.preheader
	shlq	$4, %rax
	negq	%r10
	.p2align	4, 0x90
.LBB7_5:                                # %.lr.ph.epil
                                        # =>This Inner Loop Header: Depth=1
	movups	(%rcx,%rax), %xmm0
	movups	%xmm0, 32(%rsp,%rax)
	addq	$16, %rax
	addq	$1, %r10
	jne	.LBB7_5
.LBB7_6:                                # %._crit_edge
	leaq	32(%rsp), %rdx
	movl	$1, %r9d
	callq	_fft
	nop
	addq	$296, %rsp              # imm = 0x128
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 show;
	.scl	2;
	.type	32;
	.endef
	.globl	show                    # -- Begin function show
	.p2align	4, 0x90
show:                                   # @show
.seh_proc show
# %bb.0:
	pushq	%rsi
	.seh_pushreg 6
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rcx, %rax
	leaq	"??_C@_02DKCKIIND@?$CFs?$AA@"(%rip), %rcx
	movq	%rax, %rdx
	callq	printf
	movq	(%rsi), %xmm1           # xmm1 = mem[0],zero
	movq	8(%rsi), %xmm2          # xmm2 = mem[0],zero
	xorps	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm2
	jne	.LBB8_2
	jnp	.LBB8_1
.LBB8_2:
	leaq	"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	movq	%xmm2, %r8
	callq	printf
	jmp	.LBB8_3
.LBB8_1:
	leaq	"??_C@_03JBELIGOI@?$CFg?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	callq	printf
.LBB8_3:
	movq	16(%rsi), %xmm1         # xmm1 = mem[0],zero
	movq	24(%rsi), %xmm2         # xmm2 = mem[0],zero
	xorps	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm2
	jne	.LBB8_5
	jnp	.LBB8_4
.LBB8_5:
	leaq	"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	movq	%xmm2, %r8
	callq	printf
	jmp	.LBB8_6
.LBB8_4:
	leaq	"??_C@_03JBELIGOI@?$CFg?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	callq	printf
.LBB8_6:
	movq	32(%rsi), %xmm1         # xmm1 = mem[0],zero
	movq	40(%rsi), %xmm2         # xmm2 = mem[0],zero
	xorps	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm2
	jne	.LBB8_8
	jnp	.LBB8_7
.LBB8_8:
	leaq	"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	movq	%xmm2, %r8
	callq	printf
	jmp	.LBB8_9
.LBB8_7:
	leaq	"??_C@_03JBELIGOI@?$CFg?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	callq	printf
.LBB8_9:
	movq	48(%rsi), %xmm1         # xmm1 = mem[0],zero
	movq	56(%rsi), %xmm2         # xmm2 = mem[0],zero
	xorps	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm2
	jne	.LBB8_11
	jnp	.LBB8_10
.LBB8_11:
	leaq	"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	movq	%xmm2, %r8
	callq	printf
	jmp	.LBB8_12
.LBB8_10:
	leaq	"??_C@_03JBELIGOI@?$CFg?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	callq	printf
.LBB8_12:
	movq	64(%rsi), %xmm1         # xmm1 = mem[0],zero
	movq	72(%rsi), %xmm2         # xmm2 = mem[0],zero
	xorps	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm2
	jne	.LBB8_14
	jnp	.LBB8_13
.LBB8_14:
	leaq	"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	movq	%xmm2, %r8
	callq	printf
	jmp	.LBB8_15
.LBB8_13:
	leaq	"??_C@_03JBELIGOI@?$CFg?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	callq	printf
.LBB8_15:
	movq	80(%rsi), %xmm1         # xmm1 = mem[0],zero
	movq	88(%rsi), %xmm2         # xmm2 = mem[0],zero
	xorps	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm2
	jne	.LBB8_17
	jnp	.LBB8_16
.LBB8_17:
	leaq	"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	movq	%xmm2, %r8
	callq	printf
	jmp	.LBB8_18
.LBB8_16:
	leaq	"??_C@_03JBELIGOI@?$CFg?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	callq	printf
.LBB8_18:
	movq	96(%rsi), %xmm1         # xmm1 = mem[0],zero
	movq	104(%rsi), %xmm2        # xmm2 = mem[0],zero
	xorps	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm2
	jne	.LBB8_20
	jnp	.LBB8_19
.LBB8_20:
	leaq	"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	movq	%xmm2, %r8
	callq	printf
	jmp	.LBB8_21
.LBB8_19:
	leaq	"??_C@_03JBELIGOI@?$CFg?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	callq	printf
.LBB8_21:
	movq	112(%rsi), %xmm1        # xmm1 = mem[0],zero
	movq	120(%rsi), %xmm2        # xmm2 = mem[0],zero
	xorps	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm2
	jne	.LBB8_24
	jnp	.LBB8_22
.LBB8_24:
	leaq	"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	movq	%xmm2, %r8
	callq	printf
	jmp	.LBB8_23
.LBB8_22:
	leaq	"??_C@_03JBELIGOI@?$CFg?5?$AA@"(%rip), %rcx
	movq	%xmm1, %rdx
	callq	printf
.LBB8_23:
	nop
	addq	$32, %rsp
	popq	%rsi
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 printf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,printf
	.globl	printf                  # -- Begin function printf
	.p2align	4, 0x90
printf:                                 # @printf
.seh_proc printf
# %bb.0:
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbx
	.seh_pushreg 3
	subq	$48, %rsp
	.seh_stackalloc 48
	.seh_endprologue
	movq	%rcx, %rsi
	movq	%r9, 104(%rsp)
	movq	%r8, 96(%rsp)
	movq	%rdx, 88(%rsp)
	leaq	88(%rsp), %rbx
	movq	%rbx, 40(%rsp)
	movl	$1, %ecx
	callq	__acrt_iob_func
	movq	%rax, %rdi
	callq	__local_stdio_printf_options
	movq	(%rax), %rcx
	movq	%rbx, 32(%rsp)
	xorl	%r9d, %r9d
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	__stdio_common_vfprintf
	nop
	addq	$48, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,printf
	.seh_endproc
                                        # -- End function
	.def	 main;
	.scl	2;
	.type	32;
	.endef
	.globl	__real@3ff0000000000000 # -- Begin function main
	.section	.rdata,"dr",discard,__real@3ff0000000000000
	.p2align	3
__real@3ff0000000000000:
	.quad	4607182418800017408     # double 1
	.globl	__xmm@3ff00000000000003ff0000000000000
	.section	.rdata,"dr",discard,__xmm@3ff00000000000003ff0000000000000
	.p2align	4
__xmm@3ff00000000000003ff0000000000000:
	.quad	4607182418800017408     # double 1
	.quad	4607182418800017408     # double 1
	.text
	.globl	main
	.p2align	4, 0x90
main:                                   # @main
.seh_proc main
# %bb.0:                                # %.lr.ph.i
	pushq	%rsi
	.seh_pushreg 6
	subq	$352, %rsp              # imm = 0x160
	.seh_stackalloc 352
	.seh_endprologue
	movsd	__real@3ff0000000000000(%rip), %xmm0 # xmm0 = mem[0],zero
	movaps	%xmm0, %xmm1
	callq	atan2
	movabsq	$4614256656552045848, %rax # imm = 0x400921FB54442D18
	movq	%rax, PI(%rip)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 64(%rsp)
	movaps	__xmm@3ff00000000000003ff0000000000000(%rip), %xmm0 # xmm0 = [1.000000e+00,1.000000e+00]
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 48(%rsp)
	leaq	"??_C@_06CCMPDPJJ@Data?3?5?$AA@"(%rip), %rcx
	leaq	32(%rsp), %rsi
	movq	%rsi, %rdx
	callq	show
	movaps	32(%rsp), %xmm0
	movaps	48(%rsp), %xmm1
	movaps	64(%rsp), %xmm2
	movaps	80(%rsp), %xmm3
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm1, 112(%rsp)
	movaps	%xmm2, 128(%rsp)
	movaps	%xmm3, 144(%rsp)
	leaq	96(%rsp), %rdx
	movl	$8, %r8d
	movl	$1, %r9d
	movq	%rsi, %rcx
	callq	_fft
	leaq	"??_C@_07CEBOBHLN@?6FFT?5?3?5?$AA@"(%rip), %rcx
	movq	%rsi, %rdx
	callq	show
	xorl	%eax, %eax
	addq	$352, %rsp              # imm = 0x160
	popq	%rsi
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 __local_stdio_printf_options;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,__local_stdio_printf_options
	.globl	__local_stdio_printf_options # -- Begin function __local_stdio_printf_options
	.p2align	4, 0x90
__local_stdio_printf_options:           # @__local_stdio_printf_options
# %bb.0:
	leaq	__local_stdio_printf_options._OptionsStorage(%rip), %rax
	retq
                                        # -- End function
	.data
	.globl	PI                      # @PI
	.p2align	3
PI:
	.quad	4614256656551843652     # double 3.1415926535000001

	.section	.rdata,"dr",discard,"??_C@_02DKCKIIND@?$CFs?$AA@"
	.globl	"??_C@_02DKCKIIND@?$CFs?$AA@" # @"??_C@_02DKCKIIND@?$CFs?$AA@"
"??_C@_02DKCKIIND@?$CFs?$AA@":
	.asciz	"%s"

	.section	.rdata,"dr",discard,"??_C@_03JBELIGOI@?$CFg?5?$AA@"
	.globl	"??_C@_03JBELIGOI@?$CFg?5?$AA@" # @"??_C@_03JBELIGOI@?$CFg?5?$AA@"
"??_C@_03JBELIGOI@?$CFg?5?$AA@":
	.asciz	"%g "

	.section	.rdata,"dr",discard,"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@"
	.globl	"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@" # @"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@"
"??_C@_09FAMONKDO@?$CI?$CFg?0?5?$CFg?$CJ?5?$AA@":
	.asciz	"(%g, %g) "

	.section	.rdata,"dr",discard,"??_C@_06CCMPDPJJ@Data?3?5?$AA@"
	.globl	"??_C@_06CCMPDPJJ@Data?3?5?$AA@" # @"??_C@_06CCMPDPJJ@Data?3?5?$AA@"
"??_C@_06CCMPDPJJ@Data?3?5?$AA@":
	.asciz	"Data: "

	.section	.rdata,"dr",discard,"??_C@_07CEBOBHLN@?6FFT?5?3?5?$AA@"
	.globl	"??_C@_07CEBOBHLN@?6FFT?5?3?5?$AA@" # @"??_C@_07CEBOBHLN@?6FFT?5?3?5?$AA@"
"??_C@_07CEBOBHLN@?6FFT?5?3?5?$AA@":
	.asciz	"\nFFT : "

	.lcomm	__local_stdio_printf_options._OptionsStorage,8,8 # @__local_stdio_printf_options._OptionsStorage

	.globl	_fltused
