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

output: .asciiz "The sum of the numbers is %d\n"

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

  movq title, %rdi
  movq  $0, %rax
  call printf

  movq $input1, %rdi
  movq $0,  %rax
  call printf

  movq $scan_format1, %rdi
  movq $num1, %rsi
  movq %0, %rax
  call scanf

  movq $input2, %rdi
  movq $0,  %rax
  call printf

  movq $scan_format2, %rdi
  movq $num2, %rsi
  movq %0, %rax
  call scanf

  movq $input3, %rdi
  movq $0,  %rax
  call printf

  movq $scan_format3, %rdi
  movq $num3, %rsi
  movq %0, %rax
  call scanf

  movq $input4, %rdi
  movq $0,  %rax
  call printf

  movq $scan_format4, %rdi
  movq $num4, %rsi
  movq %0, %rax
  call scanf

  movq $input5, %rdi
  movq $0,  %rax
  call printf

  movq $scan_format5, %rdi
  movq $num5, %rsi
  movq %0, %rax
  call scanf

  movq $num1, %rdi
  movq $num2, %rsi
  movq $num3, %rdx
  movq $num4, %rcx
  movq $num5, %r8

  addq %rsi, %rdi
  addq %rdx, %rdi
  addq %rcx, %rdi
  addq %r8,  %rdi 

  movq %rdi, %rsi

  movq $output, %rdi
  movq $0, %rax
  call printf
