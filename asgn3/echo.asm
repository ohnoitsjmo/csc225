; Echoes typed characters to the terminal.
; R0 - The current character

       .ORIG x3000
IOLOOP GETC         ; Read a character.
       OUT          ; Write the character.
       BRnzp IOLOOP ; Loop infinitely.
       HALT         ; Halt.
       .END
