#Length.s

.data

title: .string "This program computes the length of the string entered\n"

input: .string "Enter the string:\n"
output: .string "The length is %d\n"

.text

strlen:

  while:
    call getchar
    cmpq $65, %rax
    je end_loop
    addq $1, %r8
    jmp while

  end_loop:
    movq %r8, %rax
    ret

.globl main

main:

  movq $title, %rdi
  movq $0, %rax
  call printf

  movq $input, %rdi
  movq $0, %rax
  call printf

  call strlen

  movq $output, %rdi
  movq %rax, %rsi
  movq $0, %rax
  call printf
