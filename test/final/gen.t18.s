
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
	.data
G2 :
	.word 0
	.text
	.data
G3 :
	.word 0
	.text
	.data
G4 :
	.word 0
	.text
	.data
G5 :
	.word 0
	.text
	.data
G6 :
	.word 0
	.text
	.data
G7 :
	.word 0
	.text
	.data
G8 :
	.word 0
	.text
	.data
G9 :
	.word 0
	.text
	.data
G10 :
	.word 0
	.text
	.data
G11 :
	.word 0
	.text
	.data
G12 :
	.word 0
	.text
	.data
G13 :
	.word 0
	.text
	.data
G14 :
	.word 0
	.text
	.data
G15 :
	.word 0
	.text
	.data
G16 :
	.word 0
	.text
	.data
G17 :
	.word 0
	.text
	.data
G18 :
	.word 0
	.text
	.data
G19 :
	.word 0
	.text
	.data
G20 :
	.word 0
	.text
	.data
G21 :
	.word 0
	.text
	.data
G22 :
	.word 0
	.text
	.data
G23 :
	.word 0
	.text
	.data
G24 :
	.word 0
	.text
	.data
G25 :
	.word 0
	.text
	.data
G26 :
	.word 0
	.text
L0 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	jal L12

	jal L8

L13 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
L1 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	lw $t0,G0
	beqz $t0,L15
	li $t0,0
	sw $t0,G0
	lw $t1,G1
	move $v0,$t1
	j L14
L15 :
	jal Lgetchar

	move $t1,$v0
	move $v0,$t1
	j L14
	.data
LS0 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 103 , 101 , 116 , 99 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS0
	j error
L14 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
L2 :
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $a0,4($sp)
	lw $t0,G0
	beqz $t0,L17
	.data
LS1 :
	.byte  73 , 110 , 116 , 101 , 114 , 110 , 97 , 108 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 116 , 111 , 111 , 32 , 109 , 97 , 110 , 121 , 32 , 117 , 110 , 103 , 101 , 116 , 115 , 33 , 10 , 0
	.align 2
	.text
	la $s8,LS1
	move $a0,$s8
	jal Lprints

	jal Lhalt

L17 :
	li $t0,1
	sw $t0,G0
	lw $t1,4($sp)
	sw $t1,G1
L16 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
L3 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	lw $t0,G2
	beqz $t0,L19
	lw $t1,G3
	move $v0,$t1
	j L18
L19 :
	li $t0,1
	sw $t0,G2
	jal L5

	move $t1,$v0
	sw $t1,G3
	move $v0,$t1
	j L18
	.data
LS2 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 112 , 101 , 101 , 107 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS2
	j error
L18 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
L4 :
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $a0,4($sp)
	jal L3

	move $t0,$v0
	lw $t1,4($sp)
sne $t2,$t0,$t1
	beqz $t2,L21
	.data
LS3 :
	.byte  69 , 114 , 114 , 111 , 114 , 58 , 32 , 101 , 120 , 112 , 101 , 99 , 116 , 101 , 100 , 32 , 0
	.align 2
	.text
	la $s8,LS3
	move $a0,$s8
	jal Lprints

	lw $t0,4($sp)
	move $a0,$t0
	jal Lprintc

	.data
LS4 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS4
	move $a0,$s8
	jal Lprints

	jal Lhalt

L21 :
	li $t2,0
	sw $t2,G2
L20 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
L5 :
	subu $sp,$sp,8
	sw $ra,0($sp)
L23 :
	jal L1

	move $t0,$v0
	sw $t0,4($sp)
	move $a0,$t0
	jal L7

	move $t1,$v0
	beqz $t1,L24
	j L23
L24 :
	lw $t2,4($sp)
	lw $t0,G5
seq $t1,$t2,$t0
	beqz $t1,L25
	lw $t2,G6
	move $v0,$t2
	j L22
L25 :
	lw $t0,4($sp)
	lw $t2,G26
seq $t1,$t0,$t2
	beqz $t1,L26
	lw $t0,G7
	move $v0,$t0
	j L22
L26 :
	lw $t2,4($sp)
	lw $t0,G17
seq $t1,$t2,$t0
	beqz $t1,L27
	lw $t2,G9
	move $v0,$t2
	j L22
L27 :
	lw $t0,4($sp)
	lw $t2,G18
seq $t1,$t0,$t2
	beqz $t1,L28
	lw $t0,G10
	move $v0,$t0
	j L22
L28 :
	lw $t2,4($sp)
	lw $t0,G19
seq $t1,$t2,$t0
	beqz $t1,L29
	lw $t2,G11
	move $v0,$t2
	j L22
L29 :
	lw $t0,4($sp)
	lw $t2,G20
seq $t1,$t0,$t2
	beqz $t1,L30
	lw $t0,G12
	move $v0,$t0
	j L22
L30 :
	lw $t2,4($sp)
	lw $t0,G21
