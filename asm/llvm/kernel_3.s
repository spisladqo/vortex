	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1"
	.file	"kernel.cl"
	.option	push
	.option	arch, +a, +c, +m
	.globl	myGEMM3                         # -- Begin function myGEMM3
	.p2align	1
	.type	myGEMM3,@function
myGEMM3:                                # @myGEMM3
# %bb.0:
	addi	sp, sp, -432
	sd	ra, 424(sp)                     # 8-byte Folded Spill
	sd	s0, 416(sp)                     # 8-byte Folded Spill
	sd	s1, 408(sp)                     # 8-byte Folded Spill
	sd	s2, 400(sp)                     # 8-byte Folded Spill
	sd	s3, 392(sp)                     # 8-byte Folded Spill
	sd	s4, 384(sp)                     # 8-byte Folded Spill
	sd	s5, 376(sp)                     # 8-byte Folded Spill
	sd	s6, 368(sp)                     # 8-byte Folded Spill
	sd	s7, 360(sp)                     # 8-byte Folded Spill
	sd	s8, 352(sp)                     # 8-byte Folded Spill
	sd	s9, 344(sp)                     # 8-byte Folded Spill
	sd	s10, 336(sp)                    # 8-byte Folded Spill
	sd	s11, 328(sp)                    # 8-byte Folded Spill
	addi	s0, sp, 432
	mv	s1, a5
	mv	s8, a4
	mv	s7, a3
	mv	s2, a2
	sd	a0, -112(s0)                    # 8-byte Folded Spill
	sext.w	s9, a2
	li	a0, 0
	call	_Z12get_local_idj
	mv	s10, a0
	li	a0, 1
	call	_Z12get_local_idj
	mv	s11, a0
	li	a0, 0
	call	_Z12get_group_idj
	slli	a0, a0, 2
	addw	s6, a0, s10
	li	a0, 1
	call	_Z12get_group_idj
	slli	a0, a0, 2
	li	a1, 3
	addw	t3, a0, s11
	bge	a1, s9, .LBB0_4
