#include <stdlib.h>
#include <stdio.h>

char *getCharacters(char *s) {
    char c;
    char *dest = s;
    while ((c = getchar()) != '\n' && c != EOF)
        *dest++ = c;
    if (c == EOF && dest == s)
        return NULL;
    *dest++ = '\0';
    return s;
}
void echo() {
    char buffer[8];
    getCharacters(buffer);
    puts(buffer);
}

int main(void) {
    while (1)
        echo();
}