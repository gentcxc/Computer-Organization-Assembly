## CS 254 Program 2             #
##                              #
## Compute 11*x                 #
##                              #
##Programmer: Christiano Carta  #
##Date: September 30, 2022      #
         Register Log           ##########################################
   load register 9 with x value                                          #
   load register ten with x                                              #
   shift x to the left once and load it into register 8                  #
   add register 10 and 8 and put into register 11                        #
   shift register 10 left rhree times                                    #
   add add register 11 to register ten, creates final sum in register ten#
##########################################################################

  .text
  .globl main

main:


  ori $9, $0, 0x3     #Puts a 3(x) in register 9
  or $10, $9, 0x0     #Load register ten with a 3(x)
  sll $8, $9, 1       #Shift 3(x) once and put into register 8
  addu $11, $10, $8   #Add register 10 and 8 and put into register 11
  sll $10, $10, 3     #Shift register 10 left three times
  addu $10, $10, $11  #Add register 11 to register 10 (final sum)


##EOF