# %bb.1:
	sd	s1, -376(s0)                    # 8-byte Folded Spill
	mv	t2, s6
	li	s6, 0
	mv	t5, s2
	li	s2, 0
	li	s5, 0
	li	s4, 0
	li	s3, 0
	sext.w	a0, s10
	lw	s1, -112(s0)                    # 8-byte Folded Reload
	sext.w	a1, s11
	lui	a2, %hi(myGEMM3.Bsub)
	addi	t4, a2, %lo(myGEMM3.Bsub)
	slli	t0, a1, 4
	slli	a3, a0, 2
	addi	t1, a1, 1
	addi	a2, t3, 1
	addi	a7, a1, 2
	addi	a4, t3, 2
	addi	a6, a1, 3
	addi	a0, t3, 3
	sd	a0, -408(s0)                    # 8-byte Folded Spill
	mul	a5, a0, s9
	slli	a5, a5, 2
	add	a0, s8, a3
	add	a0, a0, a5
	sd	a0, -112(s0)                    # 8-byte Folded Spill
	sd	a4, -416(s0)                    # 8-byte Folded Spill
	mul	a0, a4, s9
	slli	a0, a0, 2
	add	a5, s8, a3
	add	a0, a0, a5
	sd	a0, -120(s0)                    # 8-byte Folded Spill
	sd	a2, -424(s0)                    # 8-byte Folded Spill
	mul	a0, a2, s9
	slli	a0, a0, 2
	add	a5, s8, a3
	add	a0, a0, a5
	sd	a0, -128(s0)                    # 8-byte Folded Spill
	sd	t3, -392(s0)                    # 8-byte Folded Spill
	mul	a0, t3, s9
	slli	a0, a0, 2
	add	s8, s8, a3
	add	a0, a0, s8
	sd	a0, -136(s0)                    # 8-byte Folded Spill
	mul	a0, t1, s1
	slli	a0, a0, 2
	sd	t2, -384(s0)                    # 8-byte Folded Spill
	slli	a5, t2, 2
	add	s9, s7, a5
	add	s9, s9, a0
	mul	a0, a7, s1
	slli	a0, a0, 2
	add	s11, s7, a5
	add	s11, s11, a0
	mul	a0, a6, s1
	slli	a0, a0, 2
	add	s10, s7, a5
	add	s10, s10, a0
	add	a2, t4, t0
	mul	a0, s1, a1
	slli	a0, a0, 2
	add	a0, a0, a5
	lui	a1, %hi(myGEMM3.Asub)
	addi	a1, a1, %lo(myGEMM3.Asub)
	add	a1, a1, a3
	add	t0, t0, a1
	sd	t0, -160(s0)                    # 8-byte Folded Spill
	slli	a4, t1, 4
	add	s7, s7, a0
	add	a0, a1, a4
	sd	a0, -168(s0)                    # 8-byte Folded Spill
	add	a4, a4, t4
	slli	a7, a7, 4
	add	a0, a1, a7
	sd	a0, -184(s0)                    # 8-byte Folded Spill
	add	a7, a7, t4
	slli	a6, a6, 4
	add	t4, t4, a6
	add	a6, a6, a1
	sd	a6, -208(s0)                    # 8-byte Folded Spill
	add	a0, a2, a3
	sd	a0, -216(s0)                    # 8-byte Folded Spill
	add	a0, a4, a3
	sd	a0, -224(s0)                    # 8-byte Folded Spill
	add	a0, a7, a3
	sd	a0, -232(s0)                    # 8-byte Folded Spill
	add	a3, a3, t4
	sd	a3, -240(s0)                    # 8-byte Folded Spill
	srliw	a0, t5, 2
	slli	a0, a0, 4
	sd	a0, -248(s0)                    # 8-byte Folded Spill
	addi	a0, a2, 12
	sd	a0, -256(s0)                    # 8-byte Folded Spill
	addi	a0, a1, 16
	sd	a0, -264(s0)                    # 8-byte Folded Spill
	addi	a0, a2, 4
	sd	a0, -272(s0)                    # 8-byte Folded Spill
	addi	a0, a4, 4
	sd	a0, -280(s0)                    # 8-byte Folded Spill
	addi	a0, a7, 4
	sd	a0, -288(s0)                    # 8-byte Folded Spill
	addi	a0, t4, 4
	sd	a0, -296(s0)                    # 8-byte Folded Spill
	addi	a0, a1, 32
	sd	a0, -304(s0)                    # 8-byte Folded Spill
	sd	a2, -144(s0)                    # 8-byte Folded Spill
	addi	a2, a2, 8
	sd	a2, -312(s0)                    # 8-byte Folded Spill
	addi	a0, a4, 8
	sd	a0, -320(s0)                    # 8-byte Folded Spill
	addi	a0, a7, 8
	sd	a0, -328(s0)                    # 8-byte Folded Spill
	addi	a0, t4, 8
	sd	a0, -336(s0)                    # 8-byte Folded Spill
	sd	a1, -152(s0)                    # 8-byte Folded Spill
	addi	a0, a1, 48
	sd	a0, -344(s0)                    # 8-byte Folded Spill
	sd	a4, -176(s0)                    # 8-byte Folded Spill
	addi	a4, a4, 12
	sd	a4, -352(s0)                    # 8-byte Folded Spill
	sd	a7, -192(s0)                    # 8-byte Folded Spill
	addi	a7, a7, 12
	sd	a7, -360(s0)                    # 8-byte Folded Spill
	sd	t4, -200(s0)                    # 8-byte Folded Spill
	addi	t4, t4, 12
	sd	t4, -368(s0)                    # 8-byte Folded Spill
	sd	s1, -400(s0)                    # 8-byte Folded Spill
	slli	s8, s1, 4
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s7)
	ld	a1, -160(s0)                    # 8-byte Folded Reload
	sw	a0, 0(a1)
	ld	a0, -136(s0)                    # 8-byte Folded Reload
	add	a0, a0, s6
	lw	a0, 0(a0)
	ld	a1, -216(s0)                    # 8-byte Folded Reload
	sw	a0, 0(a1)
	lw	a0, 0(s9)
	ld	a1, -168(s0)                    # 8-byte Folded Reload
	sw	a0, 0(a1)
	ld	a0, -128(s0)                    # 8-byte Folded Reload
	add	a0, a0, s6
	lw	a0, 0(a0)
	ld	a1, -224(s0)                    # 8-byte Folded Reload
	sw	a0, 0(a1)
	lw	a0, 0(s11)
	ld	a1, -184(s0)                    # 8-byte Folded Reload
	sw	a0, 0(a1)
	ld	a0, -120(s0)                    # 8-byte Folded Reload
	add	a0, a0, s6
	lw	a0, 0(a0)
	ld	a1, -232(s0)                    # 8-byte Folded Reload
	sw	a0, 0(a1)
	lw	a0, 0(s10)
	ld	a1, -208(s0)                    # 8-byte Folded Reload
	sw	a0, 0(a1)
	ld	a0, -112(s0)                    # 8-byte Folded Reload
	add	a0, a0, s6
	lw	a0, 0(a0)
	ld	a1, -240(s0)                    # 8-byte Folded Reload
	sw	a0, 0(a1)
	li	a0, 1
	call	_Z7barrierj
	ld	a0, -152(s0)                    # 8-byte Folded Reload
	lw	s1, 0(a0)
	ld	a0, -144(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a0)
	mv	a0, s1
	call	__mulsf3
	mv	a1, s2
	call	__addsf3
	ld	a1, -176(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s2, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s5
	call	__addsf3
	ld	a1, -192(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s5, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s4
	call	__addsf3
	ld	a1, -200(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s4, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s3
	call	__addsf3
	ld	a1, -264(s0)                    # 8-byte Folded Reload
	lw	s1, 0(a1)
	ld	a1, -272(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s3, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s2
	call	__addsf3
	ld	a1, -280(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s2, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s5
	call	__addsf3
	ld	a1, -288(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s5, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s4
	call	__addsf3
	ld	a1, -296(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s4, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s3
	call	__addsf3
	ld	a1, -304(s0)                    # 8-byte Folded Reload
	lw	s1, 0(a1)
	ld	a1, -312(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s3, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s2
	call	__addsf3
	ld	a1, -320(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s2, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s5
	call	__addsf3
	ld	a1, -328(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s5, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s4
	call	__addsf3
	ld	a1, -336(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s4, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s3
	call	__addsf3
	ld	a1, -344(s0)                    # 8-byte Folded Reload
	lw	s1, 0(a1)
	ld	a1, -256(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s3, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s2
	call	__addsf3
	ld	a1, -352(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s2, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s5
	call	__addsf3
	ld	a1, -360(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s5, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s4
	call	__addsf3
	ld	a1, -368(s0)                    # 8-byte Folded Reload
	lw	a1, 0(a1)
	mv	s4, a0
	mv	a0, s1
	call	__mulsf3
	mv	a1, s3
	call	__addsf3
	mv	s3, a0
	li	a0, 1
	call	_Z7barrierj
	addi	s6, s6, 16
	add	s9, s9, s8
	add	s11, s11, s8
	add	s10, s10, s8
	add	s7, s7, s8
	ld	a0, -248(s0)                    # 8-byte Folded Reload
	bne	a0, s6, .LBB0_2
# %bb.3:
	ld	s1, -376(s0)                    # 8-byte Folded Reload
	ld	s6, -384(s0)                    # 8-byte Folded Reload
	ld	t3, -392(s0)                    # 8-byte Folded Reload
	ld	a3, -400(s0)                    # 8-byte Folded Reload
	ld	a6, -408(s0)                    # 8-byte Folded Reload
	ld	a4, -416(s0)                    # 8-byte Folded Reload
	ld	a5, -424(s0)                    # 8-byte Folded Reload
	j	.LBB0_5
.LBB0_4:
	li	s2, 0
	li	s5, 0
	li	s4, 0
	li	s3, 0
	lw	a3, -112(s0)                    # 8-byte Folded Reload
	addi	a5, t3, 1
	addi	a4, t3, 2
	addi	a6, t3, 3
.LBB0_5:
	mul	a0, t3, a3
	slli	a0, a0, 2
	slli	a1, s6, 2
	add	a2, s1, a1
	add	a0, a0, a2
	sw	s2, 0(a0)
	mul	a0, a5, a3
	slli	a0, a0, 2
	add	a2, s1, a1
	add	a0, a0, a2
	sw	s5, 0(a0)
	mul	a0, a4, a3
	slli	a0, a0, 2
	add	a2, s1, a1
	add	a0, a0, a2
	sw	s4, 0(a0)
	mul	a0, a6, a3
	slli	a0, a0, 2
	add	a1, a1, s1
	add	a0, a0, a1
	sw	s3, 0(a0)
	ld	ra, 424(sp)                     # 8-byte Folded Reload
	ld	s0, 416(sp)                     # 8-byte Folded Reload
	ld	s1, 408(sp)                     # 8-byte Folded Reload
	ld	s2, 400(sp)                     # 8-byte Folded Reload
	ld	s3, 392(sp)                     # 8-byte Folded Reload
	ld	s4, 384(sp)                     # 8-byte Folded Reload
	ld	s5, 376(sp)                     # 8-byte Folded Reload
	ld	s6, 368(sp)                     # 8-byte Folded Reload
	ld	s7, 360(sp)                     # 8-byte Folded Reload
	ld	s8, 352(sp)                     # 8-byte Folded Reload
	ld	s9, 344(sp)                     # 8-byte Folded Reload
	ld	s10, 336(sp)                    # 8-byte Folded Reload
	ld	s11, 328(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 432
	ret
.Lfunc_end0:
	.size	myGEMM3, .Lfunc_end0-myGEMM3
                                        # -- End function
	.option	pop
	.type	myGEMM3.Asub,@object            # @myGEMM3.Asub
	.local	myGEMM3.Asub
	.comm	myGEMM3.Asub,64,4
	.type	myGEMM3.Bsub,@object            # @myGEMM3.Bsub
	.local	myGEMM3.Bsub
	.comm	myGEMM3.Bsub,64,4
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
