	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_zicond1p0_zicsr2p0"
	.file	"tempfile_hD946A.cl"
	.section	.text.myGEMM3,"ax",@progbits
	.globl	myGEMM3                         # -- Begin function myGEMM3
	.p2align	2
	.type	myGEMM3,@function
myGEMM3:                                # @myGEMM3
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -320
	.cfi_def_cfa_offset 320
	sd	ra, 312(sp)                     # 8-byte Folded Spill
	sd	s0, 304(sp)                     # 8-byte Folded Spill
	sd	s1, 296(sp)                     # 8-byte Folded Spill
	sd	s2, 288(sp)                     # 8-byte Folded Spill
	sd	s3, 280(sp)                     # 8-byte Folded Spill
	sd	s4, 272(sp)                     # 8-byte Folded Spill
	sd	s5, 264(sp)                     # 8-byte Folded Spill
	sd	s6, 256(sp)                     # 8-byte Folded Spill
	sd	s7, 248(sp)                     # 8-byte Folded Spill
	sd	s8, 240(sp)                     # 8-byte Folded Spill
	sd	s9, 232(sp)                     # 8-byte Folded Spill
	sd	s10, 224(sp)                    # 8-byte Folded Spill
	sd	s11, 216(sp)                    # 8-byte Folded Spill
	fsd	fs0, 208(sp)                    # 8-byte Folded Spill
	fsd	fs1, 200(sp)                    # 8-byte Folded Spill
	fsd	fs2, 192(sp)                    # 8-byte Folded Spill
	fsd	fs3, 184(sp)                    # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	.cfi_offset s8, -80
	.cfi_offset s9, -88
	.cfi_offset s10, -96
	.cfi_offset s11, -104
	.cfi_offset fs0, -112
	.cfi_offset fs1, -120
	.cfi_offset fs2, -128
	.cfi_offset fs3, -136
	mv	s0, a0
	lw	s5, 0(a0)
	lw	s3, 16(a0)
	ld	s7, 24(a0)
	ld	s4, 32(a0)
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
	lwu	a3, 4(a2)
	lw	s10, 4(a1)
	lw	a2, 0(a2)
	lw	a1, 0(a1)
	slli	a3, a3, 2
	addw	a7, a3, s10
	slli	a2, a2, 34
	slli	a3, a1, 32
	add	a2, a2, a3
	srai	a2, a2, 32
	li	a3, 3
	slli	a6, a2, 2
	bge	a3, s3, .LBB0_4
# %bb.1:                                # %for.cond18.preheader.preheader
	sd	s2, 40(sp)                      # 8-byte Folded Spill
	lw	a2, 48(s0)
	lw	a3, 64(s0)
	li	t0, 0
	slli	a2, a2, 3
	add	a2, a0, a2
	slli	a3, a3, 3
	add	t4, a0, a3
	slli	a3, s10, 4
	add	t5, t4, a3
	addi	a4, t5, 12
	sd	a4, 176(sp)                     # 8-byte Folded Spill
	slli	a1, a1, 2
	add	s2, a2, a1
	add	a3, s2, a3
	sd	a3, 168(sp)                     # 8-byte Folded Spill
	add	a2, t5, a1
	sd	a2, 160(sp)                     # 8-byte Folded Spill
	addi	a2, s10, 1
	slli	a3, a2, 4
	add	a4, s2, a3
	sd	a4, 152(sp)                     # 8-byte Folded Spill
	addi	t1, a7, 1
	add	a0, t4, a3
	add	a3, a0, a1
	sd	a3, 144(sp)                     # 8-byte Folded Spill
	addi	a3, s10, 2
	slli	a4, a3, 4
	add	a5, s2, a4
	sd	a5, 136(sp)                     # 8-byte Folded Spill
	addi	t2, a7, 2
	add	s1, t4, a4
	add	a4, s1, a1
	sd	a4, 128(sp)                     # 8-byte Folded Spill
	addi	a4, s10, 3
	slli	a5, a4, 4
	addi	t3, a7, 3
	mul	a4, a4, s5
	slli	a4, a4, 2
	add	a4, a4, a6
	add	s6, s7, a4
	mul	a3, a3, s5
	slli	a3, a3, 2
	add	a3, a3, a6
	add	s8, s7, a3
	mul	a2, a2, s5
	slli	a2, a2, 2
	add	a2, a2, a6
	add	s9, s7, a2
	mul	a2, s5, s10
	slli	a2, a2, 2
	add	a2, s7, a2
	sd	t3, 0(sp)                       # 8-byte Folded Spill
	mul	a3, t3, s3
	slli	a3, a3, 2
	add	a4, s4, a1
	add	a3, a4, a3
	sd	a3, 120(sp)                     # 8-byte Folded Spill
	sd	t2, 8(sp)                       # 8-byte Folded Spill
	mul	a3, t2, s3
	slli	a3, a3, 2
	add	s10, s4, a1
	add	a3, s10, a3
	sd	a3, 112(sp)                     # 8-byte Folded Spill
	sd	t1, 16(sp)                      # 8-byte Folded Spill
	mul	a3, t1, s3
	slli	a3, a3, 2
	add	s11, s4, a1
	add	a3, s11, a3
	sd	a3, 104(sp)                     # 8-byte Folded Spill
	sd	a7, 24(sp)                      # 8-byte Folded Spill
	mul	a3, a7, s3
	slli	a3, a3, 2
	add	s4, s4, a1
	add	a3, s4, a3
	sd	a3, 96(sp)                      # 8-byte Folded Spill
