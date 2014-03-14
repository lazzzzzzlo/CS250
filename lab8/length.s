Length.s

.data

title: .asciiz “This program computes the length of the string entered\n\n”

message1: .ascii “Enter the string”
char: .byte 0
length: .word 0

.text

.globl largest

length:
	cmpq %rsi, %rdi
	jle else_branch
	movq %rdi, %rax
		jmp end_max
	else_branch:
		movq %rsi, %rax
	end_max:
		ret

.globl main

main: