	.text
	.def	 test;
	.scl	2;
	.type	32;
	.endef
	.globl	__real@41200000         # -- Begin function test
	.section	.rdata,"dr",discard,__real@41200000
	.p2align	2
__real@41200000:
	.long	1092616192              # float 10
	.globl	__real@42c80000
	.section	.rdata,"dr",discard,__real@42c80000
	.p2align	2
__real@42c80000:
	.long	1120403456              # float 100
	.text
	.globl	test
	.p2align	4, 0x90
test:                                   # @test
# %bb.0:
	movl	$1000, %eax             # imm = 0x3E8
	movss	__real@41200000(%rip), %xmm1 # xmm1 = mem[0],zero,zero,zero
	movss	__real@42c80000(%rip), %xmm2 # xmm2 = mem[0],zero,zero,zero
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	addss	%xmm1, %xmm0
	movss	__unnamed_1(%rip), %xmm3 # ### FAULT INJECTED
                                        # xmm3 = mem[0],zero,zero,zero
	xorps	%xmm0, %xmm3
	movl	$0, __unnamed_1(%rip)
	ucomiss	%xmm2, %xmm3
	jbe	.LBB0_3
# %bb.2:                                # %select.true.sink
                                        #   in Loop: Header=BB0_1 Depth=1
	divss	%xmm1, %xmm0
.LBB0_3:                                # %select.end
                                        #   in Loop: Header=BB0_1 Depth=1
	addl	$-1, %eax
	jne	.LBB0_1
# %bb.4:
	retq
                                        # -- End function
	.def	 cast;
	.scl	2;
	.type	32;
	.endef
	.globl	__real@00000001         # -- Begin function cast
	.section	.rdata,"dr",discard,__real@00000001
	.p2align	2
__real@00000001:
	.long	1                       # float 1.40129846E-45
	.text
	.globl	cast
	.p2align	4, 0x90
cast:                                   # @cast
# %bb.0:
	movss	__real@00000001(%rip), %xmm1 # xmm1 = mem[0],zero,zero,zero
	xorps	%xmm1, %xmm0
	retq
                                        # -- End function
	.def	 main;
	.scl	2;
	.type	32;
	.endef
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
main:                                   # @main
# %bb.0:
	xorl	%eax, %eax
	retq
                                        # -- End function
	.data
	.p2align	2               # @0
__unnamed_1:
	.long	8388608                 # 0x800000


