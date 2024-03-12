#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "llsq.h"

#define STR_EXPAND(tok) #tok
#define STR(tok) STR_EXPAND(tok)

// These define the operator, the idempotent value of that operator, the function to be tested, and the data type to be tested.

#define OP +
#define IDENT 0
#define TYPE long
#define COMBINE combine1

// Set this to the clock frequency of your processor.

#define FREQUENCY 3300

// These define the element size tested. They do not need to change.

#define START 50
#define STOP 1000
#define STEP 50
#define NUMBER ((STOP - START) / STEP + 1)

// This defines the number of repetitions performed on each function.

#define REPETITIONS 1000000

// The typedef of the vector.

typedef TYPE data_t;

typedef struct {
    long len;
    data_t *data;
} vec_rec, *vec_ptr;

// Function to generate a new vector.

vec_ptr new_vec(long len) {

    long i;
    vec_ptr result = (vec_ptr)malloc(sizeof(vec_rec));

    data_t *data = NULL;

    if (!result) {
        return NULL;
    }

    result->len = len;

    if (len > 0) {

        data = (data_t*)calloc(len, sizeof(data_t));

        if (!data) {
            free((void*)result);
            return NULL;
        }

    }

    result->data = data;

    return result;

}

// Function to get an element from a vector.

int get_vec_element(vec_ptr v, long index, data_t *dest) {

    if (index < 0 || index >= v->len) {
        return 0;
    }

    *dest = v->data[index];

    return 1;

}

// Function to return the length of the vector.

long vec_length(vec_ptr v) {
    return v->len;
}

// Initial combine function.

void combine1(vec_ptr v, data_t *dest) {

    long i;
    *dest = IDENT;
    for (i = 0; i < vec_length(v); i += 1) {
        data_t val;
        get_vec_element(v, i, &val);
        *dest = *dest OP val;
    }

}

// Function to repeatedly call a function, measuring its execution time in cycles.

double fcyc( void (*f)(vec_ptr, data_t*), vec_ptr v, data_t *d) {

    int i;
    long sec, usec;
    struct timeval tstart, tfinish;

    gettimeofday(&tstart, NULL);
    for (i = 0; i < REPETITIONS; i += 1) {
        f(v,d);
    }
    gettimeofday(&tfinish, NULL);

    sec = tfinish.tv_sec - tstart.tv_sec;
    usec = tfinish.tv_usec - tstart.tv_usec;

    return (1e6 * sec + usec) *  FREQUENCY / REPETITIONS;

}

// Main function to run tests and show results.

int main() {

    data_t d;
    int index = 0;
    double x[NUMBER];
    double y[NUMBER];

    printf("\nElements   Time (Cycles)\n");
    printf("------------------------\n");

    long l;
    for (l = START; l <= STOP; l += STEP) {
        vec_ptr v = new_vec(l);
        x[index] = (double)l;
        y[index] = fcyc(COMBINE, v, &d);
        printf("   %4ld       %6.1f\n", l, y[index]);
        index += 1;
    }

    double offset, cpe;
    llsq(NUMBER, x, y, &cpe, &offset);

    printf("\nOp: " STR(OP) "\n");
    printf("Type: " STR(TYPE) "\n");
    printf("Function: " STR(COMBINE) "\n");

    printf("\nMeasured CPE : %.1f\n\n", cpe);

    return 0;

}
