##CS 254 Program 8                                  #
##                                                  #
##Convert Celsius value to Farenheit                #
##Formula: ((x / (a/b))+32.0)                       #
##Programmer:Christiano Carta                       #
##Date:11/29/2022                                   #
##                                                  #
##SPIM: PsuedoInstructions:ON EH:ON, all else off   #
##                                                  #
##Register use table:                               #
##$f0 -- x (Celsius Input)                          #
##$f1 -- constant a, then quotient (a/b)            #
##$f2 -- constant b, then c                         #
#####################################################


    .text
    .globl main
main:
    la $a0,input        #ask for x (celsius)
    li $v0,4            #print string
    syscall
    
    li $v0,6            #read in float(x)
    syscall

    l.s $f1,a           #get constant a
    l.s $f2,bb          #get constant b
    div.s $f1,$f1,$f2   #a/b
    l.s $f2,c           #get constant c
    div.s $f0,$f0,$f1   #x/(a/b)
    add.s $f0,$f0,$f2   #x/(a/b)+c
    
    la $a0,output       #print farenheit promp
    li $v0,4            #print string
    syscall
    
    mov.s $f12, $f0     #$f12 = farenheit conversion of x
    li $v0,2            #print float
    syscall
    
    la $a0,nl           #print newline
    li $v0,4            #print string
    syscall
    
    li $v0,10           #code 10 == exit
    syscall             #return to OS.

##
##Data Segment
##
    .data
input:  .asciiz "\nTemperature in Celsius:"
output: .asciiz "\nFarenheit Conversion:"
nl:     .asciiz "\n"

a:      .float  5.0
bb:      .float 9.0
c:      .float  32.0


