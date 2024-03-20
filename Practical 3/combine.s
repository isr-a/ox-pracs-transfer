	.file	"combine.c"
	.text
	.globl	combine4
	.type	combine4, @function
combine4:
.LFB46:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rcx
	movq	8(%rdi), %rdi
	testq	%rcx, %rcx
	jle	.L4
	movl	$0, %edx
	movl	$0, %eax
.L3:
	addq	(%rdi,%rax,8), %rdx
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L3
.L2:
	movq	%rdx, (%rsi)
	ret
.L4:
	movl	$0, %edx
	jmp	.L2
	.cfi_endproc
.LFE46:
	.size	combine4, .-combine4
	.globl	new_vec
	.type	new_vec, @function
new_vec:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbp
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L6
	movq	%rbp, (%rax)
	movl	$0, %r12d
	testq	%rbp, %rbp
	jg	.L11
.L8:
	movq	%r12, 8(%rbx)
.L6:
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	movl	$8, %esi
	movq	%rbp, %rdi
	call	calloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L8
	movq	%rbx, %rdi
	call	free@PLT
	movq	%r12, %rbx
	jmp	.L6
	.cfi_endproc
.LFE39:
	.size	new_vec, .-new_vec
	.globl	get_vec_element
	.type	get_vec_element, @function
get_vec_element:
.LFB40:
	.cfi_startproc
	endbr64
	movl	$0, %eax
	testq	%rsi, %rsi
	js	.L12
	cmpq	%rsi, (%rdi)
	jle	.L12
	movq	8(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	movq	%rax, (%rdx)
	movl	$1, %eax
.L12:
	ret
	.cfi_endproc
.LFE40:
	.size	get_vec_element, .-get_vec_element
	.globl	get_vec_start
	.type	get_vec_start, @function
get_vec_start:
.LFB41:
	.cfi_startproc
	endbr64
	movq	8(%rdi), %rax
	ret
	.cfi_endproc
.LFE41:
	.size	get_vec_start, .-get_vec_start
	.globl	vec_length
	.type	vec_length, @function
vec_length:
.LFB42:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	ret
	.cfi_endproc
.LFE42:
	.size	vec_length, .-vec_length
	.globl	combine1
	.type	combine1, @function
combine1:
.LFB43:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	$0, (%rsi)
	cmpq	$0, (%rdi)
	jle	.L18
	movq	%rdi, %rbp
	movq	%rsi, %r12
	movl	$0, %ebx
	movq	%rsp, %r13
.L20:
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	get_vec_element
	movq	(%rsp), %rax
	addq	%rax, (%r12)
	addq	$1, %rbx
	cmpq	0(%rbp), %rbx
	jl	.L20
.L18:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L24
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE43:
	.size	combine1, .-combine1
	.globl	combine2
	.type	combine2, @function
combine2:
.LFB44:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	$0, (%rsi)
	movq	(%rdi), %r13
	testq	%r13, %r13
	jle	.L25
	movq	%rdi, %r12
	movq	%rsi, %rbp
	movl	$0, %ebx
	movq	%rsp, %r14
.L27:
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	get_vec_element
	movq	(%rsp), %rax
	addq	%rax, 0(%rbp)
	addq	$1, %rbx
	cmpq	%r13, %rbx
	jne	.L27
.L25:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L31
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L31:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE44:
	.size	combine2, .-combine2
	.globl	combine3
	.type	combine3, @function
combine3:
.LFB45:
	.cfi_startproc
	endbr64
	movq	$0, (%rsi)
	movq	(%rdi), %rcx
	movq	8(%rdi), %rdi
	testq	%rcx, %rcx
	jle	.L32
	movl	$0, %eax
.L34:
	movq	(%rdi,%rax,8), %rdx
	addq	%rdx, (%rsi)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L34
.L32:
	ret
	.cfi_endproc
.LFE45:
	.size	combine3, .-combine3
	.globl	fcyc
	.type	fcyc, @function
fcyc:
.LFB47:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdi, %r13
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdi
	movl	$0, %esi
	call	gettimeofday@PLT
	movl	$1000000, %ebx
.L37:
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	*%r13
	subl	$1, %ebx
	jne	.L37
	leaq	16(%rsp), %rdi
	movl	$0, %esi
	call	gettimeofday@PLT
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm2
	addsd	%xmm2, %xmm0
	mulsd	.LC1(%rip), %xmm0
	divsd	%xmm1, %xmm0
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L41
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L41:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE47:
	.size	fcyc, .-fcyc
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"\nElements   Time (Cycles)"
.LC3:
	.string	"------------------------"
.LC4:
	.string	"   %4ld       %6.1f\n"
.LC5:
	.string	"\nOp: +"
.LC6:
	.string	"Type: long"
.LC7:
	.string	"Function: combine4"
.LC8:
	.string	"\nMeasured CPE : %.1f\n\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB48:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$368, %rsp
	.cfi_def_cfa_offset 416
	movq	%fs:40, %rax
	movq	%rax, 360(%rsp)
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	$0, %ebp
	movl	$50, %ebx
	leaq	8(%rsp), %r14
	leaq	combine4(%rip), %r13
	leaq	.LC4(%rip), %r12
.L43:
	movq	%rbx, %rdi
	call	new_vec
	movq	%rax, %rsi
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rbx, %xmm0
	movsd	%xmm0, 32(%rsp,%rbp)
	movq	%r14, %rdx
	movq	%r13, %rdi
	call	fcyc
	movsd	%xmm0, 192(%rsp,%rbp)
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	addq	$50, %rbx
	addq	$8, %rbp
	cmpq	$1050, %rbx
	jne	.L43
	leaq	24(%rsp), %rcx
	leaq	192(%rsp), %rdx
	leaq	32(%rsp), %rsi
	leaq	16(%rsp), %r8
	movl	$20, %edi
	call	llsq@PLT
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movsd	24(%rsp), %xmm0
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	360(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L47
	movl	$0, %eax
	addq	$368, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L47:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE48:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.align 8
.LC1:
	.long	0
	.long	1084868608
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
