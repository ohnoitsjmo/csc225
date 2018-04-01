; Justin Mo
; Reads input string and returns encrypted string
; R0 - The current character
; R1 - Used to subtract from R2
; R2 - The encryption key entered by user (add key to each character in string)
; R3 - Memory location of next character to be stored
; R4 - Used as placeholder for XOR

       .ORIG x3000     ; Start at x3000.
       LEA R0, PROMPT1 ; Loads character into R0.
       PUTS            ; Prompts encryption key from user.
       GETC            ; Read a character.
       OUT             ; Write the character.
       LD R1, MINUS    ; Load xFFD0 into R1.
       ADD R2, R1, R0  ; Subtract R1 from R0 to convert ASCII to integer and store in R2.
       
       LEA R0, PROMPT2 ; Loads character into R0. 
       PUTS            ; Prompts input message from user.
       LEA R3, INPUT   ; Saves the memory address in R3.
IOLOOP GETC            ; Read a character.
       OUT             ; Write the character.
       STR R0, R3, #0  ; Store the character in R0 in the memory address in R3.
       ADD R3, R3, #1  ; Increment the memory address.
       ADD R0, R0, #-10; R0 = R0 - new line.
       BRnp IOLOOP     ; Break out of loop if new line.

       LEA R3, INPUT   ; Saves address of input into R3.
       LDR R0, R3, #0  ; Retrieve the value at this address in R3 and store in R0.
LOOP   AND R1, R1, #0  ; Clear R1
       ADD R1, R1, #1  ; Mask of bit to toggle (in this case the LSB).
       NOT R4, R0      ; Self-explanatory.     
       AND R4, R4, R1  ; Self-explanatory.  
       NOT R1, R1      ; Self-explanatory.  
       AND R0, R0, R1  ; Self-explanatory.  
       ADD R0, R0, R4  ; Self-explanatory. 
       ADD R0, R0, R2  ; Add encryption key to value in R0.
       STR R0, R3, #0  ; Store the character in R0 back into the address in R3.
       ADD R3, R3, #1  ; Increment the address in R3 by 1.
       LDR R0, R3, #0  ; Retrieve the value at this address and store in R0.
       BRnp LOOP       ; While this value is not 0, loop.
       
       LEA R0, PROMPT3 ; Loads character into R0.
       PUTS            ; Prints encrypted message string.
       ADD R3, R3, #-1 ; Decrement R3.
       AND R0, R0, #0  ; Clears R0.
       STR R0, R3, #0  ; Stores the character in R0 into the address in R3.
       LEA R0, INPUT   ; Saves address of input into R0.
       PUTS            ; Prints the characters saved from input until it hits null.

       LEA R3, INPUT   ; Saves address of input into R3. 
OLOOP  AND R0, R0, #0  ; Clear R0.
       STR R0, R3, #0  ; Store the character in R0 back into the address in R3.
       ADD R3, R3, #1  ; Increment R3.
       LDR R0, R3, #0  ; Retrieve the value at this address and store in R0.
       BRnp OLOOP      ; While this value is not 0, loop.

       HALT            ; Halt.

MINUS   .FILL xFFD0    ; #-48
PROMPT1 .STRINGZ "Encryption Key (1 -9): "
PROMPT2 .STRINGZ "\nInput Message: "
PROMPT3 .STRINGZ "Encrypted Message: " 
INPUT   .BLKW #21
        .END
