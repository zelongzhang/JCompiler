
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
L1 :
	subu $sp,$sp,12
	sw $ra,0($sp)
	.data
LS0 :
	.byte  10 , 40 , 105 , 116 , 39 , 115 , 32 , 111 , 107 , 32 , 105 , 102 , 32 , 116 , 104 , 101 , 32 , 102 , 111 , 108 , 108 , 111 , 119 , 105 , 110 , 103 , 32 , 97 , 114 , 101 , 110 , 39 , 116 , 32 , 48 , 47 , 102 , 97 , 108 , 115 , 101 , 41 , 10 , 0
	.align 2
	.text
	la $s8,LS0
	move $a0,$s8
	jal Lprints

	.data
LS1 :
	.byte  9 , 108 , 111 , 99 , 97 , 108 , 32 , 105 , 110 , 116 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 , 0
	.align 2
	.text
	la $s8,LS1
	move $a0,$s8
	jal Lprints

	lw $t0,4($sp)
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

	.data
LS3 :
	.byte  9 , 108 , 111 , 99 , 97 , 108 , 32 , 98 , 111 , 111 , 108 , 101 , 97 , 110 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 , 0
	.align 2
	.text
	la $s8,LS3
	move $a0,$s8
	jal Lprints

	lw $t1,8($sp)
	move $a0,$t1
	jal Lprintb

	.data
LS4 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS4
	move $a0,$s8
	jal Lprints

	li $t0,123
	sw $t0,4($sp)
	li $t1,1
	sw $t1,8($sp)
L2 :
	lw $ra,0($sp)
	addu $sp,$sp,12
	jr $ra
L0 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	.data
LS5 :
	.byte  103 , 108 , 111 , 98 , 97 , 108 , 32 , 105 , 110 , 116 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 , 0
	.align 2
	.text
	la $s8,LS5
	move $a0,$s8
	jal Lprints

	lw $t0,G0
	move $a0,$t0
	jal Lprinti

	.data
LS6 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS6
	move $a0,$s8
	jal Lprints

	.data
LS7 :
	.byte  103 , 108 , 111 , 98 , 97 , 108 , 32 , 98 , 111 , 111 , 108 , 101 , 97 , 110 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 , 0
	.align 2
	.text
	la $s8,LS7
	move $a0,$s8
	jal Lprints

	lw $t1,G1
	move $a0,$t1
	jal Lprintb

	.data
LS8 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS8
	move $a0,$s8
	jal Lprints

	jal L1

	jal L1

L3 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
