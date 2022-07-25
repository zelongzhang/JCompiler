
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
	li $t0,1000000
	sw $t0,8($sp)
L2 :
	lw $t0,4($sp)
	lw $t1,4($sp)
	lw $t2,8($sp)
subu $t3,$t1,$t2
sgt $t4,$t0,$t3
	beqz $t4,L3
	lw $t1,4($sp)
	lw $t2,8($sp)
addu $t0,$t1,$t2
	sw $t0,4($sp)
	j L2
L3 :
	lw $t3,4($sp)
	lw $t1,8($sp)
subu $t2,$t3,$t1
	sw $t2,4($sp)
L4 :
	lw $t0,4($sp)
	lw $t3,4($sp)
	li $t1,1
subu $t2,$t3,$t1
sgt $t4,$t0,$t2
	beqz $t4,L5
	lw $t3,4($sp)
	li $t1,1
addu $t0,$t3,$t1
	sw $t0,4($sp)
	j L4
L5 :
	.data
LS0 :
	.byte  109 , 105 , 110 , 105 , 110 , 116 , 32 , 105 , 115 , 32 , 0
	.align 2
	.text
	la $s8,LS0
	move $a0,$s8
	jal Lprints

	lw $t2,4($sp)
	move $a0,$t2
	jal Lprinti

	.data
LS1 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS1
	move $a0,$s8
	jal Lprints

L1 :
	lw $ra,0($sp)
	addu $sp,$sp,12
	jr $ra