.Lpcrel_hi2:
	auipc	a3, %tls_ie_pcrel_hi(__local_group_id)
	ld	a4, %pcrel_lo(.Lpcrel_hi2)(a3)
	add	a3, t4, a5
	add	a5, s2, a5
	sd	a5, 88(sp)                      # 8-byte Folded Spill
	add	a1, a3, a1
	sd	a1, 80(sp)                      # 8-byte Folded Spill
	add	a4, a4, tp
	srliw	s3, s3, 2
	slli	s3, s3, 4
	sd	s3, 72(sp)                      # 8-byte Folded Spill
	fmv.w.x	fa5, zero
	sd	a6, 32(sp)                      # 8-byte Folded Spill
	add	a1, a2, a6
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	addi	a2, s2, 16
	sd	a2, 64(sp)                      # 8-byte Folded Spill
	addi	a2, t5, 4
	sd	a2, 56(sp)                      # 8-byte Folded Spill
	addi	t4, a0, 4
	addi	s0, s1, 4
	addi	t6, a3, 4
	addi	t2, s2, 32
	mv	s10, t5
	addi	a7, t5, 8
	addi	t5, a0, 8
	mv	a2, s5
	addi	s5, s1, 8
	addi	ra, a3, 8
	mv	s7, s2
	addi	t3, s2, 48
	mv	s3, a0
	addi	s2, a0, 12
	mv	a0, a2
	mv	t1, s1
	addi	s1, s1, 12
	addi	a2, a3, 12
	sd	a0, 48(sp)                      # 8-byte Folded Spill
	slli	a0, a0, 4
.LBB0_2:                                # %for.cond18.preheader
                                        # =>This Inner Loop Header: Depth=1
	flw	fa1, 0(a1)
	ld	a5, 168(sp)                     # 8-byte Folded Reload
	fsw	fa1, 0(a5)
	ld	a5, 96(sp)                      # 8-byte Folded Reload
	add	a5, a5, t0
	flw	fa1, 0(a5)
	ld	a5, 160(sp)                     # 8-byte Folded Reload
	fsw	fa1, 0(a5)
	flw	fa1, 0(s9)
	ld	a5, 152(sp)                     # 8-byte Folded Reload
	fsw	fa1, 0(a5)
	ld	a5, 104(sp)                     # 8-byte Folded Reload
	add	a5, a5, t0
	flw	fa1, 0(a5)
	ld	a5, 144(sp)                     # 8-byte Folded Reload
	fsw	fa1, 0(a5)
	flw	fa1, 0(s8)
	ld	a5, 136(sp)                     # 8-byte Folded Reload
	fsw	fa1, 0(a5)
	ld	a5, 112(sp)                     # 8-byte Folded Reload
	add	a5, a5, t0
	flw	fa1, 0(a5)
	ld	a5, 128(sp)                     # 8-byte Folded Reload
	fsw	fa1, 0(a5)
	flw	fa1, 0(s6)
	ld	a5, 88(sp)                      # 8-byte Folded Reload
	fsw	fa1, 0(a5)
	ld	a5, 120(sp)                     # 8-byte Folded Reload
	add	a5, a5, t0
	flw	fa1, 0(a5)
