// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@SCREEN
D=A
@ScreenRegIndex
M=D

(LOOP)    
    // ist taste gedrückt spring zu FILLBLACK 
    @KBD
    D=M   
    @FILLBLACK
    D; JGT 
    @FILLWHITE
    D; JEQ
    (FILLREGRETURN)
    

    // @ScreenRegIndex Increment
    @ScreenRegIndex
    M=M+1

    // wenn counter = 24575 setze wieder auf SCREEN
    @24575
    D=A
    @ScreenRegIndex //wenn screenregindex 
    D=D-M
    @RESETSCREENREG
    D;JEQ
    (RESETSCREENREGRETURN) // zurückspringpunkt für screenRegIndex

    @LOOP // Sprung zurück zum start
    M;JMP 


(RESETSCREENREG) // Resesttet den ScreenRegIndex auf das erste Screen Register
    @SCREEN
    D=A
    @ScreenRegIndex
    M=D
    @RESETSCREENREGRETURN
    0;JMP 

(FILLBLACK) // füllt ein register Schwarz
    D=0
    D=!D
    @ScreenRegIndex
    A=M
    M=D
    @FILLREGRETURN
    0; JMP

(FILLWHITE) // füllt ein register weiß
    @ScreenRegIndex
    M=-1
    @FILLREGRETURN
    0; JMP