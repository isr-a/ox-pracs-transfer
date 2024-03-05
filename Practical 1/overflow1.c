#include <stdint.h>
 
int willOverflow(uint64_t a, uint64_t b) {
    return (a + b < a);
}