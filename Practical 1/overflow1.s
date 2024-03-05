	.file	"overflow1.c"
	.text
	.globl	willOverflow
	.def	willOverflow;	.scl	2;	.type	32;	.endef
	.seh_proc	willOverflow
willOverflow:
	.seh_endprologue
	addq	%rdx, %rcx
	setc	%al
	movzbl	%al, %eax
	ret
	.seh_endproc
	.ident	"GCC: (Rev3, Built by MSYS2 project) 13.2.0"
