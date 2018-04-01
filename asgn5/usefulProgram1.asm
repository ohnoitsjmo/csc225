; A very useful program.
; CSC 225, Assignment 5
; Justin Mo

        .ORIG x3000

        LD R0, TRAPVALUE    ; Set the Trap Vector Table.
        STI R0, TRAPSTORE

        LD R0, INTERVALUE   ; Set the Interrupt Vector Table.
        STI R0, INTERSTORE
        AND R0, R0, #0      ; Clear R0

        LD R6, SUPERVISOR   ; Initialize the stack pointer.

MAIN    LEA R0, INITMSG ; Print the starting message.
        PUTS
        TRAP x26        ; Get a character.
        OUT             ; Print the character.
        TRAP x26        ; Repeat four more times.
        OUT
        TRAP x26
        OUT
        TRAP x26
        OUT
        TRAP x26
        OUT
        LEA R0, ENDMSG  ; Print the ending message.
        PUTS
        BRnzp MAIN

TRAPSTORE   .FILL x26
INTERSTORE  .FILL x180
TRAPVALUE   .FILL x3300
INTERVALUE  .FILL x3500
SUPERVISOR  .FILL x3000
INITMSG .STRINGZ "Enter five characters: "
ENDMSG  .STRINGZ "\nSuccess! Running again...\n\n"
        .END
