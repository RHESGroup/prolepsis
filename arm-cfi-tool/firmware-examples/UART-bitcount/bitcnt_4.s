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
	.file	"bitcnt_4.c"
	.text
	.section	.data.bits,"aw",%progbits
	.align	2
	.type	bits, %object
	.size	bits, 256
bits:
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	6
	.byte	7
	.byte	7
	.byte	8
	.text
	.align	1
	.global	ntbl_bitcnt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ntbl_bitcnt, %function
ntbl_bitcnt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	PUSH {R1, R2}
	MOV R1, #44 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	and	r3, r3, #15
	ldr	r2, .L4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	asrs	r3, r3, #4
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L2
	ldr	r0, [r7, #4]
	bl	ntbl_bitcnt @qui
	mov	r2, r0
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L5:
	.align	2
.L4:
	.word	bits
	.size	ntbl_bitcnt, .-ntbl_bitcnt
	.align	1
	.global	btbl_bitcnt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	btbl_bitcnt, %function
btbl_bitcnt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	adds	r3, r7, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L9
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	asrs	r3, r3, #8
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L7
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	btbl_bitcnt
	mov	r2, r0
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #12]
.L7:
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
	.word	bits
	.size	btbl_bitcnt, .-btbl_bitcnt
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
