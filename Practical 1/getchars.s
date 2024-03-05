	.file	"getchars.c"
	.text
	.globl	getCharacters
	.def	getCharacters;	.scl	2;	.type	32;	.endef
	.seh_proc	getCharacters
getCharacters:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L2
.L4:
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	-9(%rbp), %edx
	movb	%dl, (%rax)
.L2:
	call	getchar
	movb	%al, -9(%rbp)
	cmpb	$10, -9(%rbp)
	je	.L3
	cmpb	$-1, -9(%rbp)
	jne	.L4
.L3:
	cmpb	$-1, -9(%rbp)
	jne	.L5
	movq	-8(%rbp), %rax
	cmpq	16(%rbp), %rax
	jne	.L5
	movl	$0, %eax
	jmp	.L6
.L5:
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$0, (%rax)
	movq	16(%rbp), %rax
.L6:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	echo
	.def	echo;	.scl	2;	.type	32;	.endef
	.seh_proc	echo
echo:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	.refptr.__stack_chk_guard(%rip), %rax
	movq	(%rax), %rdx
	movq	%rdx, -8(%rbp)
	xorl	%edx, %edx
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	getCharacters
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	puts
	nop
	movq	.refptr.__stack_chk_guard(%rip), %rax
	movq	-8(%rbp), %rdx
	subq	(%rax), %rdx
	je	.L8
	call	__stack_chk_fail
	nop
.L8:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev3, Built by MSYS2 project) 13.2.0"
	.def	getchar;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	__stack_chk_fail;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.__stack_chk_guard, "dr"
	.globl	.refptr.__stack_chk_guard
	.linkonce	discard
.refptr.__stack_chk_guard:
	.quad	__stack_chk_guard
