##CS 254 Program 7                                  #
##                                                  #
##Enter seed and how many random ints are desired.  #
##                                                  #
##Programmer:                                       #
##Date:                                             #
##                                                  #
##Register use table:                               #




    .text 
    .globl main
main:
    li $v0, 4                               ##
    la $a0, string                          ##
    syscall                                 ##
    li $v0, 5                               ##
    syscall                                 ##
    move $t1, $v0                           ##
                                            ##
    li $v0, 4                               ##
    la $a0, string1                         ##
    syscall                                 ##print question
    li $v0, 5                               ##read int
    syscall                                 ##get amount of numbers desired
    move $t2, $v0                           ##put in $t2
    addiu $t2, 1                            ##input over, this will be our counter endcon
                            
    ori $s1, $0, 21                         ##initiate all constants for equation
    ori $s2, $0, 53                         ##
    ori $s3, $0, 100                        ##
    ori $s7, $0, 1                          ##initiate counter
    
loopstrt:sltu $t5,$s7, $t2                  ##counter < endcon, $t5=1
        beq $t5, $zero,endLP                ##endloop conditions
        mult $t1, $s1                       ##start building equation
        mflo $t3                            ##product in $t3
        nop                                 ##
        nop                                 ##
        addu $t3, $t3, $s2                  ##(5*21+53)
        div  $t3, $s3                       ##(5*21+53) / 100
        mfhi $t1                            ##(new seed) $t3 = (5*21+53) % 100
        sw $t1,intx                         ##store mod in $t1
        li $v0, 1                           ##prep syscall for integer print
        lw $a0, intx                        ##print int
        syscall                             ##print integer
        li $v0, 4                           ##prep syscall for string print
        la $a0,newline                      ##load newline string 
        syscall                             ##print syscall
        addiu $s7, 1                        ##increment counter
        j loopstrt                          ##back to start of loop
    
endLP:                                      ##
        li $v0, 4                           ##
        la $a0, string2                     ##
        syscall                             ##
                                            ##
        li $v0, 10                          ##
        syscall                             ##
.data
string: .asciiz "\nInput Seed: "            ##
string1: .asciiz "How Many? : "             ##
string2: .asciiz "Done.\n"                  ##
newline: .asciiz "\n"                       ##
intx   : .word 0                            ##

