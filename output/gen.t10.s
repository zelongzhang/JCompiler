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
	li $t2,0
	move $t1,$t2
	move $t0,$t1
L0:
	move $t4,$t0
	li $t5,46
	sle $t3,$t4,$t5
	beq $t3,$zero,L1
.data
S0:
	.byte  102, 105, 98, 40, 0
	.align 2
S0_LEN: .word 4
.text
	la $a0,S0
	lw $a1,S0_LEN
	jal Lprints
	move $t7,$t0
	move $t6,$t7
	move $a0,$t6
	jal Lprinti
.data
S1:
	.byte  41, 32, 61, 32, 0
	.align 2
S1_LEN: .word 4
.text
	la $a0,S1
	lw $a1,S1_LEN
	jal Lprints
	subu $sp,$sp,16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	subu $sp,$sp,4
	sw $t0,0($sp)
	subu $sp,$sp,4
	sw $t3,0($sp)
	subu $sp,$sp,4
	sw $t8,0($sp)
	move $s0,$t0
	move $t9,$s0
	move $a0,$t9
	jal F1_fib
	lw $t8,0($sp)
	addu $sp,$sp,4
	lw $t3,0($sp)
	addu $sp,$sp,4
	lw $t0,0($sp)
	addu $sp,$sp,4
	lw $a0,0($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $a3,12($sp)
	addu, $sp,$sp,16
	move $t8,$v0
	move $a0,$t8
	jal Lprinti
.data
S2:
	.byte  10, 0
	.align 2
S2_LEN: .word 1
.text
	la $a0,S2
	lw $a1,S2_LEN
	jal Lprints
	move $s2,$t0
	li $s3,1
	addu $s1,$s2,$s3
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
F1_fib:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	lw $t1,4($sp)
	li $t2,0
	seq $t0,$t1,$t2
	beq $t0,$zero,L2
	li $t4,0
	move $t3,$t4
	move $v0,$t3
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
L2:
	lw $t6,4($sp)
	li $t7,1
	seq $t5,$t6,$t7
	beq $t5,$zero,L3
	li $t9,1
	move $t8,$t9
	move $v0,$t8
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
L3:
	subu $sp,$sp,4
	sw $s0,0($sp)
	lw $s2,8($sp)
	li $s3,1
	subu $s1,$s2,$s3
	move $a0,$s1
	jal F1_fib
	lw $s0,0($sp)
	addu $sp,$sp,4
	move $s4,$v0
	subu $sp,$sp,4
	sw $s0,0($sp)
	subu $sp,$sp,4
	sw $s4,0($sp)
	lw $s6,12($sp)
	li $s7,2
	subu $s5,$s6,$s7
	move $a0,$s5
	jal F1_fib
	lw $s4,0($sp)
	addu $sp,$sp,4
	lw $s0,0($sp)
	addu $sp,$sp,4
	move $t1,$v0
	addu $s0,$s4,$t1
	move $v0,$s0
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
