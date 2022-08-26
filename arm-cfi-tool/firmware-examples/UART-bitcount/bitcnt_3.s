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
	.file	"bitcnt_3.c"
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
	.global	ntbl_bitcount
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ntbl_bitcount, %function
ntbl_bitcount:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	PUSH {R1, R2}
	MOV R1, #46 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	and	r3, r3, #15
	ldr	r2, .L3
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #4
	and	r3, r3, #15
	ldr	r2, .L3
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	add	r3, r3, r1
	ldr	r2, [r7, #4]
	lsrs	r2, r2, #8
	and	r2, r2, #15
	ldr	r1, .L3
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, [r7, #4]
	lsrs	r2, r2, #12
	and	r2, r2, #15
	ldr	r1, .L3
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, [r7, #4]
	lsrs	r2, r2, #16
	and	r2, r2, #15
	ldr	r1, .L3
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, [r7, #4]
	lsrs	r2, r2, #20
	and	r2, r2, #15
	ldr	r1, .L3
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, [r7, #4]
	lsrs	r2, r2, #24
	and	r2, r2, #15
	ldr	r1, .L3
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, [r7, #4]
	lsrs	r2, r2, #28
	mov	r1, r2
	ldr	r2, .L3
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	add	r3, r3, r2
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L4:
	.align	2
.L3:
	.word	bits
	.size	ntbl_bitcount, .-ntbl_bitcount
	.align	1
	.global	BW_btbl_bitcount
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	BW_btbl_bitcount, %function
BW_btbl_bitcount:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	PUSH {R1, R2}
	MOV R1, #45 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	ldrb	r3, [r7, #12]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L7
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [r7, #13]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, .L7
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	add	r3, r3, r2
	ldrb	r2, [r7, #15]	@ zero_extendqisi2
	mov	r1, r2
	ldr	r2, .L7
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	add	r3, r3, r2
	ldrb	r2, [r7, #14]	@ zero_extendqisi2
	mov	r1, r2
	ldr	r2, .L7
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	add	r3, r3, r2
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	bits
	.size	BW_btbl_bitcount, .-BW_btbl_bitcount
	.align	1
	.global	AR_btbl_bitcount
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	AR_btbl_bitcount, %function
AR_btbl_bitcount:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	PUSH {R1, R2}
	MOV R1, #47 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	adds	r3, r7, #4
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	adds	r2, r3, #1
	str	r2, [r7, #12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L11
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r2, r3, #1
	str	r2, [r7, #12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L11
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r2, r3, #1
	str	r2, [r7, #12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L11
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L11
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	bits
	.size	AR_btbl_bitcount, .-AR_btbl_bitcount
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
