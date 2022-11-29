##CS 254 Program 8
##
##Convert Celsius value to Farenheit 
##
##Programmer:Christiano Carta
##Date:11/29/2022
##
##
##Register use table:




    .text
    .globl main
main:
    li $v0,4
    la $a0,input
    syscall
    li $v0,6
    syscall
    mov.s $f0,$v0

    li.s $f1,32.0
    
    
.data
input: .asciiz "\nTemperature in Celsius:"
output: .asciiz "\nFarenheit Conversion:"

https://programmedlessons.org/AssemblyTutorial/Chapter-31/ass31_13.html
