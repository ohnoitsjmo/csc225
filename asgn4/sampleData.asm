        .ORIG x3500

        ; Question 1
Q1STR   .FILL Q1  ; Address of prompt
Q1PTS   .FILL #10 ; Point value for option 1
        .FILL #5  ; Point value for option 2
        .FILL #0  ; Point value for option 3
        .FILL #2  ; Point value for option 4

        ; Question 2
Q2STR   .FILL Q2
Q2PTS   .FILL #2
        .FILL #10
        .FILL #1
        .FILL #0

        ; Question 3
Q3STR   .FILL Q3
Q3PTS   .FILL #0
        .FILL #5
        .FILL #7
        .FILL #10

        ; Results
RESULTS .FILL GOODMSG
        .FILL PASSMSG
        .FILL FAILMSG

        ; Strings must be declared separately because their lengths are variable.
Q1      .STRINGZ "\nIn the Von Neumann Model, what is memory?\n    1) An array indexed by addresses\n    2) A hard disk drive\n    3) An input and output device\n    4) A series of punchcards\n"
Q2      .STRINGZ "\nWhat type of instruction is LEA?\n    1) Computational\n    2) Data movement\n    3) Control\n    4) Assembler directive\n"
Q3      .STRINGZ "\nWhat is the max of an unsigned 16-bit value?\n    1) 256\n    2) 32767\n    3) 65536\n    4) 65535\n"

GOODMSG .STRINGZ "Looks like I should make the midterm harder."
PASSMSG .STRINGZ "You won't get partial credit on a real exam."
FAILMSG .STRINGZ "Study harder!"

        .END
