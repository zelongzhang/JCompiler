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
G0_i:
	.word 0
G1_k:
	.word 0
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
	li $t2,123
	move $t1,$t2
	la $t3,G0_i
	sw $t1,0($t3)
	li $t5,456
	move $t4,$t5
	move $t0,$t4
	li $t7,789
	move $t6,$t7
	la $t8,G1_k
	sw $t6,0($t8)
	li $s0,42
	move $t9,$s0
	la $s1,G1_k
	sw $t9,0($s1)
	li $s3,42
	move $s2,$s3
	move $t0,$s2
	li $s5,42
	move $s4,$s5
	la $s6,G1_k
	sw $s4,0($s6)
	li $t2,42
	move $s7,$t2
	la $t3,G0_i
	sw $s7,0($t3)
	li $t1,0
	li $t4,10
	move $t5,$t4
	move $t1,$t5
	lw $t8,G0_i
	move $t7,$t8
	move $a0,$t7
	jal Lprinti
	move $s0,$t1
	move $t6,$s0
	move $a0,$t6
	jal Lprintc
	move $t9,$t0
	move $s1,$t9
	move $a0,$s1
	jal Lprinti
	move $s2,$t1
	move $s3,$s2
	move $a0,$s3
	jal Lprintc
	lw $s6,G1_k
	move $s5,$s6
	move $a0,$s5
	jal Lprinti
	move $t2,$t1
	move $s4,$t2
	move $a0,$s4
	jal Lprintc
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
