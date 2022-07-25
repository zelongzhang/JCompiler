
			.text
			.globl main
		main:
		
	jal L0


			li $v0,10
			syscall
		
L1 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	.data
LS0 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS0
	move $a0,$s8
	jal Lprints

L2 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
L0 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	li $t0,-123
	move $a0,$t0
	jal Lprinti

	jal L1

	li $t0,-2147483648
	move $a0,$t0
	jal Lprinti

	jal L1

	li $t0,-2147483648
negu $t0,$t0
	move $a0,$t0
	jal Lprinti

	jal L1

	li $t0,-2147483648
negu $t0,$t0
negu $t0,$t0
	move $a0,$t0
	jal Lprinti

	jal L1

L3 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
