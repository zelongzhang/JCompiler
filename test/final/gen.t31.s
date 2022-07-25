
			.text
			.globl main
		main:
		
	jal L0


			li $v0,10
			syscall
		
	.data
G0 :
	.word 0
	.text
	.data
G1 :
	.word 0
	.text
L0 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	li $t0,12
	sw $t0,G0
	jal L1

	lw $t0,G0
	lw $t1,G1
	li $t2,2
subu $t3,$t1,$t2
	bnez $t3,L3
	.data
LS0 :
	.byte  100 , 105 , 118 , 105 , 115 , 105 , 111 , 110 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 0
	.align 2
	.text
	la $a0,LS0
	j error
L3 :
div $t1,$t0,$t3
	move $a0,$t1
	jal Lprinti

L2 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
L1 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	li $t0,2
	sw $t0,G1
L4 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
