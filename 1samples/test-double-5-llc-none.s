	.text
	.def	 test;
	.scl	2;
	.type	32;
	.endef
	.globl	__real@4024000000000000 # -- Begin function test
	.section	.rdata,"dr",discard,__real@4024000000000000
	.p2align	3
__real@4024000000000000:
	.quad	4621819117588971520     # double 10
	.globl	__real@4059000000000000
	.section	.rdata,"dr",discard,__real@4059000000000000
	.p2align	3
__real@4059000000000000:
	.quad	4636737291354636288     # double 100
	.text
	.globl	test
	.p2align	4, 0x90
test:                                   # @test
# %bb.0:
	movl	$1000, %eax             # imm = 0x3E8
	movsd	__real@4024000000000000(%rip), %xmm1 # xmm1 = mem[0],zero
	movsd	__real@4059000000000000(%rip), %xmm2 # xmm2 = mem[0],zero
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	addsd	%xmm1, %xmm0
	ucomisd	%xmm2, %xmm0
	jbe	.LBB0_3
# %bb.2:                                # %select.true.sink
                                        #   in Loop: Header=BB0_1 Depth=1
	divsd	%xmm1, %xmm0
.LBB0_3:                                # %select.end
                                        #   in Loop: Header=BB0_1 Depth=1
	addl	$-1, %eax
	jne	.LBB0_1
# %bb.4:
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

