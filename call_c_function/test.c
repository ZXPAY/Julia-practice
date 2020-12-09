#include "test.h"

int add(int a, int b) {
    return a + b;
}

void add3_p(int a, int b, int c, int *d) {
    *d = a + b + c;
}
