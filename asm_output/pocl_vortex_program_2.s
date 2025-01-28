	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_zicond1p0_zicsr2p0"
	.file	"tempfile_v9atv1.cl"
	.section	.text.myGEMM2,"ax",@progbits
	.globl	myGEMM2                         # -- Begin function myGEMM2
	.p2align	2
	.type	myGEMM2,@function
myGEMM2:                                # @myGEMM2
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sd	ra, 72(sp)                      # 8-byte Folded Spill
	sd	s0, 64(sp)                      # 8-byte Folded Spill
	sd	s1, 56(sp)                      # 8-byte Folded Spill
	sd	s2, 48(sp)                      # 8-byte Folded Spill
	sd	s3, 40(sp)                      # 8-byte Folded Spill
	sd	s4, 32(sp)                      # 8-byte Folded Spill
	sd	s5, 24(sp)                      # 8-byte Folded Spill
	sd	s6, 16(sp)                      # 8-byte Folded Spill
	sd	s7, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	mv	s0, a0
	lw	s1, 0(a0)
	lw	s5, 16(a0)
	ld	s4, 24(a0)
	ld	s3, 32(a0)
	ld	s2, 40(a0)
	lw	a0, 48(a0)
	call	vx_local_alloc
.Lpcrel_hi0:
	auipc	a1, %tls_ie_pcrel_hi(threadIdx)
	ld	a1, %pcrel_lo(.Lpcrel_hi0)(a1)
.Lpcrel_hi1:
	auipc	a2, %tls_ie_pcrel_hi(blockIdx)
	ld	a2, %pcrel_lo(.Lpcrel_hi1)(a2)
	add	a1, a1, tp
	add	a2, a2, tp
	lwu	a3, 0(a2)
	lw	t6, 0(a1)
	lw	a2, 4(a2)
	lw	s6, 4(a1)
	slli	a3, a3, 2
	addw	a1, a3, t6
	slli	a2, a2, 2
	add	a2, a2, s6
	li	a3, 4
	fmv.w.x	fa5, zero
	blt	s5, a3, .LBB0_3
# %bb.1:                                # %for.body.lr.ph
	lw	a3, 48(s0)
	lw	a4, 64(s0)
	slli	a3, a3, 3
	add	a3, a0, a3
	slli	a4, a4, 3
	add	a5, a0, a4
	srliw	a0, s5, 2
	slli	a6, s6, 4
	slli	a7, t6, 2
	add	a3, a3, a7
	add	a4, a3, a6
	mul	s0, a2, s5
	add	a5, a5, a6
	add	a6, a5, a7
	addi	a7, a3, 16
	addi	t0, a5, 4
	addi	t1, a3, 32
.Lpcrel_hi2:
	auipc	t2, %tls_ie_pcrel_hi(__local_group_id)
	ld	t5, %pcrel_lo(.Lpcrel_hi2)(t2)
	addi	t2, a5, 8
	addi	t3, a3, 48
	addi	t4, a5, 12
	add	t5, t5, tp
	addw	t6, t6, s0
	mul	s0, s1, s6
	slli	s0, s0, 2
	slli	s5, a1, 2
	add	s0, s4, s0
	add	s0, s0, s5
	slli	s4, s1, 4
	fmv.w.x	fa5, zero
.Lpcrel_hi3:
	auipc	s5, %pcrel_hi(__warps_per_group)
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa4, 0(s0)
	fsw	fa4, 0(a4)
	slli	s6, t6, 2
	add	s6, s3, s6
	flw	fa4, 0(s6)
	lw	s6, %pcrel_lo(.Lpcrel_hi3)(s5)
	lw	s7, 0(t5)
	fsw	fa4, 0(a6)
	#APP
	.insn r 11, 4, 0, zero, s7, s6
	#NO_APP
	flw	fa4, 0(a3)
	flw	fa3, 0(a5)
	fmadd.s	fa5, fa4, fa3, fa5
	flw	fa4, 0(a7)
	flw	fa3, 0(t0)
	flw	fa2, 0(t1)
	flw	fa1, 0(t2)
	flw	fa0, 0(t3)
	flw	ft0, 0(t4)
	lw	s6, %pcrel_lo(.Lpcrel_hi3)(s5)
	lw	s7, 0(t5)
	fmadd.s	fa5, fa4, fa3, fa5
	fmadd.s	fa5, fa2, fa1, fa5
	fmadd.s	fa5, fa0, ft0, fa5
	#APP
	.insn r 11, 4, 0, zero, s7, s6
	#NO_APP
	addi	a0, a0, -1
	addiw	t6, t6, 4
	add	s0, s0, s4
	bnez	a0, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	mul	a0, a2, s1
	addw	a0, a0, a1
	slli	a0, a0, 2
	add	a0, s2, a0
	fsw	fa5, 0(a0)
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80f
	ret
.Lfunc_end0:
	.size	myGEMM2, .Lfunc_end0-myGEMM2
	.cfi_endproc
                                        # -- End function
	.section	.text.__vx_get_kernel_callback,"ax",@progbits
	.globl	__vx_get_kernel_callback        # -- Begin function __vx_get_kernel_callback
	.p2align	2
	.type	__vx_get_kernel_callback,@function
__vx_get_kernel_callback:               # @__vx_get_kernel_callback
# %bb.0:                                # %entry
	sext.w	a0, a0
.Lpcrel_hi4:
	auipc	a1, %pcrel_hi(myGEMM2)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi4)
	czero.nez	a0, a1, a0
	ret
.Lfunc_end1:
	.size	__vx_get_kernel_callback, .Lfunc_end1-__vx_get_kernel_callback
                                        # -- End function
	.ident	"clang version 18.1.7 (https://github.com/vortexgpgpu/llvm.git b115a172abc24683b2730b5b601f34e27fe19d93)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym myGEMM2
