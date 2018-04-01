; Justin Mo

        .ORIG x3400

MAIN    AND R1, R1, #0    ; Clear R0.
INC     ADD R1, R1, #1    ; Increment R1.
        BRp INC           ; Branch to INC while positive.
        AND R1, R1, #0    ; Clear R1.
        LD R0, ASTER      
        OUT               ; Print the character.
        BRnzp MAIN        ; Start over.  

ASTER   .FILL x2A
        .END



