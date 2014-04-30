#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//data
#define COLUMNS 7
#define ROWS 6

#define INITIAL 0
#define WIN 1
#define TIE 2

typedef struct game {
    char **board;
    int current_player;
    int state;
} Game;

const char *initial_row = "| - - - - - - - |";
const char *last_row =    "  1 2 3 4 5 6 7  ";

const char *invalid_move = "Invalid move. Try again.";

const char *tie = "Tie Game.";

const int columns[COLUMNS] = { 2, 4, 6, 8, 10, 12, 14 };
const int col_height[COLUMNS] = {0, 0, 0, 0, 0, 0, 0 };

//text

// allocate space and initialize the game board
Game *g_init() {

    Game *g = malloc(sizeof(Game));
    g->board = malloc(sizeof(char *)*(ROWS + 1));
    char *row;

    for(int i = 0; i < ROWS; i++) {
        row = malloc(sizeof(char)*(COLUMNS + 10));
        strcpy(row, initial_row);
        g->board[i] = row;
    }

    row = malloc(sizeof(char)*(COLUMNS+10));
    strcpy(row, last_row);

    g->board[ROWS] = row;
    g->current_player = 1;

    return g;
}

void g_print_board(Game *g) {
    for(int i = 0; i < ROWS + 1; i++)
        printf("%s\n", g->board[i]);
}

//helper function to add a checker to the board
void add_checker(Game *g, int column) {
    if (current_player == 1)
        board[col_height[column/2]][columns[column]] = 'O';
    else
        board[col_height[column/2]][columns[column]] = 'X';
}

//prompt for play, if valid add checker
//update state
void g_play_turn(Game *g) {

    printf("Player %d choose column:", g->current_player);
    int column = -1;
    scanf("%d", &column);
    while(!(column >= 0 && column <= 6)) {
        scanf("%d", &column);
        printf("%s\n", invalid_move);
    }
    add_checker(g, column);
}

//free all memory
void g_free(Game *g) {
    for(int i = 0; i < ROWS; i++) {
        free(g->board[i]);
        g->board[i] = NULL;
    }
    free(g->board);
    g->board = NULL;
    free(g);
    g = NULL;
}

int main(void) {

    Game *g = g_init();

    g_print_board(g);
    g_play_turn(g);
    g_print_board(g);

    while(g->state != INITIAL) {
        g_print_board(g);
        g_play_turn(g);
        g_print_board(g);
    }

    if (g->state == WIN)
        printf("Player %d Wins.\n", g->current_player);
    else
        printf("Tie Game.\n");

    printf("----- Exiting Connect 4 -----\n");
    g_free(g);

    return 0;
}

