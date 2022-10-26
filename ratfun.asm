#####################################################################
## CS 254 Program 6                                                 #
##                                                                  #
## Compute Rational Function (8x^2-3x+12) / (x^2+2x-15)             #
##                                                                  #
## Programmer: Christiano Carta                                     #
## Date: October 25, 2022                               #############
#########################################################


    .data
x:      .word 3         #address 0x10000000 , "x" will serve as x value
error:  .word 0         #address 0x10000004 , "error" set to 0
ratio:  .word 0         #address 0x10000008 , "ratio" set to 0
remain: .word 0         #address 0x1000000c , "remain" set to 0 

    .text
    .globl main

main:
    lui, $10, 0x1000    #register 10 contains address 0x1000 (x)
    or   $29, $0, 0x1   #load a 1 into register 29
    or   $8, $0, 0x8    #load an 8 into register 8, begin generating first parenthese
    mult $10, $8        #x(8)
    mflo $5             #put product in register 5
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    addiu $5, $5, -3    #8x-3
    mult $5, $10        #(8x-3)(x)
    mflo $5             #put product in register 5
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    addiu $5, 0xC       #(8x^2 - 3x)+12 , first parenthese done
    or $6, $0, $10      #load x into register 10 , begin generating second parenthese
    addiu $6, 0x2       #register 6 += 2
    mult $6, $10        #(x+2)(x)
    mflo $6             #put product into register 6
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    addiu $6, $6, -15   #(x^2 + 2x)-15 , second parenthese done
    beq $6, $0, equal
    sll $0, $0, 0       #nop
    div $5, $6
    mflo $1
    mfhi $2
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    sw $1, 8($10)
    sw $2, 12($10)
    j  cont            #jump to end of program
    sll $0, $0, 0       #nop
equal:
    sw $29, 4($10)
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
cont: sll $0, $0, 0


##EOF