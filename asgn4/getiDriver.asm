; Tests "geti" subroutine.
; CSC 225, Asgn. 4
; Christopher Siu (cesiu@calpoly.edu)

       .ORIG x3000
MAIN   LEA R0, PROMPT ; Print the prompt.
       PUTS

       TRAP x26       ; Call TRAP x26 (GETI)
       ;LD R0, GETI    ; Get the address of the subroutine.
       ;JSRR R0        ; Call the subroutine.

       LD R1, OFFSET
       ADD R1, R1, R0 ; Convert the int back into a char.

       LEA R0, OUTMSG ; Print the result message.
       PUTS
       ADD R0, R1, #0 ; Copy the number back into R0.
       OUT            ; Print the result.

       BRnzp MAIN     ; Loop infinitely.
       HALT

GETI   .FILL x3300
OFFSET .FILL x30
PROMPT .STRINGZ "\nEnter a number (0-9): "
OUTMSG .STRINGZ "\nResult: "
       .END
