#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct X{
    char ch1;
    int i;
    char ch2;
    int *p;
    char str[18];
    float f;
};

struct Y{
    int i;
    double *p;
    double d;
};

struct List {
    char * str;
    struct List * next;
};


int hexdump(void *strt, void *stp);

int main() {
    struct X x;
    struct Y y;
    struct List * head;

    x.ch1 = 'A';
    x.i = 9;
    x.ch2 = '0';
    x.p = &x.i;
    strcpy(x.str, "Hello world");
    x.f = 2.543;

    y.i = -5;
    y.d = 4.5643;
    y.p = &y.d;

    head = (struct List *) malloc(sizeof(struct List));
    head->str=strdup("Welcome ");
    head->next = (struct List *) malloc(sizeof(struct List));
    head->next->str = strdup("to ");
    head->next->next = (struct List *) malloc(sizeof(struct List));
    head->next->next->str = strdup("cs250");
    head->next->next->next = NULL;

    hexdump((char *) &x.ch1, ((char *) &x.ch1)+sizeof(struct X)-1);
    hexdump((char*) &y.i, ((char*) &y.i)+sizeof(struct Y)-1);
    hexdump((char*) head, ((char*) head->next->next->str)+sizeof(head->next->next->str));

    return 0;
    
}

int hexdump(void *strt, void *stp) { 

    /* strt is the starting address of the memory block and stp is the ending adrress of the block */
    /* If stop < start, consider stop as the starting address and vice versa. */

    int *strt_p, *stp_p;

    if (strt < stp) {
        stp_p = (int *) &strt;
        strt_p = (int *) &stp;
    }
    else {
        strt_p = (int *) &strt;
        stp_p = (int *) &stp;
    }
    while(strt_p > stp_p) {
        for(int i = 0; i < 4; i++) {
            printf("%p", stp_p);
            strt_p += i;
        }
        putchar('\n');
    }

    /* On each line of the hex dump your function will display 16 bytes of memory.  The first address of a line will always */
    /* be a multiple of 16, and the last address on the line will always be a multiple of 16 minus 1 */

    /* Truncate the start address to the largest multiple of 16 that is less than or equal to the specified start argument */

    /* Round the stop addresses up to a multiple of 16 minus one that is greater than or equal to the specified stop argument */

    /* Ex: if start=21, make it 16.  If stop is 29, make it 31.  Think binary and optimize the code.  For example, */
    /* if start is "0x53FF6708", it will become "0x53FF6700" .  Similarly, if stop="0x53FF67DC", it will become "0x53FF67DF" */

    /* print the data byte-by-byte between start and stop in the below given format (Check the example output) */
    /* Print ascii equivalent of printable characters. */
    /* For the ASCII output, only print the "printable" characters.  If a character is not printable, print */
    /* a dot in its place.  You may use the function "isprint((int)ch)" which returns true if the character */
    /* 'ch' is printable */

    return 0;
}

