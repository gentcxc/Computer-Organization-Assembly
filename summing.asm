##CS 254                                             #
##                                                   #
##Compute even and odd sums leading up to n          #
##                                                   # 
##Programmer: Christiano Carta                       #
##Date: November 2, 2022                             #
######################################################
##                 Register Log                     ##
##                                                  ##
##$10 is base register                              ##
##11 = n                                            ##
##nop                                               ##
##put 2 in register 3, this is for dividing         ##
##n++                                               ##
##initialize counter ($8)                           ##
##loopstrt:loop condition, if counter < n+1         ##
##  else end loop                                   ##
##  branch delay                                    ##
##  does counter / 2 have remainder?                ##
##  put remainder in $4                             ##
##  nop                                             ##
##  nop                                             ##
##  if the remainder is 0                           ##
##      counter is even, jump to even               ##
##      branch delay                                ##
##  else                                            ##
##      add counter to $1, oddsum accumulator       ##
##      increment counter                           ##
##      go to start of loop                         ##
##      branch delay                                ##
##  even:                                           ##
##      add counter to $2, evensum accumulator      ##
##      increment counter                           ##
##      go to start of loop                         ##
##      branch delay                                ##
##endLp: end of loop, nop                           ##
##store oddsum in memory                            ##
##store evensum in memory                           ##
##nop                                               ##
##nop                                               ##
##                                                  ##
##                                                  ##
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
loopstrt:   sltu $9, $8, $11         #loop for counter < n+1 
            beq $9, $0, endLp        #condition false, kill loop
            sll $0, $0 $0            #branch delay
            divu $8, $3              #divide counter by 2
            mfhi $4                  #move remainder into $4
            sll $0, $0 $0            #nop
            sll $0, $0 $0            #nop
            beq $4, $0,even          #determine if counter is odd or even
            sll $0, $0 $0            #branch delay
            addu $1, $1, $8          #if odd, add to register one, form oddsum
            addiu $8, $8, 1          #increment counter
            j loopstrt               #jump to top of loop
            sll $0, $0 $0            #branch delay
even:       addu $2, $2, $8          #if even, add to register 2, form evensum
            addiu $8, $8, 1          #increment counter
            j loopstrt               #jump to top of loop
            sll $0, $0 $0            #nop
endLp:      sll $0, $0, $0           #nop
            sw $1, 8($10)            #store oddsum in symbolic address
            sw $2, 4($10)            #store evensum in symbolic address
            sll $0, $0 $0            #nop
            sll $0, $0 $0            #nop
    
    
    .data
N:          .word 19         #symbolic address for n at 0x10000000
evensum:    .word 0          #symbolic address for evensum at 0x10000004
oddsum:     .word 0          #symbolic address for oddsum at 0x10000008

#EOF
