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
G0_a:
	.word 0
G1_b:
	.word 0
G2_c:
	.word 0
.text
.globl main
main:
	jal F5_main
	li $v0,10
	syscall
F0_A:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
.data
S0:
	.byte  101, 118, 97, 108, 117, 97, 116, 101, 100, 32, 65, 10, 0
	.align 2
S0_LEN: .word 12
.text
	la $a0,S0
	lw $a1,S0_LEN
	jal Lprints
	lw $t1,G0_a
	move $t0,$t1
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
F1_B:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
.data
S1:
	.byte  101, 118, 97, 108, 117, 97, 116, 101, 100, 32, 66, 10, 0
	.align 2
S1_LEN: .word 12
.text
	la $a0,S1
	lw $a1,S1_LEN
	jal Lprints
	lw $t1,G1_b
	move $t0,$t1
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
F2_C:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
.data
S2:
	.byte  101, 118, 97, 108, 117, 97, 116, 101, 100, 32, 67, 10, 0
	.align 2
S2_LEN: .word 12
.text
	la $a0,S2
	lw $a1,S2_LEN
	jal Lprints
	lw $t1,G2_c
	move $t0,$t1
	move $v0,$t0
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
F3_eval:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	lw $t1,4($sp)
	move $t0,$t1
	la $t2,G0_a
	sw $t0,0($t2)
	lw $t4,8($sp)
	move $t3,$t4
	la $t5,G1_b
	sw $t3,0($t5)
	lw $t7,12($sp)
	move $t6,$t7
	la $t8,G2_c
	sw $t6,0($t8)
.data
S3:
	.byte  105, 102, 32, 40, 40, 65, 32, 38, 38, 32, 66, 41, 32, 124, 124, 32, 67, 41, 32, 123, 46, 46, 46, 125, 32, 101, 108, 115, 101, 32, 123, 46, 46, 46, 125, 44, 32, 119, 105, 116, 104, 32, 65, 61, 0
	.align 2
S3_LEN: .word 44
.text
	la $a0,S3
	lw $a1,S3_LEN
	jal Lprints
	lw $s0,G0_a
	move $t9,$s0
	move $a0,$t9
	jal Lprintb
.data
S4:
	.byte  32, 66, 61, 0
	.align 2
S4_LEN: .word 3
.text
	la $a0,S4
	lw $a1,S4_LEN
	jal Lprints
	lw $s2,G1_b
	move $s1,$s2
	move $a0,$s1
	jal Lprintb
.data
S5:
	.byte  32, 67, 61, 0
	.align 2
S5_LEN: .word 3
.text
	la $a0,S5
	lw $a1,S5_LEN
	jal Lprints
	lw $s4,G2_c
	move $s3,$s4
	move $a0,$s3
	jal Lprintb
.data
S6:
	.byte  10, 0
	.align 2
S6_LEN: .word 1
.text
	la $a0,S6
	lw $a1,S6_LEN
	jal Lprints
	subu $sp,$sp,4
	sw $s5,0($sp)
	subu $sp,$sp,4
	sw $s6,0($sp)
	jal F0_A
	lw $s6,0($sp)
	addu $sp,$sp,4
	lw $s5,0($sp)
	addu $sp,$sp,4
	move $s7,$v0
	subu $sp,$sp,4
	sw $s5,0($sp)
	subu $sp,$sp,4
	sw $s6,0($sp)
	subu $sp,$sp,4
	sw $s7,0($sp)
	jal F1_B
	lw $s7,0($sp)
	addu $sp,$sp,4
	lw $s6,0($sp)
	addu $sp,$sp,4
	lw $s5,0($sp)
	addu $sp,$sp,4
	move $t1,$v0
	li $t2,2
	addu $t0,$s7,$t1
	seq $s6,$t2,$t0
	subu $sp,$sp,4
	sw $s5,0($sp)
	subu $sp,$sp,4
	sw $s6,0($sp)
	jal F2_C
	lw $s6,0($sp)
	addu $sp,$sp,4
	lw $s5,0($sp)
	addu $sp,$sp,4
	move $t4,$v0
	li $t5,1
	addu $t3,$s6,$t4
	sge $s5,$t3,$t5
	beq $s5,$zero,L0
.data
S7:
	.byte  105, 102, 45, 112, 97, 114, 116, 32, 101, 120, 101, 99, 117, 116, 101, 100, 10, 0
	.align 2
S7_LEN: .word 17
.text
	la $a0,S7
	lw $a1,S7_LEN
	jal Lprints
	j L1
L0:
.data
S8:
	.byte  101, 108, 115, 101, 45, 112, 97, 114, 116, 32, 101, 120, 101, 99, 117, 116, 101, 100, 10, 0
	.align 2
S8_LEN: .word 19
.text
	la $a0,S8
	lw $a1,S8_LEN
	jal Lprints
L1:
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
F4_assign:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	lw $t1,4($sp)
	move $t0,$t1
	la $t2,G0_a
	sw $t0,0($t2)
	lw $t4,8($sp)
	move $t3,$t4
	la $t5,G1_b
	sw $t3,0($t5)
	lw $t7,12($sp)
	move $t6,$t7
	la $t8,G2_c
	sw $t6,0($t8)
