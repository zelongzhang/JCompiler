
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
L1 :
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
mul $t2,$t0,$t1
	lw $t0,12($sp)
mul $t1,$t2,$t0
	lw $t2,16($sp)
mul $t0,$t1,$t2
	move $v0,$t0
	j L4
	.data
LS0 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 102 , 111 , 111 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS0
	j error
L4 :
	lw $ra,0($sp)
	addu $sp,$sp,20
	jr $ra
L2 :
	subu $sp,$sp,16
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	lw $t3,G0
	li $t4,3
subu $t5,$t3,$t4
	move $a0,$t0
	move $a1,$t1
	move $a2,$t2
	move $a3,$t5
	jal L1

	move $t3,$v0
	move $v0,$t3
	j L5
	.data
LS1 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 98 , 97 , 114 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS1
	j error
L5 :
	lw $ra,0($sp)
	addu $sp,$sp,16
	jr $ra
L3 :
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $a0,4($sp)
	lw $t0,G0
	li $t1,1
addu $t2,$t0,$t1
	sw $t2,G0
	lw $t3,4($sp)
	move $v0,$t3
	j L6
	.data
LS2 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 98 , 97 , 122 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS2
	j error
L6 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
L0 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	li $t0,10
	sw $t0,G0
	li $t1,1
	li $t2,2
	li $t3,3
 subu $sp,$sp,8
 sw $t1,0($sp)
 sw $t2,4($sp)
	move $a0,$t3
	jal L3
 lw $t1,0($sp)
 lw $t2,4($sp)
addu $sp,$sp,8
	move $t4,$v0
	li $t5,4
 subu $sp,$sp,4
 sw $t1,0($sp)
	move $a0,$t2
	move $a1,$t4
	move $a2,$t5
	jal L2
 lw $t1,0($sp)
addu $sp,$sp,4
	move $t0,$v0
	li $t3,5
	li $t2,6
 subu $sp,$sp,12
 sw $t3,0($sp)
 sw $t1,4($sp)
 sw $t0,8($sp)
	move $a0,$t2
	jal L3
 lw $t3,0($sp)
 lw $t1,4($sp)
 lw $t0,8($sp)
addu $sp,$sp,12
	move $t4,$v0
	li $t5,7
 subu $sp,$sp,8
 sw $t1,0($sp)
 sw $t0,4($sp)
	move $a0,$t3
	move $a1,$t4
	move $a2,$t5
	jal L2
 lw $t1,0($sp)
 lw $t0,4($sp)
addu $sp,$sp,8
	move $t2,$v0
	li $t3,8
 subu $sp,$sp,12
 sw $t1,0($sp)
 sw $t2,4($sp)
 sw $t0,8($sp)
	move $a0,$t3
	jal L3
 lw $t1,0($sp)
 lw $t2,4($sp)
 lw $t0,8($sp)
addu $sp,$sp,12
	move $t4,$v0
	move $a0,$t1
	move $a1,$t0
	move $a2,$t2
	move $a3,$t4
	jal L1

	move $t5,$v0
	move $a0,$t5
	jal Lprinti

	.data
LS3 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS3
	move $a0,$s8
	jal Lprints

L7 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
