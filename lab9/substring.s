.extern calloc

global sub_string:

  /* copying string, start and end to callee saved regs*/
  movq r4, r0
  movq r5, r1
  movq r6, r2

  /*allocate memory from new string, returns to r0*/
  ldr r0, [r6]
  sub r0, r1, r0
  add r0, r0, #2
  ldr r1, #1
  bl calloc

  ldr r7, [r5]
  sub r7, r7, #1 /* r7 = i */
  ldr r8, [r6]
  ldr r5, #0 /* r5 = j */

  loop:
    cmp r7, r8 /* i < end */
    blt end_loop

    /* sub_str[j] = string[i] */
    add r0, r0, [r5]
    add r4, r4, [r7]
    movq [r0], [r4]  

    add r7, r7, #1 /* i++ */
    add r5, r5, #1 /* j++ */
    b loop

  end_loop:
    bx lr
