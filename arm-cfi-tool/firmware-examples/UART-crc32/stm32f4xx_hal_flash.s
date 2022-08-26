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
	.file	"stm32f4xx_hal_flash.c"
	.text
	.comm	pFlash,32,4
	.align	1
	.global	HAL_FLASH_Program
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASH_Program, %function
HAL_FLASH_Program:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	strd	r2, [r7]
	movs	r3, #1
	strb	r3, [r7, #23]
	ldr	r3, .L9
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L2
	movs	r3, #2
	b	.L3
.L2:
	ldr	r3, .L9
	movs	r2, #1
	strb	r2, [r3, #24]
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L5
	ldrb	r3, [r7]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [r7, #8]
	bl	FLASH_Program_Byte
	b	.L6
.L5:
	ldr	r3, [r7, #12]
	cmp	r3, #1
	bne	.L7
	ldrh	r3, [r7]
	mov	r1, r3
	ldr	r0, [r7, #8]
	bl	FLASH_Program_HalfWord
	b	.L6
.L7:
	ldr	r3, [r7, #12]
	cmp	r3, #2
	bne	.L8
	ldr	r3, [r7]
	mov	r1, r3
	ldr	r0, [r7, #8]
	bl	FLASH_Program_Word
	b	.L6
.L8:
	ldrd	r2, [r7]
	ldr	r0, [r7, #8]
	bl	FLASH_Program_DoubleWord
.L6:
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #23]
	ldr	r3, .L9+4
	ldr	r3, [r3, #16]
	ldr	r2, .L9+4
	bic	r3, r3, #1
	str	r3, [r2, #16]
.L4:
	ldr	r3, .L9
	movs	r2, #0
	strb	r2, [r3, #24]
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
.L3:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
	.word	pFlash
	.word	1073888256
	.size	HAL_FLASH_Program, .-HAL_FLASH_Program
	.align	1
	.global	HAL_FLASH_Program_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASH_Program_IT, %function
HAL_FLASH_Program_IT:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	strd	r2, [r7]
	movs	r3, #0
	strb	r3, [r7, #23]
	ldr	r3, .L18
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L12
	movs	r3, #2
	b	.L13
.L12:
	ldr	r3, .L18
	movs	r2, #1
	strb	r2, [r3, #24]
	ldr	r3, .L18+4
	ldr	r3, [r3, #16]
	ldr	r2, .L18+4
	orr	r3, r3, #16777216
	str	r3, [r2, #16]
	ldr	r3, .L18+4
	ldr	r3, [r3, #16]
	ldr	r2, .L18+4
	orr	r3, r3, #33554432
	str	r3, [r2, #16]
	ldr	r3, .L18
	movs	r2, #3
	strb	r2, [r3]
	ldr	r2, .L18
	ldr	r3, [r7, #8]
	str	r3, [r2, #20]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L14
	ldrb	r3, [r7]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [r7, #8]
	bl	FLASH_Program_Byte
	b	.L15
.L14:
	ldr	r3, [r7, #12]
	cmp	r3, #1
	bne	.L16
	ldrh	r3, [r7]
	mov	r1, r3
	ldr	r0, [r7, #8]
	bl	FLASH_Program_HalfWord
	b	.L15
.L16:
	ldr	r3, [r7, #12]
	cmp	r3, #2
	bne	.L17
	ldr	r3, [r7]
	mov	r1, r3
	ldr	r0, [r7, #8]
	bl	FLASH_Program_Word
	b	.L15
.L17:
	ldrd	r2, [r7]
	ldr	r0, [r7, #8]
	bl	FLASH_Program_DoubleWord
.L15:
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
.L13:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L19:
	.align	2
.L18:
	.word	pFlash
	.word	1073888256
	.size	HAL_FLASH_Program_IT, .-HAL_FLASH_Program_IT
	.align	1
	.global	HAL_FLASH_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASH_IRQHandler, %function
HAL_FLASH_IRQHandler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, .L33
	ldr	r3, [r3, #12]
	and	r3, r3, #498
	cmp	r3, #0
	beq	.L21
	ldr	r3, .L33+4
	ldrb	r3, [r3]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L22
	ldr	r3, .L33+4
	ldr	r3, [r3, #12]
	str	r3, [r7, #4]
	ldr	r3, .L33+4
	mov	r2, #-1
	str	r2, [r3, #12]
	b	.L23
.L22:
	ldr	r3, .L33+4
	ldrb	r3, [r3]
	uxtb	r3, r3
	cmp	r3, #2
	bne	.L24
	ldr	r3, .L33+4
	ldr	r3, [r3, #16]
	str	r3, [r7, #4]
	b	.L23
.L24:
	ldr	r3, .L33+4
	ldr	r3, [r3, #20]
	str	r3, [r7, #4]
.L23:
	bl	FLASH_SetErrorCode
	ldr	r0, [r7, #4]
	bl	HAL_FLASH_OperationErrorCallback
	ldr	r3, .L33+4
	movs	r2, #0
	strb	r2, [r3]
.L21:
	ldr	r3, .L33
	ldr	r3, [r3, #12]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L25
	ldr	r3, .L33
	movs	r2, #1
	str	r2, [r3, #12]
	ldr	r3, .L33+4
	ldrb	r3, [r3]
	uxtb	r3, r3
	cmp	r3, #1
	bne	.L26
	ldr	r3, .L33+4
	ldr	r3, [r3, #4]
	subs	r3, r3, #1
	ldr	r2, .L33+4
	str	r3, [r2, #4]
	ldr	r3, .L33+4
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L27
	ldr	r3, .L33+4
	ldr	r3, [r3, #12]
	str	r3, [r7, #4]
	ldr	r0, [r7, #4]
	bl	HAL_FLASH_EndOfOperationCallback
	ldr	r3, .L33+4
	ldr	r3, [r3, #12]
	adds	r3, r3, #1
	ldr	r2, .L33+4
	str	r3, [r2, #12]
	ldr	r3, .L33+4
	ldr	r3, [r3, #12]
	str	r3, [r7, #4]
	ldr	r3, .L33+4
	ldrb	r3, [r3, #8]
	uxtb	r3, r3
	mov	r1, r3
	ldr	r0, [r7, #4]
	bl	FLASH_Erase_Sector
	b	.L25
.L27:
	mov	r3, #-1
	str	r3, [r7, #4]
	ldr	r2, .L33+4
	ldr	r3, [r7, #4]
	str	r3, [r2, #12]
	ldr	r3, .L33+4
	movs	r2, #0
	strb	r2, [r3]
	bl	FLASH_FlushCaches
	ldr	r0, [r7, #4]
	bl	HAL_FLASH_EndOfOperationCallback
	b	.L25
.L26:
	ldr	r3, .L33+4
	ldrb	r3, [r3]
	uxtb	r3, r3
	cmp	r3, #2
	bne	.L29
	bl	FLASH_FlushCaches
	ldr	r3, .L33+4
	ldr	r3, [r3, #16]
	mov	r0, r3
	bl	HAL_FLASH_EndOfOperationCallback
	b	.L30
.L29:
	ldr	r3, .L33+4
	ldr	r3, [r3, #20]
	mov	r0, r3
	bl	HAL_FLASH_EndOfOperationCallback
.L30:
	ldr	r3, .L33+4
	movs	r2, #0
	strb	r2, [r3]
.L25:
	ldr	r3, .L33+4
	ldrb	r3, [r3]
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L32
	ldr	r3, .L33
	ldr	r3, [r3, #16]
	ldr	r2, .L33
	bic	r3, r3, #32768
	bic	r3, r3, #255
	str	r3, [r2, #16]
	ldr	r3, .L33
	ldr	r3, [r3, #16]
	ldr	r2, .L33
	bic	r3, r3, #16777216
	str	r3, [r2, #16]
	ldr	r3, .L33
	ldr	r3, [r3, #16]
	ldr	r2, .L33
	bic	r3, r3, #33554432
	str	r3, [r2, #16]
	ldr	r3, .L33+4
	movs	r2, #0
	strb	r2, [r3, #24]
.L32:
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L34:
	.align	2
.L33:
	.word	1073888256
	.word	pFlash
	.size	HAL_FLASH_IRQHandler, .-HAL_FLASH_IRQHandler
	.align	1
	.weak	HAL_FLASH_EndOfOperationCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASH_EndOfOperationCallback, %function
HAL_FLASH_EndOfOperationCallback:
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
	.size	HAL_FLASH_EndOfOperationCallback, .-HAL_FLASH_EndOfOperationCallback
	.align	1
	.weak	HAL_FLASH_OperationErrorCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASH_OperationErrorCallback, %function
HAL_FLASH_OperationErrorCallback:
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
	.size	HAL_FLASH_OperationErrorCallback, .-HAL_FLASH_OperationErrorCallback
	.align	1
	.global	HAL_FLASH_Unlock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASH_Unlock, %function
HAL_FLASH_Unlock:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #0
	strb	r3, [r7, #7]
	ldr	r3, .L40
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bge	.L38
	ldr	r3, .L40
	ldr	r2, .L40+4
	str	r2, [r3, #4]
	ldr	r3, .L40
	ldr	r2, .L40+8
	str	r2, [r3, #4]
	ldr	r3, .L40
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bge	.L38
	movs	r3, #1
	strb	r3, [r7, #7]
.L38:
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L41:
	.align	2
.L40:
	.word	1073888256
	.word	1164378403
	.word	-839939669
	.size	HAL_FLASH_Unlock, .-HAL_FLASH_Unlock
	.align	1
	.global	HAL_FLASH_Lock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASH_Lock, %function
HAL_FLASH_Lock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L44
	ldr	r3, [r3, #16]
	ldr	r2, .L44
	orr	r3, r3, #-2147483648
	str	r3, [r2, #16]
	movs	r3, #0
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L45:
	.align	2
.L44:
	.word	1073888256
	.size	HAL_FLASH_Lock, .-HAL_FLASH_Lock
	.align	1
	.global	HAL_FLASH_OB_Unlock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASH_OB_Unlock, %function
HAL_FLASH_OB_Unlock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L50
	ldr	r3, [r3, #20]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L47
	ldr	r3, .L50
	ldr	r2, .L50+4
	str	r2, [r3, #8]
	ldr	r3, .L50
	ldr	r2, .L50+8
	str	r2, [r3, #8]
	movs	r3, #0
	b	.L49
.L47:
	movs	r3, #1
.L49:
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L51:
	.align	2
.L50:
	.word	1073888256
	.word	135866939
	.word	1281191551
	.size	HAL_FLASH_OB_Unlock, .-HAL_FLASH_OB_Unlock
	.align	1
	.global	HAL_FLASH_OB_Lock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASH_OB_Lock, %function
HAL_FLASH_OB_Lock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L54
	ldr	r3, [r3, #20]
	ldr	r2, .L54
	orr	r3, r3, #1
	str	r3, [r2, #20]
	movs	r3, #0
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L55:
	.align	2
.L54:
	.word	1073888256
	.size	HAL_FLASH_OB_Lock, .-HAL_FLASH_OB_Lock
	.align	1
	.global	HAL_FLASH_OB_Launch
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASH_OB_Launch, %function
HAL_FLASH_OB_Launch:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L58
	ldrb	r3, [r3]
	uxtb	r3, r3
	ldr	r2, .L58
	orr	r3, r3, #2
	uxtb	r3, r3
	strb	r3, [r2]
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	mov	r0, r3
	pop	{r7, pc}
.L59:
	.align	2
.L58:
	.word	1073888276
	.size	HAL_FLASH_OB_Launch, .-HAL_FLASH_OB_Launch
	.align	1
	.global	HAL_FLASH_GetError
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASH_GetError, %function
HAL_FLASH_GetError:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L62
	ldr	r3, [r3, #28]
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L63:
	.align	2
.L62:
	.word	pFlash
	.size	HAL_FLASH_GetError, .-HAL_FLASH_GetError
	.align	1
	.global	FLASH_WaitForLastOperation
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_WaitForLastOperation, %function
FLASH_WaitForLastOperation:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, .L71
	movs	r2, #0
	str	r2, [r3, #28]
	bl	HAL_GetTick
	str	r0, [r7, #12]
	b	.L65
.L68:
	ldr	r3, [r7, #4]
	cmp	r3, #-1
	beq	.L65
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L66
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bcs	.L65
.L66:
	movs	r3, #3
	b	.L67
.L65:
	ldr	r3, .L71+4
	ldr	r3, [r3, #12]
	and	r3, r3, #65536
	cmp	r3, #0
	bne	.L68
	ldr	r3, .L71+4
	ldr	r3, [r3, #12]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L69
	ldr	r3, .L71+4
	movs	r2, #1
	str	r2, [r3, #12]
.L69:
	ldr	r3, .L71+4
	ldr	r3, [r3, #12]
	and	r3, r3, #498
	cmp	r3, #0
	beq	.L70
	bl	FLASH_SetErrorCode
	movs	r3, #1
	b	.L67
.L70:
	movs	r3, #0
.L67:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L72:
	.align	2
.L71:
	.word	pFlash
	.word	1073888256
	.size	FLASH_WaitForLastOperation, .-FLASH_WaitForLastOperation
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_Program_DoubleWord, %function
FLASH_Program_DoubleWord:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r7}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	strd	r2, [r7]
	ldr	r3, .L74
	ldr	r3, [r3, #16]
	ldr	r2, .L74
	bic	r3, r3, #768
	str	r3, [r2, #16]
	ldr	r3, .L74
	ldr	r3, [r3, #16]
	ldr	r2, .L74
	orr	r3, r3, #768
	str	r3, [r2, #16]
	ldr	r3, .L74
	ldr	r3, [r3, #16]
	ldr	r2, .L74
	orr	r3, r3, #1
	str	r3, [r2, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [r7]
	str	r2, [r3]
	ldrd	r1, [r7]
	mov	r3, #0
	mov	r4, #0
	movs	r3, r2
	movs	r4, #0
	ldr	r2, [r7, #12]
	adds	r2, r2, #4
	str	r3, [r2]
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r4, r7}
	bx	lr
.L75:
	.align	2
.L74:
	.word	1073888256
	.size	FLASH_Program_DoubleWord, .-FLASH_Program_DoubleWord
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_Program_Word, %function
FLASH_Program_Word:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, .L77
	ldr	r3, [r3, #16]
	ldr	r2, .L77
	bic	r3, r3, #768
	str	r3, [r2, #16]
	ldr	r3, .L77
	ldr	r3, [r3, #16]
	ldr	r2, .L77
	orr	r3, r3, #512
	str	r3, [r2, #16]
	ldr	r3, .L77
	ldr	r3, [r3, #16]
	ldr	r2, .L77
	orr	r3, r3, #1
	str	r3, [r2, #16]
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L78:
	.align	2
.L77:
	.word	1073888256
	.size	FLASH_Program_Word, .-FLASH_Program_Word
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_Program_HalfWord, %function
FLASH_Program_HalfWord:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strh	r3, [r7, #2]	@ movhi
	ldr	r3, .L80
	ldr	r3, [r3, #16]
	ldr	r2, .L80
	bic	r3, r3, #768
	str	r3, [r2, #16]
	ldr	r3, .L80
	ldr	r3, [r3, #16]
	ldr	r2, .L80
	orr	r3, r3, #256
	str	r3, [r2, #16]
	ldr	r3, .L80
	ldr	r3, [r3, #16]
	ldr	r2, .L80
	orr	r3, r3, #1
	str	r3, [r2, #16]
	ldr	r3, [r7, #4]
	ldrh	r2, [r7, #2]	@ movhi
	strh	r2, [r3]	@ movhi
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L81:
	.align	2
.L80:
	.word	1073888256
	.size	FLASH_Program_HalfWord, .-FLASH_Program_HalfWord
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_Program_Byte, %function
FLASH_Program_Byte:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strb	r3, [r7, #3]
	ldr	r3, .L83
	ldr	r3, [r3, #16]
	ldr	r2, .L83
	bic	r3, r3, #768
	str	r3, [r2, #16]
	ldr	r3, .L83
	ldr	r2, .L83
	ldr	r3, [r3, #16]
	str	r3, [r2, #16]
	ldr	r3, .L83
	ldr	r3, [r3, #16]
	ldr	r2, .L83
	orr	r3, r3, #1
	str	r3, [r2, #16]
	ldr	r3, [r7, #4]
	ldrb	r2, [r7, #3]
	strb	r2, [r3]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L84:
	.align	2
.L83:
	.word	1073888256
	.size	FLASH_Program_Byte, .-FLASH_Program_Byte
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_SetErrorCode, %function
FLASH_SetErrorCode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L93
	ldr	r3, [r3, #12]
	and	r3, r3, #16
	cmp	r3, #0
	beq	.L86
	ldr	r3, .L93+4
	ldr	r3, [r3, #28]
	orr	r3, r3, #16
	ldr	r2, .L93+4
	str	r3, [r2, #28]
	ldr	r3, .L93
	movs	r2, #16
	str	r2, [r3, #12]
.L86:
	ldr	r3, .L93
	ldr	r3, [r3, #12]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L87
	ldr	r3, .L93+4
	ldr	r3, [r3, #28]
	orr	r3, r3, #8
	ldr	r2, .L93+4
	str	r3, [r2, #28]
	ldr	r3, .L93
	movs	r2, #32
	str	r2, [r3, #12]
.L87:
	ldr	r3, .L93
	ldr	r3, [r3, #12]
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L88
	ldr	r3, .L93+4
	ldr	r3, [r3, #28]
	orr	r3, r3, #4
	ldr	r2, .L93+4
	str	r3, [r2, #28]
	ldr	r3, .L93
	movs	r2, #64
	str	r2, [r3, #12]
.L88:
	ldr	r3, .L93
	ldr	r3, [r3, #12]
	and	r3, r3, #128
	cmp	r3, #0
	beq	.L89
	ldr	r3, .L93+4
	ldr	r3, [r3, #28]
	orr	r3, r3, #2
	ldr	r2, .L93+4
	str	r3, [r2, #28]
	ldr	r3, .L93
	movs	r2, #128
	str	r2, [r3, #12]
.L89:
	ldr	r3, .L93
	ldr	r3, [r3, #12]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L90
	ldr	r3, .L93+4
	ldr	r3, [r3, #28]
	orr	r3, r3, #1
	ldr	r2, .L93+4
	str	r3, [r2, #28]
	ldr	r3, .L93
	mov	r2, #256
	str	r2, [r3, #12]
.L90:
	ldr	r3, .L93
	ldr	r3, [r3, #12]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L92
	ldr	r3, .L93+4
	ldr	r3, [r3, #28]
	orr	r3, r3, #32
	ldr	r2, .L93+4
	str	r3, [r2, #28]
	ldr	r3, .L93
	movs	r2, #2
	str	r2, [r3, #12]
.L92:
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L94:
	.align	2
.L93:
	.word	1073888256
	.word	pFlash
	.size	FLASH_SetErrorCode, .-FLASH_SetErrorCode
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
