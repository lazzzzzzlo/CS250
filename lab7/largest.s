/* -- Largest -> Program to compute the largest of 2 number --*/
.data

/* Title */
message1: .asciz "Program to find the largest of two numbers\n\n"

/* Prompt for first number */
input1: .asciz "Type a number: "

/* Prompt for second number */
input2: .asciz "Type a number: "

/* format pattern for scanf */
.balign 4
scan_pattern: .asciz "%d"

/* Where scanf will store the first number read */
.balign 4
number_read1: .word 0

/* Where scanf will store the second number read */
.balign 4
number_read2: .word 0

/* Final message */
final_message: .asciz "The largest number entered was %d\n"

.balign 4
return: .word 0

.text

.global main

main:
        ldr r1, address_of_return
        str lr, [r1]

        ldr r0, address_of_message1
        bl printf

        ldr r0, address_of_input1
        bl printf

        ldr r0, address_of_scan_pattern
        ldr r1, address_of_number_read1
        bl scanf
	
	        ldr r0, address_of_input2
        bl printf

        ldr r0, address_of_scan_pattern
        ldr r1, address_of_number_read2
        bl scanf

if_eval:
        ldr r0, address_of_number_read1
        ldr r0, [r0]
        ldr r1, address_of_number_read2
        ldr r1, [r1]
        cmp r0, r1
        bLE else

then_part:
        ldr r0, address_of_final_message
        ldr r1, address_of_number_read1
        ldr r1, [r1]
        bl printf
        ldr lr, address_of_return
        ldr lr, [lr]
        bx lr

else:
        ldr r0, address_of_final_message
        ldr r1, address_of_number_read2
        ldr r1, [r1]
        bl printf
        ldr lr, address_of_return
        ldr lr, [lr]
        bx lr

address_of_message1 : .word message1
address_of_input1 : .word input1
address_of_input2 : .word input2
address_of_scan_pattern : .word scan_pattern
address_of_number_read1 : .word number_read1
address_of_number_read2 : .word number_read2
address_of_final_message : .word final_message
address_of_return : .word return

/* External */

.global printf
.global scanf