#Connect 4

.data

/* -- String Constants -- */

#Board
board: .ascii "| - - - - - - - |\n| - - - - - - - |\n| - - - - - - - |\n| - - - - - - - |\n| - - - - - - - |\n| - - - - - - - |\n  1 2 3 4 5 6 7  \n"

#Gameplay
invalid_move: .asciiz "Invalid move. Try again."
move_prompt: .asciiz "Player %d choose column:"

#End game
win: .asciiz "Player %d Wins.\n"
tie: .asciiz "Tie Game."

#Exiting
exiting: .asciiz "----- Exiting Connect 4 -----\n"

#Terminal modes
raw: .ascii "stty raw"
cooked: .ascii "stty cooked"

/* -- Code */
.text

.global play_turn

play_turn:

    bx lr

.global main

.func main

/* -- Code Section */

main:
    
    /* -- Put terminal in raw mode */
    ldr r0, addr_raw
    bl system

    /* Set initial game state to 0
     * 1 represents win
     * 2 represents tie
     */

    mov r4, #0

    /* Set initial player */
    mov r5, #1

    while:

        /* check if game state is not tie or win */
        cmp r4, #0
        bne out

        /* Update player */
        addi r5, #1
        mov r5, [r5] MOD 2

        /* print board */
        mov r0, #1
        ldr r1, addr_board
        mov r2, #133
        bl write

        /* play turn */
        ldr r0, addr_board
        ldr r1, [r4]
        bl play_turn

        /* print board */
        mov r0, #1
        ldr r1, addr_board
        mov r2, #133
        bl write

        /* check board for game state */
        ldr r0, addr_board
        bl check_board

        /* Update game state based on board */
        addr r4, r4, r0

    b while

    out:
        cmp 2
        beq tie /* else is win */
        mov r0, #1
        ldr r1, addr_win
        
        b end

    tie:
        mov r0, #1
        ldr r1, addr_tie
        mov r2, #9
        bl write

    end:
        /* Print exiting message */
        mov r0, #1
        ldr r1, addr_exiting
        mov r2, #30
        bl write

        /* -- Put terminal back in cooked mode */
        ldr r0, addr_cooked
        bl system

        bx lr

/* Labels to access data */

addr_board: .word board
addr_invalid_move: .word invalid_move
addr_move_prompt: .word move_prompt
addr_win: .word win
addr_tie: .word tie
addr_exiting: .word exiting
addr_raw: .word raw
addr_cooked: .word cooked

/* External */
.global system
.global read
.global write

