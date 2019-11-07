	.text
	.file	"qsort.c"
	.globl	qsort                   # -- Begin function qsort
	.p2align	4, 0x90
	.type	qsort,@function
qsort:                                  # @qsort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def $esi killed $esi def $rsi
	cmpl	%edx, %esi
	jge	.LBB0_17
# %bb.1:                                # %.lr.ph38.preheader
	movl	%edx, %r14d
	movq	%rdi, %r13
	movslq	%edx, %r15
	movq	%r15, %r12
	negq	%r12
	leaq	8(%rdi), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB0_2:                                # %.lr.ph38
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
	leal	(%rsi,%r14), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%eax, %edx
	sarl	%edx
	movslq	%esi, %rcx
	leaq	(,%rcx,4), %r11
	addq	%r13, %r11
	movl	(%r13,%rcx,4), %edi
	movslq	%edx, %rdx
	movl	(%r13,%rdx,4), %ebp
	movl	%ebp, (%r13,%rcx,4)
	movl	%edi, (%r13,%rdx,4)
	movq	%r11, %rdx
	movl	%esi, %ebp
	cmpl	%r14d, %ecx
	jge	.LBB0_16
# %bb.3:                                # %.lr.ph.preheader
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	%r14d, %edi
	subl	%ecx, %edi
	movq	%rcx, %rdx
	notq	%rdx
	testb	$1, %dil
	jne	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
                                        # implicit-def: $ebp
	movq	%rcx, %r9
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_5:                                # %.lr.ph.prol
                                        #   in Loop: Header=BB0_2 Depth=1
	leaq	1(%rcx), %r9
	movl	4(%r13,%rcx,4), %edi
	cmpl	(%r11), %edi
	jge	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_2 Depth=1
	leal	1(%rcx), %ebp
	movl	4(%r13,%rcx,4), %r8d
	movl	%edi, 4(%r13,%rcx,4)
	movl	%r8d, 4(%r13,%rcx,4)
	movl	%ebp, %r8d
	cmpq	%r12, %rdx
	jne	.LBB0_9
	jmp	.LBB0_15
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%esi, %ebp
.LBB0_8:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%esi, %r8d
	cmpq	%r12, %rdx
	je	.LBB0_15
.LBB0_9:                                # %.lr.ph.preheader1
                                        #   in Loop: Header=BB0_2 Depth=1
	movq	%r15, %r10
	subq	%r9, %r10
	movq	(%rsp), %rax            # 8-byte Reload
	leaq	(%rax,%r9,4), %rdx
	xorl	%edi, %edi
	movl	%r8d, %ebp
	.p2align	4, 0x90
.LBB0_10:                               # %.lr.ph
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rdx,%rdi,4), %ecx
	cmpl	(%r11), %ecx
	jge	.LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_10 Depth=2
	movslq	%ebp, %rbx
	addl	$1, %ebp
	movl	4(%r13,%rbx,4), %eax
	movl	%ecx, 4(%r13,%rbx,4)
	movl	%eax, -4(%rdx,%rdi,4)
.LBB0_12:                               # %.lr.ph.141
                                        #   in Loop: Header=BB0_10 Depth=2
	movl	(%rdx,%rdi,4), %ecx
	cmpl	(%r11), %ecx
	jge	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_10 Depth=2
	movslq	%ebp, %rax
	addl	$1, %ebp
	movl	4(%r13,%rax,4), %ebx
	movl	%ecx, 4(%r13,%rax,4)
	movl	%ebx, (%rdx,%rdi,4)
.LBB0_14:                               #   in Loop: Header=BB0_10 Depth=2
	addq	$2, %rdi
	cmpq	%rdi, %r10
	jne	.LBB0_10
.LBB0_15:                               # %tailrecurse.loopexit
                                        #   in Loop: Header=BB0_2 Depth=1
	movslq	%ebp, %rax
	leaq	(,%rax,4), %rdx
	addq	%r13, %rdx
.LBB0_16:                               # %tailrecurse
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	(%r11), %eax
	movl	(%rdx), %ecx
	movl	%ecx, (%r11)
	movl	%eax, (%rdx)
	leal	-1(%rbp), %edx
	movq	%r13, %rdi
                                        # kill: def $esi killed $esi killed $rsi
	callq	qsort
	addl	$1, %ebp
	movl	%ebp, %esi
	cmpl	%r14d, %ebp
	jl	.LBB0_2
.LBB0_17:                               # %tailrecurse._crit_edge
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	qsort, .Lfunc_end0-qsort
	.cfi_endproc
                                        # -- End function
	.globl	swap                    # -- Begin function swap
	.p2align	4, 0x90
	.type	swap,@function
swap:                                   # @swap
	.cfi_startproc
# %bb.0:
	movslq	%esi, %rax
	movl	(%rdi,%rax,4), %ecx
	movslq	%edx, %rdx
	movl	(%rdi,%rdx,4), %esi
	movl	%esi, (%rdi,%rax,4)
	movl	%ecx, (%rdi,%rdx,4)
	retq
.Lfunc_end1:
	.size	swap, .Lfunc_end1-swap
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$400, %rsp              # imm = 0x190
	.cfi_def_cfa_offset 416
	.cfi_offset %rbx, -16
	movq	%rsp, %rbx
	movl	$.Lmain.arr, %esi
	movl	$388, %edx              # imm = 0x184
	movq	%rbx, %rdi
	callq	memcpy
	xorl	%esi, %esi
	movl	$96, %edx
	movq	%rbx, %rdi
	callq	qsort
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movl	(%rsp,%rbx,4), %esi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	addq	$1, %rbx
	cmpq	$97, %rbx
	jne	.LBB2_1
# %bb.2:
	xorl	%eax, %eax
	addq	$400, %rsp              # imm = 0x190
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	.Lmain.arr,@object      # @main.arr
	.section	.rodata,"a",@progbits
	.p2align	4
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
	.size	.Lmain.arr, 388

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d "
	.size	.L.str, 4


	.ident	"clang version 7.0.0-3 (tags/RELEASE_700/final)"
	.section	".note.GNU-stack","",@progbits
