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
	mov.w r1, #7759
	mov.w r2, #1610612736 
	cbz	r3, lab1
	ldr	r0, =0x0000b9cd	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	mov.w r1, #1565
	mov.w r2, #1610612736 
	ldr	r4, =__bss_start	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x0000be24	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	mov.w r1, #706
	mov.w r2, #1610612736 
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x0000be24	
	nop
lab4: 	pop	{r3, pc}
	.ltorg
_stack_init:
	sub	sl, r3, #65536	
	bx	lr
	nop
_mainCRTStartup:
	ldr	r3, [pc, #92]	
	cmp	r3, #0
	it	eq
	ldreq	r3, =0x00080000	
	mov	sp, r3
	bl	_stack_init
	movs	r1, #0
	mov	fp, r1
	mov	r7, r1
	ldr	r0, =__bss_start	
	ldr	r2, =0x0001cbf4	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	mov.w r1, #4497
	mov.w r2, #1610612736 
	cmp	r3, #0
	beq	lab5
	blx	r3
lab5: 	ldr	r3, [pc, #52]	
	cmp	r3, #0
	beq	lab6
	blx	r3
lab6: 	movs	r0, #0
	movs	r1, #0
	movs	r4, r0
	movs	r5, r1
	ldr	r0, =0x0000b9c1	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x0000b9cd	
push {r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 
lab7:	push {r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3015
	mov.w r2, #1610612736 
	movs	r1, r5
	bl	main
	push {r1, r2}
	mov.w r1, #690
	mov.w r2, #1610612736 
	nop
	.ltorg
fillInBuf:
	push	{r4, r7, lr}
	sub	sp, #12
	add	r7, sp, #0
	ldr	r3, =gInBufOfs	
	movs	r2, #4
	strb	r2, [r3, #0]
	ldr	r3, =gInBufLeft	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =g_pNeedBytesCallback	
	ldr	r4, [r3, #0]
	ldr	r3, =gInBufOfs	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =gInBuf	
	adds	r0, r2, r3
	ldr	r3, =gInBufOfs	
	ldrb	r3, [r3, #0]
	negs	r3, r3
	uxtb	r1, r3
	ldr	r3, =g_pCallback_data	
	ldr	r3, [r3, #0]
	ldr	r2, =gInBufLeft	
	blx	r4
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab8
	ldr	r2, =gCallbackStatus	
	ldrb	r3, [r7, #7]
	strb	r3, [r2, #0]
lab8: 	nop
	adds	r7, #12
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2482
	mov.w r2, #1610612736 
	.ltorg
getChar:
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, =gInBufLeft	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab9
	bl	fillInBuf
	push {r1, r2}
	mov.w r1, #5044
	mov.w r2, #1610612736 
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab9
	ldr	r3, =gTemFlag	
	ldrb	r3, [r3, #0]
	mvns	r3, r3
	uxtb	r2, r3
	ldr	r3, =gTemFlag	
	strb	r2, [r3, #0]
	ldr	r3, =gTemFlag	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab10
	movs	r3, #255	
	b	lab11
lab10: 	movs	r3, #217	
	b	lab11
lab9: 	ldr	r3, =gInBufLeft	
	ldrb	r3, [r3, #0]
	subs	r3, #1
	uxtb	r2, r3
	ldr	r3, =gInBufLeft	
	strb	r2, [r3, #0]
	ldr	r3, =gInBufOfs	
	ldrb	r3, [r3, #0]
	adds	r2, r3, #1
	uxtb	r1, r2
	ldr	r2, =gInBufOfs	
	strb	r1, [r2, #0]
	mov	r2, r3
	ldr	r3, =gInBuf	
	ldrb	r3, [r3, r2]
lab11: 	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #2208
	mov.w r2, #1610612736 
	nop
	.ltorg
stuffChar:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldr	r3, =gInBufOfs	
	ldrb	r3, [r3, #0]
	subs	r3, #1
	uxtb	r2, r3
	ldr	r3, =gInBufOfs	
	strb	r2, [r3, #0]
	ldr	r3, =gInBufOfs	
	ldrb	r3, [r3, #0]
	mov	r1, r3
	ldr	r2, =gInBuf	
	ldrb	r3, [r7, #7]
	strb	r3, [r2, r1]
	ldr	r3, =gInBufLeft	
	ldrb	r3, [r3, #0]
	adds	r3, #1
	uxtb	r2, r3
	ldr	r3, =gInBufLeft	
	strb	r2, [r3, #0]
	nop
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
getOctet:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
push {r1, r2}
	mov.w r1, #4892
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4892
	mov.w r2, #1610612736 
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab12
	ldrb	r3, [r7, #15]
	cmp	r3, #255	
	bne	lab12
push {r1, r2}
	mov.w r1, #6224
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6224
	mov.w r2, #1610612736 
	strb	r3, [r7, #14]
	ldrb	r3, [r7, #14]
	cmp	r3, #0
	beq	lab12
	ldrb	r3, [r7, #14]
	mov	r0, r3
	bl	stuffChar
	movs	r0, #255	
	bl	stuffChar
lab12: 	ldrb	r3, [r7, #15]
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #3453
	mov.w r2, #1610612736 
getBits:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #7]
	strb	r3, [r7, #13]
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #14]
	ldrb	r3, [r7, #7]
	cmp	r3, #8
	bls	lab13
	ldrb	r3, [r7, #7]
	subs	r3, #8
	strb	r3, [r7, #7]
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =gBitsLeft	
	ldrb	r3, [r3, #0]
	lsl	r3, r2, r3
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	strh	r2, [r3, #0]
	ldrb	r3, [r7, #6]
	mov	r0, r3
push {r1, r2}
	mov.w r1, #7012
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7012
	mov.w r2, #1610612736 
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	strh	r2, [r3, #0]
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =gBitsLeft	
	ldrb	r3, [r3, #0]
	rsb	r3, r3, #8
	lsl	r3, r2, r3
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	strh	r2, [r3, #0]
	ldrsh	r3, [r7, #14]
	bic	r3, r3, #255	
	sxth	r2, r3
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	lsrs	r3, r3, #8
	uxth	r3, r3
	sxth	r3, r3
	orrs	r3, r2
	sxth	r3, r3
	strh	r3, [r7, #14]
lab13: 	ldr	r3, =gBitsLeft	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #7]
	cmp	r2, r3
	bls	lab14
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =gBitsLeft	
	ldrb	r3, [r3, #0]
	lsl	r3, r2, r3
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	strh	r2, [r3, #0]
	ldrb	r3, [r7, #6]
	mov	r0, r3
push {r1, r2}
	mov.w r1, #401
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #401
	mov.w r2, #1610612736 
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	strh	r2, [r3, #0]
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	mov	r1, r3
	ldrb	r3, [r7, #7]
	ldr	r2, =gBitsLeft	
	ldrb	r2, [r2, #0]
	subs	r3, r3, r2
	lsl	r3, r1, r3
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	strh	r2, [r3, #0]
	ldr	r3, =gBitsLeft	
	ldrb	r2, [r3, #0]
	ldrb	r3, [r7, #7]
	subs	r3, r2, r3
	uxtb	r3, r3
	adds	r3, #8
	uxtb	r2, r3
	ldr	r3, =gBitsLeft	
	strb	r2, [r3, #0]
	b	lab15
lab14: 	ldr	r3, =gBitsLeft	
	ldrb	r2, [r3, #0]
	ldrb	r3, [r7, #7]
	subs	r3, r2, r3
	uxtb	r2, r3
	ldr	r3, =gBitsLeft	
	strb	r2, [r3, #0]
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #7]
	lsl	r3, r2, r3
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	strh	r2, [r3, #0]
lab15: 	ldrh	r2, [r7, #14]
	ldrb	r3, [r7, #13]
	rsb	r3, r3, #16
	asr	r3, r2, r3
	uxth	r3, r3
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #549
	mov.w r2, #1610612736 
	.ltorg
getBits1:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	movs	r1, #0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #621
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #621
	mov.w r2, #1610612736 
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6298
	mov.w r2, #1610612736 
getBits2:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	movs	r1, #1
	mov	r0, r3
push {r1, r2}
	mov.w r1, #7708
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7708
	mov.w r2, #1610612736 
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1002
	mov.w r2, #1610612736 
getBit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	movs	r3, #0
	strb	r3, [r7, #7]
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	cmp	r3, #0
	bge	lab16
	movs	r3, #1
	strb	r3, [r7, #7]
lab16: 	ldr	r3, =gBitsLeft	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab17
	movs	r0, #1
push {r1, r2}
	mov.w r1, #7552
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7552
	mov.w r2, #1610612736 
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	strh	r2, [r3, #0]
	ldr	r3, =gBitsLeft	
	ldrb	r3, [r3, #0]
	adds	r3, #8
	uxtb	r2, r3
	ldr	r3, =gBitsLeft	
	strb	r2, [r3, #0]
lab17: 	ldr	r3, =gBitsLeft	
	ldrb	r3, [r3, #0]
	subs	r3, #1
	uxtb	r2, r3
	ldr	r3, =gBitsLeft	
	strb	r2, [r3, #0]
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	lsls	r3, r3, #1
	uxth	r2, r3
	ldr	r3, =gBitBuf	
	strh	r2, [r3, #0]
	ldrb	r3, [r7, #7]
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #8063
	mov.w r2, #1610612736 
	.ltorg
getExtendTest:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #15
	bhi	lab18
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	movs	r3, #0
	b	lab19
	movs	r3, #1
	b	lab19
	movs	r3, #2
	b	lab19
	movs	r3, #4
	b	lab19
	movs	r3, #8
	b	lab19
	movs	r3, #16
	b	lab19
	movs	r3, #32
	b	lab19
	movs	r3, #64	
	b	lab19
	movs	r3, #128	
	b	lab19
	mov	r3, #256	
	b	lab19
	mov	r3, #512	
	b	lab19
	mov	r3, #1024	
	b	lab19
	mov	r3, #2048	
	b	lab19
	mov	r3, #4096	
	b	lab19
	mov	r3, #8192	
	b	lab19
	mov	r3, #16384	
	b	lab19
lab18: 	movs	r3, #0
lab19: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
getExtendOffset:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #15
	bhi	lab20
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	movs	r3, #0
	b	lab21
	mov	r3, #4294967295	
	b	lab21
	mvn	r3, #2
	b	lab21
	mvn	r3, #6
	b	lab21
	mvn	r3, #14
	b	lab21
	mvn	r3, #30
	b	lab21
	mvn	r3, #62	
	b	lab21
	mvn	r3, #126	
	b	lab21
	mvn	r3, #254	
	b	lab21
	mvn	r3, #510	
	b	lab21
	ldr	r3, =0xfffffc01	
	b	lab21
	ldr	r3, =0xfffff801	
	b	lab21
	ldr	r3, =0xfffff001	
	b	lab21
	ldr	r3, =0xffffe001	
	b	lab21
	ldr	r3, =0xffffc001	
	b	lab21
	ldr	r3, =0xffff8001	
	b	lab21
lab20: 	movs	r3, #0
lab21: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
huffExtend:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strh	r3, [r7, #6]
	mov	r3, r2
	strb	r3, [r7, #5]
	ldrb	r3, [r7, #5]
	mov	r0, r3
	bl	getExtendTest
	mov	r3, r0
	mov	r2, r3
	ldrh	r3, [r7, #6]
	cmp	r3, r2
	bcs	lab22
	ldrb	r3, [r7, #5]
	mov	r0, r3
	bl	getExtendOffset
	mov	r3, r0
	uxth	r2, r3
	ldrh	r3, [r7, #6]
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	b	lab23
lab22: 	ldrsh	r3, [r7, #6]
lab23: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7714
	mov.w r2, #1610612736 
huffDecode:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #0
	strb	r3, [r7, #15]
push {r1, r2}
	mov.w r1, #5580
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5580
	mov.w r2, #1610612736 
	strh	r3, [r7, #12]
lab28: 	cmp	r3, #16
	bne	lab24
	movs	r3, #0
	b	lab25
lab24: 	ldrb	r2, [r7, #15]
	ldr	r3, [r7, #4]
	adds	r2, #16
	ldrh	r3, [r3, r2, lsl #1]
	strh	r3, [r7, #10]
	ldrh	r2, [r7, #12]
	ldrh	r3, [r7, #10]
	cmp	r2, r3
	bhi	lab26
	ldrh	r3, [r7, #10]
	movw	r2, #65535	
	cmp	r3, r2
	bne	lab27
lab26: 	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
	ldrh	r3, [r7, #12]
	lsls	r3, r3, #1
	strh	r3, [r7, #12]
push {r1, r2}
	mov.w r1, #7758
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7758
	mov.w r2, #1610612736 
	uxth	r2, r3
	ldrh	r3, [r7, #12]
	orrs	r3, r2
	strh	r3, [r7, #12]
	b	lab28
lab27: 	nop
	ldrb	r3, [r7, #15]
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrb	r3, [r3, #64]	
	strb	r3, [r7, #9]
	ldrh	r3, [r7, #12]
	uxtb	r2, r3
	ldrb	r1, [r7, #15]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, r1, lsl #1]
	uxtb	r3, r3
	subs	r3, r2, r3
	uxtb	r2, r3
	ldrb	r3, [r7, #9]
	add	r3, r2
	strb	r3, [r7, #9]
	ldrb	r3, [r7, #9]
	ldr	r2, [r7, #0]
	add	r3, r2
	ldrb	r3, [r3, #0]
lab25: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7876
	mov.w r2, #1610612736 
huffCreate:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #0
	strb	r3, [r7, #15]
	movs	r3, #0
	strb	r3, [r7, #14]
	movs	r3, #0
	strh	r3, [r7, #12]
lab32: 	ldr	r2, [r7, #4]
	add	r3, r2
	ldrb	r3, [r3, #0]
	strb	r3, [r7, #11]
	ldrb	r3, [r7, #11]
	cmp	r3, #0
	bne	lab29
	ldrb	r2, [r7, #15]
	ldr	r3, [r7, #0]
	movs	r1, #0
	strh	r1, [r3, r2, lsl #1]
	ldrb	r2, [r7, #15]
	ldr	r3, [r7, #0]
	adds	r2, #16
	movw	r1, #65535	
	strh	r1, [r3, r2, lsl #1]
	ldrb	r3, [r7, #15]
	ldr	r2, [r7, #0]
	add	r3, r2
	movs	r2, #0
	strb	r2, [r3, #64]	
	b	lab30
lab29: 	ldrb	r2, [r7, #15]
	ldr	r3, [r7, #0]
	ldrh	r1, [r7, #12]
	strh	r1, [r3, r2, lsl #1]
	ldrb	r3, [r7, #11]
	uxth	r2, r3
	ldrh	r3, [r7, #12]
	add	r3, r2
	uxth	r3, r3
	ldrb	r2, [r7, #15]
	subs	r3, #1
	uxth	r1, r3
	ldr	r3, [r7, #0]
	adds	r2, #16
	strh	r1, [r3, r2, lsl #1]
	ldrb	r3, [r7, #15]
	ldr	r2, [r7, #0]
	add	r3, r2
	ldrb	r2, [r7, #14]
	strb	r2, [r3, #64]	
	ldrb	r2, [r7, #14]
	ldrb	r3, [r7, #11]
	add	r3, r2
	strb	r3, [r7, #14]
	ldrb	r3, [r7, #11]
	uxth	r2, r3
	ldrh	r3, [r7, #12]
	add	r3, r2
	strh	r3, [r7, #12]
lab30: 	ldrh	r3, [r7, #12]
	lsls	r3, r3, #1
	strh	r3, [r7, #12]
	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	cmp	r3, #15
	bhi	lab31
	b	lab32
lab31: 	nop
	nop
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
getHuffTable:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #3
	bhi	lab33
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	ldr	r3, =gHuffTab0	
	b	lab34
	ldr	r3, =gHuffTab1	
	b	lab34
	ldr	r3, =gHuffTab2	
	b	lab34
	ldr	r3, =gHuffTab3	
	b	lab34
lab33: 	movs	r3, #0
lab34: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
getHuffVal:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #3
	bhi	lab35
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	ldr	r3, =gHuffVal0	
	b	lab36
	ldr	r3, =gHuffVal1	
	b	lab36
	ldr	r3, =gHuffVal2	
	b	lab36
	ldr	r3, =gHuffVal3	
	b	lab36
lab35: 	movs	r3, #0
lab36: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
getMaxHuffCodes:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #1
	bhi	lab37
	movs	r3, #12
	b	lab38
lab37: 	movs	r3, #255	
lab38: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
readDHTMarker:
	push	{r7, lr}
	sub	sp, #40	
	add	r7, sp, #0
	movs	r0, #16
push {r1, r2}
	mov.w r1, #1897
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1897
	mov.w r2, #1610612736 
	strh	r3, [r7, #38]	
	ldrh	r3, [r7, #38]	
	cmp	r3, #1
	bhi	lab39
	movs	r3, #4
	b	lab40
lab39: 	ldrh	r3, [r7, #38]	
	subs	r3, #2
	strh	r3, [r7, #38]	
	b	lab41
lab50: push {r1, r2}
	mov.w r1, #5431
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5431
	mov.w r2, #1610612736 
	strb	r3, [r7, #33]	
	ldrb	r3, [r7, #33]	
	and	r3, r3, #14
	cmp	r3, #0
	bne	lab42
	ldrb	r3, [r7, #33]	
	and	r3, r3, #240	
	cmp	r3, #16
	ble	lab43
lab42: 	movs	r3, #3
	b	lab40
lab43: 	ldrb	r3, [r7, #33]	
	lsrs	r3, r3, #3
	uxtb	r3, r3
	sxtb	r3, r3
	and	r3, r3, #2
	sxtb	r2, r3
	ldrsb	r3, [r7, #33]	
	and	r3, r3, #1
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r3, r3
	strb	r3, [r7, #32]
	ldrb	r3, [r7, #32]
	mov	r0, r3
	bl	getHuffTable
	str	r0, [r7, #28]
	ldrb	r3, [r7, #32]
	mov	r0, r3
	bl	getHuffVal
	str	r0, [r7, #24]
	ldrb	r3, [r7, #32]
	movs	r2, #1
	lsl	r3, r2, r3
	sxtb	r2, r3
	ldr	r3, =gValidHuffTables	
	ldrb	r3, [r3, #0]
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r3, r3
	uxtb	r2, r3
	ldr	r3, =gValidHuffTables	
	strb	r2, [r3, #0]
	movs	r3, #0
	strh	r3, [r7, #34]	
	movs	r3, #0
	strb	r3, [r7, #37]	
	b	lab44
lab45: push {r1, r2}
	mov.w r1, #7845
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7845
	mov.w r2, #1610612736 
	strb	r3, [r7, #21]
	ldrb	r3, [r7, #37]	
	adds	r3, #40	
	add	r3, r7
	ldrb	r2, [r7, #21]
	strb	r2, [r3, #-36]
	ldrb	r3, [r7, #21]
	uxth	r2, r3
	ldrh	r3, [r7, #34]	
	add	r3, r2
	strh	r3, [r7, #34]	
	ldrb	r3, [r7, #37]	
	adds	r3, #1
	strb	r3, [r7, #37]	
lab44: 	ldrb	r3, [r7, #37]	
	cmp	r3, #15
	bls	lab45
	ldrb	r3, [r7, #32]
	mov	r0, r3
	bl	getMaxHuffCodes
	mov	r3, r0
	mov	r2, r3
	ldrh	r3, [r7, #34]	
	cmp	r3, r2
	bls	lab46
	movs	r3, #2
	b	lab40
lab46: 	movs	r3, #0
	strb	r3, [r7, #37]	
	b	lab47
lab48: push {r1, r2}
	mov.w r1, #1827
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1827
	mov.w r2, #1610612736 
	mov	r1, r3
	ldrb	r3, [r7, #37]	
	ldr	r2, [r7, #24]
	add	r3, r2
	uxtb	r2, r1
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #37]	
	adds	r3, #1
	strb	r3, [r7, #37]	
lab47: 	ldrb	r3, [r7, #37]	
	uxth	r3, r3
	ldrh	r2, [r7, #34]	
	cmp	r2, r3
	bhi	lab48
	ldrh	r3, [r7, #34]	
	adds	r3, #17
	strh	r3, [r7, #22]
	ldrh	r2, [r7, #38]	
	ldrh	r3, [r7, #22]
	cmp	r2, r3
	bcs	lab49
	movs	r3, #4
	b	lab40
lab49: 	ldrh	r2, [r7, #38]	
	ldrh	r3, [r7, #22]
	subs	r3, r2, r3
	strh	r3, [r7, #38]	
	adds	r3, r7, #4
	ldr	r1, [r7, #28]
	mov	r0, r3
	bl	huffCreate
lab41: 	ldrh	r3, [r7, #38]	
	cmp	r3, #0
	bne	lab50
	movs	r3, #0
lab40: 	mov	r0, r3
	adds	r7, #40	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #70
	mov.w r2, #1610612736 
	nop
	.ltorg
readDQTMarker:
	push	{r4, r7, lr}
	sub	sp, #20
	add	r7, sp, #0
	movs	r0, #16
push {r1, r2}
	mov.w r1, #8126
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8126
	mov.w r2, #1610612736 
	strh	r3, [r7, #14]
	ldrh	r3, [r7, #14]
	cmp	r3, #1
	bhi	lab51
	movs	r3, #5
	b	lab52
lab51: 	ldrh	r3, [r7, #14]
	subs	r3, #2
	strh	r3, [r7, #14]
	b	lab53
lab66: push {r1, r2}
	mov.w r1, #6033
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6033
	mov.w r2, #1610612736 
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	lsrs	r3, r3, #4
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #7]
	and	r3, r3, #15
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #1
	bls	lab54
	movs	r3, #6
	b	lab52
lab54: 	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab55
	movs	r2, #2
	b	lab56
lab55: 	movs	r2, #1
lab56: 	ldr	r3, =gValidQuantTables	
	ldrb	r3, [r3, #0]
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r3, r3
	uxtb	r2, r3
	ldr	r3, =gValidQuantTables	
	strb	r2, [r3, #0]
	movs	r3, #0
	strb	r3, [r7, #13]
	b	lab57
lab61: push {r1, r2}
	mov.w r1, #4819
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4819
	mov.w r2, #1610612736 
	strh	r3, [r7, #8]
	ldrb	r3, [r7, #6]
	cmp	r3, #0
	beq	lab58
	ldrh	r3, [r7, #8]
	lsls	r3, r3, #8
	uxth	r4, r3
	movs	r0, #8
push {r1, r2}
	mov.w r1, #1519
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1519
	mov.w r2, #1610612736 
	add	r3, r4
	strh	r3, [r7, #8]
lab58: 	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab59
	ldrb	r3, [r7, #13]
	ldrsh	r1, [r7, #8]
	ldr	r2, =gQuant1	
	strh	r1, [r2, r3, lsl #1]
	b	lab60
lab59: 	ldrb	r3, [r7, #13]
	ldrsh	r1, [r7, #8]
	ldr	r2, =gQuant0	
	strh	r1, [r2, r3, lsl #1]
lab60: 	ldrb	r3, [r7, #13]
	adds	r3, #1
	strb	r3, [r7, #13]
lab57: 	ldrb	r3, [r7, #13]
	cmp	r3, #63	
	bls	lab61
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab62
	ldr	r3, =gQuant1	
	b	lab63
lab62: 	ldr	r3, =gQuant0	
lab63: 	mov	r0, r3
	bl	createWinogradQuant
	movs	r3, #65	
	strh	r3, [r7, #10]
	ldrb	r3, [r7, #6]
	cmp	r3, #0
	beq	lab64
	ldrh	r3, [r7, #10]
	adds	r3, #64	
	strh	r3, [r7, #10]
lab64: 	ldrh	r2, [r7, #14]
	ldrh	r3, [r7, #10]
	cmp	r2, r3
	bcs	lab65
	movs	r3, #21
	b	lab52
lab65: 	ldrh	r2, [r7, #14]
	ldrh	r3, [r7, #10]
	subs	r3, r2, r3
	strh	r3, [r7, #14]
lab53: 	ldrh	r3, [r7, #14]
	cmp	r3, #0
	bne	lab66
	movs	r3, #0
lab52: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7948
	mov.w r2, #1610612736 
	nop
	.ltorg
readSOFMarker:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	movs	r0, #16
push {r1, r2}
	mov.w r1, #466
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #466
	mov.w r2, #1610612736 
	strh	r3, [r7, #4]
	movs	r0, #8
push {r1, r2}
	mov.w r1, #5397
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5397
	mov.w r2, #1610612736 
	cmp	r3, #8
	beq	lab67
	movs	r3, #7
	b	lab68
lab67: 	movs	r0, #16
push {r1, r2}
	mov.w r1, #1470
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1470
	mov.w r2, #1610612736 
	mov	r2, r3
	ldr	r3, =gImageYSize	
	strh	r2, [r3, #0]
	ldr	r3, =gImageYSize	
	ldrh	r3, [r3, #0]
	cmp	r3, #0
	beq	lab69
	ldr	r3, =gImageYSize	
	ldrh	r3, [r3, #0]
	cmp	r3, #16384	
	bls	lab70
lab69: 	movs	r3, #8
	b	lab68
lab70: 	movs	r0, #16
push {r1, r2}
	mov.w r1, #6861
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6861
	mov.w r2, #1610612736 
	mov	r2, r3
	ldr	r3, =gImageXSize	
	strh	r2, [r3, #0]
	ldr	r3, =gImageXSize	
	ldrh	r3, [r3, #0]
	cmp	r3, #0
	beq	lab71
	ldr	r3, =gImageXSize	
	ldrh	r3, [r3, #0]
	cmp	r3, #16384	
	bls	lab72
lab71: 	movs	r3, #9
	b	lab68
lab72: 	movs	r0, #8
push {r1, r2}
	mov.w r1, #4467
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4467
	mov.w r2, #1610612736 
	uxtb	r2, r3
	ldr	r3, =gCompsInFrame	
	strb	r2, [r3, #0]
	ldr	r3, =gCompsInFrame	
	ldrb	r3, [r3, #0]
	cmp	r3, #3
	bls	lab73
	movs	r3, #10
	b	lab68
lab73: 	ldrh	r2, [r7, #4]
	ldr	r3, =gCompsInFrame	
	ldrb	r3, [r3, #0]
	mov	r1, r3
	mov	r3, r1
	lsls	r3, r3, #1
	add	r3, r1
	adds	r3, #8
	cmp	r2, r3
	beq	lab74
	movs	r3, #11
	b	lab68
lab74: 	movs	r3, #0
	strb	r3, [r7, #7]
	b	lab75
lab77: push {r1, r2}
	mov.w r1, #5719
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5719
	mov.w r2, #1610612736 
	mov	r2, r3
	ldrb	r3, [r7, #7]
	uxtb	r1, r2
	ldr	r2, =gCompIdent	
	strb	r1, [r2, r3]
	movs	r0, #4
push {r1, r2}
	mov.w r1, #2907
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2907
	mov.w r2, #1610612736 
	mov	r2, r3
	ldrb	r3, [r7, #7]
	uxtb	r1, r2
	ldr	r2, =gCompHSamp	
	strb	r1, [r2, r3]
	movs	r0, #4
push {r1, r2}
	mov.w r1, #636
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #636
	mov.w r2, #1610612736 
	mov	r2, r3
	ldrb	r3, [r7, #7]
	uxtb	r1, r2
	ldr	r2, =gCompVSamp	
	strb	r1, [r2, r3]
	movs	r0, #8
push {r1, r2}
	mov.w r1, #1015
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1015
	mov.w r2, #1610612736 
	mov	r2, r3
	ldrb	r3, [r7, #7]
	uxtb	r1, r2
	ldr	r2, =gCompQuant	
	strb	r1, [r2, r3]
	ldrb	r3, [r7, #7]
	ldr	r2, =gCompQuant	
	ldrb	r3, [r2, r3]
	cmp	r3, #1
	bls	lab76
	movs	r3, #36	
	b	lab68
lab76: 	ldrb	r3, [r7, #7]
	adds	r3, #1
	strb	r3, [r7, #7]
lab75: 	ldr	r3, =gCompsInFrame	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #7]
	cmp	r2, r3
	bcc	lab77
	movs	r3, #0
lab68: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #931
	mov.w r2, #1610612736 
	.ltorg
skipVariableMarker:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	movs	r0, #16
push {r1, r2}
	mov.w r1, #1255
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1255
	mov.w r2, #1610612736 
	strh	r3, [r7, #6]
	ldrh	r3, [r7, #6]
	cmp	r3, #1
	bhi	lab78
	movs	r3, #12
	b	lab79
lab78: 	ldrh	r3, [r7, #6]
	subs	r3, #2
	strh	r3, [r7, #6]
	b	lab80
lab81: push {r1, r2}
	mov.w r1, #4070
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4070
	mov.w r2, #1610612736 
	subs	r3, #1
	strh	r3, [r7, #6]
lab80: 	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	lab81
	movs	r3, #0
lab79: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1139
	mov.w r2, #1610612736 
readDRIMarker:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #16
push {r1, r2}
	mov.w r1, #698
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #698
	mov.w r2, #1610612736 
	cmp	r3, #4
	beq	lab82
	movs	r3, #13
	b	lab83
lab82: 	movs	r0, #16
push {r1, r2}
	mov.w r1, #5919
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5919
	mov.w r2, #1610612736 
	mov	r2, r3
	ldr	r3, =gRestartInterval	
	strh	r2, [r3, #0]
	movs	r3, #0
lab83: 	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #6585
	mov.w r2, #1610612736 
	.ltorg
readSOSMarker:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	movs	r0, #16
push {r1, r2}
	mov.w r1, #8054
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8054
	mov.w r2, #1610612736 
	strh	r3, [r7, #4]
	movs	r0, #8
push {r1, r2}
	mov.w r1, #7056
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7056
	mov.w r2, #1610612736 
	uxtb	r2, r3
	ldr	r3, =gCompsInScan	
	strb	r2, [r3, #0]
	ldrh	r3, [r7, #4]
	subs	r3, #3
	strh	r3, [r7, #4]
	ldrh	r2, [r7, #4]
	ldr	r3, =gCompsInScan	
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #1
	adds	r3, #3
	cmp	r2, r3
	bne	lab84
	ldr	r3, =gCompsInScan	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab84
	ldr	r3, =gCompsInScan	
	ldrb	r3, [r3, #0]
	cmp	r3, #3
	bls	lab85
lab84: 	movs	r3, #14
	b	lab86
lab85: 	movs	r3, #0
	strb	r3, [r7, #7]
	b	lab87
lab93: push {r1, r2}
	mov.w r1, #6813
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6813
	mov.w r2, #1610612736 
	strb	r3, [r7, #2]
	movs	r0, #8
push {r1, r2}
	mov.w r1, #1730
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1730
	mov.w r2, #1610612736 
	strb	r3, [r7, #1]
	ldrh	r3, [r7, #4]
	subs	r3, #2
	strh	r3, [r7, #4]
	movs	r3, #0
	strb	r3, [r7, #3]
	b	lab88
lab90: 	ldr	r2, =gCompIdent	
	ldrb	r3, [r2, r3]
	ldrb	r2, [r7, #2]
	cmp	r2, r3
	beq	lab89
	ldrb	r3, [r7, #3]
	adds	r3, #1
	strb	r3, [r7, #3]
lab88: 	ldr	r3, =gCompsInFrame	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #3]
	cmp	r2, r3
	bcc	lab90
	b	lab91
lab89: 	nop
lab91: 	ldr	r3, =gCompsInFrame	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #3]
	cmp	r2, r3
	bcc	lab92
	movs	r3, #15
	b	lab86
lab92: 	ldrb	r3, [r7, #7]
	ldr	r1, =gCompList	
	ldrb	r2, [r7, #3]
	strb	r2, [r1, r3]
	ldrb	r3, [r7, #3]
	ldrb	r2, [r7, #1]
	lsrs	r2, r2, #4
	uxtb	r1, r2
	ldr	r2, =gCompDCTab	
	strb	r1, [r2, r3]
	ldrb	r3, [r7, #3]
	ldrb	r2, [r7, #1]
	and	r2, r2, #15
	uxtb	r1, r2
	ldr	r2, =gCompACTab	
	strb	r1, [r2, r3]
	ldrb	r3, [r7, #7]
	adds	r3, #1
	strb	r3, [r7, #7]
lab87: 	ldr	r3, =gCompsInScan	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #7]
	cmp	r2, r3
	bcc	lab93
	movs	r0, #8
push {r1, r2}
	mov.w r1, #1839
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1839
	mov.w r2, #1610612736 
	uxtb	r2, r3
	ldr	r3, =spectral_start	
	strb	r2, [r3, #0]
	movs	r0, #8
push {r1, r2}
	mov.w r1, #7721
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7721
	mov.w r2, #1610612736 
	uxtb	r2, r3
	ldr	r3, =spectral_end	
	strb	r2, [r3, #0]
	movs	r0, #4
push {r1, r2}
	mov.w r1, #2945
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2945
	mov.w r2, #1610612736 
	uxtb	r2, r3
	ldr	r3, =successive_high	
	strb	r2, [r3, #0]
	movs	r0, #4
push {r1, r2}
	mov.w r1, #1918
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1918
	mov.w r2, #1610612736 
	uxtb	r2, r3
	ldr	r3, =successive_low	
	strb	r2, [r3, #0]
	ldrh	r3, [r7, #4]
	subs	r3, #3
	strh	r3, [r7, #4]
	b	lab94
lab95: push {r1, r2}
	mov.w r1, #2340
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2340
	mov.w r2, #1610612736 
	subs	r3, #1
	strh	r3, [r7, #4]
lab94: 	ldrh	r3, [r7, #4]
	cmp	r3, #0
	bne	lab95
	movs	r3, #0
lab86: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5845
	mov.w r2, #1610612736 
	.ltorg
nextMarker:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	movs	r3, #0
	strb	r3, [r7, #7]
lab96: 	adds	r3, #1
	strb	r3, [r7, #7]
	movs	r0, #8
push {r1, r2}
	mov.w r1, #2672
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2672
	mov.w r2, #1610612736 
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #6]
	cmp	r3, #255	
	bne	lab96
lab97: push {r1, r2}
	mov.w r1, #2252
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2252
	mov.w r2, #1610612736 
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #6]
	cmp	r3, #255	
	beq	lab97
	ldrb	r3, [r7, #6]
	cmp	r3, #0
	beq	lab96
	ldrb	r3, [r7, #6]
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6720
	mov.w r2, #1610612736 
processMarkers:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
lab102: 	push {r1, r2}
	mov.w r1, #7811
	mov.w r2, #1610612736 
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	cmp	r3, #1
	beq	lab98
	cmp	r3, #0
	ble	lab99
	cmp	r3, #221	
	bgt	lab99
	cmp	r3, #192	
	blt	lab99
	subs	r3, #192	
	cmp	r3, #29
	bhi	lab99
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	ldr	r3, [r7, #4]
	ldrb	r2, [r7, #15]
	strb	r2, [r3, #0]
	movs	r3, #0
	b	lab100
	bl	readDHTMarker
	push {r1, r2}
	mov.w r1, #5819
	mov.w r2, #1610612736 
	movs	r3, #17
	b	lab100
	bl	readDQTMarker
	push {r1, r2}
	mov.w r1, #4281
	mov.w r2, #1610612736 
	bl	readDRIMarker
	push {r1, r2}
	mov.w r1, #372
	mov.w r2, #1610612736 
lab98: 	movs	r3, #18
	b	lab100
lab99: 	bl	skipVariableMarker
	push {r1, r2}
	mov.w r1, #7508
	mov.w r2, #1610612736 
lab101: 	b	lab102
lab100: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5180
	mov.w r2, #1610612736 
locateSOIMarker:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	movs	r0, #8
push {r1, r2}
	mov.w r1, #1165
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1165
	mov.w r2, #1610612736 
	strb	r3, [r7, #4]
	movs	r0, #8
push {r1, r2}
	mov.w r1, #4974
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4974
	mov.w r2, #1610612736 
	strb	r3, [r7, #5]
	ldrb	r3, [r7, #4]
	cmp	r3, #255	
	bne	lab103
	ldrb	r3, [r7, #5]
	cmp	r3, #216	
	bne	lab103
	movs	r3, #0
	b	lab104
lab103: 	mov	r3, #4096	
	strh	r3, [r7, #6]
lab106: 	subs	r3, #1
	strh	r3, [r7, #6]
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	lab105
	movs	r3, #19
	b	lab104
lab105: 	ldrb	r3, [r7, #5]
	strb	r3, [r7, #4]
	movs	r0, #8
push {r1, r2}
	mov.w r1, #105
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #105
	mov.w r2, #1610612736 
	strb	r3, [r7, #5]
	ldrb	r3, [r7, #4]
	cmp	r3, #255	
	bne	lab106
	ldrb	r3, [r7, #5]
	cmp	r3, #216	
	beq	lab107
	ldrb	r3, [r7, #5]
	cmp	r3, #217	
	bne	lab106
	movs	r3, #19
	b	lab104
lab107: 	nop
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	lsrs	r3, r3, #8
	uxth	r3, r3
	strb	r3, [r7, #5]
	ldrb	r3, [r7, #5]
	cmp	r3, #255	
	beq	lab108
	movs	r3, #19
	b	lab104
lab108: 	movs	r3, #0
lab104: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1755
	mov.w r2, #1610612736 
	.ltorg
locateSOFMarker:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	bl	locateSOIMarker
	push {r1, r2}
	mov.w r1, #5028
	mov.w r2, #1610612736 
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab109
	ldrb	r3, [r7, #7]
	b	lab110
lab109: 	adds	r3, r7, #6
	mov	r0, r3
push {r1, r2}
	mov.w r1, #5390
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5390
	mov.w r2, #1610612736 
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab111
	ldrb	r3, [r7, #7]
	b	lab110
lab111: 	ldrb	r3, [r7, #6]
	cmp	r3, #201	
	beq	lab112
	cmp	r3, #201	
	bgt	lab113
	cmp	r3, #192	
	beq	lab114
	cmp	r3, #194	
	bne	lab113
	movs	r3, #37	
	b	lab110
lab114: 	bl	readSOFMarker
	push {r1, r2}
	mov.w r1, #3866
	mov.w r2, #1610612736 
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab115
	ldrb	r3, [r7, #7]
	b	lab110
lab112: 	movs	r3, #17
	b	lab110
lab113: 	movs	r3, #20
	b	lab110
lab115: 	nop
	movs	r3, #0
lab110: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #786
	mov.w r2, #1610612736 
locateSOSMarker:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #0]
	add	r3, r7, #14
	mov	r0, r3
push {r1, r2}
	mov.w r1, #15
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #15
	mov.w r2, #1610612736 
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	cmp	r3, #0
	beq	lab116
	ldrb	r3, [r7, #15]
	b	lab117
lab116: 	ldrb	r3, [r7, #14]
	cmp	r3, #217	
	bne	lab118
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #0]
	movs	r3, #0
	b	lab117
lab118: 	ldrb	r3, [r7, #14]
	cmp	r3, #218	
	beq	lab119
	movs	r3, #18
	b	lab117
lab119: 	bl	readSOSMarker
	push {r1, r2}
	mov.w r1, #2225
	mov.w r2, #1610612736 
lab117: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6824
	mov.w r2, #1610612736 
init:
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, =gImageXSize	
	movs	r2, #0
	strh	r2, [r3, #0]
	ldr	r3, =gImageYSize	
	movs	r2, #0
	strh	r2, [r3, #0]
	ldr	r3, =gCompsInFrame	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gRestartInterval	
	movs	r2, #0
	strh	r2, [r3, #0]
	ldr	r3, =gCompsInScan	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gValidHuffTables	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gValidQuantTables	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gTemFlag	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gInBufOfs	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gInBufLeft	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gBitBuf	
	movs	r2, #0
	strh	r2, [r3, #0]
	ldr	r3, =gBitsLeft	
	movs	r2, #8
	strb	r2, [r3, #0]
	movs	r0, #8
push {r1, r2}
	mov.w r1, #344
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #344
	mov.w r2, #1610612736 
push {r1, r2}
	mov.w r1, #6596
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6596
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #5629
	mov.w r2, #1610612736 
	nop
	.ltorg
fixInBuffer:
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, =gBitsLeft	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab120
	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	uxtb	r3, r3
	mov	r0, r3
	bl	stuffChar
lab120: 	ldr	r3, =gBitBuf	
	ldrh	r3, [r3, #0]
	lsrs	r3, r3, #8
	uxth	r3, r3
	uxtb	r3, r3
	mov	r0, r3
	bl	stuffChar
	ldr	r3, =gBitsLeft	
	movs	r2, #8
	strb	r2, [r3, #0]
	movs	r0, #8
push {r1, r2}
	mov.w r1, #1089
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1089
	mov.w r2, #1610612736 
push {r1, r2}
	mov.w r1, #1338
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1338
	mov.w r2, #1610612736 
	cpsid f
	push {r1, r2}
	mov.w r1, #4663
	mov.w r2, #1610612736 
	nop
	.ltorg
processRestart:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	movs	r3, #0
	strb	r3, [r7, #5]
	mov	r3, #1536	
	strh	r3, [r7, #6]
	b	lab121
lab123:push {r1, r2}
	mov.w r1, #5466
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5466
	mov.w r2, #1610612736 
	cmp	r3, #255	
	beq	lab122
	ldrh	r3, [r7, #6]
	subs	r3, #1
	strh	r3, [r7, #6]
lab121: 	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	lab123
	b	lab124
lab122: 	nop
lab124: 	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	lab125
	movs	r3, #29
	b	lab126
lab128:push {r1, r2}
	mov.w r1, #23
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #23
	mov.w r2, #1610612736 
	strb	r3, [r7, #5]
	ldrb	r3, [r7, #5]
	cmp	r3, #255	
	bne	lab127
	ldrh	r3, [r7, #6]
	subs	r3, #1
	strh	r3, [r7, #6]
lab125: 	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	lab128
	b	lab129
lab127: 	nop
lab129: 	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	lab130
	movs	r3, #29
	b	lab126
lab130: 	ldrb	r2, [r7, #5]
	ldr	r3, =gNextRestartNum	
	ldrh	r3, [r3, #0]
	adds	r3, #208	
	cmp	r2, r3
	beq	lab131
	movs	r3, #29
	b	lab126
lab131: 	ldr	r3, =gLastDC	
	movs	r2, #0
	strh	r2, [r3, #0]
	ldr	r3, =gLastDC	
	movs	r2, #0
	strh	r2, [r3, #2]
	ldr	r3, =gLastDC	
	movs	r2, #0
	strh	r2, [r3, #4]
	ldr	r3, =gRestartInterval	
	ldrh	r2, [r3, #0]
	ldr	r3, =gRestartsLeft	
	strh	r2, [r3, #0]
	ldr	r3, =gNextRestartNum	
	ldrh	r3, [r3, #0]
	adds	r3, #1
	uxth	r3, r3
	and	r3, r3, #7
	uxth	r2, r3
	ldr	r3, =gNextRestartNum	
	strh	r2, [r3, #0]
	ldr	r3, =gBitsLeft	
	movs	r2, #8
	strb	r2, [r3, #0]
	movs	r0, #8
push {r1, r2}
	mov.w r1, #469
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #469
	mov.w r2, #1610612736 
push {r1, r2}
	mov.w r1, #1378
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1378
	mov.w r2, #1610612736 
lab126: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5222
	mov.w r2, #1610612736 
	nop
	.ltorg
checkHuffTables:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	movs	r3, #0
	strb	r3, [r7, #7]
	b	lab132
lab136: 	ldr	r2, =gCompList	
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, =gCompDCTab	
	ldrb	r3, [r3, r2]
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #7]
	ldr	r2, =gCompList	
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, =gCompACTab	
	ldrb	r3, [r3, r2]
	adds	r3, #2
	strb	r3, [r7, #5]
	ldr	r3, =gValidHuffTables	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #6]
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	beq	lab133
	ldr	r3, =gValidHuffTables	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #5]
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	bne	lab134
lab133: 	movs	r3, #24
	b	lab135
lab134: 	ldrb	r3, [r7, #7]
	adds	r3, #1
	strb	r3, [r7, #7]
lab132: 	ldr	r3, =gCompsInScan	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #7]
	cmp	r2, r3
	bcc	lab136
	movs	r3, #0
lab135: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
checkQuantTables:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	movs	r3, #0
	strb	r3, [r7, #7]
	b	lab137
lab142: 	ldr	r2, =gCompList	
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, =gCompQuant	
	ldrb	r3, [r3, r2]
	cmp	r3, #0
	beq	lab138
	movs	r3, #2
	b	lab139
lab138: 	movs	r3, #1
lab139: 	strb	r3, [r7, #6]
	ldr	r3, =gValidQuantTables	
	ldrb	r2, [r3, #0]
	ldrb	r3, [r7, #6]
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	bne	lab140
	movs	r3, #23
	b	lab141
lab140: 	ldrb	r3, [r7, #7]
	adds	r3, #1
	strb	r3, [r7, #7]
lab137: 	ldr	r3, =gCompsInScan	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #7]
	cmp	r2, r3
	bcc	lab142
	movs	r3, #0
lab141: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
initScan:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	adds	r3, r7, #6
	mov	r0, r3
	bl	locateSOSMarker
	push {r1, r2}
	mov.w r1, #7183
	mov.w r2, #1610612736 
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab143
	ldrb	r3, [r7, #7]
	b	lab144
lab143: 	ldrb	r3, [r7, #6]
	cmp	r3, #0
	beq	lab145
	movs	r3, #18
	b	lab144
lab145: 	bl	checkHuffTables
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab146
	ldrb	r3, [r7, #7]
	b	lab144
lab146: 	bl	checkQuantTables
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab147
	ldrb	r3, [r7, #7]
	b	lab144
lab147: 	ldr	r3, =gLastDC	
	movs	r2, #0
	strh	r2, [r3, #0]
	ldr	r3, =gLastDC	
	movs	r2, #0
	strh	r2, [r3, #2]
	ldr	r3, =gLastDC	
	movs	r2, #0
	strh	r2, [r3, #4]
	ldr	r3, =gRestartInterval	
	ldrh	r3, [r3, #0]
	cmp	r3, #0
	beq	lab148
	ldr	r3, =gRestartInterval	
	ldrh	r2, [r3, #0]
	ldr	r3, =gRestartsLeft	
	strh	r2, [r3, #0]
	ldr	r3, =gNextRestartNum	
	movs	r2, #0
	strh	r2, [r3, #0]
lab148: 	bl	fixInBuffer
	push {r1, r2}
	mov.w r1, #3638
	mov.w r2, #1610612736 
lab144: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1538
	mov.w r2, #1610612736 
	.ltorg
initFrame:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =gCompsInFrame	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab149
	ldr	r3, =gCompHSamp	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab150
	ldr	r3, =gCompVSamp	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	beq	lab151
lab150: 	movs	r3, #27
	b	lab152
lab151: 	ldr	r3, =gScanType	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gMaxBlocksPerMCU	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =gMCUOrg	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gMaxMCUXSize	
	movs	r2, #8
	strb	r2, [r3, #0]
	ldr	r3, =gMaxMCUYSize	
	movs	r2, #8
	strb	r2, [r3, #0]
	b	lab153
lab149: 	ldr	r3, =gCompsInFrame	
	ldrb	r3, [r3, #0]
	cmp	r3, #3
	bne	lab154
	ldr	r3, =gCompHSamp	
	ldrb	r3, [r3, #1]
	cmp	r3, #1
	bne	lab155
	ldr	r3, =gCompVSamp	
	ldrb	r3, [r3, #1]
	cmp	r3, #1
	bne	lab155
	ldr	r3, =gCompHSamp	
	ldrb	r3, [r3, #2]
	cmp	r3, #1
	bne	lab155
	ldr	r3, =gCompVSamp	
	ldrb	r3, [r3, #2]
	cmp	r3, #1
	beq	lab156
lab155: 	movs	r3, #27
	b	lab152
lab156: 	ldr	r3, =gCompHSamp	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab157
	ldr	r3, =gCompVSamp	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab157
	ldr	r3, =gScanType	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =gMaxBlocksPerMCU	
	movs	r2, #3
	strb	r2, [r3, #0]
	ldr	r3, =gMCUOrg	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gMCUOrg	
	movs	r2, #1
	strb	r2, [r3, #1]
	ldr	r3, =gMCUOrg	
	movs	r2, #2
	strb	r2, [r3, #2]
	ldr	r3, =gMaxMCUXSize	
	movs	r2, #8
	strb	r2, [r3, #0]
	ldr	r3, =gMaxMCUYSize	
	movs	r2, #8
	strb	r2, [r3, #0]
	b	lab153
lab157: 	ldr	r3, =gCompHSamp	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab158
	ldr	r3, =gCompVSamp	
	ldrb	r3, [r3, #0]
	cmp	r3, #2
	bne	lab158
	ldr	r3, =gScanType	
	movs	r2, #3
	strb	r2, [r3, #0]
	ldr	r3, =gMaxBlocksPerMCU	
	movs	r2, #4
	strb	r2, [r3, #0]
	ldr	r3, =gMCUOrg	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gMCUOrg	
	movs	r2, #0
	strb	r2, [r3, #1]
	ldr	r3, =gMCUOrg	
	movs	r2, #1
	strb	r2, [r3, #2]
	ldr	r3, =gMCUOrg	
	movs	r2, #2
	strb	r2, [r3, #3]
	ldr	r3, =gMaxMCUXSize	
	movs	r2, #8
	strb	r2, [r3, #0]
	ldr	r3, =gMaxMCUYSize	
	movs	r2, #16
	strb	r2, [r3, #0]
	b	lab153
lab158: 	ldr	r3, =gCompHSamp	
	ldrb	r3, [r3, #0]
	cmp	r3, #2
	bne	lab159
	ldr	r3, =gCompVSamp	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab159
	ldr	r3, =gScanType	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =gMaxBlocksPerMCU	
	movs	r2, #4
	strb	r2, [r3, #0]
	ldr	r3, =gMCUOrg	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gMCUOrg	
	movs	r2, #0
	strb	r2, [r3, #1]
	ldr	r3, =gMCUOrg	
	movs	r2, #1
	strb	r2, [r3, #2]
	ldr	r3, =gMCUOrg	
	movs	r2, #2
	strb	r2, [r3, #3]
	ldr	r3, =gMaxMCUXSize	
	movs	r2, #16
	strb	r2, [r3, #0]
	ldr	r3, =gMaxMCUYSize	
	movs	r2, #8
	strb	r2, [r3, #0]
	b	lab153
lab159: 	ldr	r3, =gCompHSamp	
	ldrb	r3, [r3, #0]
	cmp	r3, #2
	bne	lab160
	ldr	r3, =gCompVSamp	
	ldrb	r3, [r3, #0]
	cmp	r3, #2
	bne	lab160
	ldr	r3, =gScanType	
	movs	r2, #4
	strb	r2, [r3, #0]
	ldr	r3, =gMaxBlocksPerMCU	
	movs	r2, #6
	strb	r2, [r3, #0]
	ldr	r3, =gMCUOrg	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =gMCUOrg	
	movs	r2, #0
	strb	r2, [r3, #1]
	ldr	r3, =gMCUOrg	
	movs	r2, #0
	strb	r2, [r3, #2]
	ldr	r3, =gMCUOrg	
	movs	r2, #0
	strb	r2, [r3, #3]
	ldr	r3, =gMCUOrg	
	movs	r2, #1
	strb	r2, [r3, #4]
	ldr	r3, =gMCUOrg	
	movs	r2, #2
	strb	r2, [r3, #5]
	ldr	r3, =gMaxMCUXSize	
	movs	r2, #16
	strb	r2, [r3, #0]
	ldr	r3, =gMaxMCUYSize	
	movs	r2, #16
	strb	r2, [r3, #0]
	b	lab153
lab160: 	movs	r3, #27
	b	lab152
lab154: 	movs	r3, #26
	b	lab152
lab153: 	ldr	r3, =gImageXSize	
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =gMaxMCUXSize	
	ldrb	r3, [r3, #0]
	subs	r3, #1
	add	r2, r3
	ldr	r3, =gMaxMCUXSize	
	ldrb	r3, [r3, #0]
	cmp	r3, #8
	bne	lab161
	movs	r3, #3
	b	lab162
lab161: 	movs	r3, #4
lab162: 	asr	r3, r2, r3
	uxth	r2, r3
	ldr	r3, =gMaxMCUSPerRow	
	strh	r2, [r3, #0]
	ldr	r3, =gImageYSize	
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =gMaxMCUYSize	
	ldrb	r3, [r3, #0]
	subs	r3, #1
	add	r2, r3
	ldr	r3, =gMaxMCUYSize	
	ldrb	r3, [r3, #0]
	cmp	r3, #8
	bne	lab163
	movs	r3, #3
	b	lab164
lab163: 	movs	r3, #4
lab164: 	asr	r3, r2, r3
	uxth	r2, r3
	ldr	r3, =gMaxMCUSPerCol	
	strh	r2, [r3, #0]
	ldr	r3, =gMaxMCUSPerRow	
	ldrh	r2, [r3, #0]
	ldr	r3, =gMaxMCUSPerCol	
	ldrh	r3, [r3, #0]
	smulbb	r3, r2, r3
	uxth	r2, r3
	ldr	r3, =gNumMCUSRemaining	
	strh	r2, [r3, #0]
	movs	r3, #0
lab152: 	mov	r0, r3
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
createWinogradQuant:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	strb	r3, [r7, #15]
	b	lab165
lab166: 	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrsh	r3, [r3]
	str	r3, [r7, #8]
	ldrb	r3, [r7, #15]
	ldr	r2, =gWinogradQuant	
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, [r7, #8]
	mul	r3, r2, r3
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	adds	r3, #4
	asrs	r1, r3, #3
	ldrb	r3, [r7, #15]
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
lab165: 	ldrb	r3, [r7, #15]
	cmp	r3, #63	
	bls	lab166
	nop
	nop
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
imul_b1_b3:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	mov	r3, r0
	strh	r3, [r7, #6]
	ldrsh	r3, [r7, #6]
	mov	r2, #362	
	mul	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	adds	r3, #128	
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	asrs	r3, r3, #8
	sxth	r3, r3
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
imul_b2:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	mov	r3, r0
	strh	r3, [r7, #6]
	ldrsh	r3, [r7, #6]
	movw	r2, #669	
	mul	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	adds	r3, #128	
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	asrs	r3, r3, #8
	sxth	r3, r3
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
imul_b4:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	mov	r3, r0
	strh	r3, [r7, #6]
	ldrsh	r3, [r7, #6]
	movw	r2, #277	
	mul	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	adds	r3, #128	
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	asrs	r3, r3, #8
	sxth	r3, r3
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
imul_b5:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	mov	r3, r0
	strh	r3, [r7, #6]
	ldrsh	r3, [r7, #6]
	movs	r2, #196	
	mul	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	adds	r3, #128	
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	asrs	r3, r3, #8
	sxth	r3, r3
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
clamp:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strh	r3, [r7, #6]
	ldrh	r3, [r7, #6]
	cmp	r3, #255	
	bls	lab167
	ldrsh	r3, [r7, #6]
	cmp	r3, #0
	bge	lab168
	movs	r3, #0
	b	lab169
lab168: 	ldrsh	r3, [r7, #6]
	cmp	r3, #255	
	ble	lab167
	movs	r3, #255	
	b	lab169
lab167: 	ldrh	r3, [r7, #6]
	uxtb	r3, r3
lab169: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
idctRows:
	push	{r4, r7, lr}
	sub	sp, #76	
	add	r7, sp, #0
	ldr	r3, =gCoeffBuf	
	str	r3, [r7, #64]	
	movs	r3, #0
	strb	r3, [r7, #71]	
	b	lab170
lab173: 	adds	r3, #2
	ldrsh	r2, [r3]
	ldr	r3, [r7, #64]	
	adds	r3, #4
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #6
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #8
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #10
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #12
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #14
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r3, r3
	cmp	r3, #0
	bne	lab171
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #4]
	ldr	r3, [r7, #64]	
	adds	r3, #2
	ldrh	r2, [r7, #4]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #4
	ldrh	r2, [r7, #4]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #6
	ldrh	r2, [r7, #4]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #8
	ldrh	r2, [r7, #4]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #10
	ldrh	r2, [r7, #4]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #12
	ldrh	r2, [r7, #4]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #14
	ldrh	r2, [r7, #4]
	strh	r2, [r3, #0]
	b	lab172
	nop
	.ltorg
lab171: 	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #10]
	strh	r3, [r7, #62]	
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #6]
	strh	r3, [r7, #60]	
	ldrh	r2, [r7, #62]	
	ldrh	r3, [r7, #60]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #58]	
	ldrh	r2, [r7, #62]	
	ldrh	r3, [r7, #60]	
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #56]	
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #2]
	strh	r3, [r7, #54]	
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #14]
	strh	r3, [r7, #52]	
	ldrh	r2, [r7, #54]	
	ldrh	r3, [r7, #52]	
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #50]	
	ldrh	r2, [r7, #54]	
	ldrh	r3, [r7, #52]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #48]	
	ldrh	r2, [r7, #58]	
	ldrh	r3, [r7, #48]	
	subs	r3, r2, r3
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	imul_b5
	mov	r3, r0
	strh	r3, [r7, #46]	
	ldrsh	r3, [r7, #48]	
	mov	r0, r3
	bl	imul_b4
	mov	r3, r0
	uxth	r2, r3
	ldrh	r3, [r7, #46]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #44]	
	ldrh	r4, [r7, #46]	
	ldrsh	r3, [r7, #58]	
	mov	r0, r3
	bl	imul_b2
	mov	r3, r0
	uxth	r3, r3
	subs	r3, r4, r3
	uxth	r3, r3
	strh	r3, [r7, #42]	
	ldrh	r2, [r7, #50]	
	ldrh	r3, [r7, #56]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #40]	
	ldrh	r2, [r7, #50]	
	ldrh	r3, [r7, #56]	
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #38]	
	ldrh	r2, [r7, #44]	
	ldrh	r3, [r7, #38]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #36]	
	ldrsh	r3, [r7, #40]	
	mov	r0, r3
	bl	imul_b1_b3
	mov	r3, r0
	uxth	r2, r3
	ldrh	r3, [r7, #36]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #34]	
	ldrh	r2, [r7, #34]	
	ldrh	r3, [r7, #42]	
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #32]
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #30]
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #8]
	strh	r3, [r7, #28]
	ldrh	r2, [r7, #30]
	ldrh	r3, [r7, #28]
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #26]
	ldrh	r2, [r7, #30]
	ldrh	r3, [r7, #28]
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #24]
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #4]
	strh	r3, [r7, #22]
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #12]
	strh	r3, [r7, #20]
	ldrh	r2, [r7, #22]
	ldrh	r3, [r7, #20]
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #18]
	ldrh	r2, [r7, #22]
	ldrh	r3, [r7, #20]
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #16]
	ldrsh	r3, [r7, #18]
	mov	r0, r3
	bl	imul_b1_b3
	mov	r3, r0
	uxth	r2, r3
	ldrh	r3, [r7, #16]
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #14]
	ldrh	r2, [r7, #26]
	ldrh	r3, [r7, #16]
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #12]
	ldrh	r2, [r7, #26]
	ldrh	r3, [r7, #16]
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #10]
	ldrh	r2, [r7, #24]
	ldrh	r3, [r7, #14]
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #8]
	ldrh	r2, [r7, #24]
	ldrh	r3, [r7, #14]
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #6]
	ldrh	r2, [r7, #12]
	ldrh	r3, [r7, #38]	
	add	r3, r2
	uxth	r3, r3
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	strh	r2, [r3, #0]
	ldrh	r2, [r7, #8]
	ldrh	r3, [r7, #36]	
	add	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #2
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrh	r2, [r7, #6]
	ldrh	r3, [r7, #34]	
	add	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #4
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrh	r2, [r7, #10]
	ldrh	r3, [r7, #32]
	subs	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #6
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrh	r2, [r7, #10]
	ldrh	r3, [r7, #32]
	add	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #8
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrh	r2, [r7, #6]
	ldrh	r3, [r7, #34]	
	subs	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #10
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrh	r2, [r7, #8]
	ldrh	r3, [r7, #36]	
	subs	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #12
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrh	r2, [r7, #12]
	ldrh	r3, [r7, #38]	
	subs	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #14
	sxth	r2, r2
	strh	r2, [r3, #0]
lab172: 	ldr	r3, [r7, #64]	
	adds	r3, #16
	str	r3, [r7, #64]	
	ldrb	r3, [r7, #71]	
	adds	r3, #1
	strb	r3, [r7, #71]	
lab170: 	ldrb	r3, [r7, #71]	
	cmp	r3, #7
	bls	lab173
	nop
	nop
	adds	r7, #76	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7834
	mov.w r2, #1610612736 
	nop
idctCols:
	push	{r4, r7, lr}
	sub	sp, #76	
	add	r7, sp, #0
	ldr	r3, =gCoeffBuf	
	str	r3, [r7, #64]	
	movs	r3, #0
	strb	r3, [r7, #71]	
	b	lab174
lab177: 	adds	r3, #16
	ldrsh	r2, [r3]
	ldr	r3, [r7, #64]	
	adds	r3, #32
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #48	
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #64	
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #80	
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #96	
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #112	
	ldrsh	r3, [r3]
	orrs	r3, r2
	sxth	r3, r3
	cmp	r3, #0
	bne	lab175
	ldr	r3, [r7, #64]	
	ldrsh	r3, [r3]
	adds	r3, #64	
	lsrs	r3, r3, #7
	uxth	r3, r3
	adds	r3, #128	
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	strb	r3, [r7, #5]
	ldrb	r3, [r7, #5]
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #16
	ldrb	r2, [r7, #5]
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #32
	ldrb	r2, [r7, #5]
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #48	
	ldrb	r2, [r7, #5]
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #64	
	ldrb	r2, [r7, #5]
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #80	
	ldrb	r2, [r7, #5]
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #96	
	ldrb	r2, [r7, #5]
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #112	
	ldrb	r2, [r7, #5]
	sxth	r2, r2
	strh	r2, [r3, #0]
	b	lab176
	nop
	.ltorg
lab175: 	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #80]	
	strh	r3, [r7, #62]	
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #48]	
	strh	r3, [r7, #60]	
	ldrh	r2, [r7, #62]	
	ldrh	r3, [r7, #60]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #58]	
	ldrh	r2, [r7, #62]	
	ldrh	r3, [r7, #60]	
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #56]	
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #16]
	strh	r3, [r7, #54]	
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #112]	
	strh	r3, [r7, #52]	
	ldrh	r2, [r7, #54]	
	ldrh	r3, [r7, #52]	
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #50]	
	ldrh	r2, [r7, #54]	
	ldrh	r3, [r7, #52]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #48]	
	ldrh	r2, [r7, #58]	
	ldrh	r3, [r7, #48]	
	subs	r3, r2, r3
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	imul_b5
	mov	r3, r0
	strh	r3, [r7, #46]	
	ldrsh	r3, [r7, #48]	
	mov	r0, r3
	bl	imul_b4
	mov	r3, r0
	uxth	r2, r3
	ldrh	r3, [r7, #46]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #44]	
	ldrh	r4, [r7, #46]	
	ldrsh	r3, [r7, #58]	
	mov	r0, r3
	bl	imul_b2
	mov	r3, r0
	uxth	r3, r3
	subs	r3, r4, r3
	uxth	r3, r3
	strh	r3, [r7, #42]	
	ldrh	r2, [r7, #50]	
	ldrh	r3, [r7, #56]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #40]	
	ldrh	r2, [r7, #50]	
	ldrh	r3, [r7, #56]	
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #38]	
	ldrh	r2, [r7, #44]	
	ldrh	r3, [r7, #38]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #36]	
	ldrsh	r3, [r7, #40]	
	mov	r0, r3
	bl	imul_b1_b3
	mov	r3, r0
	uxth	r2, r3
	ldrh	r3, [r7, #36]	
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #34]	
	ldrh	r2, [r7, #34]	
	ldrh	r3, [r7, #42]	
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #32]
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #30]
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #64]	
	strh	r3, [r7, #28]
	ldrh	r2, [r7, #30]
	ldrh	r3, [r7, #28]
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #26]
	ldrh	r2, [r7, #30]
	ldrh	r3, [r7, #28]
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #24]
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #32]
	strh	r3, [r7, #22]
	ldr	r3, [r7, #64]	
	ldrh	r3, [r3, #96]	
	strh	r3, [r7, #20]
	ldrh	r2, [r7, #22]
	ldrh	r3, [r7, #20]
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #18]
	ldrh	r2, [r7, #22]
	ldrh	r3, [r7, #20]
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #16]
	ldrsh	r3, [r7, #18]
	mov	r0, r3
	bl	imul_b1_b3
	mov	r3, r0
	uxth	r2, r3
	ldrh	r3, [r7, #16]
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #14]
	ldrh	r2, [r7, #26]
	ldrh	r3, [r7, #16]
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #12]
	ldrh	r2, [r7, #26]
	ldrh	r3, [r7, #16]
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #10]
	ldrh	r2, [r7, #24]
	ldrh	r3, [r7, #14]
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #8]
	ldrh	r2, [r7, #24]
	ldrh	r3, [r7, #14]
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #6]
	ldrsh	r2, [r7, #12]
	ldrsh	r3, [r7, #38]	
	add	r3, r2
	adds	r3, #64	
	lsrs	r3, r3, #7
	uxth	r3, r3
	adds	r3, #128	
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	sxth	r2, r3
	ldr	r3, [r7, #64]	
	strh	r2, [r3, #0]
	ldrsh	r2, [r7, #8]
	ldrsh	r3, [r7, #36]	
	add	r3, r2
	adds	r3, #64	
	lsrs	r3, r3, #7
	uxth	r3, r3
	adds	r3, #128	
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #16
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrsh	r2, [r7, #6]
	ldrsh	r3, [r7, #34]	
	add	r3, r2
	adds	r3, #64	
	lsrs	r3, r3, #7
	uxth	r3, r3
	adds	r3, #128	
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #32
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrsh	r2, [r7, #10]
	ldrsh	r3, [r7, #32]
	subs	r3, r2, r3
	adds	r3, #64	
	lsrs	r3, r3, #7
	uxth	r3, r3
	adds	r3, #128	
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #48	
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrsh	r2, [r7, #10]
	ldrsh	r3, [r7, #32]
	add	r3, r2
	adds	r3, #64	
	lsrs	r3, r3, #7
	uxth	r3, r3
	adds	r3, #128	
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #64	
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrsh	r2, [r7, #6]
	ldrsh	r3, [r7, #34]	
	subs	r3, r2, r3
	adds	r3, #64	
	lsrs	r3, r3, #7
	uxth	r3, r3
	adds	r3, #128	
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #80	
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrsh	r2, [r7, #8]
	ldrsh	r3, [r7, #36]	
	subs	r3, r2, r3
	adds	r3, #64	
	lsrs	r3, r3, #7
	uxth	r3, r3
	adds	r3, #128	
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #96	
	sxth	r2, r2
	strh	r2, [r3, #0]
	ldrsh	r2, [r7, #12]
	ldrsh	r3, [r7, #38]	
	subs	r3, r2, r3
	adds	r3, #64	
	lsrs	r3, r3, #7
	uxth	r3, r3
	adds	r3, #128	
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #64]	
	adds	r3, #112	
	sxth	r2, r2
	strh	r2, [r3, #0]
lab176: 	ldr	r3, [r7, #64]	
	adds	r3, #2
	str	r3, [r7, #64]	
	ldrb	r3, [r7, #71]	
	adds	r3, #1
	strb	r3, [r7, #71]	
lab174: 	ldrb	r3, [r7, #71]	
	cmp	r3, #7
	bls	lab177
	nop
	nop
	adds	r7, #76	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #864
	mov.w r2, #1610612736 
addAndClamp:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strh	r3, [r7, #4]
	ldrb	r3, [r7, #7]
	uxth	r2, r3
	ldrh	r3, [r7, #4]
	add	r3, r2
	uxth	r3, r3
	strh	r3, [r7, #4]
	ldrh	r3, [r7, #4]
	cmp	r3, #255	
	bls	lab178
	ldrsh	r3, [r7, #4]
	cmp	r3, #0
	bge	lab179
	movs	r3, #0
	b	lab180
lab179: 	ldrsh	r3, [r7, #4]
	cmp	r3, #255	
	ble	lab178
	movs	r3, #255	
	b	lab180
lab178: 	ldrh	r3, [r7, #4]
	uxtb	r3, r3
lab180: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
subAndClamp:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strh	r3, [r7, #4]
	ldrb	r3, [r7, #7]
	uxth	r2, r3
	ldrh	r3, [r7, #4]
	subs	r3, r2, r3
	uxth	r3, r3
	strh	r3, [r7, #4]
	ldrh	r3, [r7, #4]
	cmp	r3, #255	
	bls	lab181
	ldrsh	r3, [r7, #4]
	cmp	r3, #0
	bge	lab182
	movs	r3, #0
	b	lab183
lab182: 	ldrsh	r3, [r7, #4]
	cmp	r3, #255	
	ble	lab181
	movs	r3, #255	
	b	lab183
lab181: 	ldrh	r3, [r7, #4]
	uxtb	r3, r3
lab183: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
upsampleCb:
	push	{r4, r7, lr}
	sub	sp, #36	
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #7]
	lsls	r3, r3, #1
	ldr	r2, =gCoeffBuf	
	add	r3, r2
	str	r3, [r7, #24]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufG	
	add	r3, r2
	str	r3, [r7, #20]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufB	
	add	r3, r2
	str	r3, [r7, #16]
	movs	r3, #0
	strb	r3, [r7, #30]
	b	lab184
lab187: 	strb	r3, [r7, #31]
	b	lab185
lab186: 	adds	r2, r3, #2
	str	r2, [r7, #24]
	ldrsh	r3, [r3]
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	movs	r2, #88	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #44	
	uxth	r3, r3
	strh	r3, [r7, #12]
	ldr	r3, [r7, #20]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #20]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r4, r3, #1
	ldrsh	r3, [r7, #12]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #20]
	adds	r3, #8
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	add	r4, r3, #8
	ldrsh	r3, [r7, #12]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #20]
	adds	r3, #9
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	add	r4, r3, #9
	ldrsh	r3, [r7, #12]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldrb	r3, [r7, #15]
	uxth	r2, r3
	ldrb	r3, [r7, #15]
	movs	r1, #198	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #227	
	uxth	r3, r3
	strh	r3, [r7, #10]
	ldr	r3, [r7, #16]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #10]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #16]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r3, #1
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r4, r3, #1
	ldrsh	r3, [r7, #10]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #16]
	adds	r3, #8
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	add	r4, r3, #8
	ldrsh	r3, [r7, #10]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #16]
	adds	r3, #9
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	add	r4, r3, #9
	ldrsh	r3, [r7, #10]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #20]
	adds	r3, #2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r3, #2
	str	r3, [r7, #16]
	ldrb	r3, [r7, #31]
	adds	r3, #1
	strb	r3, [r7, #31]
lab185: 	ldrb	r3, [r7, #31]
	cmp	r3, #3
	bls	lab186
	ldr	r3, [r7, #24]
	adds	r3, #8
	str	r3, [r7, #24]
	ldr	r3, [r7, #20]
	adds	r3, #8
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r3, #8
	str	r3, [r7, #16]
	ldrb	r3, [r7, #30]
	adds	r3, #1
	strb	r3, [r7, #30]
lab184: 	ldrb	r3, [r7, #30]
	cmp	r3, #3
	bls	lab187
	nop
	nop
	adds	r7, #36	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5196
	mov.w r2, #1610612736 
	nop
	.ltorg
upsampleCbH:
	push	{r4, r7, lr}
	sub	sp, #36	
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #7]
	lsls	r3, r3, #1
	ldr	r2, =gCoeffBuf	
	add	r3, r2
	str	r3, [r7, #24]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufG	
	add	r3, r2
	str	r3, [r7, #20]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufB	
	add	r3, r2
	str	r3, [r7, #16]
	movs	r3, #0
	strb	r3, [r7, #30]
	b	lab188
lab191: 	strb	r3, [r7, #31]
	b	lab189
lab190: 	adds	r2, r3, #2
	str	r2, [r7, #24]
	ldrsh	r3, [r3]
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	movs	r2, #88	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #44	
	uxth	r3, r3
	strh	r3, [r7, #12]
	ldr	r3, [r7, #20]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #20]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r4, r3, #1
	ldrsh	r3, [r7, #12]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldrb	r3, [r7, #15]
	uxth	r2, r3
	ldrb	r3, [r7, #15]
	movs	r1, #198	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #227	
	uxth	r3, r3
	strh	r3, [r7, #10]
	ldr	r3, [r7, #16]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #10]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #16]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r3, #1
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r4, r3, #1
	ldrsh	r3, [r7, #10]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #20]
	adds	r3, #2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r3, #2
	str	r3, [r7, #16]
	ldrb	r3, [r7, #31]
	adds	r3, #1
	strb	r3, [r7, #31]
lab189: 	ldrb	r3, [r7, #31]
	cmp	r3, #3
	bls	lab190
	ldr	r3, [r7, #24]
	adds	r3, #8
	str	r3, [r7, #24]
	ldrb	r3, [r7, #30]
	adds	r3, #1
	strb	r3, [r7, #30]
lab188: 	ldrb	r3, [r7, #30]
	cmp	r3, #7
	bls	lab191
	nop
	nop
	adds	r7, #36	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2044
	mov.w r2, #1610612736 
	nop
	.ltorg
upsampleCbV:
	push	{r4, r7, lr}
	sub	sp, #36	
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #7]
	lsls	r3, r3, #1
	ldr	r2, =gCoeffBuf	
	add	r3, r2
	str	r3, [r7, #24]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufG	
	add	r3, r2
	str	r3, [r7, #20]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufB	
	add	r3, r2
	str	r3, [r7, #16]
	movs	r3, #0
	strb	r3, [r7, #30]
	b	lab192
lab195: 	strb	r3, [r7, #31]
	b	lab193
lab194: 	adds	r2, r3, #2
	str	r2, [r7, #24]
	ldrsh	r3, [r3]
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	movs	r2, #88	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #44	
	uxth	r3, r3
	strh	r3, [r7, #12]
	ldr	r3, [r7, #20]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #20]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #8
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	add	r4, r3, #8
	ldrsh	r3, [r7, #12]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldrb	r3, [r7, #15]
	uxth	r2, r3
	ldrb	r3, [r7, #15]
	movs	r1, #198	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #227	
	uxth	r3, r3
	strh	r3, [r7, #10]
	ldr	r3, [r7, #16]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #10]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #16]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r3, #8
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	add	r4, r3, #8
	ldrsh	r3, [r7, #10]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r3, #1
	str	r3, [r7, #16]
	ldrb	r3, [r7, #31]
	adds	r3, #1
	strb	r3, [r7, #31]
lab193: 	ldrb	r3, [r7, #31]
	cmp	r3, #7
	bls	lab194
	ldr	r3, [r7, #20]
	adds	r3, #8
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r3, #8
	str	r3, [r7, #16]
	ldrb	r3, [r7, #30]
	adds	r3, #1
	strb	r3, [r7, #30]
lab192: 	ldrb	r3, [r7, #30]
	cmp	r3, #3
	bls	lab195
	nop
	nop
	adds	r7, #36	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4530
	mov.w r2, #1610612736 
	.ltorg
upsampleCr:
	push	{r4, r7, lr}
	sub	sp, #36	
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #7]
	lsls	r3, r3, #1
	ldr	r2, =gCoeffBuf	
	add	r3, r2
	str	r3, [r7, #24]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufR	
	add	r3, r2
	str	r3, [r7, #20]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufG	
	add	r3, r2
	str	r3, [r7, #16]
	movs	r3, #0
	strb	r3, [r7, #30]
	b	lab196
lab199: 	strb	r3, [r7, #31]
	b	lab197
lab198: 	adds	r2, r3, #2
	str	r2, [r7, #24]
	ldrsh	r3, [r3]
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	uxth	r2, r3
	ldrb	r3, [r7, #15]
	movs	r1, #103	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #179	
	uxth	r3, r3
	strh	r3, [r7, #12]
	ldr	r3, [r7, #20]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #12]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #20]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r4, r3, #1
	ldrsh	r3, [r7, #12]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #20]
	adds	r3, #8
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	add	r4, r3, #8
	ldrsh	r3, [r7, #12]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #20]
	adds	r3, #9
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	add	r4, r3, #9
	ldrsh	r3, [r7, #12]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldrb	r3, [r7, #15]
	movs	r2, #183	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #91	
	uxth	r3, r3
	strh	r3, [r7, #10]
	ldr	r3, [r7, #16]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #16]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r3, #1
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r4, r3, #1
	ldrsh	r3, [r7, #10]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #16]
	adds	r3, #8
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	add	r4, r3, #8
	ldrsh	r3, [r7, #10]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #16]
	adds	r3, #9
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	add	r4, r3, #9
	ldrsh	r3, [r7, #10]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #20]
	adds	r3, #2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r3, #2
	str	r3, [r7, #16]
	ldrb	r3, [r7, #31]
	adds	r3, #1
	strb	r3, [r7, #31]
lab197: 	ldrb	r3, [r7, #31]
	cmp	r3, #3
	bls	lab198
	ldr	r3, [r7, #24]
	adds	r3, #8
	str	r3, [r7, #24]
	ldr	r3, [r7, #20]
	adds	r3, #8
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r3, #8
	str	r3, [r7, #16]
	ldrb	r3, [r7, #30]
	adds	r3, #1
	strb	r3, [r7, #30]
lab196: 	ldrb	r3, [r7, #30]
	cmp	r3, #3
	bls	lab199
	nop
	nop
	adds	r7, #36	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7854
	mov.w r2, #1610612736 
	nop
	.ltorg
upsampleCrH:
	push	{r4, r7, lr}
	sub	sp, #36	
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #7]
	lsls	r3, r3, #1
	ldr	r2, =gCoeffBuf	
	add	r3, r2
	str	r3, [r7, #24]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufR	
	add	r3, r2
	str	r3, [r7, #20]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufG	
	add	r3, r2
	str	r3, [r7, #16]
	movs	r3, #0
	strb	r3, [r7, #30]
	b	lab200
lab203: 	strb	r3, [r7, #31]
	b	lab201
lab202: 	adds	r2, r3, #2
	str	r2, [r7, #24]
	ldrsh	r3, [r3]
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	uxth	r2, r3
	ldrb	r3, [r7, #15]
	movs	r1, #103	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #179	
	uxth	r3, r3
	strh	r3, [r7, #12]
	ldr	r3, [r7, #20]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #12]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #20]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r4, r3, #1
	ldrsh	r3, [r7, #12]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldrb	r3, [r7, #15]
	movs	r2, #183	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #91	
	uxth	r3, r3
	strh	r3, [r7, #10]
	ldr	r3, [r7, #16]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #16]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r3, #1
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r4, r3, #1
	ldrsh	r3, [r7, #10]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #20]
	adds	r3, #2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r3, #2
	str	r3, [r7, #16]
	ldrb	r3, [r7, #31]
	adds	r3, #1
	strb	r3, [r7, #31]
lab201: 	ldrb	r3, [r7, #31]
	cmp	r3, #3
	bls	lab202
	ldr	r3, [r7, #24]
	adds	r3, #8
	str	r3, [r7, #24]
	ldrb	r3, [r7, #30]
	adds	r3, #1
	strb	r3, [r7, #30]
lab200: 	ldrb	r3, [r7, #30]
	cmp	r3, #7
	bls	lab203
	nop
	nop
	adds	r7, #36	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6960
	mov.w r2, #1610612736 
	nop
	.ltorg
upsampleCrV:
	push	{r4, r7, lr}
	sub	sp, #36	
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #7]
	lsls	r3, r3, #1
	ldr	r2, =gCoeffBuf	
	add	r3, r2
	str	r3, [r7, #24]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufR	
	add	r3, r2
	str	r3, [r7, #20]
	ldrb	r3, [r7, #6]
	ldr	r2, =gMCUBufG	
	add	r3, r2
	str	r3, [r7, #16]
	movs	r3, #0
	strb	r3, [r7, #30]
	b	lab204
lab207: 	strb	r3, [r7, #31]
	b	lab205
lab206: 	adds	r2, r3, #2
	str	r2, [r7, #24]
	ldrsh	r3, [r3]
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	uxth	r2, r3
	ldrb	r3, [r7, #15]
	movs	r1, #103	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #179	
	uxth	r3, r3
	strh	r3, [r7, #12]
	ldr	r3, [r7, #20]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #12]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #20]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #8
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	add	r4, r3, #8
	ldrsh	r3, [r7, #12]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldrb	r3, [r7, #15]
	movs	r2, #183	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #91	
	uxth	r3, r3
	strh	r3, [r7, #10]
	ldr	r3, [r7, #16]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #16]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r3, #8
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	add	r4, r3, #8
	ldrsh	r3, [r7, #10]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r3, #1
	str	r3, [r7, #16]
	ldrb	r3, [r7, #31]
	adds	r3, #1
	strb	r3, [r7, #31]
lab205: 	ldrb	r3, [r7, #31]
	cmp	r3, #7
	bls	lab206
	ldr	r3, [r7, #20]
	adds	r3, #8
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r3, #8
	str	r3, [r7, #16]
	ldrb	r3, [r7, #30]
	adds	r3, #1
	strb	r3, [r7, #30]
lab204: 	ldrb	r3, [r7, #30]
	cmp	r3, #3
	bls	lab207
	nop
	nop
	adds	r7, #36	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7344
	mov.w r2, #1610612736 
	.ltorg
copyY:
	push	{r7}
	sub	sp, #36	
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	ldr	r2, =gMCUBufR	
	add	r3, r2
	str	r3, [r7, #24]
	ldrb	r3, [r7, #7]
	ldr	r2, =gMCUBufG	
	add	r3, r2
	str	r3, [r7, #20]
	ldrb	r3, [r7, #7]
	ldr	r2, =gMCUBufB	
	add	r3, r2
	str	r3, [r7, #16]
	ldr	r3, =gCoeffBuf	
	str	r3, [r7, #12]
	movs	r3, #64	
	strb	r3, [r7, #31]
	b	lab208
lab209: 	adds	r2, r3, #2
	str	r2, [r7, #12]
	ldrsh	r3, [r3]
	strb	r3, [r7, #11]
	ldr	r3, [r7, #24]
	adds	r2, r3, #1
	str	r2, [r7, #24]
	ldrb	r2, [r7, #11]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r2, r3, #1
	str	r2, [r7, #20]
	ldrb	r2, [r7, #11]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r2, r3, #1
	str	r2, [r7, #16]
	ldrb	r2, [r7, #11]
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #31]
	subs	r3, #1
	strb	r3, [r7, #31]
lab208: 	ldrb	r3, [r7, #31]
	cmp	r3, #0
	bne	lab209
	nop
	nop
	adds	r7, #36	
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
convertCb:
	push	{r7, lr}
	sub	sp, #32
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	ldr	r2, =gMCUBufG	
	add	r3, r2
	str	r3, [r7, #24]
	ldrb	r3, [r7, #7]
	ldr	r2, =gMCUBufB	
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, =gCoeffBuf	
	str	r3, [r7, #16]
	movs	r3, #64	
	strb	r3, [r7, #31]
	b	lab210
lab211: 	adds	r2, r3, #2
	str	r2, [r7, #16]
	ldrsh	r3, [r3]
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	movs	r2, #88	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #44	
	uxth	r3, r3
	strh	r3, [r7, #12]
	ldr	r3, [r7, #24]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #24]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #24]
	adds	r3, #1
	str	r3, [r7, #24]
	ldrb	r3, [r7, #15]
	uxth	r2, r3
	ldrb	r3, [r7, #15]
	movs	r1, #198	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #227	
	uxth	r3, r3
	strh	r3, [r7, #10]
	ldr	r3, [r7, #20]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #10]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #20]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
	ldrb	r3, [r7, #31]
	subs	r3, #1
	strb	r3, [r7, #31]
lab210: 	ldrb	r3, [r7, #31]
	cmp	r3, #0
	bne	lab211
	nop
	nop
	adds	r7, #32
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4626
	mov.w r2, #1610612736 
	nop
	.ltorg
convertCr:
	push	{r7, lr}
	sub	sp, #32
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	ldr	r2, =gMCUBufR	
	add	r3, r2
	str	r3, [r7, #24]
	ldrb	r3, [r7, #7]
	ldr	r2, =gMCUBufG	
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, =gCoeffBuf	
	str	r3, [r7, #16]
	movs	r3, #64	
	strb	r3, [r7, #31]
	b	lab212
lab213: 	adds	r2, r3, #2
	str	r2, [r7, #16]
	ldrsh	r3, [r3]
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	uxth	r2, r3
	ldrb	r3, [r7, #15]
	movs	r1, #103	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #179	
	uxth	r3, r3
	strh	r3, [r7, #12]
	ldr	r3, [r7, #24]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #12]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #24]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #24]
	adds	r3, #1
	str	r3, [r7, #24]
	ldrb	r3, [r7, #15]
	movs	r2, #183	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #91	
	uxth	r3, r3
	strh	r3, [r7, #10]
	ldr	r3, [r7, #20]
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #20]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
	ldrb	r3, [r7, #31]
	subs	r3, #1
	strb	r3, [r7, #31]
lab212: 	ldrb	r3, [r7, #31]
	cmp	r3, #0
	bne	lab213
	nop
	nop
	adds	r7, #32
	mov	sp, r7
	pop	{r7, pc}
	nop
	.ltorg
transformBlock:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	bl	idctRows
	push {r1, r2}
	mov.w r1, #1728
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7869
	mov.w r2, #1610612736 
	ldrb	r3, [r3, #0]
	cmp	r3, #4
	bhi	lab214
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	movs	r0, #0
	bl	copyY
	b	lab214
	ldrb	r3, [r7, #7]
	cmp	r3, #2
	beq	lab215
	cmp	r3, #2
	bgt	lab216
	cmp	r3, #0
	beq	lab217
	cmp	r3, #1
	beq	lab218
	b	lab216
lab217: 	movs	r0, #0
	bl	copyY
	b	lab219
lab218: 	movs	r0, #0
	bl	convertCb
	push {r1, r2}
	mov.w r1, #499
	mov.w r2, #1610612736 
lab215: 	movs	r0, #0
	bl	convertCr
	nop
lab219: 	b	lab216
	ldrb	r3, [r7, #7]
	cmp	r3, #3
	bhi	lab220
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	movs	r0, #0
	bl	copyY
	b	lab221
	movs	r0, #128	
	bl	copyY
	b	lab221
	movs	r1, #0
	movs	r0, #0
push {r1, r2}
	mov.w r1, #655
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #655
	mov.w r2, #1610612736 
	movs	r0, #32
push {r1, r2}
	mov.w r1, #7522
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7522
	mov.w r2, #1610612736 
	movs	r1, #0
	movs	r0, #0
push {r1, r2}
	mov.w r1, #985
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #985
	mov.w r2, #1610612736 
	movs	r0, #32
push {r1, r2}
	mov.w r1, #328
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #328
	mov.w r2, #1610612736 
lab221: 	b	lab220
	ldrb	r3, [r7, #7]
	cmp	r3, #3
	bhi	lab222
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	movs	r0, #0
	bl	copyY
	b	lab223
	movs	r0, #64	
	bl	copyY
	b	lab223
	movs	r1, #0
	movs	r0, #0
push {r1, r2}
	mov.w r1, #7578
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7578
	mov.w r2, #1610612736 
	movs	r0, #4
push {r1, r2}
	mov.w r1, #7020
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7020
	mov.w r2, #1610612736 
	movs	r1, #0
	movs	r0, #0
push {r1, r2}
	mov.w r1, #3468
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3468
	mov.w r2, #1610612736 
	movs	r0, #4
push {r1, r2}
	mov.w r1, #6461
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6461
	mov.w r2, #1610612736 
lab223: 	b	lab222
	ldrb	r3, [r7, #7]
	cmp	r3, #5
	bhi	lab224
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	movs	r0, #0
	bl	copyY
	b	lab225
	movs	r0, #64	
	bl	copyY
	b	lab225
	movs	r0, #128	
	bl	copyY
	b	lab225
	movs	r0, #192	
	bl	copyY
	b	lab225
	movs	r1, #0
	movs	r0, #0
push {r1, r2}
	mov.w r1, #8009
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8009
	mov.w r2, #1610612736 
	movs	r0, #4
push {r1, r2}
	mov.w r1, #5071
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5071
	mov.w r2, #1610612736 
	movs	r0, #32
push {r1, r2}
	mov.w r1, #2666
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2666
	mov.w r2, #1610612736 
	movs	r0, #36	
push {r1, r2}
	mov.w r1, #1274
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1274
	mov.w r2, #1610612736 
	movs	r1, #0
	movs	r0, #0
push {r1, r2}
	mov.w r1, #3112
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3112
	mov.w r2, #1610612736 
	movs	r0, #4
push {r1, r2}
	mov.w r1, #8182
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8182
	mov.w r2, #1610612736 
	movs	r0, #32
push {r1, r2}
	mov.w r1, #8034
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8034
	mov.w r2, #1610612736 
	movs	r0, #36	
push {r1, r2}
	mov.w r1, #1523
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1523
	mov.w r2, #1610612736 
lab225: 	b	lab224
lab216: 	nop
	b	lab214
lab220: 	nop
	b	lab214
lab222: 	nop
	b	lab214
lab224: 	nop
lab214: 	nop
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5385
	mov.w r2, #1610612736 
	.ltorg
transformBlockReduce:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldr	r3, =gCoeffBuf	
	ldrsh	r3, [r3]
	adds	r3, #64	
	lsrs	r3, r3, #7
	uxth	r3, r3
	adds	r3, #128	
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	strb	r3, [r7, #23]
	ldr	r3, =gScanType	
	ldrb	r3, [r3, #0]
	cmp	r3, #4
	bhi	lab226
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	ldr	r2, =gMCUBufR	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	b	lab226
	ldrb	r3, [r7, #7]
	cmp	r3, #2
	beq	lab227
	cmp	r3, #2
	bgt	lab228
	cmp	r3, #0
	beq	lab229
	cmp	r3, #1
	beq	lab230
	b	lab228
lab229: 	ldr	r2, =gMCUBufR	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	ldr	r2, =gMCUBufG	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	ldr	r2, =gMCUBufB	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	b	lab231
lab230: 	ldrb	r3, [r7, #23]
	movs	r2, #88	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #44	
	uxth	r3, r3
	strh	r3, [r7, #16]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #16]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #23]
	uxth	r2, r3
	ldrb	r3, [r7, #23]
	movs	r1, #198	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #227	
	uxth	r3, r3
	strh	r3, [r7, #14]
	ldr	r3, =gMCUBufB	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufB	
	strb	r2, [r3, #0]
	b	lab231
lab227: 	ldrb	r3, [r7, #23]
	uxth	r2, r3
	ldrb	r3, [r7, #23]
	movs	r1, #103	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #179	
	uxth	r3, r3
	strh	r3, [r7, #20]
	ldr	r3, =gMCUBufR	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #20]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufR	
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #23]
	movs	r2, #183	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #91	
	uxth	r3, r3
	strh	r3, [r7, #18]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #18]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #0]
	nop
lab231: 	b	lab228
	ldrb	r3, [r7, #7]
	cmp	r3, #3
	bhi	lab232
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	ldr	r2, =gMCUBufR	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	ldr	r2, =gMCUBufG	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	ldr	r2, =gMCUBufB	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	b	lab233
	ldr	r2, =gMCUBufR	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #128]	
	ldr	r2, =gMCUBufG	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #128]	
	ldr	r2, =gMCUBufB	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #128]	
	b	lab233
	ldrb	r3, [r7, #23]
	movs	r2, #88	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #44	
	uxth	r3, r3
	strh	r3, [r7, #16]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #16]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #128]	
	ldrsh	r2, [r7, #16]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #128]	
	ldrb	r3, [r7, #23]
	uxth	r2, r3
	ldrb	r3, [r7, #23]
	movs	r1, #198	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #227	
	uxth	r3, r3
	strh	r3, [r7, #14]
	ldr	r3, =gMCUBufB	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufB	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufB	
	ldrb	r3, [r3, #128]	
	ldrsh	r2, [r7, #14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufB	
	strb	r2, [r3, #128]	
	b	lab233
	ldrb	r3, [r7, #23]
	uxth	r2, r3
	ldrb	r3, [r7, #23]
	movs	r1, #103	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #179	
	uxth	r3, r3
	strh	r3, [r7, #20]
	ldr	r3, =gMCUBufR	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #20]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufR	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufR	
	ldrb	r3, [r3, #128]	
	ldrsh	r2, [r7, #20]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufR	
	strb	r2, [r3, #128]	
	ldrb	r3, [r7, #23]
	movs	r2, #183	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #91	
	uxth	r3, r3
	strh	r3, [r7, #18]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #18]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #128]	
	ldrsh	r2, [r7, #18]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #128]	
	nop
lab233: 	b	lab232
	ldrb	r3, [r7, #7]
	cmp	r3, #3
	bhi	lab234
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	nop
	.ltorg
	ldr	r2, =gMCUBufR	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	ldr	r2, =gMCUBufG	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	ldr	r2, =gMCUBufB	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	b	lab235
	ldr	r2, =gMCUBufR	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #64]	
	ldr	r2, =gMCUBufG	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #64]	
	ldr	r2, =gMCUBufB	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #64]	
	b	lab235
	nop
	.ltorg
	ldrb	r3, [r7, #23]
	movs	r2, #88	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #44	
	uxth	r3, r3
	strh	r3, [r7, #16]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #16]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #64]	
	ldrsh	r2, [r7, #16]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #64]	
	ldrb	r3, [r7, #23]
	uxth	r2, r3
	ldrb	r3, [r7, #23]
	movs	r1, #198	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #227	
	uxth	r3, r3
	strh	r3, [r7, #14]
	ldr	r3, =gMCUBufB	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufB	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufB	
	ldrb	r3, [r3, #64]	
	ldrsh	r2, [r7, #14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufB	
	strb	r2, [r3, #64]	
	b	lab235
	ldrb	r3, [r7, #23]
	uxth	r2, r3
	ldrb	r3, [r7, #23]
	movs	r1, #103	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #179	
	uxth	r3, r3
	strh	r3, [r7, #20]
	ldr	r3, =gMCUBufR	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #20]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufR	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufR	
	ldrb	r3, [r3, #64]	
	ldrsh	r2, [r7, #20]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufR	
	strb	r2, [r3, #64]	
	ldrb	r3, [r7, #23]
	movs	r2, #183	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #91	
	uxth	r3, r3
	strh	r3, [r7, #18]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #18]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #64]	
	ldrsh	r2, [r7, #18]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #64]	
	nop
lab235: 	b	lab234
	ldrb	r3, [r7, #7]
	cmp	r3, #5
	bhi	lab236
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	.ltorg
	ldr	r2, =gMCUBufR	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	ldr	r2, =gMCUBufG	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	ldr	r2, =gMCUBufB	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #0]
	b	lab237
	ldr	r2, =gMCUBufR	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #64]	
	ldr	r2, =gMCUBufG	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #64]	
	ldr	r2, =gMCUBufB	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #64]	
	b	lab237
	ldr	r2, =gMCUBufR	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #128]	
	ldr	r2, =gMCUBufG	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #128]	
	ldr	r2, =gMCUBufB	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #128]	
	b	lab237
	ldr	r2, =gMCUBufR	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #192]	
	ldr	r2, =gMCUBufG	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #192]	
	ldr	r2, =gMCUBufB	
	ldrb	r3, [r7, #23]
	strb	r3, [r2, #192]	
	b	lab237
	ldrb	r3, [r7, #23]
	movs	r2, #88	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #44	
	uxth	r3, r3
	strh	r3, [r7, #16]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #16]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #64]	
	ldrsh	r2, [r7, #16]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #64]	
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #128]	
	ldrsh	r2, [r7, #16]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #128]	
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #192]	
	ldrsh	r2, [r7, #16]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #192]	
	ldrb	r3, [r7, #23]
	uxth	r2, r3
	ldrb	r3, [r7, #23]
	movs	r1, #198	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #227	
	uxth	r3, r3
	strh	r3, [r7, #14]
	ldr	r3, =gMCUBufB	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufB	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufB	
	ldrb	r3, [r3, #64]	
	ldrsh	r2, [r7, #14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufB	
	strb	r2, [r3, #64]	
	ldr	r3, =gMCUBufB	
	ldrb	r3, [r3, #128]	
	ldrsh	r2, [r7, #14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufB	
	strb	r2, [r3, #128]	
	ldr	r3, =gMCUBufB	
	ldrb	r3, [r3, #192]	
	ldrsh	r2, [r7, #14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufB	
	strb	r2, [r3, #192]	
	b	lab237
	.ltorg
	ldrb	r3, [r7, #23]
	uxth	r2, r3
	ldrb	r3, [r7, #23]
	movs	r1, #103	
	mul	r3, r1, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	subs	r3, #179	
	uxth	r3, r3
	strh	r3, [r7, #20]
	ldr	r3, =gMCUBufR	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #20]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufR	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufR	
	ldrb	r3, [r3, #64]	
	ldrsh	r2, [r7, #20]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufR	
	strb	r2, [r3, #64]	
	ldr	r3, =gMCUBufR	
	ldrb	r3, [r3, #128]	
	ldrsh	r2, [r7, #20]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufR	
	strb	r2, [r3, #128]	
	ldr	r3, =gMCUBufR	
	ldrb	r3, [r3, #192]	
	ldrsh	r2, [r7, #20]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufR	
	strb	r2, [r3, #192]	
	ldrb	r3, [r7, #23]
	movs	r2, #183	
	mul	r3, r2, r3
	lsrs	r3, r3, #8
	uxth	r3, r3
	subs	r3, #91	
	uxth	r3, r3
	strh	r3, [r7, #18]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #0]
	ldrsh	r2, [r7, #18]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #0]
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #64]	
	ldrsh	r2, [r7, #18]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #64]	
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #128]	
	ldrsh	r2, [r7, #18]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #128]	
	ldr	r3, =gMCUBufG	
	ldrb	r3, [r3, #192]	
	ldrsh	r2, [r7, #18]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, =gMCUBufG	
	strb	r2, [r3, #192]	
	nop
lab237: 	b	lab236
lab228: 	nop
	b	lab226
lab232: 	nop
	b	lab226
lab234: 	nop
	b	lab226
lab236: 	nop
lab226: 	nop
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5136
	mov.w r2, #1610612736 
	nop
	.ltorg
decodeNextMCU:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	ldr	r3, =gRestartInterval	
	ldrh	r3, [r3, #0]
	cmp	r3, #0
	beq	lab238
	ldr	r3, =gRestartsLeft	
	ldrh	r3, [r3, #0]
	cmp	r3, #0
	bne	lab239
	bl	processRestart
	push {r1, r2}
	mov.w r1, #844
	mov.w r2, #1610612736 
	strb	r3, [r7, #17]
	ldrb	r3, [r7, #17]
	cmp	r3, #0
	beq	lab239
	ldrb	r3, [r7, #17]
	b	lab240
lab239: 	ldr	r3, =gRestartsLeft	
	ldrh	r3, [r3, #0]
	subs	r3, #1
	uxth	r2, r3
	ldr	r3, =gRestartsLeft	
	strh	r2, [r3, #0]
lab238: 	movs	r3, #0
	strb	r3, [r7, #23]
	b	lab241
lab282: 	ldr	r2, =gMCUOrg	
	ldrb	r3, [r2, r3]
	strb	r3, [r7, #16]
	ldrb	r3, [r7, #16]
	ldr	r2, =gCompQuant	
	ldrb	r3, [r2, r3]
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #16]
	ldr	r2, =gCompDCTab	
	ldrb	r3, [r2, r3]
	strb	r3, [r7, #14]
	ldrb	r3, [r7, #15]
	cmp	r3, #0
	beq	lab242
	ldr	r3, =gQuant1	
	b	lab243
lab242: 	ldr	r3, =gQuant0	
lab243: 	str	r3, [r7, #8]
	ldrb	r3, [r7, #14]
	cmp	r3, #0
	beq	lab244
	ldr	r2, =gHuffTab1	
	b	lab245
lab244: 	ldr	r2, =gHuffTab0	
lab245: 	ldrb	r3, [r7, #14]
	cmp	r3, #0
	beq	lab246
	ldr	r3, =gHuffVal1	
	b	lab247
lab246: 	ldr	r3, =gHuffVal0	
lab247: 	mov	r1, r3
	mov	r0, r2
push {r1, r2}
	mov.w r1, #5894
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5894
	mov.w r2, #1610612736 
	strb	r3, [r7, #7]
	movs	r3, #0
	strh	r3, [r7, #20]
	ldrb	r3, [r7, #7]
	and	r3, r3, #15
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #6]
	cmp	r3, #0
	beq	lab248
	ldrb	r3, [r7, #6]
	mov	r0, r3
push {r1, r2}
	mov.w r1, #6652
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6652
	mov.w r2, #1610612736 
	strh	r3, [r7, #20]
lab248: 	ldrb	r2, [r7, #7]
	ldrh	r3, [r7, #20]
	mov	r1, r2
	mov	r0, r3
push {r1, r2}
	mov.w r1, #4725
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4725
	mov.w r2, #1610612736 
	strh	r3, [r7, #4]
	ldrb	r3, [r7, #16]
	ldr	r2, =gLastDC	
	ldrsh	r3, [r2, r3, lsl #1]
	uxth	r2, r3
	ldrh	r3, [r7, #4]
	add	r3, r2
	strh	r3, [r7, #4]
	ldrb	r3, [r7, #16]
	ldrsh	r1, [r7, #4]
	ldr	r2, =gLastDC	
	strh	r1, [r2, r3, lsl #1]
	ldr	r3, [r7, #8]
	ldrsh	r3, [r3]
	uxth	r3, r3
	ldrh	r2, [r7, #4]
	smulbb	r3, r2, r3
	uxth	r3, r3
	sxth	r2, r3
	ldr	r3, =gCoeffBuf	
	strh	r2, [r3, #0]
	ldrb	r3, [r7, #16]
	ldr	r2, =gCompACTab	
	ldrb	r3, [r2, r3]
	strb	r3, [r7, #3]
	ldr	r3, =gReduce	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab249
	movs	r3, #1
	strb	r3, [r7, #22]
	b	lab250
lab261: 	cmp	r3, #0
	beq	lab251
	ldr	r2, =gHuffTab3	
	b	lab252
lab251: 	ldr	r2, =gHuffTab2	
lab252: 	ldrb	r3, [r7, #3]
	cmp	r3, #0
	beq	lab253
	ldr	r3, =gHuffVal3	
	b	lab254
lab253: 	ldr	r3, =gHuffVal2	
lab254: 	mov	r1, r3
	mov	r0, r2
push {r1, r2}
	mov.w r1, #1750
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1750
	mov.w r2, #1610612736 
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	and	r3, r3, #15
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #6]
	cmp	r3, #0
	beq	lab255
	ldrb	r3, [r7, #6]
	mov	r0, r3
push {r1, r2}
	mov.w r1, #3054
	mov.w r2, #1610612736 
lab255:	push {r1, r2}
	mov.w r1, #3054
	mov.w r2, #1610612736 
	lsrs	r3, r3, #4
	uxtb	r3, r3
	strh	r3, [r7, #20]
	ldrb	r3, [r7, #7]
	and	r3, r3, #15
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab256
	ldrh	r3, [r7, #20]
	cmp	r3, #0
	beq	lab257
	ldrb	r2, [r7, #22]
	ldrh	r3, [r7, #20]
	add	r3, r2
	cmp	r3, #63	
	ble	lab258
	movs	r3, #28
	b	lab240
lab258: 	ldrh	r3, [r7, #20]
	uxtb	r2, r3
	ldrb	r3, [r7, #22]
	add	r3, r2
	strb	r3, [r7, #22]
	b	lab257
lab256: 	ldrh	r3, [r7, #20]
	cmp	r3, #15
	bne	lab259
	ldrb	r3, [r7, #22]
	cmp	r3, #48	
	bls	lab260
	movs	r3, #28
	b	lab240
lab260: 	ldrb	r3, [r7, #22]
	adds	r3, #15
	strb	r3, [r7, #22]
lab257: 	ldrb	r3, [r7, #22]
	adds	r3, #1
	strb	r3, [r7, #22]
lab250: 	ldrb	r3, [r7, #22]
	cmp	r3, #63	
	bls	lab261
	b	lab262
lab259: 	nop
lab262: 	ldrb	r3, [r7, #23]
	mov	r0, r3
	bl	transformBlockReduce
	push {r1, r2}
	mov.w r1, #2677
	mov.w r2, #1610612736 
lab249: 	movs	r3, #1
	strb	r3, [r7, #22]
	b	lab264
lab279: 	cmp	r3, #0
	beq	lab265
	ldr	r2, =gHuffTab3	
	b	lab266
lab265: 	ldr	r2, =gHuffTab2	
lab266: 	ldrb	r3, [r7, #3]
	cmp	r3, #0
	beq	lab267
	ldr	r3, =gHuffVal3	
	b	lab268
lab267: 	ldr	r3, =gHuffVal2	
lab268: 	mov	r1, r3
	mov	r0, r2
push {r1, r2}
	mov.w r1, #5855
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5855
	mov.w r2, #1610612736 
	strb	r3, [r7, #7]
	movs	r3, #0
	strh	r3, [r7, #18]
	ldrb	r3, [r7, #7]
	and	r3, r3, #15
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #6]
	cmp	r3, #0
	beq	lab269
	ldrb	r3, [r7, #6]
	mov	r0, r3
push {r1, r2}
	mov.w r1, #3047
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3047
	mov.w r2, #1610612736 
	strh	r3, [r7, #18]
lab269: 	ldrb	r3, [r7, #7]
	lsrs	r3, r3, #4
	uxtb	r3, r3
	strh	r3, [r7, #20]
	ldrb	r3, [r7, #7]
	and	r3, r3, #15
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab270
	ldrh	r3, [r7, #20]
	cmp	r3, #0
	beq	lab271
	ldrb	r2, [r7, #22]
	ldrh	r3, [r7, #20]
	add	r3, r2
	cmp	r3, #63	
	ble	lab272
	movs	r3, #28
	b	lab240
lab273: 	adds	r2, r3, #1
	strb	r2, [r7, #22]
	mov	r2, r3
	ldr	r3, =ZAG	
	ldrsb	r3, [r3, r2]
	mov	r2, r3
	ldr	r3, =gCoeffBuf	
	movs	r1, #0
	strh	r1, [r3, r2, lsl #1]
	ldrh	r3, [r7, #20]
	subs	r3, #1
	strh	r3, [r7, #20]
lab272: 	ldrh	r3, [r7, #20]
	cmp	r3, #0
	bne	lab273
lab271: 	ldrb	r2, [r7, #7]
	ldrh	r3, [r7, #18]
	mov	r1, r2
	mov	r0, r3
push {r1, r2}
	mov.w r1, #6988
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6988
	mov.w r2, #1610612736 
	strh	r3, [r7, #0]
	ldrb	r3, [r7, #22]
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	uxth	r2, r3
	ldrh	r3, [r7, #0]
	smulbb	r3, r2, r3
	uxth	r1, r3
	ldrb	r3, [r7, #22]
	ldr	r2, =ZAG	
	ldrsb	r3, [r2, r3]
	mov	r2, r3
	sxth	r1, r1
	ldr	r3, =gCoeffBuf	
	strh	r1, [r3, r2, lsl #1]
	b	lab274
lab270: 	ldrh	r3, [r7, #20]
	cmp	r3, #15
	bne	lab275
	ldrb	r3, [r7, #22]
	cmp	r3, #48	
	bls	lab276
	movs	r3, #28
	b	lab240
lab276: 	movs	r3, #16
	strh	r3, [r7, #20]
	b	lab277
	.ltorg
lab278: 	adds	r2, r3, #1
	strb	r2, [r7, #22]
	mov	r2, r3
	ldr	r3, =ZAG	
	ldrsb	r3, [r3, r2]
	mov	r2, r3
	ldr	r3, =gCoeffBuf	
	movs	r1, #0
	strh	r1, [r3, r2, lsl #1]
	ldrh	r3, [r7, #20]
	subs	r3, #1
	strh	r3, [r7, #20]
lab277: 	ldrh	r3, [r7, #20]
	cmp	r3, #0
	bne	lab278
	ldrb	r3, [r7, #22]
	subs	r3, #1
	strb	r3, [r7, #22]
lab274: 	ldrb	r3, [r7, #22]
	adds	r3, #1
	strb	r3, [r7, #22]
lab264: 	ldrb	r3, [r7, #22]
	cmp	r3, #63	
	bls	lab279
	b	lab280
lab275: 	nop
	b	lab280
lab281: 	adds	r2, r3, #1
	strb	r2, [r7, #22]
	mov	r2, r3
	ldr	r3, =ZAG	
	ldrsb	r3, [r3, r2]
	mov	r2, r3
	ldr	r3, =gCoeffBuf	
	movs	r1, #0
	strh	r1, [r3, r2, lsl #1]
lab280: 	ldrb	r3, [r7, #22]
	cmp	r3, #63	
	bls	lab281
	ldrb	r3, [r7, #23]
	mov	r0, r3
	bl	transformBlock
lab263:	push {r1, r2}
	mov.w r1, #4792
	mov.w r2, #1610612736 
	adds	r3, #1
	strb	r3, [r7, #23]
lab241: 	ldr	r3, =gMaxBlocksPerMCU	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	cmp	r2, r3
	bcc	lab282
	movs	r3, #0
lab240: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #293
	mov.w r2, #1610612736 
	.ltorg
pjpeg_decode_mcu:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab283
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	b	lab284
lab283: 	ldr	r3, =gNumMCUSRemaining	
	ldrh	r3, [r3, #0]
	cmp	r3, #0
	bne	lab285
	movs	r3, #1
	b	lab284
lab285: 	bl	decodeNextMCU
	push {r1, r2}
	mov.w r1, #3406
	mov.w r2, #1610612736 
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	bne	lab286
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab287
lab286: 	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab288
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	b	lab284
lab288: 	ldrb	r3, [r7, #7]
	b	lab284
lab287: 	ldr	r3, =gNumMCUSRemaining	
	ldrh	r3, [r3, #0]
	subs	r3, #1
	uxth	r2, r3
	ldr	r3, =gNumMCUSRemaining	
	strh	r2, [r3, #0]
	movs	r3, #0
lab284: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2631
	mov.w r2, #1610612736 
	nop
	.ltorg
pjpeg_decode_init:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strb	r3, [r7, #3]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #20]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #36]	
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #40]	
	ldr	r2, =g_pNeedBytesCallback	
	ldr	r3, [r7, #8]
	str	r3, [r2, #0]
	ldr	r2, =g_pCallback_data	
	ldr	r3, [r7, #4]
	str	r3, [r2, #0]
	ldr	r3, =gCallbackStatus	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r2, =gReduce	
	ldrb	r3, [r7, #3]
	strb	r3, [r2, #0]
	bl	init
	push {r1, r2}
	mov.w r1, #288
	mov.w r2, #1610612736 
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #23]
	cmp	r3, #0
	bne	lab289
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab290
lab289: 	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab291
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	b	lab292
lab291: 	ldrb	r3, [r7, #23]
	b	lab292
lab290: 	bl	locateSOFMarker
	push {r1, r2}
	mov.w r1, #7211
	mov.w r2, #1610612736 
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #23]
	cmp	r3, #0
	bne	lab293
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab294
lab293: 	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab295
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	b	lab292
lab295: 	ldrb	r3, [r7, #23]
	b	lab292
lab294: 	bl	initFrame
	mov	r3, r0
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #23]
	cmp	r3, #0
	bne	lab296
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab297
lab296: 	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab298
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	b	lab292
lab298: 	ldrb	r3, [r7, #23]
	b	lab292
lab297: 	bl	initScan
	push {r1, r2}
	mov.w r1, #6328
	mov.w r2, #1610612736 
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #23]
	cmp	r3, #0
	bne	lab299
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab300
lab299: 	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab301
	ldr	r3, =gCallbackStatus	
	ldrb	r3, [r3, #0]
	b	lab292
lab301: 	ldrb	r3, [r7, #23]
	b	lab292
lab300: 	ldr	r3, =gImageXSize	
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #0]
	ldr	r3, =gImageYSize	
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #4]
	ldr	r3, =gCompsInFrame	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #8]
	ldr	r3, =gScanType	
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #12]
	strb	r2, [r3, #20]
	ldr	r3, =gMaxMCUSPerRow	
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #12]
	ldr	r3, =gMaxMCUSPerCol	
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #16]
	ldr	r3, =gMaxMCUXSize	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #24]
	ldr	r3, =gMaxMCUYSize	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r2, =gMCUBufR	
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r2, =gMCUBufG	
	str	r2, [r3, #36]	
	ldr	r3, [r7, #12]
	ldr	r2, =gMCUBufB	
	str	r2, [r3, #40]	
	movs	r3, #0
lab292: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #908
	mov.w r2, #1610612736 
	nop
	.ltorg
pjpeg_need_bytes_callback:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	mov	r3, r1
	strb	r3, [r7, #11]
	ldrb	r2, [r7, #11]
	ldr	r3, =jpeg_off	
	ldr	r3, [r3, #0]
	rsb	r3, r3, #568	
	adds	r3, #2
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, =jpeg_off	
	ldr	r3, [r3, #0]
	ldr	r2, =jpeg_data	
	add	r3, r2
	ldr	r2, [r7, #20]
	mov	r1, r3
	ldr	r0, [r7, #12]
	bl	memcpy
	ldr	r3, [r7, #20]
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #0]
	ldr	r3, =jpeg_off	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	add	r3, r2
	ldr	r2, =jpeg_off	
	str	r3, [r2, #0]
	movs	r3, #0
	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
	.ltorg
verify_benchmark:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, =pInfo	
	ldr	r3, [r3, #32]
	movs	r2, #64	
	ldr	r1, =r_ref.2	
	mov	r0, r3
push {r1, r2}
	mov.w r1, #1486
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1486
	mov.w r2, #1610612736 
	cmp	r3, #0
	bne	lab302
	ldr	r3, =pInfo	
	ldr	r3, [r3, #36]	
	movs	r2, #64	
	ldr	r1, =g_ref.1	
	mov	r0, r3
push {r1, r2}
	mov.w r1, #6042
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6042
	mov.w r2, #1610612736 
	cmp	r3, #0
	bne	lab302
	ldr	r3, =pInfo	
	ldr	r3, [r3, #40]	
	movs	r2, #64	
	ldr	r1, =b_ref.0	
	mov	r0, r3
push {r1, r2}
	mov.w r1, #2746
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2746
	mov.w r2, #1610612736 
	cmp	r3, #0
	bne	lab302
	movs	r3, #1
	b	lab303
lab302: 	movs	r3, #0
lab303: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6416
	mov.w r2, #1610612736 
	nop
	.ltorg
initialise_benchmark:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
warm_caches:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
push {r1, r2}
	mov.w r1, #421
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #421
	mov.w r2, #1610612736 
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #610
	mov.w r2, #1610612736 
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #6
push {r1, r2}
	mov.w r1, #1317
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1317
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #5315
	mov.w r2, #1610612736 
benchmark_body:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab304
lab307: 	movs	r2, #0
	str	r2, [r3, #0]
	movs	r3, #0
	movs	r2, #0
	ldr	r1, =0x0000b471	
	ldr	r0, =pInfo	
	bl	pjpeg_decode_init
	push {r1, r2}
	mov.w r1, #8082
	mov.w r2, #1610612736 
	strb	r3, [r7, #11]
lab306: 	push {r1, r2}
	mov.w r1, #921
	mov.w r2, #1610612736 
	strb	r3, [r7, #11]
	ldrb	r3, [r7, #11]
	cmp	r3, #1
	beq	lab305
	b	lab306
lab305: 	nop
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab304: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab307
	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4632
	mov.w r2, #1610612736 
	nop
	.ltorg
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
	mov.w r1, #6881
	mov.w r2, #1610612736 
	bl	benchmark
	push {r1, r2}
	mov.w r1, #2022
	mov.w r2, #1610612736 
	str	r3, [r7, #8]
	bl	stop_trigger
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	verify_benchmark
	push {r1, r2}
	mov.w r1, #2623
	mov.w r2, #1610612736 
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
	mov.w r1, #6024
	mov.w r2, #1610612736 
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x0001be28	
	ldr	r5, =0x0001be28	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab308
	movs	r4, #0
lab309: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #5324
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #5324
	mov.w r2, #1610612736 
lab308: 	ldr	r6, =0x0001be30	
	ldr	r5, =0x0001be28	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab310
	movs	r4, #0
lab311: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #3815
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #3815
	mov.w r2, #1610612736 
lab310:	cpsid f
	push {r1, r2}
	mov.w r1, #2778
	mov.w r2, #1610612736 
	.ltorg
memcmp:
	cmp	r2, #3
	push	{r4, lr}
	bls	lab312
	orr	ip, r0, r1
	tst	ip, #3
	mov	r4, r0
	mov	r3, r1
	bne	lab313
lab314: 	mov	r0, r4
	ldr	lr, [r1]
	ldr	ip, [r0]
	cmp	ip, lr
	add	r4, r4, #4
	add	r3, r3, #4
	bne	lab313
	subs	r2, #4
	cmp	r2, #3
	mov	r0, r4
	mov	r1, r3
	bhi	lab314
lab312: 	subs	r4, r2, #1
	cbz	r2, lab315
lab319: 	subs	r1, #1
	b	lab316
lab318: 	beq	lab317
lab316: 	ldrb	lr, [ip, #1]!
	ldrb	r2, [r1, #1]!
	cmp	lr, r2
	sub	r3, r4, ip
	beq	lab318
	sub	r0, lr, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #2311
	mov.w r2, #1610612736 
lab313: 	subs	r4, r2, #1
	b	lab319
lab317: 	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #2199
	mov.w r2, #1610612736 
lab315: 	mov	r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #851
	mov.w r2, #1610612736 
memcpy:
	mov	ip, r0
	orr	r3, r1, r0
	ands	r3, r3, #3
	bne	lab320
lab329: 	bcc	lab321
lab322: 	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #64	
	bcs	lab322
lab321: 	adds	r2, #48	
	bcc	lab323
lab324: 	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #16
	bcs	lab324
lab323: 	adds	r2, #12
	bcc	lab325
lab326: 	str	r3, [r0], #4
	subs	r2, #4
	bcs	lab326
lab325: 	adds	r2, #4
	beq	lab327
	lsls	r2, r2, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab327
	ldrh	r3, [r1, #0]
	strh	r3, [r0, #0]
lab327: 	mov	r0, ip
	bx	lr
	nop
lab320: 	cmp	r2, #8
	bcc	lab328
	lsls	r3, r1, #30
	beq	lab329
	ands	r3, r0, #3
	beq	lab329
	rsb	r3, r3, #4
	subs	r2, r2, r3
	lsls	r3, r3, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab329
	ldrh	r3, [r1], #2
	strh	r3, [r0], #2
	b	lab329
lab328: 	subs	r2, #4
	bcc	lab325
lab330: 	ldrb	r3, [r1], #1
	strb	r3, [r0], #1
	bcs	lab330
	ldrb	r3, [r1, #0]
	strb	r3, [r0, #0]
	ldrb	r3, [r1, #1]
	strb	r3, [r0, #1]
	ldrb	r3, [r1, #2]
	strb	r3, [r0, #2]
	mov	r0, ip
	bx	lr
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab331
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab332
	uxtb	r2, r1
	mov	r3, r0
	b	lab333
lab334: 	bcc	lab332
lab333: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab334
lab342: 	bls	lab335
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab336
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab337: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab337
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab338
lab343: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab339: 	cmp	r3, r2
	bne	lab339
	and	r4, ip, #3
lab335: 	cbz	r4, lab332
lab341: 	add	r4, r3
lab340: 	cmp	r4, r3
	bne	lab340
lab332:	cpsid f
	push {r1, r2}
	mov.w r1, #3190
	mov.w r2, #1610612736 
lab338: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab341
	b	lab332
lab331: 	mov	r3, r0
	mov	r4, r2
	b	lab342
lab336: 	mov	r2, r3
	mov	ip, r4
	b	lab343
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
	cbz	r6, lab344
	mov	r9, #1
	mov	sl, #0
lab350: 	subs	r5, r4, #1
	bmi	lab344
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab346: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab345
lab347: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab346
lab344: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab345: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab347
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab348
	blx	r2
lab353: 	cmp	r2, fp
	bne	lab349
lab352: 	cmp	r3, r6
	beq	lab347
	mov	r6, r3
	cmp	r6, #0
	bne	lab350
	b	lab344
lab348: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab351
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab352
lab349: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab350
	b	lab344
lab351: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab353
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =0x0001be34	
	ldr	r5, =0x0001be30	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab354
	subs	r3, #4
	add	r5, r3
lab355: 	ldr	r3, [r5], #-4
	
	push {r1, r2}
	mov.w r1, #6130
	mov.w r2, #1610612736 
	cmp	r4, #0
	push {r1, r2}
	mov.w r1, #6130
	mov.w r2, #1610612736 
lab354: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab356
lab360: 	cmp	r5, #31
	bgt	lab357
	cbnz	r6, lab358
lab359: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab361:	cpsid f
	push {r1, r2}
	mov.w r1, #7062
	mov.w r2, #1610612736 
lab358: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab359
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab359
lab356: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab360
lab357: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab361
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

ZAG:
	.word	0x10080100
	.word	0x0a030209
	.word	0x19201811
	.word	0x05040b12
	.word	0x211a130c
	.word	0x22293028
	.word	0x060d141b
	.word	0x1c150e07
	.word	0x38312a23
	.word	0x242b3239
	.word	0x170f161d
	.word	0x332c251e
	.word	0x2d343b3a
	.word	0x2e271f26
	.word	0x363d3c35
	.word	0x3f3e372f
gWinogradQuant:
	.word	0xa7b2b280
	.word	0xe897a7f6
	.word	0xd18097e8
	.word	0x6580d1db
	.word	0xb2c5c5b2
	.word	0xa78b4565
	.word	0x458ba7b1
	.word	0x97836023
	.word	0x23608397
	.word	0x80765b31
	.word	0x2e315b76
	.word	0x51656551
	.word	0x4f452a2e
	.word	0x36232a45
	.word	0x251c2336
	.word	0x0a13131c
jpeg_data:
	.word	0xe0ffd8ff
	.word	0x464a1000
	.word	0x01004649
	.word	0x48000101
	.word	0x00004800
	.word	0x4300dbff
	.word	0x3c375000
	.word	0x50323c46
	.word	0x5a464146
	.word	0x785f5055
	.word	0x6e7882c8
	.word	0xaff5786e
	.word	0xffc891b9
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0x00dbffff
	.word	0x5a550143
	.word	0x7869785a
	.word	0xeb8282eb
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xc0ffffff
	.word	0x00081100
	.word	0x03330040
	.word	0x02001101
	.word	0x11030111
	.word	0x00c4ff01
	.word	0x03000018
	.word	0x00000101
	.word	0x02010000
	.word	0xff040003
	.word	0x102600c4
	.word	0x01020200
	.word	0x03040303
	.word	0x00000001
	.word	0x00000000
	.word	0x11000201
	.word	0x31211203
	.word	0x04716141
	.word	0x13915322
	.word	0xff625123
	.word	0x011500c4
	.word	0x00000101
	.word	0xc4ff0100
	.word	0x01111400
	.word	0x0c00daff
	.word	0x02000103
	.word	0x00110311
	.word	0x88c7003f
	.word	0x664d280b
	.word	0x58cf02e1
	.word	0x00884505
	.word	0x0e3410a9
	.word	0x54686faf
	.word	0x61036433
	.word	0xdb496a02
	.word	0x50598449
	.word	0x3da05091
	.word	0x887c80a4
	.word	0x0548d518
	.word	0xffeb4309
	.word	0x02f52b00
	.word	0xac1cd478
	.word	0xb58e1048
	.word	0xa50ca855
	.word	0x2a52db2f
	.word	0x82f65319
	.word	0x450ea104
	.word	0xad0d84f8
	.word	0xd020217e
	.word	0x5c930430
	.word	0xc6e24399
	.word	0xd7d42057
	.word	0xe13a207d
	.word	0xf149f640
	.word	0x178ba320
	.word	0x264709c5
	.word	0x1eb50535
	.word	0x95027520
	.word	0xcf81fac0
	.word	0x0d6c0c52
	.word	0xddbd25a0
	.word	0x282af3d1
	.word	0x0e04b043
	.word	0xb229dc3a
	.word	0x116af813
	.word	0xa9225325
	.word	0xa82ee07d
	.word	0xa0dac106
	.word	0x304d2129
	.word	0xb9282a35
	.word	0x15068517
	.word	0xd88c9750
	.word	0x01e520ef
	.word	0xa152d3f9
	.word	0x14b00eb5
	.word	0x28323990
	.word	0x17d960e2
	.word	0xb1d9a2cc
	.word	0x1e583502
	.word	0x95580c60
	.word	0xf820a606
	.word	0x41673b90
	.word	0x4f02b3b0
	.word	0x8e40559c
	.word	0x5109feb5
	.word	0xfd01d712
	.word	0x7b99113b
	.word	0x4b7d5598
	.word	0xec0064bb
	.word	0x450504bd
	.word	0x3bb23662
	.word	0x1c2a1b42
	.word	0x11b87440
	.word	0x1fb80006
	.word	0x0000d9ff
r_ref.2:
	.word	0x21212121
	.word	0x21212121
	.word	0x20202020
	.word	0x20202020
	.word	0x1d1d1d1d
	.word	0x1d1d1d1d
	.word	0x19191919
	.word	0x19191919
	.word	0x15151515
	.word	0x15151515
	.word	0x11111111
	.word	0x11111111
	.word	0x0e0e0e0e
	.word	0x0e0e0e0e
	.word	0x0d0d0d0d
	.word	0x0d0d0d0d
g_ref.1:
	.word	0x35353535
	.word	0x35353535
	.word	0x34343434
	.word	0x34343434
	.word	0x31313131
	.word	0x31313131
	.word	0x2d2d2d2d
	.word	0x2d2d2d2d
	.word	0x29292929
	.word	0x29292929
	.word	0x25252525
	.word	0x25252525
	.word	0x22222222
	.word	0x22222222
	.word	0x21212121
	.word	0x21212121
b_ref.0:
	.word	0x43434343
	.word	0x43434343
	.word	0x42424242
	.word	0x42424242
	.word	0x3f3f3f3f
	.word	0x3f3f3f3f
	.word	0x3b3b3b3b
	.word	0x3b3b3b3b
	.word	0x37373737
	.word	0x37373737
	.word	0x33333333
	.word	0x33333333
	.word	0x30303030
	.word	0x30303030
	.word	0x2f2f2f2f
	.word	0x2f2f2f2f
_global_impure_ptr:
	.word	0x0001be38


	.data

impure_data:
	.word	0x00000000
	.word	0x0001c124
	.word	0x0001c18c
	.word	0x0001c1f4
	.word	0x00000001
	.word	0x00000000
	.word	0xabcd330e
	.word	0xe66d1234
	.word	0x0005deec
	.word	0x0000000b
__atexit_recursive_mutex:
	.word	0x0001cbf0


	.bss

__bss_start:
	.word	0x00000000
object.0:
gCoeffBuf:
gMCUBufR:
gMCUBufG:
gMCUBufB:
gQuant0:
gQuant1:
gLastDC:
gHuffTab0:
gHuffVal0:
gHuffTab1:
gHuffVal1:
gHuffTab2:
gHuffVal2:
gHuffTab3:
gHuffVal3:
gValidHuffTables:
gValidQuantTables:
gTemFlag:
gInBuf:
gInBufOfs:
gInBufLeft:
gBitBuf:
gBitsLeft:
gImageXSize:
gImageYSize:
gCompsInFrame:
gCompIdent:
	.word	0x00000000
gCompHSamp:
	.word	0x00000000
gCompVSamp:
	.word	0x00000000
gCompQuant:
	.word	0x00000000
gRestartInterval:
gNextRestartNum:
gRestartsLeft:
gCompsInScan:
gCompList:
	.word	0x00000000
gCompDCTab:
	.word	0x00000000
gCompACTab:
	.word	0x00000000
gScanType:
gMaxBlocksPerMCU:
gMaxMCUXSize:
gMaxMCUYSize:
gMaxMCUSPerRow:
gMaxMCUSPerCol:
gNumMCUSRemaining:
	.word	0x00000000
gMCUOrg:
g_pNeedBytesCallback:
	.word	0x00000000
g_pCallback_data:
	.word	0x00000000
gCallbackStatus:
gReduce:
spectral_start:
spectral_end:
successive_high:
successive_low:
jpeg_off:
	.word	0x00000000
pInfo:
__lock___atexit_recursive_mutex:
	.word	0x00000000
