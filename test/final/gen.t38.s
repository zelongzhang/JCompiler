
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
	subu $sp,$sp,4
	sw $ra,0($sp)
	li $t0,12345
	sw $t0,G0
L2 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
L0 :
	subu $sp,$sp,8
	sw $ra,0($sp)
	jal L1

	lw $t0,G0
	move $a0,$t0
	jal Lprinti

	li $t1,0
	sw $t1,4($sp)
	lw $t1,4($sp)
	move $a0,$t1
	jal Lprintb

L3 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
