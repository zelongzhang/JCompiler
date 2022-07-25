
			.text
			.globl main
		main:
		
	jal L0


			li $v0,10
			syscall
		
L0 :
	subu $sp,$sp,8
	sw $ra,0($sp)
L2 :
	jal Lgetchar

	move $t0,$v0
	sw $t0,4($sp)
	li $t1,-1
sne $t2,$t0,$t1
	beqz $t2,L3
	lw $t0,4($sp)
	move $a0,$t0
	jal Lprintc

	j L2
L3 :
L1 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
