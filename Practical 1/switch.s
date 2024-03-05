	.file	"switch.c"
	.text
	.globl	calculate
	.def	calculate;	.scl	2;	.type	32;	.endef
	.seh_proc	calculate
calculate:
	.seh_endprologue
	movl	%ecx, %eax
	movl	%edx, %ecx
	movl	%r8d, %r10d
	sarl	$31, %r10d
	shrl	$30, %r10d
	leal	(%r8,%r10), %r9d
	andl	$3, %r9d
	subl	%r10d, %r9d
	cmpl	$2, %r9d
	je	.L2
	jg	.L3
	leal	(%rax,%rdx), %r10d
	testb	$3, %r8b
	je	.L1
	movl	$0, %r10d
	cmpl	$1, %r9d
	jne	.L1
	imull	%edx, %eax
	movl	%eax, %r10d
.L1:
	movl	%r10d, %eax
	ret
.L2:
	cltd
	idivl	%ecx
	movl	%edx, %r10d
	jmp	.L1
.L3:
	cltd
	idivl	%ecx
	movl	%eax, %r10d
	jmp	.L1
	.seh_endproc
	.ident	"GCC: (Rev3, Built by MSYS2 project) 13.2.0"
