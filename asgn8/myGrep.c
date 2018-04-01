#include "wordList.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, char *argv[]) {
    Node *temp;
    Node *head = NULL;
    char *input = argv[2];
    FILE *input_file;
    int length;
    int occurrences = 0;
    int number_of_lines = 0;
    char line[MAXLINE];
    char longest[MAXLINE];
    char *p;
    int i = 0;
    longest[0] = '\0';
    head = (Node *)malloc(sizeof(Node));
    temp = head;

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
        while (fgets(line, MAXLINE, input_file) != NULL) {
            length = strlen(line);
            if (length > strlen(longest)) {
                strcpy(longest, line); 
            } if (strstr(line, argv[1]) != NULL) {
                strcpy(head->line, line);
                head->lineNum = number_of_lines;
                p = strtok(line, " .,\n!");
                while (p != NULL) {
                    if (strcmp(p, argv[1]) == 0) {
                        occurrences++;
                        head->wordNum = i;
                        head = addToTail(head, head->line, head->lineNum, head->wordNum);
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
        while (temp->next != NULL) {
            printf("Line %d, word %d: %s", temp->lineNum, temp->wordNum, temp->line);
            temp = temp->next;
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
