
			.text
			.globl main
		main:
		
	jal L0


			li $v0,10
			syscall
		
L0 :
	subu $sp,$sp,8
	sw $ra,0($sp)
	li $t0,0
	sw $t0,4($sp)
L3 :
	lw $t0,4($sp)
	li $t1,46
sle $t2,$t0,$t1
	beqz $t2,L4
	.data
LS0 :
	.byte  102 , 105 , 98 , 40 , 0
	.align 2
	.text
	la $s8,LS0
	move $a0,$s8
	jal Lprints

	lw $t0,4($sp)
	move $a0,$t0
	jal Lprinti

	.data
LS1 :
	.byte  41 , 32 , 61 , 32 , 0
	.align 2
	.text
	la $s8,LS1
	move $a0,$s8
	jal Lprints

	lw $t1,4($sp)
	move $a0,$t1
	jal L1

	move $t0,$v0
	move $a0,$t0
	jal Lprinti

	.data
LS2 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS2
	move $a0,$s8
	jal Lprints

	lw $t1,4($sp)
	li $t0,1
addu $t3,$t1,$t0
	sw $t3,4($sp)
	j L3
L4 :
L2 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
L1 :
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $a0,4($sp)
	lw $t0,4($sp)
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L6
	li $t3,0
	move $v0,$t3
	j L5
L6 :
	lw $t0,4($sp)
	li $t1,1
seq $t2,$t0,$t1
	beqz $t2,L7
	li $t3,1
	move $v0,$t3
	j L5
L7 :
	lw $t0,4($sp)
	li $t1,1
subu $t3,$t0,$t1
	move $a0,$t3
	jal L1

	move $t0,$v0
	lw $t1,4($sp)
	li $t3,2
subu $t4,$t1,$t3
 subu $sp,$sp,4
 sw $t0,0($sp)
	move $a0,$t4
	jal L1
 lw $t0,0($sp)
addu $sp,$sp,4
	move $t1,$v0
addu $t3,$t0,$t1
	move $v0,$t3
	j L5
	.data
LS3 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 102 , 105 , 98 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS3
	j error
L5 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
