
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
	.data
G27 :
	.word 0
	.text
	.data
G28 :
	.word 0
	.text
	.data
G29 :
	.word 0
	.text
	.data
G30 :
	.word 0
	.text
	.data
G31 :
	.word 0
	.text
	.data
G32 :
	.word 0
	.text
	.data
G33 :
	.word 0
	.text
	.data
G34 :
	.word 0
	.text
	.data
G35 :
	.word 0
	.text
	.data
G36 :
	.word 0
	.text
	.data
G37 :
	.word 0
	.text
	.data
G38 :
	.word 0
	.text
	.data
G39 :
	.word 0
	.text
	.data
G40 :
	.word 0
	.text
	.data
G41 :
	.word 0
	.text
	.data
G42 :
	.word 0
	.text
	.data
G43 :
	.word 0
	.text
	.data
G44 :
	.word 0
	.text
	.data
G45 :
	.word 0
	.text
	.data
G46 :
	.word 0
	.text
	.data
G47 :
	.word 0
	.text
	.data
G48 :
	.word 0
	.text
	.data
G49 :
	.word 0
	.text
	.data
G50 :
	.word 0
	.text
	.data
G51 :
	.word 0
	.text
	.data
G52 :
	.word 0
	.text
	.data
G53 :
	.word 0
	.text
	.data
G54 :
	.word 0
	.text
	.data
G55 :
	.word 0
	.text
	.data
G56 :
	.word 0
	.text
	.data
G57 :
	.word 0
	.text
	.data
G58 :
	.word 0
	.text
	.data
G59 :
	.word 0
	.text
	.data
G60 :
	.word 0
	.text
	.data
G61 :
	.word 0
	.text
	.data
G62 :
	.word 0
	.text
	.data
G63 :
	.word 0
	.text
	.data
G64 :
	.word 0
	.text
	.data
G65 :
	.word 0
	.text
	.data
G66 :
	.word 0
	.text
	.data
G67 :
	.word 0
	.text
	.data
G68 :
	.word 0
	.text
	.data
G69 :
	.word 0
	.text
	.data
G70 :
	.word 0
	.text
	.data
G71 :
	.word 0
	.text
	.data
G72 :
	.word 0
	.text
	.data
G73 :
	.word 0
	.text
	.data
G74 :
	.word 0
	.text
	.data
G75 :
	.word 0
	.text
	.data
G76 :
	.word 0
	.text
	.data
G77 :
	.word 0
	.text
	.data
G78 :
	.word 0
	.text
	.data
G79 :
	.word 0
	.text
	.data
G80 :
	.word 0
	.text
	.data
G81 :
	.word 0
	.text
	.data
G82 :
	.word 0
	.text
	.data
G83 :
	.word 0
	.text
	.data
G84 :
	.word 0
	.text
	.data
G85 :
	.word 0
	.text
	.data
G86 :
	.word 0
	.text
	.data
G87 :
	.word 0
	.text
	.data
G88 :
	.word 0
	.text
	.data
G89 :
	.word 0
	.text
	.data
G90 :
	.word 0
	.text
	.data
G91 :
	.word 0
	.text
	.data
G92 :
	.word 0
	.text
	.data
G93 :
	.word 0
	.text
	.data
G94 :
	.word 0
	.text
	.data
G95 :
	.word 0
	.text
	.data
G96 :
	.word 0
	.text
	.data
G97 :
	.word 0
	.text
	.data
G98 :
	.word 0
	.text
	.data
G99 :
	.word 0
	.text
	.data
G100 :
	.word 0
	.text
	.data
G101 :
	.word 0
	.text
	.data
G102 :
	.word 0
	.text
L0 :
	subu $sp,$sp,16
	sw $ra,0($sp)
	li $t0,1
	sw $t0,4($sp)
L4 :
	lw $t0,4($sp)
	li $t1,100
sle $t2,$t0,$t1
	beqz $t2,L5
	lw $t0,4($sp)
	li $t1,1
seq $t2,$t0,$t1
	beqz $t2,L6
	li $t0,0
	sw $t0,G1
	j L7
L6 :
	lw $t1,4($sp)
	li $t0,2
seq $t2,$t1,$t0
	beqz $t2,L8
	li $t1,0
	sw $t1,G2
	j L9
L8 :
	lw $t0,4($sp)
	li $t1,3
seq $t2,$t0,$t1
	beqz $t2,L10
	li $t0,0
	sw $t0,G3
	j L11
L10 :
	lw $t1,4($sp)
	li $t0,4
seq $t2,$t1,$t0
	beqz $t2,L12
	li $t1,0
	sw $t1,G4
	j L13
L12 :
	lw $t0,4($sp)
	li $t1,5
seq $t2,$t0,$t1
	beqz $t2,L14
	li $t0,0
	sw $t0,G5
	j L15
L14 :
	lw $t1,4($sp)
	li $t0,6
seq $t2,$t1,$t0
	beqz $t2,L16
	li $t1,0
	sw $t1,G6
	j L17
L16 :
	lw $t0,4($sp)
	li $t1,7
seq $t2,$t0,$t1
	beqz $t2,L18
	li $t0,0
	sw $t0,G7
	j L19
L18 :
	lw $t1,4($sp)
	li $t0,8
seq $t2,$t1,$t0
	beqz $t2,L20
	li $t1,0
	sw $t1,G8
	j L21
L20 :
	lw $t0,4($sp)
	li $t1,9
seq $t2,$t0,$t1
	beqz $t2,L22
	li $t0,0
	sw $t0,G9
	j L23
L22 :
	lw $t1,4($sp)
	li $t0,10
seq $t2,$t1,$t0
	beqz $t2,L24
	li $t1,0
	sw $t1,G10
	j L25
L24 :
	lw $t0,4($sp)
	li $t1,11
seq $t2,$t0,$t1
	beqz $t2,L26
	li $t0,0
	sw $t0,G11
	j L27
L26 :
	lw $t1,4($sp)
	li $t0,12
seq $t2,$t1,$t0
	beqz $t2,L28
	li $t1,0
	sw $t1,G12
	j L29
L28 :
	lw $t0,4($sp)
	li $t1,13
seq $t2,$t0,$t1
	beqz $t2,L30
	li $t0,0
	sw $t0,G13
	j L31
L30 :
	lw $t1,4($sp)
	li $t0,14
seq $t2,$t1,$t0
	beqz $t2,L32
	li $t1,0
	sw $t1,G14
	j L33
L32 :
	lw $t0,4($sp)
	li $t1,15
seq $t2,$t0,$t1
	beqz $t2,L34
	li $t0,0
	sw $t0,G15
	j L35
L34 :
	lw $t1,4($sp)
	li $t0,16
seq $t2,$t1,$t0
	beqz $t2,L36
	li $t1,0
	sw $t1,G16
	j L37
L36 :
	lw $t0,4($sp)
	li $t1,17
seq $t2,$t0,$t1
	beqz $t2,L38
	li $t0,0
	sw $t0,G17
	j L39
L38 :
	lw $t1,4($sp)
	li $t0,18
seq $t2,$t1,$t0
	beqz $t2,L40
	li $t1,0
	sw $t1,G18
	j L41
L40 :
	lw $t0,4($sp)
	li $t1,19
seq $t2,$t0,$t1
	beqz $t2,L42
	li $t0,0
	sw $t0,G19
	j L43
L42 :
	lw $t1,4($sp)
	li $t0,20
seq $t2,$t1,$t0
	beqz $t2,L44
	li $t1,0
	sw $t1,G20
	j L45
L44 :
	lw $t0,4($sp)
	li $t1,21
seq $t2,$t0,$t1
	beqz $t2,L46
	li $t0,0
	sw $t0,G21
	j L47
L46 :
	lw $t1,4($sp)
	li $t0,22
seq $t2,$t1,$t0
	beqz $t2,L48
	li $t1,0
	sw $t1,G22
	j L49
L48 :
	lw $t0,4($sp)
	li $t1,23
seq $t2,$t0,$t1
	beqz $t2,L50
	li $t0,0
	sw $t0,G23
	j L51
L50 :
	lw $t1,4($sp)
	li $t0,24
seq $t2,$t1,$t0
	beqz $t2,L52
	li $t1,0
	sw $t1,G24
	j L53
L52 :
	lw $t0,4($sp)
	li $t1,25
seq $t2,$t0,$t1
	beqz $t2,L54
	li $t0,0
	sw $t0,G25
	j L55
L54 :
	lw $t1,4($sp)
	li $t0,26
seq $t2,$t1,$t0
	beqz $t2,L56
	li $t1,0
	sw $t1,G26
	j L57
L56 :
	lw $t0,4($sp)
	li $t1,27
seq $t2,$t0,$t1
	beqz $t2,L58
	li $t0,0
	sw $t0,G27
	j L59
L58 :
	lw $t1,4($sp)
	li $t0,28
seq $t2,$t1,$t0
	beqz $t2,L60
	li $t1,0
	sw $t1,G28
	j L61
L60 :
	lw $t0,4($sp)
	li $t1,29
seq $t2,$t0,$t1
	beqz $t2,L62
	li $t0,0
	sw $t0,G29
	j L63
L62 :
	lw $t1,4($sp)
	li $t0,30
seq $t2,$t1,$t0
	beqz $t2,L64
	li $t1,0
	sw $t1,G30
	j L65
L64 :
	lw $t0,4($sp)
	li $t1,31
seq $t2,$t0,$t1
	beqz $t2,L66
	li $t0,0
	sw $t0,G31
	j L67
L66 :
	lw $t1,4($sp)
	li $t0,32
seq $t2,$t1,$t0
	beqz $t2,L68
	li $t1,0
	sw $t1,G32
	j L69
