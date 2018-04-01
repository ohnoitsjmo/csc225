; Justin Mo

        .ORIG x3300

CCOUNT
        ADD R6, R6, #-2 ; Initialize stack frame
        STR R7, R6, #0  ; Push return address
        ADD R6, R6, #-1
        STR R5, R6, #0  ; Push dynamic link
        ADD R5, R6, #-1
        ADD R6, R6, #-1 ; Push uninitialized result variable

        LDR R2, R5, #4
        LDR R2, R2, #0
        BRnp SKIP
        AND R1, R1, #0 
        STR R1, R5, #0  ; Set result to 0
        BRnzp DONE 

SKIP    LDR R1, R5, #5  ; Load value of key into R1
        LDR R2, R5, #4  ; Load value of string into R2
        LDR R2, R2, #0  ; Dereferencing string pointer
        NOT R2, R2
        ADD R2, R2, #1
        ADD R2, R1, R2
        BRnp NEXT       ; If the values are not the same, branch
        ADD R2, R2, #1  ; Add 1 to result
        STR R2, R6, #0  ; Store result in to result local variable
        BRnzp SETUP     ; Unconditionally branch to setup
NEXT    AND R2, R2, #0  ; Clear R2
        STR R2, R6, #0  ; Store result in to result local variable

SETUP   ADD R6, R6, #-1 ; Decrement the stack
        STR R1, R6, #0  ; Store key into stack pointer
        ADD R6, R6, #-1 ; Decrement stack pointer again
        LDR R2, R5, #4  ; Loading string pointer into R2   
        ADD R2, R2, #1  ; Increment R4 string pointer
        STR R2, R6, #0  ; Store new string pointer into stack pointer  
        JSR CCOUNT

        LDR R4, R6, #0  ; Load result into R4
        ADD R6, R6, #1  ; Pop return value
        ADD R6, R6, #2  ; Pop arguments
        LDR R2, R5, #0  ; Load result into R2
        ADD R2, R2, R4  ; Add result to return value
        STR R2, R6, #0  ; Store result 

DONE    LDR R2, R5, #0  ; Load result into R2
        STR R2, R5, #3  ; Store result into return value
        ADD R6, R6, #1  ; Pop local
        LDR R5, R6, #0  ; Load dynamic link into R5
        ADD R6, R6, #1  ; Pop dynamic link
        LDR R7, R6, #0  ; Load return addr into R7
        ADD R6, R6, #1  ; Pop return addr
        RET

        .END