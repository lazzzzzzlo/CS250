#Sumarray.s

.data

title: .string "This program sums a set of five numbers\n"

input1: .string "Enter the first number: \n"
scan_format1: .string "%d\n"
.comm num1, 32

input2: .string "Enter the second number\n"
scan_format2: .string "%d\n"
.comm num2, 32

input3: .string "Enter the third number: \n"
scan_format3: .string "%d\n"
.comm num3, 32

input4: .string "Enter the fourth number\n"
scan_format4: .string "%d\n"
.comm num4, 32 

input5: .string "Enter the fifth number:\n"
scan_format5: .string "%d\n"
.comm num5, 32

output: .string "The sum of the numbers is %d\n"

.text

.globl sumarray

sumarray:

	movq %rdi, %rax
	addq %rsi, %rax
	addq %rdx, %rax
	addq %rcx, %rax
	addq %r8,  %rax
	ret

.globl main

main:

  movq $title, %rdi
  movq  $0, %rax
  call printf

  movq $input1, %rdi
  movq $0,  %rax
  call printf

  movq $scan_format1, %rdi
  movq $num1, %rsi
  movq $0, %rax
  call scanf

  movq $input2, %rdi
  movq $0,  %rax
  call printf

  movq $scan_format2, %rdi
  movq $num2, %rsi
  movq $0, %rax
  call scanf

  movq $input3, %rdi
  movq $0,  %rax
  call printf

  movq $scan_format3, %rdi
  movq $num3, %rsi
  movq $0, %rax
  call scanf

  movq $input4, %rdi
  movq $0,  %rax
  call printf

  movq $scan_format4, %rdi
  movq $num4, %rsi
  movq $0, %rax
  call scanf

  movq $input5, %rdi
  movq $0,  %rax
  call printf

  movq $scan_format5, %rdi
  movq $num5, %rsi
  movq $0, %rax
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

  movq $0, %rsi
  addq %rdi, %rsi

  movq $output, %rdi
  movq $0, %rax
  call printf