seq $t1,$t2,$t0
	beqz $t1,L31
	lw $t2,G13
	move $v0,$t2
	j L22
L31 :
	lw $t0,4($sp)
	lw $t2,G22
seq $t1,$t0,$t2
	beqz $t1,L32
	lw $t0,G14
	move $v0,$t0
	j L22
L32 :
	lw $t2,4($sp)
	move $a0,$t2
	jal L6

	move $t1,$v0
	beqz $t1,L33
	li $t0,0
	sw $t0,G4
L34 :
	lw $t2,4($sp)
	move $a0,$t2
	jal L6

	move $t1,$v0
	beqz $t1,L35
	lw $t0,G4
	li $t2,10
mul $t3,$t0,$t2
	lw $t0,4($sp)
	lw $t2,G15
subu $t4,$t0,$t2
addu $t0,$t3,$t4
	sw $t0,G4
	jal L1

	move $t2,$v0
	sw $t2,4($sp)
	j L34
L35 :
	lw $t3,4($sp)
	move $a0,$t3
	jal L2

	lw $t4,G8
	move $v0,$t4
	j L22
L33 :
	.data
LS5 :
	.byte  69 , 114 , 114 , 111 , 114 , 58 , 32 , 105 , 110 , 118 , 97 , 108 , 105 , 100 , 32 , 99 , 104 , 97 , 114 , 97 , 99 , 116 , 101 , 114 , 46 , 10 , 0
	.align 2
	.text
	la $s8,LS5
	move $a0,$s8
	jal Lprints

	jal Lhalt

	.data
LS6 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 115 , 99 , 97 , 110 , 110 , 101 , 114 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS6
	j error
L22 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
L6 :
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $a0,4($sp)
	lw $t0,4($sp)
	lw $t1,G15
sge $t2,$t0,$t1
	move $t3,$t2
	beqz $t3,L37
	lw $t4,4($sp)
	lw $t5,G16
sle $t2,$t4,$t5
	move $t3,$t2
L37 :
	move $v0,$t3
	j L36
	.data
LS7 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 105 , 115 , 100 , 105 , 103 , 105 , 116 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS7
	j error
L36 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
L7 :
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $a0,4($sp)
	lw $t0,4($sp)
	lw $t1,G23
seq $t2,$t0,$t1
	move $t3,$t2
	bnez $t3,L40
	lw $t4,4($sp)
	lw $t5,G24
seq $t2,$t4,$t5
	move $t3,$t2
L40 :
	move $t6,$t3
	bnez $t6,L39
	lw $t0,4($sp)
	lw $t1,G25
seq $t2,$t0,$t1
	move $t6,$t2
L39 :
	move $v0,$t6
	j L38
	.data
LS8 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 105 , 115 , 115 , 112 , 97 , 99 , 101 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS8
	j error
L38 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
L8 :
	subu $sp,$sp,8
	sw $ra,0($sp)
L42 :
	jal L3

	move $t0,$v0
	lw $t1,G6
sne $t2,$t0,$t1
	beqz $t2,L43
	jal L9

	move $t3,$v0
	sw $t3,4($sp)
	lw $t4,G7
	move $a0,$t4
	jal L4

	.data
LS9 :
	.byte  32 , 61 , 32 , 0
	.align 2
	.text
	la $s8,LS9
	move $a0,$s8
	jal Lprints

	lw $t0,4($sp)
	move $a0,$t0
	jal Lprinti

	.data
LS10 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS10
	move $a0,$s8
	jal Lprints

	j L42
L43 :
L41 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
L9 :
	subu $sp,$sp,16
	sw $ra,0($sp)
	jal L10

	move $t0,$v0
	sw $t0,4($sp)
L45 :
 subu $sp,$sp,4
 sw $t1,0($sp)
	jal L3
 lw $t1,0($sp)
addu $sp,$sp,4
	move $t2,$v0
	lw $t3,G9
seq $t4,$t2,$t3
	move $t1,$t4
	bnez $t1,L47
 subu $sp,$sp,4
 sw $t1,0($sp)
	jal L3
 lw $t1,0($sp)
addu $sp,$sp,4
	move $t5,$v0
	lw $t0,G10
seq $t6,$t5,$t0
	move $t1,$t6
L47 :
	beqz $t1,L46
	jal L3

	move $t2,$v0
	sw $t2,12($sp)
	move $a0,$t2
	jal L4

	jal L10

	move $t3,$v0
	sw $t3,8($sp)
	lw $t5,12($sp)
	lw $t0,G9
seq $t4,$t5,$t0
	beqz $t4,L48
	lw $t2,4($sp)
	lw $t3,8($sp)
addu $t5,$t2,$t3
	sw $t5,4($sp)
	j L49
L48 :
	lw $t0,4($sp)
	lw $t2,8($sp)
subu $t3,$t0,$t2
	sw $t3,4($sp)
