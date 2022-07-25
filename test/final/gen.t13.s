
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
L1 :
	subu $sp,$sp,8
	sw $ra,0($sp)
	jal Lgetchar

	move $t0,$v0
	sw $t0,4($sp)
	lw $t0,4($sp)
	lw $t1,G0
sne $t2,$t0,$t1
	beqz $t2,L3
	jal L1

	lw $t0,4($sp)
	move $a0,$t0
	jal Lprintc

L3 :
L2 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
L0 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	li $t0,10
	sw $t0,G0
	jal L1

L4 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
