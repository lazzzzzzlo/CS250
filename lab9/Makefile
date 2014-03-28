CC=gcc

CFLAGS= -o

all: asm2c, c2asm

asm2c: main.s sub_string.c
	$(CC) $(CFLAGS) asm2c main.s sub_string.c

c2asm:
	$(CC) $(CFLAGS) c2asm main.c sub_string.s

clean:
	rm c2asm asm2c
