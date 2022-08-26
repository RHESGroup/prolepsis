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
	.file	"bitcnt_2.c"
	.text
	.align	1
	.global	bitcount
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	bitcount, %function
bitcount:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	PUSH {R1, R2}
	MOV R1, #43 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #1
	and	r2, r3, #1431655765
	ldr	r3, [r7, #4]
	and	r3, r3, #1431655765
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #2
	and	r2, r3, #858993459
	ldr	r3, [r7, #4]
	and	r3, r3, #858993459
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #4
	and	r2, r3, #252645135
	ldr	r3, [r7, #4]
	and	r3, r3, #252645135
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #8
	and	r2, r3, #16711935
	ldr	r3, [r7, #4]
	and	r3, r3, #16711935
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	lsrs	r2, r3, #16
	ldr	r3, [r7, #4]
	uxth	r3, r3
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	bitcount, .-bitcount
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
