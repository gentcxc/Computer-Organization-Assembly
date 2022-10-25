#####################################################################
## CS 254 Program 6                                                 #
##                                                                  #
## Compute Rational Function (8x^2-3x+12) / (x^2+2x-15)             #
##                                                                  #
## Programmer: Christiano Carta                                     #
## Date: October 25, 2022                               #############
#########################################################


    .data
x:      .word 3
ratio:  .word 0
remain: .word 0

    .text
    .globl main

main:
    lui, $10, 0x1000    #register 10 contains address 0x1000 (x)
    or   $8, $0, 0x8    #load an 8 into register 8
    mult $10, $8        #x(8)
    mflo $5             #put product in register 5
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    subiu $5, $5, 0x3   #8x-3
    mult $5, $10        #(8x-3)(x)
    mflo $5             #put product in register 5
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    addiu $5, 0xC       #(8x^2 - 3x)+12 , first parenthese done
    or $6, $0, $10      #load x into register 10
    addiu $6, 0x2       #register 6 += 2
    mult $6, $10        #(x+2)(x)
    mflo $6             #put product into register 6
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    subiu $6, $6, 0xF   #(x^2 + 2x)-15 , second parenthese done
    