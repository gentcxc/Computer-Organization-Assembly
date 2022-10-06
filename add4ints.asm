## CS 254 Program 1 Fall 2022
## 
## Compute a + b + c + d
## 
## Programmer: Chhristiano Carta
## Date: 09/19/2022
## CS 254 Program 1 Fall 2022
## 
## Compute a + b + c + d
## 
## Programmer: Chhristiano Carta
## Date: 09/19/2022


  .text               #Communicates to assembler that the following is ".text"
  .globl main         #Directive, stating main will be used outside this source file

main:                 #symbolic address for first machine instruction
  ori $8, $0, 0x1     #loads register 8 with positive one.
  ori $9, $0, 0x2     #loads register 9 with positive two
  ori $11, $0, 0x3    #loads register 11 with positive three.
  ori $12, $0, 0x4    #loads register 12 with positive four.
  addu $13, $8, $9    #loads register 13 with additive result of registers 8 and 9.
  addu $14, $11, $12  #loads register 14 with additive result of registers 11 and 12.
  addu $10, $13, $14  #loads register 10 with additive result of registers 13 and 14.


##EOF               
