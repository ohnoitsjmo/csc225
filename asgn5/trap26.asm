; Justin Mo

        .ORIG x3300

        ST R0, SAVER0
        ST R1, SAVER1
        ST R2, SAVER2
        ST R3, SAVER3
        ST R4, SAVER4
        ST R5, SAVER5
        ST R6, SAVER6
        LD R1, PCSTORE
	STR R7, R1, #0
        LDI R1, KBSR     ; Enable keyboard interrupt.
        LD R2, MASK      ; Enable bit 14
        NOT R4, R1
        NOT R5, R2
        AND R6, R4, R5
        NOT R3, R6
        STI R3, KBSR
        LD R6, SAVER6
        LD R5, SAVER5
        LD R4, SAVER4
        LD R3, SAVER3
        LD R2, SAVER2
        LD R1, SAVER1
        LD R0, SAVER0
        LD R7, CHANGE
        JMP R7

SAVER0  .FILL x00
SAVER1  .FILL x00
SAVER2  .FILL x00
SAVER3  .FILL x00
SAVER4  .FILL x00
SAVER5  .FILL x00
SAVER6  .FILL x00
PCSTORE .FILL x32FF
CHANGE  .FILL x3400
MASK    .FILL x4000
KBSR    .FILL xFE00
.END
