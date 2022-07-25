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
	jal F0_main
	li $v0,10
	syscall
F0_main:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	li $t0,0
	li $t1,0
	li $t2,0
	li $t3,0
	li $t5,2
	move $t4,$t5
	move $t0,$t4
	li $t7,1
	move $t6,$t7
	move $t2,$t6
	li $t9,0
	move $t8,$t9
	move $t3,$t8
.data
S0:
	.byte  102, 105, 98, 40, 48, 41, 32, 61, 32, 48, 10, 0
	.align 2
S0_LEN: .word 11
.text
	la $a0,S0
	lw $a1,S0_LEN
	jal Lprints
.data
S1:
	.byte  102, 105, 98, 40, 49, 41, 32, 61, 32, 49, 10, 0
	.align 2
S1_LEN: .word 11
.text
	la $a0,S1
	lw $a1,S1_LEN
	jal Lprints
L0:
	move $s1,$t0
	li $s2,47
	slt $s0,$s1,$s2
	beq $s0,$zero,L1
.data
S2:
	.byte  102, 105, 98, 40, 0
	.align 2
S2_LEN: .word 4
.text
	la $a0,S2
	lw $a1,S2_LEN
	jal Lprints
	move $s4,$t0
	move $s3,$s4
	move $a0,$s3
	jal Lprinti
.data
S3:
	.byte  41, 32, 61, 32, 0
	.align 2
S3_LEN: .word 4
.text
	la $a0,S3
	lw $a1,S3_LEN
	jal Lprints
	move $s6,$t2
	move $s7,$t3
	addu $s5,$s6,$s7
	move $t1,$s5
	move $t4,$t1
	move $t5,$t4
	move $a0,$t5
	jal Lprinti
	move $t6,$t2
	move $t7,$t6
	move $t3,$t7
	move $t8,$t1
	move $t9,$t8
	move $t2,$t9
.data
S4:
	.byte  10, 0
	.align 2
S4_LEN: .word 1
.text
	la $a0,S4
	lw $a1,S4_LEN
	jal Lprints
	move $s2,$t0
	li $s4,1
	addu $s1,$s2,$s4
	move $t0,$s1
	j L0
L1:
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
