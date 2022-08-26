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
	.file	"stm32f4xx_hal_pwr_ex.c"
	.text
	.align	1
	.global	HAL_PWREx_EnableBkUpReg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWREx_EnableBkUpReg, %function
HAL_PWREx_EnableBkUpReg:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, .L5
	movs	r2, #1
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #4]
	b	.L2
.L4:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #1000
	bls	.L2
	movs	r3, #3
	b	.L3
.L2:
	ldr	r3, .L5+4
	ldr	r3, [r3, #4]
	and	r3, r3, #8
	cmp	r3, #8
	bne	.L4
	movs	r3, #0
.L3:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	1108213924
	.word	1073770496
	.size	HAL_PWREx_EnableBkUpReg, .-HAL_PWREx_EnableBkUpReg
	.align	1
	.global	HAL_PWREx_DisableBkUpReg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWREx_DisableBkUpReg, %function
HAL_PWREx_DisableBkUpReg:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, .L11
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #4]
	b	.L8
.L10:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #1000
	bls	.L8
	movs	r3, #3
	b	.L9
.L8:
	ldr	r3, .L11+4
	ldr	r3, [r3, #4]
	and	r3, r3, #8
	cmp	r3, #8
	beq	.L10
	movs	r3, #0
.L9:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	1108213924
	.word	1073770496
	.size	HAL_PWREx_DisableBkUpReg, .-HAL_PWREx_DisableBkUpReg
	.align	1
	.global	HAL_PWREx_EnableFlashPowerDown
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWREx_EnableFlashPowerDown, %function
HAL_PWREx_EnableFlashPowerDown:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L14
	movs	r2, #1
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	1108213796
	.size	HAL_PWREx_EnableFlashPowerDown, .-HAL_PWREx_EnableFlashPowerDown
	.align	1
	.global	HAL_PWREx_DisableFlashPowerDown
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWREx_DisableFlashPowerDown, %function
HAL_PWREx_DisableFlashPowerDown:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L17
	movs	r2, #0
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L18:
	.align	2
.L17:
	.word	1108213796
	.size	HAL_PWREx_DisableFlashPowerDown, .-HAL_PWREx_DisableFlashPowerDown
	.align	1
	.global	HAL_PWREx_GetVoltageRange
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWREx_GetVoltageRange, %function
HAL_PWREx_GetVoltageRange:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L21
	ldr	r3, [r3]
	and	r3, r3, #49152
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	1073770496
	.size	HAL_PWREx_GetVoltageRange, .-HAL_PWREx_GetVoltageRange
	.align	1
	.global	HAL_PWREx_ControlVoltageScaling
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWREx_ControlVoltageScaling, %function
HAL_PWREx_ControlVoltageScaling:
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
	ldr	r3, .L34
	ldr	r3, [r3, #64]
	ldr	r2, .L34
	orr	r3, r3, #268435456
	str	r3, [r2, #64]
	ldr	r3, .L34
	ldr	r3, [r3, #64]
	and	r3, r3, #268435456
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	ldr	r3, .L34
	ldr	r3, [r3, #8]
	and	r3, r3, #12
	cmp	r3, #8
	beq	.L24
	ldr	r3, .L34+4
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #20]
	b	.L25
.L27:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L25
	movs	r3, #3
	b	.L26
.L25:
	ldr	r3, .L34
	ldr	r3, [r3]
	and	r3, r3, #33554432
	cmp	r3, #0
	bne	.L27
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, .L34+8
	ldr	r3, [r3]
	bic	r2, r3, #49152
	ldr	r1, .L34+8
	ldr	r3, [r7, #4]
	orrs	r3, r3, r2
	str	r3, [r1]
	ldr	r3, .L34+8
	ldr	r3, [r3]
	and	r3, r3, #49152
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r3, .L34+4
	movs	r2, #1
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #20]
	b	.L28
.L29:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	cmp	r3, #2
	bls	.L28
	movs	r3, #3
	b	.L26
.L28:
	ldr	r3, .L34
	ldr	r3, [r3]
	and	r3, r3, #33554432
	cmp	r3, #0
	beq	.L29
	bl	HAL_GetTick
	str	r0, [r7, #20]
	b	.L30
.L31:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	cmp	r3, #1000
	bls	.L30
	movs	r3, #3
	b	.L26
.L30:
	ldr	r3, .L34+8
	ldr	r3, [r3, #4]
	and	r3, r3, #16384
	cmp	r3, #16384
	bne	.L31
	b	.L33
.L24:
	movs	r3, #1
	b	.L26
.L33:
	movs	r3, #0
.L26:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L35:
	.align	2
.L34:
	.word	1073887232
	.word	1111949408
	.word	1073770496
	.size	HAL_PWREx_ControlVoltageScaling, .-HAL_PWREx_ControlVoltageScaling
	.align	1
	.global	HAL_PWREx_EnableOverDrive
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWREx_EnableOverDrive, %function
HAL_PWREx_EnableOverDrive:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7]
	ldr	r3, .L42
	ldr	r3, [r3, #64]
	ldr	r2, .L42
	orr	r3, r3, #268435456
	str	r3, [r2, #64]
	ldr	r3, .L42
	ldr	r3, [r3, #64]
	and	r3, r3, #268435456
	str	r3, [r7]
	ldr	r3, [r7]
	ldr	r3, .L42+4
	movs	r2, #1
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #4]
	b	.L37
.L39:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #1000
	bls	.L37
	movs	r3, #3
	b	.L38
.L37:
	ldr	r3, .L42+8
	ldr	r3, [r3, #4]
	and	r3, r3, #65536
	cmp	r3, #65536
	bne	.L39
	ldr	r3, .L42+12
	movs	r2, #1
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #4]
	b	.L40
.L41:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #1000
	bls	.L40
	movs	r3, #3
	b	.L38
.L40:
	ldr	r3, .L42+8
	ldr	r3, [r3, #4]
	and	r3, r3, #131072
	cmp	r3, #131072
	bne	.L41
	movs	r3, #0
.L38:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L43:
	.align	2
.L42:
	.word	1073887232
	.word	1108213824
	.word	1073770496
	.word	1108213828
	.size	HAL_PWREx_EnableOverDrive, .-HAL_PWREx_EnableOverDrive
	.align	1
	.global	HAL_PWREx_DisableOverDrive
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWREx_DisableOverDrive, %function
HAL_PWREx_DisableOverDrive:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7]
	ldr	r3, .L50
	ldr	r3, [r3, #64]
	ldr	r2, .L50
	orr	r3, r3, #268435456
	str	r3, [r2, #64]
	ldr	r3, .L50
	ldr	r3, [r3, #64]
	and	r3, r3, #268435456
	str	r3, [r7]
	ldr	r3, [r7]
	ldr	r3, .L50+4
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #4]
	b	.L45
.L47:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #1000
	bls	.L45
	movs	r3, #3
	b	.L46
.L45:
	ldr	r3, .L50+8
	ldr	r3, [r3, #4]
	and	r3, r3, #131072
	cmp	r3, #131072
	beq	.L47
	ldr	r3, .L50+12
	movs	r2, #0
	str	r2, [r3]
	bl	HAL_GetTick
	str	r0, [r7, #4]
	b	.L48
.L49:
	bl	HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	cmp	r3, #1000
	bls	.L48
	movs	r3, #3
	b	.L46
.L48:
	ldr	r3, .L50+8
	ldr	r3, [r3, #4]
	and	r3, r3, #65536
	cmp	r3, #65536
	beq	.L49
	movs	r3, #0
.L46:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L51:
	.align	2
.L50:
	.word	1073887232
	.word	1108213828
	.word	1073770496
	.word	1108213824
	.size	HAL_PWREx_DisableOverDrive, .-HAL_PWREx_DisableOverDrive
	.align	1
	.global	HAL_PWREx_EnterUnderDriveSTOPMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWREx_EnterUnderDriveSTOPMode, %function
HAL_PWREx_EnterUnderDriveSTOPMode:
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
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, .L56
	ldr	r3, [r3, #64]
	ldr	r2, .L56
	orr	r3, r3, #268435456
	str	r3, [r2, #64]
	ldr	r3, .L56
	ldr	r3, [r3, #64]
	and	r3, r3, #268435456
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	ldr	r3, .L56+4
	ldr	r3, [r3, #4]
	ldr	r2, .L56+4
	orr	r3, r3, #786432
	str	r3, [r2, #4]
	ldr	r3, .L56+4
	ldr	r3, [r3]
	ldr	r2, .L56+4
	orr	r3, r3, #786432
	str	r3, [r2]
	ldr	r3, .L56+4
	ldr	r3, [r3]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #3072
	bic	r3, r3, #3
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r2, .L56+4
	ldr	r3, [r7, #12]
	str	r3, [r2]
	ldr	r3, .L56+8
	ldr	r3, [r3, #16]
	ldr	r2, .L56+8
	orr	r3, r3, #4
	str	r3, [r2, #16]
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L53
	.syntax unified
@ 573 "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L54
.L53:
	.syntax unified
@ 578 "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c" 1
	wfe
@ 0 "" 2
	.thumb
	.syntax unified
.L54:
	ldr	r3, .L56+8
	ldr	r3, [r3, #16]
	ldr	r2, .L56+8
	bic	r3, r3, #4
	str	r3, [r2, #16]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L57:
	.align	2
.L56:
	.word	1073887232
	.word	1073770496
	.word	-536810240
	.size	HAL_PWREx_EnterUnderDriveSTOPMode, .-HAL_PWREx_EnterUnderDriveSTOPMode
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
