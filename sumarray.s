/* -- Largest -> Program to compute the largest of 2 number --*/
.data

/* Title */
message1: .asciz "Program to find the largest of two numbers\n\n"

/* Prompt for first number */
input1: .asciz "Type the first number: "

/* Prompt for second number */
input2: .asciz "Type the second number: "

/* Prompt for third number */
input3: .asciz "Type the third number: "

/* Prompt for fourth number */
input4: .asciz "Type the fourth number: "

/* Prompt for fifth number */
input5: .asciz "Type the fifth number: "

/* format pattern for scanf */
.balign 4
"sumarray.s" 143 lines, 2851 characters

/* Where scanf will store the first number read */
.balign 4
number_read1: .word 0

/* Where scanf will store the second number read */
.balign 4
number_read2: .word 0

/* Where scanf will store the third number read */
.balign 4
number_read3: .word 0

/* Where scanf will store the fourth number read */
.balign 4
number_read4: .word 0

/* Where scanf will store the fifth number read */
.balign 4
number_read5: .word 0

/* Final message */
final_message: .asciz "The sum is %d\n"

.balign 4
return: .word 0

.text

.global main

main:
        ldr r1, address_of_return
        str lr, [r1]

        ldr r0, address_of_message1
        bl printf

        /* Get input */
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

        ldr r0, address_of_input3
        bl printf

        ldr r0, address_of_scan_pattern
        ldr r1, address_of_number_read3
        bl scanf

        ldr r0, address_of_input4
        bl printf

        ldr r0, address_of_scan_pattern
        ldr r1, address_of_number_read4
        bl scanf

        ldr r0, address_of_input5
        bl printf

	ldr r0, address_of_scan_pattern
        ldr r1, address_of_number_read5
        bl scanf

        ldr r0, address_of_number_read1
        ldr r0, [r0]
        ldr r1, address_of_number_read2
        ldr r1, [r1]
        ldr r2, address_of_number_read3
        ldr r2, [r2]
        ldr r3, address_of_number_read4
        ldr r3, [r3]
        ldr r4, address_of_number_read5
        ldr r4, [r4]
        mov r5, #0

        add r5, r5, r0
        add r5, r5, r1
        add r5, r5, r2
        add r5, r5, r3
        add r5, r5, r4

        mov r1, #0
	       add r1, r5, #0
        ldr r0, address_of_final_message
        bl printf

        ldr lr, address_of_return
        ldr lr, [lr]
        bx lr

address_of_message1 : .word message1
address_of_input1 : .word input1
address_of_input2 : .word input2
address_of_input3 : .word input3
address_of_input4 : .word input4
address_of_input5 : .word input5
address_of_scan_pattern : .word scan_pattern
address_of_number_read1 : .word number_read1
address_of_number_read2 : .word number_read2
address_of_number_read3 : .word number_read3
address_of_number_read4 : .word number_read4
address_of_number_read5 : .word number_read5
address_of_final_message : .word final_message
address_of_return : .word return

/* External */
.global printf
.global scanf