L49 :
	j L45
L46 :
	lw $t5,4($sp)
	move $v0,$t5
	j L44
	.data
LS11 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 69 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS11
	j error
L44 :
	lw $ra,0($sp)
	addu $sp,$sp,16
	jr $ra
L10 :
	subu $sp,$sp,16
	sw $ra,0($sp)
	jal L11

	move $t0,$v0
	sw $t0,4($sp)
L51 :
 subu $sp,$sp,4
 sw $t1,0($sp)
	jal L3
 lw $t1,0($sp)
addu $sp,$sp,4
	move $t2,$v0
	lw $t3,G11
seq $t4,$t2,$t3
	move $t1,$t4
	bnez $t1,L53
 subu $sp,$sp,4
 sw $t1,0($sp)
	jal L3
 lw $t1,0($sp)
addu $sp,$sp,4
	move $t5,$v0
	lw $t0,G12
seq $t6,$t5,$t0
	move $t1,$t6
L53 :
	beqz $t1,L52
	jal L3

	move $t2,$v0
	sw $t2,12($sp)
	move $a0,$t2
	jal L4

	jal L11

	move $t3,$v0
	sw $t3,8($sp)
	lw $t5,12($sp)
	lw $t0,G11
seq $t4,$t5,$t0
	beqz $t4,L54
	lw $t2,4($sp)
	lw $t3,8($sp)
mul $t5,$t2,$t3
	sw $t5,4($sp)
	j L55
L54 :
	lw $t0,4($sp)
	lw $t2,8($sp)
	bnez $t2,L56
	.data
LS12 :
	.byte  100 , 105 , 118 , 105 , 115 , 105 , 111 , 110 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 0
	.align 2
	.text
	la $a0,LS12
	j error
L56 :
div $t3,$t0,$t2
	sw $t3,4($sp)
L55 :
	j L51
L52 :
	lw $t5,4($sp)
	move $v0,$t5
	j L50
	.data
LS13 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 84 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS13
	j error
L50 :
	lw $ra,0($sp)
	addu $sp,$sp,16
	jr $ra
L11 :
	subu $sp,$sp,12
	sw $ra,0($sp)
	jal L3

	move $t0,$v0
	sw $t0,8($sp)
	lw $t1,8($sp)
	lw $t2,G13
seq $t3,$t1,$t2
	beqz $t3,L58
	lw $t4,G13
	move $a0,$t4
	jal L4

	jal L9

	move $t0,$v0
	sw $t0,4($sp)
	lw $t1,G14
	move $a0,$t1
	jal L4

	j L59
L58 :
	lw $t2,8($sp)
	lw $t4,G10
seq $t5,$t2,$t4
	beqz $t5,L60
	lw $t0,G10
	move $a0,$t0
	jal L4

	jal L11

	move $t1,$v0
negu $t1,$t1
	sw $t1,4($sp)
	j L61
L60 :
	lw $t2,8($sp)
	lw $t4,G8
seq $t6,$t2,$t4
	beqz $t6,L62
	lw $t0,G8
	move $a0,$t0
	jal L4

	lw $t1,G4
	sw $t1,4($sp)
	j L63
L62 :
	.data
LS14 :
	.byte  69 , 114 , 114 , 111 , 114 , 58 , 32 , 101 , 120 , 112 , 101 , 99 , 116 , 101 , 100 , 32 , 102 , 97 , 99 , 116 , 111 , 114 , 46 , 10 , 0
	.align 2
	.text
	la $s8,LS14
	move $a0,$s8
	jal Lprints

	jal Lhalt

L63 :
L61 :
L59 :
	lw $t2,4($sp)
	move $v0,$t2
	j L57
	.data
LS15 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 70 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS15
	j error
L57 :
	lw $ra,0($sp)
	addu $sp,$sp,12
	jr $ra
L12 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	li $t0,-1
	sw $t0,G5
	li $t1,48
	sw $t1,G15
	li $t2,57
	sw $t2,G16
	li $t3,43
	sw $t3,G17
	li $t0,45
	sw $t0,G18
	li $t1,42
	sw $t1,G19
	li $t2,47
	sw $t2,G20
	li $t3,40
	sw $t3,G21
	li $t0,41
	sw $t0,G22
	li $t1,32
	sw $t1,G23
	li $t2,9
	sw $t2,G24
	li $t3,13
	sw $t3,G25
	li $t0,10
	sw $t0,G26
	li $t1,256
	sw $t1,G6
	li $t2,257
	sw $t2,G8
	lw $t3,G17
	sw $t3,G9
	lw $t0,G18
	sw $t0,G10
	lw $t1,G19
	sw $t1,G11
	lw $t2,G20
	sw $t2,G12
	lw $t3,G21
	sw $t3,G13
	lw $t0,G22
	sw $t0,G14
	lw $t1,G26
	sw $t1,G7
L64 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
