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
	.file	"bitstrng.c"
	.text
	.align	1
	.global	bitstring
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	bitstring, %function
bitstring:
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
	ldr	r3, [r7, #4]
	asrs	r2, r3, #2
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	ldr	r2, [r7, #4]
	and	r2, r2, #3
	cmp	r2, #0
	ite	eq
	moveq	r2, #1
	movne	r2, #0
	uxtb	r2, r2
	subs	r3, r3, r2
	ldr	r2, [r7]
	subs	r3, r2, r3
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L2
.L3:
	ldr	r3, [r7, #12]
	adds	r2, r3, #1
	str	r2, [r7, #12]
	movs	r2, #32
	strb	r2, [r3]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L2:
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	blt	.L3
	b	.L4
.L5:
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	asr	r3, r2, r3
	uxtb	r3, r3
	and	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [r7, #12]
	adds	r1, r3, #1
	str	r1, [r7, #12]
	adds	r2, r2, #48
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [r7, #4]
	and	r3, r3, #3
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L4
	ldr	r3, [r7, #12]
	adds	r2, r3, #1
	str	r2, [r7, #12]
	movs	r2, #32
	strb	r2, [r3]
.L4:
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bge	.L5
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	bitstring, .-bitstring
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
