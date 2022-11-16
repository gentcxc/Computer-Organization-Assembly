##CS 254 Program 7
##  
##Enter seed and how many random ints are desired.
##
##Programmer:
##Date:
##
##Register use table:


.data
string: .asciiz "\nInput Seed: "
string1: .asciiz "How Many? : "


    .text 
    .globl main
main:
    li $v0, 4
    la $a0, string
    syscall
    li $v0, 5
    syscall
    move $s0, $v0
    li $v0, 4
    la $a0, string1
    syscall
    li $v0, 5
    syscall
    move $s1, $v0##input over


https://chortle.ccsu.edu/AssemblyTutorial/Chapter-21/ass21_2.html
