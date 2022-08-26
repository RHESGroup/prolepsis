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
	.file	"bstr_i.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"01\000"
	.text
	.align	1
	.global	bstr_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	bstr_i, %function
bstr_i:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L2
.L4:
	ldr	r3, [r7, #4]
	adds	r2, r3, #1
	str	r2, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	subs	r3, r3, #48
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	lsls	r3, r3, #1
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	and	r3, r3, #1
	ldr	r2, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, .L6
	bl	strchr
	mov	r3, r0
	cmp	r3, #0
	bne	.L4
.L3:
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L7:
	.align	2
.L6:
	.word	.LC0
	.size	bstr_i, .-bstr_i
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
