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
	.file	"stm32f4xx_hal_rcc.c"
	.text
	.align	1
	.weak	HAL_RCC_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_DeInit, %function
HAL_RCC_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	movs	r3, #0
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_RCC_DeInit, .-HAL_RCC_DeInit
	.align	1
	.weak	HAL_RCC_OscConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_OscConfig, %function
HAL_RCC_OscConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L4
	movs	r3, #1
	b	.L5
.L4:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L6
	ldr	r3, .L57
	ldr	r3, [r3, #8]
	and	r3, r3, #12
	cmp	r3, #4
	beq	.L7
	ldr	r3, .L57
	ldr	r3, [r3, #8]
	and	r3, r3, #12
	cmp	r3, #8
	bne	.L8
	ldr	r3, .L57
	ldr	r3, [r3, #4]
	and	r3, r3, #4194304
	cmp	r3, #4194304
	bne	.L8
.L7:
	ldr	r3, .L57
	ldr	r3, [r3]
	and	r3, r3, #131072
	cmp	r3, #0
	beq	.L56
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L56
	movs	r3, #1
	b	.L5
.L8:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #65536
	bne	.L10
	ldr	r3, .L57
	ldr	r3, [r3]
	ldr	r2, .L57
	orr	r3, r3, #65536
	str	r3, [r2]
	b	.L11
.L10:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #327680
	bne	.L12
	ldr	r3, .L57
	ldr	r3, [r3]
	ldr	r2, .L57
	orr	r3, r3, #262144
	str	r3, [r2]
	ldr	r3, .L57
	ldr	r3, [r3]
	ldr	r2, .L57
	orr	r3, r3, #65536
	str	r3, [r2]
	b	.L11
.L12:
	ldr	r3, .L57
	ldr	r3, [r3]
	ldr	r2, .L57
	bic	r3, r3, #65536
	str	r3, [r2]
	ldr	r3, .L57
	ldr	r3, [r3]
	ldr	r2, .L57
	bic	r3, r3, #262144
	str	r3, [r2]
.L11:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L13
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L14
.L15:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #100
	bls	.L14
	movs	r3, #3
	b	.L5
.L14:
	ldr	r3, .L57
	ldr	r3, [r3]
	and	r3, r3, #131072
	cmp	r3, #0
	beq	.L15
	b	.L6
.L13:
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L16
.L17:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #100
	bls	.L16
	movs	r3, #3
	b	.L5
.L16:
	ldr	r3, .L57
	ldr	r3, [r3]
	and	r3, r3, #131072
	cmp	r3, #0
	bne	.L17
	b	.L6
.L56:
	nop
.L6:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L18
	ldr	r3, .L57
	ldr	r3, [r3, #8]
	and	r3, r3, #12
	cmp	r3, #0
	beq	.L19
	ldr	r3, .L57
	ldr	r3, [r3, #8]
	and	r3, r3, #12
	cmp	r3, #8
	bne	.L20
	ldr	r3, .L57
	ldr	r3, [r3, #4]
	and	r3, r3, #4194304
	cmp	r3, #0
	bne	.L20
.L19:
	ldr	r3, .L57
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L21
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L21
	movs	r3, #1
	b	.L5
.L21:
	ldr	r3, .L57
	ldr	r3, [r3]
	bic	r2, r3, #248
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	lsls	r3, r3, #3
	ldr	r1, .L57
	orrs	r3, r3, r2
	str	r3, [r1]
	b	.L18
.L20:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L22
	ldr	r3, .L57+4
	movs	r2, #1
	str	r2, [r3]
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L23
.L24:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L23
	movs	r3, #3
	b	.L5
.L23:
	ldr	r3, .L57
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L24
	ldr	r3, .L57
	ldr	r3, [r3]
	bic	r2, r3, #248
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	lsls	r3, r3, #3
	ldr	r1, .L57
	orrs	r3, r3, r2
	str	r3, [r1]
	b	.L18
.L22:
	ldr	r3, .L57+4
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L25
.L26:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L25
	movs	r3, #3
	b	.L5
.L25:
	ldr	r3, .L57
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L26
.L18:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L27
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L28
	ldr	r3, .L57+8
	movs	r2, #1
	str	r2, [r3]
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L29
.L30:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L29
	movs	r3, #3
	b	.L5
.L29:
	ldr	r3, .L57
	ldr	r3, [r3, #116]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L30
	b	.L27
.L28:
	ldr	r3, .L57+8
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L31
.L32:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L31
	movs	r3, #3
	b	.L5
.L31:
	ldr	r3, .L57
	ldr	r3, [r3, #116]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L32
.L27:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L33
	movs	r3, #0
	strb	r3, [r7, #23]
	ldr	r3, .L57
	ldr	r3, [r3, #64]
	and	r3, r3, #268435456
	cmp	r3, #0
	bne	.L34
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, .L57
	ldr	r3, [r3, #64]
	ldr	r2, .L57
	orr	r3, r3, #268435456
	str	r3, [r2, #64]
	ldr	r3, .L57
	ldr	r3, [r3, #64]
	and	r3, r3, #268435456
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r3, #1
	strb	r3, [r7, #23]
.L34:
	ldr	r3, .L57+12
	ldr	r3, [r3]
	and	r3, r3, #256
	cmp	r3, #0
	bne	.L35
	ldr	r3, .L57+12
	ldr	r3, [r3]
	ldr	r2, .L57+12
	orr	r3, r3, #256
	str	r3, [r2]
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L36
.L58:
	.align	2
.L57:
	.word	1073887232
	.word	1111949312
	.word	1111953024
	.word	1073770496
.L37:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L36
	movs	r3, #3
	b	.L5
.L36:
	ldr	r3, .L59
	ldr	r3, [r3]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L37
.L35:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #1
	bne	.L38
	ldr	r3, .L59+4
	ldr	r3, [r3, #112]
	ldr	r2, .L59+4
	orr	r3, r3, #1
	str	r3, [r2, #112]
	b	.L39
.L38:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #5
	bne	.L40
	ldr	r3, .L59+4
	ldr	r3, [r3, #112]
	ldr	r2, .L59+4
	orr	r3, r3, #4
	str	r3, [r2, #112]
	ldr	r3, .L59+4
	ldr	r3, [r3, #112]
	ldr	r2, .L59+4
	orr	r3, r3, #1
	str	r3, [r2, #112]
	b	.L39
.L40:
	ldr	r3, .L59+4
	ldr	r3, [r3, #112]
	ldr	r2, .L59+4
	bic	r3, r3, #1
	str	r3, [r2, #112]
	ldr	r3, .L59+4
	ldr	r3, [r3, #112]
	ldr	r2, .L59+4
	bic	r3, r3, #4
	str	r3, [r2, #112]
.L39:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L41
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L42
.L43:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	movw	r2, #5000
	cmp	r3, r2
	bls	.L42
	movs	r3, #3
	b	.L5
.L42:
	ldr	r3, .L59+4
	ldr	r3, [r3, #112]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L43
	b	.L44
.L41:
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L45
.L46:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	movw	r2, #5000
	cmp	r3, r2
	bls	.L45
	movs	r3, #3
	b	.L5
.L45:
	ldr	r3, .L59+4
	ldr	r3, [r3, #112]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L46
.L44:
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L33
	ldr	r3, .L59+4
	ldr	r3, [r3, #64]
	ldr	r2, .L59+4
	bic	r3, r3, #268435456
	str	r3, [r2, #64]
.L33:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L47
	ldr	r3, .L59+4
	ldr	r3, [r3, #8]
	and	r3, r3, #12
	cmp	r3, #8
	beq	.L48
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L49
	ldr	r3, .L59+8
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L50
.L51:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L50
	movs	r3, #3
	b	.L5
.L50:
	ldr	r3, .L59+4
	ldr	r3, [r3]
	and	r3, r3, #33554432
	cmp	r3, #0
	bne	.L51
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	lsls	r3, r3, #6
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	lsrs	r3, r3, #1
	subs	r3, r3, #1
	lsls	r3, r3, #16
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	lsls	r3, r3, #24
	ldr	r1, .L59+4
	orrs	r3, r3, r2
	str	r3, [r1, #4]
	ldr	r3, .L59+8
	movs	r2, #1
	str	r2, [r3]
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L52
.L53:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L52
	movs	r3, #3
	b	.L5
.L52:
	ldr	r3, .L59+4
	ldr	r3, [r3]
	and	r3, r3, #33554432
	cmp	r3, #0
	beq	.L53
	b	.L47
.L49:
	ldr	r3, .L59+8
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick @secure
	str	r0, [r7, #16]
	b	.L54
.L55:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L54
	movs	r3, #3
	b	.L5
.L54:
	ldr	r3, .L59+4
	ldr	r3, [r3]
	and	r3, r3, #33554432
	cmp	r3, #0
	bne	.L55
	b	.L47
.L48:
	movs	r3, #1
	b	.L5
.L47:
	movs	r3, #0
.L5:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #15 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
.L60:
	.align	2
.L59:
	.word	1073770496
	.word	1073887232
	.word	1111949408
	.size	HAL_RCC_OscConfig, .-HAL_RCC_OscConfig
	.align	1
	.global	HAL_RCC_ClockConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_ClockConfig, %function
HAL_RCC_ClockConfig:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L62
	movs	r3, #1
	b	.L63
.L62:
	ldr	r3, .L79
	ldr	r3, [r3]
	and	r3, r3, #15
	ldr	r2, [r7]
	cmp	r2, r3
	bls	.L64
	ldr	r3, .L79
	ldr	r2, [r7]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, .L79
	ldr	r3, [r3]
	and	r3, r3, #15
	ldr	r2, [r7]
	cmp	r2, r3
	beq	.L64
	movs	r3, #1
	b	.L63
.L64:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L65
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L66
	ldr	r3, .L79+4
	ldr	r3, [r3, #8]
	ldr	r2, .L79+4
	orr	r3, r3, #7168
	str	r3, [r2, #8]
.L66:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L67
	ldr	r3, .L79+4
	ldr	r3, [r3, #8]
	ldr	r2, .L79+4
	orr	r3, r3, #57344
	str	r3, [r2, #8]
.L67:
	ldr	r3, .L79+4
	ldr	r3, [r3, #8]
	bic	r2, r3, #240
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	ldr	r1, .L79+4
	orrs	r3, r3, r2
	str	r3, [r1, #8]
.L65:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L68
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #1
	bne	.L69
	ldr	r3, .L79+4
	ldr	r3, [r3]
	and	r3, r3, #131072
	cmp	r3, #0
	bne	.L70
	movs	r3, #1
	b	.L63
.L69:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #2
	beq	.L71
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #3
	bne	.L72
.L71:
	ldr	r3, .L79+4
	ldr	r3, [r3]
	and	r3, r3, #33554432
	cmp	r3, #0
	bne	.L70
	movs	r3, #1
	b	.L63
.L72:
	ldr	r3, .L79+4
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L70
	movs	r3, #1
	b	.L63
.L70:
	ldr	r3, .L79+4
	ldr	r3, [r3, #8]
	bic	r2, r3, #3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r1, .L79+4
	orrs	r3, r3, r2
	str	r3, [r1, #8]
	bl	HAL_GetTick @secure
	str	r0, [r7, #12]
	b	.L74
.L75:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	movw	r2, #5000
	cmp	r3, r2
	bls	.L74
	movs	r3, #3
	b	.L63
.L74:
	ldr	r3, .L79+4
	ldr	r3, [r3, #8]
	and	r2, r3, #12
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	cmp	r2, r3
	bne	.L75
.L68:
	ldr	r3, .L79
	ldr	r3, [r3]
	and	r3, r3, #15
	ldr	r2, [r7]
	cmp	r2, r3
	bcs	.L76
	ldr	r3, .L79
	ldr	r2, [r7]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, .L79
	ldr	r3, [r3]
	and	r3, r3, #15
	ldr	r2, [r7]
	cmp	r2, r3
	beq	.L76
	movs	r3, #1
	b	.L63
.L76:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L77
	ldr	r3, .L79+4
	ldr	r3, [r3, #8]
	bic	r2, r3, #7168
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r1, .L79+4
	orrs	r3, r3, r2
	str	r3, [r1, #8]
.L77:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L78
	ldr	r3, .L79+4
	ldr	r3, [r3, #8]
	bic	r2, r3, #57344
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	lsls	r3, r3, #3
	ldr	r1, .L79+4
	orrs	r3, r3, r2
	str	r3, [r1, #8]
.L78:
	bl	HAL_RCC_GetSysClockFreq 
	PUSH {R1, R2}
	MOV R1, #19 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r1, r0
	ldr	r3, .L79+4
	ldr	r3, [r3, #8]
	lsrs	r3, r3, #4
	and	r3, r3, #15
	ldr	r2, .L79+8
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	lsr	r3, r1, r3
	ldr	r2, .L79+12
	str	r3, [r2]
	movs	r0, #0
	PUSH {R1, R2}
	MOV R1, #5 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_InitTick 
	PUSH {R1, R2}
	MOV R1, #5 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	movs	r3, #0
.L63:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #17 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
.L80:
	.align	2
.L79:
	.word	1073888256
	.word	1073887232
	.word	AHBPrescTable
	.word	SystemCoreClock
	.size	HAL_RCC_ClockConfig, .-HAL_RCC_ClockConfig
	.align	1
	.global	HAL_RCC_MCOConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_MCOConfig, %function
HAL_RCC_MCOConfig:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #48
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L82
	movs	r3, #0
	str	r3, [r7, #24]
	ldr	r3, .L85
	ldr	r3, [r3, #48]
	ldr	r2, .L85
	orr	r3, r3, #1
	str	r3, [r2, #48]
	ldr	r3, .L85
	ldr	r3, [r3, #48]
	and	r3, r3, #1
	str	r3, [r7, #24]
	ldr	r3, [r7, #24]
	mov	r3, #256
	str	r3, [r7, #28]
	movs	r3, #2
	str	r3, [r7, #32]
	movs	r3, #3
	str	r3, [r7, #40]
	movs	r3, #0
	str	r3, [r7, #36]
	movs	r3, #0
	str	r3, [r7, #44]
	add	r3, r7, #28
	mov	r1, r3
	ldr	r0, .L85+4
	bl	HAL_GPIO_Init
	ldr	r3, .L85
	ldr	r3, [r3, #8]
	bic	r2, r3, #123731968
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #4]
	orrs	r3, r3, r1
	ldr	r1, .L85
	orrs	r3, r3, r2
	str	r3, [r1, #8]
	b	.L84
.L82:
	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r3, .L85
	ldr	r3, [r3, #48]
	ldr	r2, .L85
	orr	r3, r3, #4
	str	r3, [r2, #48]
	ldr	r3, .L85
	ldr	r3, [r3, #48]
	and	r3, r3, #4
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	mov	r3, #512
	str	r3, [r7, #28]
	movs	r3, #2
	str	r3, [r7, #32]
	movs	r3, #3
	str	r3, [r7, #40]
	movs	r3, #0
	str	r3, [r7, #36]
	movs	r3, #0
	str	r3, [r7, #44]
	add	r3, r7, #28
	mov	r1, r3
	ldr	r0, .L85+8
	bl	HAL_GPIO_Init
	ldr	r3, .L85
	ldr	r3, [r3, #8]
	bic	r2, r3, #-134217728
	ldr	r3, [r7, #4]
	lsls	r1, r3, #3
	ldr	r3, [r7, #8]
	orrs	r3, r3, r1
	ldr	r1, .L85
	orrs	r3, r3, r2
	str	r3, [r1, #8]
.L84:
	nop
	adds	r7, r7, #48
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L86:
	.align	2
.L85:
	.word	1073887232
	.word	1073872896
	.word	1073874944
	.size	HAL_RCC_MCOConfig, .-HAL_RCC_MCOConfig
	.align	1
	.global	HAL_RCC_EnableCSS
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_EnableCSS, %function
HAL_RCC_EnableCSS:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L88
	movs	r2, #1
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L89:
	.align	2
.L88:
	.word	1111949388
	.size	HAL_RCC_EnableCSS, .-HAL_RCC_EnableCSS
	.align	1
	.global	HAL_RCC_DisableCSS
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_DisableCSS, %function
HAL_RCC_DisableCSS:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L91
	movs	r2, #0
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L92:
	.align	2
.L91:
	.word	1111949388
	.size	HAL_RCC_DisableCSS, .-HAL_RCC_DisableCSS
	.global	__aeabi_uldivmod
	.align	1
	.weak	HAL_RCC_GetSysClockFreq
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_GetSysClockFreq, %function
HAL_RCC_GetSysClockFreq:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #20
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, .L103
	ldr	r3, [r3, #8]
	and	r3, r3, #12
	cmp	r3, #4
	beq	.L95
	cmp	r3, #8
	beq	.L96
	cmp	r3, #0
	bne	.L102
	ldr	r3, .L103+4
	str	r3, [r7, #8]
	b	.L98
.L95:
	ldr	r3, .L103+8
	str	r3, [r7, #8]
	b	.L98
.L96:
	ldr	r3, .L103
	ldr	r3, [r3, #4]
	and	r3, r3, #63
	str	r3, [r7, #4]
	ldr	r3, .L103
	ldr	r3, [r3, #4]
	and	r3, r3, #4194304
	cmp	r3, #0
	beq	.L99
	ldr	r3, .L103
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #6
	mov	r4, #0
	movw	r1, #511
	mov	r2, #0
	and	r5, r3, r1
	and	r6, r4, r2
	ldr	r2, .L103+8
	mul	r1, r2, r6
	movs	r2, #0
	mul	r2, r2, r5
	add	r2, r2, r1
	ldr	r1, .L103+8
	umull	r0, r1, r5, r1
	adds	r3, r2, r1
	mov	r1, r3
	ldr	r3, [r7, #4]
	mov	r4, #0
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_uldivmod
	mov	r3, r0
	mov	r4, r1
	str	r3, [r7, #12]
	b	.L100
.L99:
	ldr	r3, .L103
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #6
	mov	r4, #0
	movw	r1, #511
	mov	r2, #0
	and	r5, r3, r1
	and	r6, r4, r2
	mov	r1, r5
	mov	r2, r6
	mov	r3, #0
	mov	r4, #0
	lsls	r4, r2, #5
	orr	r4, r4, r1, lsr #27
	lsls	r3, r1, #5
	mov	r1, r3
	mov	r2, r4
	subs	r1, r1, r5
	sbc	r2, r2, r6
	mov	r3, #0
	mov	r4, #0
	lsls	r4, r2, #6
	orr	r4, r4, r1, lsr #26
	lsls	r3, r1, #6
	subs	r3, r3, r1
	sbc	r4, r4, r2
	mov	r1, #0
	mov	r2, #0
	lsls	r2, r4, #3
	orr	r2, r2, r3, lsr #29
	lsls	r1, r3, #3
	mov	r3, r1
	mov	r4, r2
	adds	r3, r3, r5
	adc	r4, r4, r6
	mov	r1, #0
	mov	r2, #0
	lsls	r2, r4, #10
	orr	r2, r2, r3, lsr #22
	lsls	r1, r3, #10
	mov	r3, r1
	mov	r4, r2
	mov	r0, r3
	mov	r1, r4
	ldr	r3, [r7, #4]
	mov	r4, #0
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_uldivmod
	mov	r3, r0
	mov	r4, r1
	str	r3, [r7, #12]
.L100:
	ldr	r3, .L103
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #16
	and	r3, r3, #3
	adds	r3, r3, #1
	lsls	r3, r3, #1
	str	r3, [r7]
	ldr	r2, [r7, #12]
	ldr	r3, [r7]
	udiv	r3, r2, r3
	str	r3, [r7, #8]
	b	.L98
.L102:
	ldr	r3, .L103+4
	str	r3, [r7, #8]
	nop
.L98:
	ldr	r3, [r7, #8]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #18 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r4, r5, r6, r7, pc}
.L104:
	.align	2
.L103:
	.word	1073887232
	.word	16000000
	.word	25000000
	.size	HAL_RCC_GetSysClockFreq, .-HAL_RCC_GetSysClockFreq
	.align	1
	.global	HAL_RCC_GetHCLKFreq
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_GetHCLKFreq, %function
HAL_RCC_GetHCLKFreq:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L107
	ldr	r3, [r3]
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L108:
	.align	2
.L107:
	.word	SystemCoreClock
	.size	HAL_RCC_GetHCLKFreq, .-HAL_RCC_GetHCLKFreq
	.align	1
	.global	HAL_RCC_GetPCLK1Freq
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_GetPCLK1Freq, %function
HAL_RCC_GetPCLK1Freq:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	bl	HAL_RCC_GetHCLKFreq @secure
	mov	r1, r0
	ldr	r3, .L111
	ldr	r3, [r3, #8]
	lsrs	r3, r3, #10
	and	r3, r3, #7
	ldr	r2, .L111+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	lsr	r3, r1, r3
	mov	r0, r3
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #28 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #6]
	POP {R1, R2}
	pop	{r7, pc}
.L112:
	.align	2
.L111:
	.word	1073887232
	.word	APBPrescTable
	.size	HAL_RCC_GetPCLK1Freq, .-HAL_RCC_GetPCLK1Freq
	.align	1
	.global	HAL_RCC_GetPCLK2Freq
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_GetPCLK2Freq, %function
HAL_RCC_GetPCLK2Freq:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	bl	HAL_RCC_GetHCLKFreq @secure
	mov	r1, r0
	ldr	r3, .L115
	ldr	r3, [r3, #8]
	lsrs	r3, r3, #13
	and	r3, r3, #7
	ldr	r2, .L115+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	lsr	r3, r1, r3
	mov	r0, r3
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #25 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #6]
	POP {R1, R2}
	pop	{r7, pc}
.L116:
	.align	2
.L115:
	.word	1073887232
	.word	APBPrescTable
	.size	HAL_RCC_GetPCLK2Freq, .-HAL_RCC_GetPCLK2Freq
	.align	1
	.weak	HAL_RCC_GetOscConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_GetOscConfig, %function
HAL_RCC_GetOscConfig:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #15
	str	r2, [r3]
	ldr	r3, .L130
	ldr	r3, [r3]
	and	r3, r3, #262144
	cmp	r3, #262144
	bne	.L118
	ldr	r3, [r7, #4]
	mov	r2, #327680
	str	r2, [r3, #4]
	b	.L119
.L118:
	ldr	r3, .L130
	ldr	r3, [r3]
	and	r3, r3, #65536
	cmp	r3, #65536
	bne	.L120
	ldr	r3, [r7, #4]
	mov	r2, #65536
	str	r2, [r3, #4]
	b	.L119
.L120:
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #4]
.L119:
	ldr	r3, .L130
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #1
	bne	.L121
	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3, #12]
	b	.L122
.L121:
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #12]
.L122:
	ldr	r3, .L130
	ldr	r3, [r3]
	lsrs	r3, r3, #3
	and	r2, r3, #31
	ldr	r3, [r7, #4]
	str	r2, [r3, #16]
	ldr	r3, .L130
	ldr	r3, [r3, #112]
	and	r3, r3, #4
	cmp	r3, #4
	bne	.L123
	ldr	r3, [r7, #4]
	movs	r2, #5
	str	r2, [r3, #8]
	b	.L124
.L123:
	ldr	r3, .L130
	ldr	r3, [r3, #112]
	and	r3, r3, #1
	cmp	r3, #1
	bne	.L125
	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3, #8]
	b	.L124
.L125:
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
.L124:
	ldr	r3, .L130
	ldr	r3, [r3, #116]
	and	r3, r3, #1
	cmp	r3, #1
	bne	.L126
	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3, #20]
	b	.L127
.L126:
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #20]
.L127:
	ldr	r3, .L130
	ldr	r3, [r3]
	and	r3, r3, #16777216
	cmp	r3, #16777216
	bne	.L128
	ldr	r3, [r7, #4]
	movs	r2, #2
	str	r2, [r3, #24]
	b	.L129
.L128:
	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3, #24]
.L129:
	ldr	r3, .L130
	ldr	r3, [r3, #4]
	and	r2, r3, #4194304
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	ldr	r3, .L130
	ldr	r3, [r3, #4]
	and	r2, r3, #63
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	ldr	r3, .L130
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #6
	ubfx	r2, r3, #0, #9
	ldr	r3, [r7, #4]
	str	r2, [r3, #36]
	ldr	r3, .L130
	ldr	r3, [r3, #4]
	and	r3, r3, #196608
	add	r3, r3, #65536
	lsls	r3, r3, #1
	lsrs	r2, r3, #16
	ldr	r3, [r7, #4]
	str	r2, [r3, #40]
	ldr	r3, .L130
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #24
	and	r2, r3, #15
	ldr	r3, [r7, #4]
	str	r2, [r3, #44]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L131:
	.align	2
.L130:
	.word	1073887232
	.size	HAL_RCC_GetOscConfig, .-HAL_RCC_GetOscConfig
	.align	1
	.global	HAL_RCC_GetClockConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_GetClockConfig, %function
HAL_RCC_GetClockConfig:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	movs	r2, #15
	str	r2, [r3]
	ldr	r3, .L133
	ldr	r3, [r3, #8]
	and	r2, r3, #3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	ldr	r3, .L133
	ldr	r3, [r3, #8]
	and	r2, r3, #240
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	ldr	r3, .L133
	ldr	r3, [r3, #8]
	and	r2, r3, #7168
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	ldr	r3, .L133
	ldr	r3, [r3, #8]
	lsrs	r3, r3, #3
	and	r2, r3, #7168
	ldr	r3, [r7, #4]
	str	r2, [r3, #16]
	ldr	r3, .L133+4
	ldr	r3, [r3]
	and	r2, r3, #15
	ldr	r3, [r7]
	str	r2, [r3]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L134:
	.align	2
.L133:
	.word	1073887232
	.word	1073888256
	.size	HAL_RCC_GetClockConfig, .-HAL_RCC_GetClockConfig
	.align	1
	.global	HAL_RCC_NMI_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_NMI_IRQHandler, %function
HAL_RCC_NMI_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L138
	ldr	r3, [r3, #12]
	and	r3, r3, #128
	cmp	r3, #128
	bne	.L137
	bl	HAL_RCC_CSSCallback
	ldr	r3, .L138+4
	movs	r2, #128
	strb	r2, [r3]
.L137:
	nop
	pop	{r7, pc}
.L139:
	.align	2
.L138:
	.word	1073887232
	.word	1073887246
	.size	HAL_RCC_NMI_IRQHandler, .-HAL_RCC_NMI_IRQHandler
	.align	1
	.weak	HAL_RCC_CSSCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_CSSCallback, %function
HAL_RCC_CSSCallback:
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
	.size	HAL_RCC_CSSCallback, .-HAL_RCC_CSSCallback
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
