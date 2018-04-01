/**
 * CSC 225, Assignment 7
 */

#include <stdio.h>

int charCount(char[], char);

int main() {
    /* Assume that the input string will be no longer than 19 characters. */
    char str[20], key, numChars;

    printf("Enter a string: ");
    scanf(" %s", str);
    printf("Enter a character for which to search: ");
    scanf(" %c", &key);

    numChars = charCount(str, key);
    printf("'%c' occurs %d times!\n", key, numChars);

    return 0;
}

/**
 * Recursively counts the occurrences of a character in a string.
 * str - The string in which to search
 * key - The character for which to search
 *
 * Returns the number of occurrences of key in str.
 */
int charCount(char str[], char key) {
    int result;

    if (*str == '\0') {
        result = 0;
    }
    else {
        if (*str == key) {
            result = 1;
        }
        else {
            result = 0;
        }
        result += charCount(str + 1, key);
    }

    return result;
}
