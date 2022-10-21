.data
x: .word 13
y: .word 17
answer: .word 0
remainder: .word 0

.text
.globl main
lui $10, 0x1000
lw  $11, 0($10)
lw  $12, 4($10)
ori $20, $0, 0x11
ori $25, $0, 0xA
ori $13, $0, 0x1C
ori $5,  $0, 0x5
mult$20, $11
mflo$14
sll $0, $0
sll $0, $0
addiu $13, $13, $14
mult$25, $11
mflo$26
sll $0, $0
sll $0, $0
mult$26, $12
mflo $27
sll $0, $0
sll $0, $0
subu$13, $27
div $13, $13, $5
mflo $1
mfhi $2
sll $0, $0
sll $0, $0
sw $1, 8($10)
sw $2, 12($10)
