#include <stdint.h>

int willOverflow(uint64_t a, uint64_t b) {
    uint16_t c = a + b;
    return (c < a);
}