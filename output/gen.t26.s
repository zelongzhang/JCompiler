.data
NO_RET_MSG:
	.byte 69, 114, 114, 111, 114, 58, 32, 70, 117, 110, 99, 116, 105, 111, 110, 32, 119, 105, 116, 104, 32, 114, 101, 116, 117, 114, 110, 32, 116, 121, 112, 101, 32, 100, 105, 100, 32, 110, 111, 116, 32, 114, 101, 116, 117, 114, 110, 46, 32, 69, 120, 105, 116, 105, 110, 103, 46, 46, 46, 10, 0
	.align 2
NO_RET_LEN: .word 60
DIV_ZERO_MSG:
	.byte 69, 114, 114, 111, 114, 58, 32, 68, 105, 118, 105, 115, 105, 111, 110, 32, 98, 121, 32, 90, 101, 114, 111, 46, 32, 69, 120, 105, 116, 105, 110, 103, 46, 46, 46, 10, 0
	.align 2
DIV_ZERO_LEN: .word 36
.text
.data
TRUE:
	.byte  116, 114, 117, 101, 0
	.align 2
FALSE:
	.byte  102, 97, 108, 115, 101, 0
	.align 2
CHAR:
	.space 2
.text
Lprinti:
	li $v0,1
	syscall
	jr $ra
Lprintc:
	li $v0,11
	syscall
	jr $ra
Lprintb:
	subu $sp,$sp,4
	sw $ra,0($sp)
	beq $a0,$zero,Lprintb_false
Lprintb_true:
	la $a0, TRUE
	addi $a1, $zero, 4
	jal Lprints
	j Lprintb_exit
Lprintb_false:
	la $a0, FALSE
	addi $a1, $zero, 5
	jal Lprints
Lprintb_exit:
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
Lprints:
	subu $sp,$sp,16
	sw $ra,12($sp)
	sw $t0,8($sp)
	sw $t1,4($sp)
	sw $t2,0($sp)
	move $t0, $a0
	move $t1, $a1
	add $t2, $zero, $zero
Lprints_loop:
	bgt $t2,$t1,Lprints_exit
	addi $t2,$t2,1
	lb $a0, 0($t0)
	jal Lprintc
	addi $t0, 1
	j Lprints_loop
Lprints_exit:
	lw $ra,12($sp)
	lw $t0,8($sp)
	lw $t1,4($sp)
	lw $t2,0($sp)
	addu $sp,$sp,16
	jr $ra
Lgetchar:
	li $v0, 8
	la $a0, CHAR
	li $a1, 2
	syscall
	lw $v0, CHAR
	beq $v0, $zero, EOF
	jr $ra
EOF:
	li $v0, -1
	jr $ra
Lhalt:
	li $v0, 10
	syscall
.data
.text
.globl main
main:
	jal F2_main
	li $v0,10
	syscall
F0_convert:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	lw $t1,4($sp)
	li $t2,0
	seq $t0,$t1,$t2
	beq $t0,$zero,L0
	li $t4,0
	move $t3,$t4
	move $a0,$t3
	jal Lprinti
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
L0:
	lw $t6,4($sp)
	lw $t7,8($sp)
	bne $t7,$zero,L1
E0:
	la $a0,DIV_ZERO_MSG
	lw $a1,DIV_ZERO_LEN
	jal Lprints
	li $a0,1
	li $v0,17
	syscall
L1:
	divu $t5,$t6,$t7
	move $a0,$t5
	lw $t9,8($sp)
	move $t8,$t9
	move $a1,$t8
	jal F0_convert
	lw $s1,4($sp)
	lw $s2,8($sp)
	div $s1,$s2
	mfhi $s0
	move $a0,$s0
	jal Lprinti
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
F1_do:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	lw $t1,4($sp)
	move $t0,$t1
	move $a0,$t0
	jal Lprinti
.data
S0:
	.byte  32, 61, 32, 10, 0
	.align 2
S0_LEN: .word 4
.text
	la $a0,S0
	lw $a1,S0_LEN
	jal Lprints
.data
S1:
	.byte  9, 0
	.align 2
S1_LEN: .word 1
.text
	la $a0,S1
	lw $a1,S1_LEN
	jal Lprints
	lw $t3,4($sp)
	move $t2,$t3
	move $a0,$t2
	li $t5,2
	move $t4,$t5
	move $a1,$t4
	jal F0_convert
.data
S2:
	.byte  32, 40, 98, 97, 115, 101, 32, 50, 41, 10, 0
	.align 2
S2_LEN: .word 10
.text
	la $a0,S2
	lw $a1,S2_LEN
	jal Lprints
.data
S3:
	.byte  9, 0
	.align 2
S3_LEN: .word 1
.text
	la $a0,S3
	lw $a1,S3_LEN
	jal Lprints
	lw $t7,4($sp)
	move $t6,$t7
	move $a0,$t6
	li $t9,8
	move $t8,$t9
	move $a1,$t8
	jal F0_convert
.data
S4:
	.byte  32, 40, 98, 97, 115, 101, 32, 56, 41, 10, 0
	.align 2
S4_LEN: .word 10
.text
	la $a0,S4
	lw $a1,S4_LEN
	jal Lprints
.data
S5:
	.byte  9, 0
	.align 2
S5_LEN: .word 1
.text
	la $a0,S5
	lw $a1,S5_LEN
	jal Lprints
	lw $s1,4($sp)
	move $s0,$s1
	move $a0,$s0
	li $s3,10
	move $s2,$s3
	move $a1,$s2
	jal F0_convert
.data
S6:
	.byte  32, 40, 98, 97, 115, 101, 32, 49, 48, 41, 10, 0
	.align 2
S6_LEN: .word 11
.text
	la $a0,S6
	lw $a1,S6_LEN
	jal Lprints
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
F2_main:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	li $t1,0
	move $t0,$t1
	move $a0,$t0
	jal F1_do
	li $t3,17
	move $t2,$t3
	move $a0,$t2
	jal F1_do
	li $t5,42
	move $t4,$t5
	move $a0,$t4
	jal F1_do
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
