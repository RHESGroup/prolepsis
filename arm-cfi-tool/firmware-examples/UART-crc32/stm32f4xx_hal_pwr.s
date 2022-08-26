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
	.file	"stm32f4xx_hal_pwr.c"
	.text
	.align	1
	.global	HAL_PWR_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_DeInit, %function
HAL_PWR_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L2
	ldr	r3, [r3, #32]
	ldr	r2, .L2
	orr	r3, r3, #268435456
	str	r3, [r2, #32]
	ldr	r3, .L2
	ldr	r3, [r3, #32]
	ldr	r2, .L2
	bic	r3, r3, #268435456
	str	r3, [r2, #32]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073887232
	.size	HAL_PWR_DeInit, .-HAL_PWR_DeInit
	.align	1
	.global	HAL_PWR_EnableBkUpAccess
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_EnableBkUpAccess, %function
HAL_PWR_EnableBkUpAccess:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L5
	movs	r2, #1
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	1108213792
	.size	HAL_PWR_EnableBkUpAccess, .-HAL_PWR_EnableBkUpAccess
	.align	1
	.global	HAL_PWR_DisableBkUpAccess
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_DisableBkUpAccess, %function
HAL_PWR_DisableBkUpAccess:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L8
	movs	r2, #0
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	1108213792
	.size	HAL_PWR_DisableBkUpAccess, .-HAL_PWR_DisableBkUpAccess
	.align	1
	.global	HAL_PWR_ConfigPVD
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_ConfigPVD, %function
HAL_PWR_ConfigPVD:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L16
	ldr	r3, [r3]
	bic	r2, r3, #224
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r1, .L16
	orrs	r3, r3, r2
	str	r3, [r1]
	ldr	r3, .L16+4
	ldr	r3, [r3, #4]
	ldr	r2, .L16+4
	bic	r3, r3, #65536
	str	r3, [r2, #4]
	ldr	r3, .L16+4
	ldr	r3, [r3]
	ldr	r2, .L16+4
	bic	r3, r3, #65536
	str	r3, [r2]
	ldr	r3, .L16+4
	ldr	r3, [r3, #8]
	ldr	r2, .L16+4
	bic	r3, r3, #65536
	str	r3, [r2, #8]
	ldr	r3, .L16+4
	ldr	r3, [r3, #12]
	ldr	r2, .L16+4
	bic	r3, r3, #65536
	str	r3, [r2, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	and	r3, r3, #65536
	cmp	r3, #0
	beq	.L11
	ldr	r3, .L16+4
	ldr	r3, [r3]
	ldr	r2, .L16+4
	orr	r3, r3, #65536
	str	r3, [r2]
.L11:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	and	r3, r3, #131072
	cmp	r3, #0
	beq	.L12
	ldr	r3, .L16+4
	ldr	r3, [r3, #4]
	ldr	r2, .L16+4
	orr	r3, r3, #65536
	str	r3, [r2, #4]
.L12:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L13
	ldr	r3, .L16+4
	ldr	r3, [r3, #8]
	ldr	r2, .L16+4
	orr	r3, r3, #65536
	str	r3, [r2, #8]
.L13:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L15
	ldr	r3, .L16+4
	ldr	r3, [r3, #12]
	ldr	r2, .L16+4
	orr	r3, r3, #65536
	str	r3, [r2, #12]
.L15:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L17:
	.align	2
.L16:
	.word	1073770496
	.word	1073822720
	.size	HAL_PWR_ConfigPVD, .-HAL_PWR_ConfigPVD
	.align	1
	.global	HAL_PWR_EnablePVD
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_EnablePVD, %function
HAL_PWR_EnablePVD:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L19
	movs	r2, #1
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L20:
	.align	2
.L19:
	.word	1108213776
	.size	HAL_PWR_EnablePVD, .-HAL_PWR_EnablePVD
	.align	1
	.global	HAL_PWR_DisablePVD
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_DisablePVD, %function
HAL_PWR_DisablePVD:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L22
	movs	r2, #0
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L23:
	.align	2
.L22:
	.word	1108213776
	.size	HAL_PWR_DisablePVD, .-HAL_PWR_DisablePVD
	.align	1
	.global	HAL_PWR_EnableWakeUpPin
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_EnableWakeUpPin, %function
HAL_PWR_EnableWakeUpPin:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L25
	ldr	r2, [r3, #4]
	ldr	r1, .L25
	ldr	r3, [r7, #4]
	orrs	r3, r3, r2
	str	r3, [r1, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L26:
	.align	2
.L25:
	.word	1073770496
	.size	HAL_PWR_EnableWakeUpPin, .-HAL_PWR_EnableWakeUpPin
	.align	1
	.global	HAL_PWR_DisableWakeUpPin
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_DisableWakeUpPin, %function
HAL_PWR_DisableWakeUpPin:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L28
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	mvns	r3, r3
	ldr	r1, .L28
	ands	r3, r3, r2
	str	r3, [r1, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L29:
	.align	2
.L28:
	.word	1073770496
	.size	HAL_PWR_DisableWakeUpPin, .-HAL_PWR_DisableWakeUpPin
	.align	1
	.global	HAL_PWR_EnterSLEEPMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_EnterSLEEPMode, %function
HAL_PWR_EnterSLEEPMode:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strb	r3, [r7, #3]
	ldr	r3, .L34
	ldr	r3, [r3, #16]
	ldr	r2, .L34
	bic	r3, r3, #4
	str	r3, [r2, #16]
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L31
	.syntax unified
@ 378 "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L33
.L31:
	.syntax unified
@ 383 "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c" 1
	sev
@ 0 "" 2
@ 384 "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c" 1
	wfe
@ 0 "" 2
@ 385 "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c" 1
	wfe
@ 0 "" 2
	.thumb
	.syntax unified
.L33:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L35:
	.align	2
.L34:
	.word	-536810240
	.size	HAL_PWR_EnterSLEEPMode, .-HAL_PWR_EnterSLEEPMode
	.align	1
	.global	HAL_PWR_EnterSTOPMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_EnterSTOPMode, %function
HAL_PWR_EnterSTOPMode:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strb	r3, [r7, #3]
	ldr	r3, .L39
	ldr	r3, [r3]
	bic	r2, r3, #3
	ldr	r1, .L39
	ldr	r3, [r7, #4]
	orrs	r3, r3, r2
	str	r3, [r1]
	ldr	r3, .L39+4
	ldr	r3, [r3, #16]
	ldr	r2, .L39+4
	orr	r3, r3, #4
	str	r3, [r2, #16]
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L37
	.syntax unified
@ 424 "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L38
.L37:
	.syntax unified
@ 429 "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c" 1
	sev
@ 0 "" 2
@ 430 "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c" 1
	wfe
@ 0 "" 2
@ 431 "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c" 1
	wfe
@ 0 "" 2
	.thumb
	.syntax unified
.L38:
	ldr	r3, .L39+4
	ldr	r3, [r3, #16]
	ldr	r2, .L39+4
	bic	r3, r3, #4
	str	r3, [r2, #16]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L40:
	.align	2
.L39:
	.word	1073770496
	.word	-536810240
	.size	HAL_PWR_EnterSTOPMode, .-HAL_PWR_EnterSTOPMode
	.align	1
	.global	HAL_PWR_EnterSTANDBYMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_EnterSTANDBYMode, %function
HAL_PWR_EnterSTANDBYMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L42
	ldr	r3, [r3]
	ldr	r2, .L42
	orr	r3, r3, #2
	str	r3, [r2]
	ldr	r3, .L42+4
	ldr	r3, [r3, #16]
	ldr	r2, .L42+4
	orr	r3, r3, #4
	str	r3, [r2, #16]
	.syntax unified
@ 460 "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L43:
	.align	2
.L42:
	.word	1073770496
	.word	-536810240
	.size	HAL_PWR_EnterSTANDBYMode, .-HAL_PWR_EnterSTANDBYMode
	.align	1
	.global	HAL_PWR_PVD_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_PVD_IRQHandler, %function
HAL_PWR_PVD_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L47
	ldr	r3, [r3, #20]
	and	r3, r3, #65536
	cmp	r3, #0
	beq	.L46
	bl	HAL_PWR_PVDCallback
	ldr	r3, .L47
	mov	r2, #65536
	str	r2, [r3, #20]
.L46:
	nop
	pop	{r7, pc}
.L48:
	.align	2
.L47:
	.word	1073822720
	.size	HAL_PWR_PVD_IRQHandler, .-HAL_PWR_PVD_IRQHandler
	.align	1
	.weak	HAL_PWR_PVDCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_PVDCallback, %function
HAL_PWR_PVDCallback:
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
	.size	HAL_PWR_PVDCallback, .-HAL_PWR_PVDCallback
	.align	1
	.global	HAL_PWR_EnableSleepOnExit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_EnableSleepOnExit, %function
HAL_PWR_EnableSleepOnExit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L51
	ldr	r3, [r3, #16]
	ldr	r2, .L51
	orr	r3, r3, #2
	str	r3, [r2, #16]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L52:
	.align	2
.L51:
	.word	-536810240
	.size	HAL_PWR_EnableSleepOnExit, .-HAL_PWR_EnableSleepOnExit
	.align	1
	.global	HAL_PWR_DisableSleepOnExit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_DisableSleepOnExit, %function
HAL_PWR_DisableSleepOnExit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L54
	ldr	r3, [r3, #16]
	ldr	r2, .L54
	bic	r3, r3, #2
	str	r3, [r2, #16]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L55:
	.align	2
.L54:
	.word	-536810240
	.size	HAL_PWR_DisableSleepOnExit, .-HAL_PWR_DisableSleepOnExit
	.align	1
	.global	HAL_PWR_EnableSEVOnPend
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_EnableSEVOnPend, %function
HAL_PWR_EnableSEVOnPend:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L57
	ldr	r3, [r3, #16]
	ldr	r2, .L57
	orr	r3, r3, #16
	str	r3, [r2, #16]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L58:
	.align	2
.L57:
	.word	-536810240
	.size	HAL_PWR_EnableSEVOnPend, .-HAL_PWR_EnableSEVOnPend
	.align	1
	.global	HAL_PWR_DisableSEVOnPend
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_PWR_DisableSEVOnPend, %function
HAL_PWR_DisableSEVOnPend:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L60
	ldr	r3, [r3, #16]
	ldr	r2, .L60
	bic	r3, r3, #16
	str	r3, [r2, #16]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L61:
	.align	2
.L60:
	.word	-536810240
	.size	HAL_PWR_DisableSEVOnPend, .-HAL_PWR_DisableSEVOnPend
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
