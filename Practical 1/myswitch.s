.data
.globL jmptable
jmptable: 
	.quad case0
	.quad case1
	.quad case2
	.quad case3
calculate:
	push %rbp
	movq %rsp, %rbp
	andl $3, %edx
switchtable:
	addl jmptable, %edx
	jmp EDX
case0:
	addq %rdi, %rsi
	movq %rsi, %rax
	jmp end
case1:
	movq %rdi, %rax
	mulq %rsi
case2:
	movq %rdi, %rax
	divq %rsi
	movq %rdx, %rax
case3:
	movq %rdi, %rax
	divq %rsi
end:
	movq %rbp, %rsp
	pop %rbp
	ret
