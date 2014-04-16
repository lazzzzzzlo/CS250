#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

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

    if (strt > stp) { // ensure strt is found earlier in memory
        void *temp = strt;
        strt = stp;
        stp = temp;
    }

    strt = (void *)(((unsigned long) strt) & (~0x10)); 
    char byte = 1;
    stp =(void *) ((((unsigned long)stp) + 15) & (~0xf));
    stp -= byte;

    printf("Dumping from address %p to %p\n\n", strt, stp);
    printf("\tAddresses\t\tValues in Memory\t\tPrintable\n");

    while(strt < stp) {

        printf("%p - %p  ", strt, strt + 16); //Addresses

        int *n;
        int i;
        for(i = 0; i < sizeof(int);i++) { // Values in Memory
            n = (int *) strt;
            printf("%x ", *n);
            strt += i;
        }

        strt -= i;
        printf(" *");

        char *c;
        char j;

        for(j = 0; j < 16*sizeof(char); j++) { //Printables
            c = (char *) strt;
            if (isprint((int) *c)) {
                printf("%c", *c);
            }
            else {
                putchar('.');
            }
            strt += j;
        }
        printf("*\n\n");
    }

    return 0;
}

