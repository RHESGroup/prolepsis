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
	.file	"bmhsrch.c"
	.text
	.section	.bss.patlen,"aw",%nobits
	.align	2
	.type	patlen, %object
	.size	patlen, 4
patlen:
	.space	4
	.section	.bss.skip,"aw",%nobits
	.align	2
	.type	skip, %object
	.size	skip, 1024
skip:
	.space	1024
	.section	.bss.skip2,"aw",%nobits
	.align	2
	.type	skip2, %object
	.size	skip2, 4
skip2:
	.space	4
	.section	.bss.pat,"aw",%nobits
	.align	2
	.type	pat, %object
	.size	pat, 4
pat:
	.space	4
	.text
	.align	1
	.global	bmh_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	bmh_init, %function
bmh_init:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r2, .L9
	ldr	r3, [r7, #4]
	str	r3, [r2]
	ldr	r0, [r7, #4]
	bl	strlen
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L9+4
	str	r2, [r3]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L2
.L3:
	ldr	r3, .L9+4
	ldr	r2, [r3]
	ldr	r1, .L9+8
	ldr	r3, [r7, #12]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #12]
	cmp	r3, #255
	ble	.L3
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L4
.L5:
	ldr	r3, .L9+4
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	ldr	r2, .L9
	ldr	r1, [r2]
	ldr	r2, [r7, #12]
	add	r2, r2, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	mov	r1, r2
	subs	r3, r3, #1
	ldr	r2, .L9+8
	str	r3, [r2, r1, lsl #2]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L4:
	ldr	r3, .L9+4
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	cmp	r2, r3
	blt	.L5
	ldr	r3, .L9
	ldr	r2, [r3]
	ldr	r3, .L9+4
	ldr	r3, [r3]
	subs	r3, r3, #1
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [r7, #8]
	ldr	r2, .L9+8
	ldr	r3, [r7, #8]
	movw	r1, #32767
	str	r1, [r2, r3, lsl #2]
	ldr	r3, .L9+4
	ldr	r3, [r3]
	ldr	r2, .L9+12
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L6
.L8:
	ldr	r3, .L9
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [r7, #8]
	cmp	r3, r2
	bne	.L7
	ldr	r3, .L9+4
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	subs	r3, r3, #1
	ldr	r2, .L9+12
	str	r3, [r2]
.L7:
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L6:
	ldr	r3, .L9+4
	ldr	r3, [r3]
	subs	r3, r3, #1
	ldr	r2, [r7, #12]
	cmp	r2, r3
	blt	.L8
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
	.word	pat
	.word	patlen
	.word	skip
	.word	skip2
	.size	bmh_init, .-bmh_init
	.align	1
	.global	bmh_search
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	bmh_search, %function
bmh_search:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, .L21
	ldr	r3, [r3]
	subs	r2, r3, #1
	ldr	r3, [r7]
	subs	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L12
	movs	r3, #0
	b	.L13
.L12:
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
.L20:
	nop
.L14:
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L21+4
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [r7, #20]
	add	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L14
	ldr	r3, [r7]
	rsb	r3, r3, #32640
	adds	r3, r3, #127
	ldr	r2, [r7, #20]
	cmp	r2, r3
	bge	.L15
	movs	r3, #0
	b	.L13
.L15:
	ldr	r3, [r7, #20]
	sub	r3, r3, #32640
	subs	r3, r3, #127
	str	r3, [r7, #20]
	ldr	r3, .L21
	ldr	r3, [r3]
	subs	r3, r3, #1
	str	r3, [r7, #16]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #12]
.L17:
	ldr	r3, [r7, #16]
	subs	r3, r3, #1
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	cmp	r3, #0
	blt	.L16
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #12]
	add	r3, r3, r2
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, .L21+8
	ldr	r1, [r3]
	ldr	r3, [r7, #16]
	add	r3, r3, r1
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L17
.L16:
	ldr	r3, [r7, #16]
	cmp	r3, #0
	bge	.L18
	ldr	r3, [r7, #12]
	b	.L13
.L18:
	ldr	r3, .L21+12
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	add	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L20
	movs	r3, #0
.L13:
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	patlen
	.word	skip
	.word	pat
	.word	skip2
	.size	bmh_search, .-bmh_search
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
