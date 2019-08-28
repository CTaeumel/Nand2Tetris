// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@counter // counter auf null setzten
M=0 
@R2 // Ergebniss auf 0 setzten
M=0
@R0 // R0 = 0 stop
D=M
@INFLOOP
D; JEQ
@R1 // R1 = 0 stop
D=M
@INFLOOP
D; JEQ
(LOOP)
    @R1 // load R0
    D=M
    @R2 //add with R1 into D
    M=D+M // save D to R2
    @counter // inc Counter
    M=M+1
    // if counter ungleich R0 Loop
    D=M // load counter to D
    @R0
    A=M // load R0 to A
    D=D-A // Conter - R0
    @LOOP
    D;JLT // if Counter - R0 

(INFLOOP) // Go To Infnite Loop. End Of Prog
    @INFLOOP
    0;JMP









