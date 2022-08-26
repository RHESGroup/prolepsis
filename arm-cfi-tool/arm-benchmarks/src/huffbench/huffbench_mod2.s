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
	mov.w r1, #7707
	mov.w r2, #1610612736 
	cbz	r3, lab1
	ldr	r0, =0x0000a821	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	mov.w r1, #358
	mov.w r2, #1610612736 
	ldr	r4, =__bss_start	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x0000c904	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	mov.w r1, #474
	mov.w r2, #1610612736 
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x0000c904	
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
	ldr	r2, =0x0001f538	
	subs	r2, r2, r0
push {r1, r2}
	mov.w r1, #6901
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6901
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
	ldr	r0, =0x0000a569	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x0000a821	
push {r1, r2}
	mov.w r1, #7319
	mov.w r2, #1610612736 
lab7:	push {r1, r2}
	mov.w r1, #7319
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6598
	mov.w r2, #1610612736 
	movs	r1, r5
	bl	main
	push {r1, r2}
	mov.w r1, #2986
	mov.w r2, #1610612736 
	nop
	.ltorg
heap_adjust:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #8]
	subs	r3, #4
	str	r3, [r7, #8]
	ldr	r3, [r7, #0]
	lsls	r3, r3, #2
	ldr	r2, [r7, #8]
	add	r3, r2
	ldr	r3, [r3, #0]
	str	r3, [r7, #16]
	b	lab8
lab11: 	lsls	r3, r3, #1
	str	r3, [r7, #20]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bge	lab9
	ldr	r3, [r7, #20]
	lsls	r3, r3, #2
	ldr	r2, [r7, #8]
	add	r3, r2
	ldr	r3, [r3, #0]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	add	r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	lsls	r3, r3, #2
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	lsls	r3, r3, #2
	ldr	r1, [r7, #12]
	add	r3, r1
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bls	lab9
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab9: 	ldr	r3, [r7, #16]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	add	r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #2
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	lsls	r3, r3, #2
	ldr	r1, [r7, #12]
	add	r3, r1
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bcc	lab10
	ldr	r3, [r7, #20]
	lsls	r3, r3, #2
	ldr	r2, [r7, #8]
	add	r2, r3
	ldr	r3, [r7, #0]
	lsls	r3, r3, #2
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [r7, #20]
	str	r3, [r7, #0]
lab8: 	ldr	r3, [r7, #4]
	lsrs	r2, r3, #31
	add	r3, r2
	asrs	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #0]
	cmp	r3, r2
	ble	lab11
	b	lab12
lab10: 	nop
lab12: 	ldr	r3, [r7, #0]
	lsls	r3, r3, #2
	ldr	r2, [r7, #8]
	add	r3, r2
	ldr	r2, [r7, #16]
	str	r2, [r3, #0]
	nop
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
compdecomp:
	push	{r7, lr}
	sub	sp, sp, #7744	
	sub	sp, #24
	add	r7, sp, #0
	addw	r3, r7, #3672	
	subw	r3, r3, #3668	
	str	r0, [r3, #0]
	addw	r3, r7, #3672	
	subw	r3, r3, #3672	
	str	r1, [r3, #0]
	addw	r3, r7, #3672	
	subw	r3, r3, #3668	
	ldr	r3, [r3, #0]
	add	r2, r7, #7712	
	add	r2, r2, #28
	str	r3, [r2, #0]
	addw	r3, r7, #3672	
	subw	r3, r3, #3672	
	ldr	r3, [r3, #0]
	adds	r3, #1
	mov	r0, r3
	bl	malloc_beebs
	add	r3, r7, #7680	
	add	r3, r3, #20
	str	r0, [r3, #0]
	addw	r3, r7, #3672	
	subw	r3, r3, #3672	
	ldr	r3, [r3, #0]
	adds	r3, #1
	mov	r2, r3
	movs	r1, #0
	add	r3, r7, #7680	
	add	r3, r3, #20
	ldr	r0, [r3, #0]
push {r1, r2}
	mov.w r1, #7544
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7544
	mov.w r2, #1610612736 
	add	r3, r3, #8
	mov	r2, #2048	
	movs	r1, #0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #203
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #203
	mov.w r2, #1610612736 
	add	r3, r3, #8
	mov	r2, #1024	
	movs	r1, #0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #3632
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3632
	mov.w r2, #1610612736 
	subs	r3, #16
	mov	r2, #2048	
	movs	r1, #0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #3234
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3234
	mov.w r2, #1610612736 
	subs	r3, #16
	mov	r2, #1024	
	movs	r1, #0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #3856
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3856
	mov.w r2, #1610612736 
	subs	r3, #16
	mov	r2, #256	
	movs	r1, #0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #112
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #112
	mov.w r2, #1610612736 
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
	b	lab13
lab14: 	add	r3, r3, #28
	ldr	r3, [r3, #0]
	ldrb	r3, [r3, #0]
	add	r2, r7, #7744	
	add	r2, r2, #24
	sub	r2, r2, #2128	
	ldr	r2, [r2, r3, lsl #2]
	adds	r1, r2, #1
	add	r2, r7, #7744	
	add	r2, r2, #24
	sub	r2, r2, #2128	
	str	r1, [r2, r3, lsl #2]
	add	r3, r7, #7712	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7712	
	add	r2, r2, #28
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
lab13: 	addw	r3, r7, #3672	
	subw	r3, r3, #3672	
	add	r2, r7, #7744	
	add	r2, r2, #20
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bcc	lab14
	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #12
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
	b	lab15
lab17: 	add	r3, r3, #24
	sub	r3, r3, #2128	
	add	r2, r7, #7744	
	add	r2, r2, #20
	ldr	r2, [r2, #0]
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	beq	lab16
	add	r3, r7, #7744	
	add	r3, r3, #24
	sub	r3, r3, #3152	
	add	r2, r7, #7744	
	add	r2, r2, #12
	ldr	r2, [r2, #0]
	add	r1, r7, #7744	
	add	r1, r1, #20
	ldr	r1, [r1, #0]
	str	r1, [r3, r2, lsl #2]
	add	r3, r7, #7744	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #12
	str	r3, [r2, #0]
lab16: 	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
lab15: 	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	cmp	r3, #255	
	bls	lab17
	add	r3, r7, #7744	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
	b	lab18
lab19: 	add	r3, r3, #12
	ldr	r2, [r3, #0]
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	add	r1, r7, #4608	
	add	r1, r1, #8
	add	r0, r7, #5632	
	add	r0, r0, #8
	bl	heap_adjust
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	subs	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
lab18: 	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	lab19
	b	lab20
lab21: 	add	r3, r3, #12
	ldr	r3, [r3, #0]
	subs	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #12
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #24
	sub	r3, r3, #3152	
	ldr	r3, [r3, #0]
	add	r2, r7, #7680	
	add	r2, r2, #8
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #24
	sub	r3, r3, #3152	
	add	r2, r7, #7744	
	add	r2, r2, #12
	ldr	r2, [r2, #0]
	ldr	r2, [r3, r2, lsl #2]
	add	r3, r7, #7744	
	add	r3, r3, #24
	sub	r3, r3, #3152	
	str	r2, [r3, #0]
	add	r3, r7, #7744	
	add	r3, r3, #12
	ldr	r2, [r3, #0]
	add	r1, r7, #4608	
	add	r1, r1, #8
	add	r0, r7, #5632	
	add	r0, r0, #8
	movs	r3, #1
	bl	heap_adjust
	add	r3, r7, #7744	
	add	r3, r3, #24
	sub	r3, r3, #3152	
	ldr	r2, [r3, #0]
	add	r3, r7, #7744	
	add	r3, r3, #24
	sub	r3, r3, #2128	
	ldr	r1, [r3, r2, lsl #2]
	add	r3, r7, #7744	
	add	r3, r3, #24
	sub	r3, r3, #2128	
	add	r2, r7, #7680	
	add	r2, r2, #8
	ldr	r2, [r2, #0]
	ldr	r3, [r3, r2, lsl #2]
	add	r2, r7, #7744	
	add	r2, r2, #12
	ldr	r2, [r2, #0]
	add	r2, r2, #256	
	add	r1, r3
	add	r3, r7, #7744	
	add	r3, r3, #24
	sub	r3, r3, #2128	
	str	r1, [r3, r2, lsl #2]
	add	r3, r7, #7744	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r3, r3, #256	
	mov	r1, r3
	addw	r3, r7, #3672	
	sub	r3, r3, #1104	
	add	r2, r7, #7680	
	add	r2, r2, #8
	ldr	r2, [r2, #0]
	str	r1, [r3, r2, lsl #2]
	add	r3, r7, #7744	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	rsb	r3, r3, #4278255360	
	add	r3, r3, #16711680	
	add	r2, r7, #7744	
	add	r2, r2, #24
	sub	r2, r2, #3152	
	ldr	r2, [r2, #0]
	mov	r1, r3
	addw	r3, r7, #3672	
	sub	r3, r3, #1104	
	str	r1, [r3, r2, lsl #2]
	add	r3, r7, #7744	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r2, r3, #256	
	add	r3, r7, #7744	
	add	r3, r3, #24
	sub	r3, r3, #3152	
	str	r2, [r3, #0]
	add	r3, r7, #7744	
	add	r3, r3, #12
	ldr	r2, [r3, #0]
	add	r1, r7, #4608	
	add	r1, r1, #8
	add	r0, r7, #5632	
	add	r0, r0, #8
	movs	r3, #1
	bl	heap_adjust
lab20: 	add	r3, r7, #7744	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bhi	lab21
	add	r3, r7, #7744	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r2, r3, #256	
	addw	r3, r7, #3672	
	sub	r3, r3, #1104	
	movs	r1, #0
	str	r1, [r3, r2, lsl #2]
	movs	r3, #0
	add	r2, r7, #7712	
	add	r2, r2, #16
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #7712	
	add	r2, r2, #12
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #7712	
	add	r2, r2, #24
	str	r3, [r2, #0]
	b	lab22
lab29: 	add	r3, r3, #24
	sub	r3, r3, #2128	
	add	r2, r7, #7712	
	add	r2, r2, #24
	ldr	r2, [r2, #0]
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	bne	lab23
	addw	r3, r7, #3672	
	sub	r3, r3, #2128	
	add	r2, r7, #7712	
	add	r2, r2, #24
	ldr	r2, [r2, #0]
	movs	r1, #0
	str	r1, [r3, r2, lsl #2]
	addw	r3, r7, #3672	
	sub	r2, r3, #2384	
	add	r3, r7, #7712	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r3, r2
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab24
lab23: 	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
	movs	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #16
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #7712	
	add	r2, r2, #20
	str	r3, [r2, #0]
	addw	r3, r7, #3672	
	sub	r3, r3, #1104	
	add	r2, r7, #7712	
	add	r2, r2, #24
	ldr	r2, [r2, #0]
	ldr	r3, [r3, r2, lsl #2]
	add	r2, r7, #7712	
	add	r2, r2, #8
	str	r3, [r2, #0]
	b	lab25
lab27: 	add	r3, r3, #8
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bge	lab26
	add	r3, r7, #7712	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #7712	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #7712	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	negs	r3, r3
	add	r2, r7, #7712	
	add	r2, r2, #8
	str	r3, [r2, #0]
lab26: 	addw	r3, r7, #3672	
	sub	r3, r3, #1104	
	add	r2, r7, #7712	
	add	r2, r2, #8
	ldr	r2, [r2, #0]
	ldr	r3, [r3, r2, lsl #2]
	add	r2, r7, #7712	
	add	r2, r2, #8
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	lsls	r3, r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #16
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
lab25: 	add	r3, r7, #7712	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	lab27
	addw	r3, r7, #3672	
	sub	r3, r3, #2128	
	add	r2, r7, #7712	
	add	r2, r2, #24
	ldr	r2, [r2, #0]
	add	r1, r7, #7712	
	add	r1, r1, #20
	ldr	r1, [r1, #0]
	str	r1, [r3, r2, lsl #2]
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	uxtb	r1, r3
	addw	r3, r7, #3672	
	sub	r2, r3, #2384	
	add	r3, r7, #7712	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r3, r2
	mov	r2, r1
	strb	r2, [r3, #0]
	add	r3, r7, #7712	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #7712	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bls	lab28
	add	r3, r7, #7712	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	add	r2, r7, #7712	
	add	r2, r2, #16
	str	r3, [r2, #0]
lab28: 	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #7712	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bls	lab24
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	add	r2, r7, #7712	
	add	r2, r2, #12
	str	r3, [r2, #0]
lab24: 	add	r3, r7, #7712	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7712	
	add	r2, r2, #24
	str	r3, [r2, #0]
lab22: 	add	r3, r7, #7712	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	cmp	r3, #255	
	bls	lab29
	add	r3, r7, #7712	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	cmp	r3, #32
	bhi	lab30
	movs	r3, #0
	add	r2, r7, #7712	
	add	r2, r2, #4
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #7712	
	add	r2, r2, #3
	strb	r3, [r2, #0]
	mov	r3, #4294967295	
	add	r2, r7, #7680	
	add	r2, r2, #28
	str	r3, [r2, #0]
	addw	r3, r7, #3672	
	subw	r3, r3, #3668	
	ldr	r3, [r3, #0]
	add	r2, r7, #7712	
	add	r2, r2, #28
	str	r3, [r2, #0]
	add	r3, r7, #7712	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	lab31
	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #16
	str	r3, [r2, #0]
	b	lab32
lab39: 	add	r3, r3, #28
	ldr	r3, [r3, #0]
	ldrb	r3, [r3, #0]
	mov	r2, r3
	addw	r3, r7, #3672	
	sub	r3, r3, #2384	
	ldrb	r3, [r3, r2]
	subs	r3, #1
	movs	r2, #1
	lsl	r3, r2, r3
	add	r2, r7, #7744	
	add	r2, r2, #8
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
	b	lab33
lab38: 	add	r3, r3, #28
	ldr	r3, [r3, #0]
	cmp	r3, #7
	bne	lab34
	add	r3, r7, #7680	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #7712	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #7712	
	add	r2, r2, #3
	ldrb	r2, [r2, #0]
	strb	r2, [r3, #0]
	add	r3, r7, #7712	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7712	
	add	r2, r2, #4
	str	r3, [r2, #0]
	addw	r3, r7, #3672	
	subw	r3, r3, #3672	
	add	r2, r7, #7712	
	add	r2, r2, #4
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab35
	movs	r3, #0
	add	r2, r7, #7680	
	add	r2, r2, #28
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #7712	
	add	r2, r2, #3
	strb	r3, [r2, #0]
	b	lab36
lab34: 	add	r3, r7, #7680	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7680	
	add	r2, r2, #28
	str	r3, [r2, #0]
	add	r3, r7, #7712	
	add	r3, r3, #3
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #1
	add	r2, r7, #7712	
	add	r2, r2, #3
	strb	r3, [r2, #0]
lab36: 	add	r3, r7, #7712	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	ldrb	r3, [r3, #0]
	mov	r2, r3
	addw	r3, r7, #3672	
	sub	r3, r3, #2128	
	ldr	r2, [r3, r2, lsl #2]
	add	r3, r7, #7744	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	ands	r3, r2
	cmp	r3, #0
	beq	lab37
	add	r3, r7, #7712	
	add	r3, r3, #3
	ldrb	r3, [r3, #0]
	orr	r3, r3, #1
	add	r2, r7, #7712	
	add	r2, r2, #3
	strb	r3, [r2, #0]
lab37: 	add	r3, r7, #7744	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	lsrs	r3, r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #8
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
lab33: 	add	r3, r7, #7712	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	ldrb	r3, [r3, #0]
	mov	r2, r3
	addw	r3, r7, #3672	
	sub	r3, r3, #2384	
	ldrb	r3, [r3, r2]
	mov	r2, r3
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	cmp	r3, r2
	bcc	lab38
	add	r3, r7, #7712	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7712	
	add	r2, r2, #28
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #16
	str	r3, [r2, #0]
lab32: 	addw	r3, r7, #3672	
	subw	r3, r3, #3672	
	add	r2, r7, #7744	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bcc	lab39
	add	r3, r7, #7712	
	add	r3, r3, #3
	ldrb	r2, [r3, #0]
	add	r3, r7, #7680	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	rsb	r3, r3, #7
	lsl	r3, r2, r3
	add	r2, r7, #7712	
	add	r2, r2, #3
	strb	r3, [r2, #0]
	add	r3, r7, #7680	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #7712	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #7712	
	add	r2, r2, #3
	ldrb	r2, [r2, #0]
	strb	r2, [r3, #0]
	add	r3, r7, #7712	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7712	
	add	r2, r2, #4
	str	r3, [r2, #0]
	add	r3, r7, #280	
	subs	r3, #16
	mov	r2, #1024	
	movs	r1, #0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #1375
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1375
	mov.w r2, #1610612736 
	subs	r3, #16
	add	r2, r7, #7680	
	add	r2, r2, #24
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #16
	str	r3, [r2, #0]
	b	lab40
lab45: 	add	r3, r3, #16
	ldr	r3, [r3, #0]
	uxtb	r2, r3
	add	r3, r7, #7680	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	strb	r2, [r3, #0]
	add	r3, r7, #7680	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7680	
	add	r2, r2, #24
	str	r3, [r2, #0]
	addw	r3, r7, #3672	
	sub	r3, r3, #2128	
	add	r2, r7, #7744	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	ldr	r3, [r3, r2, lsl #2]
	addw	r2, r7, #3672	
	sub	r1, r2, #2384	
	add	r2, r7, #7744	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	add	r2, r1
	ldrb	r2, [r2, #0]
	orrs	r3, r2
	cmp	r3, #0
	beq	lab41
	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #4
	str	r3, [r2, #0]
	addw	r3, r7, #3672	
	sub	r2, r3, #2384	
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r3, r2
	ldrb	r3, [r3, #0]
	subs	r3, #1
	movs	r2, #1
	lsl	r3, r2, r3
	add	r2, r7, #7744	
	add	r2, r2, #8
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
	b	lab42
lab44: 	add	r3, r3, #4
	ldr	r3, [r3, #0]
	lsls	r3, r3, #1
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #4
	str	r3, [r2, #0]
	addw	r3, r7, #3672	
	sub	r3, r3, #2128	
	add	r2, r7, #7744	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	ldr	r2, [r3, r2, lsl #2]
	add	r3, r7, #7744	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	ands	r3, r2
	cmp	r3, #0
	beq	lab43
	add	r3, r7, #7744	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #4
	str	r3, [r2, #0]
lab43: 	add	r3, r7, #7744	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	lsrs	r3, r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #8
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
lab42: 	addw	r3, r7, #3672	
	sub	r2, r3, #2384	
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	cmp	r3, r2
	bcc	lab44
	addw	r3, r7, #3672	
	sub	r3, r3, #3408	
	add	r2, r7, #7744	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	add	r1, r7, #7744	
	add	r1, r1, #4
	ldr	r1, [r1, #0]
	str	r1, [r3, r2, lsl #2]
lab41: 	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #16
	str	r3, [r2, #0]
lab40: 	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	cmp	r3, #255	
	bls	lab45
	movs	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
	b	lab46
lab50: 	sub	r3, r3, #3408	
	add	r2, r7, #7744	
	add	r2, r2, #20
	ldr	r2, [r2, #0]
	ldr	r3, [r3, r2, lsl #2]
	add	r2, r7, #7680	
	add	r2, r2, #16
	str	r3, [r2, #0]
	addw	r3, r7, #3672	
	sub	r2, r3, #3664	
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	add	r3, r2
	ldrb	r3, [r3, #0]
	add	r2, r7, #7680	
	add	r2, r2, #15
	strb	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	add	r2, r7, #7744	
	add	r2, r2, #16
	str	r3, [r2, #0]
	b	lab47
lab49: 	add	r3, r3, #16
	ldr	r3, [r3, #0]
	subs	r2, r3, #1
	addw	r3, r7, #3672	
	sub	r3, r3, #3408	
	ldr	r1, [r3, r2, lsl #2]
	addw	r3, r7, #3672	
	sub	r3, r3, #3408	
	add	r2, r7, #7744	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	str	r1, [r3, r2, lsl #2]
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	subs	r3, #1
	addw	r2, r7, #3672	
	sub	r2, r2, #3664	
	ldrb	r1, [r2, r3]
	addw	r3, r7, #3672	
	sub	r2, r3, #3664	
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r3, r2
	mov	r2, r1
	strb	r2, [r3, #0]
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	subs	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #16
	str	r3, [r2, #0]
lab47: 	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	lab48
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	subs	r2, r3, #1
	addw	r3, r7, #3672	
	sub	r3, r3, #3408	
	ldr	r3, [r3, r2, lsl #2]
	add	r2, r7, #7680	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	cmp	r2, r3
	bcc	lab49
lab48: 	addw	r3, r7, #3672	
	sub	r3, r3, #3408	
	add	r2, r7, #7744	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	add	r1, r7, #7680	
	add	r1, r1, #16
	ldr	r1, [r1, #0]
	str	r1, [r3, r2, lsl #2]
	addw	r3, r7, #3672	
	sub	r2, r3, #3664	
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #7680	
	add	r2, r2, #15
	ldrb	r2, [r2, #0]
	strb	r2, [r3, #0]
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
lab46: 	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	cmp	r3, #255	
	bls	lab50
	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #16
	str	r3, [r2, #0]
	b	lab51
lab52: 	add	r3, r3, #16
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #16
	str	r3, [r2, #0]
lab51: 	addw	r3, r7, #3672	
	sub	r3, r3, #3408	
	add	r2, r7, #7744	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	beq	lab52
	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #4
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
	movs	r3, #128	
	add	r2, r7, #7744	
	add	r2, r2, #8
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #12
	str	r3, [r2, #0]
	add	r3, r7, #7680	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	add	r2, r7, #7744	
	str	r3, [r2, #0]
	addw	r3, r7, #3672	
	subw	r3, r3, #3668	
	ldr	r3, [r3, #0]
	add	r2, r7, #7712	
	add	r2, r2, #28
	str	r3, [r2, #0]
	b	lab53
lab58: 	add	r3, r3, #4
	ldr	r3, [r3, #0]
	lsls	r3, r3, #1
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #4
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	ldr	r3, [r3, #0]
	ldrb	r3, [r3, #0]
	mov	r2, r3
	add	r3, r7, #7744	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	ands	r3, r2
	cmp	r3, #0
	beq	lab54
	add	r3, r7, #7744	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #4
	str	r3, [r2, #0]
	b	lab54
lab55: 	add	r3, r3, #20
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
lab54: 	addw	r3, r7, #3672	
	sub	r3, r3, #3408	
	add	r2, r7, #7744	
	add	r2, r2, #20
	ldr	r2, [r2, #0]
	ldr	r3, [r3, r2, lsl #2]
	add	r2, r7, #7744	
	add	r2, r2, #4
	ldr	r2, [r2, #0]
	cmp	r2, r3
	bhi	lab55
	addw	r3, r7, #3672	
	sub	r3, r3, #3408	
	add	r2, r7, #7744	
	add	r2, r2, #20
	ldr	r2, [r2, #0]
	ldr	r3, [r3, r2, lsl #2]
	add	r2, r7, #7744	
	add	r2, r2, #4
	ldr	r2, [r2, #0]
	cmp	r2, r3
	bne	lab56
	addw	r3, r7, #3672	
	sub	r2, r3, #3664	
	add	r3, r7, #7744	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	add	r3, r2
	ldrb	r2, [r3, #0]
	add	r3, r7, #7712	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	strb	r2, [r3, #0]
	add	r3, r7, #7712	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7712	
	add	r2, r2, #28
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #12
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #7744	
	add	r2, r2, #4
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r2, r7, #7744	
	add	r2, r2, #20
	str	r3, [r2, #0]
lab56: 	add	r3, r7, #7744	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bls	lab57
	add	r3, r7, #7744	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	lsrs	r3, r3, #1
	add	r2, r7, #7744	
	add	r2, r2, #8
	str	r3, [r2, #0]
	b	lab53
lab57: 	movs	r3, #128	
	add	r2, r7, #7744	
	add	r2, r2, #8
	str	r3, [r2, #0]
	add	r3, r7, #7744	
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #7744	
	str	r3, [r2, #0]
lab53: 	addw	r3, r7, #3672	
	subw	r3, r3, #3672	
	add	r2, r7, #7744	
	add	r2, r2, #12
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bcc	lab58
	add	r3, r7, #7680	
	add	r3, r3, #20
	ldr	r0, [r3, #0]
	bl	free_beebs
	b	lab59
lab30: 	nop
	b	lab59
lab31: 	nop
	b	lab59
lab35: 	nop
lab59: 	add	r7, r7, #7744	
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2123
	mov.w r2, #1610612736 
verify_benchmark:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r2, #500	
	ldr	r1, =orig_data	
	ldr	r0, =test_data	
	bl	memcmp
	push {r1, r2}
	mov.w r1, #6853
	mov.w r2, #1610612736 
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #83
	mov.w r2, #1610612736 
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
	mov.w r1, #7195
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7195
	mov.w r2, #1610612736 
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5572
	mov.w r2, #1610612736 
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #11
push {r1, r2}
	mov.w r1, #2504
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2504
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #5168
	mov.w r2, #1610612736 
benchmark_body:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab60
lab61: 	ldr	r0, =heap	
	bl	init_heap_beebs
	push {r1, r2}
	mov.w r1, #501
	mov.w r2, #1610612736 
	ldr	r3, =orig_data	
	mov	r0, r2
	mov	r1, r3
	mov	r3, #500	
	mov	r2, r3
	bl	memcpy
	mov	r1, #500	
	ldr	r0, =test_data	
	bl	compdecomp
	push {r1, r2}
	mov.w r1, #6847
	mov.w r2, #1610612736 
	adds	r3, #1
	str	r3, [r7, #12]
lab60: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab61
	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #3949
	mov.w r2, #1610612736 
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
	mov.w r1, #6592
	mov.w r2, #1610612736 
	bl	benchmark
	push {r1, r2}
	mov.w r1, #4248
	mov.w r2, #1610612736 
	str	r3, [r7, #8]
	bl	stop_trigger
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	verify_benchmark
	push {r1, r2}
	mov.w r1, #1497
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
	mov.w r1, #2176
	mov.w r2, #1610612736 
init_heap_beebs:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	and	r3, r3, #3
	cmp	r3, #0
	beq	lab62
	ldr	r3, [pc, #40]	
	ldr	r2, =__func__.0	
	movs	r1, #65	
	ldr	r0, [pc, #44]	
	bl	__assert_func
lab62: 	ldr	r2, =heap_ptr	
	ldr	r3, [r7, #4]
	str	r3, [r2, #0]
	ldr	r3, =heap_ptr	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #0]
	add	r3, r2
	ldr	r2, =heap_end	
	str	r3, [r2, #0]
	ldr	r3, =heap_requested	
	movs	r2, #0
	str	r2, [r3, #0]
	nop
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2878
	mov.w r2, #1610612736 
	.ltorg
malloc_beebs:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	lab63
	movs	r3, #0
	b	lab64
lab63: 	ldr	r3, =heap_ptr	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, =heap_requested	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	add	r3, r2
	ldr	r2, =heap_requested	
	str	r3, [r2, #0]
	movs	r3, #4
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #16]
	udiv	r2, r3, r2
	ldr	r1, [r7, #16]
	mul	r2, r1, r2
	subs	r3, r3, r2
	cmp	r3, #0
	beq	lab65
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #16]
	udiv	r2, r3, r2
	ldr	r1, [r7, #16]
	mul	r2, r1, r2
	subs	r3, r3, r2
	ldr	r2, [r7, #16]
	subs	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #12]
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, =heap_requested	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	add	r3, r2
	ldr	r2, =heap_requested	
	str	r3, [r2, #0]
lab65: 	ldr	r3, =heap_end	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #20]
	cmp	r2, r3
	bls	lab66
	movs	r3, #0
	b	lab64
lab66: 	ldr	r3, =heap_ptr	
	ldr	r3, [r3, #0]
	str	r3, [r7, #8]
	ldr	r2, =heap_ptr	
	ldr	r3, [r7, #20]
	str	r3, [r2, #0]
	ldr	r3, [r7, #8]
lab64: 	mov	r0, r3
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
free_beebs:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
__assert_func:
	push	{lr}
	ldr	r4, =_impure_ptr	
	ldr	r5, [r4, #0]
	mov	r4, r2
	ldr	r6, [r5, #12]
	mov	r2, r3
	sub	sp, #20
	mov	r3, r0
	mov	r5, r1
	cbz	r4, lab67
	ldr	r1, [pc, #28]	
lab68: 	strd	r1, r4, [sp, #4]
	mov	r0, r6
	ldr	r1, [pc, #24]	
	bl	fiprintf
	push {r1, r2}
	mov.w r1, #2772
	mov.w r2, #1610612736 
lab67: 	ldr	r1, [pc, #16]	
	mov	r4, r1
	b	lab68
	nop
	.ltorg
fiprintf:
	push	{r1, r2, r3}
	push	{r4, lr}
	sub	sp, #12
	add	r3, sp, #20
	ldr	r4, =_impure_ptr	
	ldr	r2, [r3], #4
	str	r3, [sp, #4]
	mov	r1, r0
	ldr	r0, [r4, #0]
push {r1, r2}
	mov.w r1, #246
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #246
	mov.w r2, #1610612736 
	ldmia	sp!, {r4, lr}
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #523
	mov.w r2, #1610612736 
	nop
	.ltorg
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x0001c908	
	ldr	r5, =0x0001c908	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab69
	movs	r4, #0
lab70: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #1064
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #1064
	mov.w r2, #1610612736 
lab69: 	ldr	r6, =0x0001c910	
	ldr	r5, =0x0001c908	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab71
	movs	r4, #0
lab72: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #6794
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #6794
	mov.w r2, #1610612736 
lab71:	cpsid f
	push {r1, r2}
	mov.w r1, #2599
	mov.w r2, #1610612736 
	.ltorg
memcmp:
	cmp	r2, #3
	push	{r4, lr}
	bls	lab73
	orr	ip, r0, r1
	tst	ip, #3
	mov	r4, r0
	mov	r3, r1
	bne	lab74
lab75: 	mov	r0, r4
	ldr	lr, [r1]
	ldr	ip, [r0]
	cmp	ip, lr
	add	r4, r4, #4
	add	r3, r3, #4
	bne	lab74
	subs	r2, #4
	cmp	r2, #3
	mov	r0, r4
	mov	r1, r3
	bhi	lab75
lab73: 	subs	r4, r2, #1
	cbz	r2, lab76
lab80: 	subs	r1, #1
	b	lab77
lab79: 	beq	lab78
lab77: 	ldrb	lr, [ip, #1]!
	ldrb	r2, [r1, #1]!
	cmp	lr, r2
	sub	r3, r4, ip
	beq	lab79
	sub	r0, lr, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #4750
	mov.w r2, #1610612736 
lab74: 	subs	r4, r2, #1
	b	lab80
lab78: 	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #4427
	mov.w r2, #1610612736 
lab76: 	mov	r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #3697
	mov.w r2, #1610612736 
memcpy:
	mov	ip, r0
	orr	r3, r1, r0
	ands	r3, r3, #3
	bne	lab81
lab90: 	bcc	lab82
lab83: 	str	r3, [r0], #4
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
	bcs	lab83
lab82: 	adds	r2, #48	
	bcc	lab84
lab85: 	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #16
	bcs	lab85
lab84: 	adds	r2, #12
	bcc	lab86
lab87: 	str	r3, [r0], #4
	subs	r2, #4
	bcs	lab87
lab86: 	adds	r2, #4
	beq	lab88
	lsls	r2, r2, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab88
	ldrh	r3, [r1, #0]
	strh	r3, [r0, #0]
lab88: 	mov	r0, ip
	bx	lr
	nop
lab81: 	cmp	r2, #8
	bcc	lab89
	lsls	r3, r1, #30
	beq	lab90
	ands	r3, r0, #3
	beq	lab90
	rsb	r3, r3, #4
	subs	r2, r2, r3
	lsls	r3, r3, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab90
	ldrh	r3, [r1], #2
	strh	r3, [r0], #2
	b	lab90
lab89: 	subs	r2, #4
	bcc	lab86
lab91: 	ldrb	r3, [r1], #1
	strb	r3, [r0], #1
	bcs	lab91
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
	beq	lab92
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab93
	uxtb	r2, r1
	mov	r3, r0
	b	lab94
lab95: 	bcc	lab93
lab94: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab95
lab103: 	bls	lab96
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab97
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab98: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab98
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab99
lab104: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab100: 	cmp	r3, r2
	bne	lab100
	and	r4, ip, #3
lab96: 	cbz	r4, lab93
lab102: 	add	r4, r3
lab101: 	cmp	r4, r3
	bne	lab101
lab93:	cpsid f
	push {r1, r2}
	mov.w r1, #1223
	mov.w r2, #1610612736 
lab99: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab102
	b	lab93
lab92: 	mov	r3, r0
	mov	r4, r2
	b	lab103
lab97: 	mov	r2, r3
	mov	ip, r4
	b	lab104
__sprint_r.part.0:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, [r1, #100]	
	lsls	r4, r3, #18
	mov	r8, r2
	bpl	lab105
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #0]
	cbz	r3, lab106
	mov	fp, r1
	mov	r6, r0
	add	r9, r2, #8
lab111: 	movs	r7, sl, lsr #2
	beq	lab107
	subs	r5, #4
	movs	r4, #0
	b	lab108
lab110: 	beq	lab109
lab108: 	ldr	r1, [r5, #4]!
	mov	r2, fp
	mov	r0, r6
	bl	_fputwc_r
	push {r1, r2}
	mov.w r1, #7990
	mov.w r2, #1610612736 
	add	r4, r4, #1
	bne	lab110
lab112: 	strd	r3, r3, [r8, #4]
	cpsid f
	push {r1, r2}
	mov.w r1, #7123
	mov.w r2, #1610612736 
lab109: 	ldr	r3, [r8, #8]
lab107: 	bic	sl, sl, #3
	sub	r3, r3, sl
	str	r3, [r8, #8]
	add	r9, r9, #8
	cmp	r3, #0
	bne	lab111
lab106: 	movs	r0, #0
	b	lab112
lab105: 	bl	__sfvwrite_r
	push {r1, r2}
	mov.w r1, #2427
	mov.w r2, #1610612736 
	strd	r3, r3, [r8, #4]
	cpsid f
	push {r1, r2}
	mov.w r1, #7550
	mov.w r2, #1610612736 
	nop
_vfiprintf_r:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, #244	
	strd	r3, r0, [sp, #16]
	mov	r4, r3
	str	r1, [sp, #4]
	mov	r7, r2
	cbz	r0, lab113
	ldr	r3, [r0, #56]	
	cmp	r3, #0
	beq	lab114
lab113: 	ldr	r2, [sp, #4]
	ldr	r3, [r2, #100]	
	lsls	r6, r3, #31
	bpl	lab115
	ldrsh	r1, [r2, #12]
	uxth	r2, r1
lab154: 	bmi	lab116
	orr	r2, r1, #8192	
	ldr	r1, [sp, #4]
	ldr	r3, [r1, #100]	
	strh	r2, [r1, #12]
	bic	r3, r3, #8192	
	uxth	r2, r2
	str	r3, [r1, #100]	
lab116: 	lsls	r1, r2, #28
	bpl	lab117
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	lab117
	and	r3, r2, #26
	cmp	r3, #10
	beq	lab118
lab136: 	str	r3, [sp, #64]	
	movs	r3, #0
	strd	r3, r3, [sp, #68]	
	strd	r3, r3, [sp, #40]	
	str	r3, [sp, #32]
	add	r9, sp, #76	
	str	r3, [sp, #36]	
	str	r3, [sp, #12]
lab169: 	cmp	r3, #0
	beq	lab119
	mov	r4, r7
	b	lab120
lab122: 	cmp	r3, #0
	beq	lab121
lab120: 	cmp	r3, #37	
	bne	lab122
	subs	r5, r4, r7
	bne	lab123
lab147: 	cmp	r3, #0
	beq	lab119
	mov	r3, #0
	movs	r5, #0
	strb	r3, [sp, #59]	
	adds	r7, r4, #1
	ldrb	r3, [r4, #1]
	str	r5, [sp, #8]
	mov	fp, #4294967295	
	movs	r4, #43	
lab128: lab126: 	cmp	r2, #90	
	bhi	lab124
	tbh	[pc, r2, lsl #1]
	.ltorg
	sub	r2, r3, #48	
	movs	r1, #0
lab125: 	add	r1, r1, r1, lsl #2
	add	r1, r2, r1, lsl #1
	sub	r2, r3, #48	
	cmp	r2, #9
	bls	lab125
	str	r1, [sp, #8]
	b	lab126
	ldr	r8, [sp, #20]
	mov	r0, r8
	bl	_localeconv_r
	ldr	r3, [r0, #4]
	str	r3, [sp, #40]	
	mov	r0, r3
	bl	strlen
	str	r0, [sp, #44]	
	mov	r6, r0
	mov	r0, r8
	bl	_localeconv_r
	ldr	r3, [r0, #8]
	str	r3, [sp, #36]	
	cmp	r6, #0
	bne	lab127
lab187: 	b	lab128
	ldrb	r3, [r7, #0]
	orr	r5, r5, #32
	b	lab128
	orr	r5, r5, #16
	lsls	r4, r5, #26
	ldr	r6, [sp, #16]
	bpl	lab129
	adds	r6, #7
	bic	r6, r6, #7
	mov	r2, r6
	ldr	r3, [r6, #4]
	ldr	r6, [r2], #8
	str	r2, [sp, #16]
	mov	r8, r3
lab176: 	blt	lab130
	cmp	fp, #4294967295	
	beq	lab131
	orrs	r3, r6, r8
	bic	sl, r5, #128	
	beq	lab132
lab190: 	sbcs	r3, r8, #0
	bcs	lab133
lab231: 	movs	r3, #1
	strb	r6, [sp, #239]	
	mov	r5, sl
	str	r3, [sp, #0]
	add	r4, sp, #239	
lab145: 	ldrb	r3, [sp, #59]	
	cmp	r8, fp
	it	lt
	movlt	r8, fp
	cmp	r3, #0
	beq	lab134
	add	r8, r8, #1
	b	lab134
lab117: 	ldr	r5, [sp, #4]
	ldr	r0, [sp, #20]
	mov	r1, r5
push {r1, r2}
	mov.w r1, #638
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #638
	mov.w r2, #1610612736 
	bne	lab135
	ldrh	r2, [r5, #12]
	and	r3, r2, #26
	cmp	r3, #10
	bne	lab136
lab118: 	ldr	r1, [sp, #4]
	ldrsh	r3, [r1, #14]
	cmp	r3, #0
	blt	lab136
	ldr	r3, [r1, #100]	
	lsls	r6, r3, #31
	bmi	lab137
	lsls	r5, r2, #22
	bpl	lab138
lab137: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	mov	r3, r4
	mov	r2, r7
	add	sp, #244	
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__sbprintf
	orr	r5, r5, #16
	ands	r8, r5, #32
	beq	lab139
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r3, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r3], #8
	str	r3, [sp, #16]
lab173: 	movs	r3, #0
lab183: 	strb	r2, [sp, #59]	
lab234: 	beq	lab140
	orrs	r2, r6, r8
	bic	r5, sl, #128	
	bne	lab141
	cmp	fp, #0
	bne	lab142
	cmp	r3, #0
	bne	lab143
	ands	r3, sl, #1
	str	r3, [sp, #0]
	beq	lab144
	movs	r3, #48	
	strb	r3, [sp, #239]	
	add	r4, sp, #239	
	b	lab145
lab121: 	subs	r5, r4, r7
	beq	lab119
lab123: 	ldr	r3, [sp, #68]	
	ldr	r2, [sp, #72]	
	adds	r3, #1
	add	r2, r5
	cmp	r3, #7
	strd	r7, r5, [r9]
	str	r2, [sp, #72]	
	str	r3, [sp, #68]	
	bgt	lab146
	add	r9, r9, #8
lab150: 	add	r3, r5
	str	r3, [sp, #12]
	b	lab147
lab146: 	cmp	r2, #0
	beq	lab148
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #5514
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5514
	mov.w r2, #1610612736 
	add	r9, sp, #76	
	b	lab150
lab119: 	ldr	r3, [sp, #72]	
	cmp	r3, #0
	bne	lab151
lab256: 	str	r3, [sp, #68]	
lab149: 	ldr	r2, [sp, #4]
	ldr	r3, [r2, #100]	
	lsls	r1, r3, #31
	bpl	lab152
	ldrh	r3, [r2, #12]
lab170: 	bmi	lab153
lab258: 	add	sp, #244	
	cpsid f
	push {r1, r2}
	mov.w r1, #3868
	mov.w r2, #1610612736 
lab115: 	ldr	r3, [sp, #4]
	ldrsh	r1, [r3, #12]
	lsls	r5, r1, #22
	uxth	r2, r1
	bmi	lab154
	mov	r5, r3
	ldr	r0, [r3, #88]	
	bl	__retarget_lock_acquire_recursive
	ldrsh	r1, [r5, #12]
	uxth	r2, r1
	b	lab154
lab124: 	cmp	r3, #0
	beq	lab119
	strb	r3, [sp, #140]	
	mov	r8, #1
	mov	r3, #0
	strb	r3, [sp, #59]	
	str	r8, [sp]
	add	r4, sp, #140	
lab180: lab134: 	ands	r3, r5, #2
	str	r3, [sp, #24]
	it	ne
	addne	r8, r8, #2
	ands	r3, r5, #132	
	str	r3, [sp, #28]
	bne	lab155
	ldr	r3, [sp, #8]
	sub	r6, r3, r8
	cmp	r6, #0
	bgt	lab156
lab155: 	ldrd	r2, r1, [sp, #68]	
	adds	r0, r2, #1
lab220: 	cbz	r6, lab157
	add	r2, sp, #59	
	adds	r1, #1
	str	r2, [r9]
	cmp	r0, #7
	mov	r2, #1
	strd	r0, r1, [sp, #68]	
	str	r2, [r9, #4]
	bgt	lab158
lab243: 	add	r9, r9, #8
	adds	r0, #1
lab157: 	ldr	r3, [sp, #24]
	cbz	r3, lab159
	add	r3, sp, #60	
	adds	r1, #2
	str	r3, [r9]
	cmp	r0, #7
	mov	r3, #2
	strd	r0, r1, [sp, #68]	
	str	r3, [r9, #4]
	ble	lab160
	cmp	r1, #0
	beq	lab161
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #6956
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6956
	mov.w r2, #1610612736 
	bne	lab149
	ldrd	r2, r1, [sp, #68]	
	add	r9, sp, #76	
	adds	r0, r2, #1
lab159: 	ldr	r3, [sp, #28]
	cmp	r3, #128	
	beq	lab162
lab195: 	sub	r6, fp, r3
	cmp	r6, #0
	bgt	lab163
lab203: 	str	r4, [r9]
	add	r1, r3
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	
	str	r3, [r9, #4]
	ble	lab164
	cmp	r1, #0
	beq	lab165
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #1129
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1129
	mov.w r2, #1610612736 
	bne	lab149
	ldr	r1, [sp, #72]	
	add	r9, sp, #76	
lab194: 	bpl	lab166
	ldr	r3, [sp, #8]
	sub	r4, r3, r8
	cmp	r4, #0
	bgt	lab167
lab166: 	ldrd	r2, r3, [sp, #8]
	cmp	r2, r8
	ite	ge
	addge	r3, r3, r2
	addlt	r3, r8
	str	r3, [sp, #12]
	cmp	r1, #0
	bne	lab168
lab211: 	str	r3, [sp, #68]	
	add	r9, sp, #76	
	b	lab169
lab152: 	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #12]
	lsls	r2, r3, #22
	bmi	lab170
	ldr	r4, [sp, #4]
	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	ldrh	r3, [r4, #12]
	b	lab170
lab139: 	ands	r3, r5, #16
	bne	lab171
	ands	r2, r5, #64	
	beq	lab172
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	mov	r8, r3
	uxth	r6, r6
	b	lab173
lab129: 	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	lsls	r0, r5, #27
	bmi	lab174
	lsls	r1, r5, #25
	bpl	lab175
	sbfx	r8, r3, #15, #1
	sxth	r6, r3
	mov	r3, r8
	b	lab176
	ldr	r6, [sp, #16]
	ldr	r4, [r6], #4
	mov	r3, #0
	strb	r3, [sp, #59]	
	cmp	r4, #0
	beq	lab177
	cmp	fp, #4294967295	
	beq	lab178
	mov	r2, fp
	movs	r1, #0
	mov	r0, r4
	bl	memchr
	cmp	r0, #0
	beq	lab179
	subs	r3, r0, r4
	str	r3, [sp, #0]
	str	r6, [sp, #16]
	mov	fp, #0
	b	lab145
	ldr	r6, [sp, #16]
	mov	r3, #0
	strb	r3, [sp, #59]	
	mov	r8, #1
	ldr	r3, [r6], #4
	strb	r3, [sp, #140]	
	str	r6, [sp, #16]
	str	r8, [sp]
	add	r4, sp, #140	
	b	lab180
lab114: 	bl	__sinit
	b	lab113
	ldr	r3, [sp, #16]
	ldr	r2, [r3], #4
	str	r2, [sp, #8]
	cmp	r2, #0
	bge	lab181
	ldr	r2, [sp, #8]
	str	r3, [sp, #16]
	negs	r2, r2
	str	r2, [sp, #8]
	ldrb	r3, [r7, #0]
	orr	r5, r5, #4
	b	lab128
	ldrb	r3, [r7, #0]
	cmp	r3, #108	
	ittte	eq
	ldrbeq	r3, [r7, #1]
	orreq	r5, r5, #32
	addeq	r7, #1
	orrne	r5, r5, #16
	b	lab128
	ldrb	r3, [r7, #0]
	cmp	r3, #104	
	ittte	eq
	ldrbeq	r3, [r7, #1]
	orreq	r5, r5, #512	
	addeq	r7, #1
	orrne	r5, r5, #64	
	b	lab128
	orr	sl, r5, #16
lab240: 	beq	lab182
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r3, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r3], #8
	str	r3, [sp, #16]
	movs	r3, #1
	b	lab183
	ldrb	r3, [r7, #0]
	strb	r4, [sp, #59]	
	b	lab128
	ldr	r3, [sp, #16]
	ldr	r6, [r3], #4
	str	r3, [sp, #16]
	movs	r3, #48	
	strb	r3, [sp, #60]	
	movs	r3, #120	
	strb	r3, [sp, #61]	
	ldr	r3, [pc, #740]	
	str	r3, [sp, #32]
	orr	sl, r5, #2
	mov	r8, #0
	movs	r3, #2
	b	lab183
	lsls	r6, r5, #26
	bmi	lab184
	lsls	r4, r5, #27
	bmi	lab185
	lsls	r0, r5, #25
	bmi	lab186
	lsls	r1, r5, #22
	bpl	lab185
	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	strb	r2, [r3, #0]
	b	lab169
	ldrb	r3, [r7, #0]
	orr	r5, r5, #1
	b	lab128
	ldrb	r3, [sp, #59]	
	cmp	r3, #0
	bne	lab187
	movs	r3, #32
	strb	r3, [sp, #59]	
	ldrb	r3, [r7, #0]
	b	lab128
	ldrb	r3, [r7, #0]
	orr	r5, r5, #128	
	b	lab128
	mov	r1, r7
	ldrb	r3, [r1], #1
	cmp	r3, #42	
	beq	lab188
	sub	r2, r3, #48	
	cmp	r2, #9
	mov	r7, r1
	mov	fp, #0
	bhi	lab126
lab189: 	add	fp, fp, fp, lsl #2
	add	fp, r2, fp, lsl #1
	sub	r2, r3, #48	
	cmp	r2, #9
	bls	lab189
	b	lab126
lab141: 	mov	sl, r5
lab140: 	cmp	r3, #1
	beq	lab190
lab251: 	add	r4, sp, #240	
	bne	lab191
	ldr	r2, [sp, #32]
lab192: 	lsrs	r6, r6, #4
	ldrb	r3, [r2, r3]
	strb	r3, [r4, #-1]!
	orr	r6, r6, r8, lsl #28
	mov	r8, r8, lsr #4
	orrs	r3, r6, r8
	bne	lab192
lab193: 	subs	r3, r3, r4
	mov	r5, sl
	str	r3, [sp, #0]
	b	lab145
lab191: 	and	r3, r6, #7
	lsrs	r6, r6, #3
	orr	r6, r6, r8, lsl #29
	mov	r8, r8, lsr #3
	adds	r3, #48	
	orrs	r1, r6, r8
	mov	r2, r4
	strb	r3, [r4, #-1]!
	bne	lab191
	tst	sl, #1
	beq	lab193
	cmp	r3, #48	
	beq	lab193
	movs	r3, #48	
	subs	r2, #2
	strb	r3, [r4, #-1]
	add	r3, sp, #240	
	subs	r3, r3, r2
	mov	r5, sl
	str	r3, [sp, #0]
	mov	r4, r2
	b	lab145
lab229: 	str	r4, [sp, #76]	
	movs	r3, #1
	str	r1, [sp, #80]	
	str	r1, [sp, #72]	
	str	r3, [sp, #68]	
	add	r9, sp, #76	
lab164: 	add	r9, r9, #8
	b	lab194
lab162: 	ldr	r3, [sp, #8]
	sub	r6, r3, r8
	cmp	r6, #0
	ble	lab195
	cmp	r6, #16
	ble	lab196
	ldr	sl, =zeroes.0	
	mov	r3, sl
	strd	fp, r4, [sp, #24]
	mov	sl, r7
	ldr	fp, [sp, #20]
	ldr	r4, [sp, #4]
	mov	r7, r5
	mov	r5, r3
	b	lab197
lab199: 	add	r9, r9, #8
	mov	r2, r0
lab212: 	cmp	r6, #16
	ble	lab198
lab197: 	adds	r0, r2, #1
	adds	r1, #16
	movs	r3, #16
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	
	str	r5, [r9]
	str	r3, [r9, #4]
	ble	lab199
	add	r2, sp, #64	
	cmp	r1, #0
	beq	lab200
	mov	r1, r4
	mov	r0, fp
	add	r9, sp, #76	
push {r1, r2}
	mov.w r1, #7060
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7060
	mov.w r2, #1610612736 
	bne	lab149
	ldrd	r2, r1, [sp, #68]	
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	bgt	lab197
lab198: 	ldrd	fp, r4, [sp, #24]
	mov	r3, r5
	mov	r5, r7
	mov	r7, sl
	mov	sl, r3
lab259: 	cmp	ip, #7
	strd	ip, r1, [sp, #68]	
	str	sl, [r9]
	str	r6, [r9, #4]
	ble	lab201
	cmp	r1, #0
	beq	lab202
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #5245
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5245
	mov.w r2, #1610612736 
	bne	lab149
	ldr	r3, [sp, #0]
	ldrd	r2, r1, [sp, #68]	
	sub	r6, fp, r3
	cmp	r6, #0
	add	r0, r2, #1
	add	r9, sp, #76	
	ble	lab203
lab163: 	cmp	r6, #16
	ldr	sl, =zeroes.0	
	ble	lab204
	mov	r3, sl
	strd	r4, r5, [sp, #24]
	mov	sl, r7
	ldr	r4, [sp, #20]
	ldr	r5, [sp, #4]
	mov	fp, #16
	mov	r7, r3
	b	lab205
lab207: 	add	r9, r9, #8
	mov	r2, r0
lab210: 	cmp	r6, #16
	ble	lab206
lab205: 	adds	r0, r2, #1
	adds	r1, #16
	cmp	r0, #7
	strd	r7, fp, [r9]
	strd	r0, r1, [sp, #68]	
	ble	lab207
	add	r2, sp, #64	
	cbz	r1, lab208
	mov	r1, r5
	mov	r0, r4
	add	r9, sp, #76	
push {r1, r2}
	mov.w r1, #7661
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7661
	mov.w r2, #1610612736 
	bne	lab149
	ldrd	r2, r1, [sp, #68]	
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	bgt	lab205
lab206: 	ldrd	r4, r5, [sp, #24]
	mov	r3, r7
	mov	r0, ip
	mov	r7, sl
	mov	sl, r3
lab204: 	add	r1, r6
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	
	str	sl, [r9]
	str	r6, [r9, #4]
	bgt	lab209
	add	r9, r9, #8
	adds	r0, #1
	b	lab203
lab208: 	mov	ip, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab210
lab168: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #1720
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1720
	mov.w r2, #1610612736 
	beq	lab211
	b	lab149
lab200: 	mov	ip, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab212
lab158: 	cmp	r1, #0
	beq	lab213
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #5269
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5269
	mov.w r2, #1610612736 
	bne	lab149
	ldrd	r2, r1, [sp, #68]	
	add	r9, sp, #76	
	adds	r0, r2, #1
	b	lab157
lab254: 	add	r3, sp, #60	
	str	r1, [sp, #80]	
	str	r3, [sp, #76]	
	movs	r0, #1
	add	r9, sp, #76	
lab160: 	mov	r2, r0
lab237: 	adds	r0, r2, #1
	b	lab159
lab156: 	cmp	r6, #16
	ble	lab214
	ldrd	ip, r1, [sp, #68]	
	ldr	sl, =blanks.1	
	strd	fp, r4, [sp, #48]	
	movs	r3, #16
	mov	r4, sl
	ldr	fp, [sp, #4]
	ldr	sl, [sp, #20]
	mov	r2, ip
	b	lab215
	.ltorg
lab217: 	add	r9, r9, #8
	mov	r2, r0
lab221: 	cmp	r6, #16
	ble	lab216
lab215: 	adds	r0, r2, #1
	adds	r1, #16
	cmp	r0, #7
	strd	r4, r3, [r9]
	strd	r0, r1, [sp, #68]	
	ble	lab217
	add	r2, sp, #64	
	cbz	r1, lab218
	mov	r1, fp
	mov	r0, sl
	add	r9, sp, #76	
push {r1, r2}
	mov.w r1, #5409
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5409
	mov.w r2, #1610612736 
	bne	lab149
	ldrd	r2, r1, [sp, #68]	
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	mov	r3, #16
	bgt	lab215
lab216: 	mov	sl, r4
	ldr	fp, [sp, #48]	
	ldr	r4, [sp, #52]	
	mov	r2, ip
lab255: 	cmp	r2, #7
	strd	r2, r1, [sp, #68]	
	str	sl, [r9]
	str	r6, [r9, #4]
	bgt	lab219
	add	r9, r9, #8
	adds	r0, r2, #1
	b	lab220
lab218: 	mov	r2, r1
	mov	ip, #1
	add	r9, sp, #76	
	b	lab221
lab165: 	lsls	r4, r5, #29
	str	r1, [sp, #68]	
	bpl	lab222
	ldr	r3, [sp, #8]
	sub	r4, r3, r8
	cmp	r4, #0
	ble	lab222
	add	r9, sp, #76	
lab167: 	cmp	r4, #16
	ble	lab223
	ldr	sl, =blanks.1	
	ldr	r2, [sp, #68]	
	ldr	r6, [sp, #20]
	ldr	fp, [sp, #4]
	mov	r3, sl
	movs	r5, #16
	mov	sl, r7
	mov	r7, r3
	b	lab224
lab226: 	add	r9, r9, #8
	mov	r2, r3
lab228: 	cmp	r4, #16
	ble	lab225
lab224: 	adds	r3, r2, #1
	adds	r1, #16
	cmp	r3, #7
	strd	r7, r5, [r9]
	strd	r3, r1, [sp, #68]	
	ble	lab226
	add	r2, sp, #64	
	cbz	r1, lab227
	mov	r1, fp
	mov	r0, r6
push {r1, r2}
	mov.w r1, #894
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #894
	mov.w r2, #1610612736 
	bne	lab149
	ldrd	r2, r1, [sp, #68]	
	subs	r4, #16
	cmp	r4, #16
	add	r0, r2, #1
	add	r9, sp, #76	
	bgt	lab224
lab225: 	mov	r3, r7
	mov	r7, sl
	mov	sl, r3
lab257: 	cmp	r0, #7
	strd	sl, r4, [r9]
	strd	r0, r1, [sp, #68]	
	ble	lab166
	cbz	r1, lab222
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #4692
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4692
	mov.w r2, #1610612736 
	bne	lab149
	ldr	r1, [sp, #72]	
	b	lab166
lab227: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab228
lab222: 	ldrd	r2, r3, [sp, #8]
	cmp	r2, r8
	ite	ge
	addge	r3, r3, r2
	addlt	r3, r8
	str	r3, [sp, #12]
	b	lab211
lab209: 	cmp	r1, #0
	beq	lab229
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #1185
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1185
	mov.w r2, #1610612736 
	bne	lab149
	ldr	r0, [sp, #68]	
	ldr	r1, [sp, #72]	
	adds	r0, #1
	add	r9, sp, #76	
	b	lab203
lab213: 	ldr	r3, [sp, #24]
	cmp	r3, #0
	bne	lab230
lab161: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab159
lab148: 	str	r2, [sp, #68]	
	add	r9, sp, #76	
	b	lab150
lab132: 	cmp	fp, #0
	bne	lab231
	mov	r5, sl
lab143: 	mov	fp, #0
	str	fp, [sp]
	add	r4, sp, #240	
	b	lab145
lab182: 	ands	r3, sl, #16
	bne	lab232
	ands	r2, sl, #64	
	beq	lab233
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	mov	r8, r3
	uxth	r6, r6
	movs	r3, #1
	b	lab183
lab130: 	movs	r3, #45	
	negs	r6, r6
	strb	r3, [sp, #59]	
	sbc	r8, r8, r8, lsl #1
	mov	sl, r5
	movs	r3, #1
	b	lab234
lab219: 	cmp	r1, #0
	beq	lab235
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #5967
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5967
	mov.w r2, #1610612736 
	bne	lab149
	ldrd	r2, r1, [sp, #68]	
	add	r9, sp, #76	
	adds	r0, r2, #1
	b	lab220
lab181: 	str	r3, [sp, #16]
	ldrb	r3, [r7, #0]
	b	lab128
lab144: 	add	r4, sp, #240	
	b	lab145
lab201: 	add	r9, r9, #8
	add	r0, ip, #1
	mov	r2, ip
	b	lab195
lab175: 	lsls	r2, r5, #22
	bmi	lab236
lab174: 	mov	r8, r3, asr #31
	mov	r6, r3
	mov	r3, r8
	b	lab176
lab232: 	ldr	r3, [sp, #16]
	ldr	r6, [r3], #4
	str	r3, [sp, #16]
	movs	r3, #1
	b	lab183
lab127: 	ldr	r3, [sp, #36]	
	cmp	r3, #0
	beq	lab187
	ldr	r3, [sp, #36]	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab187
	ldrb	r3, [r7, #0]
	orr	r5, r5, #1024	
	b	lab128
lab184: 	ldrd	r1, r6, [sp, #12]
	ldr	r2, [r6], #4
	str	r6, [sp, #16]
	asrs	r3, r1, #31
	strd	r1, r3, [r2]
	b	lab169
lab171: 	ldr	r3, [sp, #16]
	ldr	r6, [r3], #4
	str	r3, [sp, #16]
	b	lab173
lab230: 	movs	r1, #2
	add	r3, sp, #60	
	str	r1, [sp, #80]	
	str	r3, [sp, #76]	
	add	r9, sp, #76	
	b	lab237
	ldr	r2, [pc, #300]	
	str	r2, [sp, #32]
lab241: 	beq	lab238
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r2, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r2], #8
	str	r2, [sp, #16]
lab245: 	bpl	lab239
	orrs	r2, r6, r8
	beq	lab239
	strb	r3, [sp, #61]	
	movs	r3, #48	
	orr	r5, r5, #2
	strb	r3, [sp, #60]	
lab239: 	bic	sl, r5, #1024	
	movs	r3, #2
	b	lab183
	mov	sl, r5
	b	lab240
	ldr	r2, [pc, #236]	
	str	r2, [sp, #32]
	b	lab241
lab178: 	mov	r0, r4
	str	r6, [sp, #16]
	bl	strlen
	mov	fp, #0
	str	r0, [sp, #0]
	b	lab145
lab235: 	ldrb	r2, [sp, #59]	
	cmp	r2, #0
	beq	lab242
	movs	r0, #1
	add	r2, sp, #59	
	str	r0, [sp, #80]	
	str	r2, [sp, #76]	
	add	r9, sp, #76	
	mov	r1, r0
	b	lab243
lab238: 	ands	r2, r5, #16
	beq	lab244
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	b	lab245
lab133: 	and	r3, sl, #1024	
	str	fp, [sp]
	str	r9, [sp, #24]
	mov	fp, r7
	ldr	r9, [sp, #36]	
	movs	r5, #0
	add	r4, sp, #240	
	mov	r7, r3
	b	lab246
lab248: 	mov	r1, r8
push {r1, r2}
	mov.w r1, #6401
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6401
	mov.w r2, #1610612736 
	sbcs	r3, r8, #0
	bcc	lab247
lab253: 	mov	r8, r1
lab246: 	mov	r0, r6
	mov	r1, r8
	movs	r2, #10
	movs	r3, #0
push {r1, r2}
	mov.w r1, #355
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #355
	mov.w r2, #1610612736 
	adds	r1, #48	
	strb	r1, [r4, #-1]
	movs	r2, #10
	movs	r3, #0
	subs	r4, #1
	adds	r5, #1
	cmp	r7, #0
	beq	lab248
	ldrb	r1, [r9]
	cmp	r1, r5
	bne	lab248
	cmp	r5, #255	
	beq	lab248
	cmp	r6, #10
	sbcs	r3, r8, #0
	bcs	lab249
lab247: 	add	r3, sp, #240	
	subs	r3, r3, r4
	str	r9, [sp, #36]	
	mov	r7, fp
	ldr	r9, [sp, #24]
	ldr	fp, [sp]
	str	r3, [sp, #0]
	mov	r5, sl
	b	lab145
lab244: 	ands	r1, r5, #64	
	beq	lab250
	ldr	r1, [sp, #16]
	ldr	r6, [r1], #4
	str	r1, [sp, #16]
	mov	r8, r2
	uxth	r6, r6
	b	lab245
lab131: 	mov	sl, r5
	b	lab190
lab142: 	cmp	r3, #1
	mov	sl, r5
	bne	lab251
	b	lab231
	nop
	.ltorg
lab185: 	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r2, [r3, #0]
	str	r6, [sp, #16]
	b	lab169
lab177: 	cmp	fp, #6
	mov	r8, fp
	it	cs
	movcs	r8, #6
	ldr	r4, [pc, #320]	
	str	r8, [sp]
	str	r6, [sp, #16]
	b	lab180
lab233: 	ldr	r3, [sp, #16]
	ands	r8, sl, #512	
	ite	ne
	ldrne	r6, [r3], #4
	ldreq	r6, [r3], #4
	str	r3, [sp, #16]
	itt	ne
	movne	r8, r2
	uxtbne	r6, r6
	movs	r3, #1
	b	lab183
lab172: 	ldr	r3, [sp, #16]
	ands	r8, r5, #512	
	ite	ne
	ldrne	r6, [r3], #4
	ldreq	r6, [r3], #4
	str	r3, [sp, #16]
	itt	ne
	movne	r8, r2
	uxtbne	r6, r6
	b	lab173
lab250: 	ldr	r2, [sp, #16]
	ands	r8, r5, #512	
	ite	ne
	ldrne	r6, [r2], #4
	ldreq	r6, [r2], #4
	str	r2, [sp, #16]
	itt	ne
	movne	r8, r1
	uxtbne	r6, r6
	b	lab245
lab249: 	ldr	r3, [sp, #44]	
	ldr	r1, [sp, #40]	
	subs	r4, r4, r3
	mov	r2, r3
	mov	r0, r4
	bl	strncpy
	push {r1, r2}
	mov.w r1, #4551
	mov.w r2, #1610612736 
	cbz	r3, lab252
	add	r9, r9, #1
lab252: 	mov	r0, r6
	mov	r1, r8
	movs	r2, #10
	movs	r3, #0
	movs	r5, #0
push {r1, r2}
	mov.w r1, #4625
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4625
	mov.w r2, #1610612736 
lab202: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab195
lab242: 	ldr	r3, [sp, #24]
	cmp	r3, #0
	bne	lab254
	mov	r2, r1
	movs	r0, #1
	add	r9, sp, #76	
	b	lab195
lab186: 	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	strh	r2, [r3, #0]
	b	lab169
lab236: 	sbfx	r8, r3, #7, #1
	sxtb	r6, r3
	mov	r3, r8
	b	lab176
lab138: 	ldr	r0, [r1, #88]	
	bl	__retarget_lock_release_recursive
	b	lab137
lab179: 	str	fp, [sp]
	str	r6, [sp, #16]
	mov	fp, r0
	b	lab145
lab214: 	ldr	r2, [sp, #68]	
	ldr	r1, [sp, #72]	
	ldr	sl, =blanks.1	
	adds	r2, #1
	b	lab255
lab151: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #4691
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4691
	mov.w r2, #1610612736 
	beq	lab256
	b	lab149
lab223: 	ldr	r0, [sp, #68]	
	ldr	sl, =blanks.1	
	adds	r0, #1
	b	lab257
lab135: 	ldr	r3, [sp, #4]
	ldr	r3, [r3, #100]	
	lsls	r3, r3, #31
	bmi	lab153
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #12]
	lsls	r7, r3, #22
	bmi	lab153
	ldr	r3, [sp, #4]
	ldr	r0, [r3, #88]	
	bl	__retarget_lock_release_recursive
lab153: 	mov	r3, #4294967295	
	str	r3, [sp, #12]
	b	lab258
lab196: 	ldr	sl, =zeroes.0	
	mov	ip, r0
	b	lab259
lab188: 	ldr	r2, [sp, #16]
	ldrb	r3, [r7, #1]
	mov	r7, r1
	ldr	r1, [r2], #4
	str	r2, [sp, #16]
	orr	fp, r1, r1, asr #31
	b	lab128
	nop
	.ltorg
__sbprintf:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r3
	ldrh	r3, [r1, #12]
	subw	sp, sp, #1132	
	bic	r3, r3, #2
	strh	r3, [sp, #12]
	ldr	r3, [r1, #100]	
	str	r3, [sp, #100]	
	ldrh	r3, [r1, #14]
	strh	r3, [sp, #14]
	ldr	r3, [r1, #28]
	str	r3, [sp, #28]
	ldr	r3, [r1, #36]	
	str	r3, [sp, #36]	
	add	r3, sp, #104	
	str	r3, [sp, #0]
	str	r3, [sp, #16]
	mov	r3, #1024	
	mov	r5, r2
	mov	r6, r0
	str	r3, [sp, #8]
	str	r3, [sp, #20]
	add	r0, sp, #88	
	movs	r3, #0
	mov	r4, r1
	str	r3, [sp, #24]
	bl	__retarget_lock_init_recursive
	mov	r2, r5
	mov	r3, r7
	mov	r1, sp
	mov	r0, r6
push {r1, r2}
	mov.w r1, #5186
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5186
	mov.w r2, #1610612736 
	blt	lab260
	mov	r1, sp
	mov	r0, r6
push {r1, r2}
	mov.w r1, #5374
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5374
	mov.w r2, #1610612736 
	it	ne
	movne	r5, #4294967295	
lab260: 	ldrh	r3, [sp, #12]
	lsls	r3, r3, #25
	bpl	lab261
	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
lab261: 	ldr	r0, [sp, #88]	
	bl	__retarget_lock_close_recursive
	mov	r0, r5
	addw	sp, sp, #1132	
	cpsid f
	push {r1, r2}
	mov.w r1, #2784
	mov.w r2, #1610612736 
__swsetup_r:
	push	{r3, r4, r5, lr}
	ldr	r3, =_impure_ptr	
	ldr	r3, [r3, #0]
	mov	r5, r0
	mov	r4, r1
	cbz	r3, lab262
	ldr	r2, [r3, #56]	
	cbz	r2, lab263
lab262: 	ldrsh	r3, [r4, #12]
	lsls	r0, r3, #28
	uxth	r2, r3
	bpl	lab264
lab270: 	cmp	r1, #0
	beq	lab265
lab273: 	beq	lab266
	movs	r0, #0
	str	r0, [r4, #8]
	ldr	r0, [r4, #20]
	negs	r0, r0
	str	r0, [r4, #24]
	cbz	r1, lab267
lab268: lab269:	cpsid f
	push {r1, r2}
	mov.w r1, #22
	mov.w r2, #1610612736 
lab266: 	lsls	r5, r2, #30
	it	pl
	ldrpl	r0, [r4, #20]
	str	r0, [r4, #8]
	cmp	r1, #0
	bne	lab268
lab267: 	lsls	r2, r2, #24
	it	pl
	movpl	r0, r1
	bpl	lab269
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
	mov	r0, #4294967295	
	cpsid f
	push {r1, r2}
	mov.w r1, #1287
	mov.w r2, #1610612736 
lab263: 	mov	r0, r3
	bl	__sinit
	ldrsh	r3, [r4, #12]
	lsls	r0, r3, #28
	uxth	r2, r3
	bmi	lab270
lab264: 	lsls	r1, r2, #27
	bpl	lab271
	lsls	r2, r2, #29
	bmi	lab272
	ldr	r1, [r4, #16]
lab276: 	strh	r3, [r4, #12]
	uxth	r2, r3
	cmp	r1, #0
	bne	lab273
lab265: 	and	r0, r2, #640	
	cmp	r0, #512	
	beq	lab273
	mov	r1, r4
	mov	r0, r5
	bl	__smakebuf_r
	push {r1, r2}
	mov.w r1, #1459
	mov.w r2, #1610612736 
	ldr	r1, [r4, #16]
	uxth	r2, r3
	b	lab273
lab272: 	ldr	r1, [r4, #48]	
	cbz	r1, lab274
	add	r2, r4, #64	
	cmp	r1, r2
	beq	lab275
	mov	r0, r5
push {r1, r2}
	mov.w r1, #7770
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7770
	mov.w r2, #1610612736 
lab275: 	movs	r2, #0
	str	r2, [r4, #48]	
lab274: 	ldr	r1, [r4, #16]
	movs	r2, #0
	strd	r1, r2, [r4]
	bic	r3, r3, #36	
	b	lab276
lab271: 	movs	r2, #9
	orr	r3, r3, #64	
	str	r2, [r5, #0]
	mov	r0, #4294967295	
	strh	r3, [r4, #12]
	cpsid f
	push {r1, r2}
	mov.w r1, #4367
	mov.w r2, #1610612736 
	.ltorg
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
	cbz	r6, lab277
	mov	r9, #1
	mov	sl, #0
lab283: 	subs	r5, r4, #1
	bmi	lab277
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab279: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab278
lab280: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab279
lab277: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab278: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab280
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab281
	blx	r2
lab286: 	cmp	r2, fp
	bne	lab282
lab285: 	cmp	r3, r6
	beq	lab280
	mov	r6, r3
	cmp	r6, #0
	bne	lab283
	b	lab277
lab281: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab284
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab285
lab282: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab283
	b	lab277
lab284: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab286
	.ltorg
abort:
	push	{r3, lr}
	movs	r0, #6
	bl	raise
	push {r1, r2}
	mov.w r1, #2984
	mov.w r2, #1610612736 
	bl	_exit
	nop
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__sflush_r:
	ldrsh	r2, [r1, #12]
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r1
	lsls	r1, r2, #28
	mov	r7, r0
	bmi	lab287
	ldr	r3, [r4, #4]
	orr	r2, r2, #2048	
	cmp	r3, #0
	strh	r2, [r4, #12]
	ble	lab288
lab300: 	cmp	r5, #0
	beq	lab289
	movs	r3, #0
	ldr	r6, [r7, #0]
	str	r3, [r7, #0]
	uxth	r3, r2
	ands	r2, r2, #4096	
	bne	lab290
	ldr	r1, [r4, #28]
	movs	r3, #1
	mov	r0, r7
	blx	r5
	adds	r2, r0, #1
	beq	lab291
lab303: 	ldr	r5, [r4, #40]	
lab301: 	bpl	lab292
	ldr	r3, [r4, #4]
	subs	r0, r0, r3
	ldr	r3, [r4, #48]	
	cbz	r3, lab292
	ldr	r3, [r4, #60]	
	subs	r0, r0, r3
lab292: 	ldr	r1, [r4, #28]
	mov	r2, r0
	movs	r3, #0
	mov	r0, r7
	blx	r5
	adds	r1, r0, #1
	bne	lab293
	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq	lab293
	cmp	r3, #29
	beq	lab294
	cmp	r3, #22
	bne	lab295
lab294: 	ldrh	r3, [r4, #12]
	ldr	r2, [r4, #16]
	str	r2, [r4, #0]
	bic	r3, r3, #2048	
	movs	r1, #0
	str	r1, [r4, #4]
	strh	r3, [r4, #12]
lab302: 	str	r6, [r7, #0]
	cbz	r1, lab289
	add	r3, r4, #64	
	cmp	r1, r3
	beq	lab296
	mov	r0, r7
push {r1, r2}
	mov.w r1, #7023
	mov.w r2, #1610612736 
lab296:	push {r1, r2}
	mov.w r1, #7023
	mov.w r2, #1610612736 
	str	r0, [r4, #48]	
	cpsid f
	push {r1, r2}
	mov.w r1, #4170
	mov.w r2, #1610612736 
lab287: 	ldr	r6, [r4, #16]
	cbz	r6, lab289
	uxth	r3, r2
	ldr	r5, [r4, #0]
	str	r6, [r4, #0]
	lsls	r2, r3, #30
	ite	eq
	ldreq	r3, [r4, #20]
	movne	r3, #0
	subs	r5, r5, r6
	str	r3, [r4, #8]
	b	lab297
lab299: 	ldr	r1, [r4, #28]
	mov	r3, r5
	mov	r2, r6
	mov	r0, r7
	blx	ip
	subs	ip, r0, #0
	sub	r5, r5, ip
	add	r6, ip
	ble	lab298
lab297: 	cmp	r5, #0
	bgt	lab299
lab289: 	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #3752
	mov.w r2, #1610612736 
lab288: 	ldr	r3, [r4, #60]	
	cmp	r3, #0
	bgt	lab300
	b	lab289
lab290: 	ldr	r0, [r4, #80]	
	b	lab301
lab293: 	ldrsh	r3, [r4, #12]
	ldr	r2, [r4, #16]
	str	r2, [r4, #0]
	bic	r3, r3, #2048	
	strh	r3, [r4, #12]
	movs	r2, #0
	lsls	r3, r3, #19
	str	r2, [r4, #4]
	bpl	lab302
	str	r0, [r4, #80]	
	b	lab302
lab298: 	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	
	mov	r0, #4294967295	
	strh	r3, [r4, #12]
	cpsid f
	push {r1, r2}
	mov.w r1, #3569
	mov.w r2, #1610612736 
lab291: 	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq	lab303
	cmp	r3, #29
	beq	lab304
	cmp	r3, #22
	beq	lab304
lab295: 	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
	cpsid f
	push {r1, r2}
	mov.w r1, #253
	mov.w r2, #1610612736 
lab304: 	str	r6, [r7, #0]
	b	lab289
	nop
_fflush_r:
	push	{r3, r4, r5, lr}
	mov	r4, r1
	mov	r5, r0
	cbz	r0, lab305
	ldr	r3, [r0, #56]	
	cbz	r3, lab306
lab305: 	ldrsh	r0, [r4, #12]
	cbz	r0, lab307
lab312: 	lsls	r3, r3, #31
	bmi	lab308
	lsls	r1, r0, #22
	bpl	lab309
lab308: 	mov	r0, r5
	mov	r1, r4
push {r1, r2}
	mov.w r1, #2917
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2917
	mov.w r2, #1610612736 
	lsls	r2, r3, #31
	mov	r5, r0
	bmi	lab310
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #22
	bpl	lab311
lab310: 	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #4495
	mov.w r2, #1610612736 
lab306: 	bl	__sinit
	ldrsh	r0, [r4, #12]
	cmp	r0, #0
	bne	lab312
lab307: 	mov	r5, r0
	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #7682
	mov.w r2, #1610612736 
lab309: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_acquire_recursive
	b	lab308
lab311: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #2478
	mov.w r2, #1610612736 
	nop
_cleanup_r:
	ldr	r1, =0x0000bfe5	
	b	_fwalk_reent
	nop
	.ltorg
__sinit:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	mov	sl, r0
	ldr	r0, =__lock___sinit_recursive_mutex	
	bl	__retarget_lock_acquire_recursive
	ldr	r4, [sl, #56]	
	cmp	r4, #0
	bne	lab313
	ldr	r5, [sl, #4]
	ldr	r2, =0x0000a6f1	
	str	r2, [sl, #60]	
	movs	r3, #3
	strd	r4, r3, [sl, #736]	
	ldr	r9, =0x0000bc09	
	ldr	r8, =0x0000bc2d	
	ldr	r7, =0x0000bc6d	
	ldr	r6, =0x0000bc8d	
	movs	r3, #4
	add	r2, sl, #748	
	str	r2, [sl, #744]	
	mov	r1, r4
	strd	r4, r3, [r5, #8]
	strd	r4, r4, [r5]
	strd	r4, r4, [r5, #16]
	str	r4, [r5, #100]	
	movs	r2, #8
	str	r4, [r5, #24]
	add	r0, r5, #92	
push {r1, r2}
	mov.w r1, #3485
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3485
	mov.w r2, #1610612736 
	strd	r8, r7, [r5, #36]	
	str	r6, [r5, #44]	
	add	r0, r5, #88	
	bl	__retarget_lock_init_recursive
	ldr	r5, [sl, #8]
	ldr	r3, =0x00010009	
	str	r3, [r5, #12]
	mov	r1, r4
	strd	r4, r4, [r5]
	strd	r4, r4, [r5, #16]
	str	r4, [r5, #100]	
	str	r4, [r5, #8]
	str	r4, [r5, #24]
	movs	r2, #8
	add	r0, r5, #92	
push {r1, r2}
	mov.w r1, #3739
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3739
	mov.w r2, #1610612736 
	strd	r8, r7, [r5, #36]	
	str	r6, [r5, #44]	
	add	r0, r5, #88	
	bl	__retarget_lock_init_recursive
	ldr	r5, [sl, #12]
	ldr	r3, =0x00020012	
	str	r3, [r5, #12]
	mov	r1, r4
	strd	r4, r4, [r5]
	strd	r4, r4, [r5, #16]
	str	r4, [r5, #100]	
	str	r4, [r5, #8]
	str	r4, [r5, #24]
	movs	r2, #8
	add	r0, r5, #92	
push {r1, r2}
	mov.w r1, #3656
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3656
	mov.w r2, #1610612736 
	strd	r5, r9, [r5, #28]
	strd	r7, r6, [r5, #40]	
	str	r8, [r5, #36]	
	bl	__retarget_lock_init_recursive
	movs	r3, #1
	str	r3, [sl, #56]	
	ldr	r0, =__lock___sinit_recursive_mutex	
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	__retarget_lock_release_recursive
lab313: 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r0, =__lock___sinit_recursive_mutex	
	b	__retarget_lock_release_recursive
	.ltorg
__sfp_lock_acquire:
	ldr	r0, =__lock___sfp_recursive_mutex	
	b	__retarget_lock_acquire_recursive
	nop
	.ltorg
__sfp_lock_release:
	ldr	r0, =__lock___sfp_recursive_mutex	
	b	__retarget_lock_release_recursive
	nop
	.ltorg
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =0x0001c914	
	ldr	r5, =0x0001c910	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab314
	subs	r3, #4
	add	r5, r3
lab315: 	ldr	r3, [r5], #-4
	
	push {r1, r2}
	mov.w r1, #247
	mov.w r2, #1610612736 
	cmp	r4, #0
	push {r1, r2}
	mov.w r1, #247
	mov.w r2, #1610612736 
lab314: 	ldmia	sp!, {r3, r4, r5, lr}
	b	_fini
	.ltorg
__fputwc:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
	sub	sp, #12
	mov	r7, r0
	mov	r8, r1
	mov	r4, r2
	bl	__locale_mb_cur_max
	cmp	r0, #1
	bne	lab316
	add	r3, r8, #4294967295	
	cmp	r3, #254	
	bls	lab317
lab316: 	mov	r2, r8
	add	r3, r4, #92	
	add	r1, sp, #4
	mov	r0, r7
	bl	_wcrtomb_r
	push {r1, r2}
	mov.w r1, #7939
	mov.w r2, #1610612736 
	mov	r6, r0
	beq	lab318
	cbz	r0, lab319
	ldrb	ip, [sp, #4]
lab324: 	movs	r5, #0
	b	lab320
lab321: 	adds	r2, r3, #1
	str	r2, [r4, #0]
	strb	ip, [r3]
lab323: 	cmp	r5, r6
	bcs	lab319
	ldrb	ip, [r9], #1
lab320: 	ldr	r3, [r4, #8]
	subs	r3, #1
	cmp	r3, #0
	str	r3, [r4, #8]
	bge	lab321
	ldr	lr, [r4, #24]
	cmp	r3, lr
	mov	r1, ip
	mov	r2, r4
	mov	r0, r7
	blt	lab322
	cmp	ip, #10
	bne	lab321
lab322: 	bl	__swbuf_r
	push {r1, r2}
	mov.w r1, #2241
	mov.w r2, #1610612736 
	bne	lab323
	mov	r6, r0
	mov	r0, r6
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #5060
	mov.w r2, #1610612736 
lab319: 	mov	r6, r8
	mov	r0, r6
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #139
	mov.w r2, #1610612736 
lab317: 	uxtb	ip, r8
	strb	ip, [sp, #4]
	mov	r6, r0
	b	lab324
lab318: 	ldrh	r3, [r4, #12]
	mov	r0, r6
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #4444
	mov.w r2, #1610612736 
_fputwc_r:
	push	{r4, r5, lr}
	ldr	r3, [r2, #100]	
	tst	r3, #1
	ldrsh	r3, [r2, #12]
	mov	r4, r2
	sub	sp, #12
	mov	r5, r0
	uxth	r2, r3
	bne	lab325
	lsls	r0, r3, #22
	bpl	lab326
lab325: 	lsls	r0, r2, #18
	bmi	lab327
	ldr	r2, [r4, #100]	
	orr	r3, r3, #8192	
	orr	r2, r2, #8192	
	strh	r3, [r4, #12]
	str	r2, [r4, #100]	
lab327: 	mov	r2, r4
	mov	r0, r5
	bl	__fputwc
	push {r1, r2}
	mov.w r1, #4482
	mov.w r2, #1610612736 
	lsls	r2, r3, #31
	mov	r5, r0
	bmi	lab328
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #22
	bpl	lab329
lab328: 	mov	r0, r5
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #5995
	mov.w r2, #1610612736 
lab329: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #7573
	mov.w r2, #1610612736 
lab326: 	ldr	r0, [r4, #88]	
	str	r1, [sp, #4]
	bl	__retarget_lock_acquire_recursive
	ldrsh	r3, [r4, #12]
	ldr	r1, [sp, #4]
	uxth	r2, r3
	b	lab325
	nop
_malloc_trim_r:
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r7, =__malloc_av_	
	mov	r4, r1
	mov	r6, r0
	bl	__malloc_lock
	ldr	r2, [r7, #8]
	ldr	r5, [r2, #4]
	rsb	r3, r4, #4064	
	adds	r3, #15
	bic	r5, r5, #3
	add	r3, r5
	bic	r3, r3, #4080	
	bic	r3, r3, #15
	sub	r4, r3, #4096	
	cmp	r4, #4096	
	blt	lab330
	movs	r1, #0
	mov	r0, r6
push {r1, r2}
	mov.w r1, #5442
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5442
	mov.w r2, #1610612736 
	add	r3, r5
	cmp	r0, r3
	beq	lab331
lab330: 	mov	r0, r6
	bl	__malloc_unlock
	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #7865
	mov.w r2, #1610612736 
lab331: 	negs	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #5937
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5937
	mov.w r2, #1610612736 
	beq	lab332
	ldr	r2, =__malloc_current_mallinfo	
	ldr	r3, [r7, #8]
	subs	r5, r5, r4
	orr	r5, r5, #1
	str	r5, [r3, #4]
	ldr	r3, [r2, #0]
	mov	r0, r6
	subs	r3, r3, r4
	str	r3, [r2, #0]
	bl	__malloc_unlock
	movs	r0, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #8170
	mov.w r2, #1610612736 
lab332: 	movs	r1, #0
	mov	r0, r6
push {r1, r2}
	mov.w r1, #4180
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4180
	mov.w r2, #1610612736 
	subs	r3, r0, r2
	cmp	r3, #15
	ble	lab330
	orr	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, =__malloc_sbrk_base	
	ldr	r1, =__malloc_current_mallinfo	
	ldr	r3, [r3, #0]
	subs	r0, r0, r3
	str	r0, [r1, #0]
	b	lab330
	nop
	.ltorg
_free_r:
	cmp	r1, #0
	beq	lab333
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r1
	mov	r6, r0
	bl	__malloc_lock
	ldr	r2, [r4, #-4]
	ldr	r7, =__malloc_av_	
	sub	r5, r4, #8
	bic	r1, r2, #1
	add	ip, r5, r1
	ldr	r0, [r7, #8]
	ldr	r3, [ip, #4]
	cmp	r0, ip
	bic	r3, r3, #3
	beq	lab334
	lsls	r2, r2, #31
	str	r3, [ip, #4]
	bmi	lab335
	ldr	r2, [r4, #-8]
	subs	r5, r5, r2
	add	r1, r2
	ldr	r2, [r5, #8]
	add	r0, r7, #8
	cmp	r2, r0
	beq	lab336
	add	r4, ip, r3
	ldr	lr, [r4, #4]
	ldr	r4, [r5, #12]
	str	r4, [r2, #12]
	tst	lr, #1
	str	r2, [r4, #8]
	beq	lab337
	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [ip]
lab341: 	bcs	lab338
lab342: 	lsrs	r3, r1, #3
	lsrs	r0, r1, #5
	movs	r1, #1
	adds	r3, #1
	lsls	r1, r0
	orrs	r1, r2
	str	r1, [r7, #4]
	add	r2, r7, r3, lsl #3
	ldr	r1, [r7, r3, lsl #3]
	subs	r2, #8
	strd	r1, r2, [r5, #8]
	str	r5, [r7, r3, lsl #3]
	str	r5, [r1, #12]
lab349: 	ldmia	sp!, {r3, r4, r5, r6, r7, lr}
	b	__malloc_unlock
lab335: 	add	r2, ip, r3
	ldr	r2, [r2, #4]
	lsls	r0, r2, #31
	bmi	lab339
	add	r1, r3
	add	r0, r7, #8
lab353: 	cmp	r3, r0
	beq	lab340
	ldr	r2, [ip, #12]
	str	r2, [r3, #12]
	str	r3, [r2, #8]
	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [r5, r1]
	b	lab341
lab333:	cpsid f
	push {r1, r2}
	mov.w r1, #712
	mov.w r2, #1610612736 
lab339: 	orr	r3, r1, #1
	cmp	r1, #512	
	str	r3, [r4, #-4]
	str	r1, [ip]
	bcc	lab342
lab338: 	cmp	r1, #2560	
	mov	r3, r1, lsr #9
	bcs	lab343
	lsrs	r3, r1, #6
	add	r0, r3, #57	
	add	r2, r3, #56	
	lsls	r3, r0, #3
lab352: 	ldr	r3, [r7, r3]
	subs	r0, #8
	cmp	r0, r3
	beq	lab344
lab346: 	bic	r2, r2, #3
	cmp	r2, r1
	bls	lab345
	ldr	r3, [r3, #8]
	cmp	r0, r3
	bne	lab346
lab345: 	ldr	r0, [r3, #12]
lab354: 	str	r5, [r0, #8]
	str	r5, [r3, #12]
	mov	r0, r6
	ldmia	sp!, {r3, r4, r5, r6, r7, lr}
	b	__malloc_unlock
lab336: 	add	r2, ip, r3
	ldr	r2, [r2, #4]
	lsls	r2, r2, #31
	bmi	lab347
	add	r3, r1
	ldrd	r1, r2, [ip, #8]
	str	r2, [r1, #12]
	str	r1, [r2, #8]
	orr	r2, r3, #1
	str	r2, [r5, #4]
	mov	r0, r6
	str	r3, [r5, r3]
	ldmia	sp!, {r3, r4, r5, r6, r7, lr}
	b	__malloc_unlock
lab334: 	add	r3, r1
	lsls	r1, r2, #31
	bmi	lab348
	ldr	r2, [r4, #-8]
	subs	r5, r5, r2
	add	r3, r2
	ldrd	r1, r2, [r5, #8]
	str	r2, [r1, #12]
	str	r1, [r2, #8]
lab348: 	orr	r2, r3, #1
	str	r2, [r5, #4]
	ldr	r2, =__malloc_trim_threshold	
	str	r5, [r7, #8]
	ldr	r2, [r2, #0]
	cmp	r2, r3
	bhi	lab349
	ldr	r3, =__malloc_top_pad	
	mov	r0, r6
	ldr	r1, [r3, #0]
	bl	_malloc_trim_r
	push {r1, r2}
	mov.w r1, #936
	mov.w r2, #1610612736 
lab343: 	cmp	r3, #20
	bls	lab350
	cmp	r3, #84	
	bhi	lab351
	lsrs	r3, r1, #12
	add	r0, r3, #111	
	add	r2, r3, #110	
	lsls	r3, r0, #3
	b	lab352
lab337: 	add	r1, r3
	b	lab353
lab350: 	add	r0, r3, #92	
	add	r2, r3, #91	
	lsls	r3, r0, #3
	b	lab352
lab340: 	orr	r3, r1, #1
	strd	r5, r5, [r7, #16]
	strd	r0, r0, [r5, #8]
	str	r3, [r5, #4]
	str	r1, [r5, r1]
	b	lab349
lab344: 	ldr	r1, [r7, #4]
	asrs	r2, r2, #2
	movs	r4, #1
	lsl	r2, r4, r2
	orrs	r2, r1
	str	r2, [r7, #4]
	b	lab354
lab351: 	cmp	r3, #340	
	bhi	lab355
	lsrs	r3, r1, #15
	add	r0, r3, #120	
	add	r2, r3, #119	
	lsls	r3, r0, #3
	b	lab352
lab355: 	movw	r2, #1364	
	cmp	r3, r2
	bhi	lab356
	lsrs	r3, r1, #18
	add	r0, r3, #125	
	add	r2, r3, #124	
	lsls	r3, r0, #3
	b	lab352
lab356: 	mov	r3, #1016	
	movs	r2, #126	
	b	lab352
lab347: 	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [ip]
	b	lab349
	nop
	.ltorg
__sfvwrite_r:
	ldr	r3, [r2, #8]
	cmp	r3, #0
	beq	lab357
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldrsh	r3, [r1, #12]
	mov	r4, r1
	lsls	r1, r3, #28
	mov	r8, r0
	sub	sp, #12
	mov	r7, r2
	uxth	r0, r3
	bpl	lab358
	ldr	r3, [r4, #16]
	cbz	r3, lab358
	ands	r3, r0, #2
	ldr	r5, [r7, #0]
	beq	lab359
lab364: 	ldr	fp, =0x7ffffc00	
	mov	r6, sl
lab362: 	mov	r3, r6
	mov	r2, sl
	it	cs
	movcs	r3, fp
	mov	r0, r8
	cmp	r6, #0
	beq	lab360
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #36]	
	blx	ip
	cmp	r0, #0
	ble	lab361
	ldr	r3, [r7, #8]
	subs	r3, r3, r0
	add	sl, r0
	subs	r6, r6, r0
	str	r3, [r7, #8]
	cmp	r3, #0
	bne	lab362
lab370: lab394: 	cpsid f
	push {r1, r2}
	mov.w r1, #3670
	mov.w r2, #1610612736 
lab358: 	mov	r1, r4
	mov	r0, r8
push {r1, r2}
	mov.w r1, #5150
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5150
	mov.w r2, #1610612736 
	bne	lab363
	ldrsh	r3, [r4, #12]
	ldr	r5, [r7, #0]
	uxth	r0, r3
	ands	r3, r0, #2
	bne	lab364
lab359: 	ands	r9, r0, #1
	bne	lab365
	mov	r6, r9
lab372: lab371: 	ldr	fp, [r4, #8]
	bpl	lab367
	cmp	fp, r6
	mov	r2, fp
	bhi	lab368
	tst	r0, #1152	
	bne	lab369
	ldr	r0, [r4, #0]
lab387: 	mov	r1, r9
push {r1, r2}
	mov.w r1, #6758
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6758
	mov.w r2, #1610612736 
	ldr	r1, [r4, #0]
	ldr	r2, [sp, #4]
	sub	r3, r3, fp
	add	r2, r1
	mov	sl, r6
	str	r3, [r4, #8]
	str	r2, [r4, #0]
	movs	r6, #0
lab385: 	sub	r0, r0, sl
	add	r9, sl
	str	r0, [r7, #8]
	cmp	r0, #0
	beq	lab370
	ldrsh	r0, [r4, #12]
	uxth	r0, r0
	cmp	r6, #0
	bne	lab371
lab366: 	ldrd	r9, r6, [r5]
	adds	r5, #8
	b	lab372
lab360: 	ldrd	sl, r6, [r5]
	adds	r5, #8
	b	lab362
lab379: 	mov	r0, r8
push {r1, r2}
	mov.w r1, #7146
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7146
	mov.w r2, #1610612736 
lab361: 	ldrsh	r3, [r4, #12]
lab392: 	mov	r0, #4294967295	
	strh	r3, [r4, #12]
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #5493
	mov.w r2, #1610612736 
lab357: 	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #4631
	mov.w r2, #1610612736 
lab365: 	mov	r6, r3
	mov	sl, r5
	mov	r9, r3
	mov	r0, r3
	mov	r5, r3
	cbz	r6, lab374
lab380: lab383: lab393: 	ldr	r0, [r4, #0]
	cmp	r2, r6
	it	cs
	movcs	r2, r6
	cmp	r0, r1
	bls	lab376
	ldr	r1, [r4, #8]
	add	fp, r3, r1
	cmp	r2, fp
	bgt	lab377
lab376: 	cmp	r3, r2
	bgt	lab378
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #36]	
	mov	r2, r5
	mov	r0, r8
	blx	ip
	subs	fp, r0, #0
	ble	lab361
lab388: 	beq	lab379
	movs	r0, #1
lab373: 	ldr	r3, [r7, #8]
	sub	r3, r3, fp
	add	r5, fp
	sub	r6, r6, fp
	str	r3, [r7, #8]
	cmp	r3, #0
	beq	lab370
	cmp	r6, #0
	bne	lab380
lab374: 	add	r3, sl, #8
lab381: 	mov	sl, r3
	adds	r3, #8
	cmp	r6, #0
	beq	lab381
lab375: 	mov	r2, r6
	movs	r1, #10
	mov	r0, r5
	bl	memchr
	cmp	r0, #0
	beq	lab382
	adds	r0, #1
	sub	r9, r0, r5
	b	lab383
lab367: 	ldr	r0, [r4, #0]
	ldr	r3, [r4, #16]
	cmp	r0, r3
	bhi	lab384
	ldr	r3, [r4, #20]
	cmp	r3, r6
	bhi	lab384
	mvn	r2, #2147483648	
	cmp	r2, r6
	it	cs
	movcs	r2, r6
	ldr	r1, [r4, #28]
	sdiv	r2, r2, r3
	ldr	ip, [r4, #36]	
	mul	r3, r2, r3
	mov	r0, r8
	mov	r2, r9
	blx	ip
	subs	sl, r0, #0
	ble	lab361
lab386: 	b	lab385
lab384: 	cmp	fp, r6
	mov	sl, fp
	it	cs
	movcs	sl, r6
	mov	r2, sl
	mov	r1, r9
push {r1, r2}
	mov.w r1, #3409
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3409
	mov.w r2, #1610612736 
	ldr	r2, [r4, #0]
	sub	r3, r3, sl
	add	r2, sl
	str	r3, [r4, #8]
	str	r2, [r4, #0]
	cmp	r3, #0
	bne	lab386
	mov	r1, r4
	mov	r0, r8
push {r1, r2}
	mov.w r1, #1727
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1727
	mov.w r2, #1610612736 
	beq	lab386
	b	lab361
lab368: 	ldr	r0, [r4, #0]
	mov	fp, r6
	mov	r2, r6
	b	lab387
lab378: 	mov	r1, r5
	str	r2, [sp, #4]
push {r1, r2}
	mov.w r1, #4466
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4466
	mov.w r2, #1610612736 
	ldr	r3, [r4, #8]
	subs	r3, r3, r2
	str	r3, [r4, #8]
	ldr	r3, [r4, #0]
	add	r3, r2
	str	r3, [r4, #0]
	mov	fp, r2
	b	lab388
lab369: 	ldr	r3, [r4, #0]
	ldr	r1, [r4, #16]
	sub	fp, r3, r1
	ldr	r3, [r4, #20]
	add	sl, r3, r3, lsl #1
	add	sl, sl, sl, lsr #31
	add	r3, fp, #1
	mov	sl, sl, asr #1
	add	r3, r6
	cmp	r3, sl
	mov	r2, sl
	itt	hi
	movhi	sl, r3
	movhi	r2, sl
	lsls	r3, r0, #21
	bpl	lab389
	mov	r1, r2
	mov	r0, r8
push {r1, r2}
	mov.w r1, #3914
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3914
	mov.w r2, #1610612736 
	beq	lab390
	mov	r2, fp
	ldr	r1, [r4, #16]
	str	r0, [sp, #4]
	bl	memcpy
	ldrh	r2, [r4, #12]
	ldr	r3, [sp, #4]
	bic	r2, r2, #1152	
	orr	r2, r2, #128	
	strh	r2, [r4, #12]
lab391: 	str	r3, [r4, #16]
	sub	r3, sl, fp
	str	sl, [r4, #20]
	str	r3, [r4, #8]
	str	r0, [r4, #0]
	mov	fp, r6
	mov	r2, r6
	b	lab387
lab377: 	mov	r1, r5
	mov	r2, fp
push {r1, r2}
	mov.w r1, #5120
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5120
	mov.w r2, #1610612736 
	add	r3, fp
	str	r3, [r4, #0]
	mov	r1, r4
	mov	r0, r8
push {r1, r2}
	mov.w r1, #6622
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6622
	mov.w r2, #1610612736 
	beq	lab388
	b	lab361
lab389: 	mov	r0, r8
push {r1, r2}
	mov.w r1, #4425
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4425
	mov.w r2, #1610612736 
	cmp	r0, #0
	bne	lab391
	ldr	r1, [r4, #16]
	mov	r0, r8
push {r1, r2}
	mov.w r1, #6192
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6192
	mov.w r2, #1610612736 
	movs	r2, #12
	bic	r3, r3, #128	
	str	r2, [r8]
	b	lab392
lab382: 	adds	r2, r6, #1
	mov	r9, r2
	b	lab393
lab390: 	movs	r2, #12
	ldrsh	r3, [r4, #12]
	str	r2, [r8]
	b	lab392
lab363: 	mov	r0, #4294967295	
	b	lab394
	nop
	.ltorg
_fwalk_reent:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r0
	mov	r8, r1
	add	r6, r0, #736	
	mov	r9, #0
lab398: 	subs	r5, #1
	bmi	lab395
lab397: 	cmp	r3, #1
	add	r5, r5, #4294967295	
	bls	lab396
	ldrsh	r3, [r4, #14]
	adds	r3, #1
	mov	r1, r4
	beq	lab396
	mov	r0, r7
	blx	r8
	orr	r9, r9, r0
lab396: 	adds	r3, r5, #1
	add	r4, r4, #104	
	bne	lab397
lab395: 	ldr	r6, [r6, #0]
	cmp	r6, #0
	bne	lab398
	mov	r0, r9
	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
__locale_mb_cur_max:
	ldr	r3, =__global_locale	
	ldrb	r0, [r3, #296]	
	bx	lr
	.ltorg
_localeconv_r:
	ldr	r0, [pc, #0]	
	bx	lr
	.ltorg
__retarget_lock_init_recursive:
	bx	lr
	nop
__retarget_lock_close_recursive:
	bx	lr
	nop
__retarget_lock_acquire_recursive:
	bx	lr
	nop
__retarget_lock_release_recursive:
	bx	lr
	nop
__smakebuf_r:
	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
	ldrh	r3, [r1, #12]
	mov	r4, r1
	lsls	r1, r3, #30
	sub	sp, #88	
	bpl	lab399
	add	r3, r4, #67	
	movs	r2, #1
	strd	r3, r2, [r4, #16]
	str	r3, [r4, #0]
lab406: 	cpsid f
	push {r1, r2}
	mov.w r1, #8063
	mov.w r2, #1610612736 
lab399: 	ldrsh	r1, [r4, #14]
	cmp	r1, #0
	mov	r6, r0
	blt	lab400
	mov	r2, sp
	bl	_fstat_r
	push {r1, r2}
	mov.w r1, #7574
	mov.w r2, #1610612736 
	blt	lab401
	ldr	r5, [sp, #4]
	and	r5, r5, #61440	
	sub	r5, r5, #8192	
	clz	r5, r5
	mov	r8, #1024	
	lsrs	r5, r5, #5
	mov	r7, #2048	
lab407: 	mov	r0, r6
push {r1, r2}
	mov.w r1, #3370
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3370
	mov.w r2, #1610612736 
	cbz	r0, lab402
lab405: 	str	r2, [r6, #60]	
	orr	r3, r3, #128	
	str	r8, [r4, #20]
	strh	r3, [r4, #12]
	str	r0, [r4, #0]
	str	r0, [r4, #16]
	cbnz	r5, lab403
lab409: 	strh	r3, [r4, #12]
	add	sp, #88	
	cpsid f
	push {r1, r2}
	mov.w r1, #15
	mov.w r2, #1610612736 
lab401: 	ldrh	r3, [r4, #12]
lab400: 	ands	r5, r3, #128	
	beq	lab404
	mov	r8, #64	
	mov	r1, r8
	mov	r0, r6
push {r1, r2}
	mov.w r1, #8001
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8001
	mov.w r2, #1610612736 
	ldrsh	r3, [r4, #12]
	mov	r7, r5
	cmp	r0, #0
	bne	lab405
lab402: 	lsls	r2, r3, #22
	bmi	lab406
	bic	r3, r3, #3
	add	r2, r4, #67	
	orr	r3, r3, #2
	movs	r1, #1
	strd	r2, r1, [r4, #16]
	strh	r3, [r4, #12]
	str	r2, [r4, #0]
	b	lab406
lab404: 	mov	r8, #1024	
	mov	r7, r5
	b	lab407
lab403: 	ldrsh	r1, [r4, #14]
	mov	r0, r6
	bl	_isatty_r
	push {r1, r2}
	mov.w r1, #6712
	mov.w r2, #1610612736 
	ldrsh	r3, [r4, #12]
	b	lab409
lab408: 	ldrh	r3, [r4, #12]
	bic	r3, r3, #3
	orr	r3, r3, #1
	sxth	r3, r3
	b	lab409
	.ltorg
_malloc_r:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	r6, r1, #11
	cmp	r6, #22
	sub	sp, #12
	mov	r4, r0
	bhi	lab410
	cmp	r1, #16
	bhi	lab411
	bl	__malloc_lock
	movs	r6, #16
	movs	r2, #24
	movs	r0, #2
lab459: 	add	r2, r7
	sub	r1, r2, #8
	ldr	r3, [r2, #4]
	cmp	r3, r1
	beq	lab412
lab433: 	ldr	r1, [r3, #12]
	bic	r2, r2, #3
	add	r2, r3
lab448: 	str	r1, [r5, #12]
	str	r5, [r1, #8]
	ldr	r1, [r2, #4]
	orr	r1, r1, #1
	mov	r0, r4
	str	r1, [r2, #4]
	add	r5, r3, #8
	bl	__malloc_unlock
	mov	r0, r5
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #6023
	mov.w r2, #1610612736 
lab410: 	bics	r6, r6, #7
	bmi	lab411
	cmp	r1, r6
	bhi	lab411
	bl	__malloc_lock
	cmp	r6, #504	
	bcc	lab413
	lsrs	r3, r6, #9
	beq	lab414
	cmp	r3, #4
	bhi	lab415
	lsrs	r3, r6, #6
	add	r0, r3, #57	
	add	ip, r3, #56	
	lsls	r3, r0, #3
lab432: 	add	r3, r7
	sub	r5, r3, #8
	ldr	r3, [r3, #4]
	cmp	r5, r3
	bne	lab416
	b	lab417
lab419: 	bge	lab418
	ldr	r3, [r3, #12]
	cmp	r5, r3
	beq	lab417
lab416: 	ldr	r2, [r3, #4]
	bic	r2, r2, #3
	subs	r1, r2, r6
	cmp	r1, #15
	ble	lab419
	mov	r0, ip
lab417: 	ldr	r5, [r7, #16]
	ldr	ip, [pc, #576]	
	cmp	r5, ip
	beq	lab420
lab434: 	bic	r2, r2, #3
	subs	r3, r2, r6
	cmp	r3, #15
	bgt	lab421
	cmp	r3, #0
	strd	ip, ip, [r7, #16]
	bge	lab422
	cmp	r2, #512	
	bcs	lab423
	lsrs	r3, r2, #3
	ldr	r1, [r7, #4]
	adds	r3, #1
	mov	lr, r2, lsr #5
	movs	r2, #1
	lsl	r2, r2, lr
	orrs	r2, r1
	ldr	lr, [r7, r3, lsl #3]
	str	lr, [r5, #8]
	add	r1, r7, r3, lsl #3
	subs	r1, #8
	str	r1, [r5, #12]
	str	r2, [r7, #4]
	str	r5, [r7, r3, lsl #3]
	str	r5, [lr, #12]
lab454: 	movs	r1, #1
	lsls	r1, r3
	cmp	r1, r2
	bhi	lab424
lab435: 	bne	lab425
	bic	r0, r0, #3
lab426: 	tst	r1, r2
	add	r0, r0, #4
	beq	lab426
lab425: 	add	r9, r7, r0, lsl #3
	mov	r5, r9
	mov	lr, r0
lab457: 	cmp	r5, r8
	bne	lab427
	b	lab428
lab430: 	bge	lab429
	ldr	r8, [r8, #12]
	cmp	r5, r8
	beq	lab428
lab427: 	ldr	r2, [r8, #4]
	bic	r2, r2, #3
	subs	r3, r2, r6
	cmp	r3, #15
	ble	lab430
	mov	r0, r4
	ldrd	r5, r4, [r8, #8]
	add	r1, r8, r6
	orr	r6, r6, #1
	str	r6, [r8, #4]
	str	r4, [r5, #12]
	str	r5, [r4, #8]
	orr	r4, r3, #1
	strd	r1, r1, [r7, #16]
	strd	ip, ip, [r1, #8]
	str	r4, [r1, #4]
	str	r3, [r8, r2]
	bl	__malloc_unlock
	add	r5, r8, #8
	b	lab431
lab411: 	movs	r3, #12
	str	r3, [r4, #0]
	movs	r5, #0
lab431: 	mov	r0, r5
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #5388
	mov.w r2, #1610612736 
lab414: 	mov	r3, #512	
	movs	r0, #64	
	mov	ip, #63	
	b	lab432
lab412: 	ldr	r3, [r2, #12]
	cmp	r2, r3
	it	eq
	addeq	r0, #2
	bne	lab433
	ldr	r5, [r7, #16]
	ldr	ip, [pc, #328]	
	cmp	r5, ip
	bne	lab434
lab420: 	ldr	r2, [r7, #4]
	asrs	r3, r0, #2
	movs	r1, #1
	lsls	r1, r3
	cmp	r1, r2
	bls	lab435
lab424: 	ldr	r5, [r7, #8]
	ldr	r3, [r5, #4]
	bic	r9, r3, #3
	cmp	r6, r9
	bhi	lab436
	sub	r3, r9, r6
	cmp	r3, #15
	bgt	lab437
lab436: 	ldr	fp, =__malloc_sbrk_base	
	ldr	r3, =__malloc_top_pad	
	ldr	r2, [fp]
	ldr	r3, [r3, #0]
	adds	r2, #1
	add	r3, r6
	add	sl, r5, r9
	beq	lab438
	add	r3, r3, #4096	
	adds	r3, #15
	bic	r8, r3, #4080	
	bic	r8, r8, #15
lab467: 	mov	r0, r4
push {r1, r2}
	mov.w r1, #2350
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2350
	mov.w r2, #1610612736 
	mov	r2, r0
	beq	lab439
	cmp	sl, r0
	bhi	lab440
	ldr	r3, =__malloc_current_mallinfo	
	ldr	r1, [r3, #0]
	add	r1, r8
	str	r1, [r3, #0]
	mov	r0, r1
	beq	lab441
lab473: 	str	r3, [sp, #4]
	adds	r1, #1
	ittet	ne
	subne	sl, r2, sl
	addne	r0, sl
	streq	r2, [fp]
	strne	r0, [r3, #0]
	ands	fp, r2, #7
	beq	lab442
	rsb	r1, fp, #8
	add	r2, r1
	rsb	r1, fp, #4096	
	add	r8, r2
	adds	r1, #8
	sub	r1, r1, r8
	ubfx	sl, r1, #0, #12
	mov	r1, sl
	mov	r0, r4
	str	r2, [sp, #0]
push {r1, r2}
	mov.w r1, #4734
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4734
	mov.w r2, #1610612736 
	ldrd	r2, r3, [sp]
	beq	lab443
lab469: 	add	r8, r0, sl
lab470: 	str	r2, [r7, #8]
	orr	r0, r8, #1
	add	r1, sl
	cmp	r5, r7
	str	r0, [r2, #4]
	str	r1, [r3, #0]
	beq	lab444
	cmp	r9, #15
	bls	lab445
	ldr	r0, [r5, #4]
	sub	ip, r9, #12
	bic	ip, ip, #7
	and	r0, r0, #1
	orr	r0, r0, ip
	str	r0, [r5, #4]
	mov	lr, #5
	add	r0, r5, ip
	cmp	ip, #15
	strd	lr, lr, [r0, #4]
	bhi	lab446
	ldr	r0, [r2, #4]
	mov	r5, r2
lab474: 	ldr	r2, [r3, #0]
	cmp	r2, r1
	it	cc
	strcc	r1, [r3, #0]
	ldr	r3, =__malloc_max_total_mem	
	ldr	r2, [r3, #0]
	cmp	r2, r1
	it	cc
	strcc	r1, [r3, #0]
	b	lab447
lab437: 	adds	r2, r5, r6
	orr	r3, r3, #1
	orr	r6, r6, #1
	str	r6, [r5, #4]
	mov	r0, r4
	str	r2, [r7, #8]
	str	r3, [r2, #4]
	bl	__malloc_unlock
	adds	r5, #8
	mov	r0, r5
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #2269
	mov.w r2, #1610612736 
lab418: 	ldr	r1, [r3, #12]
	add	r2, r3
	b	lab448
	nop
	.ltorg
lab423: 	cmp	r2, #2560	
	mov	r3, r2, lsr #9
	bcc	lab449
	cmp	r3, #20
	bhi	lab450
	add	r1, r3, #92	
	lsls	r1, r1, #3
	adds	r3, #91	
lab460: 	ldr	r1, [r7, r1]
	sub	lr, lr, #8
	cmp	lr, r1
	beq	lab451
lab453: 	bic	r3, r3, #3
	cmp	r3, r2
	bls	lab452
	ldr	r1, [r1, #8]
	cmp	lr, r1
	bne	lab453
lab452: 	ldr	lr, [r1, #12]
	ldr	r2, [r7, #4]
lab468: 	str	r5, [lr, #8]
	str	r5, [r1, #12]
	b	lab454
lab415: 	cmp	r3, #20
	bls	lab455
	cmp	r3, #84	
	bhi	lab456
	lsrs	r3, r6, #12
	add	r0, r3, #111	
	add	ip, r3, #110	
	lsls	r3, r0, #3
	b	lab432
lab428: 	add	lr, lr, #1
	tst	lr, #3
	add	r5, r5, #8
	bne	lab457
	b	lab458
lab429: 	add	r2, r8
	mov	r5, r8
	ldr	r3, [r2, #4]
	ldr	r1, [r8, #12]
	orr	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [r5, #8]!
	mov	r0, r4
	str	r1, [r3, #12]
	str	r3, [r1, #8]
	bl	__malloc_unlock
	b	lab431
lab413: 	lsrs	r0, r6, #3
	add	r2, r6, #8
	b	lab459
lab422: 	add	r2, r5
	mov	r0, r4
	ldr	r3, [r2, #4]
	orr	r3, r3, #1
	str	r3, [r2, #4]
	adds	r5, #8
	bl	__malloc_unlock
	b	lab431
lab421: 	adds	r1, r5, r6
	mov	r0, r4
	orr	r6, r6, #1
	orr	r4, r3, #1
	str	r6, [r5, #4]
	strd	r1, r1, [r7, #16]
	strd	ip, ip, [r1, #8]
	str	r4, [r1, #4]
	str	r3, [r5, r2]
	bl	__malloc_unlock
	adds	r5, #8
	b	lab431
lab449: 	lsrs	r3, r2, #6
	add	r1, r3, #57	
	lsls	r1, r1, #3
	adds	r3, #56	
	b	lab460
lab440: 	cmp	r5, r7
	beq	lab461
lab439: 	ldr	r5, [r7, #8]
	ldr	r0, [r5, #4]
lab447: 	bic	r8, r0, #3
	cmp	r6, r8
	sub	r3, r8, r6
	bhi	lab462
	cmp	r3, #15
	bgt	lab437
lab462: 	mov	r0, r4
	bl	__malloc_unlock
	movs	r5, #0
	b	lab431
lab455: 	add	r0, r3, #92	
	add	ip, r3, #91	
	lsls	r3, r0, #3
	b	lab432
lab464: 	cmp	r3, r9
	bne	lab463
lab458: 	tst	r0, #3
	add	r0, r0, #4294967295	
	bne	lab464
	ldr	r3, [r7, #4]
	bic	r3, r3, r1
	str	r3, [r7, #4]
lab478: 	cmp	r1, r3
	bhi	lab424
	cbnz	r1, lab465
	b	lab424
lab466: 	add	lr, lr, #4
lab465: 	tst	r1, r3
	beq	lab466
	mov	r0, lr
	b	lab425
lab438: 	add	r8, r3, #16
	b	lab467
lab451: 	asrs	r2, r3, #2
	mov	r8, #1
	ldr	r3, [r7, #4]
	lsl	r2, r8, r2
	orrs	r2, r3
	str	r2, [r7, #4]
	b	lab468
lab442: 	add	r1, r2, r8
	negs	r1, r1
	ubfx	sl, r1, #0, #12
	mov	r1, sl
	mov	r0, r4
	str	r2, [sp, #0]
push {r1, r2}
	mov.w r1, #4035
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4035
	mov.w r2, #1610612736 
	ldrd	r2, r3, [sp]
	bne	lab469
	mov	sl, fp
	b	lab470
lab450: 	cmp	r3, #84	
	bhi	lab471
	lsrs	r3, r2, #12
	add	r1, r3, #111	
	lsls	r1, r1, #3
	adds	r3, #110	
	b	lab460
lab456: 	cmp	r3, #340	
	bhi	lab472
	lsrs	r3, r6, #15
	add	r0, r3, #120	
	add	ip, r3, #119	
	lsls	r3, r0, #3
	b	lab432
lab461: 	ldr	r3, =__malloc_current_mallinfo	
	ldr	r0, [r3, #0]
	add	r0, r8
	str	r0, [r3, #0]
	b	lab473
lab441: 	ubfx	ip, sl, #0, #12
	cmp	ip, #0
	bne	lab473
	ldr	r5, [r7, #8]
	add	r8, r9
	orr	r0, r8, #1
	str	r0, [r5, #4]
	b	lab474
lab444: 	mov	r5, r2
	b	lab474
lab445: 	movs	r3, #1
	str	r3, [r2, #4]
	b	lab462
lab471: 	cmp	r3, #340	
	bhi	lab475
	lsrs	r3, r2, #15
	add	r1, r3, #120	
	lsls	r1, r1, #3
	adds	r3, #119	
	b	lab460
lab472: 	movw	r2, #1364	
	cmp	r3, r2
	bhi	lab476
	lsrs	r3, r6, #18
	add	r0, r3, #125	
	add	ip, r3, #124	
	lsls	r3, r0, #3
	b	lab432
lab443: 	sub	fp, fp, #8
	add	r8, fp
	sub	r8, r8, r2
	mov	sl, #0
	b	lab470
lab446: 	add	r1, r5, #8
	mov	r0, r4
	str	r3, [sp, #0]
push {r1, r2}
	mov.w r1, #5684
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5684
	mov.w r2, #1610612736 
	ldr	r3, [sp, #0]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #0]
	b	lab474
lab475: 	movw	r1, #1364	
	cmp	r3, r1
	bhi	lab477
	lsrs	r3, r2, #18
	add	r1, r3, #125	
	lsls	r1, r1, #3
	adds	r3, #124	
	b	lab460
lab476: 	mov	r3, #1016	
	movs	r0, #127	
	mov	ip, #126	
	b	lab432
lab477: 	mov	r1, #1016	
	movs	r3, #126	
	b	lab460
lab463: 	ldr	r3, [r7, #4]
	b	lab478
	.ltorg
__ascii_mbtowc:
	sub	sp, #8
	cbz	r1, lab479
	cbz	r2, lab480
lab482: 	ldrb	r3, [r2, #0]
	str	r3, [r1, #0]
	ldrb	r2, [r2, #0]
	subs	r0, r2, #0
	it	ne
	movne	r0, #1
lab483: 	bx	lr
lab479: 	add	r1, sp, #4
	cmp	r2, #0
	bne	lab482
lab480: 	mov	r0, r2
	add	sp, #8
	bx	lr
lab481: 	mvn	r0, #1
	b	lab483
	nop
memchr:
	and	r1, r1, #255	
	cmp	r2, #16
	blt	lab484
	tst	r0, #7
	beq	lab485
lab488: 	subs	r2, #1
	cmp	r3, r1
	beq	lab486
	tst	r0, #7
	cbz	r2, lab487
	bne	lab488
lab485: 	push	{r4, r5, r6, r7}
	orr	r1, r1, r1, lsl #8
	orr	r1, r1, r1, lsl #16
	bic	r4, r2, #7
	mvns	r7, #0
	movs	r3, #0
lab490: 	subs	r4, #8
	eor	r5, r5, r1
	eor	r6, r6, r1
	uadd8	r5, r5, r7
	sel	r5, r3, r7
	uadd8	r6, r6, r7
	sel	r6, r5, r7
	cbnz	r6, lab489
	bne	lab490
	pop	{r4, r5, r6, r7}
	and	r1, r1, #255	
	and	r2, r2, #7
lab484: 	cbz	r2, lab487
lab491: 	subs	r2, #1
	eor	r3, r3, r1
	cbz	r3, lab486
	bne	lab491
lab487: 	movs	r0, #0
	bx	lr
lab486: 	subs	r0, #1
	bx	lr
lab489: 	cmp	r5, #0
	itte	eq
	moveq	r5, r6
	subeq	r0, #3
	subne	r0, #7
	tst	r5, #1
	bne	lab492
	adds	r0, #1
	tst	r5, #256	
	ittt	eq
	addeq	r0, #1
	tsteq	r5, #98304	
	addeq	r0, #1
lab492: 	pop	{r4, r5, r6, r7}
	subs	r0, #1
	bx	lr
	nop
memmove:
	cmp	r0, r1
	bls	lab493
	adds	r3, r1, r2
	cmp	r3, r0
	bls	lab493
	add	ip, r0, r2
	cbz	r2, lab494
	mov	r2, ip
lab495: 	strb	ip, [r2, #-1]!
	cmp	r1, r3
	bne	lab495
	cpsid f
	push {r1, r2}
	mov.w r1, #3428
	mov.w r2, #1610612736 
lab493: 	cmp	r2, #15
	bhi	lab496
	mov	r3, r0
	add	ip, r2, #4294967295	
	cbz	r2, lab494
lab504: 	subs	r3, #1
	add	ip, r1
lab497: 	strb	r2, [r3, #1]!
	cmp	r1, ip
	bne	lab497
lab494:	cpsid f
	push {r1, r2}
	mov.w r1, #6992
	mov.w r2, #1610612736 
lab496: 	orr	r3, r0, r1
	lsls	r3, r3, #30
	bne	lab498
	sub	r3, r2, #16
	push	{r4, r5, r6, lr}
	add	ip, r1, #32
	bic	r5, r3, #15
	add	lr, r1, #16
	add	r4, r0, #16
	add	ip, r5
	lsrs	r3, r3, #4
lab499: 	str	r5, [r4, #-16]
	ldr	r5, [lr, #-12]
	str	r5, [r4, #-12]
	ldr	r5, [lr, #-8]
	str	r5, [r4, #-8]
	ldr	r5, [lr, #-4]
	str	r5, [r4, #-4]
	add	lr, lr, #16
	cmp	lr, ip
	add	r4, r4, #16
	bne	lab499
	adds	r3, #1
	tst	r2, #12
	add	r1, r1, r3, lsl #4
	and	r4, r2, #15
	add	r3, r0, r3, lsl #4
	beq	lab500
	subs	r4, #4
	bic	r6, r4, #3
	mov	ip, r4, lsr #2
	add	r6, r3
	subs	r4, r3, #4
	mov	lr, r1
lab501: 	str	r5, [r4, #4]!
	cmp	r4, r6
	bne	lab501
	add	r4, ip, #1
	and	r2, r2, #3
	add	r3, r3, r4, lsl #2
	add	r1, r1, r4, lsl #2
lab505: 	cbz	r2, lab502
	add	ip, ip, #1
	subs	r3, #1
	add	ip, r1
lab503: 	strb	r2, [r3, #1]!
	cmp	r1, ip
	bne	lab503
lab502:	cpsid f
	push {r1, r2}
	mov.w r1, #7348
	mov.w r2, #1610612736 
lab498: 	add	ip, r2, #4294967295	
	mov	r3, r0
	b	lab504
lab500: 	mov	r2, r4
	b	lab505
__malloc_lock:
	ldr	r0, =__lock___malloc_recursive_mutex	
	b	__retarget_lock_acquire_recursive
	nop
	.ltorg
__malloc_unlock:
	ldr	r0, =__lock___malloc_recursive_mutex	
	b	__retarget_lock_release_recursive
	nop
	.ltorg
_realloc_r:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r7, r2
	cmp	r1, #0
	beq	lab506
	add	r5, r7, #11
	mov	r8, r0
	mov	r4, r1
	bl	__malloc_lock
	cmp	r5, #22
	bhi	lab507
	movs	r5, #16
	mov	r2, r5
lab520: 	bhi	lab508
	ldr	r1, [r4, #-4]
	bic	r6, r1, #3
	cmp	r6, r2
	sub	r9, r4, #8
	bge	lab509
	ldr	r3, =__malloc_av_	
	ldr	ip, [r3, #8]
	add	r0, r9, r6
	cmp	ip, r0
	beq	lab510
	ldr	ip, [r0, #4]
	bic	r3, ip, #1
	add	r3, r0
	ldr	r3, [r3, #4]
	lsls	r3, r3, #31
	bmi	lab511
	bic	ip, ip, #3
	add	r3, r6, ip
	cmp	r3, r2
	bge	lab512
	lsls	r3, r1, #31
	bmi	lab513
	ldr	r3, [r4, #-8]
	sub	sl, r9, r3
	ldr	r3, [sl, #4]
	bic	r1, r3, #3
	add	ip, r1
	add	ip, r6
	cmp	ip, r2
	bge	lab514
lab522: 	cmp	r3, r2
	bge	lab515
lab513: 	mov	r1, r7
	mov	r0, r8
push {r1, r2}
	mov.w r1, #2169
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2169
	mov.w r2, #1610612736 
	cbz	r0, lab516
	ldr	r3, [r4, #-4]
	bic	r3, r3, #1
	add	r3, r9
	sub	r2, r0, #8
	cmp	r3, r2
	beq	lab517
	subs	r2, r6, #4
	cmp	r2, #36	
	bhi	lab518
	cmp	r2, #19
	bhi	lab519
	mov	r3, r0
	mov	r2, r4
lab530: 	str	r1, [r3, #0]
	ldr	r1, [r2, #4]
	str	r1, [r3, #4]
	ldr	r2, [r2, #8]
	str	r2, [r3, #8]
lab534: 	mov	r0, r8
push {r1, r2}
	mov.w r1, #6736
	mov.w r2, #1610612736 
lab516:	push {r1, r2}
	mov.w r1, #6736
	mov.w r2, #1610612736 
	bl	__malloc_unlock
	mov	r0, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6412
	mov.w r2, #1610612736 
lab507: 	bic	r5, r5, #7
	cmp	r5, #0
	mov	r2, r5
	bge	lab520
lab508: 	movs	r3, #12
	str	r3, [r8]
	movs	r7, #0
lab528: 	cpsid f
	push {r1, r2}
	mov.w r1, #4198
	mov.w r2, #1610612736 
lab512: 	mov	r6, r3
	ldrd	r2, r3, [r0, #8]
	str	r3, [r2, #12]
	str	r2, [r3, #8]
lab509: 	subs	r3, r6, r5
	cmp	r3, #15
	bhi	lab521
	ldr	r3, [r9, #4]
	and	r3, r3, #1
	orrs	r3, r6
	add	r6, r9
	str	r3, [r9, #4]
	ldr	r3, [r6, #4]
	orr	r3, r3, #1
	str	r3, [r6, #4]
lab523: 	mov	r7, r4
	bl	__malloc_unlock
	mov	r0, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6965
	mov.w r2, #1610612736 
lab511: 	lsls	r1, r1, #31
	bmi	lab513
	ldr	r3, [r4, #-8]
	sub	sl, r9, r3
	ldr	r1, [sl, #4]
	bic	r1, r1, #3
	b	lab522
lab506: 	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r1, r2
	b	_malloc_r
lab521: 	ldr	r1, [r9, #4]
	and	r1, r1, #1
	orrs	r1, r5
	str	r1, [r9, #4]
	add	r1, r9, r5
	add	r6, r9
	orr	r3, r3, #1
	str	r3, [r1, #4]
	ldr	r3, [r6, #4]
	orr	r3, r3, #1
	adds	r1, #8
	str	r3, [r6, #4]
	mov	r0, r8
push {r1, r2}
	mov.w r1, #2611
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2611
	mov.w r2, #1610612736 
lab510: 	ldr	r0, [ip, #4]
	bic	fp, r0, #3
	add	ip, r6, fp
	add	r0, r5, #16
	cmp	ip, r0
	bge	lab524
	lsls	r1, r1, #31
	bmi	lab513
	ldr	r1, [r4, #-8]
	sub	sl, r9, r1
	ldr	r1, [sl, #4]
	bic	r1, r1, #3
	add	fp, r1
	add	fp, r6
	cmp	r0, fp
	bgt	lab522
	mov	r7, sl
	ldr	r1, [sl, #12]
	ldr	r0, [r7, #8]!
	subs	r2, r6, #4
	cmp	r2, #36	
	str	r1, [r0, #12]
	str	r0, [r1, #8]
	bhi	lab525
	cmp	r2, #19
	bls	lab526
	ldr	r1, [r4, #0]
	str	r1, [sl, #8]
	ldr	r1, [r4, #4]
	str	r1, [sl, #12]
	cmp	r2, #27
	bhi	lab527
	adds	r4, #8
	add	r2, sl, #16
lab543: 	str	r1, [r2, #0]
	ldr	r1, [r4, #4]
	str	r1, [r2, #4]
	ldr	r1, [r4, #8]
	str	r1, [r2, #8]
lab544: 	sub	r2, fp, r5
	orr	r2, r2, #1
	str	r1, [r3, #8]
	str	r2, [r1, #4]
	ldr	r3, [sl, #4]
	and	r3, r3, #1
	orrs	r5, r3
	mov	r0, r8
	str	r5, [sl, #4]
	bl	__malloc_unlock
	b	lab528
lab519: 	ldr	r3, [r4, #0]
	str	r3, [r0, #0]
	ldr	r3, [r4, #4]
	str	r3, [r0, #4]
	cmp	r2, #27
	bhi	lab529
	add	r2, r4, #8
	add	r3, r0, #8
	b	lab530
lab524: 	add	r2, r9, r5
	str	r2, [r3, #8]
	sub	r3, ip, r5
	orr	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [r4, #-4]
	and	r3, r3, #1
	orrs	r5, r3
	mov	r0, r8
	str	r5, [r4, #-4]
	bl	__malloc_unlock
	mov	r7, r4
	b	lab528
lab517: 	ldr	r3, [r0, #-4]
	bic	r3, r3, #3
	add	r6, r3
	b	lab509
lab515: 	mov	r7, sl
	ldr	r1, [sl, #12]
	ldr	r0, [r7, #8]!
	subs	r2, r6, #4
	cmp	r2, #36	
	str	r1, [r0, #12]
	str	r0, [r1, #8]
	bhi	lab531
	cmp	r2, #19
	bls	lab532
	ldr	r1, [r4, #0]
	str	r1, [sl, #8]
	ldr	r1, [r4, #4]
	str	r1, [sl, #12]
	cmp	r2, #27
	bhi	lab533
	adds	r4, #8
	add	r2, sl, #16
lab539: 	ldr	r3, [r4, #0]
	str	r3, [r2, #0]
	ldr	r3, [r4, #4]
	str	r3, [r2, #4]
	ldr	r3, [r4, #8]
	str	r3, [r2, #8]
	mov	r9, sl
	mov	r4, r7
	b	lab509
lab518: 	mov	r1, r4
push {r1, r2}
	mov.w r1, #5172
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5172
	mov.w r2, #1610612736 
lab514: 	ldrd	r1, r3, [r0, #8]
	mov	r7, sl
	str	r3, [r1, #12]
	str	r1, [r3, #8]
	ldr	r1, [r7, #8]!
	ldr	r3, [sl, #12]
	str	r3, [r1, #12]
	subs	r2, r6, #4
	cmp	r2, #36	
	str	r1, [r3, #8]
	bhi	lab535
	cmp	r2, #19
	bls	lab536
	ldr	r3, [r4, #0]
	str	r3, [sl, #8]
	ldr	r3, [r4, #4]
	str	r3, [sl, #12]
	cmp	r2, #27
	bhi	lab537
	adds	r4, #8
	add	r3, sl, #16
lab540: 	str	r2, [r3, #0]
	ldr	r2, [r4, #4]
	str	r2, [r3, #4]
	ldr	r2, [r4, #8]
	str	r2, [r3, #8]
	mov	r6, ip
	mov	r9, sl
	mov	r4, r7
	b	lab509
lab529: 	ldr	r3, [r4, #8]
	str	r3, [r0, #8]
	ldr	r3, [r4, #12]
	str	r3, [r0, #12]
	cmp	r2, #36	
	beq	lab538
	add	r2, r4, #16
	add	r3, r0, #16
	b	lab530
lab532: 	mov	r2, r7
	b	lab539
lab531: 	mov	r1, r4
	mov	r0, r7
	mov	r6, r3
	mov	r9, sl
push {r1, r2}
	mov.w r1, #381
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #381
	mov.w r2, #1610612736 
	b	lab509
lab536: 	mov	r3, r7
	b	lab540
lab535: 	mov	r1, r4
	mov	r0, r7
	mov	r6, ip
	mov	r9, sl
push {r1, r2}
	mov.w r1, #3382
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3382
	mov.w r2, #1610612736 
	b	lab509
	.ltorg
lab533: 	ldr	r1, [r4, #8]
	str	r1, [sl, #16]
	ldr	r1, [r4, #12]
	str	r1, [sl, #20]
	cmp	r2, #36	
	beq	lab541
	adds	r4, #16
	add	r2, sl, #24
	b	lab539
lab538: 	ldr	r3, [r4, #16]
	str	r3, [r0, #16]
	ldr	r1, [r4, #20]
	str	r1, [r0, #20]
	add	r2, r4, #24
	add	r3, r0, #24
	b	lab530
lab537: 	ldr	r3, [r4, #8]
	str	r3, [sl, #16]
	ldr	r3, [r4, #12]
	str	r3, [sl, #20]
	cmp	r2, #36	
	beq	lab542
	adds	r4, #16
	add	r3, sl, #24
	b	lab540
lab526: 	mov	r2, r7
	b	lab543
lab525: 	mov	r1, r4
	mov	r0, r7
push {r1, r2}
	mov.w r1, #7381
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7381
	mov.w r2, #1610612736 
	b	lab544
lab541: 	ldr	r2, [r4, #16]
	str	r2, [sl, #24]
	ldr	r2, [r4, #20]
	str	r2, [sl, #28]
	adds	r4, #24
	add	r2, sl, #32
	b	lab539
lab527: 	ldr	r1, [r4, #8]
	str	r1, [sl, #16]
	ldr	r1, [r4, #12]
	str	r1, [sl, #20]
	cmp	r2, #36	
	beq	lab545
	adds	r4, #16
	add	r2, sl, #24
	b	lab543
lab542: 	ldr	r3, [r4, #16]
	str	r3, [sl, #24]
	ldr	r3, [r4, #20]
	str	r3, [sl, #28]
	adds	r4, #24
	add	r3, sl, #32
	b	lab540
lab545: 	ldr	r2, [r4, #16]
	str	r2, [sl, #24]
	ldr	r2, [r4, #20]
	str	r2, [sl, #28]
	adds	r4, #24
	add	r2, sl, #32
	b	lab543
	nop
	.ltorg
_sbrk_r:
	push	{r3, r4, r5, lr}
	ldr	r5, =errno	
	movs	r2, #0
	mov	r4, r0
	mov	r0, r1
	str	r2, [r5, #0]
	bl	_sbrk
	adds	r3, r0, #1
	beq	lab546
lab547:	cpsid f
	push {r1, r2}
	mov.w r1, #7987
	mov.w r2, #1610612736 
lab546: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab547
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #4368
	mov.w r2, #1610612736 
	.ltorg
raise:
	push	{r3, r4, r5, lr}
	ldr	r3, =_impure_ptr	
	cmp	r0, #31
	ldr	r5, [r3, #0]
	bhi	lab548
	ldr	r2, [r5, #732]	
	mov	r4, r0
	cbz	r2, lab549
	ldr	r3, [r2, r0, lsl #2]
	cbz	r3, lab549
	cmp	r3, #1
	beq	lab550
	adds	r1, r3, #1
	beq	lab551
	movs	r5, #0
	str	r5, [r2, r0, lsl #2]
	blx	r3
	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #6769
	mov.w r2, #1610612736 
lab549: 	mov	r0, r5
	bl	_getpid_r
	mov	r2, r4
	mov	r1, r0
	mov	r0, r5
	ldmia	sp!, {r3, r4, r5, lr}
	b	_kill_r
lab551: 	movs	r3, #22
	str	r3, [r5, #0]
	movs	r0, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #6745
	mov.w r2, #1610612736 
lab550: 	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #2758
	mov.w r2, #1610612736 
lab548: 	movs	r3, #22
	str	r3, [r5, #0]
	mov	r0, #4294967295	
	cpsid f
	push {r1, r2}
	mov.w r1, #7429
	mov.w r2, #1610612736 
	nop
	.ltorg
_kill_r:
	push	{r4, r5, r6, lr}
	mov	r4, r1
	ldr	r5, =errno	
	mov	r3, r0
	movs	r6, #0
	mov	r0, r4
	mov	r1, r2
	mov	r4, r3
	str	r6, [r5, #0]
	bl	_kill
	adds	r3, r0, #1
	beq	lab552
lab553:	cpsid f
	push {r1, r2}
	mov.w r1, #4011
	mov.w r2, #1610612736 
lab552: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab553
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #4365
	mov.w r2, #1610612736 
	nop
	.ltorg
_getpid_r:
	b	_getpid
__sread:
	push	{r4, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #14]
	bl	_read_r
	push {r1, r2}
	mov.w r1, #3368
	mov.w r2, #1610612736 
	blt	lab554
	ldr	r3, [r4, #80]	
	add	r3, r0
	str	r3, [r4, #80]	
	pop	{r4, pc}
lab554: 	ldrh	r3, [r4, #12]
	bic	r3, r3, #4096	
	strh	r3, [r4, #12]
	pop	{r4, pc}
	nop
__swrite:
	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #12]
	mov	r7, r3
	lsls	r3, r1, #23
	mov	r5, r0
	mov	r6, r2
	bmi	lab555
lab556: 	strh	r1, [r4, #12]
	mov	r3, r7
	ldrsh	r1, [r4, #14]
	mov	r2, r6
	mov	r0, r5
	ldmia	sp!, {r4, r5, r6, r7, r8, lr}
	b	_write_r
lab555: 	ldrsh	r1, [r4, #14]
	movs	r3, #2
	movs	r2, #0
push {r1, r2}
	mov.w r1, #6009
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6009
	mov.w r2, #1610612736 
	b	lab556
	nop
__sseek:
	push	{r4, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #14]
push {r1, r2}
	mov.w r1, #4394
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4394
	mov.w r2, #1610612736 
	adds	r2, r0, #1
	itee	eq
	biceq	r3, r3, #4096	
	orrne	r3, r3, #4096	
	strne	r0, [r4, #80]	
	strh	r3, [r4, #12]
	pop	{r4, pc}
__sclose:
	ldrsh	r1, [r1, #14]
	b	_close_r
strlen:
	pld	[r0]
	strd	r4, r5, [sp, #-8]!
	bic	r1, r0, #7
	mvn	ip, #0
	ands	r4, r0, #7
	pld	[r1, #32]
	bne	lab557
	mov	r4, #0
	mvn	r0, #7
lab559: 	pld	[r1, #64]	
	add	r0, r0, #8
lab560: 	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab558
	ldrd	r2, r3, [r1, #8]
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab558
	ldrd	r2, r3, [r1, #16]
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab558
	ldrd	r2, r3, [r1, #24]
	add	r1, r1, #32
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cmp	r3, #0
	beq	lab559
lab558: 	cmp	r2, #0
	itt	eq
	addeq	r0, #4
	moveq	r2, r3
	rev	r2, r2
	clz	r2, r2
	ldrd	r4, r5, [sp], #8
	add	r0, r0, r2, lsr #3
	bx	lr
lab557: 	ldrd	r2, r3, [r1]
	and	r5, r4, #3
	rsb	r0, r4, #0
	mov	r5, r5, lsl #3
	tst	r4, #4
	pld	[r1, #64]	
	lsl	r5, ip, r5
	orn	r2, r2, r5
	itt	ne
	ornne	r3, r3, r5
	movne	r2, ip
	mov	r4, #0
	b	lab560
strncpy:
	push	{r4, r5, lr}
	orr	r4, r0, r1
	lsls	r3, r4, #30
	bne	lab561
	cmp	r2, #3
	bhi	lab562
lab561: 	mov	ip, r0
lab566: 	b	lab563
lab565: 	strb	r1, [r3], #1
	subs	r4, r2, #1
	cbz	r1, lab564
	mov	ip, r3
	mov	r2, r4
lab563: 	mov	r3, ip
	cmp	r2, #0
	bne	lab565
lab568:	cpsid f
	push {r1, r2}
	mov.w r1, #5993
	mov.w r2, #1610612736 
lab562: 	mov	r3, r1
	mov	ip, r0
lab567: 	ldr	r5, [r3], #4
	sub	r4, r5, #16843009	
	bic	r4, r4, r5
	tst	r4, #2155905152	
	bne	lab566
	subs	r2, #4
	cmp	r2, #3
	str	r5, [ip], #4
	mov	r1, r3
	bhi	lab567
	b	lab566
lab564: 	add	r2, ip
	cmp	r4, #0
	beq	lab568
lab569: 	cmp	r3, r2
	bne	lab569
	cpsid f
	push {r1, r2}
	mov.w r1, #5353
	mov.w r2, #1610612736 
__swbuf_r:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r5, r1
	mov	r4, r2
	mov	r6, r0
	cbz	r0, lab570
	ldr	r3, [r0, #56]	
	cmp	r3, #0
	beq	lab571
lab570: 	ldrsh	r2, [r4, #12]
	ldr	r3, [r4, #24]
	str	r3, [r4, #8]
	lsls	r7, r2, #28
	uxth	r0, r2
	bpl	lab572
	ldr	r3, [r4, #16]
	cbz	r3, lab572
	uxtb	r5, r5
	lsls	r1, r0, #18
	mov	r7, r5
	bpl	lab573
lab578: 	ldr	r1, [r4, #20]
	subs	r3, r2, r3
	cmp	r1, r3
	ble	lab574
lab579: lab580: 	subs	r1, #1
	str	r1, [r4, #8]
	adds	r1, r2, #1
	str	r1, [r4, #0]
	strb	r5, [r2, #0]
	ldr	r2, [r4, #20]
	cmp	r2, r3
	beq	lab575
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #31
	bpl	lab576
	cmp	r5, #10
	beq	lab575
lab576: 	mov	r0, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #3787
	mov.w r2, #1610612736 
lab572: 	mov	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #2741
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2741
	mov.w r2, #1610612736 
	ldrsh	r2, [r4, #12]
	ldr	r3, [r4, #16]
	uxth	r0, r2
	uxtb	r5, r5
	lsls	r1, r0, #18
	mov	r7, r5
	bmi	lab578
lab573: 	orr	r2, r2, #8192	
	strh	r2, [r4, #12]
	ldr	r2, [r4, #100]	
	ldr	r1, [r4, #20]
	bic	r2, r2, #8192	
	str	r2, [r4, #100]	
	ldr	r2, [r4, #0]
	subs	r3, r2, r3
	cmp	r1, r3
	bgt	lab579
lab574: 	mov	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #5511
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5511
	mov.w r2, #1610612736 
	ldr	r2, [r4, #0]
	movs	r3, #1
	b	lab580
lab571: 	bl	__sinit
	b	lab570
lab575: 	mov	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #7328
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7328
	mov.w r2, #1610612736 
	beq	lab576
lab577: 	mov	r7, #4294967295	
	b	lab576
_wcrtomb_r:
	push	{r4, r5, r6, lr}
	mov	r5, r0
	sub	sp, #16
	mov	r4, r3
	cbz	r1, lab581
	ldr	r6, =__global_locale	
	ldr	r6, [r6, #224]	
	cpsid f
	push {r1, r2}
	mov.w r1, #7444
	mov.w r2, #1610612736 
	adds	r3, r0, #1
	beq	lab582
lab583: 	cpsid f
	push {r1, r2}
	mov.w r1, #3851
	mov.w r2, #1610612736 
lab581: 	mov	r2, r1
	ldr	r1, =__global_locale	
	ldr	r6, [r1, #224]	
	add	r1, sp, #4
	cpsid f
	push {r1, r2}
	mov.w r1, #7955
	mov.w r2, #1610612736 
	adds	r3, r0, #1
	bne	lab583
lab582: 	movs	r2, #0
	movs	r3, #138	
	str	r2, [r4, #0]
	str	r3, [r5, #0]
	add	sp, #16
	cpsid f
	push {r1, r2}
	mov.w r1, #1035
	mov.w r2, #1610612736 
	nop
	.ltorg
__ascii_wctomb:	push {r1, r2}
	mov.w r1, #6848
	mov.w r2, #1610612736 
	cmp	r2, #255	
	bhi	lab585
	strb	r2, [r1, #0]
	movs	r0, #1
	bx	lr
lab585: 	movs	r3, #138	
	str	r3, [r0, #0]
	mov	r0, #4294967295	
	bx	lr
lab584: 	mov	r0, r1
	bx	lr
	nop
_write_r:
	push	{r3, r4, r5, lr}
	mov	r4, r1
	ldr	r5, =errno	
	mov	ip, r0
	mov	r1, r2
	mov	r0, r4
	mov	r2, r3
	movs	r3, #0
	str	r3, [r5, #0]
	mov	r4, ip
	bl	_write
	adds	r3, r0, #1
	beq	lab586
lab587: lab586: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab587
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
	.ltorg
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
	cbz	r4, lab588
lab592: 	cmp	r5, #31
	bgt	lab589
	cbnz	r6, lab590
lab591: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab593:	cpsid f
	push {r1, r2}
	mov.w r1, #2218
	mov.w r2, #1610612736 
lab590: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab591
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab591
lab588: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab592
lab589: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab593
	.ltorg
_close_r:
	push	{r3, r4, r5, lr}
	ldr	r5, =errno	
	movs	r2, #0
	mov	r4, r0
	mov	r0, r1
	str	r2, [r5, #0]
	bl	_close
	adds	r3, r0, #1
	beq	lab594
lab595: lab594: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab595
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
	.ltorg
_fclose_r:
	push	{r4, r5, r6, lr}
	cmp	r1, #0
	beq	lab596
	mov	r6, r0
	mov	r4, r1
	cbz	r0, lab597
	ldr	r3, [r0, #56]	
	cmp	r3, #0
	beq	lab598
lab597: 	ldr	r3, [r4, #100]	
	lsls	r0, r3, #31
	bpl	lab599
lab608: 	cmp	r3, #0
	beq	lab596
lab606: 	mov	r0, r6
push {r1, r2}
	mov.w r1, #3827
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3827
	mov.w r2, #1610612736 
	mov	r5, r0
	cbz	r3, lab600
	ldr	r1, [r4, #28]
	mov	r0, r6
	blx	r3
	cmp	r0, #0
	it	lt
	movlt	r5, #4294967295	
lab600: 	ldrh	r3, [r4, #12]
	lsls	r2, r3, #24
	bmi	lab601
lab609: 	cbz	r1, lab602
	add	r3, r4, #64	
	cmp	r1, r3
	beq	lab603
	mov	r0, r6
push {r1, r2}
	mov.w r1, #3145
	mov.w r2, #1610612736 
lab603:	push {r1, r2}
	mov.w r1, #3145
	mov.w r2, #1610612736 
	str	r3, [r4, #48]	
lab602: 	ldr	r1, [r4, #68]	
	cbz	r1, lab604
	mov	r0, r6
push {r1, r2}
	mov.w r1, #2348
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2348
	mov.w r2, #1610612736 
	str	r3, [r4, #68]	
lab604: 	bl	__sfp_lock_acquire
	ldr	r3, [r4, #100]	
	movs	r2, #0
	lsls	r3, r3, #31
	strh	r2, [r4, #12]
	bpl	lab605
lab610: 	bl	__retarget_lock_close_recursive
	bl	__sfp_lock_release
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab599: 	ldrh	r3, [r4, #12]
	lsls	r1, r3, #22
	bmi	lab606
	ldr	r0, [r4, #88]	
	bl	__retarget_lock_acquire_recursive
	ldrsh	r3, [r4, #12]
	cmp	r3, #0
	bne	lab606
	ldr	r5, [r4, #100]	
	ands	r5, r5, #1
	beq	lab607
lab596: 	movs	r5, #0
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab598: 	bl	__sinit
	ldr	r3, [r4, #100]	
	lsls	r0, r3, #31
	bmi	lab608
	b	lab599
lab607: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab601: 	ldr	r1, [r4, #16]
	mov	r0, r6
push {r1, r2}
	mov.w r1, #2259
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2259
	mov.w r2, #1610612736 
lab605: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	b	lab610
_fstat_r:
	push	{r4, r5, r6, lr}
	mov	r4, r1
	ldr	r5, =errno	
	mov	r3, r0
	movs	r6, #0
	mov	r0, r4
	mov	r1, r2
	mov	r4, r3
	str	r6, [r5, #0]
	bl	_fstat
	adds	r3, r0, #1
	beq	lab611
lab612:	cpsid f
	push {r1, r2}
	mov.w r1, #4099
	mov.w r2, #1610612736 
lab611: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab612
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #7055
	mov.w r2, #1610612736 
	nop
	.ltorg
_isatty_r:
	push	{r3, r4, r5, lr}
	ldr	r5, =errno	
	movs	r2, #0
	mov	r4, r0
	mov	r0, r1
	str	r2, [r5, #0]
	bl	_isatty
	adds	r3, r0, #1
	beq	lab613
lab614:	cpsid f
	push {r1, r2}
	mov.w r1, #713
	mov.w r2, #1610612736 
lab613: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab614
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #3235
	mov.w r2, #1610612736 
	.ltorg
_lseek_r:
	push	{r3, r4, r5, lr}
	mov	r4, r1
	ldr	r5, =errno	
	mov	ip, r0
	mov	r1, r2
	mov	r0, r4
	mov	r2, r3
	movs	r3, #0
	str	r3, [r5, #0]
	mov	r4, ip
	bl	_lseek
	adds	r3, r0, #1
	beq	lab615
lab616:	cpsid f
	push {r1, r2}
	mov.w r1, #824
	mov.w r2, #1610612736 
lab615: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab616
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #3682
	mov.w r2, #1610612736 
	.ltorg
_read_r:
	push	{r3, r4, r5, lr}
	mov	r4, r1
	ldr	r5, =errno	
	mov	ip, r0
	mov	r1, r2
	mov	r0, r4
	mov	r2, r3
	movs	r3, #0
	str	r3, [r5, #0]
	mov	r4, ip
	bl	_read
	adds	r3, r0, #1
	beq	lab617
lab618:	cpsid f
	push {r1, r2}
	mov.w r1, #6134
	mov.w r2, #1610612736 
lab617: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab618
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #1604
	mov.w r2, #1610612736 
	.ltorg
__aeabi_uldivmod:
	cbnz	r3, lab619
	cbnz	r2, lab619
	cmp	r1, #0
	it	eq
	cmpeq	r0, #0
	itt	ne
	movne	r1, #4294967295	
	movne	r0, #4294967295	
	b	__aeabi_idiv0
lab619: 	sub	ip, sp, #8
	strd	ip, lr, [sp, #-16]!
	bl	__udivmoddi4
	push {r1, r2}
	mov.w r1, #7458
	mov.w r2, #1610612736 
	ldrd	r2, r3, [sp, #8]
	add	sp, #16
	cpsid f
	push {r1, r2}
	mov.w r1, #1862
	mov.w r2, #1610612736 
__udivmoddi4:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r6, [sp, #32]
	mov	r5, r1
	mov	r4, r0
	mov	r8, r1
	cmp	r3, #0
	bne	lab620
	cmp	r2, r1
	mov	ip, r2
	bls	lab621
	clz	r2, r2
	cbz	r2, lab622
	lsl	r3, r1, r2
	rsb	r1, r2, #32
	lsr	r1, r0, r1
	lsl	ip, ip, r2
	orr	r8, r1, r3
	lsls	r4, r2
lab622: 	mov	r5, ip, lsr #16
	lsrs	r1, r4, #16
	udiv	lr, r8, r5
	uxth	r7, ip
	mls	r3, r5, lr, r8
	orr	r3, r1, r3, lsl #16
	mul	r1, lr, r7
	cmp	r1, r3
	bls	lab623
	adds	r3, ip, r3
	add	r0, lr, #4294967295	
	bcs	lab624
	cmp	r1, r3
	bls	lab624
	sub	lr, lr, #2
	add	r3, ip
lab623: 	subs	r3, r3, r1
	uxth	r4, r4
	udiv	r0, r3, r5
	mls	r3, r5, r0, r3
	orr	r4, r4, r3, lsl #16
	mul	r7, r0, r7
	cmp	r7, r4
	bls	lab625
	adds	r4, ip, r4
	add	r3, r0, #4294967295	
	bcs	lab626
	cmp	r7, r4
	bls	lab626
	add	r4, ip
	subs	r0, #2
lab625: 	subs	r4, r4, r7
	orr	r0, r0, lr, lsl #16
	movs	r1, #0
lab641: 	lsrs	r4, r2
	movs	r3, #0
	strd	r4, r3, [r6]
lab627:	cpsid f
	push {r1, r2}
	mov.w r1, #7235
	mov.w r2, #1610612736 
lab620: 	cmp	r3, r1
	bls	lab628
	cmp	r6, #0
	beq	lab629
	movs	r1, #0
	strd	r0, r5, [r6]
	mov	r0, r1
	cpsid f
	push {r1, r2}
	mov.w r1, #5402
	mov.w r2, #1610612736 
lab628: 	clz	r1, r3
	cmp	r1, #0
	bne	lab630
	cmp	r3, r5
	bcc	lab631
	cmp	r2, r0
	bhi	lab632
lab631: 	subs	r4, r0, r2
	sbc	r3, r5, r3
	movs	r0, #1
	mov	r8, r3
lab655: 	beq	lab627
	strd	r4, r8, [r6]
	b	lab627
lab621: 	cbnz	r2, lab633
	udf	#255	
lab633: 	clz	r2, r2
	cmp	r2, #0
	bne	lab634
	sub	r5, r1, ip
	mov	r7, ip, lsr #16
	uxth	lr, ip
	movs	r1, #1
lab653: 	mls	r0, r7, r3, r5
	lsrs	r5, r4, #16
	orr	r5, r5, r0, lsl #16
	mul	r0, lr, r3
	cmp	r0, r5
	bls	lab635
	adds	r5, ip, r5
	add	r8, r3, #4294967295	
	bcs	lab636
	cmp	r0, r5
	bhi	lab637
lab636: 	mov	r3, r8
lab635: 	subs	r5, r5, r0
	uxth	r4, r4
	udiv	r0, r5, r7
	mls	r5, r7, r0, r5
	orr	r4, r4, r5, lsl #16
	mul	lr, lr, r0
	cmp	lr, r4
	bls	lab638
	adds	r4, ip, r4
	add	r5, r0, #4294967295	
	bcs	lab639
	cmp	lr, r4
	bhi	lab640
lab639: 	mov	r0, r5
lab638: 	sub	r4, r4, lr
	orr	r0, r0, r3, lsl #16
	b	lab641
lab630: 	rsb	r7, r1, #32
	lsls	r3, r1
	lsr	ip, r2, r7
	orr	ip, ip, r3
	lsr	r4, r0, r7
	lsl	r3, r5, r1
	orrs	r4, r3
	lsrs	r5, r7
	mov	r9, ip, lsr #16
	lsl	r3, r0, r1
	udiv	r8, r5, r9
	lsrs	r0, r4, #16
	uxth	lr, ip
	mls	r5, r9, r8, r5
	orr	r5, r0, r5, lsl #16
	mul	r0, r8, lr
	cmp	r0, r5
	lsl	r2, r2, r1
	bls	lab642
	adds	r5, ip, r5
	add	sl, r8, #4294967295	
	bcs	lab643
	cmp	r0, r5
	bls	lab643
	sub	r8, r8, #2
	add	r5, ip
lab642: 	subs	r5, r5, r0
	uxth	r4, r4
	udiv	r0, r5, r9
	mls	r5, r9, r0, r5
	orr	r5, r4, r5, lsl #16
	mul	lr, r0, lr
	cmp	lr, r5
	bls	lab644
	adds	r5, ip, r5
	add	r4, r0, #4294967295	
	bcs	lab645
	cmp	lr, r5
	bls	lab645
	subs	r0, #2
	add	r5, ip
lab644: 	orr	r0, r0, r8, lsl #16
	umull	r9, r4, r0, r2
	sub	r5, r5, lr
	cmp	r5, r4
	mov	r8, r9
	mov	lr, r4
	bcc	lab646
	beq	lab647
lab654: 	subs	r2, r3, r8
	sbc	r5, r5, lr
	lsl	r7, r5, r7
	lsr	r3, r2, r1
	lsrs	r5, r1
	orrs	r7, r3
	strd	r7, r5, [r6]
lab648: 	movs	r1, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #1008
	mov.w r2, #1610612736 
lab634: 	rsb	r3, r2, #32
	lsr	r1, r0, r3
	lsl	ip, ip, r2
	lsr	r3, r5, r3
	lsls	r5, r2
	orrs	r5, r1
	mov	r7, ip, lsr #16
	uxth	lr, ip
	udiv	r1, r3, r7
	mls	r0, r7, r1, r3
	lsrs	r3, r5, #16
	orr	r3, r3, r0, lsl #16
	mul	r0, r1, lr
	cmp	r0, r3
	lsl	r4, r4, r2
	bls	lab649
	adds	r3, ip, r3
	add	r8, r1, #4294967295	
	bcs	lab650
	cmp	r0, r3
	bls	lab650
	subs	r1, #2
	add	r3, ip
lab649: 	subs	r3, r3, r0
	uxth	r5, r5
	udiv	r0, r3, r7
	mls	r3, r7, r0, r3
	orr	r5, r5, r3, lsl #16
	mul	r3, r0, lr
	cmp	r3, r5
	bls	lab651
	adds	r5, ip, r5
	add	r8, r0, #4294967295	
	bcs	lab652
	cmp	r3, r5
	bls	lab652
	subs	r0, #2
	add	r5, ip
lab651: 	subs	r5, r5, r3
	orr	r1, r0, r1, lsl #16
	b	lab653
lab629: 	mov	r1, r6
	mov	r0, r6
	b	lab627
lab624: 	mov	lr, r0
	b	lab623
lab626: 	mov	r0, r3
	b	lab625
lab647: 	cmp	r3, r9
	bcs	lab654
lab646: 	subs	r8, r9, r2
	sbc	lr, r4, ip
	subs	r0, #1
	b	lab654
lab652: 	mov	r0, r8
	b	lab651
lab645: 	mov	r0, r4
	b	lab644
lab650: 	mov	r1, r8
	b	lab649
lab643: 	mov	r8, sl
	b	lab642
lab637: 	subs	r3, #2
	add	r5, ip
	b	lab635
lab632: 	mov	r0, r1
	b	lab655
lab640: 	add	r4, ip
	subs	r0, #2
	b	lab638
__aeabi_idiv0:
	bx	lr
	nop
_close:
	ldr	r3, =errno	
	movs	r2, #88	
	str	r2, [r3, #0]
	mov	r0, #4294967295	
	bx	lr
	.ltorg
_fstat:
	ldr	r3, =errno	
	movs	r2, #88	
	str	r2, [r3, #0]
	mov	r0, #4294967295	
	bx	lr
	.ltorg
_getpid:
	ldr	r3, =errno	
	movs	r2, #88	
	str	r2, [r3, #0]
	mov	r0, #4294967295	
	bx	lr
	.ltorg
_isatty:
	ldr	r3, =errno	
	movs	r2, #88	
	str	r2, [r3, #0]
	movs	r0, #0
	bx	lr
	nop
	.ltorg
_kill:
	ldr	r3, =errno	
	movs	r2, #88	
	str	r2, [r3, #0]
	mov	r0, #4294967295	
	bx	lr
	.ltorg
_lseek:
	ldr	r3, =errno	
	movs	r2, #88	
	str	r2, [r3, #0]
	mov	r0, #4294967295	
	bx	lr
	.ltorg
_read:
	ldr	r3, =errno	
	movs	r2, #88	
	str	r2, [r3, #0]
	mov	r0, #4294967295	
	bx	lr
	.ltorg
_sbrk:
	ldr	r2, =heap_end.0	
	ldr	r1, =0x0001f538	
	ldr	r3, [r2, #0]
	cmp	r3, #0
	it	eq
	moveq	r3, r1
	add	r0, r3
	str	r0, [r2, #0]
	mov	r0, r3
	bx	lr
	.ltorg
_write:
	ldr	r3, =errno	
	movs	r2, #88	
	str	r2, [r3, #0]
	mov	r0, #4294967295	
	bx	lr
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

orig_data:
	.word	0x5a4f324a
	.word	0x46303546
	.word	0x35444c59
	.word	0x59565455
	.word	0x544d5259
	.word	0x4f585630
	.word	0x43563130
	.word	0x494e4635
	.word	0x47433142
	.word	0x544d3231
	.word	0x32545049
	.word	0x30564943
	.word	0x554f4230
	.word	0x52444657
	.word	0x41545941
	.word	0x34494133
	.word	0x58464b32
	.word	0x504b5248
	.word	0x434c3341
	.word	0x41334147
	.word	0x59554c42
	.word	0x524a5851
	.word	0x4e523251
	.word	0x594d5a32
	.word	0x4c505245
	.word	0x43303043
	.word	0x33454658
	.word	0x48334247
	.word	0x3335534d
	.word	0x5a4f494a
	.word	0x42483545
	.word	0x325a5459
	.word	0x47484a45
	.word	0x30494244
	.word	0x4e594d48
	.word	0x3055564f
	.word	0x52585548
	.word	0x424b4632
	.word	0x33435245
	.word	0x495a3145
	.word	0x484f4245
	.word	0x4a435743
	.word	0x52573044
	.word	0x584c4c50
	.word	0x31494435
	.word	0x4e325349
	.word	0x494b3445
	.word	0x34524430
	.word	0x48473545
	.word	0x5a514957
	.word	0x524b4843
	.word	0x52495653
	.word	0x424d5159
	.word	0x484f4a44
	.word	0x42505948
	.word	0x41414131
	.word	0x57484741
	.word	0x5150584f
	.word	0x51425a34
	.word	0x48424b4f
	.word	0x33494f30
	.word	0x34455758
	.word	0x4a41554f
	.word	0x554a4155
	.word	0x554b5147
	.word	0x47455a49
	.word	0x42584653
	.word	0x4b495950
	.word	0x33485147
	.word	0x55324d47
	.word	0x55333241
	.word	0x434a4832
	.word	0x35575458
	.word	0x3547304e
	.word	0x50413335
	.word	0x325a4956
	.word	0x345a4159
	.word	0x4d53564d
	.word	0x4e425152
	.word	0x4f504b58
	.word	0x4b4f4633
	.word	0x354b5535
	.word	0x474f4b52
	.word	0x4c434854
	.word	0x554b3248
	.word	0x44413252
	.word	0x4451424d
	.word	0x4a53414c
	.word	0x46544146
	.word	0x46453355
	.word	0x314c5349
	.word	0x41474f5a
	.word	0x3155514b
	.word	0x5a34564e
	.word	0x43335057
	.word	0x554c5050
	.word	0x445a3450
	.word	0x45493332
	.word	0x49355450
	.word	0x4c4a4642
	.word	0x44483357
	.word	0x4a324653
	.word	0x444c5a55
	.word	0x58595749
	.word	0x51305255
	.word	0x34554350
	.word	0x58485457
	.word	0x5044515a
	.word	0x41534b4e
	.word	0x454a4f50
	.word	0x51485549
	.word	0x3449354b
	.word	0x41504352
	.word	0x31344446
	.word	0x51534658
	.word	0x44355656
	.word	0x50445235
	.word	0x48544d35
	.word	0x4b593041
	.word	0x4c494130
	.word	0x484c5843
	.word	0x53434a31
	.word	0x45435650
	.word	0x4b48424b
	.word	0x525a4b53
	.word	0x70616568
	.word	0x7a69735f
	.word	0x20252065
	.word	0x657a6973
	.word	0x7628666f
	.word	0x2064696f
	.word	0x3d20292a
	.word	0x0030203d
	.word	0x6d6f682f
	.word	0x6c612f65
	.word	0x6d652f65
	.word	0x636e6562
	.word	0x6f692d68
	.word	0x75732f74
	.word	0x726f7070
	.word	0x65622f74
	.word	0x63736265
	.word	0x0000632e
__func__.0:
	.word	0x74696e69
	.word	0x6165685f
	.word	0x65625f70
	.word	0x00736265
	.word	0x7566202c
	.word	0x6974636e
	.word	0x203a6e6f
	.word	0x00000000
	.word	0x65737361
	.word	0x6f697472
	.word	0x2522206e
	.word	0x66202273
	.word	0x656c6961
	.word	0x66203a64
	.word	0x20656c69
	.word	0x22732522
	.word	0x696c202c
	.word	0x2520656e
	.word	0x25732564
	.word	0x00000a73
_global_impure_ptr:
	.word	0x0001c920
	.word	0x33323130
	.word	0x37363534
	.word	0x42413938
	.word	0x46454443
	.word	0x00000000
	.word	0x33323130
	.word	0x37363534
	.word	0x62613938
	.word	0x66656463
	.word	0x00000000
	.word	0x6c756e28
	.word	0x0000296c
blanks.1:
	.word	0x20202020
	.word	0x20202020
	.word	0x20202020
	.word	0x20202020
zeroes.0:
	.word	0x30303030
	.word	0x30303030
	.word	0x30303030
	.word	0x30303030
	.word	0x00000043
	.word	0x49534f50
	.word	0x00000058
	.word	0x0000002e
_ctype_:
	.word	0x20202000
	.word	0x20202020
	.word	0x28282020
	.word	0x20282828
	.word	0x20202020
	.word	0x20202020
	.word	0x20202020
	.word	0x20202020
	.word	0x10108820
	.word	0x10101010
	.word	0x10101010
	.word	0x10101010
	.word	0x04040410
	.word	0x04040404
	.word	0x10040404
	.word	0x10101010
	.word	0x41411010
	.word	0x41414141
	.word	0x01010101
	.word	0x01010101
	.word	0x01010101
	.word	0x01010101
	.word	0x01010101
	.word	0x10101010
	.word	0x42421010
	.word	0x42424242
	.word	0x02020202
	.word	0x02020202
	.word	0x02020202
	.word	0x02020202
	.word	0x02020202
	.word	0x10101010
	.word	0x00000020


	.data

_impure_ptr:
	.word	0x0001c920
	.word	0x00000000
impure_data:
	.word	0x00000000
	.word	0x0001cc0c
	.word	0x0001cc74
	.word	0x0001ccdc
	.word	0x00000001
	.word	0x00000000
	.word	0xabcd330e
	.word	0xe66d1234
	.word	0x0005deec
	.word	0x0000000b
__atexit_recursive_mutex:
	.word	0x0001f4ec
__global_locale:
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x0000beed
	.word	0x0000b59d
	.word	0x00000000
	.word	0x0000c7f8
	.word	0x0000c7f4
	.word	0x0000c760
	.word	0x0000c760
	.word	0x0000c760
	.word	0x0000c760
	.word	0x0000c760
	.word	0x0000c760
	.word	0x0000c760
	.word	0x0000c760
	.word	0x0000c760
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0x0000ffff
	.word	0x53410001
	.word	0x00494943
	.word	0x53410000
	.word	0x00494943
__malloc_av_:
	.word	0x0001ceb8
	.word	0x0001ceb8
	.word	0x0001cec0
	.word	0x0001cec0
	.word	0x0001cec8
	.word	0x0001cec8
	.word	0x0001ced0
	.word	0x0001ced0
	.word	0x0001ced8
	.word	0x0001ced8
	.word	0x0001cee0
	.word	0x0001cee0
	.word	0x0001cee8
	.word	0x0001cee8
	.word	0x0001cef0
	.word	0x0001cef0
	.word	0x0001cef8
	.word	0x0001cef8
	.word	0x0001cf00
	.word	0x0001cf00
	.word	0x0001cf08
	.word	0x0001cf08
	.word	0x0001cf10
	.word	0x0001cf10
	.word	0x0001cf18
	.word	0x0001cf18
	.word	0x0001cf20
	.word	0x0001cf20
	.word	0x0001cf28
	.word	0x0001cf28
	.word	0x0001cf30
	.word	0x0001cf30
	.word	0x0001cf38
	.word	0x0001cf38
	.word	0x0001cf40
	.word	0x0001cf40
	.word	0x0001cf48
	.word	0x0001cf48
	.word	0x0001cf50
	.word	0x0001cf50
	.word	0x0001cf58
	.word	0x0001cf58
	.word	0x0001cf60
	.word	0x0001cf60
	.word	0x0001cf68
	.word	0x0001cf68
	.word	0x0001cf70
	.word	0x0001cf70
	.word	0x0001cf78
	.word	0x0001cf78
	.word	0x0001cf80
	.word	0x0001cf80
	.word	0x0001cf88
	.word	0x0001cf88
	.word	0x0001cf90
	.word	0x0001cf90
	.word	0x0001cf98
	.word	0x0001cf98
	.word	0x0001cfa0
	.word	0x0001cfa0
	.word	0x0001cfa8
	.word	0x0001cfa8
	.word	0x0001cfb0
	.word	0x0001cfb0
	.word	0x0001cfb8
	.word	0x0001cfb8
	.word	0x0001cfc0
	.word	0x0001cfc0
	.word	0x0001cfc8
	.word	0x0001cfc8
	.word	0x0001cfd0
	.word	0x0001cfd0
	.word	0x0001cfd8
	.word	0x0001cfd8
	.word	0x0001cfe0
	.word	0x0001cfe0
	.word	0x0001cfe8
	.word	0x0001cfe8
	.word	0x0001cff0
	.word	0x0001cff0
	.word	0x0001cff8
	.word	0x0001cff8
	.word	0x0001d000
	.word	0x0001d000
	.word	0x0001d008
	.word	0x0001d008
	.word	0x0001d010
	.word	0x0001d010
	.word	0x0001d018
	.word	0x0001d018
	.word	0x0001d020
	.word	0x0001d020
	.word	0x0001d028
	.word	0x0001d028
	.word	0x0001d030
	.word	0x0001d030
	.word	0x0001d038
	.word	0x0001d038
	.word	0x0001d040
	.word	0x0001d040
	.word	0x0001d048
	.word	0x0001d048
	.word	0x0001d050
	.word	0x0001d050
	.word	0x0001d058
	.word	0x0001d058
	.word	0x0001d060
	.word	0x0001d060
	.word	0x0001d068
	.word	0x0001d068
	.word	0x0001d070
	.word	0x0001d070
	.word	0x0001d078
	.word	0x0001d078
	.word	0x0001d080
	.word	0x0001d080
	.word	0x0001d088
	.word	0x0001d088
	.word	0x0001d090
	.word	0x0001d090
	.word	0x0001d098
	.word	0x0001d098
	.word	0x0001d0a0
	.word	0x0001d0a0
	.word	0x0001d0a8
	.word	0x0001d0a8
	.word	0x0001d0b0
	.word	0x0001d0b0
	.word	0x0001d0b8
	.word	0x0001d0b8
	.word	0x0001d0c0
	.word	0x0001d0c0
	.word	0x0001d0c8
	.word	0x0001d0c8
	.word	0x0001d0d0
	.word	0x0001d0d0
	.word	0x0001d0d8
	.word	0x0001d0d8
	.word	0x0001d0e0
	.word	0x0001d0e0
	.word	0x0001d0e8
	.word	0x0001d0e8
	.word	0x0001d0f0
	.word	0x0001d0f0
	.word	0x0001d0f8
	.word	0x0001d0f8
	.word	0x0001d100
	.word	0x0001d100
	.word	0x0001d108
	.word	0x0001d108
	.word	0x0001d110
	.word	0x0001d110
	.word	0x0001d118
	.word	0x0001d118
	.word	0x0001d120
	.word	0x0001d120
	.word	0x0001d128
	.word	0x0001d128
	.word	0x0001d130
	.word	0x0001d130
	.word	0x0001d138
	.word	0x0001d138
	.word	0x0001d140
	.word	0x0001d140
	.word	0x0001d148
	.word	0x0001d148
	.word	0x0001d150
	.word	0x0001d150
	.word	0x0001d158
	.word	0x0001d158
	.word	0x0001d160
	.word	0x0001d160
	.word	0x0001d168
	.word	0x0001d168
	.word	0x0001d170
	.word	0x0001d170
	.word	0x0001d178
	.word	0x0001d178
	.word	0x0001d180
	.word	0x0001d180
	.word	0x0001d188
	.word	0x0001d188
	.word	0x0001d190
	.word	0x0001d190
	.word	0x0001d198
	.word	0x0001d198
	.word	0x0001d1a0
	.word	0x0001d1a0
	.word	0x0001d1a8
	.word	0x0001d1a8
	.word	0x0001d1b0
	.word	0x0001d1b0
	.word	0x0001d1b8
	.word	0x0001d1b8
	.word	0x0001d1c0
	.word	0x0001d1c0
	.word	0x0001d1c8
	.word	0x0001d1c8
	.word	0x0001d1d0
	.word	0x0001d1d0
	.word	0x0001d1d8
	.word	0x0001d1d8
	.word	0x0001d1e0
	.word	0x0001d1e0
	.word	0x0001d1e8
	.word	0x0001d1e8
	.word	0x0001d1f0
	.word	0x0001d1f0
	.word	0x0001d1f8
	.word	0x0001d1f8
	.word	0x0001d200
	.word	0x0001d200
	.word	0x0001d208
	.word	0x0001d208
	.word	0x0001d210
	.word	0x0001d210
	.word	0x0001d218
	.word	0x0001d218
	.word	0x0001d220
	.word	0x0001d220
	.word	0x0001d228
	.word	0x0001d228
	.word	0x0001d230
	.word	0x0001d230
	.word	0x0001d238
	.word	0x0001d238
	.word	0x0001d240
	.word	0x0001d240
	.word	0x0001d248
	.word	0x0001d248
	.word	0x0001d250
	.word	0x0001d250
	.word	0x0001d258
	.word	0x0001d258
	.word	0x0001d260
	.word	0x0001d260
	.word	0x0001d268
	.word	0x0001d268
	.word	0x0001d270
	.word	0x0001d270
	.word	0x0001d278
	.word	0x0001d278
	.word	0x0001d280
	.word	0x0001d280
	.word	0x0001d288
	.word	0x0001d288
	.word	0x0001d290
	.word	0x0001d290
	.word	0x0001d298
	.word	0x0001d298
	.word	0x0001d2a0
	.word	0x0001d2a0
	.word	0x0001d2a8
	.word	0x0001d2a8
	.word	0x0001d2b0
	.word	0x0001d2b0
__malloc_sbrk_base:
	.word	0xffffffff
__malloc_trim_threshold:
	.word	0x00020000


	.bss

__bss_start:
	.word	0x00000000
object.0:
heap:
test_data:
seed:
	.word	0x00000000
heap_ptr:
	.word	0x00000000
heap_end:
	.word	0x00000000
heap_requested:
	.word	0x00000000
__lock___atexit_recursive_mutex:
	.word	0x00000000
__lock___malloc_recursive_mutex:
	.word	0x00000000
__lock___sfp_recursive_mutex:
	.word	0x00000000
__lock___sinit_recursive_mutex:
	.word	0x00000000
__malloc_current_mallinfo:
__malloc_max_sbrked_mem:
	.word	0x00000000
__malloc_max_total_mem:
	.word	0x00000000
__malloc_top_pad:
	.word	0x00000000
errno:
	.word	0x00000000
heap_end.0:
	.word	0x00000000
