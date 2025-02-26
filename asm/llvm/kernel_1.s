	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1"
	.file	"kernel.cl"
	.option	push
	.option	arch, +a, +c, +m
	.globl	myGEMM1                         # -- Begin function myGEMM1
	.p2align	1
	.type	myGEMM1,@function
myGEMM1:                                # @myGEMM1
# %bb.0:
	addi	sp, sp, -96
	sd	ra, 88(sp)                      # 8-byte Folded Spill
	sd	s0, 80(sp)                      # 8-byte Folded Spill
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	s2, 64(sp)                      # 8-byte Folded Spill
	sd	s3, 56(sp)                      # 8-byte Folded Spill
	sd	s4, 48(sp)                      # 8-byte Folded Spill
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	sd	s6, 32(sp)                      # 8-byte Folded Spill
	sd	s7, 24(sp)                      # 8-byte Folded Spill
	sd	s8, 16(sp)                      # 8-byte Folded Spill
	sd	s9, 8(sp)                       # 8-byte Folded Spill
	addi	s0, sp, 96
	mv	s2, a5
	mv	s6, a4
	mv	s7, a3
	mv	s8, a2
	mv	s3, a0
	sext.w	s9, a2
	li	a0, 0
	call	_Z13get_global_idj
	mv	s4, a0
	li	a0, 1
	call	_Z13get_global_idj
	mv	s5, a0
	li	s1, 0
	blez	s9, .LBB0_3
# %bb.1:
	mulw	a0, s5, s8
	sext.w	a1, s4
	slli	a1, a1, 2
	add	s7, s7, a1
	sext.w	s8, s3
	slli	a0, a0, 2
	slli	s9, s9, 2
	add	s9, s9, s6
	add	s6, s6, a0
	slli	s8, s8, 2
	add	s9, s9, a0
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s7)
	lw	a1, 0(s6)
	call	__mulsf3
	mv	a1, s1
	call	__addsf3
	mv	s1, a0
	addi	s6, s6, 4
	add	s7, s7, s8
	bne	s6, s9, .LBB0_2
.LBB0_3:
	mul	a0, s5, s3
	addw	a0, a0, s4
	slli	a0, a0, 2
	add	a0, a0, s2
	sw	s1, 0(a0)
	ld	ra, 88(sp)                      # 8-byte Folded Reload
	ld	s0, 80(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s2, 64(sp)                      # 8-byte Folded Reload
	ld	s3, 56(sp)                      # 8-byte Folded Reload
	ld	s4, 48(sp)                      # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	ld	s6, 32(sp)                      # 8-byte Folded Reload
	ld	s7, 24(sp)                      # 8-byte Folded Reload
	ld	s8, 16(sp)                      # 8-byte Folded Reload
	ld	s9, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 96
	ret
.Lfunc_end0:
	.size	myGEMM1, .Lfunc_end0-myGEMM1
                                        # -- End function
	.option	pop
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
