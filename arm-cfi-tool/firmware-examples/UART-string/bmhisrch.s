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
	.file	"bmhisrch.c"
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
	.global	bmhi_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	bmhi_init, %function
bmhi_init:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	strlen
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L18
	str	r2, [r3]
	ldr	r3, .L18+4
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	realloc
	mov	r2, r0
	ldr	r3, .L18+4
	str	r2, [r3]
	ldr	r3, .L18+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L2
	movs	r0, #1
	bl	exit
.L2:
	ldr	r0, .L18+8
	bl	atexit
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L3
.L6:
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldrb	r3, [r3]
	strb	r3, [r7, #10]
	bl	__locale_ctype_ptr
	mov	r2, r0
	ldrb	r3, [r7, #10]	@ zero_extendqisi2
	adds	r3, r3, #1
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #2
	bne	.L4
	ldrb	r3, [r7, #10]	@ zero_extendqisi2
	subs	r3, r3, #32
	b	.L5
.L4:
	ldrb	r3, [r7, #10]	@ zero_extendqisi2
.L5:
	ldr	r2, .L18+4
	ldr	r1, [r2]
	ldr	r2, [r7, #20]
	add	r2, r2, r1
	uxtb	r3, r3
	strb	r3, [r2]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L3:
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	cmp	r2, r3
	blt	.L6
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L7
.L8:
	ldr	r3, .L18
	ldr	r2, [r3]
	ldr	r1, .L18+12
	ldr	r3, [r7, #20]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L7:
	ldr	r3, [r7, #20]
	cmp	r3, #255
	ble	.L8
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L9
.L12:
	ldr	r3, .L18
	ldr	r2, [r3]
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	ldr	r2, .L18+4
	ldr	r1, [r2]
	ldr	r2, [r7, #20]
	add	r2, r2, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	mov	r1, r2
	subs	r3, r3, #1
	ldr	r2, .L18+12
	str	r3, [r2, r1, lsl #2]
	ldr	r3, .L18
	ldr	r2, [r3]
	ldr	r3, [r7, #20]
	subs	r4, r2, r3
	ldr	r3, .L18+4
	ldr	r2, [r3]
	ldr	r3, [r7, #20]
	add	r3, r3, r2
	ldrb	r3, [r3]
	strb	r3, [r7, #11]
	bl	__locale_ctype_ptr
	mov	r2, r0
	ldrb	r3, [r7, #11]	@ zero_extendqisi2
	adds	r3, r3, #1
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #1
	bne	.L10
	ldrb	r3, [r7, #11]	@ zero_extendqisi2
	adds	r3, r3, #32
	b	.L11
.L10:
	ldrb	r3, [r7, #11]	@ zero_extendqisi2
.L11:
	subs	r2, r4, #1
	ldr	r1, .L18+12
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L9:
	ldr	r3, .L18
	ldr	r3, [r3]
	subs	r3, r3, #1
	ldr	r2, [r7, #20]
	cmp	r2, r3
	blt	.L12
	ldr	r3, .L18+4
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	subs	r3, r3, #1
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [r7, #16]
	ldr	r2, .L18+12
	ldr	r3, [r7, #16]
	movw	r1, #32767
	str	r1, [r2, r3, lsl #2]
	ldr	r3, [r7, #16]
	str	r3, [r7, #12]
	bl	__locale_ctype_ptr
	mov	r2, r0
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #1
	bne	.L13
	ldr	r3, [r7, #12]
	adds	r3, r3, #32
	b	.L14
.L13:
	ldr	r3, [r7, #12]
.L14:
	ldr	r2, .L18+12
	movw	r1, #32767
	str	r1, [r2, r3, lsl #2]
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, .L18+16
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L15
.L17:
	ldr	r3, .L18+4
	ldr	r2, [r3]
	ldr	r3, [r7, #20]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [r7, #16]
	cmp	r3, r2
	bne	.L16
	ldr	r3, .L18
	ldr	r2, [r3]
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	subs	r3, r3, #1
	ldr	r2, .L18+16
	str	r3, [r2]
.L16:
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L15:
	ldr	r3, .L18
	ldr	r3, [r3]
	subs	r3, r3, #1
	ldr	r2, [r7, #20]
	cmp	r2, r3
	blt	.L17
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L19:
	.align	2
.L18:
	.word	patlen
	.word	pat
	.word	bhmi_cleanup
	.word	skip
	.word	skip2
	.size	bmhi_init, .-bmhi_init
	.align	1
	.global	bmhi_search
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	bmhi_search, %function
bmhi_search:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, .L32
	ldr	r3, [r3]
	subs	r2, r3, #1
	ldr	r3, [r7]
	subs	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L21
	movs	r3, #0
	b	.L22
.L21:
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
.L31:
	nop
.L23:
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L32+4
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [r7, #20]
	add	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L23
	ldr	r3, [r7]
	rsb	r3, r3, #32640
	adds	r3, r3, #127
	ldr	r2, [r7, #20]
	cmp	r2, r3
	bge	.L24
	movs	r3, #0
	b	.L22
.L24:
	ldr	r3, [r7, #20]
	sub	r3, r3, #32640
	subs	r3, r3, #127
	str	r3, [r7, #20]
	ldr	r3, .L32
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
.L28:
	ldr	r3, [r7, #16]
	subs	r3, r3, #1
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	cmp	r3, #0
	blt	.L25
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #12]
	add	r3, r3, r2
	ldrb	r3, [r3]
	strb	r3, [r7, #11]
	bl	__locale_ctype_ptr
	mov	r2, r0
	ldrb	r3, [r7, #11]	@ zero_extendqisi2
	adds	r3, r3, #1
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #2
	bne	.L26
	ldrb	r3, [r7, #11]	@ zero_extendqisi2
	subs	r3, r3, #32
	b	.L27
.L26:
	ldrb	r3, [r7, #11]	@ zero_extendqisi2
.L27:
	ldr	r2, .L32+8
	ldr	r1, [r2]
	ldr	r2, [r7, #16]
	add	r2, r2, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r3, r2
	beq	.L28
.L25:
	ldr	r3, [r7, #16]
	cmp	r3, #0
	bge	.L29
	ldr	r3, [r7, #12]
	b	.L22
.L29:
	ldr	r3, .L32+12
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	add	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	.L31
	movs	r3, #0
.L22:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L33:
	.align	2
.L32:
	.word	patlen
	.word	skip
	.word	pat
	.word	skip2
	.size	bmhi_search, .-bmhi_search
	.align	1
	.global	bhmi_cleanup
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	bhmi_cleanup, %function
bhmi_cleanup:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L35
	ldr	r3, [r3]
	mov	r0, r3
	bl	free
	nop
	pop	{r7, pc}
.L36:
	.align	2
.L35:
	.word	pat
	.size	bhmi_cleanup, .-bhmi_cleanup
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
