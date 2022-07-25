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
G0_d:
	.word 0
.text
.globl main
main:
	jal F3_mane
	li $v0,10
	syscall
F0_foo:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	lw $t3,4($sp)
	lw $t4,8($sp)
	mul $t2,$t3,$t4
	lw $t5,12($sp)
	mul $t1,$t2,$t5
	lw $t6,16($sp)
	mul $t0,$t1,$t6
	move $v0,$t0
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
E0:
	la $a0,NO_RET_MSG
	lw $a1,NO_RET_LEN
	jal Lprints
	li $a0,1
	li $v0,17
	syscall
F1_bar:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	subu $sp,$sp,16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	subu $sp,$sp,4
	sw $t0,0($sp)
	lw $t2,24($sp)
	move $t1,$t2
	move $a0,$t1
	lw $t4,28($sp)
	move $t3,$t4
	move $a1,$t3
	lw $t6,32($sp)
	move $t5,$t6
	move $a2,$t5
	lw $t8,G0_d
	li $t9,3
	subu $t7,$t8,$t9
	move $a3,$t7
	jal F0_foo
	lw $t0,0($sp)
	addu $sp,$sp,4
	lw $a0,0($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $a3,12($sp)
	addu, $sp,$sp,16
	move $t0,$v0
	move $v0,$t0
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
E1:
	la $a0,NO_RET_MSG
	lw $a1,NO_RET_LEN
	jal Lprints
	li $a0,1
	li $v0,17
	syscall
F2_baz:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	lw $t1,G0_d
	li $t2,1
	addu $t0,$t1,$t2
	la $t3,G0_d
	sw $t0,0($t3)
	lw $t5,4($sp)
	move $t4,$t5
	move $v0,$t4
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
E2:
	la $a0,NO_RET_MSG
	lw $a1,NO_RET_LEN
	jal Lprints
	li $a0,1
	li $v0,17
	syscall
F3_mane:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	li $t1,10
	move $t0,$t1
	la $t2,G0_d
	sw $t0,0($t2)
	subu $sp,$sp,16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	subu $sp,$sp,4
	sw $t3,0($sp)
	li $t5,1
	move $t4,$t5
	move $a0,$t4
	subu $sp,$sp,16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	subu $sp,$sp,4
	sw $t3,0($sp)
	subu $sp,$sp,4
	sw $t6,0($sp)
	li $t8,2
	move $t7,$t8
	move $a0,$t7
	subu $sp,$sp,16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	subu $sp,$sp,4
	sw $t3,0($sp)
	subu $sp,$sp,4
	sw $t6,0($sp)
	subu $sp,$sp,4
	sw $t9,0($sp)
	li $s1,3
	move $s0,$s1
	move $a0,$s0
	jal F2_baz
	lw $t9,0($sp)
	addu $sp,$sp,4
	lw $t6,0($sp)
	addu $sp,$sp,4
	lw $t3,0($sp)
	addu $sp,$sp,4
	lw $a0,0($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $a3,12($sp)
	addu, $sp,$sp,16
	move $t9,$v0
	move $a1,$t9
	li $s3,4
	move $s2,$s3
	move $a2,$s2
	jal F1_bar
	lw $t6,0($sp)
	addu $sp,$sp,4
	lw $t3,0($sp)
	addu $sp,$sp,4
	lw $a0,0($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $a3,12($sp)
	addu, $sp,$sp,16
	move $t6,$v0
	move $a1,$t6
	subu $sp,$sp,16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	subu $sp,$sp,4
	sw $s4,0($sp)
	subu $sp,$sp,4
	sw $t3,0($sp)
	li $s6,5
	move $s5,$s6
	move $a0,$s5
	subu $sp,$sp,16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	subu $sp,$sp,4
	sw $s4,0($sp)
	subu $sp,$sp,4
	sw $s7,0($sp)
	subu $sp,$sp,4
	sw $t3,0($sp)
	li $t2,6
	move $t1,$t2
	move $a0,$t1
	jal F2_baz
	lw $t3,0($sp)
	addu $sp,$sp,4
	lw $s7,0($sp)
	addu $sp,$sp,4
	lw $s4,0($sp)
	addu $sp,$sp,4
	lw $a0,0($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $a3,12($sp)
	addu, $sp,$sp,16
	move $s7,$v0
	move $a1,$s7
	li $t5,7
	move $t0,$t5
	move $a2,$t0
	jal F1_bar
	lw $t3,0($sp)
	addu $sp,$sp,4
	lw $s4,0($sp)
	addu $sp,$sp,4
	lw $a0,0($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $a3,12($sp)
	addu, $sp,$sp,16
	move $s4,$v0
	move $a2,$s4
	subu $sp,$sp,16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	subu $sp,$sp,4
	sw $t3,0($sp)
	subu $sp,$sp,4
	sw $t4,0($sp)
	li $t7,8
	move $t8,$t7
	move $a0,$t8
	jal F2_baz
	lw $t4,0($sp)
	addu $sp,$sp,4
	lw $t3,0($sp)
	addu $sp,$sp,4
	lw $a0,0($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $a3,12($sp)
	addu, $sp,$sp,16
	move $t4,$v0
	move $a3,$t4
	jal F0_foo
	lw $t3,0($sp)
	addu $sp,$sp,4
	lw $a0,0($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $a3,12($sp)
	addu, $sp,$sp,16
	move $t3,$v0
	move $a0,$t3
	jal Lprinti
.data
S0:
	.byte  10, 0
	.align 2
S0_LEN: .word 1
.text
	la $a0,S0
	lw $a1,S0_LEN
	jal Lprints
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
