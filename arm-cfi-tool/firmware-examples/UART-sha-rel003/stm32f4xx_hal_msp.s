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
	.file	"stm32f4xx_hal_msp.c"
	.text
	.align	1
	.global	HAL_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_MspInit, %function
HAL_MspInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, .L2
	ldr	r3, [r3, #68]
	ldr	r2, .L2
	orr	r3, r3, #16384
	str	r3, [r2, #68]
	ldr	r3, .L2
	ldr	r3, [r3, #68]
	and	r3, r3, #16384
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7]
	ldr	r3, .L2
	ldr	r3, [r3, #64]
	ldr	r2, .L2
	orr	r3, r3, #268435456
	str	r3, [r2, #64]
	ldr	r3, .L2
	ldr	r3, [r3, #64]
	and	r3, r3, #268435456
	str	r3, [r7]
	ldr	r3, [r7]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073887232
	.size	HAL_MspInit, .-HAL_MspInit
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
