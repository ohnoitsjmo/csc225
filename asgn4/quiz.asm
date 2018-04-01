; CSC 225, Assignment 4
; Justin Mo
; R4 will store the sum of all the scores

        .ORIG x3000

        AND R0, R0, #0
        AND R1, R1, #0
        AND R2, R2, #0
        AND R3, R3, #0
        AND R4, R4, #0
        AND R5, R5, #0
        AND R6, R6, #0
        AND R7, R7, #0
        LDI R0, Q1STR
        PUTS
        LEA R0, PROMPT1    ; Loads character into R0.
        PUTS               ; Prompts response from user.
        TRAP x26           ; Input in R0.
        LD R2, Q1PTS       ; Starting address of array in R2
        ADD R2, R2, #-1    ; Subtract 1 from address
        ADD R3, R2, R0     ; Add input to starting address and save destination address in R3
        LDR R0, R3, #0     ; Load the value at the new address into R0.
        ADD R4, R4, R0     ; Add score to sum of scores.

        LDI R0, Q2STR
        PUTS
        LEA R0, PROMPT1    ; Loads character into R0.
        PUTS               ; Prompts response from user.
        TRAP x26           ; Input in R0.
        LD R2, Q2PTS       ; Starting address of array in R2
        ADD R2, R2, #-1    ; Subtract 1 from address
        ADD R3, R2, R0     ; Add input to starting address and save destination address in R3
        LDR R0, R3, #0     ; Load the value at the new address into R0.
        ADD R4, R4, R0     ; Add score to sum of scores.

        LDI R0, Q3STR
        PUTS
        LEA R0, PROMPT1    ; Loads character into R0.
        PUTS               ; Prompts response from user.
        TRAP x26           ; Input in R0.
        LD R2, Q3PTS       ; Starting address of array in R2
        ADD R2, R2, #-1    ; Subtract 1 from address
        ADD R3, R2, R0     ; Add input to starting address and save destination address in R3
        LDR R0, R3, #0     ; Load the value at the new address into R0.
        ADD R4, R4, R0     ; Add score to sum of scores.
        LD R0, ENDLINE     ; Newline
        OUT                ; Print newline.
        LEA R0, PROMPT2    ; Loads character into R0.
        PUTS               ; Prints result string.
        
        AND R5, R5, #0     ; Clear R5
        AND R6, R6, #0     ; Clear R6
        LD R6, VALUE2      ; Load #-26 into R6
        LD R5, VALUE3      ; Load #-20 into R5
        ADD R5, R4, R5     ; Subtract #-20 from value
        BRnz PRINT3        ; Branch to PRINT3
        ADD R6, R4, R6     ; Subtract #-26 from value
        BRnz PRINT2        ; Branch to PRINT2
        BRnzp PRINT1       ; If reached, branch to PRINT1

PRINT1  LDI R0, RESULT1    ; Loads address of first message into R0
        PUTS               ; Prints first message
        HALT

PRINT2  LDI R0, RESULT2    
        PUTS               ; Prints second message
        HALT

PRINT3  LDI R0, RESULT3    
        PUTS               ; Prints third message
        HALT

ENDLINE .FILL x0A       
PROMPT1 .STRINGZ "Answer: "
PROMPT2 .STRINGZ "Result: "
STORE26 .FILL x3300
Q1STR   .FILL x3500
Q1PTS   .FILL x3501
Q2STR   .FILL x3505
Q2PTS   .FILL x3506
Q3STR   .FILL x350A
Q3PTS   .FILL x350B
RESULT1 .FILL x350F
RESULT2 .FILL x3510
RESULT3 .FILL x3511
VALUE3  .FILL #-20
VALUE2  .FILL #-26
        .END
