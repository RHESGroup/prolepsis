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
	ldr	r3, [pc, #16]	; (8028 <exit+0x1c>)
	ldr	r0, [r3, #0]
	ldr	r3, [r0, #60]	; 0x3c
	cbz	r3, lab0
	blx	r3
lab0: 	mov	r0, r4
	bl	_exit
	nop
	.word	0x00009618
register_fini:
	ldr	r3, [pc, #8]	; (8038 <register_fini+0xc>)
	cbz	r3, lab1
	ldr	r0, [pc, #8]	; (803c <register_fini+0x10>)
	b	atexit
lab1: 	bx	lr
	.word	0x00000000
	.word	0x00008f09
__do_global_dtors_aux:
	push	{r4, lr}
	ldr	r4, [pc, #20]	; (8058 <__do_global_dtors_aux+0x18>)
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, [pc, #16]	; (805c <__do_global_dtors_aux+0x1c>)
	cbz	r3, lab3
	ldr	r0, [pc, #16]	; (8060 <__do_global_dtors_aux+0x20>)
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2: 	pop	{r4, pc}
	.word	0x00019a64
	.word	0x00000000
	.word	0x00009624
frame_dummy:
	push	{r3, lr}
	ldr	r3, [pc, #12]	; (8074 <frame_dummy+0x10>)
	cbz	r3, lab4
	ldr	r1, [pc, #12]	; (8078 <frame_dummy+0x14>)
	ldr	r0, [pc, #12]	; (807c <frame_dummy+0x18>)
	nop
lab4: 	pop	{r3, pc}
	.word	0x00000000
	.word	0x00019a68
	.word	0x00009624
_stack_init:
	sub	sl, r3, #65536	; 0x10000
	bx	lr
	nop
_mainCRTStartup:
	ldr	r3, [pc, #92]	; (80e8 <_mainCRTStartup+0x60>)
	cmp	r3, #0
	it	eq
	ldreq	r3, [pc, #76]	; (80dc <_mainCRTStartup+0x54>)
	mov	sp, r3
	bl	_stack_init
	movs	r1, #0
	mov	fp, r1
	mov	r7, r1
	ldr	r0, [pc, #76]	; (80ec <_mainCRTStartup+0x64>)
	ldr	r2, [pc, #80]	; (80f0 <_mainCRTStartup+0x68>)
	subs	r2, r2, r0
	bl	memset
	ldr	r3, [pc, #56]	; (80e0 <_mainCRTStartup+0x58>)
	cmp	r3, #0
	beq	lab5
	blx	r3
lab5: 	ldr	r3, [pc, #52]	; (80e4 <_mainCRTStartup+0x5c>)
	cmp	r3, #0
	beq	lab6
	blx	r3
lab6: 	movs	r0, #0
	movs	r1, #0
	movs	r4, r0
	movs	r5, r1
	ldr	r0, [pc, #52]	; (80f4 <_mainCRTStartup+0x6c>)
	cmp	r0, #0
	beq	lab7
	ldr	r0, [pc, #48]	; (80f8 <_mainCRTStartup+0x70>)
	bl	atexit
lab7: 	bl	__libc_init_array
	movs	r0, r4
	movs	r1, r5
	bl	main
	bl	exit
	nop
	.word	0x00080000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00019a64
	.word	0x0001a0d0
	.word	0x00008efd
	.word	0x00008f09
vec_mpy1:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]
	movs	r3, #0
	str	r3, [r7, #20]
	b	lab8
lab9: 	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	uxth	r2, r3
	ldrsh	r3, [r7, #6]
	ldr	r1, [r7, #20]
	lsls	r1, r1, #1
	ldr	r0, [r7, #8]
	add	r1, r0
	ldrsh	r1, [r1]
	mul	r3, r1, r3
	asrs	r3, r3, #15
	uxth	r3, r3
	add	r3, r2
	uxth	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab8: 	ldr	r3, [r7, #20]
	cmp	r3, #149	; 0x95
	ble	lab9
	nop
	nop
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
mac:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #20]
	b	lab10
lab11: 	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [r7, #16]
	add	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [r7, #4]
	add	r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab10: 	ldr	r3, [r7, #20]
	cmp	r3, #149	; 0x95
	ble	lab11
	ldr	r3, [r7, #0]
	ldr	r2, [r7, #16]
	str	r2, [r3, #0]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
fir:
	push	{r7}
	sub	sp, #36	; 0x24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #28]
	b	lab12
lab15: 	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #24]
	b	lab13
lab14: 	ldr	r3, [r7, #24]
	add	r3, r2
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #24]
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [r7, #20]
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #24]
	adds	r3, #1
	str	r3, [r7, #24]
lab13: 	ldr	r3, [r7, #24]
	cmp	r3, #49	; 0x31
	ble	lab14
	ldr	r3, [r7, #28]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r2, [r7, #20]
	asrs	r2, r2, #15
	str	r2, [r3, #0]
	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab12: 	ldr	r3, [r7, #28]
	cmp	r3, #49	; 0x31
	ble	lab15
	nop
	nop
	adds	r7, #36	; 0x24
	mov	sp, r7
	pop	{r7}
	bx	lr
fir_no_red_ld:
	push	{r7}
	sub	sp, #44	; 0x2c
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #32]
	b	lab16
lab19: 	str	r3, [r7, #28]
	movs	r3, #0
	str	r3, [r7, #24]
	ldr	r3, [r7, #32]
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #22]
	movs	r3, #0
	str	r3, [r7, #36]	; 0x24
	b	lab17
lab18: 	ldr	r3, [r7, #36]	; 0x24
	add	r3, r2
	adds	r3, #1
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #20]
	ldr	r3, [r7, #36]	; 0x24
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #18]
	ldrsh	r3, [r7, #22]
	ldrsh	r2, [r7, #18]
	mul	r3, r2, r3
	ldr	r2, [r7, #28]
	add	r3, r2
	str	r3, [r7, #28]
	ldrsh	r3, [r7, #20]
	ldrsh	r2, [r7, #18]
	mul	r3, r2, r3
	ldr	r2, [r7, #24]
	add	r3, r2
	str	r3, [r7, #24]
	ldr	r2, [r7, #32]
	ldr	r3, [r7, #36]	; 0x24
	add	r3, r2
	adds	r3, #2
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #22]
	ldr	r3, [r7, #36]	; 0x24
	adds	r3, #1
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #16]
	ldrsh	r3, [r7, #20]
	ldrsh	r2, [r7, #16]
	mul	r3, r2, r3
	ldr	r2, [r7, #28]
	add	r3, r2
	str	r3, [r7, #28]
	ldrsh	r3, [r7, #22]
	ldrsh	r2, [r7, #16]
	mul	r3, r2, r3
	ldr	r2, [r7, #24]
	add	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #36]	; 0x24
	adds	r3, #2
	str	r3, [r7, #36]	; 0x24
lab17: 	ldr	r3, [r7, #36]	; 0x24
	cmp	r3, #31
	ble	lab18
	ldr	r3, [r7, #32]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r2, [r7, #28]
	asrs	r2, r2, #15
	str	r2, [r3, #0]
	ldr	r3, [r7, #32]
	adds	r3, #1
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r2, [r7, #24]
	asrs	r2, r2, #15
	str	r2, [r3, #0]
	ldr	r3, [r7, #32]
	adds	r3, #2
	str	r3, [r7, #32]
lab16: 	ldr	r3, [r7, #32]
	cmp	r3, #99	; 0x63
	ble	lab19
	nop
	nop
	adds	r7, #44	; 0x2c
	mov	sp, r7
	pop	{r7}
	bx	lr
latsynth:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #4]
	add	r3, r3, #2147483648	; 0x80000000
	subs	r3, #1
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #4]
	add	r3, r3, #2147483648	; 0x80000000
	subs	r3, #1
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [r7, #0]
	subs	r3, r2, r3
	str	r3, [r7, #0]
	ldr	r3, [r7, #4]
	subs	r3, #2
	str	r3, [r7, #20]
	b	lab20
lab21: 	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [r7, #0]
	subs	r3, r2, r3
	str	r3, [r7, #0]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	uxth	r2, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r1, [r7, #8]
	add	r3, r1
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #0]
	asrs	r3, r3, #16
	mul	r3, r1, r3
	asrs	r3, r3, #16
	uxth	r3, r3
	add	r3, r2
	uxth	r1, r3
	ldr	r3, [r7, #20]
	adds	r3, #1
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #20]
	subs	r3, #1
	str	r3, [r7, #20]
lab20: 	ldr	r3, [r7, #20]
	cmp	r3, #0
	bge	lab21
	ldr	r3, [r7, #0]
	asrs	r3, r3, #16
	sxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #0]
	mov	r0, r3
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
iir1:
	push	{r7}
	sub	sp, #36	; 0x24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #8]
	ldrsh	r3, [r3]
	str	r3, [r7, #28]
	movs	r3, #0
	str	r3, [r7, #24]
	b	lab22
lab23: 	adds	r3, #4
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	mul	r2, r3, r2
	ldr	r3, [r7, #12]
	adds	r3, #6
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #0]
	adds	r3, #4
	ldr	r3, [r3, #0]
	mul	r3, r1, r3
	add	r3, r2
	asrs	r3, r3, #15
	ldr	r2, [r7, #28]
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	mul	r2, r3, r2
	ldr	r3, [r7, #12]
	adds	r3, #2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #0]
	adds	r3, #4
	ldr	r3, [r3, #0]
	mul	r3, r1, r3
	add	r3, r2
	asrs	r3, r3, #15
	ldr	r2, [r7, #20]
	add	r3, r2
	str	r3, [r7, #28]
	ldr	r3, [r7, #0]
	adds	r3, #4
	ldr	r2, [r7, #0]
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r2, [r7, #20]
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #8
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	adds	r3, #8
	str	r3, [r7, #0]
	ldr	r3, [r7, #24]
	adds	r3, #1
	str	r3, [r7, #24]
lab22: 	ldr	r3, [r7, #24]
	cmp	r3, #49	; 0x31
	ble	lab23
	ldr	r3, [r7, #4]
	adds	r2, r3, #4
	str	r2, [r7, #4]
	ldr	r2, [r7, #28]
	str	r2, [r3, #0]
	nop
	adds	r7, #36	; 0x24
	mov	sp, r7
	pop	{r7}
	bx	lr
codebook:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #8]
	adds	r3, #1
	str	r3, [r7, #20]
	b	lab24
lab25: 	adds	r3, #1
	str	r3, [r7, #20]
lab24: 	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	ble	lab25
	ldr	r3, [r7, #32]
	mov	r0, r3
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
jpegdct:
	push	{r7}
	sub	sp, #76	; 0x4c
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #1
	strh	r3, [r7, #66]	; 0x42
	movs	r3, #0
	strh	r3, [r7, #64]	; 0x40
	movs	r3, #13
	strh	r3, [r7, #62]	; 0x3e
	movs	r3, #8
	strh	r3, [r7, #60]	; 0x3c
	b	lab26
lab31: 	strh	r3, [r7, #70]	; 0x46
	b	lab27
lab30: 	strh	r3, [r7, #68]	; 0x44
	b	lab28
lab29: 	ldrsh	r2, [r7, #68]	; 0x44
	mul	r3, r2, r3
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldrsh	r3, [r7, #66]	; 0x42
	ldrsh	r2, [r7, #68]	; 0x44
	rsb	r2, r2, #7
	mul	r3, r2, r3
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r2, r3
	ldrsh	r3, [r7, #68]	; 0x44
	add	r2, r1
	lsls	r3, r3, #2
	adds	r3, #72	; 0x48
	add	r3, r7
	str	r2, [r3, #-60]
	ldrsh	r3, [r7, #66]	; 0x42
	ldrsh	r2, [r7, #68]	; 0x44
	mul	r3, r2, r3
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldrsh	r3, [r7, #66]	; 0x42
	ldrsh	r2, [r7, #68]	; 0x44
	rsb	r2, r2, #7
	mul	r3, r2, r3
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r2, r3
	ldrsh	r3, [r7, #68]	; 0x44
	rsb	r3, r3, #7
	subs	r2, r1, r2
	lsls	r3, r3, #2
	adds	r3, #72	; 0x48
	add	r3, r7
	str	r2, [r3, #-60]
	ldrsh	r3, [r7, #68]	; 0x44
	uxth	r3, r3
	adds	r3, #1
	uxth	r3, r3
	strh	r3, [r7, #68]	; 0x44
lab28: 	ldrsh	r3, [r7, #68]	; 0x44
	cmp	r3, #3
	ble	lab29
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #24]
	add	r3, r2
	str	r3, [r7, #44]	; 0x2c
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #24]
	subs	r3, r2, r3
	str	r3, [r7, #48]	; 0x30
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	add	r3, r2
	str	r3, [r7, #52]	; 0x34
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	str	r3, [r7, #56]	; 0x38
	ldr	r2, [r7, #44]	; 0x2c
	ldr	r3, [r7, #52]	; 0x34
	add	r2, r3
	ldrsh	r3, [r7, #64]	; 0x40
	asr	r3, r2, r3
	sxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #0]
	ldr	r2, [r7, #44]	; 0x2c
	ldr	r3, [r7, #52]	; 0x34
	subs	r2, r2, r3
	ldrsh	r3, [r7, #64]	; 0x40
	asr	r1, r2, r3
	ldrsh	r3, [r7, #66]	; 0x42
	lsls	r3, r3, #3
	ldr	r2, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #56]	; 0x38
	uxth	r2, r3
	ldr	r3, [r7, #48]	; 0x30
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #20
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [r7, #44]	; 0x2c
	ldr	r3, [r7, #44]	; 0x2c
	uxth	r2, r3
	ldr	r3, [r7, #48]	; 0x30
	ldr	r1, [r7, #0]
	adds	r1, #18
	ldrsh	r1, [r1]
	mul	r1, r3, r1
	ldrsh	r3, [r7, #62]	; 0x3e
	asr	r3, r1, r3
	uxth	r3, r3
	add	r3, r2
	uxth	r1, r3
	ldrsh	r3, [r7, #66]	; 0x42
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #44]	; 0x2c
	uxth	r2, r3
	ldr	r3, [r7, #56]	; 0x38
	ldr	r1, [r7, #0]
	adds	r1, #22
	ldrsh	r1, [r1]
	mul	r1, r3, r1
	ldrsh	r3, [r7, #62]	; 0x3e
	asr	r3, r1, r3
	uxth	r3, r3
	add	r3, r2
	uxth	r1, r3
	ldrsh	r2, [r7, #66]	; 0x42
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	lsls	r3, r3, #2
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #28]
	uxth	r2, r3
	ldr	r3, [r7, #40]	; 0x28
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #4
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #32]
	uxth	r2, r3
	ldr	r3, [r7, #36]	; 0x24
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [r7, #16]
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #36]	; 0x24
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r2, [r7, #32]
	ldr	r3, [r7, #40]	; 0x28
	add	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #20]
	uxth	r2, r3
	ldr	r3, [r7, #24]
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #16
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [r7, #44]	; 0x2c
	ldr	r3, [r7, #20]
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #2
	ldrsh	r3, [r3]
	mul	r2, r3, r2
	ldr	r3, [r7, #44]	; 0x2c
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #24]
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #6
	ldrsh	r3, [r3]
	mul	r2, r3, r2
	ldr	r3, [r7, #44]	; 0x2c
	add	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	uxth	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #8
	ldrsh	r3, [r3]
	uxth	r3, r3
	smulbb	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #12]
	uxth	r3, r3
	add	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #20]
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldrsh	r3, [r7, #62]	; 0x3e
	asr	r1, r2, r3
	ldrsh	r2, [r7, #66]	; 0x42
	mov	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #32]
	uxth	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #12
	ldrsh	r3, [r3]
	uxth	r3, r3
	smulbb	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #16]
	uxth	r3, r3
	add	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #24]
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldrsh	r3, [r7, #62]	; 0x3e
	asr	r1, r2, r3
	ldrsh	r2, [r7, #66]	; 0x42
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #36]	; 0x24
	uxth	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #10
	ldrsh	r3, [r3]
	uxth	r3, r3
	smulbb	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #16]
	uxth	r3, r3
	add	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #20]
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldrsh	r3, [r7, #62]	; 0x3e
	asr	r1, r2, r3
	ldrsh	r2, [r7, #66]	; 0x42
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	lsls	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #40]	; 0x28
	uxth	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #14
	ldrsh	r3, [r3]
	uxth	r3, r3
	smulbb	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #12]
	uxth	r3, r3
	add	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #24]
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldrsh	r3, [r7, #62]	; 0x3e
	asr	r1, r2, r3
	ldrsh	r3, [r7, #66]	; 0x42
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldrsh	r3, [r7, #70]	; 0x46
	uxth	r3, r3
	adds	r3, #1
	uxth	r3, r3
	strh	r3, [r7, #70]	; 0x46
	ldrsh	r3, [r7, #60]	; 0x3c
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	str	r3, [r7, #4]
lab27: 	ldrsh	r3, [r7, #70]	; 0x46
	cmp	r3, #7
	ble	lab30
	ldrh	r3, [r7, #66]	; 0x42
	adds	r3, #7
	uxth	r3, r3
	strh	r3, [r7, #66]	; 0x42
	ldrh	r3, [r7, #64]	; 0x40
	adds	r3, #3
	uxth	r3, r3
	strh	r3, [r7, #64]	; 0x40
	ldrh	r3, [r7, #62]	; 0x3e
	adds	r3, #3
	uxth	r3, r3
	strh	r3, [r7, #62]	; 0x3e
	ldrh	r3, [r7, #60]	; 0x3c
	subs	r3, #7
	uxth	r3, r3
	strh	r3, [r7, #60]	; 0x3c
	ldr	r3, [r7, #4]
	subs	r3, #128	; 0x80
	str	r3, [r7, #4]
lab26: 	ldrsh	r3, [r7, #66]	; 0x42
	cmp	r3, #8
	ble	lab31
	nop
	nop
	adds	r7, #76	; 0x4c
	mov	sp, r7
	pop	{r7}
	bx	lr
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
	bl	benchmark_body
	str	r0, [r7, #12]
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #87	; 0x57
	bl	benchmark_body
	mov	r3, r0
	mov	r0, r3
	pop	{r7, pc}
benchmark_body:
	push	{r4, r7, lr}
	sub	sp, sp, #836	; 0x344
	add	r7, sp, #16
	add	r3, r7, #816	; 0x330
	sub	r3, r3, #812	; 0x32c
	str	r0, [r3, #0]
	movs	r3, #0
	str	r3, [r7, #812]	; 0x32c
	b	lab32
lab35: 	sub	r3, r3, #808	; 0x328
	ldr	r2, [pc, #332]	; (8a4c <benchmark_body+0x170>)
	mov	r0, r3
	mov	r1, r2
	mov	r3, #400	; 0x190
	mov	r2, r3
	bl	memcpy
	add	r3, r7, #816	; 0x330
	sub	r3, r3, #408	; 0x198
	ldr	r2, [pc, #312]	; (8a50 <benchmark_body+0x174>)
	mov	r0, r3
	mov	r1, r2
	mov	r3, #400	; 0x190
	mov	r2, r3
	bl	memcpy
	ldr	r3, [pc, #300]	; (8a54 <benchmark_body+0x178>)
	movs	r2, #3
	strh	r2, [r3, #0]
	ldr	r3, [pc, #296]	; (8a58 <benchmark_body+0x17c>)
	movw	r2, #43690	; 0xaaaa
	str	r2, [r3, #0]
	ldr	r3, [pc, #292]	; (8a5c <benchmark_body+0x180>)
	movw	r2, #61166	; 0xeeee
	str	r2, [r3, #0]
	movs	r3, #0
	str	r3, [r7, #808]	; 0x328
	b	lab33
lab34: 	sub	r3, r3, #808	; 0x328
	ldr	r2, [r7, #808]	; 0x328
	ldrh	r3, [r3, r2, lsl #1]
	sxth	r1, r3
	ldr	r2, [pc, #264]	; (8a60 <benchmark_body+0x184>)
	ldr	r3, [r7, #808]	; 0x328
	strh	r1, [r2, r3, lsl #1]
	add	r3, r7, #816	; 0x330
	sub	r3, r3, #408	; 0x198
	ldr	r2, [r7, #808]	; 0x328
	ldrh	r3, [r3, r2, lsl #1]
	sxth	r1, r3
	ldr	r2, [pc, #240]	; (8a64 <benchmark_body+0x188>)
	ldr	r3, [r7, #808]	; 0x328
	strh	r1, [r2, r3, lsl #1]
	ldr	r3, [r7, #808]	; 0x328
	adds	r3, #1
	str	r3, [r7, #808]	; 0x328
lab33: 	ldr	r3, [r7, #808]	; 0x328
	cmp	r3, #199	; 0xc7
	ble	lab34
	ldr	r3, [pc, #196]	; (8a54 <benchmark_body+0x178>)
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r1, [pc, #204]	; (8a64 <benchmark_body+0x188>)
	ldr	r0, [pc, #196]	; (8a60 <benchmark_body+0x184>)
	bl	vec_mpy1
	ldr	r3, [pc, #180]	; (8a54 <benchmark_body+0x178>)
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [pc, #192]	; (8a68 <benchmark_body+0x18c>)
	ldr	r1, [pc, #184]	; (8a64 <benchmark_body+0x188>)
	ldr	r0, [pc, #180]	; (8a60 <benchmark_body+0x184>)
	bl	mac
	mov	r3, r0
	sxth	r2, r3
	ldr	r3, [pc, #156]	; (8a54 <benchmark_body+0x178>)
	strh	r2, [r3, #0]
	ldr	r2, [pc, #172]	; (8a68 <benchmark_body+0x18c>)
	ldr	r1, [pc, #168]	; (8a64 <benchmark_body+0x188>)
	ldr	r0, [pc, #160]	; (8a60 <benchmark_body+0x184>)
	bl	fir
	ldr	r2, [pc, #164]	; (8a68 <benchmark_body+0x18c>)
	ldr	r1, [pc, #156]	; (8a64 <benchmark_body+0x188>)
	ldr	r0, [pc, #152]	; (8a60 <benchmark_body+0x184>)
	bl	fir_no_red_ld
	ldr	r3, [pc, #136]	; (8a58 <benchmark_body+0x17c>)
	ldr	r3, [r3, #0]
	movs	r2, #100	; 0x64
	ldr	r1, [pc, #144]	; (8a64 <benchmark_body+0x188>)
	ldr	r0, [pc, #136]	; (8a60 <benchmark_body+0x184>)
	bl	latsynth
	mov	r3, r0
	ldr	r2, [pc, #120]	; (8a58 <benchmark_body+0x17c>)
	str	r3, [r2, #0]
	ldr	r3, [pc, #132]	; (8a68 <benchmark_body+0x18c>)
	ldr	r2, [pc, #136]	; (8a6c <benchmark_body+0x190>)
	ldr	r1, [pc, #124]	; (8a64 <benchmark_body+0x188>)
	ldr	r0, [pc, #120]	; (8a60 <benchmark_body+0x184>)
	bl	iir1
	ldr	r3, [pc, #104]	; (8a58 <benchmark_body+0x17c>)
	ldr	r0, [r3, #0]
	ldr	r3, [pc, #104]	; (8a5c <benchmark_body+0x180>)
	ldr	r1, [r3, #0]
	ldr	r3, [pc, #96]	; (8a58 <benchmark_body+0x17c>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #88]	; (8a54 <benchmark_body+0x178>)
	ldrsh	r2, [r2]
	movs	r4, #1
	str	r4, [sp, #12]
	str	r2, [sp, #8]
	ldr	r2, [pc, #88]	; (8a60 <benchmark_body+0x184>)
	str	r2, [sp, #4]
	str	r3, [sp, #0]
	mov	r3, r1
	movs	r2, #17
	movs	r1, #1
	bl	codebook
	mov	r3, r0
	ldr	r2, [pc, #68]	; (8a5c <benchmark_body+0x180>)
	str	r3, [r2, #0]
	ldr	r1, [pc, #72]	; (8a64 <benchmark_body+0x188>)
	ldr	r0, [pc, #64]	; (8a60 <benchmark_body+0x184>)
	bl	jpegdct
	ldr	r3, [r7, #812]	; 0x32c
	adds	r3, #1
	str	r3, [r7, #812]	; 0x32c
lab32: 	add	r3, r7, #816	; 0x330
	sub	r3, r3, #812	; 0x32c
	ldr	r2, [r7, #812]	; 0x32c
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab35
	movs	r3, #0
	mov	r0, r3
	add	r7, r7, #820	; 0x334
	mov	sp, r7
	pop	{r4, r7, pc}
	.word	0x00008fd8
	.word	0x00009168
	.word	0x00019da0
	.word	0x00019da4
	.word	0x00019da8
	.word	0x00019a80
	.word	0x00019c10
	.word	0x00019dac
	.word	0x00019f3c
verify_benchmark:
	push	{r7, lr}
	sub	sp, sp, #808	; 0x328
	add	r7, sp, #0
	add	r3, r7, #808	; 0x328
	sub	r3, r3, #804	; 0x324
	str	r0, [r3, #0]
	add	r3, r7, #808	; 0x328
	sub	r3, r3, #800	; 0x320
	ldr	r2, [pc, #88]	; (8ae4 <verify_benchmark+0x74>)
	mov	r0, r3
	mov	r1, r2
	mov	r3, #800	; 0x320
	mov	r2, r3
	bl	memcpy
	add	r3, r7, #8
	mov	r2, #800	; 0x320
	mov	r1, r3
	ldr	r0, [pc, #64]	; (8ae8 <verify_benchmark+0x78>)
	bl	memcmp
	mov	r3, r0
	cmp	r3, #0
	bne	lab36
	ldr	r3, [pc, #56]	; (8aec <verify_benchmark+0x7c>)
	ldrsh	r3, [r3]
	movw	r2, #10243	; 0x2803
	cmp	r3, r2
	bne	lab36
	ldr	r3, [pc, #48]	; (8af0 <verify_benchmark+0x80>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #48]	; (8af4 <verify_benchmark+0x84>)
	cmp	r3, r2
	bne	lab36
	ldr	r3, [pc, #44]	; (8af8 <verify_benchmark+0x88>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #36]	; (8af4 <verify_benchmark+0x84>)
	cmp	r3, r2
	bne	lab36
	movs	r3, #1
	b	lab37
lab36: 	movs	r3, #0
lab37: 	mov	r0, r3
	add	r7, r7, #808	; 0x328
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x000092f8
	.word	0x00019dac
	.word	0x00019da0
	.word	0x00019da4
	.word	0xe5a959ea
	.word	0x00019da8
initialise_board:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #24]	; (8b1c <initialise_board+0x20>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #20]	; (8b1c <initialise_board+0x20>)
	orr	r3, r3, #16777216	; 0x1000000
	str	r3, [r2, #0]
	ldr	r3, [pc, #16]	; (8b20 <initialise_board+0x24>)
	movs	r2, #0
	str	r2, [r3, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.word	0xe000edfc
	.word	0xe0001004
start_trigger:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #16]	; (8b3c <start_trigger+0x18>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #12]	; (8b3c <start_trigger+0x18>)
	orr	r3, r3, #1
	str	r3, [r2, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	.word	0xe0001000
stop_trigger:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #24]	; (8b60 <stop_trigger+0x20>)
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, [pc, #24]	; (8b64 <stop_trigger+0x24>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #20]	; (8b64 <stop_trigger+0x24>)
	bic	r3, r3, #1
	str	r3, [r2, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.word	0xe0001004
	.word	0xe0001000
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
	bl	start_trigger
	bl	benchmark
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
	pop	{r7, pc}
	movs	r0, r0
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, [pc, #52]	; (8be8 <__libc_init_array+0x38>)
	ldr	r5, [pc, #52]	; (8bec <__libc_init_array+0x3c>)
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab38
	movs	r4, #0
lab39: 	adds	r4, #1
	blx	r3
	cmp	r6, r4
	bne	lab39
lab38: 	ldr	r6, [pc, #36]	; (8bf0 <__libc_init_array+0x40>)
	ldr	r5, [pc, #36]	; (8bf4 <__libc_init_array+0x44>)
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab40
	movs	r4, #0
lab41: 	adds	r4, #1
	blx	r3
	cmp	r6, r4
	bne	lab41
lab40: 	pop	{r4, r5, r6, pc}
	.word	0x00019628
	.word	0x00019628
	.word	0x00019630
	.word	0x00019628
memcmp:
	cmp	r2, #3
	push	{r4, lr}
	bls	lab42
	orr	ip, r0, r1
	tst	ip, #3
	mov	r4, r0
	mov	r3, r1
	bne	lab43
lab44: 	mov	r0, r4
	ldr	lr, [r1]
	ldr	ip, [r0]
	cmp	ip, lr
	add	r4, r4, #4
	add	r3, r3, #4
	bne	lab43
	subs	r2, #4
	cmp	r2, #3
	mov	r0, r4
	mov	r1, r3
	bhi	lab44
lab42: 	subs	r4, r2, #1
	cbz	r2, lab45
lab49: 	subs	r1, #1
	b	lab46
lab48: 	beq	lab47
lab46: 	ldrb	lr, [ip, #1]!
	ldrb	r2, [r1, #1]!
	cmp	lr, r2
	sub	r3, r4, ip
	beq	lab48
	sub	r0, lr, r2
	pop	{r4, pc}
lab43: 	subs	r4, r2, #1
	b	lab49
lab47: 	mov	r0, r3
	pop	{r4, pc}
lab45: 	mov	r0, r2
	pop	{r4, pc}
memcpy:
	mov	ip, r0
	orr	r3, r1, r0
	ands	r3, r3, #3
	bne	lab50
lab59: 	bcc	lab51
lab52: 	str	r3, [r0], #4
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
	subs	r2, #64	; 0x40
	bcs	lab52
lab51: 	adds	r2, #48	; 0x30
	bcc	lab53
lab54: 	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #16
	bcs	lab54
lab53: 	adds	r2, #12
	bcc	lab55
lab56: 	str	r3, [r0], #4
	subs	r2, #4
	bcs	lab56
lab55: 	adds	r2, #4
	beq	lab57
	lsls	r2, r2, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab57
	ldrh	r3, [r1, #0]
	strh	r3, [r0, #0]
lab57: 	mov	r0, ip
	bx	lr
	nop
lab50: 	cmp	r2, #8
	bcc	lab58
	lsls	r3, r1, #30
	beq	lab59
	ands	r3, r0, #3
	beq	lab59
	rsb	r3, r3, #4
	subs	r2, r2, r3
	lsls	r3, r3, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab59
	ldrh	r3, [r1], #2
	strh	r3, [r0], #2
	b	lab59
lab58: 	subs	r2, #4
	bcc	lab55
lab60: 	ldrb	r3, [r1], #1
	strb	r3, [r0], #1
	bcs	lab60
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
	beq	lab61
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab62
	uxtb	r2, r1
	mov	r3, r0
	b	lab63
lab64: 	bcc	lab62
lab63: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab64
lab72: 	bls	lab65
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab66
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab67: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab67
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab68
lab73: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab69: 	cmp	r3, r2
	bne	lab69
	and	r4, ip, #3
lab65: 	cbz	r4, lab62
lab71: 	add	r4, r3
lab70: 	cmp	r4, r3
	bne	lab70
lab62: 	pop	{r4, r5, pc}
lab68: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab71
	b	lab62
lab61: 	mov	r3, r0
	mov	r4, r2
	b	lab72
lab66: 	mov	r2, r3
	mov	ip, r4
	b	lab73
__call_exitprocs:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, [pc, #180]	; (8ef4 <__call_exitprocs+0xbc>)
	sub	sp, #12
	mov	fp, r0
	ldr	r0, [r3, #0]
	str	fp, [sp, #4]
	mov	r7, r1
	bl	__retarget_lock_acquire_recursive
	ldr	r3, [pc, #168]	; (8ef8 <__call_exitprocs+0xc0>)
	ldr	r8, [r3]
	ldr	r6, [r8, #328]	; 0x148
	cbz	r6, lab74
	mov	r9, #1
	mov	sl, #0
lab80: 	subs	r5, r4, #1
	bmi	lab74
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab76: 	ldr	r3, [r4, #256]	; 0x100
	cmp	r3, r7
	beq	lab75
lab77: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab76
lab74: 	ldr	r3, [pc, #112]	; (8ef4 <__call_exitprocs+0xbc>)
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab75: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab77
	ldr	r0, [r6, #392]	; 0x188
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab78
	blx	r2
lab83: 	cmp	r2, fp
	bne	lab79
lab82: 	cmp	r3, r6
	beq	lab77
	mov	r6, r3
	cmp	r6, #0
	bne	lab80
	b	lab74
lab78: 	ldr	r0, [r6, #396]	; 0x18c
	tst	r1, r0
	bne	lab81
	ldr	r1, [r4, #128]	; 0x80
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab82
lab79: 	ldr	r6, [r8, #328]	; 0x148
	cmp	r6, #0
	bne	lab80
	b	lab74
lab81: 	ldr	r0, [r4, #128]	; 0x80
	blx	r2
	b	lab83
	.word	0x00019a60
	.word	0x00009618
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, [pc, #32]	; (8f2c <__libc_fini_array+0x24>)
	ldr	r5, [pc, #32]	; (8f30 <__libc_fini_array+0x28>)
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab84
	subs	r3, #4
	add	r5, r3
lab85: 	ldr	r3, [r5], #-4
	blx	r3
	cmp	r4, #0
	bne	lab85
lab84: 	ldmia	sp!, {r3, r4, r5, lr}
	b	_fini
	.word	0x00019634
	.word	0x00019630
__retarget_lock_acquire_recursive:
	bx	lr
	nop
__retarget_lock_release_recursive:
	bx	lr
	nop
__register_exitproc:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, [pc, #124]	; 8fc0 <__register_exitproc+0x84>
	mov	r6, r0
	ldr	r0, [sl]
	mov	r8, r3
	mov	r7, r1
	mov	r9, r2
	bl	__retarget_lock_acquire_recursive
	ldr	r3, [pc, #108]	; (8fc4 <__register_exitproc+0x88>)
	ldr	r3, [r3, #0]
	ldr	r4, [r3, #328]	; 0x148
	cbz	r4, lab86
lab90: 	cmp	r5, #31
	bgt	lab87
	cbnz	r6, lab88
lab89: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab91: lab88: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	; 0x88
	ldr	r2, [r4, #392]	; 0x188
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	; 0x188
	str	r8, [r1, #264]	; 0x108
	bne	lab89
	ldr	r2, [r4, #396]	; 0x18c
	orrs	r3, r2
	str	r3, [r4, #396]	; 0x18c
	b	lab89
lab86: 	add	r4, r3, #332	; 0x14c
	str	r4, [r3, #328]	; 0x148
	b	lab90
lab87: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	; 0xffffffff
	b	lab91
	.word	0x00019a60
	.word	0x00009618
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
