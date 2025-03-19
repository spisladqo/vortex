	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_zicond1p0_zicsr2p0"
	.file	"kernel_main.c"
	.section	.text.vx_local_alloc,"ax",@progbits
	.globl	vx_local_alloc                  # -- Begin function vx_local_alloc
	.p2align	2
	.type	vx_local_alloc,@function
vx_local_alloc:                         # @vx_local_alloc
	.cfi_startproc
# %bb.0:
.Lpcrel_hi0:
	auipc	a1, %tls_ie_pcrel_hi(__local_group_id)
	ld	a1, %pcrel_lo(.Lpcrel_hi0)(a1)
	#APP
	csrr	a2, nw
	#NO_APP
	add	a1, a1, tp
	lw	a1, 0(a1)
	mul	a0, a1, a0
	slli	a0, a0, 32
	srli	a0, a0, 32
	add	a0, a2, a0
	ret
.Lfunc_end0:
	.size	vx_local_alloc, .Lfunc_end0-vx_local_alloc
	.cfi_endproc
                                        # -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	#APP
	csrr	s1, mscratch
	#NO_APP
	lw	a0, 0(s1)
	li	a2, 0
	sgtz	a3, a0
.Lpcrel_hi1:
	auipc	a1, %pcrel_hi(g_work_dim)
	sw	a0, %pcrel_lo(.Lpcrel_hi1)(a1)
	vx_split_n	a1, a3
	beqz	a3, .LBB1_2
# %bb.1:
	lw	a2, 28(s1)
.LBB1_2:                                # %join_stub20
	vx_join	a1
	li	a3, 0
.Lpcrel_hi2:
	auipc	a1, %pcrel_hi(g_global_offset)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi2)
	sw	a2, 0(a1)
	slti	a2, a0, 2
	xori	a4, a2, 1
	vx_split_n	a2, a4
	beqz	a4, .LBB1_4
# %bb.3:
	lw	a3, 32(s1)
.LBB1_4:                                # %join_stub19
	vx_join	a2
	li	a2, 0
	sw	a3, 4(a1)
	slti	a0, a0, 3
	xori	a3, a0, 1
	vx_split_n	a0, a3
	beqz	a3, .LBB1_6
# %bb.5:
	lw	a2, 36(s1)
.LBB1_6:                                # %join_stub
	vx_join	a0
	lw	a0, 40(s1)
	sw	a2, 8(a1)
	addi	s0, s1, 48
	call	__vx_get_kernel_callback
	lw	a3, 0(s1)
	addi	a1, s1, 4
	addi	a2, s1, 16
	mv	a4, a0
	mv	a0, a3
	mv	a3, a4
	mv	a4, s0
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	tail	vx_spawn_threads
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	g_work_dim,@object              # @g_work_dim
	.section	.sbss,"aw",@nobits
	.globl	g_work_dim
	.p2align	2, 0x0
g_work_dim:
	.word	0                               # 0x0
	.size	g_work_dim, 4

	.type	g_global_offset,@object         # @g_global_offset
	.section	.bss.g_global_offset,"aw",@nobits
	.globl	g_global_offset
	.p2align	2, 0x0
g_global_offset:
	.zero	12
	.size	g_global_offset, 12

	.ident	"clang version 18.1.7 (https://github.com/vortexgpgpu/llvm.git b115a172abc24683b2730b5b601f34e27fe19d93)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
