##CS 254                                            
##
##Compute even and odd sums leading up to n 
##
##Programmer: Christiano Carta
##Date: November 2, 2022
######################################################

    .text
    .globl main
    
main:
    lui $10,0x1000      #register 10 contains address 0x1000 (x)
    lw   $11,0($10)     #$11 = n
    sll $0, $0, $0      #nop
    or $3, $0, 0x2
    addu $11, $11, 1    #n++ , will be used as endlp condition
    or $8, $0, 0x1
loopstrt: sltu $9, $8, $11
    beq $9, $0, endLp   #condition false, kill loop
    sll $0, $0 $0
    divu $8, $3
    mfhi $4
    sll $0, $0 $0
    sll $0, $0 $0
    beq $4, $0,even
    sll $0, $0 $0
    addu $1, $1, $8
    addiu $8, $8, 1
    j loopstrt
    sll $0, $0 $0
even:    sll $0, $0 $0
endLp: sll $0, $0, $0
    .data
N:          .word 1
evensum:    .word 0
oddsum:     .word 0
