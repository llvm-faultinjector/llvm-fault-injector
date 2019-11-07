	.text
	.def	 qsort;
	.scl	2;
	.type	32;
	.endef
	.globl	qsort                   # -- Begin function qsort
	.p2align	4, 0x90
qsort:                                  # @qsort
.seh_proc qsort
# %bb.0:
	pushq	%r15
	.seh_pushreg 15
	pushq	%r14
	.seh_pushreg 14
	pushq	%r13
	.seh_pushreg 13
	pushq	%r12
	.seh_pushreg 12
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbp
	.seh_pushreg 5
	pushq	%rbx
	.seh_pushreg 3
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
                                        # kill: def $edx killed $edx def $rdx
	cmpl	%r8d, %edx
	jge	.LBB0_9
# %bb.1:                                # %.lr.ph39.preheader
	movl	%r8d, %r12d
	movq	%rcx, %r13
	movslq	%r8d, %r15
	leaq	4(%rcx), %r14
	.p2align	4, 0x90
.LBB0_2:                                # %.lr.ph39
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	leal	(%rdx,%r12), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movslq	%edx, %r10
	leaq	(,%r10,4), %r8
	addq	%r13, %r8
	movl	(%r13,%r10,4), %ebx
	cltq
	movl	(%r13,%rax,4), %esi
	movl	%esi, (%r13,%r10,4)
	movl	%ebx, (%r13,%rax,4)
	movq	%r8, %rax
	movl	%edx, %ebp
	cmpl	%r12d, %r10d
	jge	.LBB0_8
# %bb.3:                                # %.lr.ph.preheader
                                        #   in Loop: Header=BB0_2 Depth=1
	movq	%r15, %r9
	subq	%r10, %r9
	leaq	(%r14,%r10,4), %rax
	xorl	%esi, %esi
	movl	%edx, %ebp
	.p2align	4, 0x90
.LBB0_4:                                # %.lr.ph
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rax,%rsi,4), %ecx
	cmpl	(%r13,%r10,4), %ecx
	jge	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=2
	movslq	%ebp, %rcx
	addl	$1, %ebp
	movl	4(%r13,%rcx,4), %edi
	movl	(%rax,%rsi,4), %ebx
	movl	%ebx, 4(%r13,%rcx,4)
	movl	%edi, (%rax,%rsi,4)
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=2
	addq	$1, %rsi
	cmpq	%rsi, %r9
	jne	.LBB0_4
# %bb.7:                                # %tailrecurse.loopexit
                                        #   in Loop: Header=BB0_2 Depth=1
	movslq	%ebp, %rax
	leaq	(,%rax,4), %rax
	addq	%r13, %rax
.LBB0_8:                                # %tailrecurse
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	(%r8), %ecx
	movl	(%rax), %ebx
	movl	%ebx, (%r8)
	movl	%ecx, (%rax)
	leal	-1(%rbp), %r8d
	movq	%r13, %rcx
                                        # kill: def $edx killed $edx killed $rdx
	callq	qsort
	addl	$1, %ebp
	movl	%ebp, %edx
	cmpl	%r12d, %ebp
	jl	.LBB0_2
.LBB0_9:                                # %tailrecurse._crit_edge
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 swap;
	.scl	2;
	.type	32;
	.endef
	.globl	swap                    # -- Begin function swap
	.p2align	4, 0x90
swap:                                   # @swap
# %bb.0:
	movslq	%edx, %r10
	movl	(%rcx,%r10,4), %r9d
	movslq	%r8d, %rdx
	movl	(%rcx,%rdx,4), %eax
	movl	%eax, (%rcx,%r10,4)
	movl	%r9d, (%rcx,%rdx,4)
	retq
                                        # -- End function
	.def	 main;
	.scl	2;
	.type	32;
	.endef
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
main:                                   # @main
.seh_proc main
# %bb.0:
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	subq	$424, %rsp              # imm = 0x1A8
	.seh_stackalloc 424
	.seh_endprologue
	leaq	.Lmain.arr(%rip), %rdx
	leaq	32(%rsp), %rsi
	movl	$388, %r8d              # imm = 0x184
	movq	%rsi, %rcx
	callq	memcpy
	xorl	%edi, %edi
	xorl	%edx, %edx
	movl	$96, %r8d
	movq	%rsi, %rcx
	callq	qsort
	leaq	"??_C@_03JDANDILB@?$CFd?5?$AA@"(%rip), %rsi
	.p2align	4, 0x90
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movl	32(%rsp,%rdi,4), %edx
	movq	%rsi, %rcx
	callq	printf
	addq	$1, %rdi
	cmpq	$97, %rdi
	jne	.LBB2_1
