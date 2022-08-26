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
	ldr r1, =0x13cbb
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =0x00000000	
	cbz	r3, lab1
	ldr	r0, =0x00009921	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	ldr r1, =0x3045b
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push	{r4, lr}
	ldr	r4, =__bss_start	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x00009b60	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	ldr r1, =0x0482a
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
	ldr	r0, =0x00009b60	
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
	ldr	r0, =__bss_start	
	ldr	r2, =0x0001a040	
	subs	r2, r2, r0
push {r1, r2}
	ldr r1, =0x2cb24
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
	push {r1, r2}
	ldr r1, =0x2cb24
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
	ldr	r0, =0x00009915	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x00009921	
push {r1, r2}
	ldr r1, =0x2eeae
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	atexit
lab7:	push {r1, r2}
	ldr r1, =0x2eeae
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	bl	__libc_init_array
	push {r1, r2}
	ldr r1, =0x9b312
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, r4
	movs	r1, r5
	bl	main
	push {r1, r2}
	ldr r1, =0x5fca8
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	exit
	nop
	.ltorg
_nettle_write_be32:
	push	{r7, lr}
	sub	sp, #40	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #2
	str	r3, [r7, #28]
	ldr	r3, [r7, #12]
	and	r3, r3, #3
	str	r3, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #36]	
	b	lab8
lab9: 	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r3, [r3, #0]
	lsrs	r3, r3, #24
	uxtb	r2, r3
	ldr	r3, [r7, #8]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r3, [r3, #0]
	lsrs	r2, r3, #16
	ldr	r3, [r7, #8]
	adds	r3, #1
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r3, [r3, #0]
	lsrs	r2, r3, #8
	ldr	r3, [r7, #8]
	adds	r3, #2
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #8]
	adds	r3, #3
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #36]	
	adds	r3, #1
	str	r3, [r7, #36]	
	ldr	r3, [r7, #8]
	adds	r3, #4
	str	r3, [r7, #8]
lab8: 	ldr	r2, [r7, #36]	
	ldr	r3, [r7, #28]
	cmp	r2, r3
	bcc	lab9
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	lab10
	ldr	r3, [r7, #24]
	str	r3, [r7, #32]
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r3, [r3, #0]
	str	r3, [r7, #20]
	ldr	r3, [r7, #24]
	cmp	r3, #3
	beq	lab11
	ldr	r3, [r7, #24]
	cmp	r3, #3
	bhi	lab12
	ldr	r3, [r7, #24]
	cmp	r3, #1
	beq	lab13
	ldr	r3, [r7, #24]
	cmp	r3, #2
	beq	lab14
lab12: 	bl	abort
lab11: 	ldr	r3, [r7, #20]
	lsrs	r1, r3, #8
	ldr	r3, [r7, #32]
	subs	r3, #1
	str	r3, [r7, #32]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #32]
	add	r3, r2
	uxtb	r2, r1
	strb	r2, [r3, #0]
lab14: 	ldr	r3, [r7, #20]
	lsrs	r1, r3, #16
	ldr	r3, [r7, #32]
	subs	r3, #1
	str	r3, [r7, #32]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #32]
	add	r3, r2
	uxtb	r2, r1
	strb	r2, [r3, #0]
lab13: 	ldr	r3, [r7, #20]
	lsrs	r1, r3, #24
	ldr	r3, [r7, #32]
	subs	r3, #1
	str	r3, [r7, #32]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #32]
	add	r3, r2
	uxtb	r2, r1
	strb	r2, [r3, #0]
lab10: 	nop
	adds	r7, #40	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x078cb
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
_nettle_sha256_compress:
	push	{r4, r7}
	sub	sp, #120	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #84]	
	b	lab15
lab16: 	ldrb	r3, [r3, #0]
	lsls	r2, r3, #24
	ldr	r3, [r7, #8]
	adds	r3, #1
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #8]
	adds	r3, #2
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #8]
	adds	r2, #3
	ldrb	r2, [r2, #0]
	orrs	r2, r3
	ldr	r3, [r7, #84]	
	lsls	r3, r3, #2
	adds	r3, #120	
	add	r3, r7
	str	r2, [r3, #-104]
	ldr	r3, [r7, #84]	
	adds	r3, #1
	str	r3, [r7, #84]	
	ldr	r3, [r7, #8]
	adds	r3, #4
	str	r3, [r7, #8]
lab15: 	ldr	r3, [r7, #84]	
	cmp	r3, #15
	bls	lab16
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	str	r3, [r7, #116]	
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #4]
	str	r3, [r7, #112]	
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	str	r3, [r7, #108]	
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #12]
	str	r3, [r7, #104]	
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	str	r3, [r7, #100]	
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #20]
	str	r3, [r7, #96]	
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #24]
	str	r3, [r7, #92]	
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #28]
	str	r3, [r7, #88]	
	movs	r3, #0
	str	r3, [r7, #84]	
	add	r3, r7, #16
	str	r3, [r7, #80]	
	b	lab17
lab18: 	mov	r2, r3, ror #6
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #96]	
	ldr	r3, [r7, #92]	
	eors	r1, r3
	ldr	r3, [r7, #100]	
	ands	r1, r3
	ldr	r3, [r7, #92]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r3, [r7, #80]	
	ldr	r3, [r3, #0]
	add	r3, r2
	ldr	r2, [r7, #88]	
	add	r3, r2
	str	r3, [r7, #88]	
	ldr	r2, [r7, #104]	
	ldr	r3, [r7, #88]	
	add	r3, r2
	str	r3, [r7, #104]	
	ldr	r3, [r7, #116]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #116]	
	ldr	r3, [r7, #112]	
	ands	r1, r3
	ldr	r0, [r7, #116]	
	ldr	r3, [r7, #112]	
	eors	r0, r3
	ldr	r3, [r7, #108]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #88]	
	add	r3, r2
	str	r3, [r7, #88]	
	ldr	r3, [r7, #104]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #100]	
	ldr	r3, [r7, #96]	
	eors	r1, r3
	ldr	r3, [r7, #104]	
	ands	r1, r3
	ldr	r3, [r7, #96]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r3, [r7, #80]	
	adds	r3, #4
	ldr	r3, [r3, #0]
	add	r3, r2
	ldr	r2, [r7, #92]	
	add	r3, r2
	str	r3, [r7, #92]	
	ldr	r2, [r7, #108]	
	ldr	r3, [r7, #92]	
	add	r3, r2
	str	r3, [r7, #108]	
	ldr	r3, [r7, #88]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #88]	
	ldr	r3, [r7, #116]	
	ands	r1, r3
	ldr	r0, [r7, #88]	
	ldr	r3, [r7, #116]	
	eors	r0, r3
	ldr	r3, [r7, #112]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #92]	
	add	r3, r2
	str	r3, [r7, #92]	
	ldr	r3, [r7, #108]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #104]	
	ldr	r3, [r7, #100]	
	eors	r1, r3
	ldr	r3, [r7, #108]	
	ands	r1, r3
	ldr	r3, [r7, #100]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r3, [r7, #80]	
	adds	r3, #8
	ldr	r3, [r3, #0]
	add	r3, r2
	ldr	r2, [r7, #96]	
	add	r3, r2
	str	r3, [r7, #96]	
	ldr	r2, [r7, #112]	
	ldr	r3, [r7, #96]	
	add	r3, r2
	str	r3, [r7, #112]	
	ldr	r3, [r7, #92]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #92]	
	ldr	r3, [r7, #88]	
	ands	r1, r3
	ldr	r0, [r7, #92]	
	ldr	r3, [r7, #88]	
	eors	r0, r3
	ldr	r3, [r7, #116]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #96]	
	add	r3, r2
	str	r3, [r7, #96]	
	ldr	r3, [r7, #112]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #108]	
	ldr	r3, [r7, #104]	
	eors	r1, r3
	ldr	r3, [r7, #112]	
	ands	r1, r3
	ldr	r3, [r7, #104]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #12
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r3, [r7, #80]	
	adds	r3, #12
	ldr	r3, [r3, #0]
	add	r3, r2
	ldr	r2, [r7, #100]	
	add	r3, r2
	str	r3, [r7, #100]	
	ldr	r2, [r7, #116]	
	ldr	r3, [r7, #100]	
	add	r3, r2
	str	r3, [r7, #116]	
	ldr	r3, [r7, #96]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #96]	
	ldr	r3, [r7, #92]	
	ands	r1, r3
	ldr	r0, [r7, #96]	
	ldr	r3, [r7, #92]	
	eors	r0, r3
	ldr	r3, [r7, #88]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #100]	
	add	r3, r2
	str	r3, [r7, #100]	
	ldr	r3, [r7, #116]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #112]	
	ldr	r3, [r7, #108]	
	eors	r1, r3
	ldr	r3, [r7, #116]	
	ands	r1, r3
	ldr	r3, [r7, #108]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #16
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r3, [r7, #80]	
	adds	r3, #16
	ldr	r3, [r3, #0]
	add	r3, r2
	ldr	r2, [r7, #104]	
	add	r3, r2
	str	r3, [r7, #104]	
	ldr	r2, [r7, #88]	
	ldr	r3, [r7, #104]	
	add	r3, r2
	str	r3, [r7, #88]	
	ldr	r3, [r7, #100]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #100]	
	ldr	r3, [r7, #96]	
	ands	r1, r3
	ldr	r0, [r7, #100]	
	ldr	r3, [r7, #96]	
	eors	r0, r3
	ldr	r3, [r7, #92]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #104]	
	add	r3, r2
	str	r3, [r7, #104]	
	ldr	r3, [r7, #88]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #116]	
	ldr	r3, [r7, #112]	
	eors	r1, r3
	ldr	r3, [r7, #88]	
	ands	r1, r3
	ldr	r3, [r7, #112]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #20
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r3, [r7, #80]	
	adds	r3, #20
	ldr	r3, [r3, #0]
	add	r3, r2
	ldr	r2, [r7, #108]	
	add	r3, r2
	str	r3, [r7, #108]	
	ldr	r2, [r7, #92]	
	ldr	r3, [r7, #108]	
	add	r3, r2
	str	r3, [r7, #92]	
	ldr	r3, [r7, #104]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #104]	
	ldr	r3, [r7, #100]	
	ands	r1, r3
	ldr	r0, [r7, #104]	
	ldr	r3, [r7, #100]	
	eors	r0, r3
	ldr	r3, [r7, #96]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #108]	
	add	r3, r2
	str	r3, [r7, #108]	
	ldr	r3, [r7, #92]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #88]	
	ldr	r3, [r7, #116]	
	eors	r1, r3
	ldr	r3, [r7, #92]	
	ands	r1, r3
	ldr	r3, [r7, #116]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #24
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r3, [r7, #80]	
	adds	r3, #24
	ldr	r3, [r3, #0]
	add	r3, r2
	ldr	r2, [r7, #112]	
	add	r3, r2
	str	r3, [r7, #112]	
	ldr	r2, [r7, #96]	
	ldr	r3, [r7, #112]	
	add	r3, r2
	str	r3, [r7, #96]	
	ldr	r3, [r7, #108]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #108]	
	ldr	r3, [r7, #104]	
	ands	r1, r3
	ldr	r0, [r7, #108]	
	ldr	r3, [r7, #104]	
	eors	r0, r3
	ldr	r3, [r7, #100]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #112]	
	add	r3, r2
	str	r3, [r7, #112]	
	ldr	r3, [r7, #96]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #92]	
	ldr	r3, [r7, #88]	
	eors	r1, r3
	ldr	r3, [r7, #96]	
	ands	r1, r3
	ldr	r3, [r7, #88]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #28
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r3, [r7, #80]	
	adds	r3, #28
	ldr	r3, [r3, #0]
	add	r3, r2
	ldr	r2, [r7, #116]	
	add	r3, r2
	str	r3, [r7, #116]	
	ldr	r2, [r7, #100]	
	ldr	r3, [r7, #116]	
	add	r3, r2
	str	r3, [r7, #100]	
	ldr	r3, [r7, #112]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #112]	
	ldr	r3, [r7, #108]	
	ands	r1, r3
	ldr	r0, [r7, #112]	
	ldr	r3, [r7, #108]	
	eors	r0, r3
	ldr	r3, [r7, #104]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #116]	
	add	r3, r2
	str	r3, [r7, #116]	
	ldr	r3, [r7, #84]	
	adds	r3, #8
	str	r3, [r7, #84]	
	ldr	r3, [r7, #4]
	adds	r3, #32
	str	r3, [r7, #4]
	ldr	r3, [r7, #80]	
	adds	r3, #32
	str	r3, [r7, #80]	
lab17: 	ldr	r3, [r7, #84]	
	cmp	r3, #15
	bls	lab18
	b	lab19
lab20: 	mov	r2, r3, ror #6
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #96]	
	ldr	r3, [r7, #92]	
	eors	r1, r3
	ldr	r3, [r7, #100]	
	ands	r1, r3
	ldr	r3, [r7, #92]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #16]
	ldr	r3, [r7, #72]	
	mov	r0, r3, ror #17
	ldr	r3, [r7, #72]	
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #72]	
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #52]	
	add	r0, r3
	ldr	r3, [r7, #20]
	mov	r4, r3, ror #7
	ldr	r3, [r7, #20]
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	add	r3, r2
	ldr	r2, [r7, #88]	
	add	r3, r2
	str	r3, [r7, #88]	
	ldr	r2, [r7, #104]	
	ldr	r3, [r7, #88]	
	add	r3, r2
	str	r3, [r7, #104]	
	ldr	r3, [r7, #116]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #116]	
	ldr	r3, [r7, #112]	
	ands	r1, r3
	ldr	r0, [r7, #116]	
	ldr	r3, [r7, #112]	
	eors	r0, r3
	ldr	r3, [r7, #108]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #88]	
	add	r3, r2
	str	r3, [r7, #88]	
	ldr	r3, [r7, #104]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #100]	
	ldr	r3, [r7, #96]	
	eors	r1, r3
	ldr	r3, [r7, #104]	
	ands	r1, r3
	ldr	r3, [r7, #96]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #20]
	ldr	r3, [r7, #76]	
	mov	r0, r3, ror #17
	ldr	r3, [r7, #76]	
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #76]	
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #56]	
	add	r0, r3
	ldr	r3, [r7, #24]
	mov	r4, r3, ror #7
	ldr	r3, [r7, #24]
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	add	r3, r2
	ldr	r2, [r7, #92]	
	add	r3, r2
	str	r3, [r7, #92]	
	ldr	r2, [r7, #108]	
	ldr	r3, [r7, #92]	
	add	r3, r2
	str	r3, [r7, #108]	
	ldr	r3, [r7, #88]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #88]	
	ldr	r3, [r7, #116]	
	ands	r1, r3
	ldr	r0, [r7, #88]	
	ldr	r3, [r7, #116]	
	eors	r0, r3
	ldr	r3, [r7, #112]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #92]	
	add	r3, r2
	str	r3, [r7, #92]	
	ldr	r3, [r7, #108]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #104]	
	ldr	r3, [r7, #100]	
	eors	r1, r3
	ldr	r3, [r7, #108]	
	ands	r1, r3
	ldr	r3, [r7, #100]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #24]
	ldr	r3, [r7, #16]
	mov	r0, r3, ror #17
	ldr	r3, [r7, #16]
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #16]
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #60]	
	add	r0, r3
	ldr	r3, [r7, #28]
	mov	r4, r3, ror #7
	ldr	r3, [r7, #28]
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #28]
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #24]
	ldr	r3, [r7, #24]
	add	r3, r2
	ldr	r2, [r7, #96]	
	add	r3, r2
	str	r3, [r7, #96]	
	ldr	r2, [r7, #112]	
	ldr	r3, [r7, #96]	
	add	r3, r2
	str	r3, [r7, #112]	
	ldr	r3, [r7, #92]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #92]	
	ldr	r3, [r7, #88]	
	ands	r1, r3
	ldr	r0, [r7, #92]	
	ldr	r3, [r7, #88]	
	eors	r0, r3
	ldr	r3, [r7, #116]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #96]	
	add	r3, r2
	str	r3, [r7, #96]	
	ldr	r3, [r7, #112]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #108]	
	ldr	r3, [r7, #104]	
	eors	r1, r3
	ldr	r3, [r7, #112]	
	ands	r1, r3
	ldr	r3, [r7, #104]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #12
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #28]
	ldr	r3, [r7, #20]
	mov	r0, r3, ror #17
	ldr	r3, [r7, #20]
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #64]	
	add	r0, r3
	ldr	r3, [r7, #32]
	mov	r4, r3, ror #7
	ldr	r3, [r7, #32]
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #32]
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #28]
	ldr	r3, [r7, #28]
	add	r3, r2
	ldr	r2, [r7, #100]	
	add	r3, r2
	str	r3, [r7, #100]	
	ldr	r2, [r7, #116]	
	ldr	r3, [r7, #100]	
	add	r3, r2
	str	r3, [r7, #116]	
	ldr	r3, [r7, #96]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #96]	
	ldr	r3, [r7, #92]	
	ands	r1, r3
	ldr	r0, [r7, #96]	
	ldr	r3, [r7, #92]	
	eors	r0, r3
	ldr	r3, [r7, #88]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #100]	
	add	r3, r2
	str	r3, [r7, #100]	
	ldr	r3, [r7, #116]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #112]	
	ldr	r3, [r7, #108]	
	eors	r1, r3
	ldr	r3, [r7, #116]	
	ands	r1, r3
	ldr	r3, [r7, #108]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #16
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #32]
	ldr	r3, [r7, #24]
	mov	r0, r3, ror #17
	ldr	r3, [r7, #24]
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #68]	
	add	r0, r3
	ldr	r3, [r7, #36]	
	mov	r4, r3, ror #7
	ldr	r3, [r7, #36]	
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #36]	
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #32]
	ldr	r3, [r7, #32]
	add	r3, r2
	ldr	r2, [r7, #104]	
	add	r3, r2
	str	r3, [r7, #104]	
	ldr	r2, [r7, #88]	
	ldr	r3, [r7, #104]	
	add	r3, r2
	str	r3, [r7, #88]	
	ldr	r3, [r7, #100]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #100]	
	ldr	r3, [r7, #96]	
	ands	r1, r3
	ldr	r0, [r7, #100]	
	ldr	r3, [r7, #96]	
	eors	r0, r3
	ldr	r3, [r7, #92]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #104]	
	add	r3, r2
	str	r3, [r7, #104]	
	ldr	r3, [r7, #88]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #116]	
	ldr	r3, [r7, #112]	
	eors	r1, r3
	ldr	r3, [r7, #88]	
	ands	r1, r3
	ldr	r3, [r7, #112]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #20
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #36]	
	ldr	r3, [r7, #28]
	mov	r0, r3, ror #17
	ldr	r3, [r7, #28]
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #28]
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #72]	
	add	r0, r3
	ldr	r3, [r7, #40]	
	mov	r4, r3, ror #7
	ldr	r3, [r7, #40]	
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #36]	
	ldr	r3, [r7, #36]	
	add	r3, r2
	ldr	r2, [r7, #108]	
	add	r3, r2
	str	r3, [r7, #108]	
	ldr	r2, [r7, #92]	
	ldr	r3, [r7, #108]	
	add	r3, r2
	str	r3, [r7, #92]	
	ldr	r3, [r7, #104]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #104]	
	ldr	r3, [r7, #100]	
	ands	r1, r3
	ldr	r0, [r7, #104]	
	ldr	r3, [r7, #100]	
	eors	r0, r3
	ldr	r3, [r7, #96]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #108]	
	add	r3, r2
	str	r3, [r7, #108]	
	ldr	r3, [r7, #92]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #88]	
	ldr	r3, [r7, #116]	
	eors	r1, r3
	ldr	r3, [r7, #92]	
	ands	r1, r3
	ldr	r3, [r7, #116]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #24
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #40]	
	ldr	r3, [r7, #32]
	mov	r0, r3, ror #17
	ldr	r3, [r7, #32]
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #32]
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #76]	
	add	r0, r3
	ldr	r3, [r7, #44]	
	mov	r4, r3, ror #7
	ldr	r3, [r7, #44]	
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #40]	
	ldr	r3, [r7, #40]	
	add	r3, r2
	ldr	r2, [r7, #112]	
	add	r3, r2
	str	r3, [r7, #112]	
	ldr	r2, [r7, #96]	
	ldr	r3, [r7, #112]	
	add	r3, r2
	str	r3, [r7, #96]	
	ldr	r3, [r7, #108]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #108]	
	ldr	r3, [r7, #104]	
	ands	r1, r3
	ldr	r0, [r7, #108]	
	ldr	r3, [r7, #104]	
	eors	r0, r3
	ldr	r3, [r7, #100]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #112]	
	add	r3, r2
	str	r3, [r7, #112]	
	ldr	r3, [r7, #96]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #92]	
	ldr	r3, [r7, #88]	
	eors	r1, r3
	ldr	r3, [r7, #96]	
	ands	r1, r3
	ldr	r3, [r7, #88]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #28
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #44]	
	ldr	r3, [r7, #36]	
	mov	r0, r3, ror #17
	ldr	r3, [r7, #36]	
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #36]	
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #16]
	add	r0, r3
	ldr	r3, [r7, #48]	
	mov	r4, r3, ror #7
	ldr	r3, [r7, #48]	
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #44]	
	ldr	r3, [r7, #44]	
	add	r3, r2
	ldr	r2, [r7, #116]	
	add	r3, r2
	str	r3, [r7, #116]	
	ldr	r2, [r7, #100]	
	ldr	r3, [r7, #116]	
	add	r3, r2
	str	r3, [r7, #100]	
	ldr	r3, [r7, #112]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #112]	
	ldr	r3, [r7, #108]	
	ands	r1, r3
	ldr	r0, [r7, #112]	
	ldr	r3, [r7, #108]	
	eors	r0, r3
	ldr	r3, [r7, #104]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #116]	
	add	r3, r2
	str	r3, [r7, #116]	
	ldr	r3, [r7, #100]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #96]	
	ldr	r3, [r7, #92]	
	eors	r1, r3
	ldr	r3, [r7, #100]	
	ands	r1, r3
	ldr	r3, [r7, #92]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #32
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #48]	
	ldr	r3, [r7, #40]	
	mov	r0, r3, ror #17
	ldr	r3, [r7, #40]	
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #20]
	add	r0, r3
	ldr	r3, [r7, #52]	
	mov	r4, r3, ror #7
	ldr	r3, [r7, #52]	
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #48]	
	ldr	r3, [r7, #48]	
	add	r3, r2
	ldr	r2, [r7, #88]	
	add	r3, r2
	str	r3, [r7, #88]	
	ldr	r2, [r7, #104]	
	ldr	r3, [r7, #88]	
	add	r3, r2
	str	r3, [r7, #104]	
	ldr	r3, [r7, #116]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #116]	
	ldr	r3, [r7, #112]	
	ands	r1, r3
	ldr	r0, [r7, #116]	
	ldr	r3, [r7, #112]	
	eors	r0, r3
	ldr	r3, [r7, #108]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #88]	
	add	r3, r2
	str	r3, [r7, #88]	
	ldr	r3, [r7, #104]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #100]	
	ldr	r3, [r7, #96]	
	eors	r1, r3
	ldr	r3, [r7, #104]	
	ands	r1, r3
	ldr	r3, [r7, #96]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #36	
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #52]	
	ldr	r3, [r7, #44]	
	mov	r0, r3, ror #17
	ldr	r3, [r7, #44]	
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #24]
	add	r0, r3
	ldr	r3, [r7, #56]	
	mov	r4, r3, ror #7
	ldr	r3, [r7, #56]	
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #56]	
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #52]	
	ldr	r3, [r7, #52]	
	add	r3, r2
	ldr	r2, [r7, #92]	
	add	r3, r2
	str	r3, [r7, #92]	
	ldr	r2, [r7, #108]	
	ldr	r3, [r7, #92]	
	add	r3, r2
	str	r3, [r7, #108]	
	ldr	r3, [r7, #88]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #88]	
	ldr	r3, [r7, #116]	
	ands	r1, r3
	ldr	r0, [r7, #88]	
	ldr	r3, [r7, #116]	
	eors	r0, r3
	ldr	r3, [r7, #112]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #92]	
	add	r3, r2
	str	r3, [r7, #92]	
	ldr	r3, [r7, #108]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #104]	
	ldr	r3, [r7, #100]	
	eors	r1, r3
	ldr	r3, [r7, #108]	
	ands	r1, r3
	ldr	r3, [r7, #100]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #40	
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #56]	
	ldr	r3, [r7, #48]	
	mov	r0, r3, ror #17
	ldr	r3, [r7, #48]	
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #28]
	add	r0, r3
	ldr	r3, [r7, #60]	
	mov	r4, r3, ror #7
	ldr	r3, [r7, #60]	
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #60]	
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #56]	
	ldr	r3, [r7, #56]	
	add	r3, r2
	ldr	r2, [r7, #96]	
	add	r3, r2
	str	r3, [r7, #96]	
	ldr	r2, [r7, #112]	
	ldr	r3, [r7, #96]	
	add	r3, r2
	str	r3, [r7, #112]	
	ldr	r3, [r7, #92]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #92]	
	ldr	r3, [r7, #88]	
	ands	r1, r3
	ldr	r0, [r7, #92]	
	ldr	r3, [r7, #88]	
	eors	r0, r3
	ldr	r3, [r7, #116]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #96]	
	add	r3, r2
	str	r3, [r7, #96]	
	ldr	r3, [r7, #112]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #108]	
	ldr	r3, [r7, #104]	
	eors	r1, r3
	ldr	r3, [r7, #112]	
	ands	r1, r3
	ldr	r3, [r7, #104]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #44	
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #60]	
	ldr	r3, [r7, #52]	
	mov	r0, r3, ror #17
	ldr	r3, [r7, #52]	
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #32]
	add	r0, r3
	ldr	r3, [r7, #64]	
	mov	r4, r3, ror #7
	ldr	r3, [r7, #64]	
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #64]	
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #60]	
	ldr	r3, [r7, #60]	
	add	r3, r2
	ldr	r2, [r7, #100]	
	add	r3, r2
	str	r3, [r7, #100]	
	ldr	r2, [r7, #116]	
	ldr	r3, [r7, #100]	
	add	r3, r2
	str	r3, [r7, #116]	
	ldr	r3, [r7, #96]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #96]	
	ldr	r3, [r7, #92]	
	ands	r1, r3
	ldr	r0, [r7, #96]	
	ldr	r3, [r7, #92]	
	eors	r0, r3
	ldr	r3, [r7, #88]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #100]	
	add	r3, r2
	str	r3, [r7, #100]	
	ldr	r3, [r7, #116]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #116]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #112]	
	ldr	r3, [r7, #108]	
	eors	r1, r3
	ldr	r3, [r7, #116]	
	ands	r1, r3
	ldr	r3, [r7, #108]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #48	
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #64]	
	ldr	r3, [r7, #56]	
	mov	r0, r3, ror #17
	ldr	r3, [r7, #56]	
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #56]	
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #36]	
	add	r0, r3
	ldr	r3, [r7, #68]	
	mov	r4, r3, ror #7
	ldr	r3, [r7, #68]	
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #68]	
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #64]	
	ldr	r3, [r7, #64]	
	add	r3, r2
	ldr	r2, [r7, #104]	
	add	r3, r2
	str	r3, [r7, #104]	
	ldr	r2, [r7, #88]	
	ldr	r3, [r7, #104]	
	add	r3, r2
	str	r3, [r7, #88]	
	ldr	r3, [r7, #100]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #100]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #100]	
	ldr	r3, [r7, #96]	
	ands	r1, r3
	ldr	r0, [r7, #100]	
	ldr	r3, [r7, #96]	
	eors	r0, r3
	ldr	r3, [r7, #92]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #104]	
	add	r3, r2
	str	r3, [r7, #104]	
	ldr	r3, [r7, #88]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #88]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #116]	
	ldr	r3, [r7, #112]	
	eors	r1, r3
	ldr	r3, [r7, #88]	
	ands	r1, r3
	ldr	r3, [r7, #112]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #52	
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #68]	
	ldr	r3, [r7, #60]	
	mov	r0, r3, ror #17
	ldr	r3, [r7, #60]	
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #60]	
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #40]	
	add	r0, r3
	ldr	r3, [r7, #72]	
	mov	r4, r3, ror #7
	ldr	r3, [r7, #72]	
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #72]	
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #68]	
	ldr	r3, [r7, #68]	
	add	r3, r2
	ldr	r2, [r7, #108]	
	add	r3, r2
	str	r3, [r7, #108]	
	ldr	r2, [r7, #92]	
	ldr	r3, [r7, #108]	
	add	r3, r2
	str	r3, [r7, #92]	
	ldr	r3, [r7, #104]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #104]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #104]	
	ldr	r3, [r7, #100]	
	ands	r1, r3
	ldr	r0, [r7, #104]	
	ldr	r3, [r7, #100]	
	eors	r0, r3
	ldr	r3, [r7, #96]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #108]	
	add	r3, r2
	str	r3, [r7, #108]	
	ldr	r3, [r7, #92]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #92]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #88]	
	ldr	r3, [r7, #116]	
	eors	r1, r3
	ldr	r3, [r7, #92]	
	ands	r1, r3
	ldr	r3, [r7, #116]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #56	
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #72]	
	ldr	r3, [r7, #64]	
	mov	r0, r3, ror #17
	ldr	r3, [r7, #64]	
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #64]	
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #44]	
	add	r0, r3
	ldr	r3, [r7, #76]	
	mov	r4, r3, ror #7
	ldr	r3, [r7, #76]	
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #76]	
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #72]	
	ldr	r3, [r7, #72]	
	add	r3, r2
	ldr	r2, [r7, #112]	
	add	r3, r2
	str	r3, [r7, #112]	
	ldr	r2, [r7, #96]	
	ldr	r3, [r7, #112]	
	add	r3, r2
	str	r3, [r7, #96]	
	ldr	r3, [r7, #108]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #108]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #108]	
	ldr	r3, [r7, #104]	
	ands	r1, r3
	ldr	r0, [r7, #108]	
	ldr	r3, [r7, #104]	
	eors	r0, r3
	ldr	r3, [r7, #100]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #112]	
	add	r3, r2
	str	r3, [r7, #112]	
	ldr	r3, [r7, #96]	
	mov	r2, r3, ror #6
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #11
	eors	r2, r3
	ldr	r3, [r7, #96]	
	mov	r3, r3, ror #25
	eors	r2, r3
	ldr	r1, [r7, #92]	
	ldr	r3, [r7, #88]	
	eors	r1, r3
	ldr	r3, [r7, #96]	
	ands	r1, r3
	ldr	r3, [r7, #88]	
	eors	r3, r1
	add	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #60	
	ldr	r3, [r3, #0]
	add	r2, r3
	ldr	r1, [r7, #76]	
	ldr	r3, [r7, #68]	
	mov	r0, r3, ror #17
	ldr	r3, [r7, #68]	
	mov	r3, r3, ror #19
	eors	r0, r3
	ldr	r3, [r7, #68]	
	lsrs	r3, r3, #10
	eors	r0, r3
	ldr	r3, [r7, #48]	
	add	r0, r3
	ldr	r3, [r7, #16]
	mov	r4, r3, ror #7
	ldr	r3, [r7, #16]
	mov	r3, r3, ror #18
	eors	r4, r3
	ldr	r3, [r7, #16]
	lsrs	r3, r3, #3
	eors	r3, r4
	add	r3, r0
	add	r3, r1
	str	r3, [r7, #76]	
	ldr	r3, [r7, #76]	
	add	r3, r2
	ldr	r2, [r7, #116]	
	add	r3, r2
	str	r3, [r7, #116]	
	ldr	r2, [r7, #100]	
	ldr	r3, [r7, #116]	
	add	r3, r2
	str	r3, [r7, #100]	
	ldr	r3, [r7, #112]	
	mov	r2, r3, ror #2
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #13
	eors	r2, r3
	ldr	r3, [r7, #112]	
	mov	r3, r3, ror #22
	eors	r2, r3
	ldr	r1, [r7, #112]	
	ldr	r3, [r7, #108]	
	ands	r1, r3
	ldr	r0, [r7, #112]	
	ldr	r3, [r7, #108]	
	eors	r0, r3
	ldr	r3, [r7, #104]	
	ands	r3, r0
	eors	r3, r1
	add	r3, r2
	ldr	r2, [r7, #116]	
	add	r3, r2
	str	r3, [r7, #116]	
	ldr	r3, [r7, #84]	
	adds	r3, #16
	str	r3, [r7, #84]	
	ldr	r3, [r7, #4]
	adds	r3, #64	
	str	r3, [r7, #4]
lab19: 	ldr	r3, [r7, #84]	
	cmp	r3, #63	
	bls	lab20
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #116]	
	add	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #4
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #4
	ldr	r2, [r7, #112]	
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #8
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #8
	ldr	r2, [r7, #108]	
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #12
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #12
	ldr	r2, [r7, #104]	
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #16
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #16
	ldr	r2, [r7, #100]	
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #20
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #20
	ldr	r2, [r7, #96]	
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #24
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #24
	ldr	r2, [r7, #92]	
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #28
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #28
	ldr	r2, [r7, #88]	
	add	r2, r1
	str	r2, [r3, #0]
	nop
	adds	r7, #120	
	mov	sp, r7
	pop	{r4, r7}
	bx	lr
	movs	r0, r0
sha256_init:	push {r1, r2}
	ldr r1, =0xa1d98
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #32
	ldr	r1, =H0.0	
	mov	r0, r3
	bl	memcpy
	ldr	r1, [r7, #4]
	mov	r2, #0
	mov	r3, #0
	strd	r2, r3, [r1, #32]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #104]	
	nop
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0xa5797
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	.ltorg
sha256_update:	push {r1, r2}
	ldr r1, =0x267ff
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	stmdb	sp!, {r4, r5, r7, r8, r9, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #104]	
	cmp	r3, #0
	beq	lab21
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #104]	
	rsb	r3, r3, #64	
	str	r3, [r7, #20]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	bcs	lab22
	ldr	r3, [r7, #12]
	add	r2, r3, #40	
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #104]	
	add	r3, r2
	ldr	r2, [r7, #8]
	ldr	r1, [r7, #4]
	mov	r0, r3
	bl	memcpy
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #104]	
	ldr	r3, [r7, #8]
	add	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #104]	
	b	lab23
lab22: 	ldr	r3, [r7, #12]
	add	r2, r3, #40	
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #104]	
	add	r3, r2
	ldr	r2, [r7, #20]
	ldr	r1, [r7, #4]
	mov	r0, r3
	bl	memcpy
	ldr	r0, [r7, #12]
	ldr	r3, [r7, #12]
	adds	r3, #40	
	ldr	r2, =K	
	mov	r1, r3
	bl	_nettle_sha256_compress
	ldr	r3, [r7, #12]
	ldrd	r2, r3, [r3, #32]
	adds	r8, r2, #1
	adc	r9, r3, #0
	ldr	r3, [r7, #12]
	strd	r8, r9, [r3, #32]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #20]
	add	r3, r2
	str	r3, [r7, #4]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	str	r3, [r7, #8]
	b	lab21
lab24: 	ldr	r2, =K	
	ldr	r1, [r7, #4]
	mov	r0, r3
	bl	_nettle_sha256_compress
	ldr	r3, [r7, #12]
	ldrd	r2, r3, [r3, #32]
	adds	r4, r2, #1
	adc	r5, r3, #0
	ldr	r3, [r7, #12]
	strd	r4, r5, [r3, #32]
	ldr	r3, [r7, #4]
	adds	r3, #64	
	str	r3, [r7, #4]
	ldr	r3, [r7, #8]
	subs	r3, #64	
	str	r3, [r7, #8]
lab21: 	ldr	r3, [r7, #8]
	cmp	r3, #63	
	bhi	lab24
	ldr	r3, [r7, #12]
	adds	r3, #40	
	ldr	r2, [r7, #8]
	ldr	r1, [r7, #4]
	mov	r0, r3
	bl	memcpy
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #8]
	str	r2, [r3, #104]	
	nop
lab23: 	nop
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0xbc51a
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	ldmia	sp!, {r4, r5, r7, r8, r9, pc}
	nop
	.ltorg
sha256_write_digest:
	stmdb	sp!, {r4, r5, r7, r8, r9, lr}
	sub	sp, #32
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #8]
	cmp	r3, #32
	bls	lab25
	movs	r0, #1
	bl	exit
lab25: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #104]	
	str	r3, [r7, #28]
	ldr	r3, [r7, #28]
	cmp	r3, #63	
	bls	lab26
	movs	r0, #1
	bl	exit
lab26: 	ldr	r3, [r7, #28]
	adds	r2, r3, #1
	str	r2, [r7, #28]
	ldr	r2, [r7, #12]
	add	r3, r2
	movs	r2, #128	
	strb	r2, [r3, #40]	
	ldr	r3, [r7, #28]
	cmp	r3, #56	
	bls	lab27
	ldr	r3, [r7, #12]
	add	r2, r3, #40	
	ldr	r3, [r7, #28]
	adds	r0, r2, r3
	ldr	r3, [r7, #28]
	rsb	r3, r3, #64	
	mov	r2, r3
	movs	r1, #0
push {r1, r2}
	ldr r1, =0x6cb24
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
	push {r1, r2}
	ldr r1, =0x6cb24
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r0, [r7, #12]
	ldr	r3, [r7, #12]
	adds	r3, #40	
	ldr	r2, =K	
	mov	r1, r3
	bl	_nettle_sha256_compress
	movs	r3, #0
	str	r3, [r7, #28]
lab27: 	ldr	r3, [r7, #12]
	add	r2, r3, #40	
	ldr	r3, [r7, #28]
	adds	r0, r2, r3
	ldr	r3, [r7, #28]
	rsb	r3, r3, #56	
	mov	r2, r3
	movs	r1, #0
push {r1, r2}
	ldr r1, =0xa7c5b
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
	push {r1, r2}
	ldr r1, =0xa7c5b
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r7, #12]
	ldrd	r0, r1, [r3, #32]
	mov	r2, #0
	mov	r3, #0
	lsls	r3, r1, #9
	orr	r3, r3, r0, lsr #23
	lsls	r2, r0, #9
	ldr	r1, [r7, #12]
	ldr	r1, [r1, #104]	
	lsls	r1, r1, #3
	movs	r0, #0
	mov	r4, r1
	mov	r5, r0
	orr	r8, r2, r4
	orr	r9, r3, r5
	strd	r8, r9, [r7, #16]
	ldrd	r0, r1, [r7, #16]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r1, #24
	movs	r3, #0
	uxtb	r2, r2
	ldr	r3, [r7, #12]
	strb	r2, [r3, #96]	
	ldrd	r0, r1, [r7, #16]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r1, #16
	movs	r3, #0
	uxtb	r2, r2
	ldr	r3, [r7, #12]
	strb	r2, [r3, #97]	
	ldrd	r0, r1, [r7, #16]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r1, #8
	movs	r3, #0
	uxtb	r2, r2
	ldr	r3, [r7, #12]
	strb	r2, [r3, #98]	
	ldrd	r0, r1, [r7, #16]
	mov	r2, #0
	mov	r3, #0
	movs	r2, r1
	movs	r3, #0
	uxtb	r2, r2
	ldr	r3, [r7, #12]
	strb	r2, [r3, #99]	
	ldrd	r0, r1, [r7, #16]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #24
	orr	r2, r2, r1, lsl #8
	lsrs	r3, r1, #24
	uxtb	r2, r2
	ldr	r3, [r7, #12]
	strb	r2, [r3, #100]	
	ldrd	r0, r1, [r7, #16]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #16
	orr	r2, r2, r1, lsl #16
	lsrs	r3, r1, #16
	uxtb	r2, r2
	ldr	r3, [r7, #12]
	strb	r2, [r3, #101]	
	ldrd	r0, r1, [r7, #16]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #8
	orr	r2, r2, r1, lsl #24
	lsrs	r3, r1, #8
	uxtb	r2, r2
	ldr	r3, [r7, #12]
	strb	r2, [r3, #102]	
	ldrb	r2, [r7, #16]
	ldr	r3, [r7, #12]
	strb	r2, [r3, #103]	
	ldr	r0, [r7, #12]
	ldr	r3, [r7, #12]
	adds	r3, #40	
	ldr	r2, =K	
	mov	r1, r3
	bl	_nettle_sha256_compress
	ldr	r3, [r7, #12]
	mov	r2, r3
	ldr	r1, [r7, #4]
	ldr	r0, [r7, #8]
	bl	_nettle_write_be32
	push {r1, r2}
	ldr r1, =0xadbb3
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	nop
	adds	r7, #32
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x071a5
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	ldmia	sp!, {r4, r5, r7, r8, r9, pc}
	nop
	.ltorg
sha256_digest:	push {r1, r2}
	ldr r1, =0x5d578
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	sha256_write_digest
	push {r1, r2}
	ldr r1, =0x731a2
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r0, [r7, #12]
push {r1, r2}
	ldr r1, =0x19245
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	sha256_init
	push {r1, r2}
	ldr r1, =0x19245
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0xb2517
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
verify_benchmark:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #1
	strb	r3, [r7, #15]
	movs	r3, #0
	str	r3, [r7, #8]
	b	lab28
lab30: 	ldr	r3, [r7, #8]
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r1, =buffer	
	ldr	r3, [r7, #8]
	add	r3, r1
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab29
	movs	r3, #0
	strb	r3, [r7, #15]
lab29: 	ldr	r3, [r7, #8]
	adds	r3, #1
	str	r3, [r7, #8]
lab28: 	ldr	r3, [r7, #8]
	cmp	r3, #7
	bls	lab30
	ldrb	r3, [r7, #15]
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
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
	ldr r1, =0x450e0
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x450e0
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
	ldr r1, =0x02779
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movw	r0, #475	
push {r1, r2}
	ldr r1, =0x850e0
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x850e0
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x04645
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
benchmark_body:
	push	{r4, r7, lr}
	sub	sp, #132	
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #124]	
	b	lab31
lab32: 	movs	r1, #0
	ldr	r0, =buffer	
push {r1, r2}
	ldr r1, =0xe7c5b
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
	push {r1, r2}
	ldr r1, =0xe7c5b
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r2, =0x00009115	
	add	r3, r7, #8
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x536e6
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r2
	ldr	r4, =0x00009149	
	push {r1, r2}
	ldr r1, =0x59245
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r3, r7, #8
	ldr	r2, =msg	
	movs	r1, #56	
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x115ce
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r4
	ldr	r4, =0x000093cd	
	push {r1, r2}
	ldr r1, =0x3b54e
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r1, #32
	add	r3, r7, #8
	ldr	r2, =buffer	
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x1a855
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r4
	ldr	r3, [r7, #124]	
	push {r1, r2}
	ldr r1, =0x4a074
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	adds	r3, #1
	str	r3, [r7, #124]	
lab31: 	ldr	r2, [r7, #124]	
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab32
	movs	r3, #0
	mov	r0, r3
	adds	r7, #132	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x72ced
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, r7, pc}
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
	ldr r1, =0xb52ef
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	start_trigger
	bl	benchmark
	push {r1, r2}
	ldr r1, =0x33423
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
	ldr r1, =0x17dc0
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
abort:
	push	{r3, lr}
	movs	r0, #6
	bl	raise
	push {r1, r2}
	ldr r1, =0x0bd19
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, #1
	bl	_exit
	nop
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x00019b64	
	ldr	r5, =0x00019b64	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab33
	movs	r4, #0
lab34: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x288d0
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x6eeae
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab34
lab33: 	ldr	r6, =0x00019b6c	
	ldr	r5, =0x00019b64	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab35
	movs	r4, #0
lab36: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x688d0
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0xaeeae
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab36
lab35:	cpsid f
	push {r1, r2}
	ldr r1, =0x21279
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, r6, pc}
	.ltorg
memcpy:
	mov	ip, r0
	orr	r3, r1, r0
	ands	r3, r3, #3
	bne	lab37
lab46: 	bcc	lab38
lab39: 	str	r3, [r0], #4
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
	bcs	lab39
lab38: 	adds	r2, #48	
	bcc	lab40
lab41: 	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #16
	bcs	lab41
lab40: 	adds	r2, #12
	bcc	lab42
lab43: 	str	r3, [r0], #4
	subs	r2, #4
	bcs	lab43
lab42: 	adds	r2, #4
	beq	lab44
	lsls	r2, r2, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab44
	ldrh	r3, [r1, #0]
	strh	r3, [r0, #0]
lab44: 	mov	r0, ip
	bx	lr
	nop
lab37: 	cmp	r2, #8
	bcc	lab45
	lsls	r3, r1, #30
	beq	lab46
	ands	r3, r0, #3
	beq	lab46
	rsb	r3, r3, #4
	subs	r2, r2, r3
	lsls	r3, r3, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab46
	ldrh	r3, [r1], #2
	strh	r3, [r0], #2
	b	lab46
lab45: 	subs	r2, #4
	bcc	lab42
lab47: 	ldrb	r3, [r1], #1
	strb	r3, [r0], #1
	bcs	lab47
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
	beq	lab48
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab49
	uxtb	r2, r1
	mov	r3, r0
	b	lab50
lab51: 	bcc	lab49
lab50: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab51
lab59: 	bls	lab52
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab53
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab54: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab54
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab55
lab60: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab56: 	cmp	r3, r2
	bne	lab56
	and	r4, ip, #3
lab52: 	cbz	r4, lab49
lab58: 	add	r4, r3
lab57: 	cmp	r4, r3
	bne	lab57
lab49:	cpsid f
	push {r1, r2}
	ldr r1, =0x8d823
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, pc}
lab55: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab58
	b	lab49
lab48: 	mov	r3, r0
	mov	r4, r2
	b	lab59
lab53: 	mov	r2, r3
	mov	ip, r4
	b	lab60
raise:
	push	{r3, r4, r5, lr}
	ldr	r3, =_impure_ptr	
	cmp	r0, #31
	ldr	r5, [r3, #0]
	bhi	lab61
	ldr	r2, [r5, #732]	
	mov	r4, r0
	cbz	r2, lab62
	ldr	r3, [r2, r0, lsl #2]
	cbz	r3, lab62
	cmp	r3, #1
	beq	lab63
	adds	r1, r3, #1
	beq	lab64
	movs	r5, #0
	str	r5, [r2, r0, lsl #2]
	blx	r3
	mov	r0, r5
	cpsid f
	push {r1, r2}
	ldr r1, =0x24e21
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r3, r4, r5, pc}
lab62: 	mov	r0, r5
	bl	_getpid_r
	mov	r2, r4
	mov	r1, r0
	mov	r0, r5
	ldmia	sp!, {r3, r4, r5, lr}
	b	_kill_r
lab64: 	movs	r3, #22
	str	r3, [r5, #0]
	movs	r0, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x64e21
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r3, r4, r5, pc}
lab63: 	movs	r0, #0
	cpsid f
	push {r1, r2}
	ldr r1, =0xa4e21
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r3, r4, r5, pc}
lab61: 	movs	r3, #22
	str	r3, [r5, #0]
	mov	r0, #4294967295	
	cpsid f
	push {r1, r2}
	ldr r1, =0xe4e21
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r3, r4, r5, pc}
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
	beq	lab65
lab66:	cpsid f
	push {r1, r2}
	ldr r1, =0x32cc3
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 lab65: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab66
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	ldr r1, =0x72cc3
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, r5, r6, pc}
	nop
	.ltorg
_getpid_r:
	b	_getpid
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
	cbz	r6, lab67
	mov	r9, #1
	mov	sl, #0
lab73: 	subs	r5, r4, #1
	bmi	lab67
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab69: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab68
lab70: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab69
lab67: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab68: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab70
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab71
	blx	r2
lab76: 	cmp	r2, fp
	bne	lab72
lab75: 	cmp	r3, r6
	beq	lab70
	mov	r6, r3
	cmp	r6, #0
	bne	lab73
	b	lab67
lab71: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab74
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab75
lab72: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab73
	b	lab67
lab74: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab76
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =msg	
	ldr	r5, =0x00019b6c	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab77
	subs	r3, #4
	add	r5, r3
lab78: 	ldr	r3, [r5], #-4
	cpsid f
	push {r1, r2}
	ldr r1, =0x0de6e
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r4, #0
	push {r1, r2}
	ldr r1, =0x35b1d
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab78
lab77: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab79
lab83: 	cmp	r5, #31
	bgt	lab80
	cbnz	r6, lab81
lab82: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab84:	cpsid f
	push {r1, r2}
	ldr r1, =0x4f41b
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 lab81: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab82
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab82
lab79: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab83
lab80: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab84
	.ltorg
_getpid:
	ldr	r3, =errno	
	movs	r2, #88	
	str	r2, [r3, #0]
	mov	r0, #4294967295	
	bx	lr
	.ltorg
_kill:
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

K:
	.word	0x428a2f98
	.word	0x71374491
	.word	0xb5c0fbcf
	.word	0xe9b5dba5
	.word	0x3956c25b
	.word	0x59f111f1
	.word	0x923f82a4
	.word	0xab1c5ed5
	.word	0xd807aa98
	.word	0x12835b01
	.word	0x243185be
	.word	0x550c7dc3
	.word	0x72be5d74
	.word	0x80deb1fe
	.word	0x9bdc06a7
	.word	0xc19bf174
	.word	0xe49b69c1
	.word	0xefbe4786
	.word	0x0fc19dc6
	.word	0x240ca1cc
	.word	0x2de92c6f
	.word	0x4a7484aa
	.word	0x5cb0a9dc
	.word	0x76f988da
	.word	0x983e5152
	.word	0xa831c66d
	.word	0xb00327c8
	.word	0xbf597fc7
	.word	0xc6e00bf3
	.word	0xd5a79147
	.word	0x06ca6351
	.word	0x14292967
	.word	0x27b70a85
	.word	0x2e1b2138
	.word	0x4d2c6dfc
	.word	0x53380d13
	.word	0x650a7354
	.word	0x766a0abb
	.word	0x81c2c92e
	.word	0x92722c85
	.word	0xa2bfe8a1
	.word	0xa81a664b
	.word	0xc24b8b70
	.word	0xc76c51a3
	.word	0xd192e819
	.word	0xd6990624
	.word	0xf40e3585
	.word	0x106aa070
	.word	0x19a4c116
	.word	0x1e376c08
	.word	0x2748774c
	.word	0x34b0bcb5
	.word	0x391c0cb3
	.word	0x4ed8aa4a
	.word	0x5b9cca4f
	.word	0x682e6ff3
	.word	0x748f82ee
	.word	0x78a5636f
	.word	0x84c87814
	.word	0x8cc70208
	.word	0x90befffa
	.word	0xa4506ceb
	.word	0xbef9a3f7
	.word	0xc67178f2
	.word	0x32616873
	.word	0x00003635
nettle_sha256:
	.word	0x00009b10
	.word	0x00000070
	.word	0x00000020
	.word	0x00000040
	.word	0x00009115
	.word	0x00009149
	.word	0x000093cd
H0.0:
	.word	0x6a09e667
	.word	0xbb67ae85
	.word	0x3c6ef372
	.word	0xa54ff53a
	.word	0x510e527f
	.word	0x9b05688c
	.word	0x1f83d9ab
	.word	0x5be0cd19
_global_impure_ptr:
	.word	0x00019bd0


	.data

msg:
	.word	0x64636261
	.word	0x65646362
	.word	0x66656463
	.word	0x67666564
	.word	0x68676665
	.word	0x69686766
	.word	0x6a696867
	.word	0x6b6a6968
	.word	0x6c6b6a69
	.word	0x6d6c6b6a
	.word	0x6e6d6c6b
	.word	0x6f6e6d6c
	.word	0x706f6e6d
	.word	0x71706f6e
hash:
	.word	0x616a8d24
	.word	0xb83806d2
	.word	0x9326c0e5
	.word	0x39603e0c
	.word	0x59e43ca3
	.word	0x6721ff64
	.word	0xd4edecf6
	.word	0xc106db19
_impure_ptr:
	.word	0x00019bd0
	.word	0x00000000
impure_data:
	.word	0x00000000
	.word	0x00019ebc
	.word	0x00019f24
	.word	0x00019f8c
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
	.word	0x0001a038


	.bss

__bss_start:
	.word	0x00000000
object.0:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
buffer:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
__lock___atexit_recursive_mutex:
	.word	0x00000000
errno:
	.word	0x00000000
