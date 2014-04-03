# largest.s

.data

title: .string "This program computes which number is the largest\n"

input1: .string "Enter the first number: \n"
scan_format1: .string "%ld"
.comm num1 32 

input2: .string "Enter the second number\n"
scan_format2: .string "%ld"
.comm num2 32

output: .string "The largest number is %ld\n"

.text

.globl largest

largest:
	cmpq %rsi, %rdi
	jle else_branch
	movq %rdi, %rax
		jmp end_largest
	else_branch:
		movq %rsi, %rax
	end_largest:
		ret

.globl main

main:

  movq $title, %rdi
  movq $0, %rax
  call printf

  movq $input1, %rdi
  movq $0, %rax
  call printf

  movq $scan_format1, %rdi
  movq $num1, %rsi
  movq $0, %rax
  call scanf

  movq $input2, %rdi
  movq $0, %rax
  call printf

  movq $scan_format2, %rdi
  movq $num2, %rsi
  movq $0, %rax
  call scanf

  movq $num1, %rdi
  movq $num2, %rsi
  movq $0, %rax
  call largest

  movq %rax, %rsi
  movq output, %rdi
  movq $0, %rax
  call printf
