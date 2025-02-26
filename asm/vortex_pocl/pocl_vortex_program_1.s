	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_zicond1p0_zicsr2p0"
	.file	"tempfile_megPZF.cl"
	.section	.text.myGEMM1,"ax",@progbits
	.globl	myGEMM1                         # -- Begin function myGEMM1
	.p2align	2
	.type	myGEMM1,@function
myGEMM1:                                # @myGEMM1
# %bb.0:                                # %entry
.Lpcrel_hi0:
	auipc	a1, %tls_ie_pcrel_hi(blockIdx)
	ld	a2, %pcrel_lo(.Lpcrel_hi0)(a1)
	lw	a1, 0(a0)
	add	a3, a2, tp
	lw	a4, 0(a3)
.Lpcrel_hi1:
	auipc	a2, %pcrel_hi(blockDim)
	addi	a6, a2, %pcrel_lo(.Lpcrel_hi1)
	lw	a7, 0(a6)
.Lpcrel_hi2:
	auipc	a2, %tls_ie_pcrel_hi(threadIdx)
	ld	t0, %pcrel_lo(.Lpcrel_hi2)(a2)
	lw	a5, 16(a0)
	ld	a2, 40(a0)
	mul	a4, a7, a4
	add	t0, t0, tp
	lw	a7, 0(t0)
.Lpcrel_hi3:
	auipc	t1, %pcrel_hi(g_global_offset)
	addi	t1, t1, %pcrel_lo(.Lpcrel_hi3)
	lw	t2, 0(t1)
	lw	t3, 4(a3)
	lw	a6, 4(a6)
	lw	t0, 4(t0)
	lw	t1, 4(t1)
	add	a3, a7, t2
	addw	a3, a3, a4
	mul	a4, a6, t3
	add	t0, t0, t1
	add	a4, t0, a4
	fmv.w.x	fa5, zero
	blez	a5, .LBB0_3
# %bb.1:                                # %for.body.lr.ph
	ld	a6, 24(a0)
	ld	t0, 32(a0)
	mulw	a7, a4, a5
	slli	a0, a3, 2
	add	a0, a6, a0
	slli	t1, a7, 2
	add	a6, t0, t1
	slli	a7, a1, 2
	slli	a5, a5, 2
	add	a5, t0, a5
	add	a5, a5, t1
	fmv.w.x	fa5, zero
	csrr	t0, tmask
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa4, 0(a0)
	flw	fa3, 0(a6)
	fmadd.s	fa5, fa4, fa3, fa5
	addi	a6, a6, 4
	add	a0, a0, a7
	xor	t1, a6, a5
	seqz	t1, t1
	vx_pred_n	t1, t0
	beqz	t1, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	mul	a0, a4, a1
	addw	a0, a0, a3
	slli	a0, a0, 2
	add	a0, a2, a0
	fsw	fa5, 0(a0)
	ret
.Lfunc_end0:
	.size	myGEMM1, .Lfunc_end0-myGEMM1
                                        # -- End function
	.section	.text.__vx_get_kernel_callback,"ax",@progbits
	.globl	__vx_get_kernel_callback        # -- Begin function __vx_get_kernel_callback
	.p2align	2
	.type	__vx_get_kernel_callback,@function
__vx_get_kernel_callback:               # @__vx_get_kernel_callback
# %bb.0:                                # %entry
	sext.w	a0, a0
.Lpcrel_hi4:
	auipc	a1, %pcrel_hi(myGEMM1)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi4)
	czero.nez	a0, a1, a0
	ret
.Lfunc_end1:
	.size	__vx_get_kernel_callback, .Lfunc_end1-__vx_get_kernel_callback
                                        # -- End function
	.ident	"clang version 18.1.7 (https://github.com/vortexgpgpu/llvm.git b115a172abc24683b2730b5b601f34e27fe19d93)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym myGEMM1