.data
S9:
	.byte  120, 32, 61, 32, 40, 65, 32, 38, 38, 32, 33, 66, 41, 32, 124, 124, 32, 67, 44, 32, 119, 105, 116, 104, 32, 65, 61, 0
	.align 2
S9_LEN: .word 27
.text
	la $a0,S9
	lw $a1,S9_LEN
	jal Lprints
	lw $s0,G0_a
	move $t9,$s0
	move $a0,$t9
	jal Lprintb
.data
S10:
	.byte  32, 66, 61, 0
	.align 2
S10_LEN: .word 3
.text
	la $a0,S10
	lw $a1,S10_LEN
	jal Lprints
	lw $s2,G1_b
	move $s1,$s2
	move $a0,$s1
	jal Lprintb
.data
S11:
	.byte  32, 67, 61, 0
	.align 2
S11_LEN: .word 3
.text
	la $a0,S11
	lw $a1,S11_LEN
	jal Lprints
	lw $s4,G2_c
	move $s3,$s4
	move $a0,$s3
	jal Lprintb
.data
S12:
	.byte  10, 0
	.align 2
S12_LEN: .word 1
.text
	la $a0,S12
	lw $a1,S12_LEN
	jal Lprints
	li $s5,0
	subu $sp,$sp,4
	sw $s5,0($sp)
	subu $sp,$sp,4
	sw $s6,0($sp)
	subu $sp,$sp,4
	sw $s7,0($sp)
	jal F0_A
	lw $s7,0($sp)
	addu $sp,$sp,4
	lw $s6,0($sp)
	addu $sp,$sp,4
	lw $s5,0($sp)
	addu $sp,$sp,4
	move $t1,$v0
	subu $sp,$sp,4
	sw $s5,0($sp)
	subu $sp,$sp,4
	sw $s6,0($sp)
	subu $sp,$sp,4
	sw $s7,0($sp)
	subu $sp,$sp,4
	sw $t1,0($sp)
	jal F1_B
	lw $t1,0($sp)
	addu $sp,$sp,4
	lw $s7,0($sp)
	addu $sp,$sp,4
	lw $s6,0($sp)
	addu $sp,$sp,4
	lw $s5,0($sp)
	addu $sp,$sp,4
	move $t2,$v0
	xori $t2,$t2,1
	li $t0,2
	addu $t4,$t1,$t2
	seq $s7,$t0,$t4
	subu $sp,$sp,4
	sw $s5,0($sp)
	subu $sp,$sp,4
	sw $s6,0($sp)
	subu $sp,$sp,4
	sw $s7,0($sp)
	jal F2_C
	lw $s7,0($sp)
	addu $sp,$sp,4
	lw $s6,0($sp)
	addu $sp,$sp,4
	lw $s5,0($sp)
	addu $sp,$sp,4
	move $t5,$v0
	li $t3,1
	addu $t7,$s7,$t5
	sge $s6,$t7,$t3
	move $s5,$s6
.data
S13:
	.byte  120, 61, 0
	.align 2
S13_LEN: .word 2
.text
	la $a0,S13
	lw $a1,S13_LEN
	jal Lprints
	move $t6,$s5
	move $t8,$t6
	move $a0,$t8
	jal Lprintb
.data
S14:
	.byte  10, 0
	.align 2
S14_LEN: .word 1
.text
	la $a0,S14
	lw $a1,S14_LEN
	jal Lprints
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
F5_main:
	subu $sp,$sp,20
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $a3,16($sp)
	li $t1,0
	move $t0,$t1
	move $a0,$t0
	li $t3,0
	move $t2,$t3
	move $a1,$t2
	li $t5,0
	move $t4,$t5
	move $a2,$t4
	jal F3_eval
.data
S15:
	.byte  10, 0
	.align 2
S15_LEN: .word 1
.text
	la $a0,S15
	lw $a1,S15_LEN
	jal Lprints
	li $t7,0
	move $t6,$t7
	move $a0,$t6
	li $t9,0
	move $t8,$t9
	move $a1,$t8
	li $s1,1
	move $s0,$s1
	move $a2,$s0
	jal F3_eval
.data
S16:
	.byte  10, 0
	.align 2
S16_LEN: .word 1
.text
	la $a0,S16
	lw $a1,S16_LEN
	jal Lprints
	li $s3,0
	move $s2,$s3
	move $a0,$s2
	li $s5,1
	move $s4,$s5
	move $a1,$s4
	li $s7,0
	move $s6,$s7
	move $a2,$s6
	jal F3_eval
.data
S17:
	.byte  10, 0
	.align 2
S17_LEN: .word 1
.text
	la $a0,S17
	lw $a1,S17_LEN
	jal Lprints
	li $t0,0
	move $t1,$t0
	move $a0,$t1
	li $t2,1
	move $t3,$t2
	move $a1,$t3
	li $t4,1
	move $t5,$t4
	move $a2,$t5
	jal F3_eval
