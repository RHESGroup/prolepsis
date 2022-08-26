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
	.file	"stm32f4xx_hal_dma.c"
	.text
	.align	1
	.global	HAL_DMA_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_Init, %function
HAL_DMA_Init:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #20]
	bl	HAL_GetTick
	str	r0, [r7, #16]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L2
	movs	r3, #1
	b	.L3
.L2:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #52]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #53]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
	b	.L4
.L5:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #5
	bls	.L4
	ldr	r3, [r7, #4]
	movs	r2, #32
	str	r2, [r3, #84]
	ldr	r3, [r7, #4]
	movs	r2, #3
	strb	r2, [r3, #53]
	movs	r3, #3
	b	.L3
.L4:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L5
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	str	r3, [r7, #20]
	ldr	r2, [r7, #20]
	ldr	r3, .L8
	ands	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	orrs	r3, r3, r2
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	cmp	r3, #4
	bne	.L6
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #44]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	orrs	r3, r3, r2
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
.L6:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	cmp	r3, #4
	bne	.L7
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L7
	ldr	r0, [r7, #4]
	bl	DMA_CheckFifoParam
	mov	r3, r0
	cmp	r3, #0
	beq	.L7
	ldr	r3, [r7, #4]
	movs	r2, #64
	str	r2, [r3, #84]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #53]
	movs	r3, #1
	b	.L3
.L7:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	str	r2, [r3, #20]
	ldr	r0, [r7, #4]
	bl	DMA_CalcBaseAndBitshift
	mov	r3, r0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #63
	lsls	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #84]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #53]
	movs	r3, #0
.L3:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	-267354049
	.size	HAL_DMA_Init, .-HAL_DMA_Init
	.align	1
	.global	HAL_DMA_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_DeInit, %function
HAL_DMA_DeInit:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L11
	movs	r3, #1
	b	.L12
.L11:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	cmp	r3, #2
	bne	.L13
	movs	r3, #2
	b	.L12
.L13:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #33
	str	r2, [r3, #20]
	ldr	r0, [r7, #4]
	bl	DMA_CalcBaseAndBitshift
	mov	r3, r0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #64]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #68]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #72]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #76]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #80]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #63
	lsls	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #84]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #53]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #52]
	movs	r3, #0
.L12:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_DMA_DeInit, .-HAL_DMA_DeInit
	.align	1
	.global	HAL_DMA_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_Start, %function
HAL_DMA_Start:
	@ args = 0, pretend = 0, frame = 24
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
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L15
	movs	r3, #2
	b	.L16
.L15:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #52]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L17
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #53]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #84]
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	DMA_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	b	.L18
.L17:
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #52]
	movs	r3, #2
	strb	r3, [r7, #23]
.L18:
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
.L16:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_DMA_Start, .-HAL_DMA_Start
	.align	1
	.global	HAL_DMA_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_Start_IT, %function
HAL_DMA_Start_IT:
	@ args = 0, pretend = 0, frame = 24
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
	ldr	r3, [r3, #88]
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L20
	movs	r3, #2
	b	.L21
.L20:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #52]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L22
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #53]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #84]
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	DMA_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #63
	lsls	r2, r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
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
	beq	.L23
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3]
.L23:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	b	.L24
.L22:
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #52]
	movs	r3, #2
	strb	r3, [r7, #23]
.L24:
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
.L21:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_DMA_Start_IT, .-HAL_DMA_Start_IT
	.align	1
	.global	HAL_DMA_Abort
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_Abort, %function
HAL_DMA_Abort:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #88]
	str	r3, [r7, #12]
	bl	HAL_GetTick
	str	r0, [r7, #8]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	cmp	r3, #2
	beq	.L26
	ldr	r3, [r7, #4]
	movs	r2, #128
	str	r2, [r3, #84]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #52]
	movs	r3, #1
	b	.L27
.L26:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #22
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]
	cmp	r3, #0
	bne	.L28
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #72]
	cmp	r3, #0
	beq	.L29
.L28:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3]
.L29:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
	b	.L30
.L31:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #8]
	subs	r3, r2, r3
	cmp	r3, #5
	bls	.L30
	ldr	r3, [r7, #4]
	movs	r2, #32
	str	r2, [r3, #84]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #52]
	ldr	r3, [r7, #4]
	movs	r2, #3
	strb	r2, [r3, #53]
	movs	r3, #3
	b	.L27
.L30:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L31
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #63
	lsls	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #52]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #53]
	movs	r3, #0
.L27:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_DMA_Abort, .-HAL_DMA_Abort
	.align	1
	.global	HAL_DMA_Abort_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_Abort_IT, %function
HAL_DMA_Abort_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	cmp	r3, #2
	beq	.L33
	ldr	r3, [r7, #4]
	movs	r2, #128
	str	r2, [r3, #84]
	movs	r3, #1
	b	.L34
.L33:
	ldr	r3, [r7, #4]
	movs	r2, #5
	strb	r2, [r3, #53]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
	movs	r3, #0
.L34:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_DMA_Abort_IT, .-HAL_DMA_Abort_IT
	.align	1
	.global	HAL_DMA_PollForTransfer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_PollForTransfer, %function
HAL_DMA_PollForTransfer:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #40
	add	r7, sp, #0
	str	r0, [r7, #12]
	mov	r3, r1
	str	r2, [r7, #4]
	strb	r3, [r7, #11]
	movs	r3, #0
	strb	r3, [r7, #31]
	bl	HAL_GetTick
	str	r0, [r7, #24]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	cmp	r3, #2
	beq	.L36
	ldr	r3, [r7, #12]
	movs	r2, #128
	str	r2, [r3, #84]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #52]
	movs	r3, #1
	b	.L37
.L36:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L38
	ldr	r3, [r7, #12]
	mov	r2, #256
	str	r2, [r3, #84]
	movs	r3, #1
	b	.L37
.L38:
	ldrb	r3, [r7, #11]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L39
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #32
	lsl	r3, r2, r3
	str	r3, [r7, #36]
	b	.L40
.L39:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #16
	lsl	r3, r2, r3
	str	r3, [r7, #36]
.L40:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #88]
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	ldr	r3, [r3]
	str	r3, [r7, #32]
	b	.L41
.L47:
	ldr	r3, [r7, #4]
	cmp	r3, #-1
	beq	.L42
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L43
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #24]
	subs	r3, r2, r3
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bcs	.L42
.L43:
	ldr	r3, [r7, #12]
	movs	r2, #32
	str	r2, [r3, #84]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #52]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #53]
	movs	r3, #3
	b	.L37
.L42:
	ldr	r3, [r7, #20]
	ldr	r3, [r3]
	str	r3, [r7, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #8
	lsls	r2, r2, r3
	ldr	r3, [r7, #32]
	ands	r3, r3, r2
	cmp	r3, #0
	beq	.L44
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]
	orr	r2, r3, #1
	ldr	r3, [r7, #12]
	str	r2, [r3, #84]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #8
	lsls	r2, r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
.L44:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #1
	lsls	r2, r2, r3
	ldr	r3, [r7, #32]
	ands	r3, r3, r2
	cmp	r3, #0
	beq	.L45
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]
	orr	r2, r3, #2
	ldr	r3, [r7, #12]
	str	r2, [r3, #84]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #1
	lsls	r2, r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
.L45:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #4
	lsls	r2, r2, r3
	ldr	r3, [r7, #32]
	ands	r3, r3, r2
	cmp	r3, #0
	beq	.L41
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]
	orr	r2, r3, #4
	ldr	r3, [r7, #12]
	str	r2, [r3, #84]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #4
	lsls	r2, r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
.L41:
	ldr	r2, [r7, #32]
	ldr	r3, [r7, #36]
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L46
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L47
.L46:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]
	cmp	r3, #0
	beq	.L48
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L48
	ldr	r0, [r7, #12]
	bl	HAL_DMA_Abort
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #48
	lsls	r2, r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #52]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #53]
	movs	r3, #1
	b	.L37
.L48:
	ldrb	r3, [r7, #11]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L49
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #48
	lsls	r2, r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #52]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #53]
	b	.L50
.L49:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]
	movs	r2, #16
	lsls	r2, r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
.L50:
	ldrb	r3, [r7, #31]	@ zero_extendqisi2
.L37:
	mov	r0, r3
	adds	r7, r7, #40
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_DMA_PollForTransfer, .-HAL_DMA_PollForTransfer
	.align	1
	.global	HAL_DMA_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_IRQHandler, %function
HAL_DMA_IRQHandler:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, .L78
	ldr	r3, [r3]
	ldr	r2, .L78+4
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #10
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #88]
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	ldr	r3, [r3]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #8
	lsls	r2, r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r3, r2
	cmp	r3, #0
	beq	.L52
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L52
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #8
	lsls	r2, r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]
	orr	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #84]
.L52:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #1
	lsls	r2, r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r3, r2
	cmp	r3, #0
	beq	.L53
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #128
	cmp	r3, #0
	beq	.L53
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #1
	lsls	r2, r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]
	orr	r2, r3, #2
	ldr	r3, [r7, #4]
	str	r2, [r3, #84]
.L53:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #4
	lsls	r2, r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r3, r2
	cmp	r3, #0
	beq	.L54
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L54
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #4
	lsls	r2, r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]
	orr	r2, r3, #4
	ldr	r3, [r7, #4]
	str	r2, [r3, #84]
.L54:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #16
	lsls	r2, r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r3, r2
	cmp	r3, #0
	beq	.L55
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L55
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #16
	lsls	r2, r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #262144
	cmp	r3, #0
	beq	.L56
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #524288
	cmp	r3, #0
	bne	.L57
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]
	cmp	r3, #0
	beq	.L55
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]
	ldr	r0, [r7, #4]
	blx	r3
	b	.L55
.L57:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #72]
	cmp	r3, #0
	beq	.L55
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #72]
	ldr	r0, [r7, #4]
	blx	r3
	b	.L55
.L56:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #256
	cmp	r3, #0
	bne	.L60
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3]
.L60:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]
	cmp	r3, #0
	beq	.L55
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]
	ldr	r0, [r7, #4]
	blx	r3
.L55:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #32
	lsls	r2, r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r3, r2
	cmp	r3, #0
	beq	.L61
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #16
	cmp	r3, #0
	beq	.L61
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #32
	lsls	r2, r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	cmp	r3, #5
	bne	.L62
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #22
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]
	cmp	r3, #0
	bne	.L63
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #72]
	cmp	r3, #0
	beq	.L64
.L63:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3]
.L64:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]
	movs	r2, #63
	lsls	r2, r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #52]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #53]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #80]
	cmp	r3, #0
	beq	.L76
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #80]
	ldr	r0, [r7, #4]
	blx	r3
	b	.L76
.L62:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #262144
	cmp	r3, #0
	beq	.L67
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #524288
	cmp	r3, #0
	bne	.L68
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #68]
	cmp	r3, #0
	beq	.L61
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #68]
	ldr	r0, [r7, #4]
	blx	r3
	b	.L61
.L68:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	cmp	r3, #0
	beq	.L61
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	ldr	r0, [r7, #4]
	blx	r3
	b	.L61
.L79:
	.align	2
.L78:
	.word	SystemCoreClock
	.word	458129845
.L67:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #256
	cmp	r3, #0
	bne	.L71
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #16
	str	r2, [r3]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #52]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #53]
.L71:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	cmp	r3, #0
	beq	.L61
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	ldr	r0, [r7, #4]
	blx	r3
.L61:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]
	cmp	r3, #0
	beq	.L51
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L72
	ldr	r3, [r7, #4]
	movs	r2, #5
	strb	r2, [r3, #53]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L75:
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
	ldr	r2, [r7, #20]
	cmp	r2, r3
	bcc	.L77
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L75
	b	.L74
.L77:
	nop
.L74:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #52]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #53]
.L72:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #76]
	cmp	r3, #0
	beq	.L51
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #76]
	ldr	r0, [r7, #4]
	blx	r3
	b	.L51
.L76:
	nop
.L51:
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_DMA_IRQHandler, .-HAL_DMA_IRQHandler
	.align	1
	.global	HAL_DMA_RegisterCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_RegisterCallback, %function
HAL_DMA_RegisterCallback:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	mov	r3, r1
	str	r2, [r7, #4]
	strb	r3, [r7, #11]
	movs	r3, #0
	strb	r3, [r7, #23]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L81
	movs	r3, #2
	b	.L82
.L81:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #52]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L83
	ldrb	r3, [r7, #11]	@ zero_extendqisi2
	cmp	r3, #5
	bhi	.L94
	adr	r2, .L86
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L86:
	.word	.L85+1
	.word	.L87+1
	.word	.L88+1
	.word	.L89+1
	.word	.L90+1
	.word	.L91+1
	.p2align 1
.L85:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #60]
	b	.L93
.L87:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #64]
	b	.L93
.L88:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #68]
	b	.L93
.L89:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #72]
	b	.L93
.L90:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #76]
	b	.L93
.L91:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #80]
	b	.L93
.L83:
	movs	r3, #1
	strb	r3, [r7, #23]
	b	.L93
.L94:
	nop
.L93:
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #52]
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
.L82:
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_DMA_RegisterCallback, .-HAL_DMA_RegisterCallback
	.align	1
	.global	HAL_DMA_UnRegisterCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_UnRegisterCallback, %function
HAL_DMA_UnRegisterCallback:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strb	r3, [r7, #3]
	movs	r3, #0
	strb	r3, [r7, #15]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L96
	movs	r3, #2
	b	.L97
.L96:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #52]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L98
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #6
	bhi	.L99
	adr	r2, .L101
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L101:
	.word	.L100+1
	.word	.L102+1
	.word	.L103+1
	.word	.L104+1
	.word	.L105+1
	.word	.L106+1
	.word	.L107+1
	.p2align 1
.L100:
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]
	b	.L109
.L102:
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #64]
	b	.L109
.L103:
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #68]
	b	.L109
.L104:
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #72]
	b	.L109
.L105:
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #76]
	b	.L109
.L106:
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #80]
	b	.L109
.L107:
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #64]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #68]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #72]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #76]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #80]
	b	.L109
.L99:
	movs	r3, #1
	strb	r3, [r7, #15]
	nop
	b	.L109
.L98:
	movs	r3, #1
	strb	r3, [r7, #15]
.L109:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #52]
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
.L97:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_DMA_UnRegisterCallback, .-HAL_DMA_UnRegisterCallback
	.align	1
	.global	HAL_DMA_GetState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_GetState, %function
HAL_DMA_GetState:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #53]
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_DMA_GetState, .-HAL_DMA_GetState
	.align	1
	.global	HAL_DMA_GetError
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DMA_GetError, %function
HAL_DMA_GetError:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_DMA_GetError, .-HAL_DMA_GetError
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DMA_SetConfig, %function
DMA_SetConfig:
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
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #262144
	str	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7]
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	cmp	r3, #64
	bne	.L115
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	str	r2, [r3, #12]
	b	.L117
.L115:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	str	r2, [r3, #12]
.L117:
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	DMA_SetConfig, .-DMA_SetConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DMA_CalcBaseAndBitshift, %function
DMA_CalcBaseAndBitshift:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	uxtb	r3, r3
	subs	r3, r3, #16
	ldr	r2, .L122
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #4
	str	r3, [r7, #12]
	ldr	r2, .L122+4
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #92]
	ldr	r3, [r7, #12]
	cmp	r3, #3
	bls	.L119
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r3, r3, #1020
	bic	r3, r3, #3
	adds	r2, r3, #4
	ldr	r3, [r7, #4]
	str	r2, [r3, #88]
	b	.L120
.L119:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r3, r3, #1020
	bic	r3, r3, #3
	ldr	r2, [r7, #4]
	str	r3, [r2, #88]
.L120:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #88]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L123:
	.align	2
.L122:
	.word	-1431655765
	.word	flagBitshiftOffset.8255
	.size	DMA_CalcBaseAndBitshift, .-DMA_CalcBaseAndBitshift
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DMA_CheckFifoParam, %function
DMA_CheckFifoParam:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	strb	r3, [r7, #15]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L125
	ldr	r3, [r7, #8]
	cmp	r3, #3
	bhi	.L149
	adr	r2, .L128
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L128:
	.word	.L127+1
	.word	.L129+1
	.word	.L127+1
	.word	.L149+1
	.p2align 1
.L127:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	and	r3, r3, #16777216
	cmp	r3, #0
	beq	.L150
	movs	r3, #1
	strb	r3, [r7, #15]
	b	.L150
.L129:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	cmp	r3, #25165824
	bne	.L151
	movs	r3, #1
	strb	r3, [r7, #15]
	b	.L151
.L125:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	cmp	r3, #8192
	bne	.L135
	ldr	r3, [r7, #8]
	cmp	r3, #3
	bhi	.L152
	adr	r2, .L138
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L138:
	.word	.L137+1
	.word	.L139+1
	.word	.L137+1
	.word	.L140+1
	.p2align 1
.L137:
	movs	r3, #1
	strb	r3, [r7, #15]
	b	.L134
.L139:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	and	r3, r3, #16777216
	cmp	r3, #0
	beq	.L153
	movs	r3, #1
	strb	r3, [r7, #15]
	b	.L153
.L140:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	cmp	r3, #25165824
	bne	.L154
	movs	r3, #1
	strb	r3, [r7, #15]
	b	.L154
.L135:
	ldr	r3, [r7, #8]
	cmp	r3, #2
	bls	.L145
	cmp	r3, #3
	beq	.L146
	b	.L134
.L145:
	movs	r3, #1
	strb	r3, [r7, #15]
	b	.L134
.L146:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	and	r3, r3, #16777216
	cmp	r3, #0
	beq	.L155
	movs	r3, #1
	strb	r3, [r7, #15]
	b	.L155
.L149:
	nop
	b	.L134
.L150:
	nop
	b	.L134
.L151:
	nop
	b	.L134
.L152:
	nop
	b	.L134
.L153:
	nop
	b	.L134
.L154:
	nop
	b	.L134
.L155:
	nop
.L134:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	DMA_CheckFifoParam, .-DMA_CheckFifoParam
	.section	.rodata.flagBitshiftOffset.8255,"a",%progbits
	.align	2
	.type	flagBitshiftOffset.8255, %object
	.size	flagBitshiftOffset.8255, 8
flagBitshiftOffset.8255:
	.byte	0
	.byte	6
	.byte	16
	.byte	22
	.byte	0
	.byte	6
	.byte	16
	.byte	22
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
