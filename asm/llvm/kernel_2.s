	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1"
	.file	"kernel.cl"
	.option	push
	.option	arch, +a, +c, +m
	.globl	myGEMM2                         # -- Begin function myGEMM2
	.p2align	1
	.type	myGEMM2,@function
myGEMM2:                                # @myGEMM2
# %bb.0:
	addi	sp, sp, -176
	sd	ra, 168(sp)                     # 8-byte Folded Spill
	sd	s0, 160(sp)                     # 8-byte Folded Spill
	sd	s1, 152(sp)                     # 8-byte Folded Spill
	sd	s2, 144(sp)                     # 8-byte Folded Spill
	sd	s3, 136(sp)                     # 8-byte Folded Spill
	sd	s4, 128(sp)                     # 8-byte Folded Spill
	sd	s5, 120(sp)                     # 8-byte Folded Spill
	sd	s6, 112(sp)                     # 8-byte Folded Spill
	sd	s7, 104(sp)                     # 8-byte Folded Spill
	sd	s8, 96(sp)                      # 8-byte Folded Spill
	sd	s9, 88(sp)                      # 8-byte Folded Spill
	sd	s10, 80(sp)                     # 8-byte Folded Spill
	sd	s11, 72(sp)                     # 8-byte Folded Spill
	addi	s0, sp, 176
	sd	a5, -176(s0)                    # 8-byte Folded Spill
	sd	a4, -112(s0)                    # 8-byte Folded Spill
	mv	s4, a3
	mv	s7, a2
	sd	a0, -152(s0)                    # 8-byte Folded Spill
	sext.w	s2, a2
	li	a0, 0
	call	_Z12get_local_idj
	mv	s3, a0
	li	a0, 1
	call	_Z12get_local_idj
	mv	s8, a0
	li	a0, 0
	call	_Z12get_group_idj
	slli	a0, a0, 2
	addw	a0, a0, s3
	sd	a0, -160(s0)                    # 8-byte Folded Spill
	li	a0, 1
	call	_Z12get_group_idj
	li	s1, 0
	slli	a0, a0, 2
	li	a1, 4
	add	a0, a0, s8
	sd	a0, -168(s0)                    # 8-byte Folded Spill
	blt	s2, a1, .LBB0_3
# %bb.1:
	li	s1, 0
	sext.w	a0, s8
	sext.w	a1, s3
	srliw	s8, s7, 2
	slli	a2, a0, 4
	lui	a3, %hi(myGEMM2.Asub)
	addi	s11, a3, %lo(myGEMM2.Asub)
	slli	a1, a1, 2
	add	s11, s11, a1
	add	a3, s11, a2
	sd	a3, -120(s0)                    # 8-byte Folded Spill
	ld	a3, -168(s0)                    # 8-byte Folded Reload
	mul	a3, a3, s7
	lui	a4, %hi(myGEMM2.Bsub)
	addi	s7, a4, %lo(myGEMM2.Bsub)
	add	s7, s7, a2
	add	a1, a1, s7
	sd	a1, -128(s0)                    # 8-byte Folded Spill
	lw	s9, -152(s0)                    # 8-byte Folded Reload
	addi	a1, s11, 16
	sd	a1, -136(s0)                    # 8-byte Folded Spill
	addi	a1, s7, 4
	sd	a1, -144(s0)                    # 8-byte Folded Spill
	addi	s10, s11, 32
	addi	s5, s7, 8
	addi	s6, s11, 48
	addw	s2, a3, s3
	mul	a0, s9, a0
	slli	a0, a0, 2
	ld	a1, -160(s0)                    # 8-byte Folded Reload
	slli	a1, a1, 2
	add	a0, a0, a1
	addi	s3, s7, 12
	add	s4, s4, a0
	slli	s9, s9, 4
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s4)
	ld	a1, -120(s0)                    # 8-byte Folded Reload
	sw	a0, 0(a1)
	slli	a0, s2, 2
	ld	a1, -112(s0)                    # 8-byte Folded Reload
	add	a0, a0, a1
	lw	a0, 0(a0)
	ld	a1, -128(s0)                    # 8-byte Folded Reload
	sw	a0, 0(a1)
	li	a0, 1
	call	_Z7barrierj
	lw	a0, 0(s11)
	lw	a1, 0(s7)
	call	__mulsf3
	mv	a1, s1
	call	__addsf3
	ld	a1, -136(s0)                    # 8-byte Folded Reload
	lw	a2, 0(a1)
	ld	a1, -144(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s1, a0
	mv	a0, a2
	call	__mulsf3
	mv	a1, s1
	call	__addsf3
	lw	a2, 0(s10)
	lw	a1, 0(s5)
	mv	s1, a0
	mv	a0, a2
	call	__mulsf3
	mv	a1, s1
	call	__addsf3
	lw	a2, 0(s6)
	lw	a1, 0(s3)
	mv	s1, a0
	mv	a0, a2
	call	__mulsf3
	mv	a1, s1
	call	__addsf3
	mv	s1, a0
	li	a0, 1
	call	_Z7barrierj
	addiw	s2, s2, 4
	addi	s8, s8, -1
	add	s4, s4, s9
	bnez	s8, .LBB0_2
.LBB0_3:
	ld	a0, -152(s0)                    # 8-byte Folded Reload
	ld	a1, -168(s0)                    # 8-byte Folded Reload
	mul	a0, a1, a0
	ld	a1, -160(s0)                    # 8-byte Folded Reload
	addw	a0, a0, a1
	slli	a0, a0, 2
	ld	a1, -176(s0)                    # 8-byte Folded Reload
	add	a0, a0, a1
	sw	s1, 0(a0)
	ld	ra, 168(sp)                     # 8-byte Folded Reload
	ld	s0, 160(sp)                     # 8-byte Folded Reload
	ld	s1, 152(sp)                     # 8-byte Folded Reload
	ld	s2, 144(sp)                     # 8-byte Folded Reload
	ld	s3, 136(sp)                     # 8-byte Folded Reload
	ld	s4, 128(sp)                     # 8-byte Folded Reload
	ld	s5, 120(sp)                     # 8-byte Folded Reload
	ld	s6, 112(sp)                     # 8-byte Folded Reload
	ld	s7, 104(sp)                     # 8-byte Folded Reload
	ld	s8, 96(sp)                      # 8-byte Folded Reload
	ld	s9, 88(sp)                      # 8-byte Folded Reload
	ld	s10, 80(sp)                     # 8-byte Folded Reload
	ld	s11, 72(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 176
	ret
.Lfunc_end0:
	.size	myGEMM2, .Lfunc_end0-myGEMM2
                                        # -- End function
	.option	pop
	.type	myGEMM2.Asub,@object            # @myGEMM2.Asub
	.local	myGEMM2.Asub
	.comm	myGEMM2.Asub,64,4
	.type	myGEMM2.Bsub,@object            # @myGEMM2.Bsub
	.local	myGEMM2.Bsub
	.comm	myGEMM2.Bsub,64,4
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
