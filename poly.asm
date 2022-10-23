## CS 254 Program 4 Fall 2022                  #
##                                             # 
## Compute Polynomial (17x - 10xy + 28) / 5    #
##                                             #
## Programmer: Chhristiano Carta               #
## Date: 10/22/2022                            #
################################################
###########Register Logs########################
##load register 10 with address 0x1000         #
##load register 11 with x                      #
##load register 12 with y                      #
##load register 20 with 17                     #
##load register 25 with 10                     #
##load register 13 with 28                     #
##17(x)                                        #
##product > register 14                        #
##nop                                          #
##nop                                          #
##17x + 28 > register 13                       #
##10(x)                                        #
##product > register 26                        #
##nop                                          #
##nop                                          #
##10(x)(y)                                     #
##product > register 27                        #
##nop                                          #
##nop                                          #
##(17x +28) - 10xy                             #
##(17x - 10xy + 28) / 5                        #
##qoutient > register 1                        #
##remainder > register 2                      #
##nop                                          #
##nop                                          #
##store register 1 in register 0x10000008      #
##store register 2 in register 0x1000000c      #
################################################

    .data
x: .word -3            #Put x in address 0x10000000
y: .word -1            #Put y in address 0x10000004
answer: .word 0       #Set address 0x10000008 to answer
remainder: .word 0    #Set address 0x1000000c to remainder

    .text
    .globl main
main:
    lui, $10, 0x1000   #register 10 contains address 0x1000 (x)
    lw  $11, 0($10)    #load register 11 with x
    lw  $12, 4($10)    #load register 12 with y
    ori $20, $0, 0x11  #load register 20 with 17
    ori $25, $0, 0xA   #load register 25 with 10
    ori $13, $0, 0x1C  #load register 13 with 28
    mult $20, $11      #17(x)
    mflo $14           #put that product in register 14
    sll $0, $0, 0      #nop
    sll $0, $0, 0      #nop
    addu $13, $13, $14 #add 28 to 17x and store in 13 (accumulator)
    mult $25, $11      #10(x)
    mflo $26           #put product in register 26
    sll $0, $0, 0      #nop
    sll $0, $0, 0      #nop
    mult $26, $12      #10x(y)
    mflo $27           #put product in register 27
    sll $0, $0, 0      #nop
    sll $0, $0, 0      #nop
    subu $13, $13, $27 #(17x + 28) -10xy
    div $13, $13, 5    #(17x - 10xy + 28) / 5
    mflo $1            #quotient in register 1 
    mfhi $2            #remainder in register 2
    sll $0, $0, 0      #nop
    sll $0, $0, 0      #nop
    sw $1, 8($10)      #store register 1 in register 0x10000008
    sw $2, 12($10)     #store register 2 in register 0x1000000c



##EOF