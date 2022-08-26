	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.comm	input_buffer,5,4
	.comm	command,4,4
	.comm	string,124,4
	.comm	cmd_end,1,1
	.comm	count,1,1
	.section	.bss.table,"aw",%nobits
	.align	2
	.type	table, %object
	.size	table, 1024
table:
	.space	1024
	.section	.bss.len,"aw",%nobits
	.align	2
	.type	len, %object
	.size	len, 4
len:
	.space	4
	.section	.bss.findme,"aw",%nobits
	.align	2
	.type	findme, %object
	.size	findme, 4
findme:
	.space	4
	.text
	.align	1
	.global	init_search
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	init_search, %function
init_search:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	strlen @secure
	mov	r2, r0
	ldr	r3, .L6
	str	r2, [r3]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L2
.L3:
	ldr	r3, .L6
	ldr	r2, [r3]
	ldr	r1, .L6+4
	ldr	r3, [r7, #12]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #12]
	cmp	r3, #255
	bls	.L3
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L4
.L5:
	ldr	r3, .L6
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	ldr	r1, [r7, #4]
	ldr	r2, [r7, #12]
	add	r2, r2, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	mov	r1, r2
	subs	r3, r3, #1
	ldr	r2, .L6+4
	str	r3, [r2, r1, lsl #2]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L4:
	ldr	r3, .L6
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	cmp	r2, r3
	bcc	.L5
	ldr	r2, .L6+8
	ldr	r3, [r7, #4]
	str	r3, [r2]
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #41 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
.L7:
	.align	2
.L6:
	.word	len
	.word	table
	.word	findme
	.size	init_search, .-init_search
	.align	1
	.global	strsearch
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	strsearch, %function
strsearch:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L16
	ldr	r3, [r3]
	subs	r4, r3, #1
	ldr	r0, [r7, #4]
	bl	strlen @secure
	str	r0, [r7, #12]
	b	.L9
.L12:
	add	r4, r4, r5
.L10:
	ldr	r3, [r7, #12]
	cmp	r4, r3
	bcs	.L11
	ldr	r3, [r7, #4]
	add	r3, r3, r4
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L16+4
	ldr	r5, [r3, r2, lsl #2]
	cmp	r5, #0
	bne	.L12
.L11:
	cmp	r5, #0
	bne	.L9
	ldr	r3, .L16+8
	ldr	r0, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	subs	r3, r4, r3
	adds	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, .L16
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r1, [r7, #8]
	bl	strncmp @secure
	mov	r3, r0
	cmp	r3, #0
	bne	.L13
	ldr	r3, [r7, #8]
	b	.L14
.L13:
	adds	r4, r4, #1
.L9:
	ldr	r3, [r7, #12]
	cmp	r4, r3
	bcc	.L10
	movs	r3, #0
.L14:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #44 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r4, r5, r7, pc}
.L17:
	.align	2
.L16:
	.word	len
	.word	table
	.word	findme
	.size	strsearch, .-strsearch
	.section	.rodata
	.align	2
.LC215:
	.ascii	"Execution Time is %lu\012\000"
	.align	2
.LC0:
	.ascii	"Kurt Vonneguts Commencement Address at\000"
	.align	2
.LC1:
	.ascii	"MIT Ladies and gentlemen of\000"
	.align	2
.LC2:
	.ascii	"the class of 97 Wear\000"
	.align	2
.LC3:
	.ascii	"sunscreen If I could offer\000"
	.align	2
.LC4:
	.ascii	"you only one tip for\000"
	.align	2
.LC5:
	.ascii	"the future sunscreen would be\000"
	.align	2
.LC6:
	.ascii	"it The longterm benefits of\000"
	.align	2
.LC7:
	.ascii	"sunscreen have been proved by\000"
	.align	2
.LC8:
	.ascii	"scientists whereas the rest of\000"
	.align	2
.LC9:
	.ascii	"my advice has no basis\000"
	.align	2
.LC10:
	.ascii	"more reliable than my own meandering experience\000"
	.align	2
.LC11:
	.ascii	"I will dispense this advice\000"
	.align	2
.LC12:
	.ascii	"now Enjoy the power and beauty\000"
	.align	2
.LC13:
	.ascii	"of your youth Oh never mind\000"
	.align	2
.LC14:
	.ascii	"You will not understand the power\000"
	.align	2
.LC15:
	.ascii	"and beauty of your youth until theyve\000"
	.align	2
.LC16:
	.ascii	"faded But trust me in\000"
	.align	2
.LC17:
	.ascii	"20 years\000"
	.align	2
.LC18:
	.ascii	"youll look\000"
	.align	2
.LC19:
	.ascii	"back at photos of yourself\000"
	.align	2
.LC20:
	.ascii	"and recall in a\000"
	.align	2
.LC21:
	.ascii	"way you cant grasp now how much\000"
	.align	2
.LC22:
	.ascii	"possibility lay before you\000"
	.align	2
.LC23:
	.ascii	"and how fabulous you really looked You\000"
	.align	2
.LC24:
	.ascii	"are not as fat\000"
	.align	2
.LC25:
	.ascii	"as you imagine Dont worry about\000"
	.align	2
.LC26:
	.ascii	"the future Or\000"
	.align	2
.LC27:
	.ascii	"worry but know that worrying is as effective\000"
	.align	2
.LC28:
	.ascii	"as trying to solve an algebra equation\000"
	.align	2
.LC29:
	.ascii	"by chewing bubble gum The real troubles in\000"
	.align	2
.LC30:
	.ascii	"your life are apt to\000"
	.align	2
.LC31:
	.ascii	"be things that never crossed your\000"
	.align	2
.LC32:
	.ascii	"worried mind the\000"
	.align	2
.LC33:
	.ascii	"kind that blindside you at\000"
	.align	2
.LC34:
	.ascii	"4 pm on some\000"
	.align	2
.LC35:
	.ascii	"idle Tuesday\000"
	.align	2
.LC36:
	.ascii	"Do one thing every day that\000"
	.align	2
.LC37:
	.ascii	"scares you Sing Dont be reckless with other\000"
	.align	2
.LC38:
	.ascii	"peoples hearts Dont put up\000"
	.align	2
.LC39:
	.ascii	"with people who are reckless\000"
	.align	2
.LC40:
	.ascii	"with yours Floss Dont waste your time\000"
	.align	2
.LC41:
	.ascii	"on jealousy Sometimes youre ahead sometimes youre b"
	.ascii	"ehind\000"
	.align	2
.LC42:
	.ascii	"The race is long and in\000"
	.align	2
.LC43:
	.ascii	"the end its only with\000"
	.align	2
.LC44:
	.ascii	"yourself Remember compliments you receive\000"
	.align	2
.LC45:
	.ascii	"Forget the insults If you\000"
	.align	2
.LC46:
	.ascii	"succeed in doing this tell me how\000"
	.align	2
.LC47:
	.ascii	"Keep your old\000"
	.align	2
.LC48:
	.ascii	"love letters Throw away\000"
	.align	2
.LC49:
	.ascii	"your old bank statements\000"
	.align	2
.LC50:
	.ascii	"Stretch Dont feel guilty if you dont know\000"
	.align	2
.LC51:
	.ascii	"what you want to do with your\000"
	.align	2
.LC52:
	.ascii	"life The most interesting people I\000"
	.align	2
.LC53:
	.ascii	"know didnt know at 22\000"
	.align	2
.LC54:
	.ascii	"what they wanted\000"
	.align	2
.LC55:
	.ascii	"to do with their lives Some of\000"
	.align	2
.LC56:
	.ascii	"the most interesting\000"
	.align	2
.LC57:
	.ascii	"40yearolds I know still dont\000"
	.align	2
.LC58:
	.ascii	"Get plenty of calcium\000"
	.align	2
.LC59:
	.ascii	"Be kind to your knees Youll miss\000"
	.align	2
.LC60:
	.ascii	"them when theyre gone\000"
	.align	2
.LC61:
	.ascii	"Maybe youll marry\000"
	.align	2
.LC62:
	.ascii	"maybe you wont Maybe youll have children maybe\000"
	.align	2
.LC63:
	.ascii	"you wont Maybe youll divorce at 40 maybe youll danc"
	.ascii	"e\000"
	.align	2
.LC64:
	.ascii	"the funky chicken on\000"
	.align	2
.LC65:
	.ascii	"your 75th wedding anniversary Whatever\000"
	.align	2
.LC66:
	.ascii	"you do dont congratulate yourself too\000"
	.align	2
.LC67:
	.ascii	"much or berate yourself\000"
	.align	2
.LC68:
	.ascii	"either Your choices are half chance So\000"
	.align	2
.LC69:
	.ascii	"are everybody elses\000"
	.align	2
.LC70:
	.ascii	"Enjoy your body Use\000"
	.align	2
.LC71:
	.ascii	"it every way you can Dont\000"
	.align	2
.LC72:
	.ascii	"be afraid of it or of what\000"
	.align	2
.LC73:
	.ascii	"other people think of\000"
	.align	2
.LC74:
	.ascii	"it Its\000"
	.align	2
.LC75:
	.ascii	"the\000"
	.align	2
.LC76:
	.ascii	"greatest instrument youll ever\000"
	.align	2
.LC77:
	.ascii	"own Dance even if you have\000"
	.align	2
.LC78:
	.ascii	"nowhere to do it but your living\000"
	.align	2
.LC79:
	.ascii	"room Read the directions even if\000"
	.align	2
.LC80:
	.ascii	"you dont follow them Do not read\000"
	.align	2
.LC81:
	.ascii	"beauty magazines They will only make you\000"
	.align	2
.LC82:
	.ascii	"feel ugly Get to know your parents You never\000"
	.align	2
.LC83:
	.ascii	"know when theyll be gone for good Be\000"
	.align	2
.LC84:
	.ascii	"nice to your siblings Theyre your\000"
	.align	2
.LC85:
	.ascii	"best link to your\000"
	.align	2
.LC86:
	.ascii	"past and the people most likely\000"
	.align	2
.LC87:
	.ascii	"to stick with you\000"
	.align	2
.LC88:
	.ascii	"in the future Understand that\000"
	.align	2
.LC89:
	.ascii	"friends come and go but\000"
	.align	2
.LC90:
	.ascii	"with a precious few you should hold\000"
	.align	2
.LC91:
	.ascii	"on Work hard to bridge\000"
	.align	2
.LC92:
	.ascii	"the gaps in geography and lifestyle\000"
	.align	2
.LC93:
	.ascii	"because the older\000"
	.align	2
.LC94:
	.ascii	"you get the more you need the\000"
	.align	2
.LC95:
	.ascii	"people who knew you when you\000"
	.align	2
.LC96:
	.ascii	"were young Live\000"
	.align	2
.LC97:
	.ascii	"in New York City once but leave before\000"
	.align	2
.LC98:
	.ascii	"it makes you hard Live in\000"
	.align	2
.LC99:
	.ascii	"Northern California once but leave\000"
	.align	2
.LC100:
	.ascii	"before it makes you soft Travel\000"
	.align	2
.LC101:
	.ascii	"Accept certain inalienable truths Prices will rise\000"
	.align	2
.LC102:
	.ascii	"Politicians will philander You too will\000"
	.align	2
.LC103:
	.ascii	"get old And when you do youll\000"
	.align	2
.LC104:
	.ascii	"fantasize that when you were young prices were\000"
	.align	2
.LC105:
	.ascii	"reasonable politicians were noble and children resp"
	.ascii	"ected\000"
	.align	2
.LC106:
	.ascii	"their elders Respect your elders\000"
	.align	2
.LC107:
	.ascii	"Dont expect anyone else to\000"
	.align	2
.LC108:
	.ascii	"support you Maybe you have a\000"
	.align	2
.LC109:
	.ascii	"trust fund Maybe youll have a wealthy\000"
	.align	2
.LC110:
	.ascii	"spouse But you never know when either\000"
	.align	2
.LC111:
	.ascii	"one might run out Dont mess\000"
	.align	2
.LC112:
	.ascii	"too much with your hair or by the\000"
	.align	2
.LC113:
	.ascii	"time youre 40 it will look 85 Be\000"
	.align	2
.LC114:
	.ascii	"careful whose advice you buy but be patient\000"
	.align	2
.LC115:
	.ascii	"with those who supply it Advice is a\000"
	.align	2
.LC116:
	.ascii	"form of nostalgia Dispensing it is\000"
	.align	2
.LC117:
	.ascii	"a way of fishing the past from\000"
	.align	2
.LC118:
	.ascii	"the disposal wiping it off painting\000"
	.align	2
.LC119:
	.ascii	"over the ugly parts\000"
	.align	2
.LC120:
	.ascii	"and recycling it for more than its\000"
	.align	2
.LC121:
	.ascii	"worth But trust me on the sunscreen\000"
	.align	2
.LC213:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.align	2
.LC123:
	.ascii	"Kur\000"
	.align	2
.LC124:
	.ascii	"gent\000"
	.align	2
.LC125:
	.ascii	"lass\000"
	.align	2
.LC126:
	.ascii	"suns\000"
	.align	2
.LC127:
	.ascii	"for\000"
	.align	2
.LC128:
	.ascii	"xxx\000"
	.align	2
.LC129:
	.ascii	"long\000"
	.align	2
.LC130:
	.ascii	"have\000"
	.align	2
.LC131:
	.ascii	"where\000"
	.align	2
.LC132:
	.ascii	"xxxxxx\000"
	.align	2
.LC133:
	.ascii	"pense\000"
	.align	2
.LC134:
	.ascii	"pow\000"
	.align	2
.LC135:
	.ascii	"xxxxx\000"
	.align	2
.LC136:
	.ascii	"Yo\000"
	.align	2
.LC137:
	.ascii	"and\000"
	.align	2
.LC138:
	.ascii	"faded\000"
	.align	2
.LC139:
	.ascii	"20\000"
	.align	2
.LC140:
	.ascii	"you\000"
	.align	2
.LC141:
	.ascii	"bac\000"
	.align	2
.LC142:
	.ascii	"an\000"
	.align	2
.LC143:
	.ascii	"way\000"
	.align	2
.LC144:
	.ascii	"possibili\000"
	.align	2
.LC145:
	.ascii	"fat\000"
	.align	2
.LC146:
	.ascii	"imag\000"
	.align	2
.LC147:
	.ascii	"th\000"
	.align	2
.LC148:
	.ascii	"wor\000"
	.align	2
.LC149:
	.ascii	"yo\000"
	.align	2
.LC150:
	.ascii	"bxx\000"
	.align	2
.LC151:
	.ascii	"wo\000"
	.align	2
.LC152:
	.ascii	"kind\000"
	.align	2
.LC153:
	.ascii	"4\000"
	.align	2
.LC154:
	.ascii	"idle\000"
	.align	2
.LC155:
	.ascii	"Do\000"
	.align	2
.LC156:
	.ascii	"scare\000"
	.align	2
.LC157:
	.ascii	"people\000"
	.align	2
.LC158:
	.ascii	"wit\000"
	.align	2
.LC159:
	.ascii	"Th\000"
	.align	2
.LC160:
	.ascii	"yourself\000"
	.align	2
.LC161:
	.ascii	"Forget\000"
	.align	2
.LC162:
	.ascii	"succeed\000"
	.align	2
.LC163:
	.ascii	"Kee\000"
	.align	2
.LC164:
	.ascii	"lov\000"
	.align	2
.LC165:
	.ascii	"Stretc\000"
	.align	2
.LC166:
	.ascii	"what\000"
	.align	2
.LC167:
	.ascii	"life\000"
	.align	2
.LC168:
	.ascii	"kno\000"
	.align	2
.LC169:
	.ascii	"wha\000"
	.align	2
.LC170:
	.ascii	"40\000"
	.align	2
.LC171:
	.ascii	"Get\000"
	.align	2
.LC172:
	.ascii	"them\000"
	.align	2
.LC173:
	.ascii	"Maybe\000"
	.align	2
.LC174:
	.ascii	"may\000"
	.align	2
.LC175:
	.ascii	"your\000"
	.align	2
.LC176:
	.ascii	"congratulate\000"
	.align	2
.LC177:
	.ascii	"much\000"
	.align	2
.LC178:
	.ascii	"either\000"
	.align	2
.LC179:
	.ascii	"are\000"
	.align	2
.LC180:
	.ascii	"Enjoy\000"
	.align	2
.LC181:
	.ascii	"it\000"
	.align	2
.LC182:
	.ascii	"be\000"
	.align	2
.LC183:
	.ascii	"other\000"
	.align	2
.LC184:
	.ascii	"greatest\000"
	.align	2
.LC185:
	.ascii	"own\000"
	.align	2
.LC186:
	.ascii	"nowhere\000"
	.align	2
.LC187:
	.ascii	"room\000"
	.align	2
.LC188:
	.ascii	"beauty\000"
	.align	2
.LC189:
	.ascii	"feel\000"
	.align	2
.LC190:
	.ascii	"Northern\000"
	.align	2
.LC191:
	.ascii	"before\000"
	.align	2
.LC192:
	.ascii	"Accept\000"
	.align	2
.LC193:
	.ascii	"Politicians\000"
	.align	2
.LC194:
	.ascii	"get\000"
	.align	2
.LC195:
	.ascii	"size\000"
	.align	2
.LC196:
	.ascii	"reasonable\000"
	.align	2
.LC197:
	.ascii	"their\000"
	.align	2
.LC198:
	.ascii	"Dont\000"
	.align	2
.LC199:
	.ascii	"support\000"
	.align	2
.LC200:
	.ascii	"trust\000"
	.align	2
.LC201:
	.ascii	"spouse\000"
	.align	2
.LC202:
	.ascii	"one\000"
	.align	2
.LC203:
	.ascii	"too\000"
	.align	2
.LC204:
	.ascii	"time\000"
	.align	2
.LC205:
	.ascii	"careful\000"
	.align	2
.LC206:
	.ascii	"with\000"
	.align	2
.LC207:
	.ascii	"Dispensing\000"
	.align	2
.LC208:
	.ascii	"past\000"
	.align	2
.LC209:
	.ascii	"parts\000"
	.align	2
.LC210:
	.ascii	"more\000"
	.align	2
.LC211:
	.ascii	"me\000"
	.align	2
.LC214:
	.word	.LC123
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC142
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC128
	.word	.LC128
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC128
	.word	.LC128
	.word	.LC159
	.word	.LC128
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC149
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC128
	.word	.LC128
	.word	.LC170
	.word	.LC171
	.word	.LC128
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC140
	.word	.LC75
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC181
	.word	.LC128
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC140
	.word	.LC188
	.word	.LC189
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC181
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC75
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC142
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC128
	.word	.LC128
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC128
	.word	.LC128
	.word	.LC159
	.word	.LC128
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC149
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC128
	.word	.LC128
	.word	.LC170
	.word	.LC171
	.word	.LC128
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC140
	.word	.LC75
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC181
	.word	.LC128
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC140
	.word	.LC188
	.word	.LC189
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC181
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC75
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC142
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC128
	.word	.LC128
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC128
	.word	.LC128
	.word	.LC159
	.word	.LC128
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC149
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC128
	.word	.LC128
	.word	.LC170
	.word	.LC171
	.word	.LC128
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC140
	.word	.LC75
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC181
	.word	.LC128
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC140
	.word	.LC188
	.word	.LC189
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC181
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC75
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC142
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC128
	.word	.LC128
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC128
	.word	.LC128
	.word	.LC159
	.word	.LC128
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC149
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC128
	.word	.LC128
	.word	.LC170
	.word	.LC171
	.word	.LC128
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC140
	.word	.LC75
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC181
	.word	.LC128
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC140
	.word	.LC188
	.word	.LC189
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC181
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC75
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC142
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC128
	.word	.LC128
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC128
	.word	.LC128
	.word	.LC159
	.word	.LC128
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC149
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC128
	.word	.LC128
	.word	.LC170
	.word	.LC171
	.word	.LC128
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC140
	.word	.LC75
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC181
	.word	.LC128
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC140
	.word	.LC188
	.word	.LC189
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC181
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC75
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC142
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC128
	.word	.LC128
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC128
	.word	.LC128
	.word	.LC159
	.word	.LC128
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC149
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC128
	.word	.LC128
	.word	.LC170
	.word	.LC171
	.word	.LC128
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC140
	.word	.LC75
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC181
	.word	.LC128
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC140
	.word	.LC188
	.word	.LC189
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC181
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC75
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC142
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC128
	.word	.LC128
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC128
	.word	.LC128
	.word	.LC159
	.word	.LC128
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC149
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC128
	.word	.LC128
	.word	.LC170
	.word	.LC171
	.word	.LC128
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC140
	.word	.LC75
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC181
	.word	.LC128
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC140
	.word	.LC188
	.word	.LC189
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC181
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC75
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC142
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC128
	.word	.LC128
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC128
	.word	.LC128
	.word	.LC159
	.word	.LC128
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC149
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC128
	.word	.LC128
	.word	.LC170
	.word	.LC171
	.word	.LC128
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC140
	.word	.LC75
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC181
	.word	.LC128
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC140
	.word	.LC188
	.word	.LC189
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC181
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC75
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC142
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC128
	.word	.LC128
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC128
	.word	.LC128
	.word	.LC159
	.word	.LC128
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC149
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC128
	.word	.LC128
	.word	.LC170
	.word	.LC171
	.word	.LC128
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC140
	.word	.LC75
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC181
	.word	.LC128
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC140
	.word	.LC188
	.word	.LC189
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC181
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC75
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC142
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC128
	.word	.LC128
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC128
	.word	.LC128
	.word	.LC159
	.word	.LC128
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC149
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC128
	.word	.LC128
	.word	.LC170
	.word	.LC171
	.word	.LC128
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC140
	.word	.LC75
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC181
	.word	.LC128
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC140
	.word	.LC188
	.word	.LC189
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC181
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC75
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC142
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC128
	.word	.LC128
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC128
	.word	.LC128
	.word	.LC159
	.word	.LC128
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC149
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC128
	.word	.LC128
	.word	.LC170
	.word	.LC171
	.word	.LC128
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC140
	.word	.LC75
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC181
	.word	.LC128
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC140
	.word	.LC188
	.word	.LC189
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC128
	.word	.LC181
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC75
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	0
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 10808
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #10752
	sub	sp, sp, #56
	add	r7, sp, #0
	movs	r3, #0
	add	r2, r7, #10752
	add	r2, r2, #48
	str	r3, [r2]
	add	r3, r7, #5344
	add	r3, r3, #24
	subs	r3, r3, #28
	ldr	r2, .L22
	mov	r0, r3
	mov	r1, r2
	movw	r3, #5328
	mov	r2, r3
	bl	memcpy
	add	r3, r7, #56
	subs	r3, r3, #48
	ldr	r2, .L22+4
	mov	r0, r3
	mov	r1, r2
	movw	r3, #5332
	mov	r2, r3
	bl	memcpy
	bl	HAL_Init
	PUSH {R1, R2}
	MOV R1, #2 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	@CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	bl	SystemClock_Config
	PUSH {R1, R2}
	MOV R1, #14 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	bl	MX_GPIO_Init
	bl	MX_USART1_UART_Init
	PUSH {R1, R2}
	MOV R1, #21 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	bl	MX_TIM5_Init
	PUSH {R1, R2}
	MOV R1, #29 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	add	r3, r7, #56
	subs	r3, r3, #52
	movs	r2, #0
	str	r2, [r3]
	ldr	r3, .L22+8
	ldr	r3, [r3, #64]
	ldr	r2, .L22+8
	orr	r3, r3, #8
	str	r3, [r2, #64]
	ldr	r3, .L22+8
	ldr	r3, [r3, #64]
	and	r2, r3, #8
	add	r3, r7, #56
	subs	r3, r3, #52
	str	r2, [r3]
	add	r3, r7, #56
	subs	r3, r3, #52
	ldr	r3, [r3]
	ldr	r3, .L22+12
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L22+12
	ldr	r3, [r3]
	orr	r2, r2, #32
	str	r2, [r3, #12]
	ldr	r3, .L22+12
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L22+12
	ldr	r3, [r3]
	orr	r2, r2, #64
	str	r2, [r3, #12]
	add	r3, r7, #10624
	add	r3, r3, #44
	movs	r2, #128
	movs	r1, #0
	mov	r0, r3
	bl	memset
	movw	r0, #10000
	bl	HAL_Delay
	PUSH {R1, R2}
	MOV R1, #38 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	ldr	r0, .L22+16
	bl	HAL_TIM_Base_Start @secure
	movs	r3, #0
	add	r2, r7, #10752
	add	r2, r2, #52
	str	r3, [r2]
	b	.L19
.L20:
	add	r3, r7, #56
	subs	r3, r3, #48
	add	r2, r7, #10752
	add	r2, r2, #52
	ldr	r2, [r2]
	ldr	r3, [r3, r2, lsl #2]
	mov	r0, r3
	bl	init_search 
	PUSH {R1, R2}
	MOV R1, #42 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	add	r3, r7, #5344
	add	r3, r3, #24
	subs	r3, r3, #28
	add	r2, r7, #10752
	add	r2, r2, #52
	ldr	r2, [r2]
	ldr	r3, [r3, r2, lsl #2]
	mov	r0, r3
	bl	strsearch @qui
	PUSH {R1, R2}
	MOV R1, #43 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	add	r3, r7, #10752
	add	r3, r3, #44
	str	r0, [r3]
	add	r3, r7, #10752
	add	r3, r3, #52
	ldr	r3, [r3]
	adds	r3, r3, #1
	add	r2, r7, #10752
	add	r2, r2, #52
	str	r3, [r2]
.L19:
	add	r3, r7, #56
	subs	r3, r3, #48
	add	r2, r7, #10752
	add	r2, r2, #52
	ldr	r2, [r2]
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	bne	.L20
	ldr	r0, .L22+16
	bl	HAL_TIM_Base_Stop
	ldr	r3, .L22+20
	ldr	r3, [r3, #36]
	add	r2, r7, #10752
	add	r2, r2, #48
	str	r3, [r2]
	add	r3, r7, #10624
	add	r3, r3, #44
	add	r2, r7, #10752
	add	r2, r2, #48
	ldr	r2, [r2]
	ldr	r1, .L22+24
	mov	r0, r3
	bl	sprintf
	add	r1, r7, #10624
	add	r1, r1, #44
	mov	r3, #-1
	movs	r2, #128
	ldr	r0, .L22+12
	bl	HAL_UART_Transmit
	PUSH {R1, R2}
	MOV R1, #40 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
.L21:
	b	.L21
.L23:
	.align	2
.L22:
	.word	.LC213
	.word	.LC214
	.word	1073887232
	.word	huart1
	.word	htim5
	.word	1073744896
	.word	.LC215
	.size	main, .-main
	.align	1
	.global	SystemClock_Config
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SystemClock_Config, %function
SystemClock_Config:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #80
	add	r7, sp, #0
	add	r3, r7, #32
	movs	r2, #48
	movs	r1, #0
	mov	r0, r3
	bl	memset
	add	r3, r7, #12
	movs	r2, #0
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, .L28
	ldr	r3, [r3, #64]
	ldr	r2, .L28
	orr	r3, r3, #268435456
	str	r3, [r2, #64]
	ldr	r3, .L28
	ldr	r3, [r3, #64]
	and	r3, r3, #268435456
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, .L28+4
	ldr	r3, [r3]
	bic	r3, r3, #49152
	ldr	r2, .L28+4
	orr	r3, r3, #16384
	str	r3, [r2]
	ldr	r3, .L28+4
	ldr	r3, [r3]
	and	r3, r3, #49152
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r3, #2
	str	r3, [r7, #32]
	movs	r3, #1
	str	r3, [r7, #44]
	movs	r3, #16
	str	r3, [r7, #48]
	movs	r3, #2
	str	r3, [r7, #56]
	movs	r3, #0
	str	r3, [r7, #60]
	movs	r3, #16
	str	r3, [r7, #64]
	movs	r3, #100
	str	r3, [r7, #68]
	movs	r3, #2
	str	r3, [r7, #72]
	movs	r3, #4
	str	r3, [r7, #76]
	add	r3, r7, #32
	mov	r0, r3
	bl	HAL_RCC_OscConfig
	PUSH {R1, R2}
	MOV R1, #16 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r3, r0
	cmp	r3, #0
	beq	.L25
	bl	Error_Handler
.L25:
	movs	r3, #15
	str	r3, [r7, #12]
	movs	r3, #2
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #20]
	mov	r3, #4096
	str	r3, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #28]
	add	r3, r7, #12
	movs	r1, #1
	mov	r0, r3
	bl	HAL_RCC_ClockConfig
	PUSH {R1, R2}
	MOV R1, #18 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r3, r0
	cmp	r3, #0
	beq	.L27
	bl	Error_Handler
.L27:
	nop
	adds	r7, r7, #80
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #13 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
.L29:
	.align	2
.L28:
	.word	1073887232
	.word	1073770496
	.size	SystemClock_Config, .-SystemClock_Config
	.align	1
	.global	Error_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Error_Handler, %function
Error_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	Error_Handler, .-Error_Handler
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
