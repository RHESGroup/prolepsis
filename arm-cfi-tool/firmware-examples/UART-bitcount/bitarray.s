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
	.file	"bitarray.c"
	.text
	.align	1
	.global	alloc_bit_array
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	alloc_bit_array, %function
alloc_bit_array:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	adds	r3, r3, #7
	lsrs	r3, r3, #3
	movs	r1, #1
	mov	r0, r3
	bl	calloc
	mov	r3, r0
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	alloc_bit_array, .-alloc_bit_array
	.align	1
	.global	getbit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	getbit, %function
getbit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	bge	.L4
	adds	r3, r3, #7
.L4:
	asrs	r3, r3, #3
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [r7]
	rsbs	r2, r3, #0
	and	r3, r3, #7
	and	r2, r2, #7
	it	pl
	rsbpl	r3, r2, #0
	asr	r3, r1, r3
	and	r3, r3, #1
	cmp	r3, #0
	ite	ne
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	getbit, .-getbit
	.align	1
	.global	setbit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	setbit, %function
setbit:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bge	.L7
	adds	r3, r3, #7
.L7:
	asrs	r3, r3, #3
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L8
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxtb	r2, r3
	ldr	r3, [r7, #8]
	rsbs	r1, r3, #0
	and	r3, r3, #7
	and	r1, r1, #7
	it	pl
	rsbpl	r3, r1, #0
	movs	r1, #1
	lsl	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r3, r2
	sxtb	r3, r3
	uxtb	r2, r3
	ldr	r3, [r7, #12]
	strb	r2, [r3]
	b	.L10
.L8:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxtb	r2, r3
	ldr	r3, [r7, #8]
	rsbs	r1, r3, #0
	and	r3, r3, #7
	and	r1, r1, #7
	it	pl
	rsbpl	r3, r1, #0
	movs	r1, #1
	lsl	r3, r1, r3
	sxtb	r3, r3
	mvns	r3, r3
	sxtb	r3, r3
	ands	r3, r3, r2
	sxtb	r3, r3
	uxtb	r2, r3
	ldr	r3, [r7, #12]
	strb	r2, [r3]
.L10:
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	setbit, .-setbit
	.align	1
	.global	flipbit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	flipbit, %function
flipbit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	bge	.L12
	adds	r3, r3, #7
.L12:
	asrs	r3, r3, #3
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxtb	r2, r3
	ldr	r3, [r7]
	rsbs	r1, r3, #0
	and	r3, r3, #7
	and	r1, r1, #7
	it	pl
	rsbpl	r3, r1, #0
	movs	r1, #1
	lsl	r3, r1, r3
	sxtb	r3, r3
	eors	r3, r3, r2
	sxtb	r3, r3
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	flipbit, .-flipbit
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
