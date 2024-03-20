	.file	"llsq.c"
	.text
	.globl	llsq
	.type	llsq, @function
llsq:
.LFB39:
	.cfi_startproc
	endbr64
	movl	%edi, %r9d
	cmpl	$1, %edi
	je	.L2
	testl	%edi, %edi
	jle	.L15
	movl	%edi, %edi
	movl	$0, %eax
	pxor	%xmm2, %xmm2
	movapd	%xmm2, %xmm3
.L6:
	addsd	(%rsi,%rax,8), %xmm3
	addsd	(%rdx,%rax,8), %xmm2
	addq	$1, %rax
	cmpq	%rdi, %rax
	jne	.L6
	pxor	%xmm4, %xmm4
	cvtsi2sdl	%r9d, %xmm4
	divsd	%xmm4, %xmm3
	divsd	%xmm4, %xmm2
	movl	$0, %eax
	pxor	%xmm4, %xmm4
	movapd	%xmm4, %xmm5
.L8:
	movsd	(%rsi,%rax,8), %xmm0
	subsd	%xmm3, %xmm0
	movsd	(%rdx,%rax,8), %xmm1
	subsd	%xmm2, %xmm1
	mulsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm4
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm5
	addq	$1, %rax
	cmpq	%rdi, %rax
	jne	.L8
.L9:
	divsd	%xmm5, %xmm4
	movsd	%xmm4, (%rcx)
	mulsd	%xmm3, %xmm4
	subsd	%xmm4, %xmm2
.L5:
	movsd	%xmm2, (%r8)
	ret
.L2:
	movq	$0x000000000, (%rcx)
	movsd	(%rdx), %xmm2
	jmp	.L5
.L15:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edi, %xmm0
	pxor	%xmm5, %xmm5
	movapd	%xmm5, %xmm3
	divsd	%xmm0, %xmm3
	movapd	%xmm3, %xmm2
	movapd	%xmm5, %xmm4
	jmp	.L9
	.cfi_endproc
.LFE39:
	.size	llsq, .-llsq
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d %B %Y %I:%M:%S %p"
	.text
	.globl	timestamp
	.type	timestamp, @function
timestamp:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time@PLT
	movq	%rax, (%rsp)
	movq	%rsp, %rdi
	call	localtime@PLT
	movq	%rax, %rcx
	leaq	.LC1(%rip), %rdx
	movl	$40, %esi
	leaq	time_buffer.0(%rip), %rbx
	movq	%rbx, %rdi
	call	strftime@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L19
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE40:
	.size	timestamp, .-timestamp
	.local	time_buffer.0
	.comm	time_buffer.0,40,32
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
