; Justin Mo

        .ORIG x3500

        LDI R0, KBDR        ; Load input into R0.
        AND R1, R1, #0
        STI R1, KBSR        ; Clear KBSR.
        LDI R1, PCSTORE
	STR R1, R6, #0
        RTI

PCSTORE     .FILL x32FF
KBDR        .FILL xFE02
KBSR        .FILL xFE00
            .END