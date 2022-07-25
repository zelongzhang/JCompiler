
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
	.byte  72 , 101 , 108 , 108 , 111 , 44 , 32 , 119 , 111 , 114 , 108 , 100 , 33 , 10 , 0
	.align 2
	.text
	la $s8,LS0
	move $a0,$s8
	jal Lprints

L1 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
