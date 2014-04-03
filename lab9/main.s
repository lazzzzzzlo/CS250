.data

string_prompt:
.asciz "Enter a string: "

int_scan_format:
.asciz "%d"

start_prompt:
.asciz "Enter the start index: "

end_prompt:
.asciz "Enter the end index: "

output:
.asciz "The substring of the given string is '%s'\n"

.balign 4
start_index: .word 0

.balign 4
.lcomm in_string, 30

.balign 4
end_index: .word 0

.text

.extern malloc
.extern printf
.extern scanf
.extern sub_string

.global main
.func main

main:

  ldr r0, =string_prompt
  bl printf

  ldr r0, =in_string
  mov r1, #30
  mov r2, #0
  bl fgets

  ldr r0, =start_prompt
  ldr r1, =end_index
  bl scanf

  ldr r0, =end_prompt
  ldr r1, =end_index
  bl scanf

  ldr r0, =in_string
  ldr r6, =start_index
  ldr r1, [r6]
  ldr r6, =end_index
  ldr r2, [r6]
  bl sub_string

  mov r1, r0
  ldr r0, =output
  bl printf