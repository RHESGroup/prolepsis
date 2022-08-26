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
	.file	"stm32f4xx_hal_dma_ex.c"
	.text
	.align	1
	.global	HAL_DMAEx_MultiBufferStart
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMAEx_MultiBufferStart, %function
HAL_DMAEx_MultiBufferStart:
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	movs	r3, #0
	strb	r3, [r7, #23]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	cmp	r3, #128
	bne	.L2
	ldr	r3, [r7, #12]
	mov	r2, #256
	str	r2, [r3, #84]
	movs	r3, #1
	strb	r3, [r7, #23]
	b	.L3
.L2:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L4
	movs	r3, #2
	b	.L5
.L4:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #52]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L6
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #53]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #262144
	str	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7]
	str	r2, [r3, #16]
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	DMA_MultiBufferSetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	b	.L3
.L6:
	movs	r3, #2
	strb	r3, [r7, #23]
.L3:
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
.L5:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_DMAEx_MultiBufferStart, .-HAL_DMAEx_MultiBufferStart
	.align	1
	.global	HAL_DMAEx_MultiBufferStart_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMAEx_MultiBufferStart_IT, %function
HAL_DMAEx_MultiBufferStart_IT:
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	movs	r3, #0
	strb	r3, [r7, #23]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	cmp	r3, #128
	bne	.L8
	ldr	r3, [r7, #12]
	mov	r2, #256
	str	r2, [r3, #84]
	movs	r3, #1
	b	.L9
.L8:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #60]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #68]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #76]
	cmp	r3, #0
	bne	.L11
.L10:
	ldr	r3, [r7, #12]
	movs	r2, #64
	str	r2, [r3, #84]
	movs	r3, #1
	b	.L9
.L11:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L12
	movs	r3, #2
	b	.L9
.L12:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #52]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L13
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #53]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #84]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #262144
	str	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7]
	str	r2, [r3, #16]
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	DMA_MultiBufferSetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L527
	cmp	r2, r3
	bls	.L14
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+4
	cmp	r3, r2
	beq	.L15
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+8
	cmp	r3, r2
	beq	.L16
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+12
	cmp	r3, r2
	beq	.L17
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+16
	cmp	r3, r2
	beq	.L18
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+20
	cmp	r3, r2
	beq	.L19
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+24
	cmp	r3, r2
	beq	.L20
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+28
	cmp	r3, r2
	beq	.L21
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+32
	cmp	r3, r2
	beq	.L22
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+36
	cmp	r3, r2
	beq	.L23
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+40
	cmp	r3, r2
	beq	.L24
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+44
	cmp	r3, r2
	beq	.L25
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+48
	cmp	r3, r2
	bne	.L26
	mov	r3, #2097152
	b	.L38
.L26:
	mov	r3, #134217728
	b	.L38
.L25:
	mov	r3, #2097152
	b	.L38
.L24:
	mov	r3, #2097152
	b	.L38
.L23:
	mov	r3, #2097152
	b	.L38
.L22:
	mov	r3, #2048
	b	.L38
.L21:
	mov	r3, #2048
	b	.L38
.L20:
	mov	r3, #2048
	b	.L38
.L19:
	mov	r3, #2048
	b	.L38
.L18:
	movs	r3, #32
	b	.L38
.L17:
	movs	r3, #32
	b	.L38
.L16:
	movs	r3, #32
	b	.L38
.L15:
	movs	r3, #32
.L38:
	ldr	r2, .L527+52
	str	r3, [r2, #12]
	b	.L39
.L14:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L527+56
	cmp	r2, r3
	bls	.L40
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+4
	cmp	r3, r2
	beq	.L41
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+8
	cmp	r3, r2
	beq	.L42
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+12
	cmp	r3, r2
	beq	.L43
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+16
	cmp	r3, r2
	beq	.L44
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+20
	cmp	r3, r2
	beq	.L45
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+24
	cmp	r3, r2
	beq	.L46
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+28
	cmp	r3, r2
	beq	.L47
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+32
	cmp	r3, r2
	beq	.L48
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+36
	cmp	r3, r2
	beq	.L49
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+40
	cmp	r3, r2
	beq	.L50
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+44
	cmp	r3, r2
	beq	.L51
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+48
	cmp	r3, r2
	bne	.L52
	mov	r3, #2097152
	b	.L64
.L52:
	mov	r3, #134217728
	b	.L64
.L51:
	mov	r3, #2097152
	b	.L64
.L50:
	mov	r3, #2097152
	b	.L64
.L49:
	mov	r3, #2097152
	b	.L64
.L48:
	mov	r3, #2048
	b	.L64
.L47:
	mov	r3, #2048
	b	.L64
.L46:
	mov	r3, #2048
	b	.L64
.L45:
	mov	r3, #2048
	b	.L64
.L44:
	movs	r3, #32
	b	.L64
.L43:
	movs	r3, #32
	b	.L64
.L42:
	movs	r3, #32
	b	.L64
.L41:
	movs	r3, #32
.L64:
	ldr	r2, .L527+52
	str	r3, [r2, #8]
	b	.L39
.L40:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L527+60
	cmp	r2, r3
	bls	.L66
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+4
	cmp	r3, r2
	beq	.L67
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+8
	cmp	r3, r2
	beq	.L68
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+12
	cmp	r3, r2
	beq	.L69
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+16
	cmp	r3, r2
	beq	.L70
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+20
	cmp	r3, r2
	beq	.L71
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+24
	cmp	r3, r2
	beq	.L72
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+28
	cmp	r3, r2
	beq	.L73
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+32
	cmp	r3, r2
	beq	.L74
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+36
	cmp	r3, r2
	beq	.L75
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+40
	cmp	r3, r2
	beq	.L76
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+44
	cmp	r3, r2
	beq	.L77
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L527+48
	cmp	r3, r2
	bne	.L78
	mov	r3, #2097152
	b	.L90
.L78:
	mov	r3, #134217728
	b	.L90
.L77:
	mov	r3, #2097152
	b	.L90
.L76:
	mov	r3, #2097152
	b	.L90
.L75:
	mov	r3, #2097152
	b	.L90
.L74:
	mov	r3, #2048
	b	.L90
.L73:
	mov	r3, #2048
	b	.L90
.L72:
	mov	r3, #2048
	b	.L90
.L71:
	mov	r3, #2048
	b	.L90
.L70:
	movs	r3, #32
	b	.L90
.L69:
	movs	r3, #32
	b	.L90
.L68:
	movs	r3, #32
	b	.L90
.L67:
	movs	r3, #32
.L90:
	ldr	r2, .L527+64
	str	r3, [r2, #12]
	b	.L39
.L528:
	.align	2
.L527:
	.word	1073898584
	.word	1073897488
	.word	1073898512
	.word	1073897584
	.word	1073898608
	.word	1073897512
	.word	1073898536
	.word	1073897608
	.word	1073898632
	.word	1073897536
	.word	1073898560
	.word	1073897632
	.word	1073898656
	.word	1073898496
	.word	1073897656
	.word	1073897560
	.word	1073897472
.L66:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529
	cmp	r3, r2
	beq	.L92
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+4
	cmp	r3, r2
	beq	.L93
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+8
	cmp	r3, r2
	beq	.L94
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+12
	cmp	r3, r2
	beq	.L95
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+16
	cmp	r3, r2
	beq	.L96
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+20
	cmp	r3, r2
	beq	.L97
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+24
	cmp	r3, r2
	beq	.L98
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+28
	cmp	r3, r2
	beq	.L99
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+32
	cmp	r3, r2
	beq	.L100
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+36
	cmp	r3, r2
	beq	.L101
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+40
	cmp	r3, r2
	beq	.L102
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+44
	cmp	r3, r2
	bne	.L103
	mov	r3, #2097152
	b	.L115
.L103:
	mov	r3, #134217728
	b	.L115
.L102:
	mov	r3, #2097152
	b	.L115
.L101:
	mov	r3, #2097152
	b	.L115
.L100:
	mov	r3, #2097152
	b	.L115
.L99:
	mov	r3, #2048
	b	.L115
.L98:
	mov	r3, #2048
	b	.L115
.L97:
	mov	r3, #2048
	b	.L115
.L96:
	mov	r3, #2048
	b	.L115
.L95:
	movs	r3, #32
	b	.L115
.L94:
	movs	r3, #32
	b	.L115
.L93:
	movs	r3, #32
	b	.L115
.L92:
	movs	r3, #32
.L115:
	ldr	r2, .L529+48
	str	r3, [r2, #8]
.L39:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L529+52
	cmp	r2, r3
	bls	.L116
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529
	cmp	r3, r2
	beq	.L117
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+4
	cmp	r3, r2
	beq	.L118
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+8
	cmp	r3, r2
	beq	.L119
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+12
	cmp	r3, r2
	beq	.L120
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+16
	cmp	r3, r2
	beq	.L121
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+20
	cmp	r3, r2
	beq	.L122
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+24
	cmp	r3, r2
	beq	.L123
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+28
	cmp	r3, r2
	beq	.L124
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+32
	cmp	r3, r2
	beq	.L125
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+36
	cmp	r3, r2
	beq	.L126
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+40
	cmp	r3, r2
	beq	.L127
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+44
	cmp	r3, r2
	bne	.L128
	mov	r3, #1048576
	b	.L140
.L128:
	mov	r3, #67108864
	b	.L140
.L127:
	mov	r3, #1048576
	b	.L140
.L126:
	mov	r3, #1048576
	b	.L140
.L125:
	mov	r3, #1048576
	b	.L140
.L124:
	mov	r3, #1024
	b	.L140
.L123:
	mov	r3, #1024
	b	.L140
.L122:
	mov	r3, #1024
	b	.L140
.L121:
	mov	r3, #1024
	b	.L140
.L120:
	movs	r3, #16
	b	.L140
.L119:
	movs	r3, #16
	b	.L140
.L118:
	movs	r3, #16
	b	.L140
.L117:
	movs	r3, #16
.L140:
	ldr	r2, .L529+56
	str	r3, [r2, #12]
	b	.L141
.L116:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L529+60
	cmp	r2, r3
	bls	.L142
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529
	cmp	r3, r2
	beq	.L143
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+4
	cmp	r3, r2
	beq	.L144
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+8
	cmp	r3, r2
	beq	.L145
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+12
	cmp	r3, r2
	beq	.L146
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+16
	cmp	r3, r2
	beq	.L147
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+20
	cmp	r3, r2
	beq	.L148
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+24
	cmp	r3, r2
	beq	.L149
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+28
	cmp	r3, r2
	beq	.L150
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+32
	cmp	r3, r2
	beq	.L151
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+36
	cmp	r3, r2
	beq	.L152
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+40
	cmp	r3, r2
	beq	.L153
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L529+44
	cmp	r3, r2
	bne	.L154
	mov	r3, #1048576
	b	.L166
.L154:
	mov	r3, #67108864
	b	.L166
.L153:
	mov	r3, #1048576
	b	.L166
.L152:
	mov	r3, #1048576
	b	.L166
.L151:
	mov	r3, #1048576
	b	.L166
.L150:
	mov	r3, #1024
	b	.L166
.L149:
	mov	r3, #1024
	b	.L166
.L148:
	mov	r3, #1024
	b	.L166
.L147:
	mov	r3, #1024
	b	.L166
.L146:
	movs	r3, #16
	b	.L166
.L145:
	movs	r3, #16
	b	.L166
.L144:
	movs	r3, #16
	b	.L166
.L143:
	movs	r3, #16
.L166:
	ldr	r2, .L529+56
	str	r3, [r2, #8]
	b	.L141
.L530:
	.align	2
.L529:
	.word	1073897488
	.word	1073898512
	.word	1073897584
	.word	1073898608
	.word	1073897512
	.word	1073898536
	.word	1073897608
	.word	1073898632
	.word	1073897536
	.word	1073898560
	.word	1073897632
	.word	1073898656
	.word	1073897472
	.word	1073898584
	.word	1073898496
	.word	1073897656
.L142:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L531
	cmp	r2, r3
	bls	.L168
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+4
	cmp	r3, r2
	beq	.L169
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+8
	cmp	r3, r2
	beq	.L170
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+12
	cmp	r3, r2
	beq	.L171
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+16
	cmp	r3, r2
	beq	.L172
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+20
	cmp	r3, r2
	beq	.L173
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+24
	cmp	r3, r2
	beq	.L174
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+28
	cmp	r3, r2
	beq	.L175
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+32
	cmp	r3, r2
	beq	.L176
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+36
	cmp	r3, r2
	beq	.L177
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+40
	cmp	r3, r2
	beq	.L178
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+44
	cmp	r3, r2
	beq	.L179
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+48
	cmp	r3, r2
	bne	.L180
	mov	r3, #1048576
	b	.L192
.L180:
	mov	r3, #67108864
	b	.L192
.L179:
	mov	r3, #1048576
	b	.L192
.L178:
	mov	r3, #1048576
	b	.L192
.L177:
	mov	r3, #1048576
	b	.L192
.L176:
	mov	r3, #1024
	b	.L192
.L175:
	mov	r3, #1024
	b	.L192
.L174:
	mov	r3, #1024
	b	.L192
.L173:
	mov	r3, #1024
	b	.L192
.L172:
	movs	r3, #16
	b	.L192
.L171:
	movs	r3, #16
	b	.L192
.L170:
	movs	r3, #16
	b	.L192
.L169:
	movs	r3, #16
.L192:
	ldr	r2, .L531+52
	str	r3, [r2, #12]
	b	.L141
.L168:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+4
	cmp	r3, r2
	beq	.L194
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+8
	cmp	r3, r2
	beq	.L195
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+12
	cmp	r3, r2
	beq	.L196
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+16
	cmp	r3, r2
	beq	.L197
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+20
	cmp	r3, r2
	beq	.L198
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+24
	cmp	r3, r2
	beq	.L199
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+28
	cmp	r3, r2
	beq	.L200
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+32
	cmp	r3, r2
	beq	.L201
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+36
	cmp	r3, r2
	beq	.L202
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+40
	cmp	r3, r2
	beq	.L203
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+44
	cmp	r3, r2
	beq	.L204
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+48
	cmp	r3, r2
	bne	.L205
	mov	r3, #1048576
	b	.L217
.L205:
	mov	r3, #67108864
	b	.L217
.L204:
	mov	r3, #1048576
	b	.L217
.L203:
	mov	r3, #1048576
	b	.L217
.L202:
	mov	r3, #1048576
	b	.L217
.L201:
	mov	r3, #1024
	b	.L217
.L200:
	mov	r3, #1024
	b	.L217
.L199:
	mov	r3, #1024
	b	.L217
.L198:
	mov	r3, #1024
	b	.L217
.L197:
	movs	r3, #16
	b	.L217
.L196:
	movs	r3, #16
	b	.L217
.L195:
	movs	r3, #16
	b	.L217
.L194:
	movs	r3, #16
.L217:
	ldr	r2, .L531+52
	str	r3, [r2, #8]
.L141:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L531+56
	cmp	r2, r3
	bls	.L218
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+4
	cmp	r3, r2
	beq	.L219
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+8
	cmp	r3, r2
	beq	.L220
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+12
	cmp	r3, r2
	beq	.L221
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+16
	cmp	r3, r2
	beq	.L222
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+20
	cmp	r3, r2
	beq	.L223
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+24
	cmp	r3, r2
	beq	.L224
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+28
	cmp	r3, r2
	beq	.L225
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+32
	cmp	r3, r2
	beq	.L226
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+36
	cmp	r3, r2
	beq	.L227
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+40
	cmp	r3, r2
	beq	.L228
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+44
	cmp	r3, r2
	beq	.L229
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L531+48
	cmp	r3, r2
	bne	.L230
	mov	r3, #524288
	b	.L242
.L230:
	mov	r3, #33554432
	b	.L242
.L229:
	mov	r3, #524288
	b	.L242
.L228:
	mov	r3, #524288
	b	.L242
.L227:
	mov	r3, #524288
	b	.L242
.L226:
	mov	r3, #512
	b	.L242
.L225:
	mov	r3, #512
	b	.L242
.L224:
	mov	r3, #512
	b	.L242
.L223:
	mov	r3, #512
	b	.L242
.L222:
	movs	r3, #8
	b	.L242
.L221:
	movs	r3, #8
	b	.L242
.L220:
	movs	r3, #8
	b	.L242
.L219:
	movs	r3, #8
.L242:
	ldr	r2, .L531+60
	str	r3, [r2, #12]
	b	.L243
.L532:
	.align	2
.L531:
	.word	1073897560
	.word	1073897488
	.word	1073898512
	.word	1073897584
	.word	1073898608
	.word	1073897512
	.word	1073898536
	.word	1073897608
	.word	1073898632
	.word	1073897536
	.word	1073898560
	.word	1073897632
	.word	1073898656
	.word	1073897472
	.word	1073898584
	.word	1073898496
.L218:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L533
	cmp	r2, r3
	bls	.L244
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+4
	cmp	r3, r2
	beq	.L245
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+8
	cmp	r3, r2
	beq	.L246
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+12
	cmp	r3, r2
	beq	.L247
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+16
	cmp	r3, r2
	beq	.L248
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+20
	cmp	r3, r2
	beq	.L249
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+24
	cmp	r3, r2
	beq	.L250
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+28
	cmp	r3, r2
	beq	.L251
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+32
	cmp	r3, r2
	beq	.L252
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+36
	cmp	r3, r2
	beq	.L253
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+40
	cmp	r3, r2
	beq	.L254
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+44
	cmp	r3, r2
	beq	.L255
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+48
	cmp	r3, r2
	bne	.L256
	mov	r3, #524288
	b	.L268
.L256:
	mov	r3, #33554432
	b	.L268
.L255:
	mov	r3, #524288
	b	.L268
.L254:
	mov	r3, #524288
	b	.L268
.L253:
	mov	r3, #524288
	b	.L268
.L252:
	mov	r3, #512
	b	.L268
.L251:
	mov	r3, #512
	b	.L268
.L250:
	mov	r3, #512
	b	.L268
.L249:
	mov	r3, #512
	b	.L268
.L248:
	movs	r3, #8
	b	.L268
.L247:
	movs	r3, #8
	b	.L268
.L246:
	movs	r3, #8
	b	.L268
.L245:
	movs	r3, #8
.L268:
	ldr	r2, .L533+52
	str	r3, [r2, #8]
	b	.L243
.L244:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L533+56
	cmp	r2, r3
	bls	.L270
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+4
	cmp	r3, r2
	beq	.L271
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+8
	cmp	r3, r2
	beq	.L272
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+12
	cmp	r3, r2
	beq	.L273
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+16
	cmp	r3, r2
	beq	.L274
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+20
	cmp	r3, r2
	beq	.L275
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+24
	cmp	r3, r2
	beq	.L276
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+28
	cmp	r3, r2
	beq	.L277
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+32
	cmp	r3, r2
	beq	.L278
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+36
	cmp	r3, r2
	beq	.L279
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+40
	cmp	r3, r2
	beq	.L280
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+44
	cmp	r3, r2
	beq	.L281
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+48
	cmp	r3, r2
	bne	.L282
	mov	r3, #524288
	b	.L294
.L282:
	mov	r3, #33554432
	b	.L294
.L281:
	mov	r3, #524288
	b	.L294
.L280:
	mov	r3, #524288
	b	.L294
.L279:
	mov	r3, #524288
	b	.L294
.L278:
	mov	r3, #512
	b	.L294
.L277:
	mov	r3, #512
	b	.L294
.L276:
	mov	r3, #512
	b	.L294
.L275:
	mov	r3, #512
	b	.L294
.L274:
	movs	r3, #8
	b	.L294
.L273:
	movs	r3, #8
	b	.L294
.L272:
	movs	r3, #8
	b	.L294
.L271:
	movs	r3, #8
.L294:
	ldr	r2, .L533+60
	str	r3, [r2, #12]
	b	.L243
.L270:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+4
	cmp	r3, r2
	beq	.L296
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+8
	cmp	r3, r2
	beq	.L297
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+12
	cmp	r3, r2
	beq	.L298
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+16
	cmp	r3, r2
	beq	.L299
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+20
	cmp	r3, r2
	beq	.L300
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+24
	cmp	r3, r2
	beq	.L301
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+28
	cmp	r3, r2
	beq	.L302
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+32
	cmp	r3, r2
	beq	.L303
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+36
	cmp	r3, r2
	beq	.L304
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+40
	cmp	r3, r2
	beq	.L305
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+44
	cmp	r3, r2
	beq	.L306
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L533+48
	cmp	r3, r2
	bne	.L307
	mov	r3, #524288
	b	.L319
.L307:
	mov	r3, #33554432
	b	.L319
.L306:
	mov	r3, #524288
	b	.L319
.L305:
	mov	r3, #524288
	b	.L319
.L304:
	mov	r3, #524288
	b	.L319
.L303:
	mov	r3, #512
	b	.L319
.L302:
	mov	r3, #512
	b	.L319
.L301:
	mov	r3, #512
	b	.L319
.L300:
	mov	r3, #512
	b	.L319
.L299:
	movs	r3, #8
	b	.L319
.L298:
	movs	r3, #8
	b	.L319
.L297:
	movs	r3, #8
	b	.L319
.L534:
	.align	2
.L533:
	.word	1073897656
	.word	1073897488
	.word	1073898512
	.word	1073897584
	.word	1073898608
	.word	1073897512
	.word	1073898536
	.word	1073897608
	.word	1073898632
	.word	1073897536
	.word	1073898560
	.word	1073897632
	.word	1073898656
	.word	1073898496
	.word	1073897560
	.word	1073897472
.L296:
	movs	r3, #8
.L319:
	ldr	r2, .L535
	str	r3, [r2, #8]
.L243:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L535+4
	cmp	r2, r3
	bls	.L320
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+8
	cmp	r3, r2
	beq	.L321
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+12
	cmp	r3, r2
	beq	.L322
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+16
	cmp	r3, r2
	beq	.L323
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+20
	cmp	r3, r2
	beq	.L324
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+24
	cmp	r3, r2
	beq	.L325
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+28
	cmp	r3, r2
	beq	.L326
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+32
	cmp	r3, r2
	beq	.L327
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+36
	cmp	r3, r2
	beq	.L328
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+40
	cmp	r3, r2
	beq	.L329
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+44
	cmp	r3, r2
	beq	.L330
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+48
	cmp	r3, r2
	beq	.L331
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+52
	cmp	r3, r2
	bne	.L332
	mov	r3, #262144
	b	.L344
.L332:
	mov	r3, #16777216
	b	.L344
.L331:
	mov	r3, #262144
	b	.L344
.L330:
	mov	r3, #262144
	b	.L344
.L329:
	mov	r3, #262144
	b	.L344
.L328:
	mov	r3, #256
	b	.L344
.L327:
	mov	r3, #256
	b	.L344
.L326:
	mov	r3, #256
	b	.L344
.L325:
	mov	r3, #256
	b	.L344
.L324:
	movs	r3, #4
	b	.L344
.L323:
	movs	r3, #4
	b	.L344
.L322:
	movs	r3, #4
	b	.L344
.L321:
	movs	r3, #4
.L344:
	ldr	r2, .L535+56
	str	r3, [r2, #12]
	b	.L345
.L320:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L535+60
	cmp	r2, r3
	bls	.L346
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+8
	cmp	r3, r2
	beq	.L347
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+12
	cmp	r3, r2
	beq	.L348
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+16
	cmp	r3, r2
	beq	.L349
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+20
	cmp	r3, r2
	beq	.L350
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+24
	cmp	r3, r2
	beq	.L351
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+28
	cmp	r3, r2
	beq	.L352
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+32
	cmp	r3, r2
	beq	.L353
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+36
	cmp	r3, r2
	beq	.L354
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+40
	cmp	r3, r2
	beq	.L355
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+44
	cmp	r3, r2
	beq	.L356
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+48
	cmp	r3, r2
	beq	.L357
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+52
	cmp	r3, r2
	bne	.L358
	mov	r3, #262144
	b	.L370
.L358:
	mov	r3, #16777216
	b	.L370
.L357:
	mov	r3, #262144
	b	.L370
.L356:
	mov	r3, #262144
	b	.L370
.L355:
	mov	r3, #262144
	b	.L370
.L354:
	mov	r3, #256
	b	.L370
.L353:
	mov	r3, #256
	b	.L370
.L352:
	mov	r3, #256
	b	.L370
.L351:
	mov	r3, #256
	b	.L370
.L350:
	movs	r3, #4
	b	.L370
.L349:
	movs	r3, #4
	b	.L370
.L348:
	movs	r3, #4
	b	.L370
.L347:
	movs	r3, #4
.L370:
	ldr	r2, .L535+56
	str	r3, [r2, #8]
	b	.L345
.L346:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L535+64
	cmp	r2, r3
	bls	.L372
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+8
	cmp	r3, r2
	beq	.L373
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+12
	cmp	r3, r2
	beq	.L374
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+16
	cmp	r3, r2
	beq	.L375
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+20
	cmp	r3, r2
	beq	.L376
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+24
	cmp	r3, r2
	beq	.L377
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+28
	cmp	r3, r2
	beq	.L378
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+32
	cmp	r3, r2
	beq	.L379
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+36
	cmp	r3, r2
	beq	.L380
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+40
	cmp	r3, r2
	beq	.L381
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+44
	cmp	r3, r2
	beq	.L382
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+48
	cmp	r3, r2
	beq	.L383
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L535+52
	cmp	r3, r2
	bne	.L384
	mov	r3, #262144
	b	.L396
.L384:
	mov	r3, #16777216
	b	.L396
.L383:
	mov	r3, #262144
	b	.L396
.L382:
	mov	r3, #262144
	b	.L396
.L381:
	mov	r3, #262144
	b	.L396
.L380:
	mov	r3, #256
	b	.L396
.L379:
	mov	r3, #256
	b	.L396
.L378:
	mov	r3, #256
	b	.L396
.L377:
	mov	r3, #256
	b	.L396
.L376:
	movs	r3, #4
	b	.L396
.L375:
	movs	r3, #4
	b	.L396
.L374:
	movs	r3, #4
	b	.L396
.L536:
	.align	2
.L535:
	.word	1073897472
	.word	1073898584
	.word	1073897488
	.word	1073898512
	.word	1073897584
	.word	1073898608
	.word	1073897512
	.word	1073898536
	.word	1073897608
	.word	1073898632
	.word	1073897536
	.word	1073898560
	.word	1073897632
	.word	1073898656
	.word	1073898496
	.word	1073897656
	.word	1073897560
.L373:
	movs	r3, #4
.L396:
	ldr	r2, .L537
	str	r3, [r2, #12]
	b	.L345
.L372:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+4
	cmp	r3, r2
	beq	.L398
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+8
	cmp	r3, r2
	beq	.L399
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+12
	cmp	r3, r2
	beq	.L400
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+16
	cmp	r3, r2
	beq	.L401
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+20
	cmp	r3, r2
	beq	.L402
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+24
	cmp	r3, r2
	beq	.L403
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+28
	cmp	r3, r2
	beq	.L404
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+32
	cmp	r3, r2
	beq	.L405
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+36
	cmp	r3, r2
	beq	.L406
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+40
	cmp	r3, r2
	beq	.L407
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+44
	cmp	r3, r2
	beq	.L408
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+48
	cmp	r3, r2
	bne	.L409
	mov	r3, #262144
	b	.L421
.L409:
	mov	r3, #16777216
	b	.L421
.L408:
	mov	r3, #262144
	b	.L421
.L407:
	mov	r3, #262144
	b	.L421
.L406:
	mov	r3, #262144
	b	.L421
.L405:
	mov	r3, #256
	b	.L421
.L404:
	mov	r3, #256
	b	.L421
.L403:
	mov	r3, #256
	b	.L421
.L402:
	mov	r3, #256
	b	.L421
.L401:
	movs	r3, #4
	b	.L421
.L400:
	movs	r3, #4
	b	.L421
.L399:
	movs	r3, #4
	b	.L421
.L398:
	movs	r3, #4
.L421:
	ldr	r2, .L537
	str	r3, [r2, #8]
.L345:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L537+52
	cmp	r2, r3
	bls	.L422
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+4
	cmp	r3, r2
	beq	.L423
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+8
	cmp	r3, r2
	beq	.L424
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+12
	cmp	r3, r2
	beq	.L425
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+16
	cmp	r3, r2
	beq	.L426
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+20
	cmp	r3, r2
	beq	.L427
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+24
	cmp	r3, r2
	beq	.L428
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+28
	cmp	r3, r2
	beq	.L429
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+32
	cmp	r3, r2
	beq	.L430
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+36
	cmp	r3, r2
	beq	.L431
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+40
	cmp	r3, r2
	beq	.L432
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+44
	cmp	r3, r2
	beq	.L433
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+48
	cmp	r3, r2
	bne	.L434
	mov	r3, #65536
	b	.L446
.L434:
	mov	r3, #4194304
	b	.L446
.L433:
	mov	r3, #65536
	b	.L446
.L432:
	mov	r3, #65536
	b	.L446
.L431:
	mov	r3, #65536
	b	.L446
.L430:
	movs	r3, #64
	b	.L446
.L429:
	movs	r3, #64
	b	.L446
.L428:
	movs	r3, #64
	b	.L446
.L427:
	movs	r3, #64
	b	.L446
.L426:
	movs	r3, #1
	b	.L446
.L425:
	movs	r3, #1
	b	.L446
.L424:
	movs	r3, #1
	b	.L446
.L423:
	movs	r3, #1
.L446:
	ldr	r2, .L537+56
	str	r3, [r2, #12]
	b	.L447
.L422:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L537+60
	cmp	r2, r3
	bls	.L448
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+4
	cmp	r3, r2
	beq	.L449
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+8
	cmp	r3, r2
	beq	.L450
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+12
	cmp	r3, r2
	beq	.L451
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+16
	cmp	r3, r2
	beq	.L452
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+20
	cmp	r3, r2
	beq	.L453
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+24
	cmp	r3, r2
	beq	.L454
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+28
	cmp	r3, r2
	beq	.L455
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+32
	cmp	r3, r2
	beq	.L456
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+36
	cmp	r3, r2
	beq	.L457
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+40
	cmp	r3, r2
	beq	.L458
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+44
	cmp	r3, r2
	beq	.L459
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L537+48
	cmp	r3, r2
	bne	.L460
	mov	r3, #65536
	b	.L472
.L460:
	mov	r3, #4194304
	b	.L472
.L459:
	mov	r3, #65536
	b	.L472
.L458:
	mov	r3, #65536
	b	.L472
.L457:
	mov	r3, #65536
	b	.L472
.L456:
	movs	r3, #64
	b	.L472
.L455:
	movs	r3, #64
	b	.L472
.L454:
	movs	r3, #64
	b	.L472
.L453:
	movs	r3, #64
	b	.L472
.L452:
	movs	r3, #1
	b	.L472
.L451:
	movs	r3, #1
	b	.L472
.L450:
	movs	r3, #1
	b	.L472
.L449:
	movs	r3, #1
.L472:
	ldr	r2, .L537+56
	str	r3, [r2, #8]
	b	.L447
.L538:
	.align	2
.L537:
	.word	1073897472
	.word	1073897488
	.word	1073898512
	.word	1073897584
	.word	1073898608
	.word	1073897512
	.word	1073898536
	.word	1073897608
	.word	1073898632
	.word	1073897536
	.word	1073898560
	.word	1073897632
	.word	1073898656
	.word	1073898584
	.word	1073898496
	.word	1073897656
.L448:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L539
	cmp	r2, r3
	bls	.L474
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+4
	cmp	r3, r2
	beq	.L475
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+8
	cmp	r3, r2
	beq	.L476
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+12
	cmp	r3, r2
	beq	.L477
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+16
	cmp	r3, r2
	beq	.L478
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+20
	cmp	r3, r2
	beq	.L479
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+24
	cmp	r3, r2
	beq	.L480
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+28
	cmp	r3, r2
	beq	.L481
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+32
	cmp	r3, r2
	beq	.L482
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+36
	cmp	r3, r2
	beq	.L483
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+40
	cmp	r3, r2
	beq	.L484
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+44
	cmp	r3, r2
	beq	.L485
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+48
	cmp	r3, r2
	bne	.L486
	mov	r3, #65536
	b	.L498
.L486:
	mov	r3, #4194304
	b	.L498
.L485:
	mov	r3, #65536
	b	.L498
.L484:
	mov	r3, #65536
	b	.L498
.L483:
	mov	r3, #65536
	b	.L498
.L482:
	movs	r3, #64
	b	.L498
.L481:
	movs	r3, #64
	b	.L498
.L480:
	movs	r3, #64
	b	.L498
.L479:
	movs	r3, #64
	b	.L498
.L478:
	movs	r3, #1
	b	.L498
.L477:
	movs	r3, #1
	b	.L498
.L476:
	movs	r3, #1
	b	.L498
.L475:
	movs	r3, #1
.L498:
	ldr	r2, .L539+52
	str	r3, [r2, #12]
	b	.L447
.L474:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+4
	cmp	r3, r2
	beq	.L500
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+8
	cmp	r3, r2
	beq	.L501
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+12
	cmp	r3, r2
	beq	.L502
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+16
	cmp	r3, r2
	beq	.L503
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+20
	cmp	r3, r2
	beq	.L504
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+24
	cmp	r3, r2
	beq	.L505
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+28
	cmp	r3, r2
	beq	.L506
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+32
	cmp	r3, r2
	beq	.L507
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+36
	cmp	r3, r2
	beq	.L508
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+40
	cmp	r3, r2
	beq	.L509
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+44
	cmp	r3, r2
	beq	.L510
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L539+48
	cmp	r3, r2
	bne	.L511
	mov	r3, #65536
	b	.L523
.L511:
	mov	r3, #4194304
	b	.L523
.L510:
	mov	r3, #65536
	b	.L523
.L509:
	mov	r3, #65536
	b	.L523
.L508:
	mov	r3, #65536
	b	.L523
.L507:
	movs	r3, #64
	b	.L523
.L506:
	movs	r3, #64
	b	.L523
.L505:
	movs	r3, #64
	b	.L523
.L504:
	movs	r3, #64
	b	.L523
.L503:
	movs	r3, #1
	b	.L523
.L502:
	movs	r3, #1
	b	.L523
.L501:
	movs	r3, #1
	b	.L523
.L500:
	movs	r3, #1
.L523:
	ldr	r2, .L539+52
	str	r3, [r2, #8]
.L447:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #22
	str	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #64]
	cmp	r3, #0
	bne	.L524
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #72]
	cmp	r3, #0
	beq	.L525
.L524:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3]
.L525:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	b	.L526
.L13:
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #52]
	movs	r3, #2
	strb	r3, [r7, #23]
.L526:
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
.L9:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L540:
	.align	2
.L539:
	.word	1073897560
	.word	1073897488
	.word	1073898512
	.word	1073897584
	.word	1073898608
	.word	1073897512
	.word	1073898536
	.word	1073897608
	.word	1073898632
	.word	1073897536
	.word	1073898560
	.word	1073897632
	.word	1073898656
	.word	1073897472
	.size	HAL_DMAEx_MultiBufferStart_IT, .-HAL_DMAEx_MultiBufferStart_IT
	.align	1
	.global	HAL_DMAEx_ChangeMemory
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMAEx_ChangeMemory, %function
HAL_DMAEx_ChangeMemory:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L542
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	str	r2, [r3, #12]
	b	.L543
.L542:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	str	r2, [r3, #16]
.L543:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_DMAEx_ChangeMemory, .-HAL_DMAEx_ChangeMemory
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DMA_MultiBufferSetConfig, %function
DMA_MultiBufferSetConfig:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7]
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	cmp	r3, #64
	bne	.L546
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	str	r2, [r3, #12]
	b	.L548
.L546:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	str	r2, [r3, #12]
.L548:
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	DMA_MultiBufferSetConfig, .-DMA_MultiBufferSetConfig
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
