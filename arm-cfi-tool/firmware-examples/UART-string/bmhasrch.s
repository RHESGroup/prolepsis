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
	.file	"bmhasrch.c"
	.text
	.global	lowervec
	.section	.data.lowervec,"aw",%progbits
	.align	2
	.type	lowervec, %object
	.size	lowervec, 256
lowervec:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	43
	.byte	44
	.byte	45
	.byte	46
	.byte	47
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	58
	.byte	59
	.byte	60
	.byte	61
	.byte	62
	.byte	63
	.byte	64
	.byte	97
	.byte	98
	.byte	99
	.byte	100
	.byte	101
	.byte	102
	.byte	103
	.byte	104
	.byte	105
	.byte	106
	.byte	107
	.byte	108
	.byte	109
	.byte	110
	.byte	111
	.byte	112
	.byte	113
	.byte	114
	.byte	115
	.byte	116
	.byte	117
	.byte	118
	.byte	119
	.byte	120
	.byte	121
	.byte	122
	.byte	91
	.byte	92
	.byte	93
	.byte	94
	.byte	95
	.byte	96
	.byte	97
	.byte	98
	.byte	99
	.byte	100
	.byte	101
	.byte	102
	.byte	103
	.byte	104
	.byte	105
	.byte	106
	.byte	107
	.byte	108
	.byte	109
	.byte	110
	.byte	111
	.byte	112
	.byte	113
	.byte	114
	.byte	115
	.byte	116
	.byte	117
	.byte	118
	.byte	119
	.byte	120
	.byte	121
	.byte	122
	.byte	123
	.byte	124
	.byte	125
	.byte	126
	.byte	127
	.byte	99
	.byte	117
	.byte	101
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	99
	.byte	101
	.byte	101
	.byte	101
	.byte	105
	.byte	105
	.byte	105
	.byte	97
	.byte	97
	.byte	101
	.byte	-111
	.byte	-110
	.byte	111
	.byte	111
	.byte	111
	.byte	117
	.byte	117
	.byte	121
	.byte	111
	.byte	117
	.byte	-101
	.byte	-100
	.byte	-99
	.byte	-98
	.byte	-97
	.byte	97
	.byte	105
	.byte	111
	.byte	117
	.byte	110
	.byte	110
	.byte	-90
	.byte	-89
	.byte	-88
	.byte	-87
	.byte	-86
	.byte	-85
	.byte	-84
	.byte	-83
	.byte	-82
	.byte	-81
	.byte	-80
	.byte	-79
	.byte	-78
	.byte	-77
	.byte	-76
	.byte	-75
	.byte	-74
	.byte	-73
	.byte	-72
	.byte	-71
	.byte	-70
	.byte	-69
	.byte	-68
	.byte	-67
	.byte	-66
	.byte	-65
	.byte	-64
	.byte	-63
	.byte	-62
	.byte	-61
	.byte	-60
	.byte	-59
	.byte	-58
	.byte	-57
	.byte	-56
	.byte	-55
	.byte	-54
	.byte	-53
	.byte	-52
	.byte	-51
	.byte	-50
	.byte	-49
	.byte	-48
	.byte	-47
	.byte	-46
	.byte	-45
	.byte	-44
	.byte	-43
	.byte	-42
	.byte	-41
	.byte	-40
	.byte	-39
	.byte	-38
	.byte	-37
	.byte	-36
	.byte	-35
	.byte	-34
	.byte	-33
	.byte	-32
	.byte	-31
	.byte	-30
	.byte	-29
	.byte	-28
	.byte	-27
	.byte	-26
	.byte	-25
	.byte	-24
	.byte	-23
	.byte	-22
	.byte	-21
	.byte	-20
	.byte	-19
	.byte	-18
	.byte	-17
	.byte	-16
	.byte	-15
	.byte	-14
	.byte	-13
	.byte	-12
	.byte	-11
	.byte	-10
	.byte	-9
	.byte	-8
	.byte	-7
	.byte	-6
	.byte	-5
	.byte	-4
	.byte	-3
	.byte	-2
	.byte	-1
	.section	.bss.patlen,"aw",%nobits
	.align	2
	.type	patlen, %object
	.size	patlen, 4
patlen:
	.space	4
	.section	.bss.skip,"aw",%nobits
	.align	2
	.type	skip, %object
	.size	skip, 1024
skip:
	.space	1024
	.section	.bss.skip2,"aw",%nobits
	.align	2
	.type	skip2, %object
	.size	skip2, 4
skip2:
	.space	4
	.section	.bss.pat,"aw",%nobits
	.align	2
	.type	pat, %object
	.size	pat, 4
