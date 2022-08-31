	.cpu cortex-m4
	.text
	.thumb
	.syntax unified

_start:
b _mainCRTStartup

_init:
	push	{r3, r4, r5, r6, r7, lr}
	nop
	pop	{r3, r4, r5, r6, r7}
	pop	{r3}
	mov	lr, r3
	bx	lr
exit:
	push	{r3, lr}
	movs	r1, #0
	mov	r4, r0
	bl	__call_exitprocs
	ldr	r3, =_global_impure_ptr	
	ldr	r0, [r3, #0]
	ldr	r3, [r0, #60]	
	cbz	r3, lab0
	blx	r3
lab0: 	mov	r0, r4
	bl	_exit
	nop
	.ltorg
register_fini:	push {r1, r2}
	ldr r1, =0x0493
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =0x00000000	
	cbz	r3, lab1
	ldr	r0, =0x00008c6d	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	ldr r1, =0x0373
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push	{r4, lr}
	ldr	r4, =completed.1	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x00008d48	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	ldr r1, =0x08ae
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, pc}
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x00008d48	
	nop
lab4: 	pop	{r3, pc}
	.ltorg
_stack_init:
	sub	sl, r3, #65536	
	bx	lr
	nop
_mainCRTStartup:
	ldr	r3, =0x00000000	
	cmp	r3, #0
	it	eq
	ldreq	r3, =0x00080000	
	mov	sp, r3
	bl	_stack_init
	movs	r1, #0
	mov	fp, r1
	mov	r7, r1
	ldr	r0, =0x00019184	
	ldr	r2, =0x000191c4	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	ldr r1, =0x0472
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =0x00000000	
	cmp	r3, #0
	beq	lab5
	blx	r3
lab5: 	ldr	r3, =0x00000000	
	cmp	r3, #0
	beq	lab6
	blx	r3
lab6: 	movs	r0, #0
	movs	r1, #0
	movs	r4, r0
	movs	r5, r1
	ldr	r0, =0x00008c61	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x00008c6d	
push {r1, r2}
	ldr r1, =0x08fc
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	atexit
lab7:	push {r1, r2}
	ldr r1, =0x08fc
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	bl	__libc_init_array
	push {r1, r2}
	ldr r1, =0x03d7
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, r4
	movs	r1, r5
	bl	main
	push {r1, r2}
	ldr r1, =0x00bf
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	exit
	nop
	.ltorg
mulul64:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp}
	sub	sp, #172	
	add	r7, sp, #0
	strd	r0, r1, [r7, #88]	
	strd	r2, r3, [r7, #80]	
	ldrd	r2, r3, [r7, #88]	
	mov	r0, #0
	mov	r1, #0
	movs	r0, r3
	movs	r1, #0
	strd	r0, r1, [r7, #160]	
	ldrd	r2, r3, [r7, #88]	
	mov	sl, r2
	mov	fp, #0
	strd	sl, fp, [r7, #152]	
	ldrd	r2, r3, [r7, #80]	
	mov	r0, #0
	mov	r1, #0
	movs	r0, r3
	movs	r1, #0
	strd	r0, r1, [r7, #144]	
	ldrd	r2, r3, [r7, #80]	
	str	r2, [r7, #32]
	mov	ip, #0
	str	ip, [r7, #36]	
	ldrd	r2, r3, [r7, #32]
	strd	r2, r3, [r7, #136]	
	ldr	r2, [r7, #156]	
	ldr	r3, [r7, #136]	
	mul	r1, r3, r2
	ldr	r2, [r7, #140]	
	ldr	r3, [r7, #152]	
	mul	r3, r2, r3
	add	r1, r3
	ldr	r2, [r7, #152]	
	ldr	r3, [r7, #136]	
	umull	r4, r5, r2, r3
	adds	r3, r1, r5
	mov	r5, r3
	strd	r4, r5, [r7, #128]	
	strd	r4, r5, [r7, #128]	
	ldrd	r2, r3, [r7, #128]	
	str	r2, [r7, #24]
	str	ip, [r7, #28]
	ldrd	r3, r4, [r7, #24]
	strd	r3, r4, [r7, #120]	
	ldrd	r2, r3, [r7, #128]	
	mov	r0, #0
	mov	r1, #0
	movs	r0, r3
	movs	r1, #0
	strd	r0, r1, [r7, #112]	
	ldr	r2, [r7, #164]	
	ldr	r3, [r7, #136]	
	mul	r1, r3, r2
	ldr	r2, [r7, #140]	
	ldr	r3, [r7, #160]	
	mul	r3, r2, r3
	add	r1, r3
	ldr	r2, [r7, #160]	
	ldr	r3, [r7, #136]	
	umull	r3, r2, r2, r3
	str	r2, [r7, #76]	
	str	r3, [r7, #72]	
	ldr	r3, [r7, #76]	
	adds	r3, r1, r3
	str	r3, [r7, #76]	
	ldrd	r2, r3, [r7, #112]	
	ldrd	r4, r5, [r7, #72]	
	mov	r1, r4
	adds	r1, r2, r1
	str	r1, [r7, #16]
	mov	r1, r5
	adc	r1, r3, r1
	str	r1, [r7, #20]
	ldrd	r3, r4, [r7, #16]
	strd	r3, r4, [r7, #128]	
	ldrd	r2, r3, [r7, #128]	
	str	r2, [r7, #8]
	str	ip, [r7, #12]
	ldrd	r3, r4, [r7, #8]
	strd	r3, r4, [r7, #104]	
	ldrd	r2, r3, [r7, #128]	
	mov	r0, #0
	mov	r1, #0
	movs	r0, r3
	movs	r1, #0
	strd	r0, r1, [r7, #96]	
	ldr	r3, [r7, #156]	
	ldr	r2, [r7, #144]	
	mul	r1, r2, r3
	ldr	r2, [r7, #148]	
	ldr	r3, [r7, #152]	
	mul	r3, r2, r3
	adds	r2, r1, r3
	ldr	r1, [r7, #152]	
	ldr	r3, [r7, #144]	
	umull	r3, r1, r1, r3
	str	r1, [r7, #68]	
	str	r3, [r7, #64]	
	ldr	r3, [r7, #68]	
	adds	r3, r2, r3
	str	r3, [r7, #68]	
	ldrd	r2, r3, [r7, #104]	
	ldrd	r4, r5, [r7, #64]	
	mov	r1, r4
	adds	r1, r2, r1
	str	r1, [r7, #0]
	mov	r1, r5
	adc	r1, r3, r1
	str	r1, [r7, #4]
	ldrd	r3, r4, [r7]
	strd	r3, r4, [r7, #128]	
	ldrd	r0, r1, [r7, #128]	
	mov	r2, #0
	mov	r3, #0
	movs	r2, r1
	movs	r3, #0
	strd	r2, r3, [r7, #112]	
	ldrd	r0, r1, [r7, #128]	
	mov	r2, #0
	mov	r3, #0
	movs	r3, r0
	movs	r2, #0
	ldrd	r0, r1, [r7, #120]	
	adds	r4, r2, r0
	str	r4, [r7, #56]	
	adcs	r3, r1
	str	r3, [r7, #60]	
	ldr	r3, [r7, #204]	
	ldrd	r1, r2, [r7, #56]	
	strd	r1, r2, [r3]
	ldr	r3, [r7, #164]	
	ldr	r2, [r7, #144]	
	mul	r2, r3, r2
	ldr	r3, [r7, #148]	
	ldr	r1, [r7, #160]	
	mul	r3, r1, r3
	add	r3, r2
	ldr	r1, [r7, #160]	
	ldr	r2, [r7, #144]	
	umull	r8, r9, r1, r2
	add	r3, r9
	mov	r9, r3
	ldrd	r2, r3, [r7, #96]	
	adds	r1, r8, r2
	str	r1, [r7, #48]	
	adc	r3, r9, r3
	str	r3, [r7, #52]	
	ldrd	r2, r3, [r7, #112]	
	ldrd	r4, r5, [r7, #48]	
	mov	r1, r4
	adds	r1, r1, r2
	str	r1, [r7, #40]	
	mov	r1, r5
	adc	r1, r3, r1
	str	r1, [r7, #44]	
	ldr	r3, [r7, #200]	
	ldrd	r1, r2, [r7, #40]	
	strd	r1, r2, [r3]
	nop
	adds	r7, #172	
	mov	sp, r7
	ldmia	sp!, {r4, r5, r7, r8, r9, sl, fp}
	bx	lr
modul64:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp}
	sub	sp, #76	
	add	r7, sp, #0
	strd	r0, r1, [r7, #48]	
	strd	r2, r3, [r7, #40]	
	mov	r2, #1
	mov	r3, #0
	strd	r2, r3, [r7, #64]	
	b	lab8
lab10: 	mov	r0, #0
	mov	r1, #0
	asrs	r0, r3, #31
	asrs	r1, r3, #31
	strd	r0, r1, [r7, #56]	
	ldrd	r2, r3, [r7, #48]	
	adds	r1, r2, r2
	str	r1, [r7, #32]
	adcs	r3, r3
	str	r3, [r7, #36]	
	ldrd	r4, r5, [r7, #32]
	ldrd	r2, r3, [r7, #40]	
	mov	r0, #0
	mov	r1, #0
	lsrs	r0, r3, #31
	movs	r1, #0
	orr	sl, r4, r0
	orr	fp, r5, r1
	strd	sl, fp, [r7, #48]	
	ldrd	r2, r3, [r7, #40]	
	adds	r1, r2, r2
	str	r1, [r7, #24]
	adcs	r3, r3
	str	r3, [r7, #28]
	ldrd	r3, r4, [r7, #24]
	strd	r3, r4, [r7, #40]	
	ldrd	r0, r1, [r7, #56]	
	ldrd	r2, r3, [r7, #48]	
	orr	r8, r0, r2
	orr	r9, r1, r3
	ldrd	r2, r3, [r7, #104]	
	cmp	r8, r2
	sbcs	r3, r9, r3
	bcc	lab9
	ldrd	r0, r1, [r7, #48]	
	ldrd	r2, r3, [r7, #104]	
	subs	r4, r0, r2
	str	r4, [r7, #16]
	sbc	r3, r1, r3
	str	r3, [r7, #20]
	ldrd	r3, r4, [r7, #16]
	strd	r3, r4, [r7, #48]	
	ldrd	r2, r3, [r7, #40]	
	adds	r1, r2, #1
	str	r1, [r7, #8]
	adc	r3, r3, #0
	str	r3, [r7, #12]
	ldrd	r3, r4, [r7, #8]
	strd	r3, r4, [r7, #40]	
lab9: 	ldrd	r2, r3, [r7, #64]	
	adds	r1, r2, #1
	str	r1, [r7, #0]
	adc	r3, r3, #0
	str	r3, [r7, #4]
	ldrd	r3, r4, [r7]
	strd	r3, r4, [r7, #64]	
lab8: 	ldrd	r2, r3, [r7, #64]	
	cmp	r2, #65	
	sbcs	r3, r3, #0
	blt	lab10
	ldrd	r2, r3, [r7, #48]	
	mov	r0, r2
	mov	r1, r3
	adds	r7, #76	
	mov	sp, r7
	ldmia	sp!, {r4, r5, r7, r8, r9, sl, fp}
	bx	lr
montmul:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp, lr}
	sub	sp, #144	
	add	r7, sp, #8
	strd	r0, r1, [r7, #64]	
	strd	r2, r3, [r7, #56]	
	add	r3, r7, #88	
	str	r3, [sp, #4]
	add	r3, r7, #96	
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #56]	
	ldrd	r0, r1, [r7, #64]	
	bl	mulul64
	ldrd	r2, r3, [r7, #88]	
	ldr	r1, [r7, #180]	
	mul	r0, r2, r1
	ldr	r1, [r7, #176]	
	mul	r1, r3, r1
	add	r0, r1
	ldr	r1, [r7, #176]	
	umull	r4, r5, r1, r2
	adds	r3, r0, r5
	mov	r5, r3
	strd	r4, r5, [r7, #120]	
	strd	r4, r5, [r7, #120]	
	add	r3, r7, #72	
	str	r3, [sp, #4]
	add	r3, r7, #80	
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #168]	
	ldrd	r0, r1, [r7, #120]	
	bl	mulul64
	ldrd	r0, r1, [r7, #88]	
	ldrd	r2, r3, [r7, #72]	
	adds	r4, r0, r2
	str	r4, [r7, #32]
	adc	r3, r1, r3
	str	r3, [r7, #36]	
	ldrd	r3, r4, [r7, #32]
	strd	r3, r4, [r7, #112]	
	ldrd	r0, r1, [r7, #96]	
	ldrd	r2, r3, [r7, #80]	
	adds	r4, r0, r2
	str	r4, [r7, #24]
	adc	r3, r1, r3
	str	r3, [r7, #28]
	ldrd	r3, r4, [r7, #24]
	strd	r3, r4, [r7, #128]	
	ldrd	r0, r1, [r7, #88]	
	ldrd	r2, r3, [r7, #112]	
	cmp	r2, r0
	sbcs	r3, r1
	bcs	lab11
	ldrd	r2, r3, [r7, #128]	
	adds	r1, r2, #1
	str	r1, [r7, #16]
	adc	r3, r3, #0
	str	r3, [r7, #20]
	ldrd	r3, r4, [r7, #16]
	strd	r3, r4, [r7, #128]	
lab11: 	ldrd	r0, r1, [r7, #96]	
	ldrd	r2, r3, [r7, #128]	
	cmp	r2, r0
	sbcs	r3, r1
	ite	cc
	movcc	r3, #1
	movcs	r3, #0
	uxtb	r3, r3
	mov	r5, r3
	ldrd	r0, r1, [r7, #96]	
	ldrd	r2, r3, [r7, #128]	
	cmp	r3, r1
	it	eq
	cmpeq	r2, r0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r4, r3
	ldrd	r0, r1, [r7, #88]	
	ldrd	r2, r3, [r7, #112]	
	cmp	r2, r0
	sbcs	r3, r1
	ite	cc
	movcc	r3, #1
	movcs	r3, #0
	uxtb	r3, r3
	ands	r3, r4
	uxtb	r3, r3
	orrs	r3, r5
	asrs	r2, r3, #31
	str	r3, [r7, #8]
	str	r2, [r7, #12]
	ldrd	r3, r4, [r7, #8]
	strd	r3, r4, [r7, #104]	
	ldrd	r2, r3, [r7, #128]	
	strd	r2, r3, [r7, #112]	
	mov	r2, #0
	mov	r3, #0
	strd	r2, r3, [r7, #128]	
	ldrd	r0, r1, [r7, #112]	
	ldrd	r2, r3, [r7, #168]	
	cmp	r0, r2
	sbcs	r3, r1, r3
	ite	cs
	movcs	r3, #1
	movcc	r3, #0
	uxtb	r3, r3
	uxtb	r3, r3
	movs	r2, #0
	str	r3, [r7, #48]	
	str	r2, [r7, #52]	
	ldrd	r2, r3, [r7, #104]	
	ldrd	r0, r1, [r7, #48]	
	mov	r4, r0
	orrs	r4, r2
	str	r4, [r7, #40]	
	orrs	r1, r3
	str	r1, [r7, #44]	
	movs	r3, #0
	ldrd	r1, r2, [r7, #40]	
	mov	r0, r1
	rsbs	sl, r0, #0
	sbc	fp, r3, r2
	ldrd	r2, r3, [r7, #168]	
	and	r8, sl, r2
	and	r9, fp, r3
	ldrd	r2, r3, [r7, #112]	
	subs	r1, r2, r8
	str	r1, [r7, #0]
	sbc	r3, r3, r9
	str	r3, [r7, #4]
	ldrd	r3, r4, [r7]
	strd	r3, r4, [r7, #112]	
	ldrd	r2, r3, [r7, #112]	
	mov	r0, r2
	mov	r1, r3
	adds	r7, #136	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x070e
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	ldmia	sp!, {r4, r5, r7, r8, r9, sl, fp, pc}
xbinGCD:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp}
	sub	sp, #76	
	add	r7, sp, #0
	strd	r0, r1, [r7, #32]
	strd	r2, r3, [r7, #24]
	mov	r2, #1
	mov	r3, #0
	strd	r2, r3, [r7, #64]	
	mov	r2, #0
	mov	r3, #0
	strd	r2, r3, [r7, #56]	
	ldrd	r2, r3, [r7, #32]
	strd	r2, r3, [r7, #48]	
	ldrd	r2, r3, [r7, #24]
	strd	r2, r3, [r7, #40]	
	b	lab12
lab14: 	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsrs	r3, r1, #1
	strd	r2, r3, [r7, #32]
	ldrd	r2, r3, [r7, #64]	
	and	r3, r2, #1
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #20]
	ldrd	r3, r4, [r7, #16]
	mov	r2, r3
	mov	r3, r4
	orrs	r3, r2
	bne	lab13
	ldrd	r0, r1, [r7, #64]	
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsrs	r3, r1, #1
	strd	r2, r3, [r7, #64]	
	ldrd	r0, r1, [r7, #56]	
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsrs	r3, r1, #1
	strd	r2, r3, [r7, #56]	
	b	lab12
lab13: 	ldrd	r0, r1, [r7, #64]	
	ldrd	r2, r3, [r7, #40]	
	eor	r8, r0, r2
	eor	r9, r1, r3
	mov	r2, #0
	mov	r3, #0
	mov	r2, r8, lsr #1
	orr	r2, r2, r9, lsl #31
	mov	r3, r9, lsr #1
	ldrd	r4, r5, [r7, #64]	
	ldrd	r0, r1, [r7, #40]	
	and	sl, r4, r0
	and	fp, r5, r1
	adds	r1, r2, sl
	str	r1, [r7, #8]
	adc	r3, r3, fp
	str	r3, [r7, #12]
	ldrd	r3, r4, [r7, #8]
	strd	r3, r4, [r7, #64]	
	ldrd	r0, r1, [r7, #56]	
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsrs	r3, r1, #1
	ldrd	r0, r1, [r7, #48]	
	adds	r4, r0, r2
	str	r4, [r7, #0]
	adc	r3, r1, r3
	str	r3, [r7, #4]
	ldrd	r3, r4, [r7]
	strd	r3, r4, [r7, #56]	
lab12: 	ldrd	r2, r3, [r7, #32]
	orrs	r3, r2
	bne	lab14
	ldr	r1, [r7, #104]	
	ldrd	r2, r3, [r7, #64]	
	strd	r2, r3, [r1]
	ldr	r1, [r7, #108]	
	ldrd	r2, r3, [r7, #56]	
	strd	r2, r3, [r1]
	nop
	adds	r7, #76	
	mov	sp, r7
	ldmia	sp!, {r4, r5, r7, r8, r9, sl, fp}
	bx	lr
warm_caches:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
push {r1, r2}
	ldr r1, =0x09f3
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x09f3
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #12]
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x1a21
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movw	r0, #423	
push {r1, r2}
	ldr r1, =0x19f3
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x19f3
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x04d0
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark_body:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp, lr}
	sub	sp, #160	
	add	r7, sp, #16
	str	r0, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #140]	
	b	lab15
lab18: 	str	r3, [r7, #136]	
	ldr	r3, =in_m	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r7, #128]	
	ldr	r3, =in_b	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r7, #120]	
	ldr	r3, =in_a	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r7, #112]	
	add	r3, r7, #56	
	str	r3, [sp, #4]
	add	r3, r7, #64	
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #120]	
	ldrd	r0, r1, [r7, #112]	
	bl	mulul64
	ldrd	r0, r1, [r7, #64]	
	ldrd	r4, r5, [r7, #56]	
	ldrd	r2, r3, [r7, #128]	
	strd	r2, r3, [sp]
	mov	r2, r4
	mov	r3, r5
	bl	modul64
	strd	r0, r1, [r7, #104]	
	add	r3, r7, #56	
	str	r3, [sp, #4]
	add	r3, r7, #64	
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #104]	
	ldrd	r0, r1, [r7, #104]	
	bl	mulul64
	ldrd	r0, r1, [r7, #64]	
	ldrd	r4, r5, [r7, #56]	
	ldrd	r2, r3, [r7, #128]	
	strd	r2, r3, [sp]
	mov	r2, r4
	mov	r3, r5
	bl	modul64
	strd	r0, r1, [r7, #104]	
	add	r3, r7, #56	
	str	r3, [sp, #4]
	add	r3, r7, #64	
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #104]	
	ldrd	r0, r1, [r7, #104]	
	bl	mulul64
	ldrd	r0, r1, [r7, #64]	
	ldrd	r4, r5, [r7, #56]	
	ldrd	r2, r3, [r7, #128]	
	strd	r2, r3, [sp]
	mov	r2, r4
	mov	r3, r5
	bl	modul64
	strd	r0, r1, [r7, #104]	
	mov	r2, #0
	mov	r3, #2147483648	
	strd	r2, r3, [r7, #96]	
	add	r3, r7, #24
	str	r3, [sp, #4]
	add	r3, r7, #32
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #128]	
	ldrd	r0, r1, [r7, #96]	
	bl	xbinGCD
	ldrd	r2, r3, [r7, #32]
	ldr	r1, [r7, #96]	
	mul	r0, r3, r1
	ldr	r1, [r7, #100]	
	mul	r1, r2, r1
	add	r1, r0
	ldr	r0, [r7, #96]	
	umull	r8, r9, r0, r2
	add	r3, r1, r9
	mov	r9, r3
	adds	r3, r8, r8
	str	r3, [r7, #0]
	adc	r3, r9, r9
	str	r3, [r7, #4]
	ldrd	r0, r1, [r7]
	ldrd	r2, r3, [r7, #24]
	ldr	r4, [r7, #128]	
	mul	r5, r3, r4
	ldr	r4, [r7, #132]	
	mul	r4, r2, r4
	add	r4, r5
	ldr	r5, [r7, #128]	
	umull	sl, fp, r5, r2
	add	r3, r4, fp
	mov	fp, r3
	subs	r3, r0, sl
	str	r3, [r7, #8]
	sbc	r3, r1, fp
	str	r3, [r7, #12]
	ldrd	r1, r2, [r7, #8]
	mov	r3, r1
	subs	r3, #1
	orrs	r3, r2
	beq	lab16
	movs	r3, #1
	str	r3, [r7, #136]	
lab16: 	ldrd	r2, r3, [r7, #128]	
	strd	r2, r3, [sp]
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, r1, [r7, #112]	
	bl	modul64
	strd	r0, r1, [r7, #88]	
	ldrd	r2, r3, [r7, #128]	
	strd	r2, r3, [sp]
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, r1, [r7, #120]	
	bl	modul64
	strd	r0, r1, [r7, #80]	
	ldrd	r2, r3, [r7, #24]
	strd	r2, r3, [sp, #8]
	ldrd	r2, r3, [r7, #128]	
	strd	r2, r3, [sp]
	ldrd	r2, r3, [r7, #80]	
	ldrd	r0, r1, [r7, #88]	
push {r1, r2}
	ldr r1, =0x0595
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	montmul
	push {r1, r2}
	ldr r1, =0x0595
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	strd	r0, r1, [r7, #72]	
	ldrd	r2, r3, [r7, #24]
	strd	r2, r3, [sp, #8]
	ldrd	r2, r3, [r7, #128]	
	strd	r2, r3, [sp]
	ldrd	r2, r3, [r7, #72]	
	ldrd	r0, r1, [r7, #72]	
push {r1, r2}
	ldr r1, =0x1595
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	montmul
	push {r1, r2}
	ldr r1, =0x1595
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	strd	r0, r1, [r7, #72]	
	ldrd	r2, r3, [r7, #24]
	strd	r2, r3, [sp, #8]
	ldrd	r2, r3, [r7, #128]	
	strd	r2, r3, [sp]
	ldrd	r2, r3, [r7, #72]	
	ldrd	r0, r1, [r7, #72]	
push {r1, r2}
	ldr r1, =0x0854
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	montmul
	push {r1, r2}
	ldr r1, =0x0854
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	strd	r0, r1, [r7, #72]	
	ldrd	r2, r3, [r7, #32]
	add	r1, r7, #40	
	str	r1, [sp, #4]
	add	r1, r7, #48	
	str	r1, [sp, #0]
	ldrd	r0, r1, [r7, #72]	
	bl	mulul64
	ldrd	r0, r1, [r7, #48]	
	ldrd	r4, r5, [r7, #40]	
	ldrd	r2, r3, [r7, #128]	
	strd	r2, r3, [sp]
	mov	r2, r4
	mov	r3, r5
	bl	modul64
	strd	r0, r1, [r7, #72]	
	ldrd	r0, r1, [r7, #72]	
	ldrd	r2, r3, [r7, #104]	
	cmp	r1, r3
	it	eq
	cmpeq	r0, r2
	beq	lab17
	movs	r3, #1
	str	r3, [r7, #136]	
lab17: 	ldr	r3, [r7, #140]	
	adds	r3, #1
	str	r3, [r7, #140]	
lab15: 	ldr	r2, [r7, #140]	
	ldr	r3, [r7, #20]
	cmp	r2, r3
	blt	lab18
	ldr	r3, [r7, #136]	
	mov	r0, r3
	adds	r7, #144	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x031b
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	ldmia	sp!, {r4, r5, r7, r8, r9, sl, fp, pc}
	.ltorg
initialise_benchmark:
	push	{r7}
	add	r7, sp, #0
	ldr	r1, =in_m	
	add	r3, pc, #40	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r1]
	ldr	r1, =in_b	
	add	r3, pc, #36	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r1]
	ldr	r1, =in_a	
	add	r3, pc, #32	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r1]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
verify_benchmark:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	movs	r0, r0
initialise_board:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =0xe000edfc	
	ldr	r3, [r3, #0]
	ldr	r2, =0xe000edfc	
	orr	r3, r3, #16777216	
	str	r3, [r2, #0]
	ldr	r3, =0xe0001004	
	movs	r2, #0
	str	r2, [r3, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
start_trigger:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =0xe0001000	
	ldr	r3, [r3, #0]
	ldr	r2, =0xe0001000	
	orr	r3, r3, #1
	str	r3, [r2, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
stop_trigger:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =0xe0001004	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =0xe0001000	
	ldr	r3, [r3, #0]
	ldr	r2, =0xe0001000	
	bic	r3, r3, #1
	str	r3, [r2, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
main:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	bl	initialise_board
	bl	initialise_benchmark
	movs	r0, #1
	bl	warm_caches
	push {r1, r2}
	ldr r1, =0x0597
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	start_trigger
	bl	benchmark
	push {r1, r2}
	ldr r1, =0x02e8
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	str	r3, [r7, #8]
	bl	stop_trigger
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	verify_benchmark
	str	r0, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x16f9
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x00018d4c	
	ldr	r5, =0x00018d4c	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab19
	movs	r4, #0
lab20: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x098a
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x174b
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab20
lab19: 	ldr	r6, =0x00018d54	
	ldr	r5, =0x00018d4c	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab21
	movs	r4, #0
lab22: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x198a
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x074b
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab22
lab21:	cpsid f
	push {r1, r2}
	ldr r1, =0x0a75
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, r6, pc}
	.ltorg
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab23
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab24
	uxtb	r2, r1
	mov	r3, r0
	b	lab25
lab26: 	bcc	lab24
lab25: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab26
lab34: 	bls	lab27
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab28
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab29: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab29
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab30
lab35: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab31: 	cmp	r3, r2
	bne	lab31
	and	r4, ip, #3
lab27: 	cbz	r4, lab24
lab33: 	add	r4, r3
lab32: 	cmp	r4, r3
	bne	lab32
lab24:	cpsid f
	push {r1, r2}
	ldr r1, =0x0b46
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, pc}
lab30: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab33
	b	lab24
lab23: 	mov	r3, r0
	mov	r4, r2
	b	lab34
lab28: 	mov	r2, r3
	mov	ip, r4
	b	lab35
__call_exitprocs:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, =__atexit_recursive_mutex	
	sub	sp, #12
	mov	fp, r0
	ldr	r0, [r3, #0]
	str	fp, [sp, #4]
	mov	r7, r1
	bl	__retarget_lock_acquire_recursive
	ldr	r3, =_global_impure_ptr	
	ldr	r8, [r3]
	ldr	r6, [r8, #328]	
	cbz	r6, lab36
	mov	r9, #1
	mov	sl, #0
lab42: 	subs	r5, r4, #1
	bmi	lab36
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab38: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab37
lab39: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab38
lab36: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab37: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab39
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab40
	blx	r2
lab45: 	cmp	r2, fp
	bne	lab41
lab44: 	cmp	r3, r6
	beq	lab39
	mov	r6, r3
	cmp	r6, #0
	bne	lab42
	b	lab36
lab40: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab43
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab44
lab41: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab42
	b	lab36
lab43: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab45
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =impure_data	
	ldr	r5, =0x00018d54	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab46
	subs	r3, #4
	add	r5, r3
lab47: 	ldr	r3, [r5], #-4
	cpsid f
	push {r1, r2}
	ldr r1, =0x1ad9
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r4, #0
	push {r1, r2}
	ldr r1, =0x1009
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab47
lab46: 	ldmia	sp!, {r3, r4, r5, lr}
	b	_fini
	.ltorg
__retarget_lock_acquire_recursive:
	bx	lr
	nop
__retarget_lock_release_recursive:
	bx	lr
	nop
__register_exitproc:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, =__atexit_recursive_mutex	
	mov	r6, r0
	ldr	r0, [sl]
	mov	r8, r3
	mov	r7, r1
	mov	r9, r2
	bl	__retarget_lock_acquire_recursive
	ldr	r3, =_global_impure_ptr	
	ldr	r3, [r3, #0]
	ldr	r4, [r3, #328]	
	cbz	r4, lab48
lab52: 	cmp	r5, #31
	bgt	lab49
	cbnz	r6, lab50
lab51: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab53:	cpsid f
	push {r1, r2}
	ldr r1, =0x1666
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 lab50: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab51
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab51
lab48: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab52
lab49: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab53
	.ltorg
_exit:
	b	_exit
	nop
_fini:
	push	{r3, r4, r5, r6, r7, lr}
	nop
	pop	{r3, r4, r5, r6, r7}
	pop	{r3}
	mov	lr, r3
	bx	lr


	.section .rodata

_global_impure_ptr:
	.word	0x00018d58


	.data

impure_data:
	.word	0x00000000
	.word	0x00019044
	.word	0x000190ac
	.word	0x00019114
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000001
	.word	0x00000000
	.word	0xabcd330e
	.word	0xe66d1234
	.word	0x0005deec
	.word	0x0000000b
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
__atexit_recursive_mutex:
	.word	0x000191c0


	.bss

completed.1:
	.word	0x00000000
object.0:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
in_a:
	.word	0x00000000
	.word	0x00000000
in_b:
	.word	0x00000000
	.word	0x00000000
in_m:
	.word	0x00000000
	.word	0x00000000
__lock___atexit_recursive_mutex:
	.word	0x00000000
