
			.text
			.globl main
		main:
		
	jal L0


			li $v0,10
			syscall
		
L0 :
	subu $sp,$sp,12
	sw $ra,0($sp)
	li $t0,0
	sw $t0,4($sp)
L2 :
	lw $t0,4($sp)
	li $t1,10
slt $t2,$t0,$t1
	beqz $t2,L3
	lw $t0,4($sp)
	move $a0,$t0
	jal Lprinti

	.data
LS0 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS0
	move $a0,$s8
	jal Lprints

	li $t1,100
	sw $t1,8($sp)
L4 :
	lw $t0,8($sp)
	li $t1,110
slt $t2,$t0,$t1
	beqz $t2,L5
	lw $t0,8($sp)
	move $a0,$t0
	jal Lprinti

	.data
LS1 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS1
	move $a0,$s8
	jal Lprints

	lw $t1,8($sp)
	li $t0,105
seq $t2,$t1,$t0
	beqz $t2,L6
	j L5
L6 :
	lw $t1,8($sp)
	li $t0,1
addu $t3,$t1,$t0
	sw $t3,8($sp)
	j L4
L5 :
	lw $t1,4($sp)
	li $t0,5
seq $t2,$t1,$t0
	beqz $t2,L7
	j L3
L7 :
	lw $t3,4($sp)
	li $t1,1
addu $t0,$t3,$t1
	sw $t0,4($sp)
	j L2
L3 :
L1 :
	lw $ra,0($sp)
	addu $sp,$sp,12
	jr $ra
