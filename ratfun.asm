#####################################################################
## CS 254 Program 6                                                 #
##                                                                  #
## Compute Rational Function (8x^2-3x+12) / (x^2+2x-15)             #
##                                                                  #
## Programmer: Christiano Carta                                     #
## Date: October 25, 2022                                           #
#########################################################################
##                           Register Log                               #
##$10 is base register                                                  #
##$11 < x                                                               #
##$25 < +1                                                              #
##$8  < 8                                                               #
##8(x)                                                                  #
##$5 < product                                                          #
##nop                                                                   #
##nop                                                                   #
##8(x)-3                                                                #
##(8x-3)(x)                                                             #
##$5 < product                                                          #
##nop                                                                   #
##nop                                                                   #
##$5 < (8x^2 -3x)+12                                                    #
##$6 < x                                                                #
##x+2                                                                   #
##(x+2)(x)                                                              #
##$6 < product                                                          #
##nop                                                                   #
##nop                                                                   #
##(x^2 + 2x)-15                                                         #
##if (equation 2 == 0)                                                  #
##nop                                                                   #
##equation 1 / equation 2                                               #
##$1 < quotient                                                         #
##$2 < remainder                                                        #
##nop                                                                   #
##nop                                                                   #
##store quotient to ratio symbol                                        #
##store remainder to remain symbolic address                            #
##nop                                                                   #
##nop                                                                   #
##jump to end of program                                                #
##nop                                                                   #
##if condition = true, then                                             #
##store 1 in error symbolic address                                     #
##nop                                                                   #
##nop                                                                   #
##common end of program line                                            #
##                                                                      #
#########################################################################


    .text
    .globl main

main:
    lui, $10, 0x1000    #register 10 contains address 0x1000 (x)
    lw   $11, 0($10)    #register 11=x
    or   $25, $0, 0x1   #load a 1 into register 25
    or   $8, $0, 0x8    #load an 8 into register 8, begin generating first parenthese
    mult $11, $8        #x(8)
    mflo $5             #put product in register 5
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    addiu $5, $5, -3    #8x-3
    mult $5, $11        #(8x-3)(x)
    mflo $5             #put product in register 5
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    addiu $5, 0xC       #register 5 contains (8x^2 - 3x)+12 , first parenthese done
    or $6, $0, $11      #load x into register 6 , begin generating second parenthese
    addiu $6, 0x2       #register 6 += 2
    mult $6, $11        #(x+2)(x)
    mflo $6             #put product into register 6
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    addiu $6, $6, -15   #(x^2 + 2x)-15 , second parenthese done
    beq $6, $0, equal   #if equation 6 is equal to zero
    sll $0, $0, 0       #nop
    div $5, $6          #equation 1 / equation 2
    mflo $1             #put quotient in register 1
    mfhi $2             #put remainder in register 2
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    sw $1,8($10)        #store quotient to ratio symbolic address
    sw $2,12($10)       #store remainder to remainder symbolic address
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
    j  cont             #jump to end of program
    sll $0, $0, 0       #nop
equal:                  #if (second equation == 0 ) is true 
    sw $25, 4($10)      #store 1 to "error" symbolic address in memory
    sll $0, $0, 0       #nop
    sll $0, $0, 0       #nop
cont: sll $0, $0, 0     #condition true, end of program

    .data
x:      .word 3        #address 0x10000000 , "x" will serve as x value
error:  .word 0         #address 0x10000004 , "error" set to 0
ratio:  .word 0         #address 0x10000008 , "ratio" set to 0
remain: .word 0         #address 0x1000000c , "remain" set to 0 

##EOF
