; Justin Mo

      .ORIG x3300
      ST R2, SAVER2     ; Save R2
READ  LDI R0, KBSR      ; Get the keyboard status.
      BRzp READ         ; Poll the keyboard.
      LDI R0, KBDR      ; Get the typed key.
      LD R2, MINUS      ; Load xFFD0 into R2.

WRITE LDI R1, DSR       ; Get the display status.
      BRzp WRITE        ; Poll the display.
      STI R0, DDR       ; Print the typed key.

      ADD R0, R2, R0    ; Subtract R2 from R0 to convert ASCII to integer and store in R0.
      LD R2, SAVER2     ; Saved R2
      RET               ; Return

KBSR    .FILL xFE00 ; KBSR
KBDR    .FILL xFE02 ; KBDR
DSR     .FILL xFE04 ; DSR
DDR     .FILL xFE06 ; DDR
MINUS   .FILL xFFD0 ; #-48
SAVER2  .FILL x0000 ; Saved R2
        .END   