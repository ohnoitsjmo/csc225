        .ORIG x3500

        ; Question 1
Q1STR   .FILL Q1  ; Address of prompt
Q1PTS   .FILL #2 ; Point value for option 1
        .FILL #0  ; Point value for option 2
        .FILL #5  ; Point value for option 3
        .FILL #10  ; Point value for option 4

        ; Question 2
Q2STR   .FILL Q2
Q2PTS   .FILL #1
        .FILL #2
        .FILL #0
        .FILL #10

        ; Question 3
Q3STR   .FILL Q3
Q3PTS   .FILL #5
        .FILL #0
        .FILL #10
        .FILL #7

        ; Results
RESULTS .FILL GOODMSG
        .FILL PASSMSG
        .FILL FAILMSG

        ; Strings must be declared separately because their lengths are variable.
Q1      .STRINGZ "\nWho's the best professor?\n    1) Chris\n    2) Almost Chris\n    3) Super Chris\n    4) Only Chris\n"
Q2      .STRINGZ "\nWhat's the best major?\n    1) Computer Science\n    2) Computer Sciences\n    3) Computer Information and Sciences\n    4) Computers\n"
Q3      .STRINGZ "\nWhat's 1+1?\n    1) 0\n    2) 8\n    3) 6\n    4) 7\n"

GOODMSG .STRINGZ "EZ."
PASSMSG .STRINGZ "NBD."
FAILMSG .STRINGZ "BAD."

        .END
