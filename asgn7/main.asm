; CSC 225, Assignment 7
; Implements the "main" function of charCount.c.
;
; Assumptions:
; - The input string will be no longer than 19 characters.
; - The character for which to search will occur fewer than 10 times.
; - The character for which to search will have no leading whitespace.

        .ORIG x3000

MAIN    LEA R6, MAIN        ; Initialize stack, frame pointers.
        ADD R5, R6, #-1
        ADD R6, R6, #-10    ; Push str.
        ADD R6, R6, #-10
        ADD R6, R6, #-1     ; Push key.
        ADD R6, R6, #-1     ; Push numChars.

        ; printf("Enter a string: ")
        LEA R0, PROMPT1
        PUTS

        ; scanf(" %s", str)
        ADD R1, R5, #-15    ; Set R1 as a pointer to the beginning of str.
        ADD R1, R1, #-4
LOOP    GETC                ; Scan a char.
        OUT                 ; Echo it.
        ADD R2, R0, x-A     ; Check for a newline.
        BRz DONE            ; If it's a newline, stop scanning.
        STR R0, R1, #0      ; Else, store the char in str.
        ADD R1, R1, #1      ; Increment the pointer.
        BRnzp LOOP
DONE    AND R0, R0, #0      ; Append a terminating null char.
        STR R0, R1, #0

        ; printf("Enter a character for which to search: ")
        LEA R0, PROMPT2
        PUTS

        ; scanf(" %c", &key)
        GETC                ; We'll assume there's no leading whitespace, even
        OUT                 ;  if that's not precisely what scanf does.
        STR R0, R5, #-20    ; Store the char in key.

        ; numChars = charCount(str, key)
        LDR R0, R5, #-20    ; Load key into R0.
        ADD R6, R6, #-1     ; Push key argument.
        STR R0, R6, #0
        ADD R0, R5, #-15    ; Load str into R0.
        ADD R0, R0, #-4
        ADD R6, R6, #-1     ; Push str argument.
        STR R0, R6, #0

        LD R0, CCOUNT       ; Call charCount.
        JSRR R0

        LDR R0, R6, #0      ; Pop the return value into R0.
        ADD R6, R6, #1
        STR R0, R5, #-21    ; Store the return value in numChars.
        ADD R6, R6, #1      ; Pop str argument.
        ADD R6, R6, #1      ; Pop key argument.

        ; printf("'%c' occurs %d times!\n", key, numChars)
        LD R0, NEWLN        ; Print a newline.
        OUT
        LD R0, QUOTE        ; Print the single quote.
        OUT
        LDR R0, R5, #-20    ; Print key.
        OUT
        LD R0, QUOTE        ; Print the single quote.
        OUT
        LEA R0, OCCURS      ; Print " occurs "
        PUTS
        LDR R0, R5, #-21    ; Load numChars into R0.
        LD R1, ASCII        ; Convert numChars into a char.
        ADD R0, R0, R1
        OUT                 ; Print numChars.
        LEA R0, TIMES       ; Print " times!\n"
        PUTS

        HALT

PROMPT1 .STRINGZ "Enter a string: "
PROMPT2 .STRINGZ "Enter a character for which to search: "
ASCII   .FILL x30
NEWLN   .FILL x0A
QUOTE   .FILL x27
OCCURS  .STRINGZ " occurs "
TIMES   .STRINGZ " times!\n"
CCOUNT  .FILL x3300

        .END