L68 :
	lw $t0,4($sp)
	li $t1,33
seq $t2,$t0,$t1
	beqz $t2,L70
	li $t0,0
	sw $t0,G33
	j L71
L70 :
	lw $t1,4($sp)
	li $t0,34
seq $t2,$t1,$t0
	beqz $t2,L72
	li $t1,0
	sw $t1,G34
	j L73
L72 :
	lw $t0,4($sp)
	li $t1,35
seq $t2,$t0,$t1
	beqz $t2,L74
	li $t0,0
	sw $t0,G35
	j L75
L74 :
	lw $t1,4($sp)
	li $t0,36
seq $t2,$t1,$t0
	beqz $t2,L76
	li $t1,0
	sw $t1,G36
	j L77
L76 :
	lw $t0,4($sp)
	li $t1,37
seq $t2,$t0,$t1
	beqz $t2,L78
	li $t0,0
	sw $t0,G37
	j L79
L78 :
	lw $t1,4($sp)
	li $t0,38
seq $t2,$t1,$t0
	beqz $t2,L80
	li $t1,0
	sw $t1,G38
	j L81
L80 :
	lw $t0,4($sp)
	li $t1,39
seq $t2,$t0,$t1
	beqz $t2,L82
	li $t0,0
	sw $t0,G39
	j L83
L82 :
	lw $t1,4($sp)
	li $t0,40
seq $t2,$t1,$t0
	beqz $t2,L84
	li $t1,0
	sw $t1,G40
	j L85
L84 :
	lw $t0,4($sp)
	li $t1,41
seq $t2,$t0,$t1
	beqz $t2,L86
	li $t0,0
	sw $t0,G41
	j L87
L86 :
	lw $t1,4($sp)
	li $t0,42
seq $t2,$t1,$t0
	beqz $t2,L88
	li $t1,0
	sw $t1,G42
	j L89
L88 :
	lw $t0,4($sp)
	li $t1,43
seq $t2,$t0,$t1
	beqz $t2,L90
	li $t0,0
	sw $t0,G43
	j L91
L90 :
	lw $t1,4($sp)
	li $t0,44
seq $t2,$t1,$t0
	beqz $t2,L92
	li $t1,0
	sw $t1,G44
	j L93
L92 :
	lw $t0,4($sp)
	li $t1,45
seq $t2,$t0,$t1
	beqz $t2,L94
	li $t0,0
	sw $t0,G45
	j L95
L94 :
	lw $t1,4($sp)
	li $t0,46
seq $t2,$t1,$t0
	beqz $t2,L96
	li $t1,0
	sw $t1,G46
	j L97
L96 :
	lw $t0,4($sp)
	li $t1,47
seq $t2,$t0,$t1
	beqz $t2,L98
	li $t0,0
	sw $t0,G47
	j L99
L98 :
	lw $t1,4($sp)
	li $t0,48
seq $t2,$t1,$t0
	beqz $t2,L100
	li $t1,0
	sw $t1,G48
	j L101
L100 :
	lw $t0,4($sp)
	li $t1,49
seq $t2,$t0,$t1
	beqz $t2,L102
	li $t0,0
	sw $t0,G49
	j L103
L102 :
	lw $t1,4($sp)
	li $t0,50
seq $t2,$t1,$t0
	beqz $t2,L104
	li $t1,0
	sw $t1,G50
	j L105
L104 :
	lw $t0,4($sp)
	li $t1,51
seq $t2,$t0,$t1
	beqz $t2,L106
	li $t0,0
	sw $t0,G51
	j L107
L106 :
	lw $t1,4($sp)
	li $t0,52
seq $t2,$t1,$t0
	beqz $t2,L108
	li $t1,0
	sw $t1,G52
	j L109
L108 :
	lw $t0,4($sp)
	li $t1,53
seq $t2,$t0,$t1
	beqz $t2,L110
	li $t0,0
	sw $t0,G53
	j L111
L110 :
	lw $t1,4($sp)
	li $t0,54
seq $t2,$t1,$t0
	beqz $t2,L112
	li $t1,0
	sw $t1,G54
	j L113
L112 :
	lw $t0,4($sp)
	li $t1,55
seq $t2,$t0,$t1
	beqz $t2,L114
	li $t0,0
	sw $t0,G55
	j L115
L114 :
	lw $t1,4($sp)
	li $t0,56
seq $t2,$t1,$t0
	beqz $t2,L116
	li $t1,0
	sw $t1,G56
	j L117
L116 :
	lw $t0,4($sp)
	li $t1,57
seq $t2,$t0,$t1
	beqz $t2,L118
	li $t0,0
	sw $t0,G57
	j L119
L118 :
	lw $t1,4($sp)
	li $t0,58
seq $t2,$t1,$t0
	beqz $t2,L120
	li $t1,0
	sw $t1,G58
	j L121
L120 :
	lw $t0,4($sp)
	li $t1,59
seq $t2,$t0,$t1
	beqz $t2,L122
	li $t0,0
	sw $t0,G59
	j L123
L122 :
	lw $t1,4($sp)
	li $t0,60
seq $t2,$t1,$t0
	beqz $t2,L124
	li $t1,0
	sw $t1,G60
	j L125
L124 :
	lw $t0,4($sp)
	li $t1,61
seq $t2,$t0,$t1
	beqz $t2,L126
	li $t0,0
	sw $t0,G61
	j L127
L126 :
	lw $t1,4($sp)
	li $t0,62
seq $t2,$t1,$t0
	beqz $t2,L128
	li $t1,0
	sw $t1,G62
	j L129
L128 :
	lw $t0,4($sp)
	li $t1,63
seq $t2,$t0,$t1
	beqz $t2,L130
	li $t0,0
	sw $t0,G63
	j L131
L130 :
	lw $t1,4($sp)
	li $t0,64
seq $t2,$t1,$t0
	beqz $t2,L132
	li $t1,0
	sw $t1,G64
	j L133
L132 :
	lw $t0,4($sp)
	li $t1,65
seq $t2,$t0,$t1
	beqz $t2,L134
	li $t0,0
	sw $t0,G65
	j L135
L134 :
	lw $t1,4($sp)
	li $t0,66
seq $t2,$t1,$t0
	beqz $t2,L136
	li $t1,0
	sw $t1,G66
	j L137
L136 :
	lw $t0,4($sp)
	li $t1,67
seq $t2,$t0,$t1
	beqz $t2,L138
	li $t0,0
	sw $t0,G67
	j L139
L138 :
	lw $t1,4($sp)
	li $t0,68
seq $t2,$t1,$t0
	beqz $t2,L140
	li $t1,0
	sw $t1,G68
	j L141
L140 :
	lw $t0,4($sp)
	li $t1,69
seq $t2,$t0,$t1
	beqz $t2,L142
	li $t0,0
	sw $t0,G69
	j L143
L142 :
	lw $t1,4($sp)
	li $t0,70
seq $t2,$t1,$t0
	beqz $t2,L144
	li $t1,0
	sw $t1,G70
	j L145
L144 :
	lw $t0,4($sp)
	li $t1,71
seq $t2,$t0,$t1
	beqz $t2,L146
	li $t0,0
	sw $t0,G71
	j L147
L146 :
	lw $t1,4($sp)
	li $t0,72
seq $t2,$t1,$t0
	beqz $t2,L148
	li $t1,0
	sw $t1,G72
	j L149
L148 :
	lw $t0,4($sp)
	li $t1,73
seq $t2,$t0,$t1
	beqz $t2,L150
	li $t0,0
	sw $t0,G73
	j L151
L150 :
	lw $t1,4($sp)
	li $t0,74
seq $t2,$t1,$t0
	beqz $t2,L152
	li $t1,0
	sw $t1,G74
	j L153
L152 :
	lw $t0,4($sp)
	li $t1,75
seq $t2,$t0,$t1
	beqz $t2,L154
	li $t0,0
	sw $t0,G75
	j L155
L154 :
	lw $t1,4($sp)
	li $t0,76
seq $t2,$t1,$t0
	beqz $t2,L156
	li $t1,0
	sw $t1,G76
	j L157
L156 :
	lw $t0,4($sp)
	li $t1,77
seq $t2,$t0,$t1
	beqz $t2,L158
	li $t0,0
	sw $t0,G77
	j L159
L158 :
	lw $t1,4($sp)
	li $t0,78
seq $t2,$t1,$t0
	beqz $t2,L160
	li $t1,0
	sw $t1,G78
	j L161
L160 :
	lw $t0,4($sp)
	li $t1,79
seq $t2,$t0,$t1
	beqz $t2,L162
	li $t0,0
	sw $t0,G79
	j L163
L162 :
	lw $t1,4($sp)
	li $t0,80
seq $t2,$t1,$t0
	beqz $t2,L164
	li $t1,0
	sw $t1,G80
	j L165
L164 :
	lw $t0,4($sp)
	li $t1,81
seq $t2,$t0,$t1
	beqz $t2,L166
	li $t0,0
	sw $t0,G81
	j L167
L166 :
	lw $t1,4($sp)
	li $t0,82
seq $t2,$t1,$t0
	beqz $t2,L168
	li $t1,0
	sw $t1,G82
	j L169
L168 :
	lw $t0,4($sp)
	li $t1,83
seq $t2,$t0,$t1
	beqz $t2,L170
	li $t0,0
	sw $t0,G83
	j L171
L170 :
	lw $t1,4($sp)
	li $t0,84
seq $t2,$t1,$t0
	beqz $t2,L172
	li $t1,0
	sw $t1,G84
	j L173
L172 :
	lw $t0,4($sp)
	li $t1,85