pat:
	.space	4
	.text
	.align	1
	.global	bmha_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	bmha_init, %function
bmha_init:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r2, .L14
	ldr	r3, [r7, #4]
	str	r3, [r2]
	ldr	r0, [r7, #4]
	bl	strlen
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L14+4
	str	r2, [r3]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L2
.L9:
	ldr	r3, .L14+4
	ldr	r2, [r3]
	ldr	r1, .L14+8
	ldr	r3, [r7, #12]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L14+4
	ldr	r3, [r3]
	subs	r3, r3, #1
	str	r3, [r7, #8]
	b	.L3
.L6:
	ldr	r3, [r7, #12]
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, .L14+12
	ldrb	r2, [r3, r2]	@ zero_extendqisi2
	ldr	r3, .L14
	ldr	r1, [r3]
	ldr	r3, [r7, #8]
	add	r3, r3, r1
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, .L14+12
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L13
	ldr	r3, [r7, #8]
	subs	r3, r3, #1
	str	r3, [r7, #8]
.L3:
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bge	.L6
	b	.L5
.L13:
	nop
.L5:
	ldr	r3, [r7, #8]
	cmp	r3, #0
	blt	.L7
	ldr	r3, .L14+4
	ldr	r2, [r3]
	ldr	r3, [r7, #8]
	subs	r3, r2, r3
	subs	r2, r3, #1
	ldr	r1, .L14+8
	ldr	r3, [r7, #12]
	str	r2, [r1, r3, lsl #2]
.L7:
	ldr	r3, .L14+4
	ldr	r3, [r3]
	subs	r3, r3, #1
	ldr	r2, [r7, #8]
	cmp	r2, r3
	bne	.L8
	ldr	r2, .L14+8
	ldr	r3, [r7, #12]
	movw	r1, #32767
	str	r1, [r2, r3, lsl #2]
.L8:
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #12]
	cmp	r3, #255
	ble	.L9
	ldr	r3, .L14+4
	ldr	r3, [r3]
	ldr	r2, .L14+16
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L10
.L12:
	ldr	r3, .L14
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L14+12
	ldrb	r2, [r3, r2]	@ zero_extendqisi2
	ldr	r3, .L14
	ldr	r1, [r3]
	ldr	r3, .L14+4
	ldr	r3, [r3]
	subs	r3, r3, #1
	add	r3, r3, r1
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, .L14+12
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L11
	ldr	r3, .L14+4
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	subs	r3, r3, #1
	ldr	r2, .L14+16
	str	r3, [r2]
.L11:
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L10:
	ldr	r3, .L14+4
	ldr	r3, [r3]
	subs	r3, r3, #1
	ldr	r2, [r7, #12]
	cmp	r2, r3
	blt	.L12
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	pat
	.word	patlen
	.word	skip
	.word	lowervec
	.word	skip2
	.size	bmha_init, .-bmha_init
	.align	1
	.global	bmha_search
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	bmha_search, %function
bmha_search:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, .L26
	ldr	r3, [r3]
	subs	r2, r3, #1
	ldr	r3, [r7]
	subs	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L17
	movs	r3, #0
	b	.L18
.L17:
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
.L25:
	nop
.L19:
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L26+4
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [r7, #20]
	add	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L19
	ldr	r3, [r7]
	rsb	r3, r3, #32640
	adds	r3, r3, #127
	ldr	r2, [r7, #20]
	cmp	r2, r3
	bge	.L20
	movs	r3, #0
	b	.L18
.L20:
	ldr	r3, [r7, #20]
	sub	r3, r3, #32640
	subs	r3, r3, #127
	str	r3, [r7, #20]
	ldr	r3, .L26
	ldr	r3, [r3]
	subs	r3, r3, #1
	str	r3, [r7, #16]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #12]
.L22:
	ldr	r3, [r7, #16]
	subs	r3, r3, #1
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	cmp	r3, #0
	blt	.L21
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #12]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L26+8
	ldrb	r2, [r3, r2]	@ zero_extendqisi2
	ldr	r3, .L26+12
	ldr	r1, [r3]
	ldr	r3, [r7, #16]
	add	r3, r3, r1
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, .L26+8
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L22
.L21:
	ldr	r3, [r7, #16]
	cmp	r3, #0
	bge	.L23
	ldr	r3, [r7, #12]
	b	.L18
.L23:
	ldr	r3, .L26+16
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	add	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L25
	movs	r3, #0
.L18:
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L27:
	.align	2
.L26:
	.word	patlen
	.word	skip
	.word	lowervec
	.word	pat
	.word	skip2
	.size	bmha_search, .-bmha_search
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