.data
S18:
	.byte  10, 0
	.align 2
S18_LEN: .word 1
.text
	la $a0,S18
	lw $a1,S18_LEN
	jal Lprints
	li $t6,1
	move $t7,$t6
	move $a0,$t7
	li $t8,0
	move $t9,$t8
	move $a1,$t9
	li $s0,0
	move $s1,$s0
	move $a2,$s1
	jal F3_eval
.data
S19:
	.byte  10, 0
	.align 2
S19_LEN: .word 1
.text
	la $a0,S19
	lw $a1,S19_LEN
	jal Lprints
	li $s2,1
	move $s3,$s2
	move $a0,$s3
	li $s4,0
	move $s5,$s4
	move $a1,$s5
	li $s6,1
	move $s7,$s6
	move $a2,$s7
	jal F3_eval
.data
S20:
	.byte  10, 0
	.align 2
S20_LEN: .word 1
.text
	la $a0,S20
	lw $a1,S20_LEN
	jal Lprints
	li $t1,1
	move $t0,$t1
	move $a0,$t0
	li $t3,1
	move $t2,$t3
	move $a1,$t2
	li $t5,0
	move $t4,$t5
	move $a2,$t4
	jal F3_eval
.data
S21:
	.byte  10, 0
	.align 2
S21_LEN: .word 1
.text
	la $a0,S21
	lw $a1,S21_LEN
	jal Lprints
	li $t7,1
	move $t6,$t7
	move $a0,$t6
	li $t9,1
	move $t8,$t9
	move $a1,$t8
	li $s1,1
	move $s0,$s1
	move $a2,$s0
	jal F3_eval
.data
S22:
	.byte  10, 0
	.align 2
S22_LEN: .word 1
.text
	la $a0,S22
	lw $a1,S22_LEN
	jal Lprints
	li $s3,0
	move $s2,$s3
	move $a0,$s2
	li $s5,0
	move $s4,$s5
	move $a1,$s4
	li $s7,0
	move $s6,$s7
	move $a2,$s6
	jal F4_assign
.data
S23:
	.byte  10, 0
	.align 2
S23_LEN: .word 1
.text
	la $a0,S23
	lw $a1,S23_LEN
	jal Lprints
	li $t0,0
	move $t1,$t0
	move $a0,$t1
	li $t2,0
	move $t3,$t2
	move $a1,$t3
	li $t4,1
	move $t5,$t4
	move $a2,$t5
	jal F4_assign
.data
S24:
	.byte  10, 0
	.align 2
S24_LEN: .word 1
.text
	la $a0,S24
	lw $a1,S24_LEN
	jal Lprints
	li $t6,0
	move $t7,$t6
	move $a0,$t7
	li $t8,1
	move $t9,$t8
	move $a1,$t9
	li $s0,0
	move $s1,$s0
	move $a2,$s1
	jal F4_assign
.data
S25:
	.byte  10, 0
	.align 2
S25_LEN: .word 1
.text
	la $a0,S25
	lw $a1,S25_LEN
	jal Lprints
	li $s2,0
	move $s3,$s2
	move $a0,$s3
	li $s4,1
	move $s5,$s4
	move $a1,$s5
	li $s6,1
	move $s7,$s6
	move $a2,$s7
	jal F4_assign
.data
S26:
	.byte  10, 0
	.align 2
S26_LEN: .word 1
.text
	la $a0,S26
	lw $a1,S26_LEN
	jal Lprints
	li $t1,1
	move $t0,$t1
	move $a0,$t0
	li $t3,0
	move $t2,$t3
	move $a1,$t2
	li $t5,0
	move $t4,$t5
	move $a2,$t4
	jal F4_assign
.data
S27:
	.byte  10, 0
	.align 2
S27_LEN: .word 1
.text
	la $a0,S27
	lw $a1,S27_LEN
	jal Lprints
	li $t7,1
	move $t6,$t7
	move $a0,$t6
	li $t9,0
	move $t8,$t9
	move $a1,$t8
	li $s1,1
	move $s0,$s1
	move $a2,$s0
	jal F4_assign
.data
S28:
	.byte  10, 0
	.align 2
S28_LEN: .word 1
.text
	la $a0,S28
	lw $a1,S28_LEN
	jal Lprints
	li $s3,1
	move $s2,$s3
	move $a0,$s2
	li $s5,1
	move $s4,$s5
	move $a1,$s4
	li $s7,0
	move $s6,$s7
	move $a2,$s6
	jal F4_assign
.data
S29:
	.byte  10, 0
	.align 2
S29_LEN: .word 1
.text
	la $a0,S29
	lw $a1,S29_LEN
	jal Lprints
	li $t0,1
	move $t1,$t0
	move $a0,$t1
	li $t2,1
	move $t3,$t2
	move $a1,$t3
	li $t4,1
	move $t5,$t4
	move $a2,$t5
	jal F4_assign
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $a3,16($sp)
	addu, $sp,$sp,20
	jr $ra
