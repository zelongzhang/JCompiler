
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
	subu $sp,$sp,12
	sw $ra,0($sp)
	li $t0,123
	sw $t0,G0
	li $t0,456
	sw $t0,4($sp)
	li $t0,789
	sw $t0,G1
	li $t0,42
	sw $t0,G1
	sw $t0,4($sp)
	sw $t0,G0
	li $t0,10
	sw $t0,8($sp)
	lw $t0,G0
	move $a0,$t0
	jal Lprinti

	lw $t0,8($sp)
	move $a0,$t0
	jal Lprintc

	lw $t0,4($sp)
	move $a0,$t0
	jal Lprinti

	lw $t0,8($sp)
	move $a0,$t0
	jal Lprintc

	lw $t0,G1
	move $a0,$t0
	jal Lprinti

	lw $t0,8($sp)
	move $a0,$t0
	jal Lprintc

L1 :
	lw $ra,0($sp)
	addu $sp,$sp,12
	jr $ra
