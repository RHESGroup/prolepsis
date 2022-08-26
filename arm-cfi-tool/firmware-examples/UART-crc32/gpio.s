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
	.file	"gpio.c"
	.text
	.align	1
	.global	MX_GPIO_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	MX_GPIO_Init, %function
MX_GPIO_Init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, .L2
	ldr	r3, [r3, #48]
	ldr	r2, .L2
	orr	r3, r3, #2
	str	r3, [r2, #48]
	ldr	r3, .L2
	ldr	r3, [r3, #48]
	and	r3, r3, #2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7]
	ldr	r3, .L2
	ldr	r3, [r3, #48]
	ldr	r2, .L2
	orr	r3, r3, #1
	str	r3, [r2, #48]
	ldr	r3, .L2
	ldr	r3, [r3, #48]
	and	r3, r3, #1
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
	.size	MX_GPIO_Init, .-MX_GPIO_Init
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
