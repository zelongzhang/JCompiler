
			.text
			.globl main
		main:
		
	jal L0


			li $v0,10
			syscall
		
L0 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	.data
LS0 :
	.byte  97 , 115 , 100 , 102 , 0
	.align 2
	.text
	la $s8,LS0
	move $a0,$s8
	jal Lprints

	.data
LS1 :
	.byte  8 , 9 , 10 , 12 , 13 , 34 , 39 , 92 , 0
	.align 2
	.text
	la $s8,LS1
	move $a0,$s8
	jal Lprints

	.data
LS2 :
	.byte  1 , 26 , 0
	.align 2
	.text
	la $s8,LS2
	move $a0,$s8
	jal Lprints

	li $t0,1
	beqz $t0,L2
	.data
LS3 :
	.byte  0 , 32 , 97 , 115 , 100 , 102 , 0
	.align 2
	.text
	la $s8,LS3
	move $a0,$s8
	jal Lprints

L2 :
	li $t1,0
	move $a0,$t1
	jal Lprintc

L1 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
