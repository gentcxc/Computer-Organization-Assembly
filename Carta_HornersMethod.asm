#####################################################################
## CS 254 Program 3                                                 #
##                                                                  #
## Compute 2x^4 - 5x^3 + 8x^2 + 13x + 100 Using Horner's Method     #
##                                                                  #
## Programmer: Christiano Carta                                     #
## Date: October 15, 2022                               #############
#########################################################
##                  Register Log                        #
##Load x into register 16                               #
##Load leading coefficient into register 23             #
##Multiply that coef. by x                              #
##Put product in register 23                            #
##Load 5 into register 5                                #
##Subtract it from register 23                          #
##Multiply difference by x                              #
##Put product into register 23                          #
##Add next coefficient to register 23                   #
##Multiply that sum by x                                #
##Put resulting product in register 23                  #
##Add next coefficient to register 23                   #
##Multiply that sum by x                                #
##Put resulting product in register 23                  #
##Add 100 to register 23 for final answer               #
#########################################################
##Note: I Understand that QTSpim will not have pipeline #
##      problems with mflo. Implemented nop as a note   #
##      because trying to use as an operator was causing#
##      syntax errors. Wanted to include for the sake   #
##      of legitimate machine implementation.           #
#########################################################

    .text
    .globl main

main:

    addiu $16, $16, 3    #Load x into register 16
    or    $23, $0,  0x2  #Load leading coefficient into register 23 (step 1)
    mult  $23, $16       #Multiply leading coef. by x
    mflo  $23            #Put product in register 23 (step 2)
    or    $5, $0,   0x5  #Load 5(2nd leading coef.) into register 5
    subu  $23, $23, $5   #Subtract 5 from value in 23 (step 3)
    mult  $23, $16       #Multiply that difference by x
    mflo  $23            #Store the product in register 23 (step 4)
                         #nop
                         #
    addiu $23, $23, 0x8  #Add next coefficient (8) to the value in register 23 (step 5)
    mult  $23, $16       #Multiply that sum by x
    mflo  $23            #Put the product in register 23 (step 6)
                         #nop
                         #
    addiu $23, $23, 0xD  #Add next coefficient (13) to value in register 13 (step 7)
    mult  $23, $16       #Multiply that sum by x
    mflo  $23            #Put the product in register 23 (step 8)
    addiu $23, $23, 0x64 #Add 100 to product, this sum is the final value (step 9)


##EOF

