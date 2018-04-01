/**
 * CSC 225, Assignment 7
 * Tests recursive functions in countFuncs.c.
 */

#include <stdio.h>

void countBackwardsFrom(int);
void countForwardsTo(int);

int main(void) {
    int n;

    printf("Enter an integer: ");
    scanf(" %d", &n);
    countBackwardsFrom(n);
    printf("\n");
    countForwardsTo(n);
    printf("\n");

    return 0;
}
