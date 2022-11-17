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
    li $v0, 4                        
    la $a0, string                        
    syscall                        
    li $v0, 5                        
    syscall                        
    move $t1, $v0                        
                                          
    li $v0, 4                         
    la $a0, string1                        
    syscall                        
    li $v0, 5                        
    syscall                        
    move $t2, $v0                           ##
    addiu $t2, 1                            ##input over, this will be our counter endcon
                            
    ori $s1, $0, 21
    ori $s2, $0, 53
    ori $s3, $0, 100
    ori $s7, $0, 1
    
loopstrt:sltu $t5,$s7, $t2                  ##counter < endcon, $t5=1
        beq $t5, $zero,endLP
        mult $t1, $s1                       ##start building equation
        mflo $t3
        nop
        nop
        addu $t3, $t3, $s2                  ##(5*21+53)
        div  $t3, $s3                       ##(5*21+53) / 100
        mfhi $t1                            ##(new seed) $t3 = (5*21+53) % 100
        sw $t1,intx
        li $v0, 1
        lw $a0, intx
        syscall
        li $v0, 4
        la $a0,newline
        syscall
        addiu $s7, 1
        j loopstrt
    
endLP:
        li $v0, 4
        la $a0, string2
        syscall
    
        li $v0, 10
        syscall
.data
string: .asciiz "\nInput Seed: "
string1: .asciiz "How Many? : "
string2: .asciiz "Done.\n"
newline: .asciiz "\n"
intx   : .word 0



##https://chortle.ccsu.edu/AssemblyTutorial/Chapter-21/ass21_2.html