.Lpcrel_hi3:
	auipc	a5, %pcrel_hi(__warps_per_group)
	lw	s11, %pcrel_lo(.Lpcrel_hi3)(a5)
	lw	s4, 0(a4)
	ld	a6, 80(sp)                      # 8-byte Folded Reload
	fsw	fa1, 0(a6)
	#APP
	.insn r 11, 4, 0, zero, s4, s11
	#NO_APP
	flw	fa1, 0(s7)
	flw	fa0, 0(s10)
	flw	ft0, 0(s3)
	flw	ft1, 0(t1)
	flw	ft2, 0(a3)
	ld	a6, 64(sp)                      # 8-byte Folded Reload
	flw	ft3, 0(a6)
	ld	a6, 56(sp)                      # 8-byte Folded Reload
	flw	ft4, 0(a6)
	flw	ft5, 0(t4)
	flw	ft6, 0(s0)
	flw	ft7, 0(t6)
	flw	fa6, 0(t2)
	flw	fa7, 0(a7)
	flw	ft8, 0(t5)
	flw	ft9, 0(s5)
	flw	ft10, 0(ra)
	flw	ft11, 0(t3)
	ld	s4, 176(sp)                     # 8-byte Folded Reload
	flw	fs0, 0(s4)
	lw	a5, %pcrel_lo(.Lpcrel_hi3)(a5)
	lw	s4, 0(a4)
	flw	fs1, 0(s2)
	flw	fs2, 0(s1)
	flw	fs3, 0(a2)
	#APP
	.insn r 11, 4, 0, zero, s4, a5
	#NO_APP
	fmadd.s	fa2, fa1, fa0, fa2
	fmadd.s	fa3, fa1, ft0, fa3
	fmadd.s	fa4, fa1, ft1, fa4
	fmadd.s	fa5, fa1, ft2, fa5
	fmadd.s	fa2, ft3, ft4, fa2
	fmadd.s	fa3, ft3, ft5, fa3
	fmadd.s	fa4, ft3, ft6, fa4
	fmadd.s	fa5, ft3, ft7, fa5
	fmadd.s	fa2, fa6, fa7, fa2
	fmadd.s	fa3, fa6, ft8, fa3
	fmadd.s	fa4, fa6, ft9, fa4
	fmadd.s	fa5, fa6, ft10, fa5
	fmadd.s	fa2, ft11, fs0, fa2
	fmadd.s	fa3, ft11, fs1, fa3
	fmadd.s	fa4, ft11, fs2, fa4
	fmadd.s	fa5, ft11, fs3, fa5
	addi	t0, t0, 16
	add	s6, s6, a0
	add	s8, s8, a0
	add	s9, s9, a0
	add	a1, a1, a0
	ld	a5, 72(sp)                      # 8-byte Folded Reload
	bne	a5, t0, .LBB0_2
# %bb.3:                                # %for.cond88.preheader.loopexit
	ld	s5, 48(sp)                      # 8-byte Folded Reload
	ld	s2, 40(sp)                      # 8-byte Folded Reload
	ld	a6, 32(sp)                      # 8-byte Folded Reload
	ld	a7, 24(sp)                      # 8-byte Folded Reload
	ld	a2, 16(sp)                      # 8-byte Folded Reload
	ld	a3, 8(sp)                       # 8-byte Folded Reload
	ld	a4, 0(sp)                       # 8-byte Folded Reload
	j	.LBB0_5
.LBB0_4:                                # %entry.for.cond88.preheader_crit_edge
	addi	a2, a7, 1
	addi	a3, a7, 2
	fmv.w.x	fa5, zero
	addi	a4, a7, 3
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
.LBB0_5:                                # %for.cond88.preheader
	mul	a0, a7, s5
	slli	a0, a0, 2
	add	a1, s2, a6
	add	a0, a1, a0
	fsw	fa2, 0(a0)
	mul	a0, a2, s5
	slli	a0, a0, 2
	add	a1, s2, a6
	add	a0, a1, a0
	fsw	fa3, 0(a0)
	mul	a0, a3, s5
	slli	a0, a0, 2
	add	a1, s2, a6
	add	a0, a1, a0
	fsw	fa4, 0(a0)
	mul	a0, a4, s5
	slli	a0, a0, 2
	add	a1, s2, a6
	add	a0, a1, a0
	fsw	fa5, 0(a0)
	ld	ra, 312(sp)                     # 8-byte Folded Reload
	ld	s0, 304(sp)                     # 8-byte Folded Reload
	ld	s1, 296(sp)                     # 8-byte Folded Reload
	ld	s2, 288(sp)                     # 8-byte Folded Reload
	ld	s3, 280(sp)                     # 8-byte Folded Reload
	ld	s4, 272(sp)                     # 8-byte Folded Reload
	ld	s5, 264(sp)                     # 8-byte Folded Reload
	ld	s6, 256(sp)                     # 8-byte Folded Reload
	ld	s7, 248(sp)                     # 8-byte Folded Reload
	ld	s8, 240(sp)                     # 8-byte Folded Reload
	ld	s9, 232(sp)                     # 8-byte Folded Reload
	ld	s10, 224(sp)                    # 8-byte Folded Reload
	ld	s11, 216(sp)                    # 8-byte Folded Reload
	fld	fs0, 208(sp)                    # 8-byte Folded Reload
	fld	fs1, 200(sp)                    # 8-byte Folded Reload
	fld	fs2, 192(sp)                    # 8-byte Folded Reload
	fld	fs3, 184(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 320
	ret
.Lfunc_end0:
	.size	myGEMM3, .Lfunc_end0-myGEMM3
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
	auipc	a1, %pcrel_hi(myGEMM3)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi4)
	czero.nez	a0, a1, a0
	ret
.Lfunc_end1:
	.size	__vx_get_kernel_callback, .Lfunc_end1-__vx_get_kernel_callback
                                        # -- End function
	.ident	"clang version 18.1.7 (https://github.com/vortexgpgpu/llvm.git b115a172abc24683b2730b5b601f34e27fe19d93)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym myGEMM3
