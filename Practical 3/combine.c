#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "llsq.h"

#define STR_EXPAND(tok) #tok
#define STR(tok) STR_EXPAND(tok)

// These define the operator, the idempotent value of that operator, the function to be tested, and the data type to be tested.

#define OP *
#define IDENT 1
#define TYPE long
#define COMBINE combine68

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

data_t *get_vec_start(vec_ptr v) {
    data_t* first = v->data;
    return first;
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

void combine2(vec_ptr v, data_t *dest) {

    long i;
    *dest = IDENT;
    long len = vec_length(v);
    for (i = 0; i < len; i += 1) {
        data_t val;
        get_vec_element(v, i, &val);
        *dest = *dest OP val;
    }
}

void combine3(vec_ptr v, data_t *dest) {

    long i;
    *dest = IDENT;
    long len = vec_length(v);
    data_t *val = get_vec_start(v);
    for (i = 0; i < len; i += 1) {
        *dest = *dest OP *val;
        val += 1; 
    }
}

void combine4(vec_ptr v, data_t *dest) {

    long i;
    TYPE temp = IDENT;
    long len = vec_length(v);
    data_t *val = get_vec_start(v);
    for (i = 0; i < len; i += 1) {
        temp = temp OP *val;
        val += 1; 
    }
    *dest = temp;
}

void combine52(vec_ptr v, data_t *dest) {

    long i;
    TYPE acc = IDENT;
    long len = vec_length(v);
    long limit = len - 1;
    data_t *data = get_vec_start(v);
    for (i = 0; i < limit; i += 2) {
        acc = acc OP data[i] OP data[i+1];
    }
    for (; i < len; i+= 1) {
        acc = acc OP data[i];
    }
    *dest = acc;
}

void combine54(vec_ptr v, data_t *dest) {

    long i;
    TYPE acc = IDENT;
    long len = vec_length(v);
    long limit = len - 3;
    data_t *data = get_vec_start(v);
    for (i = 0; i < limit; i += 4) {
        acc = acc OP data[i] OP data[i+1] OP data[i+2] OP data[i+3];
    }
    for (; i < len; i+= 1) {
        acc = acc OP data[i];
    }
    *dest = acc;
}

void combine58(vec_ptr v, data_t *dest) {

    long i;
    TYPE acc = IDENT;
    long len = vec_length(v);
    long limit = len - 7;
    data_t *data = get_vec_start(v);
    for (i = 0; i < limit; i += 8) {
        acc = acc OP data[i] OP data[i+1] OP data[i+2] OP data[i+3];
        acc = acc OP data[i+4] OP data[i+5] OP data[i+6] OP data[i+7];
    }
    for (; i < len; i+= 1) {
        acc = acc OP data[i];
    }
    *dest = acc;
}

void combine62(vec_ptr v, data_t *dest) {

    long i;
    TYPE acc1 = IDENT;
    TYPE acc2 = IDENT;
    long len = vec_length(v);
    long limit = len - 1;
    data_t *data = get_vec_start(v);
    for (i = 0; i < limit; i += 2) {
        acc1 = acc1 OP data[i];
        acc2 = acc2 OP data[i+1];
    }
    for (; i < len; i+= 1) {
        acc1 = acc1 OP data[i];
    }
    *dest = acc1 OP acc2 ;
}

void combine64(vec_ptr v, data_t *dest) {

    long i;
    TYPE acc1 = IDENT;
    TYPE acc2 = IDENT;
    TYPE acc3 = IDENT;
    TYPE acc4 = IDENT;
    long len = vec_length(v);
    long limit = len - 3;
    data_t *data = get_vec_start(v);
    for (i = 0; i < limit; i += 4) {
        acc1 = acc1 OP data[i];
        acc2 = acc2 OP data[i+1];
        acc3 = acc3 OP data[i+2];
        acc4 = acc4 OP data[i+3];
    }
    for (; i < len; i+= 1) {
        acc1 = acc1 OP data[i];
    }
    *dest = acc1 OP acc2 OP acc3 OP acc4;
}

void combine68(vec_ptr v, data_t *dest) {

    long i;
    TYPE acc1 = IDENT;
    TYPE acc2 = IDENT;
    TYPE acc3 = IDENT;
    TYPE acc4 = IDENT;
    TYPE acc5 = IDENT;
    TYPE acc6 = IDENT;
    TYPE acc7 = IDENT;
    TYPE acc8 = IDENT;
    long len = vec_length(v);
    long limit = len - 7;
    data_t *data = get_vec_start(v);
    for (i = 0; i < limit; i += 8) {
        acc1 = acc1 OP data[i];
        acc2 = acc2 OP data[i+1];
        acc3 = acc3 OP data[i+2];
        acc4 = acc4 OP data[i+3];
        acc5 = acc5 OP data[i+4];
        acc6 = acc6 OP data[i+5];
        acc7 = acc7 OP data[i+6];
        acc8 = acc8 OP data[i+7];
    }
    for (; i < len; i+= 1) {
        acc1 = acc1 OP data[i];
    }
    *dest = acc1 OP acc2 OP acc3 OP acc4 OP acc5 OP acc6 OP acc7 OP acc8;
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
