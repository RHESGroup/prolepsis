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
	.file	"stm32f4xx_hal_rcc_ex.c"
	.text
	.align	1
	.global	HAL_RCCEx_PeriphCLKConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCCEx_PeriphCLKConfig, %function
HAL_RCCEx_PeriphCLKConfig:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L2
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L3
.L2:
	ldr	r3, .L28
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #20]
	b	.L4
.L6:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L4
	movs	r3, #3
	b	.L5
.L4:
	ldr	r3, .L28+4
	ldr	r3, [r3]
	and	r3, r3, #134217728
	cmp	r3, #0
	bne	.L6
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L7
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r2, r3, #6
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	lsls	r3, r3, #28
	ldr	r1, .L28+4
	orrs	r3, r3, r2
	str	r3, [r1, #132]
.L7:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L8
	ldr	r3, .L28+4
	ldr	r3, [r3, #132]
	lsrs	r3, r3, #28
	and	r3, r3, #7
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r2, r3, #6
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	lsls	r3, r3, #24
	orrs	r2, r2, r3
	ldr	r3, [r7, #16]
	lsls	r3, r3, #28
	ldr	r1, .L28+4
	orrs	r3, r3, r2
	str	r3, [r1, #132]
	ldr	r3, .L28+4
	ldr	r3, [r3, #140]
	bic	r2, r3, #31
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	subs	r3, r3, #1
	ldr	r1, .L28+4
	orrs	r3, r3, r2
	str	r3, [r1, #140]
.L8:
	ldr	r3, .L28
	movs	r2, #1
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #20]
	b	.L9
.L10:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L9
	movs	r3, #3
	b	.L5
.L9:
	ldr	r3, .L28+4
	ldr	r3, [r3]
	and	r3, r3, #134217728
	cmp	r3, #0
	beq	.L10
.L3:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #4
	cmp	r3, #0
	bne	.L11
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L12
.L11:
	ldr	r3, .L28+8
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #20]
	b	.L13
.L14:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L13
	movs	r3, #3
	b	.L5
.L13:
	ldr	r3, .L28+4
	ldr	r3, [r3]
	and	r3, r3, #536870912
	cmp	r3, #536870912
	beq	.L14
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L15
	ldr	r3, .L28+4
	ldr	r3, [r3, #136]
	lsrs	r3, r3, #28
	and	r3, r3, #7
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	lsls	r2, r3, #6
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	lsls	r3, r3, #24
	orrs	r2, r2, r3
	ldr	r3, [r7, #16]
	lsls	r3, r3, #28
	ldr	r1, .L28+4
	orrs	r3, r3, r2
	str	r3, [r1, #136]
	ldr	r3, .L28+4
	ldr	r3, [r3, #140]
	bic	r2, r3, #7936
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	subs	r3, r3, #1
	lsls	r3, r3, #8
	ldr	r1, .L28+4
	orrs	r3, r3, r2
	str	r3, [r1, #140]
.L15:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L16
	ldr	r3, .L28+4
	ldr	r3, [r3, #136]
	lsrs	r3, r3, #24
	and	r3, r3, #15
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	lsls	r2, r3, #6
	ldr	r3, [r7, #16]
	lsls	r3, r3, #24
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	lsls	r3, r3, #28
	ldr	r1, .L28+4
	orrs	r3, r3, r2
	str	r3, [r1, #136]
	ldr	r3, .L28+4
	ldr	r3, [r3, #140]
	bic	r2, r3, #196608
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	ldr	r1, .L28+4
	orrs	r3, r3, r2
	str	r3, [r1, #140]
.L16:
	ldr	r3, .L28+8
	movs	r2, #1
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #20]
	b	.L17
.L18:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L17
	movs	r3, #3
	b	.L5
.L17:
	ldr	r3, .L28+4
	ldr	r3, [r3]
	and	r3, r3, #536870912
	cmp	r3, #536870912
	bne	.L18
.L12:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L19
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, .L28+4
	ldr	r3, [r3, #64]
	ldr	r2, .L28+4
	orr	r3, r3, #268435456
	str	r3, [r2, #64]
	ldr	r3, .L28+4
	ldr	r3, [r3, #64]
	and	r3, r3, #268435456
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r3, .L28+12
	ldr	r3, [r3]
	ldr	r2, .L28+12
	orr	r3, r3, #256
	str	r3, [r2]
	bl	HAL_GetTick
	str	r0, [r7, #20]
	b	.L20
.L21:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L20
	movs	r3, #3
	b	.L5
.L20:
	ldr	r3, .L28+12
	ldr	r3, [r3]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L21
	ldr	r3, .L28+4
	ldr	r3, [r3, #112]
	and	r3, r3, #768
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	cmp	r3, #0
	beq	.L22
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	and	r3, r3, #768
	ldr	r2, [r7, #16]
	cmp	r2, r3
	beq	.L22
	ldr	r3, .L28+4
	ldr	r3, [r3, #112]
	bic	r3, r3, #768
	str	r3, [r7, #16]
	ldr	r3, .L28+16
	movs	r2, #1
	str	r2, [r3]
	ldr	r3, .L28+16
	movs	r2, #0
	str	r2, [r3]
	ldr	r2, .L28+4
	ldr	r3, [r7, #16]
	str	r3, [r2, #112]
	ldr	r3, .L28+4
	ldr	r3, [r3, #112]
	and	r3, r3, #1
	cmp	r3, #1
	bne	.L22
	bl	HAL_GetTick
	str	r0, [r7, #20]
	b	.L23
.L24:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	movw	r2, #5000
	cmp	r3, r2
	bls	.L23
	movs	r3, #3
	b	.L5
.L29:
	.align	2
.L28:
	.word	1111949416
	.word	1073887232
	.word	1111949424
	.word	1073770496
	.word	1111952960
.L23:
	ldr	r3, .L30
	ldr	r3, [r3, #112]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L24
.L22:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	and	r3, r3, #768
	cmp	r3, #768
	bne	.L25
	ldr	r3, .L30
	ldr	r3, [r3, #8]
	bic	r2, r3, #2031616
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	bic	r3, r3, #-268435456
	bic	r3, r3, #768
	ldr	r1, .L30
	orrs	r3, r3, r2
	str	r3, [r1, #8]
	b	.L26
.L25:
	ldr	r3, .L30
	ldr	r3, [r3, #8]
	ldr	r2, .L30
	bic	r3, r3, #2031616
	str	r3, [r2, #8]
.L26:
	ldr	r3, .L30
	ldr	r2, [r3, #112]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	ubfx	r3, r3, #0, #12
	ldr	r1, .L30
	orrs	r3, r3, r2
	str	r3, [r1, #112]
.L19:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #16
	cmp	r3, #0
	beq	.L27
	ldr	r3, [r7, #4]
	ldrb	r2, [r3, #44]	@ zero_extendqisi2
	ldr	r3, .L30+4
	str	r2, [r3]
.L27:
	movs	r3, #0
.L5:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L31:
	.align	2
.L30:
	.word	1073887232
	.word	1111953888
	.size	HAL_RCCEx_PeriphCLKConfig, .-HAL_RCCEx_PeriphCLKConfig
	.align	1
	.global	HAL_RCCEx_GetPeriphCLKConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCCEx_GetPeriphCLKConfig, %function
HAL_RCCEx_GetPeriphCLKConfig:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #63
	str	r2, [r3]
	ldr	r3, .L36
	ldr	r3, [r3, #132]
	lsrs	r3, r3, #6
	ubfx	r2, r3, #0, #9
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	ldr	r3, .L36
	ldr	r3, [r3, #132]
	lsrs	r3, r3, #28
	and	r2, r3, #7
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	ldr	r3, .L36
	ldr	r3, [r3, #132]
	lsrs	r3, r3, #24
	and	r2, r3, #15
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	ldr	r3, .L36
	ldr	r3, [r3, #136]
	lsrs	r3, r3, #6
	ubfx	r2, r3, #0, #9
	ldr	r3, [r7, #4]
	str	r2, [r3, #16]
	ldr	r3, .L36
	ldr	r3, [r3, #136]
	lsrs	r3, r3, #28
	and	r2, r3, #7
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
	ldr	r3, .L36
	ldr	r3, [r3, #136]
	lsrs	r3, r3, #24
	and	r2, r3, #15
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
	ldr	r3, .L36
	ldr	r3, [r3, #140]
	and	r2, r3, #31
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	ldr	r3, .L36
	ldr	r3, [r3, #140]
	lsrs	r3, r3, #8
	and	r2, r3, #31
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	ldr	r3, .L36
	ldr	r3, [r3, #140]
	and	r2, r3, #196608
	ldr	r3, [r7, #4]
	str	r2, [r3, #36]
	ldr	r3, .L36
	ldr	r3, [r3, #8]
	and	r3, r3, #2031616
	str	r3, [r7, #12]
	ldr	r3, .L36
	ldr	r3, [r3, #112]
	and	r2, r3, #768
	ldr	r3, [r7, #12]
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #40]
	ldr	r3, .L36
	ldr	r3, [r3, #140]
	and	r3, r3, #16777216
	cmp	r3, #0
	bne	.L33
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #44]
	b	.L35
.L33:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #44]
.L35:
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L37:
	.align	2
.L36:
	.word	1073887232
	.size	HAL_RCCEx_GetPeriphCLKConfig, .-HAL_RCCEx_GetPeriphCLKConfig
	.align	1
	.global	HAL_RCCEx_GetPeriphCLKFreq
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCCEx_GetPeriphCLKFreq, %function
HAL_RCCEx_GetPeriphCLKFreq:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	cmp	r3, #1
	bne	.L39
	ldr	r3, .L49
	ldr	r3, [r3, #8]
	and	r3, r3, #8388608
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L42
	cmp	r3, #1
	bne	.L48
	ldr	r3, .L49+4
	str	r3, [r7, #20]
	b	.L44
.L42:
	ldr	r3, .L49
	ldr	r3, [r3, #4]
	and	r3, r3, #4194304
	cmp	r3, #4194304
	bne	.L45
	ldr	r3, .L49
	ldr	r3, [r3, #4]
	and	r3, r3, #63
	ldr	r2, .L49+8
	udiv	r3, r2, r3
	str	r3, [r7, #16]
	b	.L46
.L45:
	ldr	r3, .L49
	ldr	r3, [r3, #4]
	and	r3, r3, #63
	ldr	r2, .L49+12
	udiv	r3, r2, r3
	str	r3, [r7, #16]
.L46:
	ldr	r3, .L49
	ldr	r3, [r3, #132]
	lsrs	r3, r3, #6
	ubfx	r2, r3, #0, #9
	ldr	r3, [r7, #16]
	mul	r3, r2, r3
	str	r3, [r7, #8]
	ldr	r3, .L49
	ldr	r3, [r3, #132]
	lsrs	r3, r3, #28
	and	r3, r3, #7
	ldr	r2, [r7, #8]
	udiv	r3, r2, r3
	str	r3, [r7, #20]
	b	.L44
.L48:
	movs	r3, #0
	str	r3, [r7, #20]
	nop
.L44:
	nop
.L39:
	ldr	r3, [r7, #20]
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L50:
	.align	2
.L49:
	.word	1073887232
	.word	12288000
	.word	25000000
	.word	16000000
	.size	HAL_RCCEx_GetPeriphCLKFreq, .-HAL_RCCEx_GetPeriphCLKFreq
	.align	1
	.global	HAL_RCCEx_EnablePLLI2S
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCCEx_EnablePLLI2S, %function
HAL_RCCEx_EnablePLLI2S:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L57
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #12]
	b	.L52
.L54:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L52
	movs	r3, #3
	b	.L53
.L52:
	ldr	r3, .L57+4
	ldr	r3, [r3]
	and	r3, r3, #134217728
	cmp	r3, #0
	bne	.L54
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	lsls	r2, r3, #6
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	lsls	r3, r3, #24
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #28
	ldr	r1, .L57+4
	orrs	r3, r3, r2
	str	r3, [r1, #132]
	ldr	r3, .L57
	movs	r2, #1
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #12]
	b	.L55
.L56:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L55
	movs	r3, #3
	b	.L53
.L55:
	ldr	r3, .L57+4
	ldr	r3, [r3]
	and	r3, r3, #134217728
	cmp	r3, #0
	beq	.L56
	movs	r3, #0
.L53:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L58:
	.align	2
.L57:
	.word	1111949416
	.word	1073887232
	.size	HAL_RCCEx_EnablePLLI2S, .-HAL_RCCEx_EnablePLLI2S
	.align	1
	.global	HAL_RCCEx_DisablePLLI2S
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCCEx_DisablePLLI2S, %function
HAL_RCCEx_DisablePLLI2S:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r3, .L63
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #4]
	b	.L60
.L62:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L60
	movs	r3, #3
	b	.L61
.L60:
	ldr	r3, .L63+4
	ldr	r3, [r3]
	and	r3, r3, #134217728
	cmp	r3, #0
	bne	.L62
	movs	r3, #0
.L61:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L64:
	.align	2
.L63:
	.word	1111949416
	.word	1073887232
	.size	HAL_RCCEx_DisablePLLI2S, .-HAL_RCCEx_DisablePLLI2S
	.align	1
	.global	HAL_RCCEx_EnablePLLSAI
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCCEx_EnablePLLSAI, %function
HAL_RCCEx_EnablePLLSAI:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L71
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #12]
	b	.L66
.L68:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L66
	movs	r3, #3
	b	.L67
.L66:
	ldr	r3, .L71+4
	ldr	r3, [r3]
	and	r3, r3, #536870912
	cmp	r3, #536870912
	beq	.L68
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	lsls	r2, r3, #6
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #24
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	lsls	r3, r3, #28
	ldr	r1, .L71+4
	orrs	r3, r3, r2
	str	r3, [r1, #136]
	ldr	r3, .L71
	movs	r2, #1
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #12]
	b	.L69
.L70:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L69
	movs	r3, #3
	b	.L67
.L69:
	ldr	r3, .L71+4
	ldr	r3, [r3]
	and	r3, r3, #536870912
	cmp	r3, #536870912
	bne	.L70
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
	.word	1111949424
	.word	1073887232
	.size	HAL_RCCEx_EnablePLLSAI, .-HAL_RCCEx_EnablePLLSAI
	.align	1
	.global	HAL_RCCEx_DisablePLLSAI
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCCEx_DisablePLLSAI, %function
HAL_RCCEx_DisablePLLSAI:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r3, .L77
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #4]
	b	.L74
.L76:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L74
	movs	r3, #3
	b	.L75
.L74:
	ldr	r3, .L77+4
	ldr	r3, [r3]
	and	r3, r3, #536870912
	cmp	r3, #536870912
	beq	.L76
	movs	r3, #0
.L75:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L78:
	.align	2
.L77:
	.word	1111949424
	.word	1073887232
	.size	HAL_RCCEx_DisablePLLSAI, .-HAL_RCCEx_DisablePLLSAI
	.align	1
	.global	HAL_RCC_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_RCC_DeInit, %function
HAL_RCC_DeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	bl	HAL_GetTick
	str	r0, [r7, #4]
	ldr	r3, .L94
	ldr	r3, [r3]
	ldr	r2, .L94
	orr	r3, r3, #1
	str	r3, [r2]
	b	.L80
.L82:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L80
	movs	r3, #3
	b	.L81
.L80:
	ldr	r3, .L94
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L82
	ldr	r3, .L94
	ldr	r3, [r3]
	ldr	r2, .L94
	orr	r3, r3, #128
	str	r3, [r2]
	bl	HAL_GetTick
	str	r0, [r7, #4]
	ldr	r3, .L94
	movs	r2, #0
	str	r2, [r3, #8]
	b	.L83
.L84:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	movw	r2, #5000
	cmp	r3, r2
	bls	.L83
	movs	r3, #3
	b	.L81
.L83:
	ldr	r3, .L94
	ldr	r3, [r3, #8]
	and	r3, r3, #12
	cmp	r3, #0
	bne	.L84
	bl	HAL_GetTick
	str	r0, [r7, #4]
	ldr	r3, .L94
	ldr	r3, [r3]
	ldr	r2, .L94
	bic	r3, r3, #851968
	str	r3, [r2]
	b	.L85
.L86:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #100
	bls	.L85
	movs	r3, #3
	b	.L81
.L85:
	ldr	r3, .L94
	ldr	r3, [r3]
	and	r3, r3, #131072
	cmp	r3, #0
	bne	.L86
	bl	HAL_GetTick
	str	r0, [r7, #4]
	ldr	r3, .L94
	ldr	r3, [r3]
	ldr	r2, .L94
	bic	r3, r3, #16777216
	str	r3, [r2]
	b	.L87
.L88:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L87
	movs	r3, #3
	b	.L81
.L87:
	ldr	r3, .L94
	ldr	r3, [r3]
	and	r3, r3, #33554432
	cmp	r3, #0
	bne	.L88
	bl	HAL_GetTick
	str	r0, [r7, #4]
	ldr	r3, .L94
	ldr	r3, [r3]
	ldr	r2, .L94
	bic	r3, r3, #67108864
	str	r3, [r2]
	b	.L89
.L90:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L89
	movs	r3, #3
	b	.L81
.L89:
	ldr	r3, .L94
	ldr	r3, [r3]
	and	r3, r3, #134217728
	cmp	r3, #0
	bne	.L90
	bl	HAL_GetTick
	str	r0, [r7, #4]
	ldr	r3, .L94
	ldr	r3, [r3]
	ldr	r2, .L94
	bic	r3, r3, #268435456
	str	r3, [r2]
	b	.L91
.L92:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L91
	movs	r3, #3
	b	.L81
.L91:
	ldr	r3, .L94
	ldr	r3, [r3]
	and	r3, r3, #536870912
	cmp	r3, #0
	bne	.L92
	ldr	r3, .L94
	ldr	r2, .L94+4
	str	r2, [r3, #4]
	ldr	r3, .L94
	ldr	r2, .L94+8
	str	r2, [r3, #132]
	ldr	r3, .L94
	ldr	r2, .L94+8
	str	r2, [r3, #136]
	ldr	r3, .L94
	ldr	r3, [r3, #12]
	ldr	r2, .L94
	bic	r3, r3, #7936
	str	r3, [r2, #12]
	ldr	r3, .L94
	ldr	r3, [r3, #12]
	ldr	r2, .L94
	bic	r3, r3, #8192
	str	r3, [r2, #12]
	ldr	r3, .L94
	ldr	r3, [r3, #12]
	ldr	r2, .L94
	bic	r3, r3, #16384
	str	r3, [r2, #12]
	ldr	r3, .L94
	ldr	r3, [r3, #12]
	ldr	r2, .L94
	orr	r3, r3, #10420224
	str	r3, [r2, #12]
	ldr	r3, .L94
	ldr	r3, [r3, #12]
	ldr	r2, .L94
	orr	r3, r3, #2097152
	str	r3, [r2, #12]
	ldr	r3, .L94
	ldr	r3, [r3, #12]
	ldr	r2, .L94
	orr	r3, r3, #4194304
	str	r3, [r2, #12]
	ldr	r3, .L94
	ldr	r3, [r3, #116]
	ldr	r2, .L94
	bic	r3, r3, #1
	str	r3, [r2, #116]
	ldr	r3, .L94
	ldr	r3, [r3, #116]
	ldr	r2, .L94
	orr	r3, r3, #16777216
	str	r3, [r2, #116]
	ldr	r3, .L94+12
	ldr	r2, .L94+16
	str	r2, [r3]
	movs	r0, #0
	bl	HAL_InitTick
	mov	r3, r0
	cmp	r3, #0
	beq	.L93
	movs	r3, #1
	b	.L81
.L93:
	movs	r3, #0
.L81:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L95:
	.align	2
.L94:
	.word	1073887232
	.word	67121168
	.word	603992064
	.word	SystemCoreClock
	.word	16000000
	.size	HAL_RCC_DeInit, .-HAL_RCC_DeInit
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
