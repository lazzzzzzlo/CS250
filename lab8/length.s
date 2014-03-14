Length.s

.data

title: .asciiz “This program computes the length of the string entered\n\n”

input: .ascii “Enter the string”
c: .word -2
eof: .word -1 
length: .word 0

.text

.globl strlen

strlen:

while:
  #read char from stdin
  cmpq %rdi %rsi
  jeq end_loop
  addq $1, %rax
  jmp while

end_loop:
  ret

.globl main

main:

  movq $title, %rdi
  movq $0, %rax
  call printf

  movq $input, %rdi
  movq $0, %rax
  call printf

  movq $c, %rdi
  movq $eof, %rsi
  movq $length, %rax
  jsr strlen

  movq $output, rdi
  movq $rax, rsi
  movq $0, %rax
  call printf