seq $t2,$t0,$t1
	beqz $t2,L174
	li $t0,0
	sw $t0,G85
	j L175
L174 :
	lw $t1,4($sp)
	li $t0,86
seq $t2,$t1,$t0
	beqz $t2,L176
	li $t1,0
	sw $t1,G86
	j L177
L176 :
	lw $t0,4($sp)
	li $t1,87
seq $t2,$t0,$t1
	beqz $t2,L178
	li $t0,0
	sw $t0,G87
	j L179
L178 :
	lw $t1,4($sp)
	li $t0,88
seq $t2,$t1,$t0
	beqz $t2,L180
	li $t1,0
	sw $t1,G88
	j L181
L180 :
	lw $t0,4($sp)
	li $t1,89
seq $t2,$t0,$t1
	beqz $t2,L182
	li $t0,0
	sw $t0,G89
	j L183
L182 :
	lw $t1,4($sp)
	li $t0,90
seq $t2,$t1,$t0
	beqz $t2,L184
	li $t1,0
	sw $t1,G90
	j L185
L184 :
	lw $t0,4($sp)
	li $t1,91
seq $t2,$t0,$t1
	beqz $t2,L186
	li $t0,0
	sw $t0,G91
	j L187
L186 :
	lw $t1,4($sp)
	li $t0,92
seq $t2,$t1,$t0
	beqz $t2,L188
	li $t1,0
	sw $t1,G92
	j L189
L188 :
	lw $t0,4($sp)
	li $t1,93
seq $t2,$t0,$t1
	beqz $t2,L190
	li $t0,0
	sw $t0,G93
	j L191
L190 :
	lw $t1,4($sp)
	li $t0,94
seq $t2,$t1,$t0
	beqz $t2,L192
	li $t1,0
	sw $t1,G94
	j L193
L192 :
	lw $t0,4($sp)
	li $t1,95
seq $t2,$t0,$t1
	beqz $t2,L194
	li $t0,0
	sw $t0,G95
	j L195
L194 :
	lw $t1,4($sp)
	li $t0,96
seq $t2,$t1,$t0
	beqz $t2,L196
	li $t1,0
	sw $t1,G96
	j L197
L196 :
	lw $t0,4($sp)
	li $t1,97
seq $t2,$t0,$t1
	beqz $t2,L198
	li $t0,0
	sw $t0,G97
	j L199
L198 :
	lw $t1,4($sp)
	li $t0,98
seq $t2,$t1,$t0
	beqz $t2,L200
	li $t1,0
	sw $t1,G98
	j L201
L200 :
	lw $t0,4($sp)
	li $t1,99
seq $t2,$t0,$t1
	beqz $t2,L202
	li $t0,0
	sw $t0,G99
	j L203
L202 :
	lw $t1,4($sp)
	li $t0,100
seq $t2,$t1,$t0
	beqz $t2,L204
	li $t1,0
	sw $t1,G100
