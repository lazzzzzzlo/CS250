/* -- Connect 4 -- */

.data

/* -- String Constants -- */

#Board
board: .ascii "| - - - - - - - |\n| - - - - - - - |\n| - - - - - - - |\n| - - - - - - - |\n| - - - - - - - |\n| - - - - - - - |\n  1 2 3 4 5 6 7  \n"

#Gameplay
invalid_move: .asciiz "Invalid move. Try again."
move_prompt: .asciiz "Player   choose column:"

#Column
col: .comm 1

#End game
win: .asciiz "Player   Wins.\n"
tie: .asciiz "Tie Game."

#Exiting
exiting: .asciiz "----- Exiting Connect 4 -----\n"

#Terminal modes
raw: .ascii "stty raw"
cooked: .ascii "stty cooked"

.text

.global move_valid
.func move_valid

move_valid:
    bx lr

.global play_turn
.func play_turn

/* Args: r0:board, r1:player
 * Prompt player for input
 * check if move is valid
 * if valid add checker to 
 * right column 
 */

play_turn:

    str r1, [r0, +#7]
    ldr r1, r0
    mov r0, #1
    mov r2, #23
    bl write

    mov r0, #0
    ldr r1, addr_col
    mov r2, #1
    bl read

    subr r0, r0, #48 /* convert char to int */
    ldr r1, addr_board

    while:
    bl move_valid
    cmp r0, 1
    beq add_checker

    /*prompt for move
     *remind of invalid move
     */
    b while

    /* add checker specified in row mayor order */
    add_checker:
        
    bx lr

.global check_board
.func check_board

/* Go though board check if there are 4 consecutive
 * checkers, check for diagonal.
 * return 0 for non-final status, 
 * return 1 for win
 * return 2 for tie
 */
check_board:

    bx lr

.global main
.func main

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
        cmp 2 /*branch if tie */
        beq tie 

        mov r0, #1 /* else if win */
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
addr_col: .word col
addr_win: .word win
addr_tie: .word tie
addr_exiting: .word exiting
addr_raw: .word raw
addr_cooked: .word cooked

/* External */
.global system
.global read
.global write

