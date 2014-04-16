#include <unistd.h>

void myputc(char c) {
    write(1, (void *)c, 1);
}

int main() {

    myputc('c');
    return 0;
}
