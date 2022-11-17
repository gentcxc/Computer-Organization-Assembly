##CS 254 Program 7                                  #
##                                                  #
##Enter seed and how many random ints are desired.  #
##                                                  #
##Programmer:Christiano Carta                       #
##Date:11/17/2022                                   #
##                                                  #
##Register use table:                               #
##$v0 set to print a string
##choose string 
##print string
##$v0 set to read int
##read int
##put in in register
##
##$v0 set to print string
##load string
##print string
##$v0 set to read int
##read int
##put int in register
##add 1 to register, will be endcon
##init constant
##init constant
##init constant
##init counter to be used in loop
##counter < endcon
##  true
##      seed x * constant(5)
##      mv prodouct to register
##      nop
##      nop
##      product + constant(53)
##      sum / constant(100)
##      get mod, put in register
##      store mod in symbolic address
##      set $v0 to print integer
##      load symb address as int
##      print integer to console
##      set $v0 to print string
##      load newline string
##      print newline(neatens output)
##      increment counter
##      go to start of loop
##  false
##      break loop
##
##set $v0 to print string
##load final string ("done")
##print final string
##set $v0 to exit
##exit
#####################################################
    .text 
    .globl main
main:
    li $v0, 4                               ##prep syscall for print string
    la $a0, string                          ##load string
    syscall                                 ##print question
    li $v0, 5                               ##prep syscall for read int
    syscall                                 ##read int
    move $t1, $v0                           ##put int in $t1
                                            ##
    li $v0, 4                               ##prep syscall for print string
    la $a0, string1                         ##load question
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
    
endLP:                                      ##endloop con
        li $v0, 4                           ##prep syscall for print string
        la $a0, string2                     ##load final string
        syscall                             ##print final string
                                            ##
        li $v0, 10                          ##prep syscall for exit
        syscall                             ##exit
.data
string: .asciiz "\nInput Seed: "            ##"Input Seed" for console printing
string1: .asciiz "How Many? : "             ##"How Many" for console printing
string2: .asciiz "Done.\n"                  ##"Done" for end of program console print
newline: .asciiz "\n"                       ##newline character for formatting
intx   : .word 0                            ##used for storing and printing integers in sequence

