#include "wordList2.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, char *argv[]) {
    Node *head = NULL;
    Node *tail = NULL;
    Node *tailNode = NULL;
    Occurrence *newest = NULL;
    char *input = argv[2];
    FILE *input_file;
    int length;
    int occurrences = 0;
    int number_of_lines = 0;
    char line[MAXLINE];
    char longest[MAXLINE];
    char *p;
    char *array[MAXLINE];
    char tokarray[MAXLINE];
    int i = 0;
    longest[0] = '\0';
    
    input_file = fopen(input, "r");
    if (argc != 3) {
        printf("myGrep: Improper number of arguments\n");
        printf("Usage: %s <word> <filename>\n", argv[0]);
        exit(-1);
    } if (input_file == 0) {
        printf("myGrep: Unable to open file: %s\n", argv[2]);
        exit(-1);
    } else {
        printf("%s ", argv[0]);
        printf("%s ", argv[1]);
        printf("%s\n", argv[2]);
        printf("Longest line ");
        /* while there is a next line */
        while (fgets(line, MAXLINE, input_file) != NULL) {
            length = strlen(line);
            if (length > strlen(longest)) {
                strcpy(longest, line); 
            /* if line contains the word */
            } if (strstr(line, argv[1]) != NULL) {
                strcpy(tokarray, line);
                p = strtok(line, " .,\n!");
                /* while there is a next word in line */
                while (p != NULL) {
                    /* if the word is found */
                    if (strcmp(p, argv[1]) == 0) {
                        newest = (Occurrence *)malloc(sizeof(Occurrence));
                        newest->next = NULL;
                        occurrences++;
                        newest->wordNum = i;
                        /*if not same line, add node AND occurrence. if same line, just add to occurrence.*/
                        if (tail != NULL && tail->lineNum == number_of_lines) {
                            tail->tailOccurrence->next = newest;
                            tail->tailOccurrence = tail->tailOccurrence->next;
                        } else {
                            tailNode = (Node *)malloc(sizeof(Node));
                            tailNode->lineNum = number_of_lines;
                            strcpy(tailNode->line, tokarray);
                            tailNode->next = NULL;
                            if (tail != NULL) {
                                tail->next = tailNode;
                                tail = tail->next;
                            } else {
                                tail = tailNode;
                                head = tail;
                            }
                            tail->headOccurrence = newest;
                            tail->tailOccurrence = tail->headOccurrence;
                        }
                    }
                    i++;
                    p = strtok(NULL, " .,\n!");
                }
            }
            number_of_lines++;
            i=0;
        }
        printf("(%lu characters): %s", strlen(longest), longest);
        printf("Number of lines: %d\n", number_of_lines);
        printf("Total occurrences of \"%s\": %d\n", argv[1], occurrences);
        while (head != NULL) {
            printf("Line %d, ", head->lineNum);
            printf("word(s) %d", head->headOccurrence->wordNum);
            head->headOccurrence = head->headOccurrence->next;
            while (head->headOccurrence != NULL) {
                printf(", %d", head->headOccurrence->wordNum);
                head->headOccurrence = head->headOccurrence->next;
            }
            printf(": %s", head->line);
            head = head->next;
        }
    }

    /*Node *temp;
    char variable1;
    int variable2;
    int variable3;
    Node *head = NULL;
    head = (Node *)malloc(sizeof(Node));
    strcpy(head->line, "hey");
    head->lineNum = 3;
    head->wordNum = 1;
    temp = head;
    head->next = (Node *)malloc(sizeof(Node));
    strcpy(head->next->line, "jmo");
    head->next->lineNum = 4;
    head->next->wordNum = 2;
    head->next = NULL;
    head = addToTail(head, "jmo", 3, 3);
    head = addToTail(head, "i", 4, 4);
    head = addToTail(head, "d", 5, 5);
    temp = rmFromHead(temp, &variable1, &variable2, &variable3);
    temp = rmFromHead(temp, &variable1, &variable2, &variable3);
    printList(temp);*/
    return 0;
}
