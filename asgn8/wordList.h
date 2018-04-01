/**
 * CSC 225, Assignment 8
 */

#define MAXLINE 101        /* The maximum length of a line, plus one. */

/**
 * Represents a node in a linked list of word occurrences.
 */
typedef struct Node {
    char line[MAXLINE];    /* The line in which the word occurs */
    int lineNum;           /* The number of that line within the file */
    int wordNum;           /* The position of the word within that line */
    struct Node *next;     /* The next node in the list */
} Node;

Node *addToTail(Node *, char *, int, int);
Node *rmFromHead(Node *, char *, int *, int *);
void printList(Node *);
void printListMain(Node *);
