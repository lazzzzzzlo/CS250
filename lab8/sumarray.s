#Sumarray.s

.data

title: .asciiz “This program sums a set of five numbers”

input1: .asciiz “Enter the first number: \n”
scan_formtat1: .asciiz "%d\n"
num1: .word 0

input2: .asciiz “Enter the second number\n”
scan_formtat2: .asciiz "%d\n"
num2: .word 0

input3: .asciiz “Enter the third number: \n”
scan_formtat2: .asciiz "%d\n"
num3: .word 0

input4: .asciiz “Enter the fourth number\n”
scan_formtat4: .asciiz "%d\n"
num4: .word 0

input5: .asciiz “Enter the fifth number: \n”
scan_formtat5: .asciiz "%d\n"
num5: .word 0

.text

.globl sumarray

sumarray:

	movq %rdi %rax
	addq %rsi %rax
	addq %rdx %rax
	addq %rcx %rax
	addq %r8  %rax
	ret

.globl main

main:

	
