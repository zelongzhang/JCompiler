
			.text
			.globl main
		main:
		
	jal L0


			li $v0,10
			syscall
		
L0 :
	subu $sp,$sp,20
	sw $ra,0($sp)
	li $t0,2
	sw $t0,4($sp)
	li $t0,1
	sw $t0,12($sp)
	li $t0,0
	sw $t0,16($sp)
	.data
LS0 :
	.byte  102 , 105 , 98 , 40 , 48 , 41 , 32 , 61 , 32 , 48 , 10 , 0
	.align 2
	.text
	la $s8,LS0
	move $a0,$s8
	jal Lprints

	.data
LS1 :
	.byte  102 , 105 , 98 , 40 , 49 , 41 , 32 , 61 , 32 , 49 , 10 , 0
	.align 2
	.text
	la $s8,LS1
	move $a0,$s8
	jal Lprints

L2 :
	lw $t0,4($sp)
	li $t1,47
slt $t2,$t0,$t1
	beqz $t2,L3
	.data
LS2 :
	.byte  102 , 105 , 98 , 40 , 0
	.align 2
	.text
	la $s8,LS2
	move $a0,$s8
	jal Lprints

	lw $t0,4($sp)
	move $a0,$t0
	jal Lprinti

	.data
LS3 :
	.byte  41 , 32 , 61 , 32 , 0
	.align 2
	.text
	la $s8,LS3
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	lw $t0,16($sp)
addu $t3,$t1,$t0
	sw $t3,8($sp)
	lw $t1,8($sp)
	move $a0,$t1
	jal Lprinti

	lw $t0,12($sp)
	sw $t0,16($sp)
	lw $t3,8($sp)
	sw $t3,12($sp)
	.data
LS4 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS4
	move $a0,$s8
	jal Lprints

	lw $t1,4($sp)
	li $t0,1
addu $t3,$t1,$t0
	sw $t3,4($sp)
	j L2
L3 :
L1 :
	lw $ra,0($sp)
	addu $sp,$sp,20
	jr $ra
