/**
 * CSC 225, Assignment 7
 */

#include <stdio.h>

/**
 * Prints out positive integers, counting backwards from n to 1.
 * n - A positive integer at which to start
 */
void countBackwardsFrom(int n) {
    if (n == 1) {
        printf("%d", n);
    } else { 
        printf("%d, ", n);
        countBackwardsFrom(n-1);
    }
    /* TODO: Complete this function. */
}

/**
 * Prints out positive integers, counting forwards from 1 to n.
 * n - A positive integer at which to stop
 */
void countForwardsTo(int n) {
    if (n == 1) {
        printf("%d", n);
    } else {
        countForwardsTo(n-1);
        printf(", %d", n);
    }
}