# %bb.2:
	xorl	%eax, %eax
	addq	$424, %rsp              # imm = 0x1A8
	popq	%rdi
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
	.section	.rdata,"dr"
	.p2align	4               # @main.arr
.Lmain.arr:
	.long	7                       # 0x7
	.long	8                       # 0x8
	.long	0                       # 0x0
	.long	5                       # 0x5
	.long	4                       # 0x4
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	4                       # 0x4
	.long	3                       # 0x3
	.long	10                      # 0xa
	.long	99                      # 0x63
	.long	55                      # 0x37
	.long	10                      # 0xa
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	9                       # 0x9
	.long	8                       # 0x8
	.long	7                       # 0x7
	.long	6                       # 0x6
	.long	5                       # 0x5
	.long	4                       # 0x4
	.long	3                       # 0x3
	.long	2                       # 0x2
	.long	1                       # 0x1
	.long	0                       # 0x0
	.long	8                       # 0x8
	.long	0                       # 0x0
	.long	5                       # 0x5
	.long	4                       # 0x4
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	4                       # 0x4
	.long	3                       # 0x3
	.long	10                      # 0xa
	.long	99                      # 0x63
	.long	55                      # 0x37
	.long	10                      # 0xa
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	9                       # 0x9
	.long	8                       # 0x8
	.long	7                       # 0x7
	.long	6                       # 0x6
	.long	5                       # 0x5
	.long	4                       # 0x4
	.long	3                       # 0x3
	.long	2                       # 0x2
	.long	1                       # 0x1
	.long	0                       # 0x0
	.long	8                       # 0x8
	.long	0                       # 0x0
	.long	5                       # 0x5
	.long	4                       # 0x4
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	4                       # 0x4
	.long	3                       # 0x3
	.long	10                      # 0xa
	.long	99                      # 0x63
	.long	55                      # 0x37
	.long	10                      # 0xa
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	9                       # 0x9
	.long	8                       # 0x8
	.long	7                       # 0x7
	.long	6                       # 0x6
	.long	5                       # 0x5
	.long	4                       # 0x4
	.long	3                       # 0x3
	.long	2                       # 0x2
	.long	1                       # 0x1
	.long	0                       # 0x0
	.long	8                       # 0x8
	.long	0                       # 0x0
	.long	5                       # 0x5
	.long	4                       # 0x4
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	4                       # 0x4
	.long	3                       # 0x3
	.long	10                      # 0xa
	.long	99                      # 0x63
	.long	55                      # 0x37
	.long	10                      # 0xa
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	9                       # 0x9
	.long	8                       # 0x8
	.long	7                       # 0x7
	.long	6                       # 0x6
	.long	5                       # 0x5
	.long	4                       # 0x4
	.long	3                       # 0x3
	.long	2                       # 0x2
	.long	1                       # 0x1
	.long	0                       # 0x0

	.section	.rdata,"dr",discard,"??_C@_03JDANDILB@?$CFd?5?$AA@"
	.globl	"??_C@_03JDANDILB@?$CFd?5?$AA@" # @"??_C@_03JDANDILB@?$CFd?5?$AA@"
"??_C@_03JDANDILB@?$CFd?5?$AA@":
	.asciz	"%d "

	.lcomm	__local_stdio_printf_options._OptionsStorage,8,8 # @__local_stdio_printf_options._OptionsStorage

