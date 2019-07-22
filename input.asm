.data
array1: .word 0x10000000
size: .word 6

.text
lw x10 array1
lw x11 size

addi x18 x0 5
sw x18 0(x10)

addi x18 x0 10
sw x18 4(x10)

addi x18 x0 20
sw x18 8(x10)

addi x18 x0 3
sw x18 12(x10)

addi x18 x0 12
sw x18 16(x10)

addi x18 x0 1
sw x18 20(x10)

jal x1 bubble

bubble: addi x2 x2 -8
sw x11 4(x2)
sw x1 0(x2)
addi x20 x0 2
bge x11 x20 ELSE
lw x1 0(x2)
lw x11 4(x2)
jal x0 EXIT

ELSE: addi x9 x0 0
addi x11 x11 -1
addi x20 x0 1
bge x11 x20 LOOP
beq x0 x0 bubble

LOOP: bge x9 x11 ELSE
slli x7 x9 2
add x7 x10 x7
lw x6 0(x7)
lw x5 4(x7)
addi x25 x0 25 
blt x5 x6 SWAP
addi x9 x9 1
beq x0 x0 LOOP

SWAP: sw x5 0(x7)
sw x6 4(x7)
addi x9 x9 1
beq x0 x0 LOOP

EXIT:  
fall_through


