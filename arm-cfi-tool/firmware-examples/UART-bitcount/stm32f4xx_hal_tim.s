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
	.file	"stm32f4xx_hal_tim.c"
	.text
	.align	1
	.global	HAL_TIM_Base_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_Init, %function
HAL_TIM_Base_Init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L2
	movs	r3, #1
	b	.L3
.L2:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	ldr	r0, [r7, #4]
	bl	HAL_TIM_Base_MspInit @secure
.L4:
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	adds	r3, r3, #4
	mov	r1, r3
	mov	r0, r2
	bl	TIM_Base_SetConfig @secure
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
.L3:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #31 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
	.size	HAL_TIM_Base_Init, .-HAL_TIM_Base_Init
	.align	1
	.global	HAL_TIM_Base_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_DeInit, %function
HAL_TIM_Base_DeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L6
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L6
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L6:
	ldr	r0, [r7, #4]
	bl	HAL_TIM_Base_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_Base_DeInit, .-HAL_TIM_Base_DeInit
	.align	1
	.weak	HAL_TIM_Base_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_MspInit, %function
HAL_TIM_Base_MspInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_Base_MspInit, .-HAL_TIM_Base_MspInit
	.align	1
	.weak	HAL_TIM_Base_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_MspDeInit, %function
HAL_TIM_Base_MspDeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_Base_MspDeInit, .-HAL_TIM_Base_MspDeInit
	.align	1
	.global	HAL_TIM_Base_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_Start, %function
HAL_TIM_Base_Start:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L11
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L11:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_Base_Start, .-HAL_TIM_Base_Start
	.align	1
	.global	HAL_TIM_Base_Stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_Stop, %function
HAL_TIM_Base_Stop:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L14
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L14
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L14:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_Base_Stop, .-HAL_TIM_Base_Stop
	.align	1
	.global	HAL_TIM_Base_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_Start_IT, %function
HAL_TIM_Base_Start_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L17
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L17:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_Base_Start_IT, .-HAL_TIM_Base_Start_IT
	.align	1
	.global	HAL_TIM_Base_Stop_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_Stop_IT, %function
HAL_TIM_Base_Stop_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L20
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L20
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L20:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_Base_Stop_IT, .-HAL_TIM_Base_Stop_IT
	.align	1
	.global	HAL_TIM_Base_Start_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_Start_DMA, %function
HAL_TIM_Base_Start_DMA:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #2
	bne	.L23
	movs	r3, #2
	b	.L24
.L23:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L25
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	.L26
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	beq	.L26
	movs	r3, #1
	b	.L24
.L26:
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
.L25:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, .L29
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, .L29+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, .L29+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #32]
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #44
	mov	r2, r3
	ldrh	r3, [r7, #6]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L27
	movs	r3, #1
	b	.L24
.L27:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq	.L28
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L28:
	movs	r3, #0
.L24:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L30:
	.align	2
.L29:
	.word	TIM_DMAPeriodElapsedCplt
	.word	TIM_DMAPeriodElapsedHalfCplt
	.word	TIM_DMAError
	.size	HAL_TIM_Base_Start_DMA, .-HAL_TIM_Base_Start_DMA
	.align	1
	.global	HAL_TIM_Base_Stop_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_Stop_DMA, %function
HAL_TIM_Base_Stop_DMA:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #256
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L32
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L32
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L32:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_Base_Stop_DMA, .-HAL_TIM_Base_Stop_DMA
	.align	1
	.global	HAL_TIM_OC_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_Init, %function
HAL_TIM_OC_Init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L35
	movs	r3, #1
	b	.L36
.L35:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L37
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	ldr	r0, [r7, #4]
	bl	HAL_TIM_OC_MspInit
.L37:
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	adds	r3, r3, #4
	mov	r1, r3
	mov	r0, r2
	bl	TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
.L36:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_OC_Init, .-HAL_TIM_OC_Init
	.align	1
	.global	HAL_TIM_OC_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_DeInit, %function
HAL_TIM_OC_DeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L39
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L39
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L39:
	ldr	r0, [r7, #4]
	bl	HAL_TIM_OC_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_OC_DeInit, .-HAL_TIM_OC_DeInit
	.align	1
	.weak	HAL_TIM_OC_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_MspInit, %function
HAL_TIM_OC_MspInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_OC_MspInit, .-HAL_TIM_OC_MspInit
	.align	1
	.weak	HAL_TIM_OC_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_MspDeInit, %function
HAL_TIM_OC_MspDeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_OC_MspDeInit, .-HAL_TIM_OC_MspDeInit
	.align	1
	.global	HAL_TIM_OC_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_Start, %function
HAL_TIM_OC_Start:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L50
	cmp	r3, r2
	beq	.L44
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L50+4
	cmp	r3, r2
	bne	.L45
.L44:
	movs	r3, #1
	b	.L46
.L45:
	movs	r3, #0
.L46:
	cmp	r3, #0
	beq	.L47
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
.L47:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L48
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L48:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L51:
	.align	2
.L50:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_OC_Start, .-HAL_TIM_OC_Start
	.align	1
	.global	HAL_TIM_OC_Stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_Stop, %function
HAL_TIM_OC_Stop:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L59
	cmp	r3, r2
	beq	.L53
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L59+4
	cmp	r3, r2
	bne	.L54
.L53:
	movs	r3, #1
	b	.L55
.L54:
	movs	r3, #0
.L55:
	cmp	r3, #0
	beq	.L56
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L56
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L56
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L56:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L57
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L57
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L57:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L60:
	.align	2
.L59:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_OC_Stop, .-HAL_TIM_OC_Stop
	.align	1
	.global	HAL_TIM_OC_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_Start_IT, %function
HAL_TIM_OC_Start_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #12
	bhi	.L75
	adr	r2, .L64
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L64:
	.word	.L63+1
	.word	.L75+1
	.word	.L75+1
	.word	.L75+1
	.word	.L65+1
	.word	.L75+1
	.word	.L75+1
	.word	.L75+1
	.word	.L66+1
	.word	.L75+1
	.word	.L75+1
	.word	.L75+1
	.word	.L67+1
	.p2align 1
.L63:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #12]
	b	.L68
.L65:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #12]
	b	.L68
.L66:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3, #12]
	b	.L68
.L67:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #16
	str	r2, [r3, #12]
	b	.L68
.L75:
	nop
.L68:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L76
	cmp	r3, r2
	beq	.L69
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L76+4
	cmp	r3, r2
	bne	.L70
.L69:
	movs	r3, #1
	b	.L71
.L70:
	movs	r3, #0
.L71:
	cmp	r3, #0
	beq	.L72
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
.L72:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L73
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L73:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L77:
	.align	2
.L76:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_OC_Start_IT, .-HAL_TIM_OC_Start_IT
	.align	1
	.global	HAL_TIM_OC_Stop_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_Stop_IT, %function
HAL_TIM_OC_Stop_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #12
	bhi	.L92
	adr	r2, .L81
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L81:
	.word	.L80+1
	.word	.L92+1
	.word	.L92+1
	.word	.L92+1
	.word	.L82+1
	.word	.L92+1
	.word	.L92+1
	.word	.L92+1
	.word	.L83+1
	.word	.L92+1
	.word	.L92+1
	.word	.L92+1
	.word	.L84+1
	.p2align 1
.L80:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3, #12]
	b	.L85
.L82:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #12]
	b	.L85
.L83:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3, #12]
	b	.L85
.L84:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #16
	str	r2, [r3, #12]
	b	.L85
.L92:
	nop
.L85:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L93
	cmp	r3, r2
	beq	.L86
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L93+4
	cmp	r3, r2
	bne	.L87
.L86:
	movs	r3, #1
	b	.L88
.L87:
	movs	r3, #0
.L88:
	cmp	r3, #0
	beq	.L89
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L89
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L89
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L89:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L90
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L90
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L90:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L94:
	.align	2
.L93:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_OC_Stop_IT, .-HAL_TIM_OC_Stop_IT
	.align	1
	.global	HAL_TIM_OC_Start_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_Start_DMA, %function
HAL_TIM_OC_Start_DMA:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strh	r3, [r7, #2]	@ movhi
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #2
	bne	.L96
	movs	r3, #2
	b	.L97
.L96:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L98
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L99
	ldrh	r3, [r7, #2]
	cmp	r3, #0
	beq	.L99
	movs	r3, #1
	b	.L97
.L99:
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
.L98:
	ldr	r3, [r7, #8]
	cmp	r3, #12
	bhi	.L116
	adr	r2, .L102
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L102:
	.word	.L101+1
	.word	.L116+1
	.word	.L116+1
	.word	.L116+1
	.word	.L103+1
	.word	.L116+1
	.word	.L116+1
	.word	.L116+1
	.word	.L104+1
	.word	.L116+1
	.word	.L116+1
	.word	.L116+1
	.word	.L105+1
	.p2align 1
.L101:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L117
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L117+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L117+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #52
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L106
	movs	r3, #1
	b	.L97
.L106:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3, #12]
	b	.L107
.L103:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L117
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L117+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L117+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #56
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L108
	movs	r3, #1
	b	.L97
.L108:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3, #12]
	b	.L107
.L104:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L117
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L117+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L117+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #60
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L109
	movs	r3, #1
	b	.L97
.L109:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3, #12]
	b	.L107
.L105:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L117
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L117+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L117+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #64
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L110
	movs	r3, #1
	b	.L97
.L110:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #4096
	str	r2, [r3, #12]
	b	.L107
.L116:
	nop
.L107:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r2, #1
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L117+12
	cmp	r3, r2
	beq	.L111
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L117+16
	cmp	r3, r2
	bne	.L112
.L111:
	movs	r3, #1
	b	.L113
.L112:
	movs	r3, #0
.L113:
	cmp	r3, #0
	beq	.L114
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
.L114:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq	.L115
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L115:
	movs	r3, #0
.L97:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L118:
	.align	2
.L117:
	.word	TIM_DMADelayPulseCplt
	.word	TIM_DMADelayPulseHalfCplt
	.word	TIM_DMAError
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_OC_Start_DMA, .-HAL_TIM_OC_Start_DMA
	.align	1
	.global	HAL_TIM_OC_Stop_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_Stop_DMA, %function
HAL_TIM_OC_Stop_DMA:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #12
	bhi	.L133
	adr	r2, .L122
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L122:
	.word	.L121+1
	.word	.L133+1
	.word	.L133+1
	.word	.L133+1
	.word	.L123+1
	.word	.L133+1
	.word	.L133+1
	.word	.L133+1
	.word	.L124+1
	.word	.L133+1
	.word	.L133+1
	.word	.L133+1
	.word	.L125+1
	.p2align 1
.L121:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #512
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L126
.L123:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1024
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L126
.L124:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2048
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L126
.L125:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4096
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L126
.L133:
	nop
.L126:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L134
	cmp	r3, r2
	beq	.L127
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L134+4
	cmp	r3, r2
	bne	.L128
.L127:
	movs	r3, #1
	b	.L129
.L128:
	movs	r3, #0
.L129:
	cmp	r3, #0
	beq	.L130
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L130
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L130
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L130:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L131
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L131
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L131:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L135:
	.align	2
.L134:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_OC_Stop_DMA, .-HAL_TIM_OC_Stop_DMA
	.align	1
	.global	HAL_TIM_PWM_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_Init, %function
HAL_TIM_PWM_Init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L137
	movs	r3, #1
	b	.L138
.L137:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L139
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	ldr	r0, [r7, #4]
	bl	HAL_TIM_PWM_MspInit
.L139:
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	adds	r3, r3, #4
	mov	r1, r3
	mov	r0, r2
	bl	TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
.L138:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_PWM_Init, .-HAL_TIM_PWM_Init
	.align	1
	.global	HAL_TIM_PWM_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_DeInit, %function
HAL_TIM_PWM_DeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L141
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L141
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L141:
	ldr	r0, [r7, #4]
	bl	HAL_TIM_PWM_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_PWM_DeInit, .-HAL_TIM_PWM_DeInit
	.align	1
	.weak	HAL_TIM_PWM_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_MspInit, %function
HAL_TIM_PWM_MspInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_PWM_MspInit, .-HAL_TIM_PWM_MspInit
	.align	1
	.weak	HAL_TIM_PWM_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_MspDeInit, %function
HAL_TIM_PWM_MspDeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_PWM_MspDeInit, .-HAL_TIM_PWM_MspDeInit
	.align	1
	.global	HAL_TIM_PWM_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_Start, %function
HAL_TIM_PWM_Start:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L152
	cmp	r3, r2
	beq	.L146
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L152+4
	cmp	r3, r2
	bne	.L147
.L146:
	movs	r3, #1
	b	.L148
.L147:
	movs	r3, #0
.L148:
	cmp	r3, #0
	beq	.L149
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
.L149:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L150
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L150:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L153:
	.align	2
.L152:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_PWM_Start, .-HAL_TIM_PWM_Start
	.align	1
	.global	HAL_TIM_PWM_Stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_Stop, %function
HAL_TIM_PWM_Stop:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L161
	cmp	r3, r2
	beq	.L155
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L161+4
	cmp	r3, r2
	bne	.L156
.L155:
	movs	r3, #1
	b	.L157
.L156:
	movs	r3, #0
.L157:
	cmp	r3, #0
	beq	.L158
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L158
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L158
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L158:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L159
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L159
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L159:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L162:
	.align	2
.L161:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_PWM_Stop, .-HAL_TIM_PWM_Stop
	.align	1
	.global	HAL_TIM_PWM_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_Start_IT, %function
HAL_TIM_PWM_Start_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #12
	bhi	.L177
	adr	r2, .L166
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L166:
	.word	.L165+1
	.word	.L177+1
	.word	.L177+1
	.word	.L177+1
	.word	.L167+1
	.word	.L177+1
	.word	.L177+1
	.word	.L177+1
	.word	.L168+1
	.word	.L177+1
	.word	.L177+1
	.word	.L177+1
	.word	.L169+1
	.p2align 1
.L165:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #12]
	b	.L170
.L167:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #12]
	b	.L170
.L168:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3, #12]
	b	.L170
.L169:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #16
	str	r2, [r3, #12]
	b	.L170
.L177:
	nop
.L170:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L178
	cmp	r3, r2
	beq	.L171
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L178+4
	cmp	r3, r2
	bne	.L172
.L171:
	movs	r3, #1
	b	.L173
.L172:
	movs	r3, #0
.L173:
	cmp	r3, #0
	beq	.L174
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
.L174:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L175
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L175:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L179:
	.align	2
.L178:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_PWM_Start_IT, .-HAL_TIM_PWM_Start_IT
	.align	1
	.global	HAL_TIM_PWM_Stop_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_Stop_IT, %function
HAL_TIM_PWM_Stop_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #12
	bhi	.L194
	adr	r2, .L183
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L183:
	.word	.L182+1
	.word	.L194+1
	.word	.L194+1
	.word	.L194+1
	.word	.L184+1
	.word	.L194+1
	.word	.L194+1
	.word	.L194+1
	.word	.L185+1
	.word	.L194+1
	.word	.L194+1
	.word	.L194+1
	.word	.L186+1
	.p2align 1
.L182:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3, #12]
	b	.L187
.L184:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #12]
	b	.L187
.L185:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3, #12]
	b	.L187
.L186:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #16
	str	r2, [r3, #12]
	b	.L187
.L194:
	nop
.L187:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L195
	cmp	r3, r2
	beq	.L188
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L195+4
	cmp	r3, r2
	bne	.L189
.L188:
	movs	r3, #1
	b	.L190
.L189:
	movs	r3, #0
.L190:
	cmp	r3, #0
	beq	.L191
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L191
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L191
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L191:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L192
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L192
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L192:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L196:
	.align	2
.L195:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_PWM_Stop_IT, .-HAL_TIM_PWM_Stop_IT
	.align	1
	.global	HAL_TIM_PWM_Start_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_Start_DMA, %function
HAL_TIM_PWM_Start_DMA:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strh	r3, [r7, #2]	@ movhi
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #2
	bne	.L198
	movs	r3, #2
	b	.L199
.L198:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L200
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L201
	ldrh	r3, [r7, #2]
	cmp	r3, #0
	beq	.L201
	movs	r3, #1
	b	.L199
.L201:
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
.L200:
	ldr	r3, [r7, #8]
	cmp	r3, #12
	bhi	.L218
	adr	r2, .L204
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L204:
	.word	.L203+1
	.word	.L218+1
	.word	.L218+1
	.word	.L218+1
	.word	.L205+1
	.word	.L218+1
	.word	.L218+1
	.word	.L218+1
	.word	.L206+1
	.word	.L218+1
	.word	.L218+1
	.word	.L218+1
	.word	.L207+1
	.p2align 1
.L203:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L219
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L219+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L219+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #52
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L208
	movs	r3, #1
	b	.L199
.L208:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3, #12]
	b	.L209
.L205:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L219
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L219+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L219+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #56
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L210
	movs	r3, #1
	b	.L199
.L210:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3, #12]
	b	.L209
.L206:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L219
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L219+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L219+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #60
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L211
	movs	r3, #1
	b	.L199
.L211:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3, #12]
	b	.L209
.L207:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L219
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L219+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L219+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #64
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L212
	movs	r3, #1
	b	.L199
.L212:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #4096
	str	r2, [r3, #12]
	b	.L209
.L218:
	nop
.L209:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r2, #1
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L219+12
	cmp	r3, r2
	beq	.L213
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, .L219+16
	cmp	r3, r2
	bne	.L214
.L213:
	movs	r3, #1
	b	.L215
.L214:
	movs	r3, #0
.L215:
	cmp	r3, #0
	beq	.L216
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
.L216:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq	.L217
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L217:
	movs	r3, #0
.L199:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L220:
	.align	2
.L219:
	.word	TIM_DMADelayPulseCplt
	.word	TIM_DMADelayPulseHalfCplt
	.word	TIM_DMAError
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_PWM_Start_DMA, .-HAL_TIM_PWM_Start_DMA
	.align	1
	.global	HAL_TIM_PWM_Stop_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_Stop_DMA, %function
HAL_TIM_PWM_Stop_DMA:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #12
	bhi	.L235
	adr	r2, .L224
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L224:
	.word	.L223+1
	.word	.L235+1
	.word	.L235+1
	.word	.L235+1
	.word	.L225+1
	.word	.L235+1
	.word	.L235+1
	.word	.L235+1
	.word	.L226+1
	.word	.L235+1
	.word	.L235+1
	.word	.L235+1
	.word	.L227+1
	.p2align 1
.L223:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #512
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L228
.L225:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1024
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L228
.L226:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2048
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L228
.L227:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4096
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L228
.L235:
	nop
.L228:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L236
	cmp	r3, r2
	beq	.L229
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L236+4
	cmp	r3, r2
	bne	.L230
.L229:
	movs	r3, #1
	b	.L231
.L230:
	movs	r3, #0
.L231:
	cmp	r3, #0
	beq	.L232
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L232
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L232
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L232:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L233
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L233
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L233:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L237:
	.align	2
.L236:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_PWM_Stop_DMA, .-HAL_TIM_PWM_Stop_DMA
	.align	1
	.global	HAL_TIM_IC_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_Init, %function
HAL_TIM_IC_Init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L239
	movs	r3, #1
	b	.L240
.L239:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L241
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	ldr	r0, [r7, #4]
	bl	HAL_TIM_IC_MspInit
.L241:
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	adds	r3, r3, #4
	mov	r1, r3
	mov	r0, r2
	bl	TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
.L240:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_IC_Init, .-HAL_TIM_IC_Init
	.align	1
	.global	HAL_TIM_IC_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_DeInit, %function
HAL_TIM_IC_DeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L243
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L243
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L243:
	ldr	r0, [r7, #4]
	bl	HAL_TIM_IC_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_IC_DeInit, .-HAL_TIM_IC_DeInit
	.align	1
	.weak	HAL_TIM_IC_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_MspInit, %function
HAL_TIM_IC_MspInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_IC_MspInit, .-HAL_TIM_IC_MspInit
	.align	1
	.weak	HAL_TIM_IC_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_MspDeInit, %function
HAL_TIM_IC_MspDeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_IC_MspDeInit, .-HAL_TIM_IC_MspDeInit
	.align	1
	.global	HAL_TIM_IC_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_Start, %function
HAL_TIM_IC_Start:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L248
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L248:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_IC_Start, .-HAL_TIM_IC_Start
	.align	1
	.global	HAL_TIM_IC_Stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_Stop, %function
HAL_TIM_IC_Stop:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L251
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L251
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L251:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_IC_Stop, .-HAL_TIM_IC_Stop
	.align	1
	.global	HAL_TIM_IC_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_Start_IT, %function
HAL_TIM_IC_Start_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #12
	bhi	.L263
	adr	r2, .L256
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L256:
	.word	.L255+1
	.word	.L263+1
	.word	.L263+1
	.word	.L263+1
	.word	.L257+1
	.word	.L263+1
	.word	.L263+1
	.word	.L263+1
	.word	.L258+1
	.word	.L263+1
	.word	.L263+1
	.word	.L263+1
	.word	.L259+1
	.p2align 1
.L255:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #12]
	b	.L260
.L257:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #12]
	b	.L260
.L258:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3, #12]
	b	.L260
.L259:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #16
	str	r2, [r3, #12]
	b	.L260
.L263:
	nop
.L260:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L261
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L261:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_IC_Start_IT, .-HAL_TIM_IC_Start_IT
	.align	1
	.global	HAL_TIM_IC_Stop_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_Stop_IT, %function
HAL_TIM_IC_Stop_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #12
	bhi	.L274
	adr	r2, .L267
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L267:
	.word	.L266+1
	.word	.L274+1
	.word	.L274+1
	.word	.L274+1
	.word	.L268+1
	.word	.L274+1
	.word	.L274+1
	.word	.L274+1
	.word	.L269+1
	.word	.L274+1
	.word	.L274+1
	.word	.L274+1
	.word	.L270+1
	.p2align 1
.L266:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3, #12]
	b	.L271
.L268:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #12]
	b	.L271
.L269:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3, #12]
	b	.L271
.L270:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #16
	str	r2, [r3, #12]
	b	.L271
.L274:
	nop
.L271:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L272
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L272
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L272:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_IC_Stop_IT, .-HAL_TIM_IC_Stop_IT
	.align	1
	.global	HAL_TIM_IC_Start_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_Start_DMA, %function
HAL_TIM_IC_Start_DMA:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strh	r3, [r7, #2]	@ movhi
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #2
	bne	.L276
	movs	r3, #2
	b	.L277
.L276:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L278
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L279
	ldrh	r3, [r7, #2]
	cmp	r3, #0
	beq	.L279
	movs	r3, #1
	b	.L277
.L279:
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
.L278:
	ldr	r3, [r7, #8]
	cmp	r3, #12
	bhi	.L292
	adr	r2, .L282
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L282:
	.word	.L281+1
	.word	.L292+1
	.word	.L292+1
	.word	.L292+1
	.word	.L283+1
	.word	.L292+1
	.word	.L292+1
	.word	.L292+1
	.word	.L284+1
	.word	.L292+1
	.word	.L292+1
	.word	.L292+1
	.word	.L285+1
	.p2align 1
.L281:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L293
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L293+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L293+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #52
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L286
	movs	r3, #1
	b	.L277
.L286:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3, #12]
	b	.L287
.L283:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L293
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L293+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L293+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #56
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L288
	movs	r3, #1
	b	.L277
.L288:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3, #12]
	b	.L287
.L284:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L293
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L293+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L293+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #60
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L289
	movs	r3, #1
	b	.L277
.L289:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3, #12]
	b	.L287
.L285:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L293
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L293+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L293+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #64
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #2]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L290
	movs	r3, #1
	b	.L277
.L290:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #4096
	str	r2, [r3, #12]
	b	.L287
.L292:
	nop
.L287:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r2, #1
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq	.L291
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L291:
	movs	r3, #0
.L277:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L294:
	.align	2
.L293:
	.word	TIM_DMACaptureCplt
	.word	TIM_DMACaptureHalfCplt
	.word	TIM_DMAError
	.size	HAL_TIM_IC_Start_DMA, .-HAL_TIM_IC_Start_DMA
	.align	1
	.global	HAL_TIM_IC_Stop_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_Stop_DMA, %function
HAL_TIM_IC_Stop_DMA:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #12
	bhi	.L305
	adr	r2, .L298
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L298:
	.word	.L297+1
	.word	.L305+1
	.word	.L305+1
	.word	.L305+1
	.word	.L299+1
	.word	.L305+1
	.word	.L305+1
	.word	.L305+1
	.word	.L300+1
	.word	.L305+1
	.word	.L305+1
	.word	.L305+1
	.word	.L301+1
	.p2align 1
.L297:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #512
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L302
.L299:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1024
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L302
.L300:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2048
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L302
.L301:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4096
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L302
.L305:
	nop
.L302:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L303
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L303
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L303:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_IC_Stop_DMA, .-HAL_TIM_IC_Stop_DMA
	.align	1
	.global	HAL_TIM_OnePulse_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OnePulse_Init, %function
HAL_TIM_OnePulse_Init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L307
	movs	r3, #1
	b	.L308
.L307:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L309
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	ldr	r0, [r7, #4]
	bl	HAL_TIM_OnePulse_MspInit
.L309:
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	adds	r3, r3, #4
	mov	r1, r3
	mov	r0, r2
	bl	TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r1, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7]
	orrs	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
.L308:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_OnePulse_Init, .-HAL_TIM_OnePulse_Init
	.align	1
	.global	HAL_TIM_OnePulse_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OnePulse_DeInit, %function
HAL_TIM_OnePulse_DeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L311
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L311
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L311:
	ldr	r0, [r7, #4]
	bl	HAL_TIM_OnePulse_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_OnePulse_DeInit, .-HAL_TIM_OnePulse_DeInit
	.align	1
	.weak	HAL_TIM_OnePulse_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OnePulse_MspInit, %function
HAL_TIM_OnePulse_MspInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_OnePulse_MspInit, .-HAL_TIM_OnePulse_MspInit
	.align	1
	.weak	HAL_TIM_OnePulse_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OnePulse_MspDeInit, %function
HAL_TIM_OnePulse_MspDeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_OnePulse_MspDeInit, .-HAL_TIM_OnePulse_MspDeInit
	.align	1
	.global	HAL_TIM_OnePulse_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OnePulse_Start, %function
HAL_TIM_OnePulse_Start:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L321
	cmp	r3, r2
	beq	.L316
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L321+4
	cmp	r3, r2
	bne	.L317
.L316:
	movs	r3, #1
	b	.L318
.L317:
	movs	r3, #0
.L318:
	cmp	r3, #0
	beq	.L319
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
.L319:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L322:
	.align	2
.L321:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_OnePulse_Start, .-HAL_TIM_OnePulse_Start
	.align	1
	.global	HAL_TIM_OnePulse_Stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OnePulse_Stop, %function
HAL_TIM_OnePulse_Stop:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L330
	cmp	r3, r2
	beq	.L324
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L330+4
	cmp	r3, r2
	bne	.L325
.L324:
	movs	r3, #1
	b	.L326
.L325:
	movs	r3, #0
.L326:
	cmp	r3, #0
	beq	.L327
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L327
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L327
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L327:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L328
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L328
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L328:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L331:
	.align	2
.L330:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_OnePulse_Stop, .-HAL_TIM_OnePulse_Stop
	.align	1
	.global	HAL_TIM_OnePulse_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OnePulse_Start_IT, %function
HAL_TIM_OnePulse_Start_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L338
	cmp	r3, r2
	beq	.L333
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L338+4
	cmp	r3, r2
	bne	.L334
.L333:
	movs	r3, #1
	b	.L335
.L334:
	movs	r3, #0
.L335:
	cmp	r3, #0
	beq	.L336
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
.L336:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L339:
	.align	2
.L338:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_OnePulse_Start_IT, .-HAL_TIM_OnePulse_Start_IT
	.align	1
	.global	HAL_TIM_OnePulse_Stop_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OnePulse_Stop_IT, %function
HAL_TIM_OnePulse_Stop_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L347
	cmp	r3, r2
	beq	.L341
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L347+4
	cmp	r3, r2
	bne	.L342
.L341:
	movs	r3, #1
	b	.L343
.L342:
	movs	r3, #0
.L343:
	cmp	r3, #0
	beq	.L344
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L344
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L344
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L344:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L345
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L345
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L345:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L348:
	.align	2
.L347:
	.word	1073807360
	.word	1073808384
	.size	HAL_TIM_OnePulse_Stop_IT, .-HAL_TIM_OnePulse_Stop_IT
	.align	1
	.global	HAL_TIM_Encoder_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Encoder_Init, %function
HAL_TIM_Encoder_Init:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L350
	movs	r3, #1
	b	.L351
.L350:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L352
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	ldr	r0, [r7, #4]
	bl	HAL_TIM_Encoder_MspInit
.L352:
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	ldr	r2, [r7, #4]
	ldr	r2, [r2]
	bic	r3, r3, #16384
	bic	r3, r3, #7
	str	r3, [r2, #8]
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	adds	r3, r3, #4
	mov	r1, r3
	mov	r0, r2
	bl	TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #32]
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic	r3, r3, #768
	bic	r3, r3, #3
	str	r3, [r7, #16]
	ldr	r3, [r7]
	ldr	r2, [r3, #8]
	ldr	r3, [r7]
	ldr	r3, [r3, #24]
	lsls	r3, r3, #8
	orrs	r3, r3, r2
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic	r3, r3, #3072
	bic	r3, r3, #12
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic	r3, r3, #61440
	bic	r3, r3, #240
	str	r3, [r7, #16]
	ldr	r3, [r7]
	ldr	r2, [r3, #12]
	ldr	r3, [r7]
	ldr	r3, [r3, #28]
	lsls	r3, r3, #8
	orrs	r3, r3, r2
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7]
	ldr	r3, [r3, #16]
	lsls	r2, r3, #4
	ldr	r3, [r7]
	ldr	r3, [r3, #32]
	lsls	r3, r3, #12
	orrs	r3, r3, r2
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	bic	r3, r3, #34
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #136
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7]
	ldr	r3, [r3, #20]
	lsls	r3, r3, #4
	orrs	r3, r3, r2
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #16]
	str	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
.L351:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_Encoder_Init, .-HAL_TIM_Encoder_Init
	.align	1
	.global	HAL_TIM_Encoder_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Encoder_DeInit, %function
HAL_TIM_Encoder_DeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L354
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L354
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L354:
	ldr	r0, [r7, #4]
	bl	HAL_TIM_Encoder_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_Encoder_DeInit, .-HAL_TIM_Encoder_DeInit
	.align	1
	.weak	HAL_TIM_Encoder_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Encoder_MspInit, %function
HAL_TIM_Encoder_MspInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_Encoder_MspInit, .-HAL_TIM_Encoder_MspInit
	.align	1
	.weak	HAL_TIM_Encoder_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Encoder_MspDeInit, %function
HAL_TIM_Encoder_MspDeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_Encoder_MspDeInit, .-HAL_TIM_Encoder_MspDeInit
	.align	1
	.global	HAL_TIM_Encoder_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Encoder_Start, %function
HAL_TIM_Encoder_Start:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L360
	cmp	r3, #4
	beq	.L361
	b	.L364
.L360:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	b	.L362
.L361:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	b	.L362
.L364:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	nop
.L362:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_Encoder_Start, .-HAL_TIM_Encoder_Start
	.align	1
	.global	HAL_TIM_Encoder_Stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Encoder_Stop, %function
HAL_TIM_Encoder_Stop:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L367
	cmp	r3, #4
	beq	.L368
	b	.L372
.L367:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	b	.L369
.L368:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	b	.L369
.L372:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	nop
.L369:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L370
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L370
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L370:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_Encoder_Stop, .-HAL_TIM_Encoder_Stop
	.align	1
	.global	HAL_TIM_Encoder_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Encoder_Start_IT, %function
HAL_TIM_Encoder_Start_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L375
	cmp	r3, #4
	beq	.L376
	b	.L379
.L375:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #12]
	b	.L377
.L376:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #12]
	b	.L377
.L379:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #12]
	nop
.L377:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_Encoder_Start_IT, .-HAL_TIM_Encoder_Start_IT
	.align	1
	.global	HAL_TIM_Encoder_Stop_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Encoder_Stop_IT, %function
HAL_TIM_Encoder_Stop_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L381
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3, #12]
	b	.L382
.L381:
	ldr	r3, [r7]
	cmp	r3, #4
	bne	.L383
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #12]
	b	.L382
.L383:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #12]
.L382:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L384
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L384
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L384:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_Encoder_Stop_IT, .-HAL_TIM_Encoder_Stop_IT
	.align	1
	.global	HAL_TIM_Encoder_Start_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Encoder_Start_DMA, %function
HAL_TIM_Encoder_Start_DMA:
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #2
	bne	.L387
	movs	r3, #2
	b	.L388
.L387:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L389
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L390
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L391
.L390:
	ldrh	r3, [r7, #24]
	cmp	r3, #0
	beq	.L391
	movs	r3, #1
	b	.L388
.L391:
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
.L389:
	ldr	r3, [r7, #8]
	cmp	r3, #4
	beq	.L393
	cmp	r3, #60
	beq	.L394
	cmp	r3, #0
	beq	.L395
	b	.L397
.L395:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L401
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L401+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L401+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #52
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #24]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L396
	movs	r3, #1
	b	.L388
.L396:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	b	.L397
.L393:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L401
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L401+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L401+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #56
	mov	r1, r3
	ldr	r2, [r7]
	ldrh	r3, [r7, #24]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L398
	movs	r3, #1
	b	.L388
.L398:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	b	.L397
.L394:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L401
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L401+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L401+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #52
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #24]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L399
	movs	r3, #1
	b	.L388
.L399:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L401
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L401+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L401+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #56
	mov	r1, r3
	ldr	r2, [r7]
	ldrh	r3, [r7, #24]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L400
	movs	r3, #1
	b	.L388
.L400:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3, #12]
	nop
.L397:
	movs	r3, #0
.L388:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L402:
	.align	2
.L401:
	.word	TIM_DMACaptureCplt
	.word	TIM_DMACaptureHalfCplt
	.word	TIM_DMAError
	.size	HAL_TIM_Encoder_Start_DMA, .-HAL_TIM_Encoder_Start_DMA
	.align	1
	.global	HAL_TIM_Encoder_Stop_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Encoder_Stop_DMA, %function
HAL_TIM_Encoder_Stop_DMA:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L404
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #512
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L405
.L404:
	ldr	r3, [r7]
	cmp	r3, #4
	bne	.L406
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1024
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	b	.L405
.L406:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #512
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1024
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
.L405:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L407
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L407
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L407:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_Encoder_Stop_DMA, .-HAL_TIM_Encoder_Stop_DMA
	.align	1
	.global	HAL_TIM_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IRQHandler, %function
HAL_TIM_IRQHandler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #16]
	and	r3, r3, #2
	cmp	r3, #2
	bne	.L410
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	and	r3, r3, #2
	cmp	r3, #2
	bne	.L410
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvn	r2, #2
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	and	r3, r3, #3
	cmp	r3, #0
	beq	.L411
	ldr	r0, [r7, #4]
	bl	HAL_TIM_IC_CaptureCallback @secure
	b	.L412
.L411:
	ldr	r0, [r7, #4]
	bl	HAL_TIM_OC_DelayElapsedCallback @secure
	ldr	r0, [r7, #4]
	bl	HAL_TIM_PWM_PulseFinishedCallback @secure
.L412:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #28]
.L410:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #16]
	and	r3, r3, #4
	cmp	r3, #4
	bne	.L413
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	and	r3, r3, #4
	cmp	r3, #4
	bne	.L413
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvn	r2, #4
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	and	r3, r3, #768
	cmp	r3, #0
	beq	.L414
	ldr	r0, [r7, #4]
	bl	HAL_TIM_IC_CaptureCallback @secure
	b	.L415
.L414:
	ldr	r0, [r7, #4]
	bl	HAL_TIM_OC_DelayElapsedCallback @secure
	ldr	r0, [r7, #4]
	bl	HAL_TIM_PWM_PulseFinishedCallback @secure
.L415:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #28]
.L413:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #16]
	and	r3, r3, #8
	cmp	r3, #8
	bne	.L416
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	and	r3, r3, #8
	cmp	r3, #8
	bne	.L416
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvn	r2, #8
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	movs	r2, #4
	strb	r2, [r3, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	and	r3, r3, #3
	cmp	r3, #0
	beq	.L417
	ldr	r0, [r7, #4]
	bl	HAL_TIM_IC_CaptureCallback @secure
	b	.L418
.L417:
	ldr	r0, [r7, #4]
	bl	HAL_TIM_OC_DelayElapsedCallback @secure
	ldr	r0, [r7, #4]
	bl	HAL_TIM_PWM_PulseFinishedCallback @secure
.L418:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #28]
.L416:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #16]
	and	r3, r3, #16
	cmp	r3, #16
	bne	.L419
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	and	r3, r3, #16
	cmp	r3, #16
	bne	.L419
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvn	r2, #16
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	movs	r2, #8
	strb	r2, [r3, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	and	r3, r3, #768
	cmp	r3, #0
	beq	.L420
	ldr	r0, [r7, #4]
	bl	HAL_TIM_IC_CaptureCallback @secure
	b	.L421
.L420:
	ldr	r0, [r7, #4]
	bl	HAL_TIM_OC_DelayElapsedCallback @secure
	ldr	r0, [r7, #4]
	bl	HAL_TIM_PWM_PulseFinishedCallback @secure
.L421:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #28]
.L419:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #16]
	and	r3, r3, #1
	cmp	r3, #1
	bne	.L422
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	and	r3, r3, #1
	cmp	r3, #1
	bne	.L422
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvn	r2, #1
	str	r2, [r3, #16]
	ldr	r0, [r7, #4]
	bl	HAL_TIM_PeriodElapsedCallback @secure
.L422:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #16]
	and	r3, r3, #128
	cmp	r3, #128
	bne	.L423
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	and	r3, r3, #128
	cmp	r3, #128
	bne	.L423
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvn	r2, #128
	str	r2, [r3, #16]
	ldr	r0, [r7, #4]
	bl	HAL_TIMEx_BreakCallback @secure
.L423:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #16]
	and	r3, r3, #64
	cmp	r3, #64
	bne	.L424
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	and	r3, r3, #64
	cmp	r3, #64
	bne	.L424
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvn	r2, #64
	str	r2, [r3, #16]
	ldr	r0, [r7, #4]
	bl	HAL_TIM_TriggerCallback @secure
.L424:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #16]
	and	r3, r3, #32
	cmp	r3, #32
	bne	.L426
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	and	r3, r3, #32
	cmp	r3, #32
	bne	.L426
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvn	r2, #32
	str	r2, [r3, #16]
	ldr	r0, [r7, #4]
	bl	HAL_TIMEx_CommutCallback @secure
.L426:
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #53 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
	.size	HAL_TIM_IRQHandler, .-HAL_TIM_IRQHandler
	.align	1
	.global	HAL_TIM_OC_ConfigChannel
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_ConfigChannel, %function
HAL_TIM_OC_ConfigChannel:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L428
	movs	r3, #2
	b	.L429
.L428:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	cmp	r3, #12
	bhi	.L437
	adr	r2, .L432
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L432:
	.word	.L431+1
	.word	.L437+1
	.word	.L437+1
	.word	.L437+1
	.word	.L433+1
	.word	.L437+1
	.word	.L437+1
	.word	.L437+1
	.word	.L434+1
	.word	.L437+1
	.word	.L437+1
	.word	.L437+1
	.word	.L435+1
	.p2align 1
.L431:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_OC1_SetConfig
	b	.L436
.L433:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_OC2_SetConfig
	b	.L436
.L434:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_OC3_SetConfig
	b	.L436
.L435:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_OC4_SetConfig
	b	.L436
.L437:
	nop
.L436:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L429:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_OC_ConfigChannel, .-HAL_TIM_OC_ConfigChannel
	.align	1
	.global	HAL_TIM_IC_ConfigChannel
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_ConfigChannel, %function
HAL_TIM_IC_ConfigChannel:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L439
	movs	r3, #2
	b	.L440
.L439:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L441
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r3, [r7, #8]
	ldr	r1, [r3]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	bl	TIM_TI1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #12
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #24]
	b	.L442
.L441:
	ldr	r3, [r7, #4]
	cmp	r3, #4
	bne	.L443
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r3, [r7, #8]
	ldr	r1, [r3]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	bl	TIM_TI2_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #3072
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	lsls	r2, r3, #8
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #24]
	b	.L442
.L443:
	ldr	r3, [r7, #4]
	cmp	r3, #8
	bne	.L444
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r3, [r7, #8]
	ldr	r1, [r3]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	bl	TIM_TI3_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #12
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #28]
	b	.L442
.L444:
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r3, [r7, #8]
	ldr	r1, [r3]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	bl	TIM_TI4_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #3072
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	lsls	r2, r3, #8
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #28]
.L442:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L440:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_IC_ConfigChannel, .-HAL_TIM_IC_ConfigChannel
	.align	1
	.global	HAL_TIM_PWM_ConfigChannel
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_ConfigChannel, %function
HAL_TIM_PWM_ConfigChannel:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L446
	movs	r3, #2
	b	.L447
.L446:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	cmp	r3, #12
	bhi	.L455
	adr	r2, .L450
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L450:
	.word	.L449+1
	.word	.L455+1
	.word	.L455+1
	.word	.L455+1
	.word	.L451+1
	.word	.L455+1
	.word	.L455+1
	.word	.L455+1
	.word	.L452+1
	.word	.L455+1
	.word	.L455+1
	.word	.L455+1
	.word	.L453+1
	.p2align 1
.L449:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_OC1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #24]
	b	.L454
.L451:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_OC2_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #1024
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #16]
	lsls	r2, r3, #8
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #24]
	b	.L454
.L452:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_OC3_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #28]
	b	.L454
.L453:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_OC4_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #1024
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #16]
	lsls	r2, r3, #8
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #28]
	b	.L454
.L455:
	nop
.L454:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L447:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_PWM_ConfigChannel, .-HAL_TIM_PWM_ConfigChannel
	.align	1
	.global	HAL_TIM_OnePulse_ConfigChannel
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OnePulse_ConfigChannel, %function
HAL_TIM_OnePulse_ConfigChannel:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #48
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	cmp	r2, r3
	beq	.L457
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L458
	movs	r3, #2
	b	.L468
.L458:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #8]
	ldr	r3, [r3]
	str	r3, [r7, #20]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #4]
	str	r3, [r7, #24]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	str	r3, [r7, #28]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	str	r3, [r7, #32]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #16]
	str	r3, [r7, #40]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #20]
	str	r3, [r7, #44]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L461
	cmp	r3, #4
	beq	.L462
	b	.L463
.L461:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	add	r2, r7, #20
	mov	r1, r2
	mov	r0, r3
	bl	TIM_OC1_SetConfig
	b	.L463
.L462:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	add	r2, r7, #20
	mov	r1, r2
	mov	r0, r3
	bl	TIM_OC2_SetConfig
	nop
.L463:
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L465
	cmp	r3, #4
	beq	.L466
	b	.L467
.L465:
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r3, [r7, #8]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #32]
	bl	TIM_TI1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #12
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #112
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #80
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #7
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #6
	str	r2, [r3, #8]
	b	.L467
.L466:
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r3, [r7, #8]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #32]
	bl	TIM_TI2_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #3072
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #112
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #96
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #7
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #6
	str	r2, [r3, #8]
	nop
.L467:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
	b	.L468
.L457:
	movs	r3, #1
.L468:
	mov	r0, r3
	adds	r7, r7, #48
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_OnePulse_ConfigChannel, .-HAL_TIM_OnePulse_ConfigChannel
	.align	1
	.global	HAL_TIM_DMABurst_WriteStart
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_DMABurst_WriteStart, %function
HAL_TIM_DMABurst_WriteStart:
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #2
	bne	.L470
	movs	r3, #2
	b	.L471
.L470:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L472
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L473
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L473
	movs	r3, #1
	b	.L471
.L473:
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
.L472:
	ldr	r3, [r7, #4]
	cmp	r3, #2048
	beq	.L475
	cmp	r3, #2048
	bhi	.L476
	cmp	r3, #512
	beq	.L477
	cmp	r3, #1024
	beq	.L478
	cmp	r3, #256
	beq	.L479
	b	.L484
.L476:
	cmp	r3, #8192
	beq	.L480
	cmp	r3, #16384
	beq	.L481
	cmp	r3, #4096
	beq	.L482
	b	.L484
.L479:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, .L498
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, .L498+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, .L498+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #32]
	ldr	r1, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L491
	movs	r3, #1
	b	.L471
.L477:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L498+12
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L498+16
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L498+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]
	ldr	r1, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L492
	movs	r3, #1
	b	.L471
.L478:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L498+12
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L498+16
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L498+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]
	ldr	r1, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L493
	movs	r3, #1
	b	.L471
.L475:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L498+12
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L498+16
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L498+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]
	ldr	r1, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L494
	movs	r3, #1
	b	.L471
.L482:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L498+12
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L498+16
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L498+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]
	ldr	r1, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L495
	movs	r3, #1
	b	.L471
.L480:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L498+20
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L498+24
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L498+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #52]
	ldr	r1, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L496
	movs	r3, #1
	b	.L471
.L481:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]
	ldr	r2, .L498+28
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]
	ldr	r2, .L498+32
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]
	ldr	r2, .L498+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #56]
	ldr	r1, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L497
	movs	r3, #1
	b	.L471
.L491:
	nop
	b	.L484
.L492:
	nop
	b	.L484
.L493:
	nop
	b	.L484
.L494:
	nop
	b	.L484
.L495:
	nop
	b	.L484
.L496:
	nop
	b	.L484
.L497:
	nop
.L484:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #24]
	orrs	r2, r2, r1
	str	r2, [r3, #72]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	orrs	r2, r2, r1
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
.L471:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L499:
	.align	2
.L498:
	.word	TIM_DMAPeriodElapsedCplt
	.word	TIM_DMAPeriodElapsedHalfCplt
	.word	TIM_DMAError
	.word	TIM_DMADelayPulseCplt
	.word	TIM_DMADelayPulseHalfCplt
	.word	TIMEx_DMACommutationCplt
	.word	TIMEx_DMACommutationHalfCplt
	.word	TIM_DMATriggerCplt
	.word	TIM_DMATriggerHalfCplt
	.size	HAL_TIM_DMABurst_WriteStart, .-HAL_TIM_DMABurst_WriteStart
	.align	1
	.global	HAL_TIM_DMABurst_WriteStop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_DMABurst_WriteStop, %function
HAL_TIM_DMABurst_WriteStop:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	strb	r3, [r7, #15]
	ldr	r3, [r7]
	cmp	r3, #2048
	beq	.L502
	cmp	r3, #2048
	bhi	.L503
	cmp	r3, #512
	beq	.L504
	cmp	r3, #1024
	beq	.L505
	cmp	r3, #256
	beq	.L506
	b	.L510
.L503:
	cmp	r3, #8192
	beq	.L507
	cmp	r3, #16384
	beq	.L508
	cmp	r3, #4096
	beq	.L509
	b	.L510
.L506:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L510
.L504:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L510
.L505:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L510
.L502:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L510
.L509:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L510
.L507:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L510
.L508:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	nop
.L510:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L511
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r1, [r3, #12]
	ldr	r3, [r7]
	mvns	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ands	r2, r2, r1
	str	r2, [r3, #12]
.L511:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_DMABurst_WriteStop, .-HAL_TIM_DMABurst_WriteStop
	.align	1
	.global	HAL_TIM_DMABurst_ReadStart
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_DMABurst_ReadStart, %function
HAL_TIM_DMABurst_ReadStart:
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #2
	bne	.L514
	movs	r3, #2
	b	.L515
.L514:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L516
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L517
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L517
	movs	r3, #1
	b	.L515
.L517:
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
.L516:
	ldr	r3, [r7, #4]
	cmp	r3, #2048
	beq	.L519
	cmp	r3, #2048
	bhi	.L520
	cmp	r3, #512
	beq	.L521
	cmp	r3, #1024
	beq	.L522
	cmp	r3, #256
	beq	.L523
	b	.L528
.L520:
	cmp	r3, #8192
	beq	.L524
	cmp	r3, #16384
	beq	.L525
	cmp	r3, #4096
	beq	.L526
	b	.L528
.L523:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, .L542
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, .L542+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, .L542+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r1, r3
	ldr	r2, [r7]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L535
	movs	r3, #1
	b	.L515
.L521:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L542+12
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L542+16
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L542+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r1, r3
	ldr	r2, [r7]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L536
	movs	r3, #1
	b	.L515
.L522:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L542+12
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L542+16
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L542+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r1, r3
	ldr	r2, [r7]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L537
	movs	r3, #1
	b	.L515
.L519:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L542+12
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L542+16
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L542+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r1, r3
	ldr	r2, [r7]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L538
	movs	r3, #1
	b	.L515
.L526:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L542+12
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L542+16
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L542+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r1, r3
	ldr	r2, [r7]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L539
	movs	r3, #1
	b	.L515
.L524:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L542+20
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L542+24
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L542+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #52]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r1, r3
	ldr	r2, [r7]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L540
	movs	r3, #1
	b	.L515
.L525:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]
	ldr	r2, .L542+28
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]
	ldr	r2, .L542+32
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]
	ldr	r2, .L542+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #56]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #76
	mov	r1, r3
	ldr	r2, [r7]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, r3, #1
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L541
	movs	r3, #1
	b	.L515
.L535:
	nop
	b	.L528
.L536:
	nop
	b	.L528
.L537:
	nop
	b	.L528
.L538:
	nop
	b	.L528
.L539:
	nop
	b	.L528
.L540:
	nop
	b	.L528
.L541:
	nop
.L528:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #24]
	orrs	r2, r2, r1
	str	r2, [r3, #72]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	orrs	r2, r2, r1
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
.L515:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L543:
	.align	2
.L542:
	.word	TIM_DMAPeriodElapsedCplt
	.word	TIM_DMAPeriodElapsedHalfCplt
	.word	TIM_DMAError
	.word	TIM_DMACaptureCplt
	.word	TIM_DMACaptureHalfCplt
	.word	TIMEx_DMACommutationCplt
	.word	TIMEx_DMACommutationHalfCplt
	.word	TIM_DMATriggerCplt
	.word	TIM_DMATriggerHalfCplt
	.size	HAL_TIM_DMABurst_ReadStart, .-HAL_TIM_DMABurst_ReadStart
	.align	1
	.global	HAL_TIM_DMABurst_ReadStop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_DMABurst_ReadStop, %function
HAL_TIM_DMABurst_ReadStop:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	strb	r3, [r7, #15]
	ldr	r3, [r7]
	cmp	r3, #2048
	beq	.L546
	cmp	r3, #2048
	bhi	.L547
	cmp	r3, #512
	beq	.L548
	cmp	r3, #1024
	beq	.L549
	cmp	r3, #256
	beq	.L550
	b	.L554
.L547:
	cmp	r3, #8192
	beq	.L551
	cmp	r3, #16384
	beq	.L552
	cmp	r3, #4096
	beq	.L553
	b	.L554
.L550:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L554
.L548:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L554
.L549:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L554
.L546:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L554
.L553:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L554
.L551:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L554
.L552:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	nop
.L554:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L555
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r1, [r3, #12]
	ldr	r3, [r7]
	mvns	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ands	r2, r2, r1
	str	r2, [r3, #12]
.L555:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_DMABurst_ReadStop, .-HAL_TIM_DMABurst_ReadStop
	.align	1
	.global	HAL_TIM_GenerateEvent
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_GenerateEvent, %function
HAL_TIM_GenerateEvent:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L558
	movs	r3, #2
	b	.L559
.L558:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7]
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L559:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_GenerateEvent, .-HAL_TIM_GenerateEvent
	.align	1
	.global	HAL_TIM_ConfigOCrefClear
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_ConfigOCrefClear, %function
HAL_TIM_ConfigOCrefClear:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L561
	movs	r3, #2
	b	.L562
.L561:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L564
	cmp	r3, #1
	beq	.L565
	b	.L566
.L564:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #65280
	str	r2, [r3, #8]
	b	.L566
.L565:
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L567
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #1
	b	.L562
.L567:
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r3, [r7, #8]
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #16]
	bl	TIM_ETR_SetConfig
	nop
.L566:
	ldr	r3, [r7, #4]
	cmp	r3, #12
	bhi	.L583
	adr	r2, .L570
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L570:
	.word	.L569+1
	.word	.L583+1
	.word	.L583+1
	.word	.L583+1
	.word	.L571+1
	.word	.L583+1
	.word	.L583+1
	.word	.L583+1
	.word	.L572+1
	.word	.L583+1
	.word	.L583+1
	.word	.L583+1
	.word	.L573+1
	.p2align 1
.L569:
	ldr	r3, [r7, #8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L574
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #24]
	b	.L576
.L574:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #24]
	b	.L576
.L571:
	ldr	r3, [r7, #8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L577
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #24]
	b	.L576
.L577:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #24]
	b	.L576
.L572:
	ldr	r3, [r7, #8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L579
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #28]
	b	.L576
.L579:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #28]
	b	.L576
.L573:
	ldr	r3, [r7, #8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L581
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #28]
	b	.L576
.L581:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #28]
	b	.L576
.L583:
	nop
.L576:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L562:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_ConfigOCrefClear, .-HAL_TIM_ConfigOCrefClear
	.align	1
	.global	HAL_TIM_ConfigClockSource
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_ConfigClockSource, %function
HAL_TIM_ConfigClockSource:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L585
	movs	r3, #2
	b	.L586
.L585:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #119
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #65280
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	str	r2, [r3, #8]
	ldr	r3, [r7]
	ldr	r3, [r3]
	cmp	r3, #64
	beq	.L588
	cmp	r3, #64
	bhi	.L589
	cmp	r3, #16
	beq	.L590
	cmp	r3, #16
	bhi	.L591
	cmp	r3, #0
	beq	.L590
	b	.L598
.L591:
	cmp	r3, #32
	beq	.L590
	cmp	r3, #48
	beq	.L590
	b	.L598
.L589:
	cmp	r3, #112
	beq	.L592
	cmp	r3, #112
	bhi	.L593
	cmp	r3, #80
	beq	.L594
	cmp	r3, #96
	beq	.L595
	b	.L598
.L593:
	cmp	r3, #4096
	beq	.L599
	cmp	r3, #8192
	beq	.L597
	b	.L598
.L592:
	ldr	r3, [r7, #4]
	ldr	r0, [r3]
	ldr	r3, [r7]
	ldr	r1, [r3, #8]
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	bl	TIM_ETR_SetConfig @secure
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	orr	r3, r3, #119
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	str	r2, [r3, #8]
	b	.L598
.L597:
	ldr	r3, [r7, #4]
	ldr	r0, [r3]
	ldr	r3, [r7]
	ldr	r1, [r3, #8]
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	bl	TIM_ETR_SetConfig @secure
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #16384
	str	r2, [r3, #8]
	b	.L598
.L594:
	ldr	r3, [r7, #4]
	ldr	r0, [r3]
	ldr	r3, [r7]
	ldr	r1, [r3, #4]
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	mov	r2, r3
	bl	TIM_TI1_ConfigInputStage @secure
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r1, #80
	mov	r0, r3
	bl	TIM_ITRx_SetConfig @secure
	b	.L598
.L595:
	ldr	r3, [r7, #4]
	ldr	r0, [r3]
	ldr	r3, [r7]
	ldr	r1, [r3, #4]
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	mov	r2, r3
	bl	TIM_TI2_ConfigInputStage @secure
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r1, #96
	mov	r0, r3
	bl	TIM_ITRx_SetConfig @secure
	b	.L598
.L588:
	ldr	r3, [r7, #4]
	ldr	r0, [r3]
	ldr	r3, [r7]
	ldr	r1, [r3, #4]
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	mov	r2, r3
	bl	TIM_TI1_ConfigInputStage @secure
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r1, #64
	mov	r0, r3
	bl	TIM_ITRx_SetConfig @secure
	b	.L598
.L590:
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7]
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	TIM_ITRx_SetConfig @secure
	b	.L598
.L599:
	nop
.L598:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L586:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #34 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
	.size	HAL_TIM_ConfigClockSource, .-HAL_TIM_ConfigClockSource
	.align	1
	.global	HAL_TIM_ConfigTI1Input
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_ConfigTI1Input, %function
HAL_TIM_ConfigTI1Input:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #128
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r3, [r7]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_ConfigTI1Input, .-HAL_TIM_ConfigTI1Input
	.align	1
	.global	HAL_TIM_SlaveConfigSynchro
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_SlaveConfigSynchro, %function
HAL_TIM_SlaveConfigSynchro:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L603
	movs	r3, #2
	b	.L604
.L603:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r1, [r7]
	ldr	r0, [r7, #4]
	bl	TIM_SlaveTimer_SetConfig
	mov	r3, r0
	cmp	r3, #0
	beq	.L605
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #1
	b	.L604
.L605:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #16384
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L604:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_SlaveConfigSynchro, .-HAL_TIM_SlaveConfigSynchro
	.align	1
	.global	HAL_TIM_SlaveConfigSynchro_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_SlaveConfigSynchro_IT, %function
HAL_TIM_SlaveConfigSynchro_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L607
	movs	r3, #2
	b	.L608
.L607:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r1, [r7]
	ldr	r0, [r7, #4]
	bl	TIM_SlaveTimer_SetConfig
	mov	r3, r0
	cmp	r3, #0
	beq	.L609
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #1
	b	.L608
.L609:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #64
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #16384
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L608:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIM_SlaveConfigSynchro_IT, .-HAL_TIM_SlaveConfigSynchro_IT
	.align	1
	.global	HAL_TIM_ReadCapturedValue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_ReadCapturedValue, %function
HAL_TIM_ReadCapturedValue:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7]
	cmp	r3, #12
	bhi	.L619
	adr	r2, .L613
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L613:
	.word	.L612+1
	.word	.L619+1
	.word	.L619+1
	.word	.L619+1
	.word	.L614+1
	.word	.L619+1
	.word	.L619+1
	.word	.L619+1
	.word	.L615+1
	.word	.L619+1
	.word	.L619+1
	.word	.L619+1
	.word	.L616+1
	.p2align 1
.L612:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #52]
	str	r3, [r7, #12]
	b	.L617
.L614:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	b	.L617
.L615:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #60]
	str	r3, [r7, #12]
	b	.L617
.L616:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #64]
	str	r3, [r7, #12]
	b	.L617
.L619:
	nop
.L617:
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_ReadCapturedValue, .-HAL_TIM_ReadCapturedValue
	.align	1
	.weak	HAL_TIM_PeriodElapsedCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PeriodElapsedCallback, %function
HAL_TIM_PeriodElapsedCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_PeriodElapsedCallback, .-HAL_TIM_PeriodElapsedCallback
	.align	1
	.weak	HAL_TIM_PeriodElapsedHalfCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PeriodElapsedHalfCpltCallback, %function
HAL_TIM_PeriodElapsedHalfCpltCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_PeriodElapsedHalfCpltCallback, .-HAL_TIM_PeriodElapsedHalfCpltCallback
	.align	1
	.weak	HAL_TIM_OC_DelayElapsedCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_DelayElapsedCallback, %function
HAL_TIM_OC_DelayElapsedCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_OC_DelayElapsedCallback, .-HAL_TIM_OC_DelayElapsedCallback
	.align	1
	.weak	HAL_TIM_IC_CaptureCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_CaptureCallback, %function
HAL_TIM_IC_CaptureCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_IC_CaptureCallback, .-HAL_TIM_IC_CaptureCallback
	.align	1
	.weak	HAL_TIM_IC_CaptureHalfCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_CaptureHalfCpltCallback, %function
HAL_TIM_IC_CaptureHalfCpltCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_IC_CaptureHalfCpltCallback, .-HAL_TIM_IC_CaptureHalfCpltCallback
	.align	1
	.weak	HAL_TIM_PWM_PulseFinishedCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_PulseFinishedCallback, %function
HAL_TIM_PWM_PulseFinishedCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_PWM_PulseFinishedCallback, .-HAL_TIM_PWM_PulseFinishedCallback
	.align	1
	.weak	HAL_TIM_PWM_PulseFinishedHalfCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_PulseFinishedHalfCpltCallback, %function
HAL_TIM_PWM_PulseFinishedHalfCpltCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_PWM_PulseFinishedHalfCpltCallback, .-HAL_TIM_PWM_PulseFinishedHalfCpltCallback
	.align	1
	.weak	HAL_TIM_TriggerCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_TriggerCallback, %function
HAL_TIM_TriggerCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_TriggerCallback, .-HAL_TIM_TriggerCallback
	.align	1
	.weak	HAL_TIM_TriggerHalfCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_TriggerHalfCpltCallback, %function
HAL_TIM_TriggerHalfCpltCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_TriggerHalfCpltCallback, .-HAL_TIM_TriggerHalfCpltCallback
	.align	1
	.weak	HAL_TIM_ErrorCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_ErrorCallback, %function
HAL_TIM_ErrorCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_ErrorCallback, .-HAL_TIM_ErrorCallback
	.align	1
	.global	HAL_TIM_Base_GetState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_GetState, %function
HAL_TIM_Base_GetState:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_Base_GetState, .-HAL_TIM_Base_GetState
	.align	1
	.global	HAL_TIM_OC_GetState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OC_GetState, %function
HAL_TIM_OC_GetState:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_OC_GetState, .-HAL_TIM_OC_GetState
	.align	1
	.global	HAL_TIM_PWM_GetState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_PWM_GetState, %function
HAL_TIM_PWM_GetState:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_PWM_GetState, .-HAL_TIM_PWM_GetState
	.align	1
	.global	HAL_TIM_IC_GetState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_IC_GetState, %function
HAL_TIM_IC_GetState:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_IC_GetState, .-HAL_TIM_IC_GetState
	.align	1
	.global	HAL_TIM_OnePulse_GetState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_OnePulse_GetState, %function
HAL_TIM_OnePulse_GetState:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_OnePulse_GetState, .-HAL_TIM_OnePulse_GetState
	.align	1
	.global	HAL_TIM_Encoder_GetState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Encoder_GetState, %function
HAL_TIM_Encoder_GetState:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIM_Encoder_GetState, .-HAL_TIM_Encoder_GetState
	.align	1
	.global	TIM_DMAError
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_DMAError, %function
TIM_DMAError:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r0, [r7, #12]
	bl	HAL_TIM_ErrorCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIM_DMAError, .-TIM_DMAError
	.align	1
	.global	TIM_DMADelayPulseCplt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_DMADelayPulseCplt, %function
TIM_DMADelayPulseCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L644
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #28]
	b	.L645
.L644:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L646
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #28]
	b	.L645
.L646:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L647
	ldr	r3, [r7, #12]
	movs	r2, #4
	strb	r2, [r3, #28]
	b	.L645
.L647:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L645
	ldr	r3, [r7, #12]
	movs	r2, #8
	strb	r2, [r3, #28]
.L645:
	ldr	r0, [r7, #12]
	bl	HAL_TIM_PWM_PulseFinishedCallback
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #28]
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIM_DMADelayPulseCplt, .-TIM_DMADelayPulseCplt
	.align	1
	.global	TIM_DMADelayPulseHalfCplt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_DMADelayPulseHalfCplt, %function
TIM_DMADelayPulseHalfCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L649
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #28]
	b	.L650
.L649:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L651
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #28]
	b	.L650
.L651:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L652
	ldr	r3, [r7, #12]
	movs	r2, #4
	strb	r2, [r3, #28]
	b	.L650
.L652:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L650
	ldr	r3, [r7, #12]
	movs	r2, #8
	strb	r2, [r3, #28]
.L650:
	ldr	r0, [r7, #12]
	bl	HAL_TIM_PWM_PulseFinishedHalfCpltCallback
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #28]
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIM_DMADelayPulseHalfCplt, .-TIM_DMADelayPulseHalfCplt
	.align	1
	.global	TIM_DMACaptureCplt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_DMACaptureCplt, %function
TIM_DMACaptureCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L654
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #28]
	b	.L655
.L654:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L656
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #28]
	b	.L655
.L656:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L657
	ldr	r3, [r7, #12]
	movs	r2, #4
	strb	r2, [r3, #28]
	b	.L655
.L657:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L655
	ldr	r3, [r7, #12]
	movs	r2, #8
	strb	r2, [r3, #28]
.L655:
	ldr	r0, [r7, #12]
	bl	HAL_TIM_IC_CaptureCallback
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #28]
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIM_DMACaptureCplt, .-TIM_DMACaptureCplt
	.align	1
	.global	TIM_DMACaptureHalfCplt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_DMACaptureHalfCplt, %function
TIM_DMACaptureHalfCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L659
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #28]
	b	.L660
.L659:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L661
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #28]
	b	.L660
.L661:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L662
	ldr	r3, [r7, #12]
	movs	r2, #4
	strb	r2, [r3, #28]
	b	.L660
.L662:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	.L660
	ldr	r3, [r7, #12]
	movs	r2, #8
	strb	r2, [r3, #28]
.L660:
	ldr	r0, [r7, #12]
	bl	HAL_TIM_IC_CaptureHalfCpltCallback
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #28]
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIM_DMACaptureHalfCplt, .-TIM_DMACaptureHalfCplt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_DMAPeriodElapsedCplt, %function
TIM_DMAPeriodElapsedCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r0, [r7, #12]
	bl	HAL_TIM_PeriodElapsedCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIM_DMAPeriodElapsedCplt, .-TIM_DMAPeriodElapsedCplt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_DMAPeriodElapsedHalfCplt, %function
TIM_DMAPeriodElapsedHalfCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r0, [r7, #12]
	bl	HAL_TIM_PeriodElapsedHalfCpltCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIM_DMAPeriodElapsedHalfCplt, .-TIM_DMAPeriodElapsedHalfCplt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_DMATriggerCplt, %function
TIM_DMATriggerCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r0, [r7, #12]
	bl	HAL_TIM_TriggerCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIM_DMATriggerCplt, .-TIM_DMATriggerCplt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_DMATriggerHalfCplt, %function
TIM_DMATriggerHalfCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r0, [r7, #12]
	bl	HAL_TIM_TriggerHalfCpltCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIM_DMATriggerHalfCplt, .-TIM_DMATriggerHalfCplt
	.align	1
	.global	TIM_Base_SetConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_Base_SetConfig, %function
TIM_Base_SetConfig:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r2, .L674
	cmp	r3, r2
	beq	.L668
	ldr	r3, [r7, #4]
	cmp	r3, #1073741824
	beq	.L668
	ldr	r3, [r7, #4]
	ldr	r2, .L674+4
	cmp	r3, r2
	beq	.L668
	ldr	r3, [r7, #4]
	ldr	r2, .L674+8
	cmp	r3, r2
	beq	.L668
	ldr	r3, [r7, #4]
	ldr	r2, .L674+12
	cmp	r3, r2
	beq	.L668
	ldr	r3, [r7, #4]
	ldr	r2, .L674+16
	cmp	r3, r2
	bne	.L669
.L668:
	ldr	r3, [r7, #12]
	bic	r3, r3, #112
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
.L669:
	ldr	r3, [r7, #4]
	ldr	r2, .L674
	cmp	r3, r2
	beq	.L670
	ldr	r3, [r7, #4]
	cmp	r3, #1073741824
	beq	.L670
	ldr	r3, [r7, #4]
	ldr	r2, .L674+4
	cmp	r3, r2
	beq	.L670
	ldr	r3, [r7, #4]
	ldr	r2, .L674+8
	cmp	r3, r2
	beq	.L670
	ldr	r3, [r7, #4]
	ldr	r2, .L674+12
	cmp	r3, r2
	beq	.L670
	ldr	r3, [r7, #4]
	ldr	r2, .L674+16
	cmp	r3, r2
	beq	.L670
	ldr	r3, [r7, #4]
	ldr	r2, .L674+20
	cmp	r3, r2
	beq	.L670
	ldr	r3, [r7, #4]
	ldr	r2, .L674+24
	cmp	r3, r2
	beq	.L670
	ldr	r3, [r7, #4]
	ldr	r2, .L674+28
	cmp	r3, r2
	beq	.L670
	ldr	r3, [r7, #4]
	ldr	r2, .L674+32
	cmp	r3, r2
	beq	.L670
	ldr	r3, [r7, #4]
	ldr	r2, .L674+36
	cmp	r3, r2
	beq	.L670
	ldr	r3, [r7, #4]
	ldr	r2, .L674+40
	cmp	r3, r2
	bne	.L671
.L670:
	ldr	r3, [r7, #12]
	bic	r3, r3, #768
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
.L671:
	ldr	r3, [r7, #12]
	bic	r2, r3, #128
	ldr	r3, [r7]
	ldr	r3, [r3, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3]
	ldr	r3, [r7]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	str	r2, [r3, #44]
	ldr	r3, [r7]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3, #40]
	ldr	r3, [r7, #4]
	ldr	r2, .L674
	cmp	r3, r2
	beq	.L672
	ldr	r3, [r7, #4]
	ldr	r2, .L674+16
	cmp	r3, r2
	bne	.L673
.L672:
	ldr	r3, [r7]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	str	r2, [r3, #48]
.L673:
	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3, #20]
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L675:
	.align	2
.L674:
	.word	1073807360
	.word	1073742848
	.word	1073743872
	.word	1073744896
	.word	1073808384
	.word	1073823744
	.word	1073824768
	.word	1073825792
	.word	1073747968
	.word	1073748992
	.word	1073750016
	.size	TIM_Base_SetConfig, .-TIM_Base_SetConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_OC1_SetConfig, %function
TIM_OC1_SetConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	bic	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #112
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #3
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	bic	r3, r3, #2
	str	r3, [r7, #20]
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r2, .L681
	cmp	r3, r2
	beq	.L677
	ldr	r3, [r7, #4]
	ldr	r2, .L681+4
	cmp	r3, r2
	bne	.L678
.L677:
	ldr	r3, [r7, #20]
	bic	r3, r3, #8
	str	r3, [r7, #20]
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic	r3, r3, #4
	str	r3, [r7, #20]
.L678:
	ldr	r3, [r7, #4]
	ldr	r2, .L681
	cmp	r3, r2
	beq	.L679
	ldr	r3, [r7, #4]
	ldr	r2, .L681+4
	cmp	r3, r2
	bne	.L680
.L679:
	ldr	r3, [r7, #16]
	bic	r3, r3, #256
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic	r3, r3, #512
	str	r3, [r7, #16]
	ldr	r3, [r7]
	ldr	r3, [r3, #20]
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7]
	ldr	r3, [r3, #24]
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
.L680:
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #24]
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	str	r2, [r3, #52]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #20]
	str	r2, [r3, #32]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L682:
	.align	2
.L681:
	.word	1073807360
	.word	1073808384
	.size	TIM_OC1_SetConfig, .-TIM_OC1_SetConfig
	.align	1
	.global	TIM_OC2_SetConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_OC2_SetConfig, %function
TIM_OC2_SetConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	bic	r2, r3, #16
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #28672
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #768
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r3, [r3]
	lsls	r3, r3, #8
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	bic	r3, r3, #32
	str	r3, [r7, #20]
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	lsls	r3, r3, #4
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r2, .L688
	cmp	r3, r2
	beq	.L684
	ldr	r3, [r7, #4]
	ldr	r2, .L688+4
	cmp	r3, r2
	bne	.L685
.L684:
	ldr	r3, [r7, #20]
	bic	r3, r3, #128
	str	r3, [r7, #20]
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	lsls	r3, r3, #4
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic	r3, r3, #64
	str	r3, [r7, #20]
.L685:
	ldr	r3, [r7, #4]
	ldr	r2, .L688
	cmp	r3, r2
	beq	.L686
	ldr	r3, [r7, #4]
	ldr	r2, .L688+4
	cmp	r3, r2
	bne	.L687
.L686:
	ldr	r3, [r7, #16]
	bic	r3, r3, #1024
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic	r3, r3, #2048
	str	r3, [r7, #16]
	ldr	r3, [r7]
	ldr	r3, [r3, #20]
	lsls	r3, r3, #2
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7]
	ldr	r3, [r3, #24]
	lsls	r3, r3, #2
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
.L687:
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #24]
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	str	r2, [r3, #56]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #20]
	str	r2, [r3, #32]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L689:
	.align	2
.L688:
	.word	1073807360
	.word	1073808384
	.size	TIM_OC2_SetConfig, .-TIM_OC2_SetConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_OC3_SetConfig, %function
TIM_OC3_SetConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	bic	r2, r3, #256
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #112
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #3
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	bic	r3, r3, #512
	str	r3, [r7, #20]
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	lsls	r3, r3, #8
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r2, .L695
	cmp	r3, r2
	beq	.L691
	ldr	r3, [r7, #4]
	ldr	r2, .L695+4
	cmp	r3, r2
	bne	.L692
.L691:
	ldr	r3, [r7, #20]
	bic	r3, r3, #2048
	str	r3, [r7, #20]
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	lsls	r3, r3, #8
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic	r3, r3, #1024
	str	r3, [r7, #20]
.L692:
	ldr	r3, [r7, #4]
	ldr	r2, .L695
	cmp	r3, r2
	beq	.L693
	ldr	r3, [r7, #4]
	ldr	r2, .L695+4
	cmp	r3, r2
	bne	.L694
.L693:
	ldr	r3, [r7, #16]
	bic	r3, r3, #4096
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic	r3, r3, #8192
	str	r3, [r7, #16]
	ldr	r3, [r7]
	ldr	r3, [r3, #20]
	lsls	r3, r3, #4
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7]
	ldr	r3, [r3, #24]
	lsls	r3, r3, #4
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
.L694:
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #28]
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	str	r2, [r3, #60]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #20]
	str	r2, [r3, #32]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L696:
	.align	2
.L695:
	.word	1073807360
	.word	1073808384
	.size	TIM_OC3_SetConfig, .-TIM_OC3_SetConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_OC4_SetConfig, %function
TIM_OC4_SetConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	bic	r2, r3, #4096
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #28672
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #768
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r3, [r3]
	lsls	r3, r3, #8
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #16]
	bic	r3, r3, #8192
	str	r3, [r7, #16]
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	lsls	r3, r3, #12
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r2, .L700
	cmp	r3, r2
	beq	.L698
	ldr	r3, [r7, #4]
	ldr	r2, .L700+4
	cmp	r3, r2
	bne	.L699
.L698:
	ldr	r3, [r7, #20]
	bic	r3, r3, #16384
	str	r3, [r7, #20]
	ldr	r3, [r7]
	ldr	r3, [r3, #20]
	lsls	r3, r3, #6
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
.L699:
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #20]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #28]
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	str	r2, [r3, #64]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L701:
	.align	2
.L700:
	.word	1073807360
	.word	1073808384
	.size	TIM_OC4_SetConfig, .-TIM_OC4_SetConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_SlaveTimer_SetConfig, %function
TIM_SlaveTimer_SetConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic	r3, r3, #112
	str	r3, [r7, #20]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	str	r2, [r3, #8]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	cmp	r3, #48
	beq	.L714
	cmp	r3, #48
	bhi	.L705
	cmp	r3, #16
	beq	.L714
	cmp	r3, #32
	beq	.L714
	cmp	r3, #0
	beq	.L714
	b	.L711
.L705:
	cmp	r3, #80
	beq	.L706
	cmp	r3, #80
	bhi	.L707
	cmp	r3, #64
	beq	.L708
	b	.L711
.L707:
	cmp	r3, #96
	beq	.L709
	cmp	r3, #112
	beq	.L710
	b	.L711
.L710:
	ldr	r3, [r7, #4]
	ldr	r0, [r3]
	ldr	r3, [r7]
	ldr	r1, [r3, #12]
	ldr	r3, [r7]
	ldr	r2, [r3, #8]
	ldr	r3, [r7]
	ldr	r3, [r3, #16]
	bl	TIM_ETR_SetConfig
	b	.L711
.L708:
	ldr	r3, [r7]
	ldr	r3, [r3]
	cmp	r3, #5
	bne	.L712
	movs	r3, #1
	b	.L713
.L712:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #240
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r3, [r3, #16]
	lsls	r3, r3, #4
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	str	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	b	.L711
.L706:
	ldr	r3, [r7, #4]
	ldr	r0, [r3]
	ldr	r3, [r7]
	ldr	r1, [r3, #8]
	ldr	r3, [r7]
	ldr	r3, [r3, #16]
	mov	r2, r3
	bl	TIM_TI1_ConfigInputStage
	b	.L711
.L709:
	ldr	r3, [r7, #4]
	ldr	r0, [r3]
	ldr	r3, [r7]
	ldr	r1, [r3, #8]
	ldr	r3, [r7]
	ldr	r3, [r3, #16]
	mov	r2, r3
	bl	TIM_TI2_ConfigInputStage
	b	.L711
.L714:
	nop
.L711:
	movs	r3, #0
.L713:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIM_SlaveTimer_SetConfig, .-TIM_SlaveTimer_SetConfig
	.align	1
	.global	TIM_TI1_SetConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_TI1_SetConfig, %function
TIM_TI1_SetConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic	r2, r3, #1
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #24]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, .L721
	cmp	r3, r2
	beq	.L716
	ldr	r3, [r7, #12]
	cmp	r3, #1073741824
	beq	.L716
	ldr	r3, [r7, #12]
	ldr	r2, .L721+4
	cmp	r3, r2
	beq	.L716
	ldr	r3, [r7, #12]
	ldr	r2, .L721+8
	cmp	r3, r2
	beq	.L716
	ldr	r3, [r7, #12]
	ldr	r2, .L721+12
	cmp	r3, r2
	beq	.L716
	ldr	r3, [r7, #12]
	ldr	r2, .L721+16
	cmp	r3, r2
	beq	.L716
	ldr	r3, [r7, #12]
	ldr	r2, .L721+20
	cmp	r3, r2
	beq	.L716
	ldr	r3, [r7, #12]
	ldr	r2, .L721+24
	cmp	r3, r2
	bne	.L717
.L716:
	movs	r3, #1
	b	.L718
.L717:
	movs	r3, #0
.L718:
	cmp	r3, #0
	beq	.L719
	ldr	r3, [r7, #20]
	bic	r3, r3, #3
	str	r3, [r7, #20]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	b	.L720
.L719:
	ldr	r3, [r7, #20]
	orr	r3, r3, #1
	str	r3, [r7, #20]
.L720:
	ldr	r3, [r7, #20]
	bic	r3, r3, #240
	str	r3, [r7, #20]
	ldr	r3, [r7]
	lsls	r3, r3, #4
	uxtb	r3, r3
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic	r3, r3, #10
	str	r3, [r7, #16]
	ldr	r3, [r7, #8]
	and	r3, r3, #10
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L722:
	.align	2
.L721:
	.word	1073807360
	.word	1073742848
	.word	1073743872
	.word	1073744896
	.word	1073808384
	.word	1073823744
	.word	1073747968
	.size	TIM_TI1_SetConfig, .-TIM_TI1_SetConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_TI1_ConfigInputStage, %function
TIM_TI1_ConfigInputStage:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic	r2, r3, #1
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #24]
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic	r3, r3, #240
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	bic	r3, r3, #10
	str	r3, [r7, #20]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #8]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #32]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	TIM_TI1_ConfigInputStage, .-TIM_TI1_ConfigInputStage
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_TI2_SetConfig, %function
TIM_TI2_SetConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic	r2, r3, #16
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #24]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	bic	r3, r3, #768
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #8
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic	r3, r3, #61440
	str	r3, [r7, #20]
	ldr	r3, [r7]
	lsls	r3, r3, #12
	uxth	r3, r3
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic	r3, r3, #160
	str	r3, [r7, #16]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #4
	and	r3, r3, #160
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	TIM_TI2_SetConfig, .-TIM_TI2_SetConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_TI2_ConfigInputStage, %function
TIM_TI2_ConfigInputStage:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic	r2, r3, #16
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #24]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	bic	r3, r3, #61440
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #12
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic	r3, r3, #160
	str	r3, [r7, #16]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #4
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	TIM_TI2_ConfigInputStage, .-TIM_TI2_ConfigInputStage
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_TI3_SetConfig, %function
TIM_TI3_SetConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic	r2, r3, #256
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #28]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	bic	r3, r3, #3
	str	r3, [r7, #20]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic	r3, r3, #240
	str	r3, [r7, #20]
	ldr	r3, [r7]
	lsls	r3, r3, #4
	uxtb	r3, r3
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic	r3, r3, #2560
	str	r3, [r7, #16]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #8
	and	r3, r3, #2560
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	TIM_TI3_SetConfig, .-TIM_TI3_SetConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_TI4_SetConfig, %function
TIM_TI4_SetConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic	r2, r3, #4096
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #28]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	bic	r3, r3, #768
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #8
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic	r3, r3, #61440
	str	r3, [r7, #20]
	ldr	r3, [r7]
	lsls	r3, r3, #12
	uxth	r3, r3
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic	r3, r3, #40960
	str	r3, [r7, #16]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #12
	and	r3, r3, #40960
	ldr	r2, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	TIM_TI4_SetConfig, .-TIM_TI4_SetConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_ITRx_SetConfig, %function
TIM_ITRx_SetConfig:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #112
	str	r3, [r7, #12]
	ldr	r2, [r7]
	ldr	r3, [r7, #12]
	orrs	r3, r3, r2
	orr	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #8]
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	TIM_ITRx_SetConfig, .-TIM_ITRx_SetConfig
	.align	1
	.global	TIM_ETR_SetConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_ETR_SetConfig, %function
TIM_ETR_SetConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic	r3, r3, #65280
	str	r3, [r7, #20]
	ldr	r3, [r7]
	lsls	r2, r3, #8
	ldr	r3, [r7, #4]
	orrs	r2, r2, r3
	ldr	r3, [r7, #8]
	orrs	r3, r3, r2
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #8]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	TIM_ETR_SetConfig, .-TIM_ETR_SetConfig
	.align	1
	.global	TIM_CCxChannelCmd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_CCxChannelCmd, %function
TIM_CCxChannelCmd:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #8]
	and	r3, r3, #31
	movs	r2, #1
	lsl	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #32]
	ldr	r3, [r7, #20]
	mvns	r3, r3
	ands	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #32]
	ldr	r3, [r7, #8]
	and	r3, r3, #31
	ldr	r1, [r7, #4]
	lsl	r3, r1, r3
	orrs	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	TIM_CCxChannelCmd, .-TIM_CCxChannelCmd
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
