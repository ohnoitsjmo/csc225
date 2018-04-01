/**
 * CSC 225, Assignment 6
 */

#include <stdio.h>
#include "stack.h"
#include <ctype.h>

/**
 * Pushes a value onto a stack of integers.
 * stack - The array containing the stack
 * size - A pointer to the number of elements in the stack
 * val - The value to push
 *
 * Returns 0 on success, 1 on overflow.
 */
int push(int stack[], int *size, int val) {
    /* TODO: Complete this function. */
    if (*size == MAX_SIZE) {
        return 1;
    } else {
        stack[(*size)++] = val;
        return 0;
    }
}

/**
 * Pops a value off of a stack of integers.
 * stack - The array containing the stack
 * size - A pointer to the number of elements in the stack
 * val - A pointer to the variable in which to place the popped value
 *
 * Returns 0 on success, 1 on underflow.
 */
int pop(int stack[], int *size, int *val) {
    /* TODO: Complete this function. */
    if (*size == 0) {
        return 1;
    } else {
        *val = stack[--(*size)];
        return 0;
    }
}

/**
 * Prints a stack of integers.
 * stack - The array containing the stack
 * size - The number of elements in the stack
 * mode - How to print elements, one of: DEC_MODE, HEX_MODE, or CHAR_MODE
 */
void printStack(int stack[], int size, int mode) {
    /* TODO: Complete this function. */
    int i;
    if (size == 0) {
        printf("[]");
    } else {
        printf("[");
        if (mode == DEC_MODE) {
            printf("%d", stack[0]);
            for(i=1; i<size; i++)
            {
                printf(", %d", stack[i]);
            }
        } else if (mode == HEX_MODE) {
            printf("0x%X", stack[0]);
            for(i=1; i<size; i++)
            {
                printf(", 0x%X", stack[i]);
            }
        } else {
            if (stack[0] < 32) {
                printf("%d", stack[0]);
            } else {
                printf("'%c'", stack[0]);
            }
            for(i=1; i<size; i++)
            {
                if (stack[i] < 32) {
                    printf(", %d", stack[i]);
                } else {
                    printf(", '%c'", stack[i]);
                }
            }
        }
        printf("]");
    }
}
