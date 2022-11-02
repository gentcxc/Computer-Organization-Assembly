##CS 254                                            
##
##Compute even and odd sums leading up to n 
##
##Programmer: Christiano Carta
##Date: November 2, 2022
######################################################

    .text
    .globl main
    
main:
    lui $10,0x1000           #register 10 contains address 0x1000 (x)
    lw   $11,0($10)          #$11 = n
    sll $0, $0, $0           #nop
    or $3, $0, 0x2           #divide value, determines odd/even
    addu $11, $11, 1         #n++ , will be used as endlp condition
    or $8, $0, 0x1           #8 is counter
loopstrt: sltu $9, $8, $11   #loop for counter < n+1 
    beq $9, $0, endLp        #condition false, kill loop
    sll $0, $0 $0            #branch delay
    divu $8, $3              #divide counter by 2
    mfhi $4                  #move remainder into $4
    sll $0, $0 $0            #nop
    sll $0, $0 $0            #nop
    beq $4, $0,even          #determine if counter is odd or even
    sll $0, $0 $0            #branch delay
    addu $1, $1, $8          #if odd, add to register one, form be oddsum
    addiu $8, $8, 1          #increment counter
    j loopstrt               #jump to top of loop
    sll $0, $0 $0            #branch delay
even: addu $2, $2, $8        #if even, add counter to $2, form evensum
    addiu $8, $8, 1          #increment counter
    j loopstrt               #jump to top of loop
endLp: sll $0, $0, $0        #nop
    sw $1, 8($10)            #store oddsum in symbolic address
    sw $2, 4($10)            #store evensum in symbolic address

    .data
N:          .word 1          #symbolic address for n at 0x10000000
evensum:    .word 0          #symbolic address for evensum at 0x10000004
oddsum:     .word 0          #symbolic address for oddsum at 0x10000008

#EOF
