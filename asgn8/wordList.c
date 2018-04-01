/**
 * CSC 225, Assignment 8
 * Christopher Siu (cesiu@calpoly.edu)
 * Reference sol'n, Winter '18
 */

/* TODO: Included any required libraries. */
#include "wordList.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Adds a new occurrence to the end of a list.
 * tail - A pointer to the current tail of a list, NULL if it's empty.
 * line - The line in which the word occurs
 * lineNum - The number of that line within the file
 * wordNum - The position of that word within that line
 *
 * Returns a pointer to the new tail of the list.
 */
Node *addToTail(Node *tail, char *line, int lineNum, int wordNum) {
    Node *head = NULL;
    head = (Node *)malloc(sizeof(Node));
    strcpy(head->line, line);
    head->lineNum = lineNum;
    head->wordNum = wordNum;
    head->next = NULL;
    if (tail != NULL) {
        tail->next = head;
    } else {
        tail = head;
    }
    return head;
}

/**
 * Removes an occurrence from the beginning of a list.
 * head - A pointer to the current head of a list, NULL if it's empty
 * line - A pointer at which to store the removed line
 * lineNum - A pointer at which to store the removed line number
 * wordNum - A pointer at which to store the removed word number
 *
 * Returns a pointer to the new head of the list, NULL if it's (now) empty.
 */
Node *rmFromHead(Node *head, char *line, int *lineNum, int *wordNum) {
    Node *temp;
    if (head == NULL) {
        return NULL;
    } else {
        strcpy(line, head->line);
        *lineNum = head->lineNum;
        *wordNum = head->wordNum;
        temp = head;
        head = head->next;
        free(temp);
        return head;
    }
}

/**
 * Prints out every node in a list.
 * head - A pointer to the head of a list, NULL if it's empty
 */
void printList(Node *head) {
     if (head != NULL) {
        printf("Node:\n");
        printf(" - line: %s\n", head->line);
        printf(" - lineNum: %d\n", head->lineNum);
        printf(" - wordNum: %d\n", head->wordNum);
        printList(head->next);
     }
}
