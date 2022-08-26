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
	.file	"stm32f4xx_hal_tim_ex.c"
	.text
	.align	1
	.global	HAL_TIMEx_HallSensor_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_HallSensor_Init, %function
HAL_TIMEx_HallSensor_Init:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #40
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L2
	movs	r3, #1
	b	.L5
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
	bl	HAL_TIMEx_HallSensor_MspInit
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
	bl	TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r0, [r3]
	ldr	r3, [r7]
	ldr	r1, [r3]
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	movs	r2, #3
	bl	TIM_TI1_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #12
	str	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r1, [r3, #24]
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #112
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #64
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #7
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #8]
	movs	r3, #0
	str	r3, [r7, #28]
	movs	r3, #0
	str	r3, [r7, #32]
	movs	r3, #112
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #36]
	movs	r3, #0
	str	r3, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	add	r2, r7, #12
	mov	r1, r2
	mov	r0, r3
	bl	TIM_OC2_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #112
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #80
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
.L5:
	mov	r0, r3
	adds	r7, r7, #40
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_HallSensor_Init, .-HAL_TIMEx_HallSensor_Init
	.align	1
	.global	HAL_TIMEx_HallSensor_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_HallSensor_DeInit, %function
HAL_TIMEx_HallSensor_DeInit:
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
	bne	.L7
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L7
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L7:
	ldr	r0, [r7, #4]
	bl	HAL_TIMEx_HallSensor_MspDeInit
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
	.size	HAL_TIMEx_HallSensor_DeInit, .-HAL_TIMEx_HallSensor_DeInit
	.align	1
	.weak	HAL_TIMEx_HallSensor_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_HallSensor_MspInit, %function
HAL_TIMEx_HallSensor_MspInit:
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
	.size	HAL_TIMEx_HallSensor_MspInit, .-HAL_TIMEx_HallSensor_MspInit
	.align	1
	.weak	HAL_TIMEx_HallSensor_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_HallSensor_MspDeInit, %function
HAL_TIMEx_HallSensor_MspDeInit:
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
	.size	HAL_TIMEx_HallSensor_MspDeInit, .-HAL_TIMEx_HallSensor_MspDeInit
	.align	1
	.global	HAL_TIMEx_HallSensor_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_HallSensor_Start, %function
HAL_TIMEx_HallSensor_Start:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L12
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L12:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_HallSensor_Start, .-HAL_TIMEx_HallSensor_Start
	.align	1
	.global	HAL_TIMEx_HallSensor_Stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_HallSensor_Stop, %function
HAL_TIMEx_HallSensor_Stop:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L15
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L15
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L15:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_HallSensor_Stop, .-HAL_TIMEx_HallSensor_Stop
	.align	1
	.global	HAL_TIMEx_HallSensor_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_HallSensor_Start_IT, %function
HAL_TIMEx_HallSensor_Start_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L18
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L18:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_HallSensor_Start_IT, .-HAL_TIMEx_HallSensor_Start_IT
	.align	1
	.global	HAL_TIMEx_HallSensor_Stop_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_HallSensor_Stop_IT, %function
HAL_TIMEx_HallSensor_Stop_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
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
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L21
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L21
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L21:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_HallSensor_Stop_IT, .-HAL_TIMEx_HallSensor_Stop_IT
	.align	1
	.global	HAL_TIMEx_HallSensor_Start_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_HallSensor_Start_DMA, %function
HAL_TIMEx_HallSensor_Start_DMA:
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
	bne	.L24
	movs	r3, #2
	b	.L25
.L24:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L26
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	.L27
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	beq	.L27
	movs	r3, #1
	b	.L25
.L27:
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
.L26:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl	TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L30
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L30+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L30+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #52
	mov	r1, r3
	ldr	r2, [r7, #8]
	ldrh	r3, [r7, #6]
	bl	HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L28
	movs	r3, #1
	b	.L25
.L28:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq	.L29
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L29:
	movs	r3, #0
.L25:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L31:
	.align	2
.L30:
	.word	TIM_DMACaptureCplt
	.word	TIM_DMACaptureHalfCplt
	.word	TIM_DMAError
	.size	HAL_TIMEx_HallSensor_Start_DMA, .-HAL_TIMEx_HallSensor_Start_DMA
	.align	1
	.global	HAL_TIMEx_HallSensor_Stop_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_HallSensor_Stop_DMA, %function
HAL_TIMEx_HallSensor_Stop_DMA:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
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
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L33
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L33
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L33:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_HallSensor_Stop_DMA, .-HAL_TIMEx_HallSensor_Stop_DMA
	.align	1
	.global	HAL_TIMEx_OCN_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_OCN_Start, %function
HAL_TIMEx_OCN_Start:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #4
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L36
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L36:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_OCN_Start, .-HAL_TIMEx_OCN_Start
	.align	1
	.global	HAL_TIMEx_OCN_Stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_OCN_Stop, %function
HAL_TIMEx_OCN_Stop:
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
	bl	TIM_CCxNChannelCmd
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
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L39:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L40
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L40
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L40:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_OCN_Stop, .-HAL_TIMEx_OCN_Stop
	.align	1
	.global	HAL_TIMEx_OCN_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_OCN_Start_IT, %function
HAL_TIMEx_OCN_Start_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #4
	beq	.L44
	cmp	r3, #8
	beq	.L45
	cmp	r3, #0
	beq	.L46
	b	.L47
.L46:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #12]
	b	.L47
.L44:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #12]
	b	.L47
.L45:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3, #12]
	nop
.L47:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #4
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
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
	.size	HAL_TIMEx_OCN_Start_IT, .-HAL_TIMEx_OCN_Start_IT
	.align	1
	.global	HAL_TIMEx_OCN_Stop_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_OCN_Stop_IT, %function
HAL_TIMEx_OCN_Stop_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #4
	beq	.L52
	cmp	r3, #8
	beq	.L53
	cmp	r3, #0
	beq	.L54
	b	.L55
.L54:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3, #12]
	b	.L55
.L52:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #12]
	b	.L55
.L53:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3, #12]
	nop
.L55:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #32]
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L56
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #12]
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
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L57:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L58
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L58
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L58:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_OCN_Stop_IT, .-HAL_TIMEx_OCN_Stop_IT
	.align	1
	.global	HAL_TIMEx_OCN_Start_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_OCN_Start_DMA, %function
HAL_TIMEx_OCN_Start_DMA:
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
	bne	.L61
	movs	r3, #2
	b	.L62
.L61:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L63
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L64
	ldrh	r3, [r7, #2]
	cmp	r3, #0
	beq	.L64
	movs	r3, #1
	b	.L62
.L64:
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
.L63:
	ldr	r3, [r7, #8]
	cmp	r3, #4
	beq	.L66
	cmp	r3, #8
	beq	.L67
	cmp	r3, #0
	beq	.L68
	b	.L70
.L68:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L74
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L74+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L74+8
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
	beq	.L69
	movs	r3, #1
	b	.L62
.L69:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3, #12]
	b	.L70
.L66:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L74
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L74+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L74+8
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
	beq	.L71
	movs	r3, #1
	b	.L62
.L71:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3, #12]
	b	.L70
.L67:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L74
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L74+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L74+8
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
	beq	.L72
	movs	r3, #1
	b	.L62
.L72:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3, #12]
	nop
.L70:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r2, #4
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq	.L73
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L73:
	movs	r3, #0
.L62:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L75:
	.align	2
.L74:
	.word	TIM_DMADelayPulseCplt
	.word	TIM_DMADelayPulseHalfCplt
	.word	TIM_DMAError
	.size	HAL_TIMEx_OCN_Start_DMA, .-HAL_TIMEx_OCN_Start_DMA
	.align	1
	.global	HAL_TIMEx_OCN_Stop_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_OCN_Stop_DMA, %function
HAL_TIMEx_OCN_Stop_DMA:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #4
	beq	.L78
	cmp	r3, #8
	beq	.L79
	cmp	r3, #0
	beq	.L80
	b	.L81
.L80:
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
	b	.L81
.L78:
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
	b	.L81
.L79:
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
	nop
.L81:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L82
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L82
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L82:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L83
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L83
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L83:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_OCN_Stop_DMA, .-HAL_TIMEx_OCN_Stop_DMA
	.align	1
	.global	HAL_TIMEx_PWMN_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_PWMN_Start, %function
HAL_TIMEx_PWMN_Start:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #4
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L86
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L86:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_PWMN_Start, .-HAL_TIMEx_PWMN_Start
	.align	1
	.global	HAL_TIMEx_PWMN_Stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_PWMN_Stop, %function
HAL_TIMEx_PWMN_Stop:
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
	bl	TIM_CCxNChannelCmd
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
	.size	HAL_TIMEx_PWMN_Stop, .-HAL_TIMEx_PWMN_Stop
	.align	1
	.global	HAL_TIMEx_PWMN_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_PWMN_Start_IT, %function
HAL_TIMEx_PWMN_Start_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #4
	beq	.L94
	cmp	r3, #8
	beq	.L95
	cmp	r3, #0
	beq	.L96
	b	.L97
.L96:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #12]
	b	.L97
.L94:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #12]
	b	.L97
.L95:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3, #12]
	nop
.L97:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #4
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq	.L98
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L98:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_PWMN_Start_IT, .-HAL_TIMEx_PWMN_Start_IT
	.align	1
	.global	HAL_TIMEx_PWMN_Stop_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_PWMN_Stop_IT, %function
HAL_TIMEx_PWMN_Stop_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #4
	beq	.L102
	cmp	r3, #8
	beq	.L103
	cmp	r3, #0
	beq	.L104
	b	.L105
.L104:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3, #12]
	b	.L105
.L102:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #12]
	b	.L105
.L103:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3, #12]
	nop
.L105:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #32]
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L106
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #12]
.L106:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L107
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L107
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L107:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L108
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L108
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L108:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_PWMN_Stop_IT, .-HAL_TIMEx_PWMN_Stop_IT
	.align	1
	.global	HAL_TIMEx_PWMN_Start_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_PWMN_Start_DMA, %function
HAL_TIMEx_PWMN_Start_DMA:
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
	bne	.L111
	movs	r3, #2
	b	.L112
.L111:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #61]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L113
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L114
	ldrh	r3, [r7, #2]
	cmp	r3, #0
	beq	.L114
	movs	r3, #1
	b	.L112
.L114:
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #61]
.L113:
	ldr	r3, [r7, #8]
	cmp	r3, #4
	beq	.L116
	cmp	r3, #8
	beq	.L117
	cmp	r3, #0
	beq	.L118
	b	.L120
.L118:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L124
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L124+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]
	ldr	r2, .L124+8
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
	beq	.L119
	movs	r3, #1
	b	.L112
.L119:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3, #12]
	b	.L120
.L116:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L124
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L124+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	ldr	r2, .L124+8
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
	beq	.L121
	movs	r3, #1
	b	.L112
.L121:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3, #12]
	b	.L120
.L117:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L124
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L124+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]
	ldr	r2, .L124+8
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
	beq	.L122
	movs	r3, #1
	b	.L112
.L122:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3, #12]
	nop
.L120:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	movs	r2, #4
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	and	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq	.L123
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
.L123:
	movs	r3, #0
.L112:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L125:
	.align	2
.L124:
	.word	TIM_DMADelayPulseCplt
	.word	TIM_DMADelayPulseHalfCplt
	.word	TIM_DMAError
	.size	HAL_TIMEx_PWMN_Start_DMA, .-HAL_TIMEx_PWMN_Start_DMA
	.align	1
	.global	HAL_TIMEx_PWMN_Stop_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_PWMN_Stop_DMA, %function
HAL_TIMEx_PWMN_Stop_DMA:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #4
	beq	.L128
	cmp	r3, #8
	beq	.L129
	cmp	r3, #0
	beq	.L130
	b	.L131
.L130:
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
	b	.L131
.L128:
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
	b	.L131
.L129:
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
	nop
.L131:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #0
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L132
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L132
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L132:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L133
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L133
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L133:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_PWMN_Stop_DMA, .-HAL_TIMEx_PWMN_Stop_DMA
	.align	1
	.global	HAL_TIMEx_OnePulseN_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_OnePulseN_Start, %function
HAL_TIMEx_OnePulseN_Start:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #4
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_OnePulseN_Start, .-HAL_TIMEx_OnePulseN_Start
	.align	1
	.global	HAL_TIMEx_OnePulseN_Stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_OnePulseN_Stop, %function
HAL_TIMEx_OnePulseN_Stop:
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
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L138
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L138
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L138:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L139
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L139
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L139:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_OnePulseN_Stop, .-HAL_TIMEx_OnePulseN_Stop
	.align	1
	.global	HAL_TIMEx_OnePulseN_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_OnePulseN_Start_IT, %function
HAL_TIMEx_OnePulseN_Start_IT:
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
	movs	r2, #4
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #68]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_OnePulseN_Start_IT, .-HAL_TIMEx_OnePulseN_Start_IT
	.align	1
	.global	HAL_TIMEx_OnePulseN_Stop_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_OnePulseN_Stop_IT, %function
HAL_TIMEx_OnePulseN_Stop_IT:
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
	ldr	r1, [r7]
	mov	r0, r3
	bl	TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L144
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L144
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #68]
.L144:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #4369
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L145
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	movw	r3, #1092
	ands	r3, r3, r2
	cmp	r3, #0
	bne	.L145
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
.L145:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_TIMEx_OnePulseN_Stop_IT, .-HAL_TIMEx_OnePulseN_Stop_IT
	.align	1
	.global	HAL_TIMEx_ConfigCommutEvent
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_ConfigCommutEvent, %function
HAL_TIMEx_ConfigCommutEvent:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L148
	movs	r3, #2
	b	.L149
.L148:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L150
	ldr	r3, [r7, #8]
	cmp	r3, #16
	beq	.L150
	ldr	r3, [r7, #8]
	cmp	r3, #32
	beq	.L150
	ldr	r3, [r7, #8]
	cmp	r3, #48
	bne	.L151
.L150:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #112
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	orrs	r2, r2, r1
	str	r2, [r3, #8]
.L151:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	orrs	r2, r2, r1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #32
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L149:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIMEx_ConfigCommutEvent, .-HAL_TIMEx_ConfigCommutEvent
	.align	1
	.global	HAL_TIMEx_ConfigCommutEvent_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_ConfigCommutEvent_IT, %function
HAL_TIMEx_ConfigCommutEvent_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L153
	movs	r3, #2
	b	.L154
.L153:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L155
	ldr	r3, [r7, #8]
	cmp	r3, #16
	beq	.L155
	ldr	r3, [r7, #8]
	cmp	r3, #32
	beq	.L155
	ldr	r3, [r7, #8]
	cmp	r3, #48
	bne	.L156
.L155:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #112
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	orrs	r2, r2, r1
	str	r2, [r3, #8]
.L156:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	orrs	r2, r2, r1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #32
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L154:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIMEx_ConfigCommutEvent_IT, .-HAL_TIMEx_ConfigCommutEvent_IT
	.align	1
	.global	HAL_TIMEx_ConfigCommutEvent_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_ConfigCommutEvent_DMA, %function
HAL_TIMEx_ConfigCommutEvent_DMA:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L158
	movs	r3, #2
	b	.L159
.L158:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L160
	ldr	r3, [r7, #8]
	cmp	r3, #16
	beq	.L160
	ldr	r3, [r7, #8]
	cmp	r3, #32
	beq	.L160
	ldr	r3, [r7, #8]
	cmp	r3, #48
	bne	.L161
.L160:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #112
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	orrs	r2, r2, r1
	str	r2, [r3, #8]
.L161:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	orrs	r2, r2, r1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L162
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L162+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L162+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #32
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L159:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L163:
	.align	2
.L162:
	.word	TIMEx_DMACommutationCplt
	.word	TIMEx_DMACommutationHalfCplt
	.word	TIM_DMAError
	.size	HAL_TIMEx_ConfigCommutEvent_DMA, .-HAL_TIMEx_ConfigCommutEvent_DMA
	.align	1
	.global	HAL_TIMEx_MasterConfigSynchronization
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_MasterConfigSynchronization, %function
HAL_TIMEx_MasterConfigSynchronization:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L165
	movs	r3, #2
	b	.L166
.L165:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	bic	r3, r3, #112
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	bic	r3, r3, #128
	str	r3, [r7, #8]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #8]
	orrs	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #61]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L166:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIMEx_MasterConfigSynchronization, .-HAL_TIMEx_MasterConfigSynchronization
	.align	1
	.global	HAL_TIMEx_ConfigBreakDeadTime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_ConfigBreakDeadTime, %function
HAL_TIMEx_ConfigBreakDeadTime:
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
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L168
	movs	r3, #2
	b	.L169
.L168:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #12]
	bic	r2, r3, #255
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r2, r3, #768
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r2, r3, #1024
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r2, r3, #2048
	ldr	r3, [r7]
	ldr	r3, [r3]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r2, r3, #4096
	ldr	r3, [r7]
	ldr	r3, [r3, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r2, r3, #8192
	ldr	r3, [r7]
	ldr	r3, [r3, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r2, r3, #16384
	ldr	r3, [r7]
	ldr	r3, [r3, #28]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	str	r2, [r3, #68]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L169:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIMEx_ConfigBreakDeadTime, .-HAL_TIMEx_ConfigBreakDeadTime
	.align	1
	.global	HAL_TIMEx_RemapConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_RemapConfig, %function
HAL_TIMEx_RemapConfig:
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
	bne	.L171
	movs	r3, #2
	b	.L172
.L171:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #60]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7]
	str	r2, [r3, #80]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #60]
	movs	r3, #0
.L172:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_TIMEx_RemapConfig, .-HAL_TIMEx_RemapConfig
	.align	1
	.weak	HAL_TIMEx_CommutCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_CommutCallback, %function
HAL_TIMEx_CommutCallback:
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
	.size	HAL_TIMEx_CommutCallback, .-HAL_TIMEx_CommutCallback
	.align	1
	.weak	HAL_TIMEx_CommutHalfCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_CommutHalfCpltCallback, %function
HAL_TIMEx_CommutHalfCpltCallback:
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
	.size	HAL_TIMEx_CommutHalfCpltCallback, .-HAL_TIMEx_CommutHalfCpltCallback
	.align	1
	.weak	HAL_TIMEx_BreakCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_BreakCallback, %function
HAL_TIMEx_BreakCallback:
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
	.size	HAL_TIMEx_BreakCallback, .-HAL_TIMEx_BreakCallback
	.align	1
	.global	HAL_TIMEx_HallSensor_GetState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIMEx_HallSensor_GetState, %function
HAL_TIMEx_HallSensor_GetState:
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
	.size	HAL_TIMEx_HallSensor_GetState, .-HAL_TIMEx_HallSensor_GetState
	.align	1
	.global	TIMEx_DMACommutationCplt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIMEx_DMACommutationCplt, %function
TIMEx_DMACommutationCplt:
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
	bl	HAL_TIMEx_CommutCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIMEx_DMACommutationCplt, .-TIMEx_DMACommutationCplt
	.align	1
	.global	TIMEx_DMACommutationHalfCplt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIMEx_DMACommutationHalfCplt, %function
TIMEx_DMACommutationHalfCplt:
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
	bl	HAL_TIMEx_CommutHalfCpltCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	TIMEx_DMACommutationHalfCplt, .-TIMEx_DMACommutationHalfCplt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM_CCxNChannelCmd, %function
TIM_CCxNChannelCmd:
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
	movs	r2, #4
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
	.size	TIM_CCxNChannelCmd, .-TIM_CCxNChannelCmd
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