L204 :
L203 :
L201 :
L199 :
L197 :
L195 :
L193 :
L191 :
L189 :
L187 :
L185 :
L183 :
L181 :
L179 :
L177 :
L175 :
L173 :
L171 :
L169 :
L167 :
L165 :
L163 :
L161 :
L159 :
L157 :
L155 :
L153 :
L151 :
L149 :
L147 :
L145 :
L143 :
L141 :
L139 :
L137 :
L135 :
L133 :
L131 :
L129 :
L127 :
L125 :
L123 :
L121 :
L119 :
L117 :
L115 :
L113 :
L111 :
L109 :
L107 :
L105 :
L103 :
L101 :
L99 :
L97 :
L95 :
L93 :
L91 :
L89 :
L87 :
L85 :
L83 :
L81 :
L79 :
L77 :
L75 :
L73 :
L71 :
L69 :
L67 :
L65 :
L63 :
L61 :
L59 :
L57 :
L55 :
L53 :
L51 :
L49 :
L47 :
L45 :
L43 :
L41 :
L39 :
L37 :
L35 :
L33 :
L31 :
L29 :
L27 :
L25 :
L23 :
L21 :
L19 :
L17 :
L15 :
L13 :
L11 :
L9 :
L7 :
	lw $t0,4($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,4($sp)
	j L4
L5 :
	li $t0,2
	sw $t0,4($sp)
L205 :
	lw $t1,4($sp)
	li $t3,10
sle $t2,$t1,$t3
	beqz $t2,L206
	lw $t0,4($sp)
	lw $t1,4($sp)
addu $t3,$t0,$t1
	sw $t3,8($sp)
L207 :
	lw $t0,8($sp)
	li $t1,100
sle $t2,$t0,$t1
	beqz $t2,L208
	lw $t3,8($sp)
	li $t0,2
seq $t2,$t3,$t0
	beqz $t2,L209
	li $t1,1
	sw $t1,G2
	li $t3,2
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L210
L209 :
	lw $t3,8($sp)
	li $t0,3
seq $t2,$t3,$t0
	beqz $t2,L211
	li $t1,1
	sw $t1,G3
	li $t3,3
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L212
L211 :
	lw $t3,8($sp)
	li $t0,4
seq $t2,$t3,$t0
	beqz $t2,L213
	li $t1,1
	sw $t1,G4
	li $t3,4
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L214
L213 :
	lw $t3,8($sp)
	li $t0,5
seq $t2,$t3,$t0
	beqz $t2,L215
	li $t1,1
	sw $t1,G5
	li $t3,5
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L216
L215 :
	lw $t3,8($sp)
	li $t0,6
seq $t2,$t3,$t0
	beqz $t2,L217
	li $t1,1
	sw $t1,G6
	li $t3,6
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L218
L217 :
	lw $t3,8($sp)
	li $t0,7
seq $t2,$t3,$t0
	beqz $t2,L219
	li $t1,1
	sw $t1,G7
	li $t3,7
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L220
L219 :
	lw $t3,8($sp)
	li $t0,8
seq $t2,$t3,$t0
	beqz $t2,L221
	li $t1,1
	sw $t1,G8
	li $t3,8
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L222
L221 :
	lw $t3,8($sp)
	li $t0,9
seq $t2,$t3,$t0
	beqz $t2,L223
	li $t1,1
	sw $t1,G9
	li $t3,9
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L224
L223 :
	lw $t3,8($sp)
	li $t0,10
seq $t2,$t3,$t0
	beqz $t2,L225
	li $t1,1
	sw $t1,G10
	li $t3,10
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L226
L225 :
	lw $t3,8($sp)
	li $t0,11
seq $t2,$t3,$t0
	beqz $t2,L227
	li $t1,1
	sw $t1,G11
	li $t3,11
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L228
L227 :
	lw $t3,8($sp)
	li $t0,12
seq $t2,$t3,$t0
	beqz $t2,L229
	li $t1,1
	sw $t1,G12
	li $t3,12
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L230
L229 :
	lw $t3,8($sp)
	li $t0,13
seq $t2,$t3,$t0
	beqz $t2,L231
	li $t1,1
	sw $t1,G13
	li $t3,13
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L232
L231 :
	lw $t3,8($sp)
	li $t0,14
seq $t2,$t3,$t0
	beqz $t2,L233
	li $t1,1
	sw $t1,G14
	li $t3,14
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L234
L233 :
	lw $t3,8($sp)
	li $t0,15
seq $t2,$t3,$t0
	beqz $t2,L235
	li $t1,1
	sw $t1,G15
	li $t3,15
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L236
L235 :
	lw $t3,8($sp)
	li $t0,16
seq $t2,$t3,$t0
	beqz $t2,L237
	li $t1,1
	sw $t1,G16
	li $t3,16
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L238
L237 :
	lw $t3,8($sp)
	li $t0,17
seq $t2,$t3,$t0
	beqz $t2,L239
	li $t1,1
	sw $t1,G17
	li $t3,17
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L240
L239 :
	lw $t3,8($sp)
	li $t0,18
seq $t2,$t3,$t0
	beqz $t2,L241
	li $t1,1
	sw $t1,G18
	li $t3,18
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L242
L241 :
	lw $t3,8($sp)
	li $t0,19
seq $t2,$t3,$t0
	beqz $t2,L243
	li $t1,1
	sw $t1,G19
	li $t3,19
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L244
L243 :
	lw $t3,8($sp)
	li $t0,20
seq $t2,$t3,$t0
	beqz $t2,L245
	li $t1,1
	sw $t1,G20
	li $t3,20
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L246
L245 :
	lw $t3,8($sp)
	li $t0,21
seq $t2,$t3,$t0
	beqz $t2,L247
	li $t1,1
	sw $t1,G21
	li $t3,21
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L248
L247 :
	lw $t3,8($sp)
	li $t0,22
seq $t2,$t3,$t0
	beqz $t2,L249
	li $t1,1
	sw $t1,G22
	li $t3,22
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L250
L249 :
	lw $t3,8($sp)
	li $t0,23
seq $t2,$t3,$t0
	beqz $t2,L251
	li $t1,1
	sw $t1,G23
	li $t3,23
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L252
L251 :
	lw $t3,8($sp)
	li $t0,24
seq $t2,$t3,$t0
	beqz $t2,L253
	li $t1,1
	sw $t1,G24
	li $t3,24
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L254
L253 :
	lw $t3,8($sp)
	li $t0,25
seq $t2,$t3,$t0
	beqz $t2,L255
	li $t1,1
	sw $t1,G25
	li $t3,25
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L256
L255 :
	lw $t3,8($sp)
	li $t0,26
seq $t2,$t3,$t0
	beqz $t2,L257
	li $t1,1
	sw $t1,G26
	li $t3,26
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L258
L257 :
	lw $t3,8($sp)
	li $t0,27
seq $t2,$t3,$t0
	beqz $t2,L259
	li $t1,1
	sw $t1,G27
	li $t3,27
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L260
L259 :
	lw $t3,8($sp)
	li $t0,28
seq $t2,$t3,$t0
	beqz $t2,L261
	li $t1,1
	sw $t1,G28
	li $t3,28
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L262
L261 :
	lw $t3,8($sp)
	li $t0,29
seq $t2,$t3,$t0
	beqz $t2,L263
	li $t1,1
	sw $t1,G29
	li $t3,29
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L264
L263 :
	lw $t3,8($sp)
	li $t0,30
seq $t2,$t3,$t0
	beqz $t2,L265
	li $t1,1
	sw $t1,G30
	li $t3,30
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L266
L265 :
	lw $t3,8($sp)
	li $t0,31
seq $t2,$t3,$t0
	beqz $t2,L267
	li $t1,1
	sw $t1,G31
	li $t3,31
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L268
L267 :
	lw $t3,8($sp)
	li $t0,32
seq $t2,$t3,$t0
	beqz $t2,L269
	li $t1,1
	sw $t1,G32
	li $t3,32
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L270
L269 :
	lw $t3,8($sp)
	li $t0,33
seq $t2,$t3,$t0
	beqz $t2,L271
	li $t1,1
	sw $t1,G33
	li $t3,33
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L272
L271 :
	lw $t3,8($sp)
	li $t0,34
seq $t2,$t3,$t0
	beqz $t2,L273
	li $t1,1
	sw $t1,G34
	li $t3,34
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L274
L273 :
	lw $t3,8($sp)
	li $t0,35
seq $t2,$t3,$t0
	beqz $t2,L275
	li $t1,1
	sw $t1,G35
	li $t3,35
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L276
L275 :
	lw $t3,8($sp)
	li $t0,36
seq $t2,$t3,$t0
	beqz $t2,L277
	li $t1,1
	sw $t1,G36
	li $t3,36
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L278
L277 :
	lw $t3,8($sp)
	li $t0,37
seq $t2,$t3,$t0
	beqz $t2,L279
	li $t1,1
	sw $t1,G37
	li $t3,37
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L280
L279 :
	lw $t3,8($sp)
	li $t0,38
seq $t2,$t3,$t0
	beqz $t2,L281
	li $t1,1
	sw $t1,G38
	li $t3,38
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L282
L281 :
	lw $t3,8($sp)
	li $t0,39
seq $t2,$t3,$t0
	beqz $t2,L283
	li $t1,1
	sw $t1,G39
	li $t3,39
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L284
L283 :
	lw $t3,8($sp)
	li $t0,40
seq $t2,$t3,$t0
	beqz $t2,L285
	li $t1,1
	sw $t1,G40
	li $t3,40
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L286
L285 :
	lw $t3,8($sp)
	li $t0,41
seq $t2,$t3,$t0
	beqz $t2,L287
	li $t1,1
	sw $t1,G41
	li $t3,41
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L288
L287 :
	lw $t3,8($sp)
	li $t0,42
seq $t2,$t3,$t0
	beqz $t2,L289
	li $t1,1
	sw $t1,G42
	li $t3,42
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L290
L289 :
	lw $t3,8($sp)
	li $t0,43
seq $t2,$t3,$t0
	beqz $t2,L291
	li $t1,1
	sw $t1,G43
	li $t3,43
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L292
L291 :
	lw $t3,8($sp)
	li $t0,44
seq $t2,$t3,$t0
	beqz $t2,L293
	li $t1,1
	sw $t1,G44
	li $t3,44
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L294
L293 :
	lw $t3,8($sp)
	li $t0,45
seq $t2,$t3,$t0
	beqz $t2,L295
	li $t1,1
	sw $t1,G45
	li $t3,45
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L296
L295 :
	lw $t3,8($sp)
	li $t0,46
seq $t2,$t3,$t0
	beqz $t2,L297
	li $t1,1
	sw $t1,G46
	li $t3,46
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L298
L297 :
	lw $t3,8($sp)
	li $t0,47
seq $t2,$t3,$t0
	beqz $t2,L299
	li $t1,1
	sw $t1,G47
	li $t3,47
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L300
L299 :
	lw $t3,8($sp)
	li $t0,48
seq $t2,$t3,$t0
	beqz $t2,L301
	li $t1,1
	sw $t1,G48
	li $t3,48
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L302
L301 :
	lw $t3,8($sp)
	li $t0,49
seq $t2,$t3,$t0
	beqz $t2,L303
	li $t1,1
	sw $t1,G49
	li $t3,49
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L304
L303 :
	lw $t3,8($sp)
	li $t0,50
seq $t2,$t3,$t0
	beqz $t2,L305
	li $t1,1
	sw $t1,G50
	li $t3,50
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L306
L305 :
	lw $t3,8($sp)
	li $t0,51
seq $t2,$t3,$t0
	beqz $t2,L307
	li $t1,1
	sw $t1,G51
	li $t3,51
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L308
L307 :
	lw $t3,8($sp)
	li $t0,52
seq $t2,$t3,$t0
	beqz $t2,L309
	li $t1,1
	sw $t1,G52
	li $t3,52
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L310
L309 :
	lw $t3,8($sp)
	li $t0,53
seq $t2,$t3,$t0
	beqz $t2,L311
	li $t1,1
	sw $t1,G53
	li $t3,53
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L312
L311 :
	lw $t3,8($sp)
	li $t0,54
seq $t2,$t3,$t0
	beqz $t2,L313
	li $t1,1
	sw $t1,G54
	li $t3,54
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L314
L313 :
	lw $t3,8($sp)
	li $t0,55
seq $t2,$t3,$t0
	beqz $t2,L315
	li $t1,1
	sw $t1,G55
	li $t3,55
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L316
L315 :
	lw $t3,8($sp)
	li $t0,56
seq $t2,$t3,$t0
	beqz $t2,L317
	li $t1,1
	sw $t1,G56
	li $t3,56
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L318
L317 :
	lw $t3,8($sp)
	li $t0,57
seq $t2,$t3,$t0
	beqz $t2,L319
	li $t1,1
	sw $t1,G57
	li $t3,57
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L320
L319 :
	lw $t3,8($sp)
	li $t0,58
seq $t2,$t3,$t0
	beqz $t2,L321
	li $t1,1
	sw $t1,G58
	li $t3,58
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L322
L321 :
	lw $t3,8($sp)
	li $t0,59
seq $t2,$t3,$t0
	beqz $t2,L323
	li $t1,1
	sw $t1,G59
	li $t3,59
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L324
L323 :
	lw $t3,8($sp)
	li $t0,60
seq $t2,$t3,$t0
	beqz $t2,L325
	li $t1,1
	sw $t1,G60
	li $t3,60
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L326
L325 :
	lw $t3,8($sp)
	li $t0,61
seq $t2,$t3,$t0
	beqz $t2,L327
	li $t1,1
	sw $t1,G61
	li $t3,61
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L328
L327 :
	lw $t3,8($sp)
	li $t0,62
seq $t2,$t3,$t0
	beqz $t2,L329
	li $t1,1
	sw $t1,G62
	li $t3,62
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L330
L329 :
	lw $t3,8($sp)
	li $t0,63
seq $t2,$t3,$t0
	beqz $t2,L331
	li $t1,1
	sw $t1,G63
	li $t3,63
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L332
L331 :
	lw $t3,8($sp)
	li $t0,64
seq $t2,$t3,$t0
	beqz $t2,L333
	li $t1,1
	sw $t1,G64
	li $t3,64
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L334
L333 :
	lw $t3,8($sp)
	li $t0,65
seq $t2,$t3,$t0
	beqz $t2,L335
	li $t1,1
	sw $t1,G65
	li $t3,65
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L336
L335 :
	lw $t3,8($sp)
	li $t0,66
seq $t2,$t3,$t0
	beqz $t2,L337
	li $t1,1
	sw $t1,G66
	li $t3,66
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L338
L337 :
	lw $t3,8($sp)
	li $t0,67
seq $t2,$t3,$t0
	beqz $t2,L339
	li $t1,1
	sw $t1,G67
	li $t3,67
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L340
L339 :
	lw $t3,8($sp)
	li $t0,68
seq $t2,$t3,$t0
	beqz $t2,L341
	li $t1,1
	sw $t1,G68
	li $t3,68
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L342
L341 :
	lw $t3,8($sp)
	li $t0,69
seq $t2,$t3,$t0
	beqz $t2,L343
	li $t1,1
	sw $t1,G69
	li $t3,69
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L344
L343 :
	lw $t3,8($sp)
	li $t0,70
seq $t2,$t3,$t0
	beqz $t2,L345
	li $t1,1
	sw $t1,G70
	li $t3,70
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L346
L345 :
	lw $t3,8($sp)
	li $t0,71
seq $t2,$t3,$t0
	beqz $t2,L347
	li $t1,1
	sw $t1,G71
	li $t3,71
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L348
L347 :
	lw $t3,8($sp)
	li $t0,72
seq $t2,$t3,$t0
	beqz $t2,L349
	li $t1,1
	sw $t1,G72
	li $t3,72
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L350
L349 :
	lw $t3,8($sp)
	li $t0,73
seq $t2,$t3,$t0
	beqz $t2,L351
	li $t1,1
	sw $t1,G73
	li $t3,73
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L352
L351 :
	lw $t3,8($sp)
	li $t0,74
seq $t2,$t3,$t0
	beqz $t2,L353
	li $t1,1
	sw $t1,G74
	li $t3,74
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L354
L353 :
	lw $t3,8($sp)
	li $t0,75
seq $t2,$t3,$t0
	beqz $t2,L355
	li $t1,1
	sw $t1,G75
	li $t3,75
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L356
L355 :
	lw $t3,8($sp)
	li $t0,76
seq $t2,$t3,$t0
	beqz $t2,L357
	li $t1,1
	sw $t1,G76
	li $t3,76
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L358
L357 :
	lw $t3,8($sp)
	li $t0,77
seq $t2,$t3,$t0
	beqz $t2,L359
	li $t1,1
	sw $t1,G77
	li $t3,77
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L360
L359 :
	lw $t3,8($sp)
	li $t0,78
seq $t2,$t3,$t0
	beqz $t2,L361
	li $t1,1
	sw $t1,G78
	li $t3,78
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L362
L361 :
	lw $t3,8($sp)
	li $t0,79
seq $t2,$t3,$t0
	beqz $t2,L363
	li $t1,1
	sw $t1,G79
	li $t3,79
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L364
L363 :
	lw $t3,8($sp)
	li $t0,80
seq $t2,$t3,$t0
	beqz $t2,L365
	li $t1,1
	sw $t1,G80
	li $t3,80
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L366
L365 :
	lw $t3,8($sp)
	li $t0,81
seq $t2,$t3,$t0
	beqz $t2,L367
	li $t1,1
	sw $t1,G81
	li $t3,81
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L368
L367 :
	lw $t3,8($sp)
	li $t0,82
seq $t2,$t3,$t0
	beqz $t2,L369
	li $t1,1
	sw $t1,G82
	li $t3,82
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L370
L369 :
	lw $t3,8($sp)
	li $t0,83
seq $t2,$t3,$t0
	beqz $t2,L371
	li $t1,1
	sw $t1,G83
	li $t3,83
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L372
L371 :
	lw $t3,8($sp)
	li $t0,84
seq $t2,$t3,$t0
	beqz $t2,L373
	li $t1,1
	sw $t1,G84
	li $t3,84
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L374
L373 :
	lw $t3,8($sp)
	li $t0,85
seq $t2,$t3,$t0
	beqz $t2,L375
	li $t1,1
	sw $t1,G85
	li $t3,85
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L376
L375 :
	lw $t3,8($sp)
	li $t0,86
seq $t2,$t3,$t0
	beqz $t2,L377
	li $t1,1
	sw $t1,G86
	li $t3,86
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L378
L377 :
	lw $t3,8($sp)
	li $t0,87
seq $t2,$t3,$t0
	beqz $t2,L379
	li $t1,1
	sw $t1,G87
	li $t3,87
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L380
L379 :
	lw $t3,8($sp)
	li $t0,88
seq $t2,$t3,$t0
	beqz $t2,L381
	li $t1,1
	sw $t1,G88
	li $t3,88
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L382
L381 :
	lw $t3,8($sp)
	li $t0,89
seq $t2,$t3,$t0
	beqz $t2,L383
	li $t1,1
	sw $t1,G89
	li $t3,89
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L384
L383 :
	lw $t3,8($sp)
	li $t0,90
seq $t2,$t3,$t0
	beqz $t2,L385
	li $t1,1
	sw $t1,G90
	li $t3,90
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L386
L385 :
	lw $t3,8($sp)
	li $t0,91
seq $t2,$t3,$t0
	beqz $t2,L387
	li $t1,1
	sw $t1,G91
	li $t3,91
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L388
L387 :
	lw $t3,8($sp)
	li $t0,92
seq $t2,$t3,$t0
	beqz $t2,L389
	li $t1,1
	sw $t1,G92
	li $t3,92
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L390
L389 :
	lw $t3,8($sp)
	li $t0,93
seq $t2,$t3,$t0
	beqz $t2,L391
	li $t1,1
	sw $t1,G93
	li $t3,93
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L392
L391 :
	lw $t3,8($sp)
	li $t0,94
seq $t2,$t3,$t0
	beqz $t2,L393
	li $t1,1
	sw $t1,G94
	li $t3,94
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L394
L393 :
	lw $t3,8($sp)
	li $t0,95
seq $t2,$t3,$t0
	beqz $t2,L395
	li $t1,1
	sw $t1,G95
	li $t3,95
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L396
L395 :
	lw $t3,8($sp)
	li $t0,96
seq $t2,$t3,$t0
	beqz $t2,L397
	li $t1,1
	sw $t1,G96
	li $t3,96
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L398
L397 :
	lw $t3,8($sp)
	li $t0,97
seq $t2,$t3,$t0
	beqz $t2,L399
	li $t1,1
	sw $t1,G97
	li $t3,97
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L400
L399 :
	lw $t3,8($sp)
	li $t0,98
seq $t2,$t3,$t0
	beqz $t2,L401
	li $t1,1
	sw $t1,G98
	li $t3,98
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L402
L401 :
	lw $t3,8($sp)
	li $t0,99
seq $t2,$t3,$t0
	beqz $t2,L403
	li $t1,1
	sw $t1,G99
	li $t3,99
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
	j L404
L403 :
	lw $t3,8($sp)
	li $t0,100
seq $t2,$t3,$t0
	beqz $t2,L405
	li $t1,1
	sw $t1,G100
	li $t3,100
	lw $t0,4($sp)
addu $t1,$t3,$t0
	sw $t1,8($sp)
L405 :
L404 :
L402 :
L400 :
L398 :
L396 :
L394 :
L392 :
L390 :
L388 :
L386 :
L384 :
L382 :
L380 :
L378 :
L376 :
L374 :
L372 :
L370 :
L368 :
L366 :
L364 :
L362 :
L360 :
L358 :
L356 :
L354 :
L352 :
L350 :
L348 :
L346 :
L344 :
L342 :
L340 :
L338 :
L336 :
L334 :
L332 :
L330 :
L328 :
L326 :
L324 :
L322 :
L320 :
L318 :
L316 :
L314 :
L312 :
L310 :
L308 :
L306 :
L304 :
L302 :
L300 :
L298 :
L296 :
L294 :
L292 :
L290 :
L288 :
L286 :
L284 :
L282 :
L280 :
L278 :
L276 :
L274 :
L272 :
L270 :
L268 :
L266 :
L264 :
L262 :
L260 :
L258 :
L256 :
L254 :
L252 :
L250 :
L248 :
L246 :
L244 :
L242 :
L240 :
L238 :
L236 :
L234 :
L232 :
L230 :
L228 :
L226 :
L224 :
L222 :
L220 :
L218 :
L216 :
L214 :
L212 :
L210 :
	j L207
L208 :
	lw $t3,4($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,4($sp)
	j L205
L206 :
	li $t3,1
	sw $t3,12($sp)
	.data
LS0 :
	.byte  50 , 10 , 0
	.align 2
	.text
	la $s8,LS0
	move $a0,$s8
	jal Lprints

	li $t0,3
	sw $t0,4($sp)
L406 :
	lw $t1,4($sp)
	li $t3,100
sle $t2,$t1,$t3
	beqz $t2,L407
	lw $t0,4($sp)
	li $t1,3
seq $t2,$t0,$t1
	beqz $t2,L408
	lw $t3,G3
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L410
	li $t1,3
	move $a0,$t1
	jal Lprinti

	.data
LS1 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS1
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L410 :
	j L409
L408 :
	lw $t3,4($sp)
	li $t0,4
seq $t2,$t3,$t0
	beqz $t2,L411
	lw $t1,G4
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L413
	li $t0,4
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

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L413 :
	j L412
L411 :
	lw $t1,4($sp)
	li $t3,5
seq $t2,$t1,$t3
	beqz $t2,L414
	lw $t0,G5
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L416
	li $t3,5
	move $a0,$t3
	jal Lprinti

	.data
LS3 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS3
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L416 :
	j L415
L414 :
	lw $t0,4($sp)
	li $t1,6
seq $t2,$t0,$t1
	beqz $t2,L417
	lw $t3,G6
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L419
	li $t1,6
	move $a0,$t1
	jal Lprinti

	.data
LS4 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS4
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L419 :
	j L418
L417 :
	lw $t3,4($sp)
	li $t0,7
seq $t2,$t3,$t0
	beqz $t2,L420
	lw $t1,G7
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L422
	li $t0,7
	move $a0,$t0
	jal Lprinti

	.data
LS5 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS5
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L422 :
	j L421
L420 :
	lw $t1,4($sp)
	li $t3,8
seq $t2,$t1,$t3
	beqz $t2,L423
	lw $t0,G8
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L425
	li $t3,8
	move $a0,$t3
	jal Lprinti

	.data
LS6 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS6
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L425 :
	j L424
L423 :
	lw $t0,4($sp)
	li $t1,9
seq $t2,$t0,$t1
	beqz $t2,L426
	lw $t3,G9
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L428
	li $t1,9
	move $a0,$t1
	jal Lprinti

	.data
LS7 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS7
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L428 :
	j L427
L426 :
	lw $t3,4($sp)
	li $t0,10
seq $t2,$t3,$t0
	beqz $t2,L429
	lw $t1,G10
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L431
	li $t0,10
	move $a0,$t0
	jal Lprinti

	.data
LS8 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS8
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L431 :
	j L430
L429 :
	lw $t1,4($sp)
	li $t3,11
seq $t2,$t1,$t3
	beqz $t2,L432
	lw $t0,G11
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L434
	li $t3,11
	move $a0,$t3
	jal Lprinti

	.data
LS9 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS9
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L434 :
	j L433
L432 :
	lw $t0,4($sp)
	li $t1,12
seq $t2,$t0,$t1
	beqz $t2,L435
	lw $t3,G12
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L437
	li $t1,12
	move $a0,$t1
	jal Lprinti

	.data
LS10 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS10
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L437 :
	j L436
L435 :
	lw $t3,4($sp)
	li $t0,13
seq $t2,$t3,$t0
	beqz $t2,L438
	lw $t1,G13
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L440
	li $t0,13
	move $a0,$t0
	jal Lprinti

	.data
LS11 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS11
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L440 :
	j L439
L438 :
	lw $t1,4($sp)
	li $t3,14
seq $t2,$t1,$t3
	beqz $t2,L441
	lw $t0,G14
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L443
	li $t3,14
	move $a0,$t3
	jal Lprinti

	.data
LS12 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS12
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L443 :
	j L442
L441 :
	lw $t0,4($sp)
	li $t1,15
seq $t2,$t0,$t1
	beqz $t2,L444
	lw $t3,G15
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L446
	li $t1,15
	move $a0,$t1
	jal Lprinti

	.data
LS13 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS13
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L446 :
	j L445
L444 :
	lw $t3,4($sp)
	li $t0,16
seq $t2,$t3,$t0
	beqz $t2,L447
	lw $t1,G16
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L449
	li $t0,16
	move $a0,$t0
	jal Lprinti

	.data
LS14 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS14
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L449 :
	j L448
L447 :
	lw $t1,4($sp)
	li $t3,17
seq $t2,$t1,$t3
	beqz $t2,L450
	lw $t0,G17
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L452
	li $t3,17
	move $a0,$t3
	jal Lprinti

	.data
LS15 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS15
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L452 :
	j L451
L450 :
	lw $t0,4($sp)
	li $t1,18
seq $t2,$t0,$t1
	beqz $t2,L453
	lw $t3,G18
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L455
	li $t1,18
	move $a0,$t1
	jal Lprinti

	.data
LS16 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS16
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L455 :
	j L454
L453 :
	lw $t3,4($sp)
	li $t0,19
seq $t2,$t3,$t0
	beqz $t2,L456
	lw $t1,G19
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L458
	li $t0,19
	move $a0,$t0
	jal Lprinti

	.data
LS17 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS17
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L458 :
	j L457
L456 :
	lw $t1,4($sp)
	li $t3,20
seq $t2,$t1,$t3
	beqz $t2,L459
	lw $t0,G20
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L461
	li $t3,20
	move $a0,$t3
	jal Lprinti

	.data
LS18 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS18
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L461 :
	j L460
L459 :
	lw $t0,4($sp)
	li $t1,21
seq $t2,$t0,$t1
	beqz $t2,L462
	lw $t3,G21
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L464
	li $t1,21
	move $a0,$t1
	jal Lprinti

	.data
LS19 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS19
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L464 :
	j L463
L462 :
	lw $t3,4($sp)
	li $t0,22
seq $t2,$t3,$t0
	beqz $t2,L465
	lw $t1,G22
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L467
	li $t0,22
	move $a0,$t0
	jal Lprinti

	.data
LS20 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS20
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L467 :
	j L466
L465 :
	lw $t1,4($sp)
	li $t3,23
seq $t2,$t1,$t3
	beqz $t2,L468
	lw $t0,G23
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L470
	li $t3,23
	move $a0,$t3
	jal Lprinti

	.data
LS21 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS21
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L470 :
	j L469
L468 :
	lw $t0,4($sp)
	li $t1,24
seq $t2,$t0,$t1
	beqz $t2,L471
	lw $t3,G24
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L473
	li $t1,24
	move $a0,$t1
	jal Lprinti

	.data
LS22 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS22
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L473 :
	j L472
L471 :
	lw $t3,4($sp)
	li $t0,25
seq $t2,$t3,$t0
	beqz $t2,L474
	lw $t1,G25
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L476
	li $t0,25
	move $a0,$t0
	jal Lprinti

	.data
LS23 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS23
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L476 :
	j L475
L474 :
	lw $t1,4($sp)
	li $t3,26
seq $t2,$t1,$t3
	beqz $t2,L477
	lw $t0,G26
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L479
	li $t3,26
	move $a0,$t3
	jal Lprinti

	.data
LS24 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS24
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L479 :
	j L478
L477 :
	lw $t0,4($sp)
	li $t1,27
seq $t2,$t0,$t1
	beqz $t2,L480
	lw $t3,G27
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L482
	li $t1,27
	move $a0,$t1
	jal Lprinti

	.data
LS25 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS25
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L482 :
	j L481
L480 :
	lw $t3,4($sp)
	li $t0,28
seq $t2,$t3,$t0
	beqz $t2,L483
	lw $t1,G28
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L485
	li $t0,28
	move $a0,$t0
	jal Lprinti

	.data
LS26 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS26
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L485 :
	j L484
L483 :
	lw $t1,4($sp)
	li $t3,29
seq $t2,$t1,$t3
	beqz $t2,L486
	lw $t0,G29
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L488
	li $t3,29
	move $a0,$t3
	jal Lprinti

	.data
LS27 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS27
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L488 :
	j L487
L486 :
	lw $t0,4($sp)
	li $t1,30
seq $t2,$t0,$t1
	beqz $t2,L489
	lw $t3,G30
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L491
	li $t1,30
	move $a0,$t1
	jal Lprinti

	.data
LS28 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS28
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L491 :
	j L490
L489 :
	lw $t3,4($sp)
	li $t0,31
seq $t2,$t3,$t0
	beqz $t2,L492
	lw $t1,G31
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L494
	li $t0,31
	move $a0,$t0
	jal Lprinti

	.data
LS29 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS29
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L494 :
	j L493
L492 :
	lw $t1,4($sp)
	li $t3,32
seq $t2,$t1,$t3
	beqz $t2,L495
	lw $t0,G32
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L497
	li $t3,32
	move $a0,$t3
	jal Lprinti

	.data
LS30 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS30
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L497 :
	j L496
L495 :
	lw $t0,4($sp)
	li $t1,33
seq $t2,$t0,$t1
	beqz $t2,L498
	lw $t3,G33
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L500
	li $t1,33
	move $a0,$t1
	jal Lprinti

	.data
LS31 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS31
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L500 :
	j L499
L498 :
	lw $t3,4($sp)
	li $t0,34
seq $t2,$t3,$t0
	beqz $t2,L501
	lw $t1,G34
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L503
	li $t0,34
	move $a0,$t0
	jal Lprinti

	.data
LS32 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS32
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L503 :
	j L502
L501 :
	lw $t1,4($sp)
	li $t3,35
seq $t2,$t1,$t3
	beqz $t2,L504
	lw $t0,G35
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L506
	li $t3,35
	move $a0,$t3
	jal Lprinti

	.data
LS33 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS33
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L506 :
	j L505
L504 :
	lw $t0,4($sp)
	li $t1,36
seq $t2,$t0,$t1
	beqz $t2,L507
	lw $t3,G36
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L509
	li $t1,36
	move $a0,$t1
	jal Lprinti

	.data
LS34 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS34
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L509 :
	j L508
L507 :
	lw $t3,4($sp)
	li $t0,37
seq $t2,$t3,$t0
	beqz $t2,L510
	lw $t1,G37
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L512
	li $t0,37
	move $a0,$t0
	jal Lprinti

	.data
LS35 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS35
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L512 :
	j L511
L510 :
	lw $t1,4($sp)
	li $t3,38
seq $t2,$t1,$t3
	beqz $t2,L513
	lw $t0,G38
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L515
	li $t3,38
	move $a0,$t3
	jal Lprinti

	.data
LS36 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS36
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L515 :
	j L514
L513 :
	lw $t0,4($sp)
	li $t1,39
seq $t2,$t0,$t1
	beqz $t2,L516
	lw $t3,G39
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L518
	li $t1,39
	move $a0,$t1
	jal Lprinti

	.data
LS37 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS37
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L518 :
	j L517
L516 :
	lw $t3,4($sp)
	li $t0,40
seq $t2,$t3,$t0
	beqz $t2,L519
	lw $t1,G40
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L521
	li $t0,40
	move $a0,$t0
	jal Lprinti

	.data
LS38 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS38
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L521 :
	j L520
L519 :
	lw $t1,4($sp)
	li $t3,41
seq $t2,$t1,$t3
	beqz $t2,L522
	lw $t0,G41
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L524
	li $t3,41
	move $a0,$t3
	jal Lprinti

	.data
LS39 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS39
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L524 :
	j L523
L522 :
	lw $t0,4($sp)
	li $t1,42
seq $t2,$t0,$t1
	beqz $t2,L525
	lw $t3,G42
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L527
	li $t1,42
	move $a0,$t1
	jal Lprinti

	.data
LS40 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS40
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L527 :
	j L526
L525 :
	lw $t3,4($sp)
	li $t0,43
seq $t2,$t3,$t0
	beqz $t2,L528
	lw $t1,G43
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L530
	li $t0,43
	move $a0,$t0
	jal Lprinti

	.data
LS41 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS41
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L530 :
	j L529
L528 :
	lw $t1,4($sp)
	li $t3,44
seq $t2,$t1,$t3
	beqz $t2,L531
	lw $t0,G44
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L533
	li $t3,44
	move $a0,$t3
	jal Lprinti

	.data
LS42 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS42
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L533 :
	j L532
L531 :
	lw $t0,4($sp)
	li $t1,45
seq $t2,$t0,$t1
	beqz $t2,L534
	lw $t3,G45
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L536
	li $t1,45
	move $a0,$t1
	jal Lprinti

	.data
LS43 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS43
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L536 :
	j L535
L534 :
	lw $t3,4($sp)
	li $t0,46
seq $t2,$t3,$t0
	beqz $t2,L537
	lw $t1,G46
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L539
	li $t0,46
	move $a0,$t0
	jal Lprinti

	.data
LS44 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS44
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L539 :
	j L538
L537 :
	lw $t1,4($sp)
	li $t3,47
seq $t2,$t1,$t3
	beqz $t2,L540
	lw $t0,G47
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L542
	li $t3,47
	move $a0,$t3
	jal Lprinti

	.data
LS45 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS45
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L542 :
	j L541
L540 :
	lw $t0,4($sp)
	li $t1,48
seq $t2,$t0,$t1
	beqz $t2,L543
	lw $t3,G48
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L545
	li $t1,48
	move $a0,$t1
	jal Lprinti

	.data
LS46 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS46
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L545 :
	j L544
L543 :
	lw $t3,4($sp)
	li $t0,49
seq $t2,$t3,$t0
	beqz $t2,L546
	lw $t1,G49
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L548
	li $t0,49
	move $a0,$t0
	jal Lprinti

	.data
LS47 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS47
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L548 :
	j L547
L546 :
	lw $t1,4($sp)
	li $t3,50
seq $t2,$t1,$t3
	beqz $t2,L549
	lw $t0,G50
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L551
	li $t3,50
	move $a0,$t3
	jal Lprinti

	.data
LS48 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS48
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L551 :
	j L550
L549 :
	lw $t0,4($sp)
	li $t1,51
seq $t2,$t0,$t1
	beqz $t2,L552
	lw $t3,G51
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L554
	li $t1,51
	move $a0,$t1
	jal Lprinti

	.data
LS49 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS49
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L554 :
	j L553
L552 :
	lw $t3,4($sp)
	li $t0,52
seq $t2,$t3,$t0
	beqz $t2,L555
	lw $t1,G52
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L557
	li $t0,52
	move $a0,$t0
	jal Lprinti

	.data
LS50 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS50
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L557 :
	j L556
L555 :
	lw $t1,4($sp)
	li $t3,53
seq $t2,$t1,$t3
	beqz $t2,L558
	lw $t0,G53
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L560
	li $t3,53
	move $a0,$t3
	jal Lprinti

	.data
LS51 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS51
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L560 :
	j L559
L558 :
	lw $t0,4($sp)
	li $t1,54
seq $t2,$t0,$t1
	beqz $t2,L561
	lw $t3,G54
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L563
	li $t1,54
	move $a0,$t1
	jal Lprinti

	.data
LS52 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS52
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L563 :
	j L562
L561 :
	lw $t3,4($sp)
	li $t0,55
seq $t2,$t3,$t0
	beqz $t2,L564
	lw $t1,G55
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L566
	li $t0,55
	move $a0,$t0
	jal Lprinti

	.data
LS53 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS53
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L566 :
	j L565
L564 :
	lw $t1,4($sp)
	li $t3,56
seq $t2,$t1,$t3
	beqz $t2,L567
	lw $t0,G56
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L569
	li $t3,56
	move $a0,$t3
	jal Lprinti

	.data
LS54 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS54
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L569 :
	j L568
L567 :
	lw $t0,4($sp)
	li $t1,57
seq $t2,$t0,$t1
	beqz $t2,L570
	lw $t3,G57
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L572
	li $t1,57
	move $a0,$t1
	jal Lprinti

	.data
LS55 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS55
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L572 :
	j L571
L570 :
	lw $t3,4($sp)
	li $t0,58
seq $t2,$t3,$t0
	beqz $t2,L573
	lw $t1,G58
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L575
	li $t0,58
	move $a0,$t0
	jal Lprinti

	.data
LS56 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS56
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L575 :
	j L574
L573 :
	lw $t1,4($sp)
	li $t3,59
seq $t2,$t1,$t3
	beqz $t2,L576
	lw $t0,G59
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L578
	li $t3,59
	move $a0,$t3
	jal Lprinti

	.data
LS57 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS57
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L578 :
	j L577
L576 :
	lw $t0,4($sp)
	li $t1,60
seq $t2,$t0,$t1
	beqz $t2,L579
	lw $t3,G60
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L581
	li $t1,60
	move $a0,$t1
	jal Lprinti

	.data
LS58 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS58
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L581 :
	j L580
L579 :
	lw $t3,4($sp)
	li $t0,61
seq $t2,$t3,$t0
	beqz $t2,L582
	lw $t1,G61
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L584
	li $t0,61
	move $a0,$t0
	jal Lprinti

	.data
LS59 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS59
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L584 :
	j L583
L582 :
	lw $t1,4($sp)
	li $t3,62
seq $t2,$t1,$t3
	beqz $t2,L585
	lw $t0,G62
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L587
	li $t3,62
	move $a0,$t3
	jal Lprinti

	.data
LS60 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS60
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L587 :
	j L586
L585 :
	lw $t0,4($sp)
	li $t1,63
seq $t2,$t0,$t1
	beqz $t2,L588
	lw $t3,G63
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L590
	li $t1,63
	move $a0,$t1
	jal Lprinti

	.data
LS61 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS61
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L590 :
	j L589
L588 :
	lw $t3,4($sp)
	li $t0,64
seq $t2,$t3,$t0
	beqz $t2,L591
	lw $t1,G64
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L593
	li $t0,64
	move $a0,$t0
	jal Lprinti

	.data
LS62 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS62
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L593 :
	j L592
L591 :
	lw $t1,4($sp)
	li $t3,65
seq $t2,$t1,$t3
	beqz $t2,L594
	lw $t0,G65
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L596
	li $t3,65
	move $a0,$t3
	jal Lprinti

	.data
LS63 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS63
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L596 :
	j L595
L594 :
	lw $t0,4($sp)
	li $t1,66
seq $t2,$t0,$t1
	beqz $t2,L597
	lw $t3,G66
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L599
	li $t1,66
	move $a0,$t1
	jal Lprinti

	.data
LS64 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS64
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L599 :
	j L598
L597 :
	lw $t3,4($sp)
	li $t0,67
seq $t2,$t3,$t0
	beqz $t2,L600
	lw $t1,G67
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L602
	li $t0,67
	move $a0,$t0
	jal Lprinti

	.data
LS65 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS65
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L602 :
	j L601
L600 :
	lw $t1,4($sp)
	li $t3,68
seq $t2,$t1,$t3
	beqz $t2,L603
	lw $t0,G68
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L605
	li $t3,68
	move $a0,$t3
	jal Lprinti

	.data
LS66 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS66
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L605 :
	j L604
L603 :
	lw $t0,4($sp)
	li $t1,69
seq $t2,$t0,$t1
	beqz $t2,L606
	lw $t3,G69
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L608
	li $t1,69
	move $a0,$t1
	jal Lprinti

	.data
LS67 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS67
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L608 :
	j L607
L606 :
	lw $t3,4($sp)
	li $t0,70
seq $t2,$t3,$t0
	beqz $t2,L609
	lw $t1,G70
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L611
	li $t0,70
	move $a0,$t0
	jal Lprinti

	.data
LS68 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS68
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L611 :
	j L610
L609 :
	lw $t1,4($sp)
	li $t3,71
seq $t2,$t1,$t3
	beqz $t2,L612
	lw $t0,G71
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L614
	li $t3,71
	move $a0,$t3
	jal Lprinti

	.data
LS69 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS69
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L614 :
	j L613
L612 :
	lw $t0,4($sp)
	li $t1,72
seq $t2,$t0,$t1
	beqz $t2,L615
	lw $t3,G72
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L617
	li $t1,72
	move $a0,$t1
	jal Lprinti

	.data
LS70 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS70
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L617 :
	j L616
L615 :
	lw $t3,4($sp)
	li $t0,73
seq $t2,$t3,$t0
	beqz $t2,L618
	lw $t1,G73
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L620
	li $t0,73
	move $a0,$t0
	jal Lprinti

	.data
LS71 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS71
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L620 :
	j L619
L618 :
	lw $t1,4($sp)
	li $t3,74
seq $t2,$t1,$t3
	beqz $t2,L621
	lw $t0,G74
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L623
	li $t3,74
	move $a0,$t3
	jal Lprinti

	.data
LS72 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS72
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L623 :
	j L622
L621 :
	lw $t0,4($sp)
	li $t1,75
seq $t2,$t0,$t1
	beqz $t2,L624
	lw $t3,G75
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L626
	li $t1,75
	move $a0,$t1
	jal Lprinti

	.data
LS73 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS73
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L626 :
	j L625
L624 :
	lw $t3,4($sp)
	li $t0,76
seq $t2,$t3,$t0
	beqz $t2,L627
	lw $t1,G76
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L629
	li $t0,76
	move $a0,$t0
	jal Lprinti

	.data
LS74 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS74
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L629 :
	j L628
L627 :
	lw $t1,4($sp)
	li $t3,77
seq $t2,$t1,$t3
	beqz $t2,L630
	lw $t0,G77
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L632
	li $t3,77
	move $a0,$t3
	jal Lprinti

	.data
LS75 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS75
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L632 :
	j L631
L630 :
	lw $t0,4($sp)
	li $t1,78
seq $t2,$t0,$t1
	beqz $t2,L633
	lw $t3,G78
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L635
	li $t1,78
	move $a0,$t1
	jal Lprinti

	.data
LS76 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS76
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L635 :
	j L634
L633 :
	lw $t3,4($sp)
	li $t0,79
seq $t2,$t3,$t0
	beqz $t2,L636
	lw $t1,G79
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L638
	li $t0,79
	move $a0,$t0
	jal Lprinti

	.data
LS77 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS77
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L638 :
	j L637
L636 :
	lw $t1,4($sp)
	li $t3,80
seq $t2,$t1,$t3
	beqz $t2,L639
	lw $t0,G80
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L641
	li $t3,80
	move $a0,$t3
	jal Lprinti

	.data
LS78 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS78
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L641 :
	j L640
L639 :
	lw $t0,4($sp)
	li $t1,81
seq $t2,$t0,$t1
	beqz $t2,L642
	lw $t3,G81
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L644
	li $t1,81
	move $a0,$t1
	jal Lprinti

	.data
LS79 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS79
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L644 :
	j L643
L642 :
	lw $t3,4($sp)
	li $t0,82
seq $t2,$t3,$t0
	beqz $t2,L645
	lw $t1,G82
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L647
	li $t0,82
	move $a0,$t0
	jal Lprinti

	.data
LS80 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS80
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L647 :
	j L646
L645 :
	lw $t1,4($sp)
	li $t3,83
seq $t2,$t1,$t3
	beqz $t2,L648
	lw $t0,G83
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L650
	li $t3,83
	move $a0,$t3
	jal Lprinti

	.data
LS81 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS81
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L650 :
	j L649
L648 :
	lw $t0,4($sp)
	li $t1,84
seq $t2,$t0,$t1
	beqz $t2,L651
	lw $t3,G84
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L653
	li $t1,84
	move $a0,$t1
	jal Lprinti

	.data
LS82 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS82
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L653 :
	j L652
L651 :
	lw $t3,4($sp)
	li $t0,85
seq $t2,$t3,$t0
	beqz $t2,L654
	lw $t1,G85
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L656
	li $t0,85
	move $a0,$t0
	jal Lprinti

	.data
LS83 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS83
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L656 :
	j L655
L654 :
	lw $t1,4($sp)
	li $t3,86
seq $t2,$t1,$t3
	beqz $t2,L657
	lw $t0,G86
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L659
	li $t3,86
	move $a0,$t3
	jal Lprinti

	.data
LS84 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS84
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L659 :
	j L658
L657 :
	lw $t0,4($sp)
	li $t1,87
seq $t2,$t0,$t1
	beqz $t2,L660
	lw $t3,G87
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L662
	li $t1,87
	move $a0,$t1
	jal Lprinti

	.data
LS85 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS85
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L662 :
	j L661
L660 :
	lw $t3,4($sp)
	li $t0,88
seq $t2,$t3,$t0
	beqz $t2,L663
	lw $t1,G88
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L665
	li $t0,88
	move $a0,$t0
	jal Lprinti

	.data
LS86 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS86
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L665 :
	j L664
L663 :
	lw $t1,4($sp)
	li $t3,89
seq $t2,$t1,$t3
	beqz $t2,L666
	lw $t0,G89
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L668
	li $t3,89
	move $a0,$t3
	jal Lprinti

	.data
LS87 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS87
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L668 :
	j L667
L666 :
	lw $t0,4($sp)
	li $t1,90
seq $t2,$t0,$t1
	beqz $t2,L669
	lw $t3,G90
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L671
	li $t1,90
	move $a0,$t1
	jal Lprinti

	.data
LS88 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS88
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L671 :
	j L670
L669 :
	lw $t3,4($sp)
	li $t0,91
seq $t2,$t3,$t0
	beqz $t2,L672
	lw $t1,G91
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L674
	li $t0,91
	move $a0,$t0
	jal Lprinti

	.data
LS89 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS89
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L674 :
	j L673
L672 :
	lw $t1,4($sp)
	li $t3,92
seq $t2,$t1,$t3
	beqz $t2,L675
	lw $t0,G92
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L677
	li $t3,92
	move $a0,$t3
	jal Lprinti

	.data
LS90 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS90
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L677 :
	j L676
L675 :
	lw $t0,4($sp)
	li $t1,93
seq $t2,$t0,$t1
	beqz $t2,L678
	lw $t3,G93
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L680
	li $t1,93
	move $a0,$t1
	jal Lprinti

	.data
LS91 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS91
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L680 :
	j L679
L678 :
	lw $t3,4($sp)
	li $t0,94
seq $t2,$t3,$t0
	beqz $t2,L681
	lw $t1,G94
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L683
	li $t0,94
	move $a0,$t0
	jal Lprinti

	.data
LS92 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS92
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L683 :
	j L682
L681 :
	lw $t1,4($sp)
	li $t3,95
seq $t2,$t1,$t3
	beqz $t2,L684
	lw $t0,G95
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L686
	li $t3,95
	move $a0,$t3
	jal Lprinti

	.data
LS93 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS93
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L686 :
	j L685
L684 :
	lw $t0,4($sp)
	li $t1,96
seq $t2,$t0,$t1
	beqz $t2,L687
	lw $t3,G96
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L689
	li $t1,96
	move $a0,$t1
	jal Lprinti

	.data
LS94 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS94
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L689 :
	j L688
L687 :
	lw $t3,4($sp)
	li $t0,97
seq $t2,$t3,$t0
	beqz $t2,L690
	lw $t1,G97
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L692
	li $t0,97
	move $a0,$t0
	jal Lprinti

	.data
LS95 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS95
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L692 :
	j L691
L690 :
	lw $t1,4($sp)
	li $t3,98
seq $t2,$t1,$t3
	beqz $t2,L693
	lw $t0,G98
	li $t1,0
seq $t2,$t0,$t1
	beqz $t2,L695
	li $t3,98
	move $a0,$t3
	jal Lprinti

	.data
LS96 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS96
	move $a0,$s8
	jal Lprints

	lw $t0,12($sp)
	li $t1,1
addu $t3,$t0,$t1
	sw $t3,12($sp)
L695 :
	j L694
L693 :
	lw $t0,4($sp)
	li $t1,99
seq $t2,$t0,$t1
	beqz $t2,L696
	lw $t3,G99
	li $t0,0
seq $t2,$t3,$t0
	beqz $t2,L698
	li $t1,99
	move $a0,$t1
	jal Lprinti

	.data
LS97 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS97
	move $a0,$s8
	jal Lprints

	lw $t3,12($sp)
	li $t0,1
addu $t1,$t3,$t0
	sw $t1,12($sp)
L698 :
	j L697
L696 :
	lw $t3,4($sp)
	li $t0,100
seq $t2,$t3,$t0
	beqz $t2,L699
	lw $t1,G100
	li $t3,0
seq $t2,$t1,$t3
	beqz $t2,L700
	li $t0,100
	move $a0,$t0
	jal Lprinti

	.data
LS98 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS98
	move $a0,$s8
	jal Lprints

	lw $t1,12($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,12($sp)
L700 :
L699 :
L697 :
L694 :
L691 :
L688 :
L685 :
L682 :
L679 :
L676 :
L673 :
L670 :
L667 :
L664 :
L661 :
L658 :
L655 :
L652 :
L649 :
L646 :
L643 :
L640 :
L637 :
L634 :
L631 :
L628 :
L625 :
L622 :
L619 :
L616 :
L613 :
L610 :
L607 :
L604 :
L601 :
L598 :
L595 :
L592 :
L589 :
L586 :
L583 :
L580 :
L577 :
L574 :
L571 :
L568 :
L565 :
L562 :
L559 :
L556 :
L553 :
L550 :
L547 :
L544 :
L541 :
L538 :
L535 :
L532 :
L529 :
L526 :
L523 :
L520 :
L517 :
L514 :
L511 :
L508 :
L505 :
L502 :
L499 :
L496 :
L493 :
L490 :
L487 :
L484 :
L481 :
L478 :
L475 :
L472 :
L469 :
L466 :
L463 :
L460 :
L457 :
L454 :
L451 :
L448 :
L445 :
L442 :
L439 :
L436 :
L433 :
L430 :
L427 :
L424 :
L421 :
L418 :
L415 :
L412 :
L409 :
	lw $t1,4($sp)
	li $t3,1
addu $t0,$t1,$t3
	sw $t0,4($sp)
	j L406
L407 :
	lw $t1,12($sp)
	move $a0,$t1
	jal Lprinti

	.data
LS99 :
	.byte  32 , 112 , 114 , 105 , 109 , 101 , 32 , 110 , 117 , 109 , 98 , 101 , 114 , 115 , 32 , 60 , 61 , 32 , 0
	.align 2
	.text
	la $s8,LS99
	move $a0,$s8
	jal Lprints

	li $t3,100
	move $a0,$t3
	jal Lprinti

	.data
LS100 :
	.byte  10 , 0
	.align 2
	.text
	la $s8,LS100
	move $a0,$s8
	jal Lprints

L3 :
	lw $ra,0($sp)
	addu $sp,$sp,16
	jr $ra
L1 :
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $a0,4($sp)
	lw $t0,4($sp)
	sw $t0,G102
L701 :
	lw $ra,0($sp)
	addu $sp,$sp,8
	jr $ra
L2 :
	subu $sp,$sp,4
	sw $ra,0($sp)
	li $t0,17
	lw $t1,G102
mul $t2,$t0,$t1
	li $t0,13
addu $t1,$t2,$t0
	li $t2,32768
	bnez $t2,L703
	.data
LS101 :
	.byte  100 , 105 , 118 , 105 , 115 , 105 , 111 , 110 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 0
	.align 2
	.text
	la $a0,LS101
	j error
L703 :
rem $t0,$t1,$t2
	sw $t0,G102
	lw $t1,G102
	move $v0,$t1
	j L702
	.data
LS102 :
	.byte  102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 73 , 78 , 84 , 69 , 82 , 78 , 65 , 76 , 114 , 97 , 110 , 100 , 111 , 109 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 0
	.align 2
	.text
	la $a0,LS102
	j error
L702 :
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra
