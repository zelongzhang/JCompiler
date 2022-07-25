
			.text
			.globl main
		main:
		
	jal L0


			li $v0,10
			syscall
		
L1 :
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $a0,4($sp)
	lw $t0,4($sp)
	lw $t1,4($sp)
mul $t2,$t0,$t1
	li $t0,0
slt $t3,$t2,$t0
	beqz $t3,L3
	li $t1,123
	move $v0,$t1
	j L2
L3 :
	.data
LS0 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 102 , 111 , 111 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS0
	j error
L2 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
L0 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	li $t0,-1
	move $a0,$t0
	jal L1

	move $t1,$v0
L4 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
