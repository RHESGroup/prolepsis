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
	.file	"stm32f4xx_hal_exti.c"
	.text
	.align	1
	.global	HAL_EXTI_SetConfigLine
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_EXTI_SetConfigLine, %function
HAL_EXTI_SetConfigLine:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L2
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L3
.L2:
	movs	r3, #1
	b	.L4
.L3:
	ldr	r3, [r7]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3]
	ldr	r3, .L7
	ldr	r2, [r3]
	ldr	r3, [r7]
	ldr	r3, [r3]
	mvns	r3, r3
	ldr	r1, .L7
	ands	r3, r3, r2
	str	r3, [r1]
	ldr	r3, .L7
	ldr	r2, [r3, #4]
	ldr	r3, [r7]
	ldr	r3, [r3]
	mvns	r3, r3
	ldr	r1, .L7
	ands	r3, r3, r2
	str	r3, [r1, #4]
	ldr	r3, .L7
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r1, [r3]
	ldr	r3, [r7]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	orrs	r2, r2, r1
	str	r2, [r3]
	ldr	r3, .L7
	ldr	r2, [r3, #8]
	ldr	r3, [r7]
	ldr	r3, [r3]
	mvns	r3, r3
	ldr	r1, .L7
	ands	r3, r3, r2
	str	r3, [r1, #8]
	ldr	r3, .L7
	ldr	r2, [r3, #12]
	ldr	r3, [r7]
	ldr	r3, [r3]
	mvns	r3, r3
	ldr	r1, .L7
	ands	r3, r3, r2
	str	r3, [r1, #12]
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	cmp	r3, #16
	bne	.L5
	ldr	r3, .L7
	ldr	r2, [r3, #8]
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldr	r1, .L7
	orrs	r3, r3, r2
	str	r3, [r1, #8]
	ldr	r3, .L7
	ldr	r2, [r3, #12]
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldr	r1, .L7
	orrs	r3, r3, r2
	str	r3, [r1, #12]
	b	.L6
.L5:
	ldr	r3, .L7
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	ldr	r2, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r1, [r3]
	ldr	r3, [r7]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	orrs	r2, r2, r1
	str	r2, [r3]
.L6:
	movs	r3, #0
.L4:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	1073822720
	.size	HAL_EXTI_SetConfigLine, .-HAL_EXTI_SetConfigLine
	.align	1
	.global	HAL_EXTI_GetConfigLine
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_EXTI_GetConfigLine, %function
HAL_EXTI_GetConfigLine:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L11
.L10:
	movs	r3, #1
	b	.L12
.L11:
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7]
	str	r2, [r3]
	ldr	r3, .L21
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L13
	ldr	r3, [r7]
	movs	r2, #0
	str	r2, [r3, #4]
	b	.L14
.L13:
	ldr	r3, .L21
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L15
	ldr	r3, [r7]
	movs	r2, #4
	str	r2, [r3, #4]
	b	.L14
.L15:
	ldr	r3, [r7]
	movs	r2, #11
	str	r2, [r3, #4]
.L14:
	ldr	r3, .L21
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L16
	ldr	r3, .L21
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L17
	ldr	r3, [r7]
	movs	r2, #16
	str	r2, [r3, #8]
	b	.L19
.L17:
	ldr	r3, [r7]
	movs	r2, #8
	str	r2, [r3, #8]
	b	.L19
.L16:
	ldr	r3, .L21
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L20
	ldr	r3, [r7]
	movs	r2, #12
	str	r2, [r3, #8]
	b	.L19
.L20:
	ldr	r3, [r7]
	movs	r2, #0
	str	r2, [r3, #8]
.L19:
	movs	r3, #0
.L12:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	1073822720
	.size	HAL_EXTI_GetConfigLine, .-HAL_EXTI_GetConfigLine
	.align	1
	.global	HAL_EXTI_ClearConfigLine
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_EXTI_ClearConfigLine, %function
HAL_EXTI_ClearConfigLine:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L24
	movs	r3, #1
	b	.L25
.L24:
	ldr	r3, .L26
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvns	r3, r3
	ldr	r1, .L26
	ands	r3, r3, r2
	str	r3, [r1]
	ldr	r3, .L26
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvns	r3, r3
	ldr	r1, .L26
	ands	r3, r3, r2
	str	r3, [r1, #4]
	ldr	r3, .L26
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvns	r3, r3
	ldr	r1, .L26
	ands	r3, r3, r2
	str	r3, [r1, #8]
	ldr	r3, .L26
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvns	r3, r3
	ldr	r1, .L26
	ands	r3, r3, r2
	str	r3, [r1, #12]
	movs	r3, #0
.L25:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L27:
	.align	2
.L26:
	.word	1073822720
	.size	HAL_EXTI_ClearConfigLine, .-HAL_EXTI_ClearConfigLine
	.align	1
	.global	HAL_EXTI_RegisterCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_EXTI_RegisterCallback, %function
HAL_EXTI_RegisterCallback:
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
	ldrb	r3, [r7, #11]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L33
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #4]
	b	.L31
.L33:
	movs	r3, #1
	strb	r3, [r7, #23]
	nop
.L31:
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_EXTI_RegisterCallback, .-HAL_EXTI_RegisterCallback
	.align	1
	.global	HAL_EXTI_GetHandle
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_EXTI_GetHandle, %function
HAL_EXTI_GetHandle:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L35
	movs	r3, #1
	b	.L36
.L35:
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3]
	movs	r3, #0
.L36:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_EXTI_GetHandle, .-HAL_EXTI_GetHandle
	.align	1
	.global	HAL_EXTI_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_EXTI_IRQHandler, %function
HAL_EXTI_IRQHandler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L40
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L39
	ldr	r2, .L40
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r2, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L39
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	blx	r3
.L39:
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L41:
	.align	2
.L40:
	.word	1073822720
	.size	HAL_EXTI_IRQHandler, .-HAL_EXTI_IRQHandler
	.align	1
	.global	HAL_EXTI_GetPending
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_EXTI_GetPending, %function
HAL_EXTI_GetPending:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, .L45
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ands	r3, r3, r2
	ldr	r2, [r7, #4]
	ldr	r2, [r2]
	str	r2, [r7, #12]
	ldr	r2, [r7, #12]
	.syntax unified
@ 988 "../Drivers/CMSIS/Include/cmsis_gcc.h" 1
	rbit r2, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r2, [r7, #8]
	ldr	r2, [r7, #8]
	clz	r2, r2
	uxtb	r2, r2
	lsrs	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L46:
	.align	2
.L45:
	.word	1073822740
	.size	HAL_EXTI_GetPending, .-HAL_EXTI_GetPending
	.align	1
	.global	HAL_EXTI_ClearPending
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_EXTI_ClearPending, %function
HAL_EXTI_ClearPending:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r2, .L48
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r2, #20]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L49:
	.align	2
.L48:
	.word	1073822720
	.size	HAL_EXTI_ClearPending, .-HAL_EXTI_ClearPending
	.align	1
	.global	HAL_EXTI_GenerateSWI
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_EXTI_GenerateSWI, %function
HAL_EXTI_GenerateSWI:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r2, .L51
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r2, #16]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L52:
	.align	2
.L51:
	.word	1073822720
	.size	HAL_EXTI_GenerateSWI, .-HAL_EXTI_GenerateSWI
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
