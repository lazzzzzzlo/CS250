# largest.s

.data

title: .asciiz “This program computes which number is the largest\n”

input1: .asciiz “Enter the first number: \n”
scan_format1: .asciiz “%d\n”
num1: .word 0

input2: .asciiz “Enter the second number\n”
scan_formt2: .asciiz “%d\n”
num2: .word 0

print_format: .asciiz "The largest number is %d\n"

.text

.globl largest

largest:
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
