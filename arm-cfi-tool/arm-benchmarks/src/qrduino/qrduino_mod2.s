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
	mov.w r1, #6817
	mov.w r2, #1610612736 
	cbz	r3, lab1
	ldr	r0, =0x0000c1d5	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	mov.w r1, #4592
	mov.w r2, #1610612736 
	ldr	r4, =__bss_start	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x0000e4a8	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	mov.w r1, #8070
	mov.w r2, #1610612736 
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x0000e4a8	
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
	ldr	r2, =0x00020f08	
	subs	r2, r2, r0
push {r1, r2}
	mov.w r1, #8126
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8126
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
	ldr	r0, =0x0000bf1d	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x0000c1d5	
push {r1, r2}
	mov.w r1, #2647
	mov.w r2, #1610612736 
lab7:	push {r1, r2}
	mov.w r1, #2647
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3066
	mov.w r2, #1610612736 
	movs	r1, r5
	bl	main
	push {r1, r2}
	mov.w r1, #2323
	mov.w r2, #1610612736 
	nop
	.ltorg
modnn:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	b	lab8
lab9: 	subs	r3, #255	
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	lsrs	r2, r3, #8
	ldr	r3, [r7, #4]
	uxtb	r3, r3
	add	r3, r2
	str	r3, [r7, #4]
lab8: 	ldr	r3, [r7, #4]
	cmp	r3, #254	
	bhi	lab9
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
initrspoly:
	push	{r4, r7, lr}
	sub	sp, #20
	add	r7, sp, #0
	mov	r3, r0
	str	r1, [r7, #0]
	strb	r3, [r7, #7]
	ldr	r3, [r7, #0]
	movs	r2, #1
	strb	r2, [r3, #0]
	movs	r3, #0
	strb	r3, [r7, #15]
	b	lab10
lab15: 	adds	r3, #1
	ldr	r2, [r7, #0]
	add	r3, r2
	movs	r2, #1
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	strb	r3, [r7, #14]
	b	lab11
lab14: 	ldr	r2, [r7, #0]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab12
	ldrb	r3, [r7, #14]
	subs	r3, #1
	ldr	r2, [r7, #0]
	add	r3, r2
	ldrb	r4, [r3, #0]
	ldrb	r3, [r7, #14]
	ldr	r2, [r7, #0]
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =g0log	
	ldrb	r3, [r3, r2]
	mov	r2, r3
	ldrb	r3, [r7, #15]
	add	r3, r2
	mov	r0, r3
	bl	modnn
	mov	r3, r0
	ldr	r2, =g0exp	
	ldrb	r3, [r2, r3]
	eors	r3, r4
	uxtb	r3, r3
	b	lab13
lab12: 	ldrb	r3, [r7, #14]
	subs	r3, #1
	ldr	r2, [r7, #0]
	add	r3, r2
	ldrb	r3, [r3, #0]
lab13: 	ldrb	r2, [r7, #14]
	ldr	r1, [r7, #0]
	add	r2, r1
	strb	r3, [r2, #0]
	ldrb	r3, [r7, #14]
	subs	r3, #1
	strb	r3, [r7, #14]
lab11: 	ldrb	r3, [r7, #14]
	cmp	r3, #0
	bne	lab14
	ldr	r3, [r7, #0]
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =g0log	
	ldrb	r3, [r3, r2]
	mov	r2, r3
	ldrb	r3, [r7, #15]
	add	r3, r2
	mov	r0, r3
	bl	modnn
	mov	r3, r0
	ldr	r2, =g0exp	
	ldrb	r2, [r2, r3]
	ldr	r3, [r7, #0]
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
lab10: 	ldrb	r2, [r7, #15]
	ldrb	r3, [r7, #7]
	cmp	r2, r3
	bcc	lab15
	movs	r3, #0
	strb	r3, [r7, #15]
	b	lab16
lab17: 	ldr	r2, [r7, #0]
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r1, r3
	ldrb	r3, [r7, #15]
	ldr	r2, [r7, #0]
	add	r3, r2
	ldr	r2, =g0log	
	ldrb	r2, [r2, r1]
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
lab16: 	ldrb	r2, [r7, #15]
	ldrb	r3, [r7, #7]
	cmp	r2, r3
	bls	lab17
	nop
	nop
	adds	r7, #20
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2043
	mov.w r2, #1610612736 
	nop
	.ltorg
appendrs:
	push	{r4, r7, lr}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r2, [r7, #4]
	mov	r2, r3
	mov	r3, r1
	strb	r3, [r7, #11]
	mov	r3, r2
	strb	r3, [r7, #10]
	ldrb	r3, [r7, #10]
	mov	r2, r3
	movs	r1, #0
	ldr	r0, [r7, #4]
push {r1, r2}
	mov.w r1, #6138
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6138
	mov.w r2, #1610612736 
	strb	r3, [r7, #23]
	b	lab18
lab25: 	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	eors	r3, r2
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, =g0log	
	ldrb	r3, [r3, r2]
	strb	r3, [r7, #21]
	ldrb	r3, [r7, #21]
	cmp	r3, #255	
	beq	lab19
	movs	r3, #1
	strb	r3, [r7, #22]
	b	lab20
lab21: 	ldr	r2, [r7, #4]
	add	r3, r2
	ldrb	r4, [r3, #0]
	ldrb	r3, [r7, #21]
	ldrb	r1, [r7, #10]
	ldrb	r2, [r7, #22]
	subs	r2, r1, r2
	mov	r1, r2
	ldr	r2, [r7, #40]	
	add	r2, r1
	ldrb	r2, [r2, #0]
	add	r3, r2
	mov	r0, r3
	bl	modnn
	mov	r3, r0
	ldr	r2, =g0exp	
	ldrb	r2, [r2, r3]
	ldrb	r3, [r7, #22]
	subs	r3, #1
	ldr	r1, [r7, #4]
	add	r3, r1
	eors	r2, r4
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #22]
	adds	r3, #1
	strb	r3, [r7, #22]
lab20: 	ldrb	r2, [r7, #22]
	ldrb	r3, [r7, #10]
	cmp	r2, r3
	bcc	lab21
	b	lab22
lab19: 	ldr	r3, [r7, #4]
	adds	r1, r3, #1
	ldrb	r3, [r7, #10]
	subs	r3, #1
	mov	r2, r3
	ldr	r0, [r7, #4]
push {r1, r2}
	mov.w r1, #1247
	mov.w r2, #1610612736 
lab22:	push {r1, r2}
	mov.w r1, #1247
	mov.w r2, #1610612736 
	cmp	r3, #255	
	beq	lab23
	ldrb	r3, [r7, #21]
	ldr	r2, [r7, #40]	
	ldrb	r2, [r2, #0]
	add	r3, r2
	mov	r0, r3
	bl	modnn
	mov	r3, r0
	ldr	r2, =g0exp	
	ldrb	r1, [r2, r3]
	b	lab24
lab23: 	movs	r1, #0
lab24: 	ldrb	r3, [r7, #10]
	subs	r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	mov	r2, r1
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #23]
	adds	r3, #1
	strb	r3, [r7, #23]
lab18: 	ldrb	r2, [r7, #23]
	ldrb	r3, [r7, #11]
	cmp	r2, r3
	bcc	lab25
	nop
	nop
	adds	r7, #28
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2119
	mov.w r2, #1610612736 
	.ltorg
stringtoqr:
	push	{r4, r7, lr}
	sub	sp, #36	
	add	r7, sp, #8
	ldr	r3, =strinbuf	
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	strlen
	str	r0, [r7, #16]
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =neccblk1	
	ldrb	r3, [r3, #0]
	mov	r1, r3
	ldr	r3, =neccblk2	
	ldrb	r3, [r3, #0]
	add	r3, r1
	mul	r3, r2, r3
	ldr	r2, =neccblk2	
	ldrb	r2, [r2, #0]
	add	r3, r2
	str	r3, [r7, #0]
	ldr	r3, [r7, #0]
	subs	r3, #2
	ldr	r2, [r7, #16]
	cmp	r2, r3
	bcc	lab26
	ldr	r3, [r7, #0]
	subs	r3, #2
	str	r3, [r7, #16]
	ldr	r3, =VERSION	
	ldrb	r3, [r3, #0]
	cmp	r3, #9
	bls	lab26
	ldr	r3, [r7, #16]
	subs	r3, #1
	str	r3, [r7, #16]
lab26: 	ldr	r3, [r7, #16]
	str	r3, [r7, #20]
	ldr	r3, =VERSION	
	ldrb	r3, [r3, #0]
	cmp	r3, #9
	bls	lab27
	ldr	r3, =strinbuf	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #2
	add	r3, r2
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab28
lab29: 	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #3
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldr	r3, =strinbuf	
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #20]
	add	r3, r1
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #4
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r1, r3
	ldr	r3, =strinbuf	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #3
	add	r3, r2
	uxtb	r2, r1
	strb	r2, [r3, #0]
	ldr	r3, =strinbuf	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, =strinbuf	
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #2
	add	r3, r1
	lsrs	r2, r2, #4
	uxtb	r2, r2
	strb	r2, [r3, #0]
lab28: 	ldr	r3, [r7, #20]
	subs	r2, r3, #1
	str	r2, [r7, #20]
	cmp	r3, #0
	bne	lab29
	ldr	r3, =strinbuf	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldrb	r1, [r3, #0]
	ldr	r3, [r7, #16]
	uxtb	r3, r3
	lsls	r3, r3, #4
	uxtb	r2, r3
	ldr	r3, =strinbuf	
	ldr	r3, [r3, #0]
	adds	r3, #2
	orrs	r2, r1
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	lsrs	r2, r3, #4
	ldr	r3, =strinbuf	
	ldr	r3, [r3, #0]
	adds	r3, #1
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	lsrs	r3, r3, #12
	uxtb	r2, r3
	ldr	r3, =strinbuf	
	ldr	r3, [r3, #0]
	orr	r2, r2, #64	
	uxtb	r2, r2
	strb	r2, [r3, #0]
	b	lab30
lab27: 	ldr	r3, =strinbuf	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	add	r3, r2
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab31
lab32: 	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #2
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldr	r3, =strinbuf	
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #20]
	add	r3, r1
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #4
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r1, r3
	ldr	r3, =strinbuf	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #2
	add	r3, r2
	uxtb	r2, r1
	strb	r2, [r3, #0]
	ldr	r3, =strinbuf	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, =strinbuf	
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	add	r3, r1
	lsrs	r2, r2, #4
	uxtb	r2, r2
	strb	r2, [r3, #0]
lab31: 	ldr	r3, [r7, #20]
	subs	r2, r3, #1
	str	r2, [r7, #20]
	cmp	r3, #0
	bne	lab32
	ldr	r3, =strinbuf	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldrb	r1, [r3, #0]
	ldr	r3, [r7, #16]
	uxtb	r3, r3
	lsls	r3, r3, #4
	uxtb	r2, r3
	ldr	r3, =strinbuf	
	ldr	r3, [r3, #0]
	adds	r3, #1
	orrs	r2, r1
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	lsrs	r3, r3, #4
	uxtb	r2, r3
	ldr	r3, =strinbuf	
	ldr	r3, [r3, #0]
	orr	r2, r2, #64	
	uxtb	r2, r2
	strb	r2, [r3, #0]
lab30: 	ldr	r3, =VERSION	
	ldrb	r3, [r3, #0]
	cmp	r3, #9
	ite	ls
	movls	r3, #1
	movhi	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #16]
	subs	r3, r3, r2
	adds	r3, #3
	str	r3, [r7, #20]
	b	lab33
lab34: 	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r1, r3, #1
	str	r1, [r7, #20]
	add	r3, r2
	movs	r2, #236	
	strb	r2, [r3, #0]
	ldr	r3, =strinbuf	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r1, r3, #1
	str	r1, [r7, #20]
	add	r3, r2
	movs	r2, #17
	strb	r2, [r3, #0]
lab33: 	ldr	r2, [r7, #20]
	ldr	r3, [r7, #0]
	cmp	r2, r3
	bcc	lab34
	ldr	r3, =strinbuf	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #0]
	add	r3, r2
	str	r3, [r7, #12]
	ldr	r3, =strinbuf	
	ldr	r3, [r3, #0]
	str	r3, [r7, #8]
	ldr	r3, =eccblkwid	
	ldrb	r3, [r3, #0]
	ldr	r2, =qrframe	
	ldr	r2, [r2, #0]
	mov	r1, r2
	mov	r0, r3
	bl	initrspoly
	push {r1, r2}
	mov.w r1, #5777
	mov.w r2, #1610612736 
	str	r3, [r7, #20]
	b	lab35
lab36: 	ldrb	r1, [r3, #0]
	ldr	r3, =eccblkwid	
	ldrb	r2, [r3, #0]
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	str	r3, [sp, #0]
	mov	r3, r2
	ldr	r2, [r7, #12]
	ldr	r0, [r7, #8]
push {r1, r2}
	mov.w r1, #5461
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5461
	mov.w r2, #1610612736 
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #8]
	add	r3, r2
	str	r3, [r7, #8]
	ldr	r3, =eccblkwid	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab35: 	ldr	r3, =neccblk1	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #20]
	cmp	r3, r2
	bcc	lab36
	movs	r3, #0
	str	r3, [r7, #20]
	b	lab37
	nop
	.ltorg
lab38: 	ldrb	r3, [r3, #0]
	adds	r3, #1
	uxtb	r1, r3
	ldr	r3, =eccblkwid	
	ldrb	r2, [r3, #0]
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	str	r3, [sp, #0]
	mov	r3, r2
	ldr	r2, [r7, #12]
	ldr	r0, [r7, #8]
push {r1, r2}
	mov.w r1, #3408
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3408
	mov.w r2, #1610612736 
	ldrb	r3, [r3, #0]
	adds	r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	str	r3, [r7, #8]
	ldr	r3, =eccblkwid	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab37: 	ldr	r3, =neccblk2	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #20]
	cmp	r3, r2
	bcc	lab38
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #20]
	b	lab39
lab44: 	str	r3, [r7, #4]
	b	lab40
lab41: 	ldr	r2, [r3, #0]
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mov	r1, r3
	ldr	r3, [r7, #4]
	mul	r1, r3, r1
	ldr	r3, [r7, #20]
	add	r3, r1
	add	r2, r3
	ldr	r3, [r7, #8]
	adds	r1, r3, #1
	str	r1, [r7, #8]
	ldrb	r2, [r2, #0]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab40: 	ldr	r3, =neccblk1	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #4]
	cmp	r3, r2
	bcc	lab41
	movs	r3, #0
	str	r3, [r7, #4]
	b	lab42
lab43: 	ldr	r2, [r3, #0]
	ldr	r3, =neccblk1	
	ldrb	r3, [r3, #0]
	mov	r1, r3
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mul	r3, r1, r3
	mov	r1, r3
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	adds	r3, #1
	mov	r0, r3
	ldr	r3, [r7, #4]
	mul	r3, r0, r3
	add	r1, r3
	ldr	r3, [r7, #20]
	add	r3, r1
	add	r2, r3
	ldr	r3, [r7, #8]
	adds	r1, r3, #1
	str	r1, [r7, #8]
	ldrb	r2, [r2, #0]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab42: 	ldr	r3, =neccblk2	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #4]
	cmp	r3, r2
	bcc	lab43
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab39: 	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #20]
	cmp	r3, r2
	bcc	lab44
	movs	r3, #0
	str	r3, [r7, #4]
	b	lab45
lab46: 	ldr	r2, [r3, #0]
	ldr	r3, =neccblk1	
	ldrb	r3, [r3, #0]
	mov	r1, r3
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mul	r3, r1, r3
	mov	r1, r3
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	adds	r3, #1
	mov	r0, r3
	ldr	r3, [r7, #4]
	mul	r3, r0, r3
	add	r1, r3
	ldr	r3, [r7, #20]
	add	r3, r1
	add	r2, r3
	ldr	r3, [r7, #8]
	adds	r1, r3, #1
	str	r1, [r7, #8]
	ldrb	r2, [r2, #0]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab45: 	ldr	r3, =neccblk2	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #4]
	cmp	r3, r2
	bcc	lab46
	movs	r3, #0
	str	r3, [r7, #20]
	b	lab47
lab50: 	str	r3, [r7, #4]
	b	lab48
lab49: 	ldr	r2, [r3, #0]
	ldr	r1, [r7, #0]
	ldr	r3, [r7, #20]
	add	r1, r3
	ldr	r3, =eccblkwid	
	ldrb	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, [r7, #4]
	mul	r3, r0, r3
	add	r3, r1
	add	r2, r3
	ldr	r3, [r7, #8]
	adds	r1, r3, #1
	str	r1, [r7, #8]
	ldrb	r2, [r2, #0]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab48: 	ldr	r3, =neccblk1	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =neccblk2	
	ldrb	r3, [r3, #0]
	add	r3, r2
	mov	r2, r3
	ldr	r3, [r7, #4]
	cmp	r3, r2
	bcc	lab49
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab47: 	ldr	r3, =eccblkwid	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #20]
	cmp	r3, r2
	bcc	lab50
	ldr	r3, =strinbuf	
	ldr	r0, [r3, #0]
	ldr	r3, =qrframe	
	ldr	r1, [r3, #0]
	ldr	r3, =eccblkwid	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =neccblk1	
	ldrb	r3, [r3, #0]
	mov	r4, r3
	ldr	r3, =neccblk2	
	ldrb	r3, [r3, #0]
	add	r3, r4
	mul	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	add	r3, r2
	mov	r2, r3
	bl	memcpy
	nop
	adds	r7, #28
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #823
	mov.w r2, #1610612736 
	nop
	.ltorg
ismasked:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strb	r3, [r7, #6]
	ldrb	r2, [r7, #7]
	ldrb	r3, [r7, #6]
	cmp	r2, r3
	bls	lab51
	ldrb	r3, [r7, #7]
	str	r3, [r7, #12]
	ldrb	r3, [r7, #6]
	strb	r3, [r7, #7]
	ldr	r3, [r7, #12]
	strb	r3, [r7, #6]
lab51: 	ldrb	r3, [r7, #6]
	str	r3, [r7, #12]
	ldrb	r3, [r7, #6]
	ldrb	r2, [r7, #6]
	mul	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #1
	str	r3, [r7, #12]
	ldrb	r3, [r7, #7]
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #12]
	ldr	r3, =framask	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #3
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	uxtb	r3, r3
	and	r3, r3, #1
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
fillframe:
	push	{r4, r7, lr}
	sub	sp, #20
	add	r7, sp, #0
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldr	r2, =framebase	
	ldr	r1, [r2, #0]
	ldr	r2, =WDB	
	ldrb	r2, [r2, #0]
	mov	r0, r2
	ldr	r2, =WD	
	ldrb	r2, [r2, #0]
	mul	r2, r0, r2
	mov	r0, r3
	bl	memcpy
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	subs	r3, #1
	strb	r3, [r7, #8]
	ldrb	r3, [r7, #8]
	strb	r3, [r7, #9]
	movs	r3, #1
	strb	r3, [r7, #7]
	movs	r3, #1
	strb	r3, [r7, #6]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab52
lab61: 	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	strb	r3, [r7, #11]
	movs	r3, #0
	strb	r3, [r7, #10]
	b	lab53
lab60: 	cmp	r3, #0
	bge	lab54
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #9]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #8]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #9]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r0, r3
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #9]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r4, r2
	ldrb	r2, [r7, #8]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r4
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
lab54: 	ldrb	r3, [r7, #6]
	cmp	r3, #0
	beq	lab55
	ldrb	r3, [r7, #9]
	subs	r3, #1
	strb	r3, [r7, #9]
	b	lab56
lab55: 	ldrb	r3, [r7, #9]
	adds	r3, #1
	strb	r3, [r7, #9]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	beq	lab57
	ldrb	r3, [r7, #8]
	cmp	r3, #0
	beq	lab58
	ldrb	r3, [r7, #8]
	subs	r3, #1
	strb	r3, [r7, #8]
	b	lab56
lab58: 	ldrb	r3, [r7, #9]
	subs	r3, #2
	strb	r3, [r7, #9]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #9]
	cmp	r3, #6
	bne	lab56
	ldrb	r3, [r7, #9]
	subs	r3, #1
	strb	r3, [r7, #9]
	movs	r3, #9
	strb	r3, [r7, #8]
	b	lab56
lab57: 	ldrb	r2, [r7, #8]
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	subs	r3, #1
	cmp	r2, r3
	beq	lab59
	ldrb	r3, [r7, #8]
	adds	r3, #1
	strb	r3, [r7, #8]
	b	lab56
lab59: 	ldrb	r3, [r7, #9]
	subs	r3, #2
	strb	r3, [r7, #9]
	ldrb	r3, [r7, #7]
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #9]
	cmp	r3, #6
	bne	lab56
	ldrb	r3, [r7, #9]
	subs	r3, #1
	strb	r3, [r7, #9]
	ldrb	r3, [r7, #8]
	subs	r3, #8
	strb	r3, [r7, #8]
lab56: 	ldrb	r3, [r7, #6]
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	strb	r3, [r7, #6]
	ldrb	r2, [r7, #8]
	ldrb	r3, [r7, #9]
	mov	r1, r2
	mov	r0, r3
	bl	ismasked
	mov	r3, r0
	cmp	r3, #0
	bne	lab54
	ldrb	r3, [r7, #10]
	adds	r3, #1
	strb	r3, [r7, #10]
	ldrb	r3, [r7, #11]
	lsls	r3, r3, #1
	strb	r3, [r7, #11]
lab53: 	ldrb	r3, [r7, #10]
	cmp	r3, #7
	bls	lab60
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab52: 	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =eccblkwid	
	ldrb	r3, [r3, #0]
	add	r3, r2
	ldr	r2, =neccblk1	
	ldrb	r2, [r2, #0]
	mov	r1, r2
	ldr	r2, =neccblk2	
	ldrb	r2, [r2, #0]
	add	r2, r1
	mul	r3, r2, r3
	ldr	r2, =neccblk2	
	ldrb	r2, [r2, #0]
	add	r3, r2
	ldr	r2, [r7, #12]
	cmp	r2, r3
	blt	lab61
	nop
	nop
	adds	r7, #20
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #468
	mov.w r2, #1610612736 
	nop
	.ltorg
applymask:
	push	{r4, r7, lr}
	sub	sp, #20
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	cmp	r3, #7
	bhi	lab62
	add	r2, pc, #4	
	ldr	pc, [r2, r3, lsl #2]
	.ltorg
	movs	r3, #0
	strb	r3, [r7, #14]
	b	lab63
lab67: 	strb	r3, [r7, #15]
	b	lab64
lab66: 	ldrb	r3, [r7, #14]
	add	r3, r2
	uxtb	r3, r3
	and	r3, r3, #1
	cmp	r3, #0
	bne	lab65
	ldrb	r2, [r7, #14]
	ldrb	r3, [r7, #15]
	mov	r1, r2
	mov	r0, r3
	bl	ismasked
	mov	r3, r0
	cmp	r3, #0
	bne	lab65
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #15]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	eors	r3, r2
	sxtb	r0, r3
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r4, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r4
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
lab65: 	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
lab64: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	cmp	r2, r3
	bcc	lab66
	ldrb	r3, [r7, #14]
	adds	r3, #1
	strb	r3, [r7, #14]
lab63: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #14]
	cmp	r2, r3
	bcc	lab67
	b	lab68
	movs	r3, #0
	strb	r3, [r7, #14]
	b	lab69
lab73: 	strb	r3, [r7, #15]
	b	lab70
lab72: 	and	r3, r3, #1
	cmp	r3, #0
	bne	lab71
	ldrb	r2, [r7, #14]
	ldrb	r3, [r7, #15]
	mov	r1, r2
	mov	r0, r3
	bl	ismasked
	mov	r3, r0
	cmp	r3, #0
	bne	lab71
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #15]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	eors	r3, r2
	sxtb	r0, r3
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r4, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r4
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
lab71: 	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
lab70: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	cmp	r2, r3
	bcc	lab72
	ldrb	r3, [r7, #14]
	adds	r3, #1
	strb	r3, [r7, #14]
lab69: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #14]
	cmp	r2, r3
	bcc	lab73
	b	lab68
	movs	r3, #0
	strb	r3, [r7, #14]
	b	lab74
lab79: 	strb	r3, [r7, #13]
	movs	r3, #0
	strb	r3, [r7, #15]
	b	lab75
lab78: 	cmp	r3, #3
	bne	lab76
	movs	r3, #0
	strb	r3, [r7, #13]
lab76: 	ldrb	r3, [r7, #13]
	cmp	r3, #0
	bne	lab77
	ldrb	r2, [r7, #14]
	ldrb	r3, [r7, #15]
	mov	r1, r2
	mov	r0, r3
	bl	ismasked
	mov	r3, r0
	cmp	r3, #0
	bne	lab77
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #15]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	eors	r3, r2
	sxtb	r0, r3
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r4, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r4
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
lab77: 	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #13]
	adds	r3, #1
	strb	r3, [r7, #13]
lab75: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	cmp	r2, r3
	bcc	lab78
	ldrb	r3, [r7, #14]
	adds	r3, #1
	strb	r3, [r7, #14]
lab74: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #14]
	cmp	r2, r3
	bcc	lab79
	b	lab68
	movs	r3, #0
	strb	r3, [r7, #12]
	movs	r3, #0
	strb	r3, [r7, #14]
	b	lab80
lab86: 	cmp	r3, #3
	bne	lab81
	movs	r3, #0
	strb	r3, [r7, #12]
lab81: 	ldrb	r3, [r7, #12]
	strb	r3, [r7, #13]
	movs	r3, #0
	strb	r3, [r7, #15]
	b	lab82
lab85: 	cmp	r3, #3
	bne	lab83
	movs	r3, #0
	strb	r3, [r7, #13]
lab83: 	ldrb	r3, [r7, #13]
	cmp	r3, #0
	bne	lab84
	ldrb	r2, [r7, #14]
	ldrb	r3, [r7, #15]
	mov	r1, r2
	mov	r0, r3
	bl	ismasked
	mov	r3, r0
	cmp	r3, #0
	bne	lab84
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #15]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	eors	r3, r2
	sxtb	r0, r3
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r4, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r4
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
lab84: 	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #13]
	adds	r3, #1
	strb	r3, [r7, #13]
lab82: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	cmp	r2, r3
	bcc	lab85
	ldrb	r3, [r7, #14]
	adds	r3, #1
	strb	r3, [r7, #14]
	ldrb	r3, [r7, #12]
	adds	r3, #1
	strb	r3, [r7, #12]
lab80: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #14]
	cmp	r2, r3
	bcc	lab86
	b	lab68
	movs	r3, #0
	strb	r3, [r7, #14]
	b	lab87
lab92: 	strb	r3, [r7, #13]
	ldrb	r3, [r7, #14]
	lsrs	r3, r3, #1
	uxtb	r3, r3
	and	r3, r3, #1
	strb	r3, [r7, #12]
	movs	r3, #0
	strb	r3, [r7, #15]
	b	lab88
	nop
	.ltorg
lab91: 	cmp	r3, #3
	bne	lab89
	movs	r3, #0
	strb	r3, [r7, #13]
	ldrb	r3, [r7, #12]
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	strb	r3, [r7, #12]
lab89: 	ldrb	r3, [r7, #12]
	cmp	r3, #0
	bne	lab90
	ldrb	r2, [r7, #14]
	ldrb	r3, [r7, #15]
	mov	r1, r2
	mov	r0, r3
	bl	ismasked
	mov	r3, r0
	cmp	r3, #0
	bne	lab90
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #15]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	eors	r3, r2
	sxtb	r0, r3
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r4, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r4
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
lab90: 	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #13]
	adds	r3, #1
	strb	r3, [r7, #13]
lab88: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	cmp	r2, r3
	bcc	lab91
	ldrb	r3, [r7, #14]
	adds	r3, #1
	strb	r3, [r7, #14]
lab87: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #14]
	cmp	r2, r3
	bcc	lab92
	b	lab68
	movs	r3, #0
	strb	r3, [r7, #12]
	movs	r3, #0
	strb	r3, [r7, #14]
	b	lab93
lab99: 	cmp	r3, #3
	bne	lab94
	movs	r3, #0
	strb	r3, [r7, #12]
lab94: 	movs	r3, #0
	strb	r3, [r7, #13]
	movs	r3, #0
	strb	r3, [r7, #15]
	b	lab95
lab98: 	cmp	r3, #3
	bne	lab96
	movs	r3, #0
	strb	r3, [r7, #13]
lab96: 	ldrb	r2, [r7, #15]
	ldrb	r3, [r7, #14]
	ands	r3, r2
	uxtb	r3, r3
	and	r3, r3, #1
	ldrb	r2, [r7, #13]
	cmp	r2, #0
	ite	ne
	movne	r2, #1
	moveq	r2, #0
	uxtb	r1, r2
	ldrb	r2, [r7, #12]
	cmp	r2, #0
	ite	ne
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	ands	r2, r1
	uxtb	r2, r2
	add	r3, r2
	cmp	r3, #0
	bne	lab97
	ldrb	r2, [r7, #14]
	ldrb	r3, [r7, #15]
	mov	r1, r2
	mov	r0, r3
	bl	ismasked
	mov	r3, r0
	cmp	r3, #0
	bne	lab97
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #15]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	eors	r3, r2
	sxtb	r0, r3
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r4, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r4
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
lab97: 	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #13]
	adds	r3, #1
	strb	r3, [r7, #13]
lab95: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	cmp	r2, r3
	bcc	lab98
	ldrb	r3, [r7, #14]
	adds	r3, #1
	strb	r3, [r7, #14]
	ldrb	r3, [r7, #12]
	adds	r3, #1
	strb	r3, [r7, #12]
lab93: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #14]
	cmp	r2, r3
	bcc	lab99
	b	lab68
	movs	r3, #0
	strb	r3, [r7, #12]
	movs	r3, #0
	strb	r3, [r7, #14]
	b	lab100
lab108: 	cmp	r3, #3
	bne	lab101
	movs	r3, #0
	strb	r3, [r7, #12]
lab101: 	movs	r3, #0
	strb	r3, [r7, #13]
	movs	r3, #0
	strb	r3, [r7, #15]
	b	lab102
lab107: 	cmp	r3, #3
	bne	lab103
	movs	r3, #0
	strb	r3, [r7, #13]
lab103: 	ldrb	r2, [r7, #15]
	ldrb	r3, [r7, #14]
	ands	r3, r2
	uxtb	r3, r3
	mov	r1, r3
	ldrb	r3, [r7, #13]
	cmp	r3, #0
	beq	lab104
	ldrb	r2, [r7, #13]
	ldrb	r3, [r7, #12]
	cmp	r2, r3
	bne	lab104
	movs	r3, #1
	b	lab105
lab104: 	movs	r3, #0
lab105: 	add	r3, r1
	and	r3, r3, #1
	cmp	r3, #0
	bne	lab106
	ldrb	r2, [r7, #14]
	ldrb	r3, [r7, #15]
	mov	r1, r2
	mov	r0, r3
	bl	ismasked
	mov	r3, r0
	cmp	r3, #0
	bne	lab106
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #15]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	eors	r3, r2
	sxtb	r0, r3
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r4, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r4
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
lab106: 	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #13]
	adds	r3, #1
	strb	r3, [r7, #13]
lab102: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	cmp	r2, r3
	bcc	lab107
	ldrb	r3, [r7, #14]
	adds	r3, #1
	strb	r3, [r7, #14]
	ldrb	r3, [r7, #12]
	adds	r3, #1
	strb	r3, [r7, #12]
lab100: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #14]
	cmp	r2, r3
	bcc	lab108
	b	lab68
	movs	r3, #0
	strb	r3, [r7, #12]
	movs	r3, #0
	strb	r3, [r7, #14]
	b	lab109
lab117: 	cmp	r3, #3
	bne	lab110
	movs	r3, #0
	strb	r3, [r7, #12]
lab110: 	movs	r3, #0
	strb	r3, [r7, #13]
	movs	r3, #0
	strb	r3, [r7, #15]
	b	lab111
lab116: 	cmp	r3, #3
	bne	lab112
	movs	r3, #0
	strb	r3, [r7, #13]
lab112: 	ldrb	r3, [r7, #13]
	cmp	r3, #0
	beq	lab113
	ldrb	r2, [r7, #13]
	ldrb	r3, [r7, #12]
	cmp	r2, r3
	bne	lab113
	movs	r3, #1
	b	lab114
	nop
	.ltorg
lab113: 	movs	r3, #0
lab114: 	mov	r1, r3
	ldrb	r2, [r7, #15]
	ldrb	r3, [r7, #14]
	add	r3, r2
	uxtb	r3, r3
	add	r3, r1
	and	r3, r3, #1
	cmp	r3, #0
	bne	lab115
	ldrb	r2, [r7, #14]
	ldrb	r3, [r7, #15]
	mov	r1, r2
	mov	r0, r3
	bl	ismasked
	mov	r3, r0
	cmp	r3, #0
	bne	lab115
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #15]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	eors	r3, r2
	sxtb	r0, r3
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r4, r2
	ldrb	r2, [r7, #14]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r4
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
lab115: 	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #13]
	adds	r3, #1
	strb	r3, [r7, #13]
lab111: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #15]
	cmp	r2, r3
	bcc	lab116
	ldrb	r3, [r7, #14]
	adds	r3, #1
	strb	r3, [r7, #14]
	ldrb	r3, [r7, #12]
	adds	r3, #1
	strb	r3, [r7, #12]
lab109: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #14]
	cmp	r2, r3
	bcc	lab117
	nop
lab68: 	nop
lab62: 	nop
	adds	r7, #20
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5030
	mov.w r2, #1610612736 
	nop
	.ltorg
badruns:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	strb	r3, [r7, #15]
	b	lab118
lab120: 	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #4
	bls	lab119
	movs	r3, #3
	mov	r1, r3
	ldr	r3, =rlens	
	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	add	r3, r2
	ldrb	r3, [r3, #0]
	add	r3, r1
	mov	r2, r3
	ldr	r3, [r7, #8]
	add	r3, r2
	subs	r3, #5
	str	r3, [r7, #8]
lab119: 	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
lab118: 	ldrb	r2, [r7, #15]
	ldrb	r3, [r7, #7]
	cmp	r2, r3
	bls	lab120
	movs	r3, #3
	strb	r3, [r7, #15]
	b	lab121
lab124: 	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	subs	r3, #2
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, =rlens	
	ldr	r1, [r3, #0]
	ldrb	r3, [r7, #15]
	adds	r3, #2
	add	r3, r1
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	bne	lab122
	ldr	r3, =rlens	
	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	adds	r3, #2
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, =rlens	
	ldr	r1, [r3, #0]
	ldrb	r3, [r7, #15]
	subs	r3, #1
	add	r3, r1
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	bne	lab122
	ldr	r3, =rlens	
	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	subs	r3, #1
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, =rlens	
	ldr	r1, [r3, #0]
	ldrb	r3, [r7, #15]
	adds	r3, #1
	add	r3, r1
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	bne	lab122
	ldr	r3, =rlens	
	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	subs	r3, #1
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, =rlens	
	ldr	r1, [r2, #0]
	ldrb	r2, [r7, #15]
	add	r2, r1
	ldrb	r2, [r2, #0]
	cmp	r3, r2
	bne	lab122
	ldr	r3, =rlens	
	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	subs	r3, #3
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab123
	ldrb	r3, [r7, #15]
	adds	r2, r3, #2
	ldrb	r3, [r7, #7]
	cmp	r2, r3
	bge	lab123
	ldr	r3, =rlens	
	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	subs	r3, #3
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	mov	r3, r2
	lsls	r3, r3, #1
	add	r2, r3
	ldr	r3, =rlens	
	ldr	r1, [r3, #0]
	ldrb	r3, [r7, #15]
	add	r3, r1
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #2
	cmp	r2, r3
	bge	lab123
	ldr	r3, =rlens	
	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #15]
	adds	r3, #3
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	mov	r3, r2
	lsls	r3, r3, #1
	add	r2, r3
	ldr	r3, =rlens	
	ldr	r1, [r3, #0]
	ldrb	r3, [r7, #15]
	add	r3, r1
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #2
	cmp	r2, r3
	blt	lab122
lab123: 	movs	r3, #40	
	mov	r2, r3
	ldr	r3, [r7, #8]
	add	r3, r2
	str	r3, [r7, #8]
lab122: 	ldrb	r3, [r7, #15]
	adds	r3, #2
	strb	r3, [r7, #15]
lab121: 	ldrb	r2, [r7, #15]
	ldrb	r3, [r7, #7]
	subs	r3, #1
	cmp	r2, r3
	blt	lab124
	ldr	r3, [r7, #8]
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
badcheck:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	strb	r3, [r7, #22]
	b	lab125
lab131: 	strb	r3, [r7, #23]
	b	lab126
lab130: 	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #22]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #23]
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	beq	lab127
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	adds	r2, #1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #22]
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #23]
	adds	r3, #1
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	beq	lab127
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #22]
	adds	r2, #1
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #23]
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	beq	lab127
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	adds	r2, #1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #22]
	adds	r2, #1
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #23]
	adds	r3, #1
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	bne	lab128
lab127: 	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #22]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #23]
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	bne	lab129
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	adds	r2, #1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #22]
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #23]
	adds	r3, #1
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	bne	lab129
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #22]
	adds	r2, #1
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #23]
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	bne	lab129
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	adds	r2, #1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #22]
	adds	r2, #1
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #23]
	adds	r3, #1
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	bne	lab129
lab128: 	movs	r3, #3
	mov	r2, r3
	ldr	r3, [r7, #16]
	add	r3, r2
	str	r3, [r7, #16]
lab129: 	ldrb	r3, [r7, #23]
	adds	r3, #1
	strb	r3, [r7, #23]
lab126: 	ldrb	r2, [r7, #23]
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	subs	r3, #1
	cmp	r2, r3
	blt	lab130
	ldrb	r3, [r7, #22]
	adds	r3, #1
	strb	r3, [r7, #22]
lab125: 	ldrb	r2, [r7, #22]
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	subs	r3, #1
	cmp	r2, r3
	blt	lab131
	movs	r3, #0
	strb	r3, [r7, #22]
	b	lab132
lab139: 	ldr	r3, [r3, #0]
	movs	r2, #0
	strb	r2, [r3, #0]
	movs	r3, #0
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #23]
	strb	r3, [r7, #20]
	ldrb	r3, [r7, #20]
	strb	r3, [r7, #21]
	b	lab133
lab138: 	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #22]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #23]
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	uxtb	r3, r3
	and	r3, r3, #1
	strb	r3, [r7, #3]
	ldrb	r2, [r7, #3]
	ldrb	r3, [r7, #20]
	cmp	r2, r3
	bne	lab134
	ldr	r3, =rlens	
	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #21]
	add	r3, r2
	ldrb	r2, [r3, #0]
	adds	r2, #1
	uxtb	r2, r2
	strb	r2, [r3, #0]
	b	lab135
lab134: 	ldr	r3, =rlens	
	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #21]
	adds	r3, #1
	strb	r3, [r7, #21]
	ldrb	r3, [r7, #21]
	add	r3, r2
	movs	r2, #1
	strb	r2, [r3, #0]
lab135: 	ldrb	r3, [r7, #3]
	strb	r3, [r7, #20]
	ldrb	r3, [r7, #20]
	cmp	r3, #0
	beq	lab136
	movs	r3, #1
	b	lab137
lab136: 	mov	r3, #4294967295	
lab137: 	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #12]
	ldrb	r3, [r7, #23]
	adds	r3, #1
	strb	r3, [r7, #23]
lab133: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	cmp	r2, r3
	bcc	lab138
	ldrb	r3, [r7, #21]
	mov	r0, r3
	bl	badruns
	mov	r2, r0
	ldr	r3, [r7, #16]
	add	r3, r2
	str	r3, [r7, #16]
	ldrb	r3, [r7, #22]
	adds	r3, #1
	strb	r3, [r7, #22]
lab132: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #22]
	cmp	r2, r3
	bcc	lab139
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bge	lab140
	ldr	r3, [r7, #12]
	negs	r3, r3
	str	r3, [r7, #12]
lab140: 	ldr	r3, [r7, #12]
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #2
	ldr	r2, [r7, #8]
	add	r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #1
	str	r3, [r7, #8]
	b	lab141
	.ltorg
lab142: 	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	mul	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #8]
	subs	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab141: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	mul	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #8]
	cmp	r3, r2
	bhi	lab142
	movs	r3, #10
	mov	r2, r3
	ldr	r3, [r7, #4]
	mul	r3, r2, r3
	ldr	r2, [r7, #16]
	add	r3, r2
	str	r3, [r7, #16]
	movs	r3, #0
	strb	r3, [r7, #23]
	b	lab143
lab148: 	ldr	r3, [r3, #0]
	movs	r2, #0
	strb	r2, [r3, #0]
	movs	r3, #0
	strb	r3, [r7, #22]
	ldrb	r3, [r7, #22]
	strb	r3, [r7, #20]
	ldrb	r3, [r7, #20]
	strb	r3, [r7, #21]
	b	lab144
lab147: 	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r2, [r7, #22]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [r7, #23]
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	uxtb	r3, r3
	and	r3, r3, #1
	strb	r3, [r7, #3]
	ldrb	r2, [r7, #3]
	ldrb	r3, [r7, #20]
	cmp	r2, r3
	bne	lab145
	ldr	r3, =rlens	
	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #21]
	add	r3, r2
	ldrb	r2, [r3, #0]
	adds	r2, #1
	uxtb	r2, r2
	strb	r2, [r3, #0]
	b	lab146
lab145: 	ldr	r3, =rlens	
	ldr	r2, [r3, #0]
	ldrb	r3, [r7, #21]
	adds	r3, #1
	strb	r3, [r7, #21]
	ldrb	r3, [r7, #21]
	add	r3, r2
	movs	r2, #1
	strb	r2, [r3, #0]
lab146: 	ldrb	r3, [r7, #3]
	strb	r3, [r7, #20]
	ldrb	r3, [r7, #22]
	adds	r3, #1
	strb	r3, [r7, #22]
lab144: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #22]
	cmp	r2, r3
	bcc	lab147
	ldrb	r3, [r7, #21]
	mov	r0, r3
	bl	badruns
	mov	r2, r0
	ldr	r3, [r7, #16]
	add	r3, r2
	str	r3, [r7, #16]
	ldrb	r3, [r7, #23]
	adds	r3, #1
	strb	r3, [r7, #23]
lab143: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #23]
	cmp	r2, r3
	bcc	lab148
	ldr	r3, [r7, #16]
	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2730
	mov.w r2, #1610612736 
	nop
	.ltorg
addfmt:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldr	r3, =ECCLEVEL	
	ldrb	r3, [r3, #0]
	subs	r3, #1
	strb	r3, [r7, #10]
	ldrb	r2, [r7, #7]
	ldrb	r3, [r7, #10]
	lsls	r3, r3, #3
	add	r3, r2
	ldr	r2, =fmtword	
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r7, #12]
	movs	r3, #0
	strb	r3, [r7, #11]
	b	lab149
lab152: 	and	r3, r3, #1
	cmp	r3, #0
	beq	lab150
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldr	r2, =WD	
	ldrb	r2, [r2, #0]
	subs	r1, r2, #1
	ldrb	r2, [r7, #11]
	subs	r2, r1, r2
	asrs	r1, r2, #3
	ldr	r2, =WDB	
	ldrb	r2, [r2, #0]
	lsls	r2, r2, #3
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	subs	r1, r3, #1
	ldrb	r3, [r7, #11]
	subs	r3, r1, r3
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r0, r3
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldr	r2, =WD	
	ldrb	r2, [r2, #0]
	subs	r1, r2, #1
	ldrb	r2, [r7, #11]
	subs	r2, r1, r2
	asrs	r1, r2, #3
	ldr	r2, =WDB	
	ldrb	r2, [r2, #0]
	lsls	r2, r2, #3
	add	r2, r1
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #11]
	cmp	r3, #5
	bhi	lab151
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #11]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	adds	r2, #1
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r1, [r7, #11]
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r1, r0, r1
	adds	r1, #1
	add	r3, r1
	orn	r2, r2, #127	
	uxtb	r2, r2
	strb	r2, [r3, #0]
	b	lab150
lab151: 	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #11]
	adds	r2, #1
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	adds	r2, #1
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r1, [r7, #11]
	adds	r1, #1
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r1, r0, r1
	adds	r1, #1
	add	r3, r1
	orn	r2, r2, #127	
	uxtb	r2, r2
	strb	r2, [r3, #0]
lab150: 	ldrb	r3, [r7, #11]
	adds	r3, #1
	strb	r3, [r7, #11]
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #1
	str	r3, [r7, #12]
lab149: 	ldrb	r3, [r7, #11]
	cmp	r3, #7
	bls	lab152
	movs	r3, #0
	strb	r3, [r7, #11]
	b	lab153
lab156: 	and	r3, r3, #1
	cmp	r3, #0
	beq	lab154
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldr	r2, =WD	
	ldrb	r2, [r2, #0]
	subs	r1, r2, #7
	ldrb	r2, [r7, #11]
	add	r2, r1
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	adds	r2, #1
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldr	r1, =WD	
	ldrb	r1, [r1, #0]
	subs	r0, r1, #7
	ldrb	r1, [r7, #11]
	add	r1, r0
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r1, r0, r1
	adds	r1, #1
	add	r3, r1
	orn	r2, r2, #127	
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #11]
	cmp	r3, #0
	beq	lab155
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #11]
	rsb	r2, r2, #6
	asrs	r1, r2, #3
	ldr	r2, =WDB	
	ldrb	r2, [r2, #0]
	lsls	r2, r2, #3
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #11]
	rsb	r3, r3, #6
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r0, r3
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #11]
	rsb	r2, r2, #6
	asrs	r1, r2, #3
	ldr	r2, =WDB	
	ldrb	r2, [r2, #0]
	lsls	r2, r2, #3
	add	r2, r1
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
	b	lab154
lab155: 	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldr	r2, =WDB	
	ldrb	r2, [r2, #0]
	lsls	r2, r2, #3
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	lsls	r1, r1, #3
	add	r3, r1
	orr	r2, r2, #1
	uxtb	r2, r2
	strb	r2, [r3, #0]
lab154: 	ldrb	r3, [r7, #11]
	adds	r3, #1
	strb	r3, [r7, #11]
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #1
	str	r3, [r7, #12]
lab153: 	ldrb	r3, [r7, #11]
	cmp	r3, #6
	bls	lab156
	nop
	nop
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
qrencode:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	movw	r3, #30000	
	str	r3, [r7, #12]
	movs	r3, #0
	strb	r3, [r7, #11]
	bl	stringtoqr
	push {r1, r2}
	mov.w r1, #3014
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5979
	mov.w r2, #1610612736 
	ldr	r3, [r3, #0]
	ldr	r2, =qrframe	
	ldr	r1, [r2, #0]
	ldr	r2, =WD	
	ldrb	r2, [r2, #0]
	mov	r0, r2
	ldr	r2, =WDB	
	ldrb	r2, [r2, #0]
	mul	r2, r0, r2
	mov	r0, r3
	bl	memcpy
	movs	r3, #0
	strb	r3, [r7, #10]
	b	lab157
lab160: 	mov	r0, r3
push {r1, r2}
	mov.w r1, #6500
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6500
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3546
	mov.w r2, #1610612736 
	str	r3, [r7, #4]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bcs	lab158
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	ldrb	r3, [r7, #10]
	strb	r3, [r7, #11]
lab158: 	ldrb	r3, [r7, #11]
	cmp	r3, #7
	beq	lab159
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	ldr	r2, =strinbuf	
	ldr	r1, [r2, #0]
	ldr	r2, =WD	
	ldrb	r2, [r2, #0]
	mov	r0, r2
	ldr	r2, =WDB	
	ldrb	r2, [r2, #0]
	mul	r2, r0, r2
	mov	r0, r3
	bl	memcpy
	ldrb	r3, [r7, #10]
	adds	r3, #1
	strb	r3, [r7, #10]
lab157: 	ldrb	r3, [r7, #10]
	cmp	r3, #7
	bls	lab160
	b	lab161
lab159: 	nop
lab161: 	ldrb	r2, [r7, #11]
	ldrb	r3, [r7, #10]
	cmp	r2, r3
	beq	lab162
	ldrb	r3, [r7, #11]
	mov	r0, r3
push {r1, r2}
	mov.w r1, #1654
	mov.w r2, #1610612736 
lab162:	push {r1, r2}
	mov.w r1, #1654
	mov.w r2, #1610612736 
	mov	r0, r3
	bl	addfmt
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2126
	mov.w r2, #1610612736 
	.ltorg
setmask:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strb	r3, [r7, #6]
	ldrb	r2, [r7, #7]
	ldrb	r3, [r7, #6]
	cmp	r2, r3
	bls	lab163
	ldrb	r3, [r7, #7]
	str	r3, [r7, #12]
	ldrb	r3, [r7, #6]
	strb	r3, [r7, #7]
	ldr	r3, [r7, #12]
	strb	r3, [r7, #6]
lab163: 	ldrb	r3, [r7, #6]
	str	r3, [r7, #12]
	ldrb	r2, [r7, #6]
	ldr	r3, [r7, #12]
	mul	r3, r2, r3
	str	r3, [r7, #12]
	ldrb	r3, [r7, #6]
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #1
	str	r3, [r7, #12]
	ldrb	r3, [r7, #7]
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #12]
	ldr	r3, =framask	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #3
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldr	r3, [r7, #12]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r1, r3
	ldr	r3, =framask	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #3
	add	r3, r2
	uxtb	r2, r1
	strb	r2, [r3, #0]
	nop
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
putfind:
	push	{r4, r7, lr}
	sub	sp, #12
	add	r7, sp, #0
	movs	r3, #0
	strb	r3, [r7, #4]
	b	lab164
lab173: 	strb	r3, [r7, #5]
	movs	r3, #0
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #4]
	cmp	r3, #1
	bne	lab165
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	subs	r3, #7
	strb	r3, [r7, #5]
lab165: 	ldrb	r3, [r7, #4]
	cmp	r3, #2
	bne	lab166
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	subs	r3, #7
	strb	r3, [r7, #6]
lab166: 	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	adds	r2, #3
	asrs	r1, r2, #3
	ldrb	r2, [r7, #5]
	adds	r2, #3
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #6]
	adds	r3, #3
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	adds	r2, #3
	asrs	r1, r2, #3
	ldrb	r2, [r7, #5]
	adds	r2, #3
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	movs	r3, #0
	strb	r3, [r7, #7]
	b	lab167
lab168: 	ldr	r3, [r3, #0]
	ldrb	r1, [r7, #6]
	ldrb	r2, [r7, #7]
	add	r2, r1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #5]
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r1, [r7, #6]
	ldrb	r3, [r7, #7]
	add	r3, r1
	uxtb	r3, r3
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r1, [r7, #6]
	ldrb	r2, [r7, #7]
	add	r2, r1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #5]
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r0, r2
	ldrb	r1, [r7, #5]
	ldrb	r2, [r7, #7]
	add	r2, r1
	adds	r2, #1
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r0
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #6]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r0, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	lsrs	r2, r2, #3
	uxtb	r2, r2
	mov	r4, r2
	ldrb	r1, [r7, #5]
	ldrb	r2, [r7, #7]
	add	r2, r1
	adds	r2, #1
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	add	r2, r4
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	adds	r2, #6
	asrs	r1, r2, #3
	ldrb	r0, [r7, #5]
	ldrb	r2, [r7, #7]
	add	r2, r0
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #6]
	adds	r3, #6
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	adds	r2, #6
	asrs	r1, r2, #3
	ldrb	r0, [r7, #5]
	ldrb	r2, [r7, #7]
	add	r2, r0
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r1, [r7, #6]
	ldrb	r2, [r7, #7]
	add	r2, r1
	adds	r2, #1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #5]
	adds	r2, #6
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r1, [r7, #6]
	ldrb	r3, [r7, #7]
	add	r3, r1
	adds	r3, #1
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r1, [r7, #6]
	ldrb	r2, [r7, #7]
	add	r2, r1
	adds	r2, #1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #5]
	adds	r2, #6
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #7]
	adds	r3, #1
	strb	r3, [r7, #7]
lab167: 	ldrb	r3, [r7, #7]
	cmp	r3, #5
	bls	lab168
	movs	r3, #1
	strb	r3, [r7, #7]
	b	lab169
lab170: 	ldrb	r3, [r7, #7]
	add	r3, r2
	uxtb	r2, r3
	ldrb	r3, [r7, #5]
	adds	r3, #1
	uxtb	r3, r3
	mov	r1, r3
	mov	r0, r2
	bl	setmask
	ldrb	r3, [r7, #6]
	adds	r3, #1
	uxtb	r0, r3
	ldrb	r2, [r7, #5]
	ldrb	r3, [r7, #7]
	add	r3, r2
	uxtb	r3, r3
	adds	r3, #1
	uxtb	r3, r3
	mov	r1, r3
	bl	setmask
	ldrb	r3, [r7, #6]
	adds	r3, #5
	uxtb	r0, r3
	ldrb	r2, [r7, #5]
	ldrb	r3, [r7, #7]
	add	r3, r2
	uxtb	r3, r3
	mov	r1, r3
	bl	setmask
	ldrb	r2, [r7, #6]
	ldrb	r3, [r7, #7]
	add	r3, r2
	uxtb	r3, r3
	adds	r3, #1
	uxtb	r2, r3
	ldrb	r3, [r7, #5]
	adds	r3, #5
	uxtb	r3, r3
	mov	r1, r3
	mov	r0, r2
	bl	setmask
	ldrb	r3, [r7, #7]
	adds	r3, #1
	strb	r3, [r7, #7]
lab169: 	ldrb	r3, [r7, #7]
	cmp	r3, #4
	bls	lab170
	movs	r3, #2
	strb	r3, [r7, #7]
	b	lab171
	nop
	.ltorg
lab172: 	ldr	r3, [r3, #0]
	ldrb	r1, [r7, #6]
	ldrb	r2, [r7, #7]
	add	r2, r1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #5]
	adds	r2, #2
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r1, [r7, #6]
	ldrb	r3, [r7, #7]
	add	r3, r1
	uxtb	r3, r3
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r1, [r7, #6]
	ldrb	r2, [r7, #7]
	add	r2, r1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #5]
	adds	r2, #2
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	adds	r2, #2
	asrs	r1, r2, #3
	ldrb	r0, [r7, #5]
	ldrb	r2, [r7, #7]
	add	r2, r0
	adds	r2, #1
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #6]
	adds	r3, #2
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	adds	r2, #2
	asrs	r1, r2, #3
	ldrb	r0, [r7, #5]
	ldrb	r2, [r7, #7]
	add	r2, r0
	adds	r2, #1
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	adds	r2, #4
	asrs	r1, r2, #3
	ldrb	r0, [r7, #5]
	ldrb	r2, [r7, #7]
	add	r2, r0
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #6]
	adds	r3, #4
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	adds	r2, #4
	asrs	r1, r2, #3
	ldrb	r0, [r7, #5]
	ldrb	r2, [r7, #7]
	add	r2, r0
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r1, [r7, #6]
	ldrb	r2, [r7, #7]
	add	r2, r1
	adds	r2, #1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #5]
	adds	r2, #4
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r1, [r7, #6]
	ldrb	r3, [r7, #7]
	add	r3, r1
	adds	r3, #1
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r1, [r7, #6]
	ldrb	r2, [r7, #7]
	add	r2, r1
	adds	r2, #1
	asrs	r1, r2, #3
	ldrb	r2, [r7, #5]
	adds	r2, #4
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldrb	r3, [r7, #7]
	adds	r3, #1
	strb	r3, [r7, #7]
lab171: 	ldrb	r3, [r7, #7]
	cmp	r3, #3
	bls	lab172
	ldrb	r3, [r7, #4]
	adds	r3, #1
	strb	r3, [r7, #4]
lab164: 	ldrb	r3, [r7, #4]
	cmp	r3, #2
	bls	lab173
	nop
	nop
	adds	r7, #12
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #3279
	mov.w r2, #1610612736 
	nop
	.ltorg
putalign:
	push	{r4, r7, lr}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	asrs	r1, r2, #3
	ldr	r2, =WDB	
	ldrb	r2, [r2, #0]
	mov	r0, r2
	ldr	r2, [r7, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldr	r3, [r7, #4]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r0, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	asrs	r1, r2, #3
	ldr	r2, =WDB	
	ldrb	r2, [r2, #0]
	mov	r4, r2
	ldr	r2, [r7, #0]
	mul	r2, r4, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r0
	strb	r2, [r3, #0]
	mvn	r3, #1
	str	r3, [r7, #12]
	b	lab174
lab175: 	ldr	r3, [r3, #0]
	ldr	r1, [r7, #4]
	ldr	r2, [r7, #12]
	add	r2, r1
	asrs	r1, r2, #3
	ldr	r2, [r7, #0]
	subs	r2, #2
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	add	r3, r1
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #4]
	ldr	r2, [r7, #12]
	add	r2, r1
	asrs	r1, r2, #3
	ldr	r2, [r7, #0]
	subs	r2, #2
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	subs	r2, #2
	asrs	r1, r2, #3
	ldr	r0, [r7, #0]
	ldr	r2, [r7, #12]
	add	r2, r0
	adds	r2, #1
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldr	r3, [r7, #4]
	subs	r3, #2
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	subs	r2, #2
	asrs	r1, r2, #3
	ldr	r0, [r7, #0]
	ldr	r2, [r7, #12]
	add	r2, r0
	adds	r2, #1
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	adds	r2, #2
	asrs	r1, r2, #3
	ldr	r0, [r7, #0]
	ldr	r2, [r7, #12]
	add	r2, r0
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #2
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	adds	r2, #2
	asrs	r1, r2, #3
	ldr	r0, [r7, #0]
	ldr	r2, [r7, #12]
	add	r2, r0
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #4]
	ldr	r2, [r7, #12]
	add	r2, r1
	adds	r2, #1
	asrs	r1, r2, #3
	ldr	r2, [r7, #0]
	adds	r2, #2
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	add	r3, r1
	adds	r3, #1
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #4]
	ldr	r2, [r7, #12]
	add	r2, r1
	adds	r2, #1
	asrs	r1, r2, #3
	ldr	r2, [r7, #0]
	adds	r2, #2
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab174: 	ldr	r3, [r7, #12]
	cmp	r3, #1
	ble	lab175
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab176
lab177: 	uxtb	r3, r3
	subs	r3, #1
	uxtb	r0, r3
	ldr	r3, [r7, #0]
	uxtb	r2, r3
	ldr	r3, [r7, #12]
	uxtb	r3, r3
	add	r3, r2
	uxtb	r3, r3
	mov	r1, r3
	bl	setmask
	ldr	r3, [r7, #4]
	uxtb	r3, r3
	adds	r3, #1
	uxtb	r0, r3
	ldr	r3, [r7, #0]
	uxtb	r2, r3
	ldr	r3, [r7, #12]
	uxtb	r3, r3
	subs	r3, r2, r3
	uxtb	r3, r3
	mov	r1, r3
	bl	setmask
	ldr	r3, [r7, #4]
	uxtb	r2, r3
	ldr	r3, [r7, #12]
	uxtb	r3, r3
	subs	r3, r2, r3
	uxtb	r2, r3
	ldr	r3, [r7, #0]
	uxtb	r3, r3
	subs	r3, #1
	uxtb	r3, r3
	mov	r1, r3
	mov	r0, r2
	bl	setmask
	ldr	r3, [r7, #4]
	uxtb	r2, r3
	ldr	r3, [r7, #12]
	uxtb	r3, r3
	add	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #0]
	uxtb	r3, r3
	adds	r3, #1
	uxtb	r3, r3
	mov	r1, r3
	mov	r0, r2
	bl	setmask
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab176: 	ldr	r3, [r7, #12]
	cmp	r3, #1
	ble	lab177
	nop
	nop
	adds	r7, #20
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5211
	mov.w r2, #1610612736 
	.ltorg
doaligns:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	ldr	r3, =VERSION	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bls	lab178
	ldr	r3, =VERSION	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =adelta	
	ldrb	r3, [r3, r2]
	strb	r3, [r7, #5]
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	subs	r3, #7
	strb	r3, [r7, #6]
lab184: 	ldrb	r3, [r3, #0]
	subs	r3, #7
	strb	r3, [r7, #7]
	b	lab179
lab181: 	ldrb	r2, [r7, #6]
	mov	r1, r2
	mov	r0, r3
push {r1, r2}
	mov.w r1, #6509
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6509
	mov.w r2, #1610612736 
	ldrb	r3, [r7, #5]
	cmp	r2, r3
	bcc	lab180
	ldrb	r2, [r7, #7]
	ldrb	r3, [r7, #5]
	subs	r3, r2, r3
	strb	r3, [r7, #7]
lab179: 	ldrb	r2, [r7, #7]
	ldrb	r3, [r7, #5]
	subs	r3, #3
	cmp	r2, r3
	bhi	lab181
	b	lab182
lab180: 	nop
lab182: 	ldrb	r2, [r7, #6]
	ldrb	r3, [r7, #5]
	adds	r3, #9
	cmp	r2, r3
	bls	lab183
	ldrb	r2, [r7, #6]
	ldrb	r3, [r7, #5]
	subs	r3, r2, r3
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #6]
	mov	r1, r3
	movs	r0, #6
push {r1, r2}
	mov.w r1, #6723
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6723
	mov.w r2, #1610612736 
	movs	r1, #6
	mov	r0, r3
push {r1, r2}
	mov.w r1, #1457
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1457
	mov.w r2, #1610612736 
lab178: 	nop
	b	lab185
lab183: 	nop
lab185: 	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4376
	mov.w r2, #1610612736 
	nop
	.ltorg
putvpat:
	push	{r4, r7, lr}
	sub	sp, #12
	add	r7, sp, #0
	ldr	r3, =VERSION	
	ldrb	r3, [r3, #0]
	strb	r3, [r7, #4]
	ldrb	r3, [r7, #4]
	cmp	r3, #6
	bls	lab186
	ldrb	r3, [r7, #4]
	subs	r3, #7
	ldr	r2, =vpat	
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r7, #0]
	movs	r3, #17
	strb	r3, [r7, #5]
	movs	r3, #0
	strb	r3, [r7, #7]
	b	lab187
lab194: 	strb	r3, [r7, #6]
	b	lab188
lab193: 	cmp	r3, #11
	bls	lab189
	ldrb	r2, [r7, #4]
	ldrb	r3, [r7, #5]
	subs	r3, #12
	lsr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	ite	ne
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
	b	lab190
lab189: 	ldrb	r3, [r7, #5]
	ldr	r2, [r7, #0]
	lsr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	ite	ne
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
lab190: 	cmp	r3, #0
	beq	lab191
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #7]
	rsb	r2, r2, #5
	asrs	r1, r2, #3
	ldrb	r2, [r7, #6]
	rsb	r2, r2, #2
	ldr	r0, =WD	
	ldrb	r0, [r0, #0]
	add	r2, r0
	subs	r2, #11
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #7]
	rsb	r3, r3, #5
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #7]
	rsb	r2, r2, #5
	asrs	r1, r2, #3
	ldrb	r2, [r7, #6]
	rsb	r2, r2, #2
	ldr	r0, =WD	
	ldrb	r0, [r0, #0]
	add	r2, r0
	subs	r2, #11
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	rsb	r2, r2, #2
	ldr	r1, =WD	
	ldrb	r1, [r1, #0]
	add	r2, r1
	subs	r2, #11
	asrs	r1, r2, #3
	ldrb	r2, [r7, #7]
	rsb	r2, r2, #5
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldrb	r3, [r7, #6]
	rsb	r3, r3, #2
	ldr	r1, =WD	
	ldrb	r1, [r1, #0]
	add	r3, r1
	subs	r3, #11
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldrb	r2, [r7, #6]
	rsb	r2, r2, #2
	ldr	r1, =WD	
	ldrb	r1, [r1, #0]
	add	r2, r1
	subs	r2, #11
	asrs	r1, r2, #3
	ldrb	r2, [r7, #7]
	rsb	r2, r2, #5
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r2, r0, r2
	add	r2, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	b	lab192
lab191: 	ldrb	r3, [r7, #7]
	rsb	r3, r3, #5
	uxtb	r0, r3
	ldr	r3, =WD	
	ldrb	r2, [r3, #0]
	ldrb	r3, [r7, #6]
	subs	r3, r2, r3
	uxtb	r3, r3
	subs	r3, #9
	uxtb	r3, r3
	mov	r1, r3
	bl	setmask
	ldr	r3, =WD	
	ldrb	r2, [r3, #0]
	ldrb	r3, [r7, #6]
	subs	r3, r2, r3
	uxtb	r3, r3
	subs	r3, #9
	uxtb	r2, r3
	ldrb	r3, [r7, #7]
	rsb	r3, r3, #5
	uxtb	r3, r3
	mov	r1, r3
	mov	r0, r2
	bl	setmask
lab192: 	ldrb	r3, [r7, #6]
	adds	r3, #1
	strb	r3, [r7, #6]
	ldrb	r3, [r7, #5]
	subs	r3, #1
	strb	r3, [r7, #5]
lab188: 	ldrb	r3, [r7, #6]
	cmp	r3, #2
	bls	lab193
	ldrb	r3, [r7, #7]
	adds	r3, #1
	strb	r3, [r7, #7]
lab187: 	ldrb	r3, [r7, #7]
	cmp	r3, #5
	bls	lab194
	b	lab195
lab186: 	nop
lab195: 	adds	r7, #12
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #3709
	mov.w r2, #1610612736 
	nop
	.ltorg
initframe:
	push	{r4, r7, lr}
	sub	sp, #12
	add	r7, sp, #0
	ldr	r3, =WDB	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	mul	r3, r2, r3
	movs	r1, #1
	mov	r0, r3
push {r1, r2}
	mov.w r1, #2934
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2934
	mov.w r2, #1610612736 
	ldr	r2, =framebase	
	str	r3, [r2, #0]
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	adds	r3, #1
	mul	r3, r2, r3
	lsrs	r2, r3, #31
	add	r3, r2
	asrs	r3, r3, #1
	adds	r3, #7
	cmp	r3, #0
	bge	lab196
	adds	r3, #7
lab196: 	asrs	r3, r3, #3
	movs	r1, #1
	mov	r0, r3
push {r1, r2}
	mov.w r1, #1123
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1123
	mov.w r2, #1610612736 
	ldr	r2, =framask	
	str	r3, [r2, #0]
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	adds	r3, #1
	mov	r0, r3
	bl	malloc_beebs
	mov	r3, r0
	ldr	r2, =rlens	
	str	r3, [r2, #0]
	bl	putfind
	push {r1, r2}
	mov.w r1, #1920
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6184
	mov.w r2, #1610612736 
	ldr	r3, [r3, #0]
	ldr	r2, =WD	
	ldrb	r2, [r2, #0]
	subs	r2, #8
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r2, r1, r2
	adds	r2, #1
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	ldr	r1, =WD	
	ldrb	r1, [r1, #0]
	subs	r1, #8
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r1, r0, r1
	adds	r1, #1
	add	r3, r1
	orn	r2, r2, #127	
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movs	r3, #0
	str	r3, [r7, #0]
	b	lab197
lab198: 	uxtb	r3, r3
	mov	r1, r3
	movs	r0, #7
	bl	setmask
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	subs	r3, #8
	uxtb	r3, r3
	ldr	r2, [r7, #0]
	uxtb	r2, r2
	mov	r1, r2
	mov	r0, r3
	bl	setmask
	ldr	r3, [r7, #0]
	uxtb	r2, r3
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	add	r3, r2
	uxtb	r3, r3
	subs	r3, #7
	uxtb	r3, r3
	mov	r1, r3
	movs	r0, #7
	bl	setmask
	ldr	r3, [r7, #0]
	adds	r3, #1
	str	r3, [r7, #0]
lab197: 	ldr	r3, [r7, #0]
	cmp	r3, #6
	bls	lab198
	movs	r3, #0
	str	r3, [r7, #4]
	b	lab199
lab200: 	uxtb	r3, r3
	movs	r1, #7
	mov	r0, r3
	bl	setmask
	ldr	r3, [r7, #4]
	uxtb	r2, r3
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	add	r3, r2
	uxtb	r3, r3
	subs	r3, #8
	uxtb	r3, r3
	movs	r1, #7
	mov	r0, r3
	bl	setmask
	ldr	r3, [r7, #4]
	uxtb	r2, r3
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	subs	r3, #8
	uxtb	r3, r3
	mov	r1, r3
	mov	r0, r2
	bl	setmask
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab199: 	ldr	r3, [r7, #4]
	cmp	r3, #7
	bls	lab200
	movs	r3, #0
	str	r3, [r7, #4]
	b	lab201
lab202: 	uxtb	r3, r3
	movs	r1, #8
	mov	r0, r3
	bl	setmask
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab201: 	ldr	r3, [r7, #4]
	cmp	r3, #8
	bls	lab202
	movs	r3, #0
	str	r3, [r7, #4]
	b	lab203
lab204: 	uxtb	r2, r3
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	add	r3, r2
	uxtb	r3, r3
	subs	r3, #8
	uxtb	r3, r3
	movs	r1, #8
	mov	r0, r3
	bl	setmask
	ldr	r3, [r7, #4]
	uxtb	r3, r3
	mov	r1, r3
	movs	r0, #8
	bl	setmask
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab203: 	ldr	r3, [r7, #4]
	cmp	r3, #7
	bls	lab204
	movs	r3, #0
	str	r3, [r7, #0]
	b	lab205
lab206: 	uxtb	r2, r3
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	add	r3, r2
	uxtb	r3, r3
	subs	r3, #7
	uxtb	r3, r3
	mov	r1, r3
	movs	r0, #8
	bl	setmask
	ldr	r3, [r7, #0]
	adds	r3, #1
	str	r3, [r7, #0]
lab205: 	ldr	r3, [r7, #0]
	cmp	r3, #6
	bls	lab206
	movs	r3, #0
	str	r3, [r7, #4]
	b	lab207
lab210: 	and	r3, r3, #1
	cmp	r3, #0
	beq	lab208
	ldr	r3, [r7, #4]
	uxtb	r3, r3
	adds	r3, #8
	uxtb	r3, r3
	movs	r1, #6
	mov	r0, r3
	bl	setmask
	ldr	r3, [r7, #4]
	uxtb	r3, r3
	adds	r3, #8
	uxtb	r3, r3
	mov	r1, r3
	movs	r0, #6
	bl	setmask
	b	lab209
lab208: 	ldr	r3, =framebase	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #8
	lsrs	r1, r3, #3
	ldr	r3, =WDB	
	ldrb	r3, [r3, #0]
	mov	r0, r3
	mov	r3, r0
	lsls	r3, r3, #1
	add	r3, r0
	lsls	r3, r3, #1
	add	r3, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	sxtb	r2, r3
	ldr	r3, [r7, #4]
	and	r3, r3, #7
	movs	r1, #128	
	asr	r3, r1, r3
	sxtb	r3, r3
	orrs	r3, r2
	sxtb	r4, r3
	ldr	r3, =framebase	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #8
	lsrs	r1, r3, #3
	ldr	r3, =WDB	
	ldrb	r3, [r3, #0]
	mov	r0, r3
	mov	r3, r0
	lsls	r3, r3, #1
	add	r3, r0
	lsls	r3, r3, #1
	add	r3, r1
	add	r3, r2
	uxtb	r2, r4
	strb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #8
	ldr	r1, =WDB	
	ldrb	r1, [r1, #0]
	mul	r3, r1, r3
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r3, =framebase	
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #8
	ldr	r0, =WDB	
	ldrb	r0, [r0, #0]
	mul	r3, r0, r3
	add	r3, r1
	orr	r2, r2, #2
	uxtb	r2, r2
	strb	r2, [r3, #0]
lab209: 	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab207: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	subs	r3, #14
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bcc	lab210
	bl	putvpat
	push {r1, r2}
	mov.w r1, #2570
	mov.w r2, #1610612736 
	str	r3, [r7, #0]
	b	lab211
lab215: 	str	r3, [r7, #4]
	b	lab212
	nop
	.ltorg
lab214: 	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	lsrs	r1, r3, #3
	ldr	r3, =WDB	
	ldrb	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, [r7, #0]
	mul	r3, r0, r3
	add	r3, r1
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #4]
	mvns	r3, r3
	and	r3, r3, #7
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	beq	lab213
	ldr	r3, [r7, #4]
	uxtb	r3, r3
	ldr	r2, [r7, #0]
	uxtb	r2, r2
	mov	r1, r2
	mov	r0, r3
	bl	setmask
lab213: 	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab212: 	ldr	r2, [r7, #4]
	ldr	r3, [r7, #0]
	cmp	r2, r3
	bls	lab214
	ldr	r3, [r7, #0]
	adds	r3, #1
	str	r3, [r7, #0]
lab211: 	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #0]
	cmp	r3, r2
	bcc	lab215
	nop
	nop
	adds	r7, #12
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7490
	mov.w r2, #1610612736 
	nop
	.ltorg
freeframe:
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, =framebase	
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free_beebs
	ldr	r3, =framask	
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free_beebs
	ldr	r3, =rlens	
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free_beebs
	nop
	cpsid f
	push {r1, r2}
	mov.w r1, #7359
	mov.w r2, #1610612736 
	nop
	.ltorg
initecc:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	mov	r3, r0
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strb	r3, [r7, #6]
	ldr	r2, =VERSION	
	ldrb	r3, [r7, #6]
	strb	r3, [r2, #0]
	ldrb	r3, [r7, #6]
	lsls	r3, r3, #2
	uxtb	r3, r3
	adds	r3, #17
	uxtb	r2, r3
	ldr	r3, =WD	
	strb	r2, [r3, #0]
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	adds	r3, #7
	cmp	r3, #0
	bge	lab216
	adds	r3, #7
lab216: 	asrs	r3, r3, #3
	uxtb	r2, r3
	ldr	r3, =WDB	
	strb	r2, [r3, #0]
	ldr	r3, =WD	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =WDB	
	ldrb	r3, [r3, #0]
	mul	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #768	
	bcs	lab217
	mov	r3, #768	
	str	r3, [r7, #12]
lab217: 	ldr	r0, [r7, #12]
	bl	malloc_beebs
	mov	r3, r0
	ldr	r2, =qrframe	
	str	r3, [r2, #0]
	ldr	r2, =ECCLEVEL	
	ldrb	r3, [r7, #7]
	strb	r3, [r2, #0]
	ldrb	r3, [r7, #7]
	subs	r2, r3, #1
	ldrb	r3, [r7, #6]
	subs	r3, #1
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	ldr	r2, =eccblocks	
	ldrb	r2, [r2, r3]
	ldr	r3, =neccblk1	
	strb	r2, [r3, #0]
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	ldr	r2, =eccblocks	
	ldrb	r2, [r2, r3]
	ldr	r3, =neccblk2	
	strb	r2, [r3, #0]
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	ldr	r2, =eccblocks	
	ldrb	r2, [r2, r3]
	ldr	r3, =datablkw	
	strb	r2, [r3, #0]
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	ldr	r2, =eccblocks	
	ldrb	r2, [r2, r3]
	ldr	r3, =eccblkwid	
	strb	r2, [r3, #0]
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mov	r1, r3
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =eccblkwid	
	ldrb	r3, [r3, #0]
	add	r3, r2
	ldr	r2, =neccblk1	
	ldrb	r2, [r2, #0]
	mov	r0, r2
	ldr	r2, =neccblk2	
	ldrb	r2, [r2, #0]
	add	r2, r0
	mul	r3, r2, r3
	add	r3, r1
	ldr	r2, =neccblk2	
	ldrb	r2, [r2, #0]
	add	r3, r2
	mov	r2, r3
	ldr	r3, [r7, #12]
	cmp	r3, r2
	bcs	lab218
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mov	r1, r3
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =eccblkwid	
	ldrb	r3, [r3, #0]
	add	r3, r2
	ldr	r2, =neccblk1	
	ldrb	r2, [r2, #0]
	mov	r0, r2
	ldr	r2, =neccblk2	
	ldrb	r2, [r2, #0]
	add	r2, r0
	mul	r3, r2, r3
	add	r3, r1
	ldr	r2, =neccblk2	
	ldrb	r2, [r2, #0]
	add	r3, r2
	str	r3, [r7, #12]
lab218: 	ldr	r0, [r7, #12]
	bl	malloc_beebs
	mov	r3, r0
	ldr	r2, =strinbuf	
	str	r3, [r2, #0]
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =neccblk1	
	ldrb	r3, [r3, #0]
	mov	r1, r3
	ldr	r3, =neccblk2	
	ldrb	r3, [r3, #0]
	add	r3, r1
	mul	r3, r2, r3
	ldr	r2, =neccblk2	
	ldrb	r2, [r2, #0]
	add	r3, r2
	subs	r3, #3
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5503
	mov.w r2, #1610612736 
	.ltorg
initeccsize:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	mov	r3, r0
	str	r1, [r7, #0]
	strb	r3, [r7, #7]
	movs	r3, #1
	strb	r3, [r7, #15]
	b	lab219
lab221: 	subs	r2, r3, #1
	ldrb	r3, [r7, #15]
	subs	r3, #1
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	ldr	r2, =eccblocks	
	ldrb	r2, [r2, r3]
	ldr	r3, =neccblk1	
	strb	r2, [r3, #0]
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	ldr	r2, =eccblocks	
	ldrb	r2, [r2, r3]
	ldr	r3, =neccblk2	
	strb	r2, [r3, #0]
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	ldr	r2, =eccblocks	
	ldrb	r2, [r2, r3]
	ldr	r3, =datablkw	
	strb	r2, [r3, #0]
	ldr	r3, =datablkw	
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, =neccblk1	
	ldrb	r3, [r3, #0]
	mov	r1, r3
	ldr	r3, =neccblk2	
	ldrb	r3, [r3, #0]
	add	r3, r1
	mul	r3, r2, r3
	ldr	r2, =neccblk2	
	ldrb	r2, [r2, #0]
	add	r3, r2
	subs	r3, #3
	mov	r2, r3
	ldr	r3, [r7, #0]
	cmp	r3, r2
	bcc	lab220
	ldrb	r3, [r7, #15]
	adds	r3, #1
	strb	r3, [r7, #15]
lab219: 	ldrb	r3, [r7, #15]
	cmp	r3, #39	
	bls	lab221
	b	lab222
lab220: 	nop
lab222: 	ldrb	r2, [r7, #15]
	ldrb	r3, [r7, #7]
	mov	r1, r2
	mov	r0, r3
	bl	initecc
	push {r1, r2}
	mov.w r1, #1549
	mov.w r2, #1610612736 
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1818
	mov.w r2, #1610612736 
	.ltorg
freeecc:
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, =qrframe	
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free_beebs
	ldr	r3, =strinbuf	
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free_beebs
	nop
	cpsid f
	push {r1, r2}
	mov.w r1, #7311
	mov.w r2, #1610612736 
	.ltorg
warm_caches:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
push {r1, r2}
	mov.w r1, #2587
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2587
	mov.w r2, #1610612736 
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5992
	mov.w r2, #1610612736 
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #5
push {r1, r2}
	mov.w r1, #1334
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1334
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #2496
	mov.w r2, #1610612736 
benchmark_body:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab223
lab224: 	ldr	r3, [r3, #0]
	ldr	r2, =encode	
	str	r3, [r2, #0]
	ldr	r3, =size	
	movs	r2, #22
	str	r2, [r3, #0]
	mov	r1, #8192	
	ldr	r0, =heap	
	bl	init_heap_beebs
	push {r1, r2}
	mov.w r1, #5551
	mov.w r2, #1610612736 
	ldr	r3, [r3, #0]
	mov	r1, r3
	movs	r0, #1
	bl	initeccsize
	push {r1, r2}
	mov.w r1, #7405
	mov.w r2, #1610612736 
	ldr	r3, [r3, #0]
	ldr	r2, =encode	
	ldr	r1, [r2, #0]
	ldr	r2, =size	
	ldr	r2, [r2, #0]
	mov	r0, r3
	bl	memcpy
	bl	initframe
	push {r1, r2}
	mov.w r1, #2661
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5719
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7610
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5199
	mov.w r2, #1610612736 
	adds	r3, #1
	str	r3, [r7, #12]
lab223: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab224
	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2463
	mov.w r2, #1610612736 
	.ltorg
initialise_benchmark:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
verify_benchmark:
	push	{r4, r5, r7, lr}
	sub	sp, #32
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [pc, #68]	
	add	r4, r7, #8
	mov	r5, r3
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5, {r0, r1}
	str	r0, [r4, #0]
	adds	r4, #4
	strh	r1, [r4, #0]
	ldr	r3, =strinbuf	
	ldr	r3, [r3, #0]
	add	r1, r7, #8
	movs	r2, #22
	mov	r0, r3
	bl	memcmp
	push {r1, r2}
	mov.w r1, #3639
	mov.w r2, #1610612736 
	cmp	r3, #0
	bne	lab225
	ldr	r0, =heap	
	bl	check_heap_beebs
	mov	r3, r0
	cmp	r3, #0
	beq	lab225
	movs	r3, #1
	b	lab226
lab225: 	movs	r3, #0
lab226: 	mov	r0, r3
	adds	r7, #32
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5996
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
	mov.w r1, #6926
	mov.w r2, #1610612736 
	bl	benchmark
	push {r1, r2}
	mov.w r1, #2497
	mov.w r2, #1610612736 
	str	r3, [r7, #8]
	bl	stop_trigger
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	verify_benchmark
	push {r1, r2}
	mov.w r1, #5168
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
	mov.w r1, #6247
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
	beq	lab227
	ldr	r3, [pc, #40]	
	ldr	r2, =__func__.0	
	movs	r1, #65	
	ldr	r0, [pc, #44]	
	bl	__assert_func
lab227: 	ldr	r2, =heap_ptr	
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
	mov.w r1, #4958
	mov.w r2, #1610612736 
	.ltorg
check_heap_beebs:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, =heap_requested	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	add	r2, r3
	ldr	r3, =heap_end	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ite	ls
	movls	r3, #1
	movhi	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
malloc_beebs:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	lab228
	movs	r3, #0
	b	lab229
lab228: 	ldr	r3, =heap_ptr	
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
	beq	lab230
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
lab230: 	ldr	r3, =heap_end	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #20]
	cmp	r2, r3
	bls	lab231
	movs	r3, #0
	b	lab229
lab231: 	ldr	r3, =heap_ptr	
	ldr	r3, [r3, #0]
	str	r3, [r7, #8]
	ldr	r2, =heap_ptr	
	ldr	r3, [r7, #20]
	str	r3, [r2, #0]
	ldr	r3, [r7, #8]
lab229: 	mov	r0, r3
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
calloc_beebs:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #0]
	mul	r3, r2, r3
	mov	r0, r3
	bl	malloc_beebs
	str	r0, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	lab232
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #0]
	mul	r3, r2, r3
	mov	r2, r3
	movs	r1, #0
	ldr	r0, [r7, #12]
push {r1, r2}
	mov.w r1, #192
	mov.w r2, #1610612736 
lab232:	push {r1, r2}
	mov.w r1, #192
	mov.w r2, #1610612736 
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #778
	mov.w r2, #1610612736 
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
	cbz	r4, lab233
	ldr	r1, [pc, #28]	
lab234: 	strd	r1, r4, [sp, #4]
	mov	r0, r6
	ldr	r1, [pc, #24]	
	bl	fiprintf
	push {r1, r2}
	mov.w r1, #480
	mov.w r2, #1610612736 
lab233: 	ldr	r1, [pc, #16]	
	mov	r4, r1
	b	lab234
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
	mov.w r1, #5459
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5459
	mov.w r2, #1610612736 
	ldmia	sp!, {r4, lr}
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #7639
	mov.w r2, #1610612736 
	nop
	.ltorg
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x0001e4ac	
	ldr	r5, =0x0001e4ac	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab235
	movs	r4, #0
lab236: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #3296
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #3296
	mov.w r2, #1610612736 
lab235: 	ldr	r6, =0x0001e4b4	
	ldr	r5, =0x0001e4ac	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab237
	movs	r4, #0
lab238: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #1058
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #1058
	mov.w r2, #1610612736 
lab237:	cpsid f
	push {r1, r2}
	mov.w r1, #2381
	mov.w r2, #1610612736 
	.ltorg
memcmp:
	cmp	r2, #3
	push	{r4, lr}
	bls	lab239
	orr	ip, r0, r1
	tst	ip, #3
	mov	r4, r0
	mov	r3, r1
	bne	lab240
lab241: 	mov	r0, r4
	ldr	lr, [r1]
	ldr	ip, [r0]
	cmp	ip, lr
	add	r4, r4, #4
	add	r3, r3, #4
	bne	lab240
	subs	r2, #4
	cmp	r2, #3
	mov	r0, r4
	mov	r1, r3
	bhi	lab241
lab239: 	subs	r4, r2, #1
	cbz	r2, lab242
lab246: 	subs	r1, #1
	b	lab243
lab245: 	beq	lab244
lab243: 	ldrb	lr, [ip, #1]!
	ldrb	r2, [r1, #1]!
	cmp	lr, r2
	sub	r3, r4, ip
	beq	lab245
	sub	r0, lr, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #6749
	mov.w r2, #1610612736 
lab240: 	subs	r4, r2, #1
	b	lab246
lab244: 	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #2340
	mov.w r2, #1610612736 
lab242: 	mov	r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #2854
	mov.w r2, #1610612736 
memcpy:
	mov	ip, r0
	orr	r3, r1, r0
	ands	r3, r3, #3
	bne	lab247
lab256: 	bcc	lab248
lab249: 	str	r3, [r0], #4
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
	bcs	lab249
lab248: 	adds	r2, #48	
	bcc	lab250
lab251: 	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #16
	bcs	lab251
lab250: 	adds	r2, #12
	bcc	lab252
lab253: 	str	r3, [r0], #4
	subs	r2, #4
	bcs	lab253
lab252: 	adds	r2, #4
	beq	lab254
	lsls	r2, r2, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab254
	ldrh	r3, [r1, #0]
	strh	r3, [r0, #0]
lab254: 	mov	r0, ip
	bx	lr
	nop
lab247: 	cmp	r2, #8
	bcc	lab255
	lsls	r3, r1, #30
	beq	lab256
	ands	r3, r0, #3
	beq	lab256
	rsb	r3, r3, #4
	subs	r2, r2, r3
	lsls	r3, r3, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab256
	ldrh	r3, [r1], #2
	strh	r3, [r0], #2
	b	lab256
lab255: 	subs	r2, #4
	bcc	lab252
lab257: 	ldrb	r3, [r1], #1
	strb	r3, [r0], #1
	bcs	lab257
	ldrb	r3, [r1, #0]
	strb	r3, [r0, #0]
	ldrb	r3, [r1, #1]
	strb	r3, [r0, #1]
	ldrb	r3, [r1, #2]
	strb	r3, [r0, #2]
	mov	r0, ip
	bx	lr
memmove:
	cmp	r0, r1
	bls	lab258
	adds	r3, r1, r2
	cmp	r3, r0
	bls	lab258
	add	ip, r0, r2
	cbz	r2, lab259
	mov	r2, ip
lab260: 	strb	ip, [r2, #-1]!
	cmp	r1, r3
	bne	lab260
	cpsid f
	push {r1, r2}
	mov.w r1, #6173
	mov.w r2, #1610612736 
lab258: 	cmp	r2, #15
	bhi	lab261
	mov	r3, r0
	add	ip, r2, #4294967295	
	cbz	r2, lab259
lab269: 	subs	r3, #1
	add	ip, r1
lab262: 	strb	r2, [r3, #1]!
	cmp	r1, ip
	bne	lab262
lab259:	cpsid f
	push {r1, r2}
	mov.w r1, #7611
	mov.w r2, #1610612736 
lab261: 	orr	r3, r0, r1
	lsls	r3, r3, #30
	bne	lab263
	sub	r3, r2, #16
	push	{r4, r5, r6, lr}
	add	ip, r1, #32
	bic	r5, r3, #15
	add	lr, r1, #16
	add	r4, r0, #16
	add	ip, r5
	lsrs	r3, r3, #4
lab264: 	str	r5, [r4, #-16]
	ldr	r5, [lr, #-12]
	str	r5, [r4, #-12]
	ldr	r5, [lr, #-8]
	str	r5, [r4, #-8]
	ldr	r5, [lr, #-4]
	str	r5, [r4, #-4]
	add	lr, lr, #16
	cmp	lr, ip
	add	r4, r4, #16
	bne	lab264
	adds	r3, #1
	tst	r2, #12
	add	r1, r1, r3, lsl #4
	and	r4, r2, #15
	add	r3, r0, r3, lsl #4
	beq	lab265
	subs	r4, #4
	bic	r6, r4, #3
	mov	ip, r4, lsr #2
	add	r6, r3
	subs	r4, r3, #4
	mov	lr, r1
lab266: 	str	r5, [r4, #4]!
	cmp	r4, r6
	bne	lab266
	add	r4, ip, #1
	and	r2, r2, #3
	add	r3, r3, r4, lsl #2
	add	r1, r1, r4, lsl #2
lab270: 	cbz	r2, lab267
	add	ip, ip, #1
	subs	r3, #1
	add	ip, r1
lab268: 	strb	r2, [r3, #1]!
	cmp	r1, ip
	bne	lab268
lab267:	cpsid f
	push {r1, r2}
	mov.w r1, #7068
	mov.w r2, #1610612736 
lab263: 	add	ip, r2, #4294967295	
	mov	r3, r0
	b	lab269
lab265: 	mov	r2, r4
	b	lab270
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab271
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab272
	uxtb	r2, r1
	mov	r3, r0
	b	lab273
lab274: 	bcc	lab272
lab273: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab274
lab282: 	bls	lab275
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab276
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab277: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab277
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab278
lab283: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab279: 	cmp	r3, r2
	bne	lab279
	and	r4, ip, #3
lab275: 	cbz	r4, lab272
lab281: 	add	r4, r3
lab280: 	cmp	r4, r3
	bne	lab280
lab272:	cpsid f
	push {r1, r2}
	mov.w r1, #5671
	mov.w r2, #1610612736 
lab278: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab281
	b	lab272
lab271: 	mov	r3, r0
	mov	r4, r2
	b	lab282
lab276: 	mov	r2, r3
	mov	ip, r4
	b	lab283
strlen:
	pld	[r0]
	strd	r4, r5, [sp, #-8]!
	bic	r1, r0, #7
	mvn	ip, #0
	ands	r4, r0, #7
	pld	[r1, #32]
	bne	lab284
	mov	r4, #0
	mvn	r0, #7
lab286: 	pld	[r1, #64]	
	add	r0, r0, #8
lab287: 	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab285
	ldrd	r2, r3, [r1, #8]
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab285
	ldrd	r2, r3, [r1, #16]
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab285
	ldrd	r2, r3, [r1, #24]
	add	r1, r1, #32
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cmp	r3, #0
	beq	lab286
lab285: 	cmp	r2, #0
	itt	eq
	addeq	r0, #4
	moveq	r2, r3
	rev	r2, r2
	clz	r2, r2
	ldrd	r4, r5, [sp], #8
	add	r0, r0, r2, lsr #3
	bx	lr
lab284: 	ldrd	r2, r3, [r1]
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
	b	lab287
__sprint_r.part.0:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, [r1, #100]	
	lsls	r4, r3, #18
	mov	r8, r2
	bpl	lab288
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #0]
	cbz	r3, lab289
	mov	fp, r1
	mov	r6, r0
	add	r9, r2, #8
lab294: 	movs	r7, sl, lsr #2
	beq	lab290
	subs	r5, #4
	movs	r4, #0
	b	lab291
lab293: 	beq	lab292
lab291: 	ldr	r1, [r5, #4]!
	mov	r2, fp
	mov	r0, r6
	bl	_fputwc_r
	push {r1, r2}
	mov.w r1, #3884
	mov.w r2, #1610612736 
	add	r4, r4, #1
	bne	lab293
lab295: 	strd	r3, r3, [r8, #4]
	cpsid f
	push {r1, r2}
	mov.w r1, #5822
	mov.w r2, #1610612736 
lab292: 	ldr	r3, [r8, #8]
lab290: 	bic	sl, sl, #3
	sub	r3, r3, sl
	str	r3, [r8, #8]
	add	r9, r9, #8
	cmp	r3, #0
	bne	lab294
lab289: 	movs	r0, #0
	b	lab295
lab288: 	bl	__sfvwrite_r
	push {r1, r2}
	mov.w r1, #520
	mov.w r2, #1610612736 
	strd	r3, r3, [r8, #4]
	cpsid f
	push {r1, r2}
	mov.w r1, #5612
	mov.w r2, #1610612736 
	nop
_vfiprintf_r:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, #244	
	strd	r3, r0, [sp, #16]
	mov	r4, r3
	str	r1, [sp, #4]
	mov	r7, r2
	cbz	r0, lab296
	ldr	r3, [r0, #56]	
	cmp	r3, #0
	beq	lab297
lab296: 	ldr	r2, [sp, #4]
	ldr	r3, [r2, #100]	
	lsls	r6, r3, #31
	bpl	lab298
	ldrsh	r1, [r2, #12]
	uxth	r2, r1
lab337: 	bmi	lab299
	orr	r2, r1, #8192	
	ldr	r1, [sp, #4]
	ldr	r3, [r1, #100]	
	strh	r2, [r1, #12]
	bic	r3, r3, #8192	
	uxth	r2, r2
	str	r3, [r1, #100]	
lab299: 	lsls	r1, r2, #28
	bpl	lab300
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	lab300
	and	r3, r2, #26
	cmp	r3, #10
	beq	lab301
lab319: 	str	r3, [sp, #64]	
	movs	r3, #0
	strd	r3, r3, [sp, #68]	
	strd	r3, r3, [sp, #40]	
	str	r3, [sp, #32]
	add	r9, sp, #76	
	str	r3, [sp, #36]	
	str	r3, [sp, #12]
lab352: 	cmp	r3, #0
	beq	lab302
	mov	r4, r7
	b	lab303
lab305: 	cmp	r3, #0
	beq	lab304
lab303: 	cmp	r3, #37	
	bne	lab305
	subs	r5, r4, r7
	bne	lab306
lab330: 	cmp	r3, #0
	beq	lab302
	mov	r3, #0
	movs	r5, #0
	strb	r3, [sp, #59]	
	adds	r7, r4, #1
	ldrb	r3, [r4, #1]
	str	r5, [sp, #8]
	mov	fp, #4294967295	
	movs	r4, #43	
lab311: lab309: 	cmp	r2, #90	
	bhi	lab307
	tbh	[pc, r2, lsl #1]
	.ltorg

	sub	r2, r3, #48	
	movs	r1, #0
lab308: 	add	r1, r1, r1, lsl #2
	add	r1, r2, r1, lsl #1
	sub	r2, r3, #48	
	cmp	r2, #9
	bls	lab308
	str	r1, [sp, #8]
	b	lab309
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
	bne	lab310
lab370: 	b	lab311
	ldrb	r3, [r7, #0]
	orr	r5, r5, #32
	b	lab311
	orr	r5, r5, #16
	lsls	r4, r5, #26
	ldr	r6, [sp, #16]
	bpl	lab312
	adds	r6, #7
	bic	r6, r6, #7
	mov	r2, r6
	ldr	r3, [r6, #4]
	ldr	r6, [r2], #8
	str	r2, [sp, #16]
	mov	r8, r3
lab359: 	blt	lab313
	cmp	fp, #4294967295	
	beq	lab314
	orrs	r3, r6, r8
	bic	sl, r5, #128	
	beq	lab315
lab373: 	sbcs	r3, r8, #0
	bcs	lab316
lab414: 	movs	r3, #1
	strb	r6, [sp, #239]	
	mov	r5, sl
	str	r3, [sp, #0]
	add	r4, sp, #239	
lab328: 	ldrb	r3, [sp, #59]	
	cmp	r8, fp
	it	lt
	movlt	r8, fp
	cmp	r3, #0
	beq	lab317
	add	r8, r8, #1
	b	lab317
lab300: 	ldr	r5, [sp, #4]
	ldr	r0, [sp, #20]
	mov	r1, r5
push {r1, r2}
	mov.w r1, #5090
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5090
	mov.w r2, #1610612736 
	bne	lab318
	ldrh	r2, [r5, #12]
	and	r3, r2, #26
	cmp	r3, #10
	bne	lab319
lab301: 	ldr	r1, [sp, #4]
	ldrsh	r3, [r1, #14]
	cmp	r3, #0
	blt	lab319
	ldr	r3, [r1, #100]	
	lsls	r6, r3, #31
	bmi	lab320
	lsls	r5, r2, #22
	bpl	lab321
lab320: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	mov	r3, r4
	mov	r2, r7
	add	sp, #244	
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__sbprintf
	orr	r5, r5, #16
	ands	r8, r5, #32
	beq	lab322
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r3, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r3], #8
	str	r3, [sp, #16]
lab356: 	movs	r3, #0
lab366: 	strb	r2, [sp, #59]	
lab417: 	beq	lab323
	orrs	r2, r6, r8
	bic	r5, sl, #128	
	bne	lab324
	cmp	fp, #0
	bne	lab325
	cmp	r3, #0
	bne	lab326
	ands	r3, sl, #1
	str	r3, [sp, #0]
	beq	lab327
	movs	r3, #48	
	strb	r3, [sp, #239]	
	add	r4, sp, #239	
	b	lab328
lab304: 	subs	r5, r4, r7
	beq	lab302
lab306: 	ldr	r3, [sp, #68]	
	ldr	r2, [sp, #72]	
	adds	r3, #1
	add	r2, r5
	cmp	r3, #7
	strd	r7, r5, [r9]
	str	r2, [sp, #72]	
	str	r3, [sp, #68]	
	bgt	lab329
	add	r9, r9, #8
lab333: 	add	r3, r5
	str	r3, [sp, #12]
	b	lab330
lab329: 	cmp	r2, #0
	beq	lab331
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #3814
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3814
	mov.w r2, #1610612736 
	add	r9, sp, #76	
	b	lab333
lab302: 	ldr	r3, [sp, #72]	
	cmp	r3, #0
	bne	lab334
lab439: 	str	r3, [sp, #68]	
lab332: 	ldr	r2, [sp, #4]
	ldr	r3, [r2, #100]	
	lsls	r1, r3, #31
	bpl	lab335
	ldrh	r3, [r2, #12]
lab353: 	bmi	lab336
lab441: 	add	sp, #244	
	cpsid f
	push {r1, r2}
	mov.w r1, #6726
	mov.w r2, #1610612736 
lab298: 	ldr	r3, [sp, #4]
	ldrsh	r1, [r3, #12]
	lsls	r5, r1, #22
	uxth	r2, r1
	bmi	lab337
	mov	r5, r3
	ldr	r0, [r3, #88]	
	bl	__retarget_lock_acquire_recursive
	ldrsh	r1, [r5, #12]
	uxth	r2, r1
	b	lab337
lab307: 	cmp	r3, #0
	beq	lab302
	strb	r3, [sp, #140]	
	mov	r8, #1
	mov	r3, #0
	strb	r3, [sp, #59]	
	str	r8, [sp]
	add	r4, sp, #140	
lab363: lab317: 	ands	r3, r5, #2
	str	r3, [sp, #24]
	it	ne
	addne	r8, r8, #2
	ands	r3, r5, #132	
	str	r3, [sp, #28]
	bne	lab338
	ldr	r3, [sp, #8]
	sub	r6, r3, r8
	cmp	r6, #0
	bgt	lab339
lab338: 	ldrd	r2, r1, [sp, #68]	
	adds	r0, r2, #1
lab403: 	cbz	r6, lab340
	add	r2, sp, #59	
	adds	r1, #1
	str	r2, [r9]
	cmp	r0, #7
	mov	r2, #1
	strd	r0, r1, [sp, #68]	
	str	r2, [r9, #4]
	bgt	lab341
lab426: 	add	r9, r9, #8
	adds	r0, #1
lab340: 	ldr	r3, [sp, #24]
	cbz	r3, lab342
	add	r3, sp, #60	
	adds	r1, #2
	str	r3, [r9]
	cmp	r0, #7
	mov	r3, #2
	strd	r0, r1, [sp, #68]	
	str	r3, [r9, #4]
	ble	lab343
	cmp	r1, #0
	beq	lab344
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #4080
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4080
	mov.w r2, #1610612736 
	bne	lab332
	ldrd	r2, r1, [sp, #68]	
	add	r9, sp, #76	
	adds	r0, r2, #1
lab342: 	ldr	r3, [sp, #28]
	cmp	r3, #128	
	beq	lab345
lab378: 	sub	r6, fp, r3
	cmp	r6, #0
	bgt	lab346
lab386: 	str	r4, [r9]
	add	r1, r3
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	
	str	r3, [r9, #4]
	ble	lab347
	cmp	r1, #0
	beq	lab348
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #5072
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5072
	mov.w r2, #1610612736 
	bne	lab332
	ldr	r1, [sp, #72]	
	add	r9, sp, #76	
lab377: 	bpl	lab349
	ldr	r3, [sp, #8]
	sub	r4, r3, r8
	cmp	r4, #0
	bgt	lab350
lab349: 	ldrd	r2, r3, [sp, #8]
	cmp	r2, r8
	ite	ge
	addge	r3, r3, r2
	addlt	r3, r8
	str	r3, [sp, #12]
	cmp	r1, #0
	bne	lab351
lab394: 	str	r3, [sp, #68]	
	add	r9, sp, #76	
	b	lab352
lab335: 	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #12]
	lsls	r2, r3, #22
	bmi	lab353
	ldr	r4, [sp, #4]
	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	ldrh	r3, [r4, #12]
	b	lab353
lab322: 	ands	r3, r5, #16
	bne	lab354
	ands	r2, r5, #64	
	beq	lab355
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	mov	r8, r3
	uxth	r6, r6
	b	lab356
lab312: 	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	lsls	r0, r5, #27
	bmi	lab357
	lsls	r1, r5, #25
	bpl	lab358
	sbfx	r8, r3, #15, #1
	sxth	r6, r3
	mov	r3, r8
	b	lab359
	ldr	r6, [sp, #16]
	ldr	r4, [r6], #4
	mov	r3, #0
	strb	r3, [sp, #59]	
	cmp	r4, #0
	beq	lab360
	cmp	fp, #4294967295	
	beq	lab361
	mov	r2, fp
	movs	r1, #0
	mov	r0, r4
	bl	memchr
	cmp	r0, #0
	beq	lab362
	subs	r3, r0, r4
	str	r3, [sp, #0]
	str	r6, [sp, #16]
	mov	fp, #0
	b	lab328
	ldr	r6, [sp, #16]
	mov	r3, #0
	strb	r3, [sp, #59]	
	mov	r8, #1
	ldr	r3, [r6], #4
	strb	r3, [sp, #140]	
	str	r6, [sp, #16]
	str	r8, [sp]
	add	r4, sp, #140	
	b	lab363
lab297: 	bl	__sinit
	b	lab296
	ldr	r3, [sp, #16]
	ldr	r2, [r3], #4
	str	r2, [sp, #8]
	cmp	r2, #0
	bge	lab364
	ldr	r2, [sp, #8]
	str	r3, [sp, #16]
	negs	r2, r2
	str	r2, [sp, #8]
	ldrb	r3, [r7, #0]
	orr	r5, r5, #4
	b	lab311
	ldrb	r3, [r7, #0]
	cmp	r3, #108	
	ittte	eq
	ldrbeq	r3, [r7, #1]
	orreq	r5, r5, #32
	addeq	r7, #1
	orrne	r5, r5, #16
	b	lab311
	ldrb	r3, [r7, #0]
	cmp	r3, #104	
	ittte	eq
	ldrbeq	r3, [r7, #1]
	orreq	r5, r5, #512	
	addeq	r7, #1
	orrne	r5, r5, #64	
	b	lab311
	orr	sl, r5, #16
lab423: 	beq	lab365
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r3, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r3], #8
	str	r3, [sp, #16]
	movs	r3, #1
	b	lab366
	ldrb	r3, [r7, #0]
	strb	r4, [sp, #59]	
	b	lab311
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
	b	lab366
	lsls	r6, r5, #26
	bmi	lab367
	lsls	r4, r5, #27
	bmi	lab368
	lsls	r0, r5, #25
	bmi	lab369
	lsls	r1, r5, #22
	bpl	lab368
	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	strb	r2, [r3, #0]
	b	lab352
	ldrb	r3, [r7, #0]
	orr	r5, r5, #1
	b	lab311
	ldrb	r3, [sp, #59]	
	cmp	r3, #0
	bne	lab370
	movs	r3, #32
	strb	r3, [sp, #59]	
	ldrb	r3, [r7, #0]
	b	lab311
	ldrb	r3, [r7, #0]
	orr	r5, r5, #128	
	b	lab311
	mov	r1, r7
	ldrb	r3, [r1], #1
	cmp	r3, #42	
	beq	lab371
	sub	r2, r3, #48	
	cmp	r2, #9
	mov	r7, r1
	mov	fp, #0
	bhi	lab309
lab372: 	add	fp, fp, fp, lsl #2
	add	fp, r2, fp, lsl #1
	sub	r2, r3, #48	
	cmp	r2, #9
	bls	lab372
	b	lab309
lab324: 	mov	sl, r5
lab323: 	cmp	r3, #1
	beq	lab373
lab434: 	add	r4, sp, #240	
	bne	lab374
	ldr	r2, [sp, #32]
lab375: 	lsrs	r6, r6, #4
	ldrb	r3, [r2, r3]
	strb	r3, [r4, #-1]!
	orr	r6, r6, r8, lsl #28
	mov	r8, r8, lsr #4
	orrs	r3, r6, r8
	bne	lab375
lab376: 	subs	r3, r3, r4
	mov	r5, sl
	str	r3, [sp, #0]
	b	lab328
lab374: 	and	r3, r6, #7
	lsrs	r6, r6, #3
	orr	r6, r6, r8, lsl #29
	mov	r8, r8, lsr #3
	adds	r3, #48	
	orrs	r1, r6, r8
	mov	r2, r4
	strb	r3, [r4, #-1]!
	bne	lab374
	tst	sl, #1
	beq	lab376
	cmp	r3, #48	
	beq	lab376
	movs	r3, #48	
	subs	r2, #2
	strb	r3, [r4, #-1]
	add	r3, sp, #240	
	subs	r3, r3, r2
	mov	r5, sl
	str	r3, [sp, #0]
	mov	r4, r2
	b	lab328
lab412: 	str	r4, [sp, #76]	
	movs	r3, #1
	str	r1, [sp, #80]	
	str	r1, [sp, #72]	
	str	r3, [sp, #68]	
	add	r9, sp, #76	
lab347: 	add	r9, r9, #8
	b	lab377
lab345: 	ldr	r3, [sp, #8]
	sub	r6, r3, r8
	cmp	r6, #0
	ble	lab378
	cmp	r6, #16
	ble	lab379
	ldr	sl, =zeroes.0	
	mov	r3, sl
	strd	fp, r4, [sp, #24]
	mov	sl, r7
	ldr	fp, [sp, #20]
	ldr	r4, [sp, #4]
	mov	r7, r5
	mov	r5, r3
	b	lab380
lab382: 	add	r9, r9, #8
	mov	r2, r0
lab395: 	cmp	r6, #16
	ble	lab381
lab380: 	adds	r0, r2, #1
	adds	r1, #16
	movs	r3, #16
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	
	str	r5, [r9]
	str	r3, [r9, #4]
	ble	lab382
	add	r2, sp, #64	
	cmp	r1, #0
	beq	lab383
	mov	r1, r4
	mov	r0, fp
	add	r9, sp, #76	
push {r1, r2}
	mov.w r1, #6349
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6349
	mov.w r2, #1610612736 
	bne	lab332
	ldrd	r2, r1, [sp, #68]	
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	bgt	lab380
lab381: 	ldrd	fp, r4, [sp, #24]
	mov	r3, r5
	mov	r5, r7
	mov	r7, sl
	mov	sl, r3
lab442: 	cmp	ip, #7
	strd	ip, r1, [sp, #68]	
	str	sl, [r9]
	str	r6, [r9, #4]
	ble	lab384
	cmp	r1, #0
	beq	lab385
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #73
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #73
	mov.w r2, #1610612736 
	bne	lab332
	ldr	r3, [sp, #0]
	ldrd	r2, r1, [sp, #68]	
	sub	r6, fp, r3
	cmp	r6, #0
	add	r0, r2, #1
	add	r9, sp, #76	
	ble	lab386
lab346: 	cmp	r6, #16
	ldr	sl, =zeroes.0	
	ble	lab387
	mov	r3, sl
	strd	r4, r5, [sp, #24]
	mov	sl, r7
	ldr	r4, [sp, #20]
	ldr	r5, [sp, #4]
	mov	fp, #16
	mov	r7, r3
	b	lab388
lab390: 	add	r9, r9, #8
	mov	r2, r0
lab393: 	cmp	r6, #16
	ble	lab389
lab388: 	adds	r0, r2, #1
	adds	r1, #16
	cmp	r0, #7
	strd	r7, fp, [r9]
	strd	r0, r1, [sp, #68]	
	ble	lab390
	add	r2, sp, #64	
	cbz	r1, lab391
	mov	r1, r5
	mov	r0, r4
	add	r9, sp, #76	
push {r1, r2}
	mov.w r1, #5740
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5740
	mov.w r2, #1610612736 
	bne	lab332
	ldrd	r2, r1, [sp, #68]	
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	bgt	lab388
lab389: 	ldrd	r4, r5, [sp, #24]
	mov	r3, r7
	mov	r0, ip
	mov	r7, sl
	mov	sl, r3
lab387: 	add	r1, r6
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	
	str	sl, [r9]
	str	r6, [r9, #4]
	bgt	lab392
	add	r9, r9, #8
	adds	r0, #1
	b	lab386
lab391: 	mov	ip, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab393
lab351: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #2015
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2015
	mov.w r2, #1610612736 
	beq	lab394
	b	lab332
lab383: 	mov	ip, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab395
lab341: 	cmp	r1, #0
	beq	lab396
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #2199
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2199
	mov.w r2, #1610612736 
	bne	lab332
	ldrd	r2, r1, [sp, #68]	
	add	r9, sp, #76	
	adds	r0, r2, #1
	b	lab340
lab437: 	add	r3, sp, #60	
	str	r1, [sp, #80]	
	str	r3, [sp, #76]	
	movs	r0, #1
	add	r9, sp, #76	
lab343: 	mov	r2, r0
lab420: 	adds	r0, r2, #1
	b	lab342
lab339: 	cmp	r6, #16
	ble	lab397
	ldrd	ip, r1, [sp, #68]	
	ldr	sl, =blanks.1	
	strd	fp, r4, [sp, #48]	
	movs	r3, #16
	mov	r4, sl
	ldr	fp, [sp, #4]
	ldr	sl, [sp, #20]
	mov	r2, ip
	b	lab398
	.ltorg
lab400: 	add	r9, r9, #8
	mov	r2, r0
lab404: 	cmp	r6, #16
	ble	lab399
lab398: 	adds	r0, r2, #1
	adds	r1, #16
	cmp	r0, #7
	strd	r4, r3, [r9]
	strd	r0, r1, [sp, #68]	
	ble	lab400
	add	r2, sp, #64	
	cbz	r1, lab401
	mov	r1, fp
	mov	r0, sl
	add	r9, sp, #76	
push {r1, r2}
	mov.w r1, #7395
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7395
	mov.w r2, #1610612736 
	bne	lab332
	ldrd	r2, r1, [sp, #68]	
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	mov	r3, #16
	bgt	lab398
lab399: 	mov	sl, r4
	ldr	fp, [sp, #48]	
	ldr	r4, [sp, #52]	
	mov	r2, ip
lab438: 	cmp	r2, #7
	strd	r2, r1, [sp, #68]	
	str	sl, [r9]
	str	r6, [r9, #4]
	bgt	lab402
	add	r9, r9, #8
	adds	r0, r2, #1
	b	lab403
lab401: 	mov	r2, r1
	mov	ip, #1
	add	r9, sp, #76	
	b	lab404
lab348: 	lsls	r4, r5, #29
	str	r1, [sp, #68]	
	bpl	lab405
	ldr	r3, [sp, #8]
	sub	r4, r3, r8
	cmp	r4, #0
	ble	lab405
	add	r9, sp, #76	
lab350: 	cmp	r4, #16
	ble	lab406
	ldr	sl, =blanks.1	
	ldr	r2, [sp, #68]	
	ldr	r6, [sp, #20]
	ldr	fp, [sp, #4]
	mov	r3, sl
	movs	r5, #16
	mov	sl, r7
	mov	r7, r3
	b	lab407
lab409: 	add	r9, r9, #8
	mov	r2, r3
lab411: 	cmp	r4, #16
	ble	lab408
lab407: 	adds	r3, r2, #1
	adds	r1, #16
	cmp	r3, #7
	strd	r7, r5, [r9]
	strd	r3, r1, [sp, #68]	
	ble	lab409
	add	r2, sp, #64	
	cbz	r1, lab410
	mov	r1, fp
	mov	r0, r6
push {r1, r2}
	mov.w r1, #5519
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5519
	mov.w r2, #1610612736 
	bne	lab332
	ldrd	r2, r1, [sp, #68]	
	subs	r4, #16
	cmp	r4, #16
	add	r0, r2, #1
	add	r9, sp, #76	
	bgt	lab407
lab408: 	mov	r3, r7
	mov	r7, sl
	mov	sl, r3
lab440: 	cmp	r0, #7
	strd	sl, r4, [r9]
	strd	r0, r1, [sp, #68]	
	ble	lab349
	cbz	r1, lab405
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #3305
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3305
	mov.w r2, #1610612736 
	bne	lab332
	ldr	r1, [sp, #72]	
	b	lab349
lab410: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab411
lab405: 	ldrd	r2, r3, [sp, #8]
	cmp	r2, r8
	ite	ge
	addge	r3, r3, r2
	addlt	r3, r8
	str	r3, [sp, #12]
	b	lab394
lab392: 	cmp	r1, #0
	beq	lab412
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #6538
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6538
	mov.w r2, #1610612736 
	bne	lab332
	ldr	r0, [sp, #68]	
	ldr	r1, [sp, #72]	
	adds	r0, #1
	add	r9, sp, #76	
	b	lab386
lab396: 	ldr	r3, [sp, #24]
	cmp	r3, #0
	bne	lab413
lab344: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab342
lab331: 	str	r2, [sp, #68]	
	add	r9, sp, #76	
	b	lab333
lab315: 	cmp	fp, #0
	bne	lab414
	mov	r5, sl
lab326: 	mov	fp, #0
	str	fp, [sp]
	add	r4, sp, #240	
	b	lab328
lab365: 	ands	r3, sl, #16
	bne	lab415
	ands	r2, sl, #64	
	beq	lab416
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	mov	r8, r3
	uxth	r6, r6
	movs	r3, #1
	b	lab366
lab313: 	movs	r3, #45	
	negs	r6, r6
	strb	r3, [sp, #59]	
	sbc	r8, r8, r8, lsl #1
	mov	sl, r5
	movs	r3, #1
	b	lab417
lab402: 	cmp	r1, #0
	beq	lab418
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #6020
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6020
	mov.w r2, #1610612736 
	bne	lab332
	ldrd	r2, r1, [sp, #68]	
	add	r9, sp, #76	
	adds	r0, r2, #1
	b	lab403
lab364: 	str	r3, [sp, #16]
	ldrb	r3, [r7, #0]
	b	lab311
lab327: 	add	r4, sp, #240	
	b	lab328
lab384: 	add	r9, r9, #8
	add	r0, ip, #1
	mov	r2, ip
	b	lab378
lab358: 	lsls	r2, r5, #22
	bmi	lab419
lab357: 	mov	r8, r3, asr #31
	mov	r6, r3
	mov	r3, r8
	b	lab359
lab415: 	ldr	r3, [sp, #16]
	ldr	r6, [r3], #4
	str	r3, [sp, #16]
	movs	r3, #1
	b	lab366
lab310: 	ldr	r3, [sp, #36]	
	cmp	r3, #0
	beq	lab370
	ldr	r3, [sp, #36]	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab370
	ldrb	r3, [r7, #0]
	orr	r5, r5, #1024	
	b	lab311
lab367: 	ldrd	r1, r6, [sp, #12]
	ldr	r2, [r6], #4
	str	r6, [sp, #16]
	asrs	r3, r1, #31
	strd	r1, r3, [r2]
	b	lab352
lab354: 	ldr	r3, [sp, #16]
	ldr	r6, [r3], #4
	str	r3, [sp, #16]
	b	lab356
lab413: 	movs	r1, #2
	add	r3, sp, #60	
	str	r1, [sp, #80]	
	str	r3, [sp, #76]	
	add	r9, sp, #76	
	b	lab420
	ldr	r2, [pc, #300]	
	str	r2, [sp, #32]
lab424: 	beq	lab421
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r2, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r2], #8
	str	r2, [sp, #16]
lab428: 	bpl	lab422
	orrs	r2, r6, r8
	beq	lab422
	strb	r3, [sp, #61]	
	movs	r3, #48	
	orr	r5, r5, #2
	strb	r3, [sp, #60]	
lab422: 	bic	sl, r5, #1024	
	movs	r3, #2
	b	lab366
	mov	sl, r5
	b	lab423
	ldr	r2, [pc, #236]	
	str	r2, [sp, #32]
	b	lab424
lab361: 	mov	r0, r4
	str	r6, [sp, #16]
	bl	strlen
	mov	fp, #0
	str	r0, [sp, #0]
	b	lab328
lab418: 	ldrb	r2, [sp, #59]	
	cmp	r2, #0
	beq	lab425
	movs	r0, #1
	add	r2, sp, #59	
	str	r0, [sp, #80]	
	str	r2, [sp, #76]	
	add	r9, sp, #76	
	mov	r1, r0
	b	lab426
lab421: 	ands	r2, r5, #16
	beq	lab427
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	b	lab428
lab316: 	and	r3, sl, #1024	
	str	fp, [sp]
	str	r9, [sp, #24]
	mov	fp, r7
	ldr	r9, [sp, #36]	
	movs	r5, #0
	add	r4, sp, #240	
	mov	r7, r3
	b	lab429
lab431: 	mov	r1, r8
push {r1, r2}
	mov.w r1, #4357
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4357
	mov.w r2, #1610612736 
	sbcs	r3, r8, #0
	bcc	lab430
lab436: 	mov	r8, r1
lab429: 	mov	r0, r6
	mov	r1, r8
	movs	r2, #10
	movs	r3, #0
push {r1, r2}
	mov.w r1, #6815
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6815
	mov.w r2, #1610612736 
	adds	r1, #48	
	strb	r1, [r4, #-1]
	movs	r2, #10
	movs	r3, #0
	subs	r4, #1
	adds	r5, #1
	cmp	r7, #0
	beq	lab431
	ldrb	r1, [r9]
	cmp	r1, r5
	bne	lab431
	cmp	r5, #255	
	beq	lab431
	cmp	r6, #10
	sbcs	r3, r8, #0
	bcs	lab432
lab430: 	add	r3, sp, #240	
	subs	r3, r3, r4
	str	r9, [sp, #36]	
	mov	r7, fp
	ldr	r9, [sp, #24]
	ldr	fp, [sp]
	str	r3, [sp, #0]
	mov	r5, sl
	b	lab328
lab427: 	ands	r1, r5, #64	
	beq	lab433
	ldr	r1, [sp, #16]
	ldr	r6, [r1], #4
	str	r1, [sp, #16]
	mov	r8, r2
	uxth	r6, r6
	b	lab428
lab314: 	mov	sl, r5
	b	lab373
lab325: 	cmp	r3, #1
	mov	sl, r5
	bne	lab434
	b	lab414
	nop
	.ltorg
lab368: 	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r2, [r3, #0]
	str	r6, [sp, #16]
	b	lab352
lab360: 	cmp	fp, #6
	mov	r8, fp
	it	cs
	movcs	r8, #6
	ldr	r4, [pc, #320]	
	str	r8, [sp]
	str	r6, [sp, #16]
	b	lab363
lab416: 	ldr	r3, [sp, #16]
	ands	r8, sl, #512	
	ite	ne
	ldrne	r6, [r3], #4
	ldreq	r6, [r3], #4
	str	r3, [sp, #16]
	itt	ne
	movne	r8, r2
	uxtbne	r6, r6
	movs	r3, #1
	b	lab366
lab355: 	ldr	r3, [sp, #16]
	ands	r8, r5, #512	
	ite	ne
	ldrne	r6, [r3], #4
	ldreq	r6, [r3], #4
	str	r3, [sp, #16]
	itt	ne
	movne	r8, r2
	uxtbne	r6, r6
	b	lab356
lab433: 	ldr	r2, [sp, #16]
	ands	r8, r5, #512	
	ite	ne
	ldrne	r6, [r2], #4
	ldreq	r6, [r2], #4
	str	r2, [sp, #16]
	itt	ne
	movne	r8, r1
	uxtbne	r6, r6
	b	lab428
lab432: 	ldr	r3, [sp, #44]	
	ldr	r1, [sp, #40]	
	subs	r4, r4, r3
	mov	r2, r3
	mov	r0, r4
	bl	strncpy
	push {r1, r2}
	mov.w r1, #5596
	mov.w r2, #1610612736 
	cbz	r3, lab435
	add	r9, r9, #1
lab435: 	mov	r0, r6
	mov	r1, r8
	movs	r2, #10
	movs	r3, #0
	movs	r5, #0
push {r1, r2}
	mov.w r1, #1546
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1546
	mov.w r2, #1610612736 
lab385: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab378
lab425: 	ldr	r3, [sp, #24]
	cmp	r3, #0
	bne	lab437
	mov	r2, r1
	movs	r0, #1
	add	r9, sp, #76	
	b	lab378
lab369: 	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	strh	r2, [r3, #0]
	b	lab352
lab419: 	sbfx	r8, r3, #7, #1
	sxtb	r6, r3
	mov	r3, r8
	b	lab359
lab321: 	ldr	r0, [r1, #88]	
	bl	__retarget_lock_release_recursive
	b	lab320
lab362: 	str	fp, [sp]
	str	r6, [sp, #16]
	mov	fp, r0
	b	lab328
lab397: 	ldr	r2, [sp, #68]	
	ldr	r1, [sp, #72]	
	ldr	sl, =blanks.1	
	adds	r2, #1
	b	lab438
lab334: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #4720
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4720
	mov.w r2, #1610612736 
	beq	lab439
	b	lab332
lab406: 	ldr	r0, [sp, #68]	
	ldr	sl, =blanks.1	
	adds	r0, #1
	b	lab440
lab318: 	ldr	r3, [sp, #4]
	ldr	r3, [r3, #100]	
	lsls	r3, r3, #31
	bmi	lab336
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #12]
	lsls	r7, r3, #22
	bmi	lab336
	ldr	r3, [sp, #4]
	ldr	r0, [r3, #88]	
	bl	__retarget_lock_release_recursive
lab336: 	mov	r3, #4294967295	
	str	r3, [sp, #12]
	b	lab441
lab379: 	ldr	sl, =zeroes.0	
	mov	ip, r0
	b	lab442
lab371: 	ldr	r2, [sp, #16]
	ldrb	r3, [r7, #1]
	mov	r7, r1
	ldr	r1, [r2], #4
	str	r2, [sp, #16]
	orr	fp, r1, r1, asr #31
	b	lab311
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
	mov.w r1, #5046
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5046
	mov.w r2, #1610612736 
	blt	lab443
	mov	r1, sp
	mov	r0, r6
push {r1, r2}
	mov.w r1, #1234
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1234
	mov.w r2, #1610612736 
	it	ne
	movne	r5, #4294967295	
lab443: 	ldrh	r3, [sp, #12]
	lsls	r3, r3, #25
	bpl	lab444
	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
lab444: 	ldr	r0, [sp, #88]	
	bl	__retarget_lock_close_recursive
	mov	r0, r5
	addw	sp, sp, #1132	
	cpsid f
	push {r1, r2}
	mov.w r1, #3608
	mov.w r2, #1610612736 
__swsetup_r:
	push	{r3, r4, r5, lr}
	ldr	r3, =_impure_ptr	
	ldr	r3, [r3, #0]
	mov	r5, r0
	mov	r4, r1
	cbz	r3, lab445
	ldr	r2, [r3, #56]	
	cbz	r2, lab446
lab445: 	ldrsh	r3, [r4, #12]
	lsls	r0, r3, #28
	uxth	r2, r3
	bpl	lab447
lab453: 	cmp	r1, #0
	beq	lab448
lab456: 	beq	lab449
	movs	r0, #0
	str	r0, [r4, #8]
	ldr	r0, [r4, #20]
	negs	r0, r0
	str	r0, [r4, #24]
	cbz	r1, lab450
lab451: lab452:	cpsid f
	push {r1, r2}
	mov.w r1, #5785
	mov.w r2, #1610612736 
lab449: 	lsls	r5, r2, #30
	it	pl
	ldrpl	r0, [r4, #20]
	str	r0, [r4, #8]
	cmp	r1, #0
	bne	lab451
lab450: 	lsls	r2, r2, #24
	it	pl
	movpl	r0, r1
	bpl	lab452
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
	mov	r0, #4294967295	
	cpsid f
	push {r1, r2}
	mov.w r1, #347
	mov.w r2, #1610612736 
lab446: 	mov	r0, r3
	bl	__sinit
	ldrsh	r3, [r4, #12]
	lsls	r0, r3, #28
	uxth	r2, r3
	bmi	lab453
lab447: 	lsls	r1, r2, #27
	bpl	lab454
	lsls	r2, r2, #29
	bmi	lab455
	ldr	r1, [r4, #16]
lab459: 	strh	r3, [r4, #12]
	uxth	r2, r3
	cmp	r1, #0
	bne	lab456
lab448: 	and	r0, r2, #640	
	cmp	r0, #512	
	beq	lab456
	mov	r1, r4
	mov	r0, r5
	bl	__smakebuf_r
	push {r1, r2}
	mov.w r1, #1805
	mov.w r2, #1610612736 
	ldr	r1, [r4, #16]
	uxth	r2, r3
	b	lab456
lab455: 	ldr	r1, [r4, #48]	
	cbz	r1, lab457
	add	r2, r4, #64	
	cmp	r1, r2
	beq	lab458
	mov	r0, r5
push {r1, r2}
	mov.w r1, #8038
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8038
	mov.w r2, #1610612736 
lab458: 	movs	r2, #0
	str	r2, [r4, #48]	
lab457: 	ldr	r1, [r4, #16]
	movs	r2, #0
	strd	r1, r2, [r4]
	bic	r3, r3, #36	
	b	lab459
lab454: 	movs	r2, #9
	orr	r3, r3, #64	
	str	r2, [r5, #0]
	mov	r0, #4294967295	
	strh	r3, [r4, #12]
	cpsid f
	push {r1, r2}
	mov.w r1, #3334
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
	cbz	r6, lab460
	mov	r9, #1
	mov	sl, #0
lab466: 	subs	r5, r4, #1
	bmi	lab460
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab462: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab461
lab463: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab462
lab460: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab461: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab463
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab464
	blx	r2
lab469: 	cmp	r2, fp
	bne	lab465
lab468: 	cmp	r3, r6
	beq	lab463
	mov	r6, r3
	cmp	r6, #0
	bne	lab466
	b	lab460
lab464: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab467
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab468
lab465: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab466
	b	lab460
lab467: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab469
	.ltorg
abort:
	push	{r3, lr}
	movs	r0, #6
	bl	raise
	push {r1, r2}
	mov.w r1, #6586
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
	bmi	lab470
	ldr	r3, [r4, #4]
	orr	r2, r2, #2048	
	cmp	r3, #0
	strh	r2, [r4, #12]
	ble	lab471
lab483: 	cmp	r5, #0
	beq	lab472
	movs	r3, #0
	ldr	r6, [r7, #0]
	str	r3, [r7, #0]
	uxth	r3, r2
	ands	r2, r2, #4096	
	bne	lab473
	ldr	r1, [r4, #28]
	movs	r3, #1
	mov	r0, r7
	blx	r5
	adds	r2, r0, #1
	beq	lab474
lab486: 	ldr	r5, [r4, #40]	
lab484: 	bpl	lab475
	ldr	r3, [r4, #4]
	subs	r0, r0, r3
	ldr	r3, [r4, #48]	
	cbz	r3, lab475
	ldr	r3, [r4, #60]	
	subs	r0, r0, r3
lab475: 	ldr	r1, [r4, #28]
	mov	r2, r0
	movs	r3, #0
	mov	r0, r7
	blx	r5
	adds	r1, r0, #1
	bne	lab476
	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq	lab476
	cmp	r3, #29
	beq	lab477
	cmp	r3, #22
	bne	lab478
lab477: 	ldrh	r3, [r4, #12]
	ldr	r2, [r4, #16]
	str	r2, [r4, #0]
	bic	r3, r3, #2048	
	movs	r1, #0
	str	r1, [r4, #4]
	strh	r3, [r4, #12]
lab485: 	str	r6, [r7, #0]
	cbz	r1, lab472
	add	r3, r4, #64	
	cmp	r1, r3
	beq	lab479
	mov	r0, r7
push {r1, r2}
	mov.w r1, #7929
	mov.w r2, #1610612736 
lab479:	push {r1, r2}
	mov.w r1, #7929
	mov.w r2, #1610612736 
	str	r0, [r4, #48]	
	cpsid f
	push {r1, r2}
	mov.w r1, #7379
	mov.w r2, #1610612736 
lab470: 	ldr	r6, [r4, #16]
	cbz	r6, lab472
	uxth	r3, r2
	ldr	r5, [r4, #0]
	str	r6, [r4, #0]
	lsls	r2, r3, #30
	ite	eq
	ldreq	r3, [r4, #20]
	movne	r3, #0
	subs	r5, r5, r6
	str	r3, [r4, #8]
	b	lab480
lab482: 	ldr	r1, [r4, #28]
	mov	r3, r5
	mov	r2, r6
	mov	r0, r7
	blx	ip
	subs	ip, r0, #0
	sub	r5, r5, ip
	add	r6, ip
	ble	lab481
lab480: 	cmp	r5, #0
	bgt	lab482
lab472: 	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #6546
	mov.w r2, #1610612736 
lab471: 	ldr	r3, [r4, #60]	
	cmp	r3, #0
	bgt	lab483
	b	lab472
lab473: 	ldr	r0, [r4, #80]	
	b	lab484
lab476: 	ldrsh	r3, [r4, #12]
	ldr	r2, [r4, #16]
	str	r2, [r4, #0]
	bic	r3, r3, #2048	
	strh	r3, [r4, #12]
	movs	r2, #0
	lsls	r3, r3, #19
	str	r2, [r4, #4]
	bpl	lab485
	str	r0, [r4, #80]	
	b	lab485
lab481: 	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	
	mov	r0, #4294967295	
	strh	r3, [r4, #12]
	cpsid f
	push {r1, r2}
	mov.w r1, #2230
	mov.w r2, #1610612736 
lab474: 	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq	lab486
	cmp	r3, #29
	beq	lab487
	cmp	r3, #22
	beq	lab487
lab478: 	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
	cpsid f
	push {r1, r2}
	mov.w r1, #2286
	mov.w r2, #1610612736 
lab487: 	str	r6, [r7, #0]
	b	lab472
	nop
_fflush_r:
	push	{r3, r4, r5, lr}
	mov	r4, r1
	mov	r5, r0
	cbz	r0, lab488
	ldr	r3, [r0, #56]	
	cbz	r3, lab489
lab488: 	ldrsh	r0, [r4, #12]
	cbz	r0, lab490
lab495: 	lsls	r3, r3, #31
	bmi	lab491
	lsls	r1, r0, #22
	bpl	lab492
lab491: 	mov	r0, r5
	mov	r1, r4
push {r1, r2}
	mov.w r1, #257
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #257
	mov.w r2, #1610612736 
	lsls	r2, r3, #31
	mov	r5, r0
	bmi	lab493
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #22
	bpl	lab494
lab493: 	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #7548
	mov.w r2, #1610612736 
lab489: 	bl	__sinit
	ldrsh	r0, [r4, #12]
	cmp	r0, #0
	bne	lab495
lab490: 	mov	r5, r0
	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #1904
	mov.w r2, #1610612736 
lab492: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_acquire_recursive
	b	lab491
lab494: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #4941
	mov.w r2, #1610612736 
	nop
_cleanup_r:
	ldr	r1, =0x0000d795	
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
	bne	lab496
	ldr	r5, [sl, #4]
	ldr	r2, =0x0000c0a5	
	str	r2, [sl, #60]	
	movs	r3, #3
	strd	r4, r3, [sl, #736]	
	ldr	r9, =0x0000d4c1	
	ldr	r8, =0x0000d4e5	
	ldr	r7, =0x0000d525	
	ldr	r6, =0x0000d545	
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
	mov.w r1, #5872
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5872
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
	mov.w r1, #2687
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2687
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
	mov.w r1, #3742
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3742
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
lab496: 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
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
	ldr	r3, =in_encode.0	
	ldr	r5, =0x0001e4b4	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab497
	subs	r3, #4
	add	r5, r3
lab498: 	ldr	r3, [r5], #-4
	
	push {r1, r2}
	mov.w r1, #7213
	mov.w r2, #1610612736 
	cmp	r4, #0
	push {r1, r2}
	mov.w r1, #7213
	mov.w r2, #1610612736 
lab497: 	ldmia	sp!, {r3, r4, r5, lr}
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
	bne	lab499
	add	r3, r8, #4294967295	
	cmp	r3, #254	
	bls	lab500
lab499: 	mov	r2, r8
	add	r3, r4, #92	
	add	r1, sp, #4
	mov	r0, r7
	bl	_wcrtomb_r
	push {r1, r2}
	mov.w r1, #1106
	mov.w r2, #1610612736 
	mov	r6, r0
	beq	lab501
	cbz	r0, lab502
	ldrb	ip, [sp, #4]
lab507: 	movs	r5, #0
	b	lab503
lab504: 	adds	r2, r3, #1
	str	r2, [r4, #0]
	strb	ip, [r3]
lab506: 	cmp	r5, r6
	bcs	lab502
	ldrb	ip, [r9], #1
lab503: 	ldr	r3, [r4, #8]
	subs	r3, #1
	cmp	r3, #0
	str	r3, [r4, #8]
	bge	lab504
	ldr	lr, [r4, #24]
	cmp	r3, lr
	mov	r1, ip
	mov	r2, r4
	mov	r0, r7
	blt	lab505
	cmp	ip, #10
	bne	lab504
lab505: 	bl	__swbuf_r
	push {r1, r2}
	mov.w r1, #3707
	mov.w r2, #1610612736 
	bne	lab506
	mov	r6, r0
	mov	r0, r6
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #3625
	mov.w r2, #1610612736 
lab502: 	mov	r6, r8
	mov	r0, r6
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #1
	mov.w r2, #1610612736 
lab500: 	uxtb	ip, r8
	strb	ip, [sp, #4]
	mov	r6, r0
	b	lab507
lab501: 	ldrh	r3, [r4, #12]
	mov	r0, r6
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #1996
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
	bne	lab508
	lsls	r0, r3, #22
	bpl	lab509
lab508: 	lsls	r0, r2, #18
	bmi	lab510
	ldr	r2, [r4, #100]	
	orr	r3, r3, #8192	
	orr	r2, r2, #8192	
	strh	r3, [r4, #12]
	str	r2, [r4, #100]	
lab510: 	mov	r2, r4
	mov	r0, r5
	bl	__fputwc
	push {r1, r2}
	mov.w r1, #7242
	mov.w r2, #1610612736 
	lsls	r2, r3, #31
	mov	r5, r0
	bmi	lab511
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #22
	bpl	lab512
lab511: 	mov	r0, r5
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #292
	mov.w r2, #1610612736 
lab512: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #226
	mov.w r2, #1610612736 
lab509: 	ldr	r0, [r4, #88]	
	str	r1, [sp, #4]
	bl	__retarget_lock_acquire_recursive
	ldrsh	r3, [r4, #12]
	ldr	r1, [sp, #4]
	uxth	r2, r3
	b	lab508
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
	blt	lab513
	movs	r1, #0
	mov	r0, r6
push {r1, r2}
	mov.w r1, #5821
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5821
	mov.w r2, #1610612736 
	add	r3, r5
	cmp	r0, r3
	beq	lab514
lab513: 	mov	r0, r6
	bl	__malloc_unlock
	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #7566
	mov.w r2, #1610612736 
lab514: 	negs	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #1624
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1624
	mov.w r2, #1610612736 
	beq	lab515
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
	mov.w r1, #7771
	mov.w r2, #1610612736 
lab515: 	movs	r1, #0
	mov	r0, r6
push {r1, r2}
	mov.w r1, #3656
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3656
	mov.w r2, #1610612736 
	subs	r3, r0, r2
	cmp	r3, #15
	ble	lab513
	orr	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, =__malloc_sbrk_base	
	ldr	r1, =__malloc_current_mallinfo	
	ldr	r3, [r3, #0]
	subs	r0, r0, r3
	str	r0, [r1, #0]
	b	lab513
	nop
	.ltorg
_free_r:
	cmp	r1, #0
	beq	lab516
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
	beq	lab517
	lsls	r2, r2, #31
	str	r3, [ip, #4]
	bmi	lab518
	ldr	r2, [r4, #-8]
	subs	r5, r5, r2
	add	r1, r2
	ldr	r2, [r5, #8]
	add	r0, r7, #8
	cmp	r2, r0
	beq	lab519
	add	r4, ip, r3
	ldr	lr, [r4, #4]
	ldr	r4, [r5, #12]
	str	r4, [r2, #12]
	tst	lr, #1
	str	r2, [r4, #8]
	beq	lab520
	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [ip]
lab524: 	bcs	lab521
lab525: 	lsrs	r3, r1, #3
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
lab532: 	ldmia	sp!, {r3, r4, r5, r6, r7, lr}
	b	__malloc_unlock
lab518: 	add	r2, ip, r3
	ldr	r2, [r2, #4]
	lsls	r0, r2, #31
	bmi	lab522
	add	r1, r3
	add	r0, r7, #8
lab536: 	cmp	r3, r0
	beq	lab523
	ldr	r2, [ip, #12]
	str	r2, [r3, #12]
	str	r3, [r2, #8]
	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [r5, r1]
	b	lab524
lab516:	cpsid f
	push {r1, r2}
	mov.w r1, #7676
	mov.w r2, #1610612736 
lab522: 	orr	r3, r1, #1
	cmp	r1, #512	
	str	r3, [r4, #-4]
	str	r1, [ip]
	bcc	lab525
lab521: 	cmp	r1, #2560	
	mov	r3, r1, lsr #9
	bcs	lab526
	lsrs	r3, r1, #6
	add	r0, r3, #57	
	add	r2, r3, #56	
	lsls	r3, r0, #3
lab535: 	ldr	r3, [r7, r3]
	subs	r0, #8
	cmp	r0, r3
	beq	lab527
lab529: 	bic	r2, r2, #3
	cmp	r2, r1
	bls	lab528
	ldr	r3, [r3, #8]
	cmp	r0, r3
	bne	lab529
lab528: 	ldr	r0, [r3, #12]
lab537: 	str	r5, [r0, #8]
	str	r5, [r3, #12]
	mov	r0, r6
	ldmia	sp!, {r3, r4, r5, r6, r7, lr}
	b	__malloc_unlock
lab519: 	add	r2, ip, r3
	ldr	r2, [r2, #4]
	lsls	r2, r2, #31
	bmi	lab530
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
lab517: 	add	r3, r1
	lsls	r1, r2, #31
	bmi	lab531
	ldr	r2, [r4, #-8]
	subs	r5, r5, r2
	add	r3, r2
	ldrd	r1, r2, [r5, #8]
	str	r2, [r1, #12]
	str	r1, [r2, #8]
lab531: 	orr	r2, r3, #1
	str	r2, [r5, #4]
	ldr	r2, =__malloc_trim_threshold	
	str	r5, [r7, #8]
	ldr	r2, [r2, #0]
	cmp	r2, r3
	bhi	lab532
	ldr	r3, =__malloc_top_pad	
	mov	r0, r6
	ldr	r1, [r3, #0]
	bl	_malloc_trim_r
	push {r1, r2}
	mov.w r1, #5597
	mov.w r2, #1610612736 
lab526: 	cmp	r3, #20
	bls	lab533
	cmp	r3, #84	
	bhi	lab534
	lsrs	r3, r1, #12
	add	r0, r3, #111	
	add	r2, r3, #110	
	lsls	r3, r0, #3
	b	lab535
lab520: 	add	r1, r3
	b	lab536
lab533: 	add	r0, r3, #92	
	add	r2, r3, #91	
	lsls	r3, r0, #3
	b	lab535
lab523: 	orr	r3, r1, #1
	strd	r5, r5, [r7, #16]
	strd	r0, r0, [r5, #8]
	str	r3, [r5, #4]
	str	r1, [r5, r1]
	b	lab532
lab527: 	ldr	r1, [r7, #4]
	asrs	r2, r2, #2
	movs	r4, #1
	lsl	r2, r4, r2
	orrs	r2, r1
	str	r2, [r7, #4]
	b	lab537
lab534: 	cmp	r3, #340	
	bhi	lab538
	lsrs	r3, r1, #15
	add	r0, r3, #120	
	add	r2, r3, #119	
	lsls	r3, r0, #3
	b	lab535
lab538: 	movw	r2, #1364	
	cmp	r3, r2
	bhi	lab539
	lsrs	r3, r1, #18
	add	r0, r3, #125	
	add	r2, r3, #124	
	lsls	r3, r0, #3
	b	lab535
lab539: 	mov	r3, #1016	
	movs	r2, #126	
	b	lab535
lab530: 	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [ip]
	b	lab532
	nop
	.ltorg
__sfvwrite_r:
	ldr	r3, [r2, #8]
	cmp	r3, #0
	beq	lab540
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldrsh	r3, [r1, #12]
	mov	r4, r1
	lsls	r1, r3, #28
	mov	r8, r0
	sub	sp, #12
	mov	r7, r2
	uxth	r0, r3
	bpl	lab541
	ldr	r3, [r4, #16]
	cbz	r3, lab541
	ands	r3, r0, #2
	ldr	r5, [r7, #0]
	beq	lab542
lab547: 	ldr	fp, =0x7ffffc00	
	mov	r6, sl
lab545: 	mov	r3, r6
	mov	r2, sl
	it	cs
	movcs	r3, fp
	mov	r0, r8
	cmp	r6, #0
	beq	lab543
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #36]	
	blx	ip
	cmp	r0, #0
	ble	lab544
	ldr	r3, [r7, #8]
	subs	r3, r3, r0
	add	sl, r0
	subs	r6, r6, r0
	str	r3, [r7, #8]
	cmp	r3, #0
	bne	lab545
lab553: lab577: 	cpsid f
	push {r1, r2}
	mov.w r1, #7959
	mov.w r2, #1610612736 
lab541: 	mov	r1, r4
	mov	r0, r8
push {r1, r2}
	mov.w r1, #2154
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2154
	mov.w r2, #1610612736 
	bne	lab546
	ldrsh	r3, [r4, #12]
	ldr	r5, [r7, #0]
	uxth	r0, r3
	ands	r3, r0, #2
	bne	lab547
lab542: 	ands	r9, r0, #1
	bne	lab548
	mov	r6, r9
lab555: lab554: 	ldr	fp, [r4, #8]
	bpl	lab550
	cmp	fp, r6
	mov	r2, fp
	bhi	lab551
	tst	r0, #1152	
	bne	lab552
	ldr	r0, [r4, #0]
lab570: 	mov	r1, r9
push {r1, r2}
	mov.w r1, #7187
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7187
	mov.w r2, #1610612736 
	ldr	r1, [r4, #0]
	ldr	r2, [sp, #4]
	sub	r3, r3, fp
	add	r2, r1
	mov	sl, r6
	str	r3, [r4, #8]
	str	r2, [r4, #0]
	movs	r6, #0
lab568: 	sub	r0, r0, sl
	add	r9, sl
	str	r0, [r7, #8]
	cmp	r0, #0
	beq	lab553
	ldrsh	r0, [r4, #12]
	uxth	r0, r0
	cmp	r6, #0
	bne	lab554
lab549: 	ldrd	r9, r6, [r5]
	adds	r5, #8
	b	lab555
lab543: 	ldrd	sl, r6, [r5]
	adds	r5, #8
	b	lab545
lab562: 	mov	r0, r8
push {r1, r2}
	mov.w r1, #1331
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1331
	mov.w r2, #1610612736 
lab544: 	ldrsh	r3, [r4, #12]
lab575: 	mov	r0, #4294967295	
	strh	r3, [r4, #12]
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #6600
	mov.w r2, #1610612736 
lab540: 	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #5773
	mov.w r2, #1610612736 
lab548: 	mov	r6, r3
	mov	sl, r5
	mov	r9, r3
	mov	r0, r3
	mov	r5, r3
	cbz	r6, lab557
lab563: lab566: lab576: 	ldr	r0, [r4, #0]
	cmp	r2, r6
	it	cs
	movcs	r2, r6
	cmp	r0, r1
	bls	lab559
	ldr	r1, [r4, #8]
	add	fp, r3, r1
	cmp	r2, fp
	bgt	lab560
lab559: 	cmp	r3, r2
	bgt	lab561
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #36]	
	mov	r2, r5
	mov	r0, r8
	blx	ip
	subs	fp, r0, #0
	ble	lab544
lab571: 	beq	lab562
	movs	r0, #1
lab556: 	ldr	r3, [r7, #8]
	sub	r3, r3, fp
	add	r5, fp
	sub	r6, r6, fp
	str	r3, [r7, #8]
	cmp	r3, #0
	beq	lab553
	cmp	r6, #0
	bne	lab563
lab557: 	add	r3, sl, #8
lab564: 	mov	sl, r3
	adds	r3, #8
	cmp	r6, #0
	beq	lab564
lab558: 	mov	r2, r6
	movs	r1, #10
	mov	r0, r5
	bl	memchr
	cmp	r0, #0
	beq	lab565
	adds	r0, #1
	sub	r9, r0, r5
	b	lab566
lab550: 	ldr	r0, [r4, #0]
	ldr	r3, [r4, #16]
	cmp	r0, r3
	bhi	lab567
	ldr	r3, [r4, #20]
	cmp	r3, r6
	bhi	lab567
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
	ble	lab544
lab569: 	b	lab568
lab567: 	cmp	fp, r6
	mov	sl, fp
	it	cs
	movcs	sl, r6
	mov	r2, sl
	mov	r1, r9
push {r1, r2}
	mov.w r1, #7056
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7056
	mov.w r2, #1610612736 
	ldr	r2, [r4, #0]
	sub	r3, r3, sl
	add	r2, sl
	str	r3, [r4, #8]
	str	r2, [r4, #0]
	cmp	r3, #0
	bne	lab569
	mov	r1, r4
	mov	r0, r8
push {r1, r2}
	mov.w r1, #4046
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4046
	mov.w r2, #1610612736 
	beq	lab569
	b	lab544
lab551: 	ldr	r0, [r4, #0]
	mov	fp, r6
	mov	r2, r6
	b	lab570
lab561: 	mov	r1, r5
	str	r2, [sp, #4]
push {r1, r2}
	mov.w r1, #4540
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4540
	mov.w r2, #1610612736 
	ldr	r3, [r4, #8]
	subs	r3, r3, r2
	str	r3, [r4, #8]
	ldr	r3, [r4, #0]
	add	r3, r2
	str	r3, [r4, #0]
	mov	fp, r2
	b	lab571
lab552: 	ldr	r3, [r4, #0]
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
	bpl	lab572
	mov	r1, r2
	mov	r0, r8
push {r1, r2}
	mov.w r1, #6148
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6148
	mov.w r2, #1610612736 
	beq	lab573
	mov	r2, fp
	ldr	r1, [r4, #16]
	str	r0, [sp, #4]
	bl	memcpy
	ldrh	r2, [r4, #12]
	ldr	r3, [sp, #4]
	bic	r2, r2, #1152	
	orr	r2, r2, #128	
	strh	r2, [r4, #12]
lab574: 	str	r3, [r4, #16]
	sub	r3, sl, fp
	str	sl, [r4, #20]
	str	r3, [r4, #8]
	str	r0, [r4, #0]
	mov	fp, r6
	mov	r2, r6
	b	lab570
lab560: 	mov	r1, r5
	mov	r2, fp
push {r1, r2}
	mov.w r1, #518
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #518
	mov.w r2, #1610612736 
	add	r3, fp
	str	r3, [r4, #0]
	mov	r1, r4
	mov	r0, r8
push {r1, r2}
	mov.w r1, #1848
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1848
	mov.w r2, #1610612736 
	beq	lab571
	b	lab544
lab572: 	mov	r0, r8
push {r1, r2}
	mov.w r1, #5419
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5419
	mov.w r2, #1610612736 
	cmp	r0, #0
	bne	lab574
	ldr	r1, [r4, #16]
	mov	r0, r8
push {r1, r2}
	mov.w r1, #4393
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4393
	mov.w r2, #1610612736 
	movs	r2, #12
	bic	r3, r3, #128	
	str	r2, [r8]
	b	lab575
lab565: 	adds	r2, r6, #1
	mov	r9, r2
	b	lab576
lab573: 	movs	r2, #12
	ldrsh	r3, [r4, #12]
	str	r2, [r8]
	b	lab575
lab546: 	mov	r0, #4294967295	
	b	lab577
	nop
	.ltorg
_fwalk_reent:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r0
	mov	r8, r1
	add	r6, r0, #736	
	mov	r9, #0
lab581: 	subs	r5, #1
	bmi	lab578
lab580: 	cmp	r3, #1
	add	r5, r5, #4294967295	
	bls	lab579
	ldrsh	r3, [r4, #14]
	adds	r3, #1
	mov	r1, r4
	beq	lab579
	mov	r0, r7
	blx	r8
	orr	r9, r9, r0
lab579: 	adds	r3, r5, #1
	add	r4, r4, #104	
	bne	lab580
lab578: 	ldr	r6, [r6, #0]
	cmp	r6, #0
	bne	lab581
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
	bpl	lab582
	add	r3, r4, #67	
	movs	r2, #1
	strd	r3, r2, [r4, #16]
	str	r3, [r4, #0]
lab589: 	cpsid f
	push {r1, r2}
	mov.w r1, #4249
	mov.w r2, #1610612736 
lab582: 	ldrsh	r1, [r4, #14]
	cmp	r1, #0
	mov	r6, r0
	blt	lab583
	mov	r2, sp
	bl	_fstat_r
	push {r1, r2}
	mov.w r1, #5665
	mov.w r2, #1610612736 
	blt	lab584
	ldr	r5, [sp, #4]
	and	r5, r5, #61440	
	sub	r5, r5, #8192	
	clz	r5, r5
	mov	r8, #1024	
	lsrs	r5, r5, #5
	mov	r7, #2048	
lab590: 	mov	r0, r6
push {r1, r2}
	mov.w r1, #2861
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2861
	mov.w r2, #1610612736 
	cbz	r0, lab585
lab588: 	str	r2, [r6, #60]	
	orr	r3, r3, #128	
	str	r8, [r4, #20]
	strh	r3, [r4, #12]
	str	r0, [r4, #0]
	str	r0, [r4, #16]
	cbnz	r5, lab586
lab592: 	strh	r3, [r4, #12]
	add	sp, #88	
	cpsid f
	push {r1, r2}
	mov.w r1, #3115
	mov.w r2, #1610612736 
lab584: 	ldrh	r3, [r4, #12]
lab583: 	ands	r5, r3, #128	
	beq	lab587
	mov	r8, #64	
	mov	r1, r8
	mov	r0, r6
push {r1, r2}
	mov.w r1, #1370
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1370
	mov.w r2, #1610612736 
	ldrsh	r3, [r4, #12]
	mov	r7, r5
	cmp	r0, #0
	bne	lab588
lab585: 	lsls	r2, r3, #22
	bmi	lab589
	bic	r3, r3, #3
	add	r2, r4, #67	
	orr	r3, r3, #2
	movs	r1, #1
	strd	r2, r1, [r4, #16]
	strh	r3, [r4, #12]
	str	r2, [r4, #0]
	b	lab589
lab587: 	mov	r8, #1024	
	mov	r7, r5
	b	lab590
lab586: 	ldrsh	r1, [r4, #14]
	mov	r0, r6
	bl	_isatty_r
	push {r1, r2}
	mov.w r1, #7766
	mov.w r2, #1610612736 
	ldrsh	r3, [r4, #12]
	b	lab592
lab591: 	ldrh	r3, [r4, #12]
	bic	r3, r3, #3
	orr	r3, r3, #1
	sxth	r3, r3
	b	lab592
	.ltorg
_malloc_r:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	r6, r1, #11
	cmp	r6, #22
	sub	sp, #12
	mov	r4, r0
	bhi	lab593
	cmp	r1, #16
	bhi	lab594
	bl	__malloc_lock
	movs	r6, #16
	movs	r2, #24
	movs	r0, #2
lab642: 	add	r2, r7
	sub	r1, r2, #8
	ldr	r3, [r2, #4]
	cmp	r3, r1
	beq	lab595
lab616: 	ldr	r1, [r3, #12]
	bic	r2, r2, #3
	add	r2, r3
lab631: 	str	r1, [r5, #12]
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
	mov.w r1, #799
	mov.w r2, #1610612736 
lab593: 	bics	r6, r6, #7
	bmi	lab594
	cmp	r1, r6
	bhi	lab594
	bl	__malloc_lock
	cmp	r6, #504	
	bcc	lab596
	lsrs	r3, r6, #9
	beq	lab597
	cmp	r3, #4
	bhi	lab598
	lsrs	r3, r6, #6
	add	r0, r3, #57	
	add	ip, r3, #56	
	lsls	r3, r0, #3
lab615: 	add	r3, r7
	sub	r5, r3, #8
	ldr	r3, [r3, #4]
	cmp	r5, r3
	bne	lab599
	b	lab600
lab602: 	bge	lab601
	ldr	r3, [r3, #12]
	cmp	r5, r3
	beq	lab600
lab599: 	ldr	r2, [r3, #4]
	bic	r2, r2, #3
	subs	r1, r2, r6
	cmp	r1, #15
	ble	lab602
	mov	r0, ip
lab600: 	ldr	r5, [r7, #16]
	ldr	ip, [pc, #576]	
	cmp	r5, ip
	beq	lab603
lab617: 	bic	r2, r2, #3
	subs	r3, r2, r6
	cmp	r3, #15
	bgt	lab604
	cmp	r3, #0
	strd	ip, ip, [r7, #16]
	bge	lab605
	cmp	r2, #512	
	bcs	lab606
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
lab637: 	movs	r1, #1
	lsls	r1, r3
	cmp	r1, r2
	bhi	lab607
lab618: 	bne	lab608
	bic	r0, r0, #3
lab609: 	tst	r1, r2
	add	r0, r0, #4
	beq	lab609
lab608: 	add	r9, r7, r0, lsl #3
	mov	r5, r9
	mov	lr, r0
lab640: 	cmp	r5, r8
	bne	lab610
	b	lab611
lab613: 	bge	lab612
	ldr	r8, [r8, #12]
	cmp	r5, r8
	beq	lab611
lab610: 	ldr	r2, [r8, #4]
	bic	r2, r2, #3
	subs	r3, r2, r6
	cmp	r3, #15
	ble	lab613
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
	b	lab614
lab594: 	movs	r3, #12
	str	r3, [r4, #0]
	movs	r5, #0
lab614: 	mov	r0, r5
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #6137
	mov.w r2, #1610612736 
lab597: 	mov	r3, #512	
	movs	r0, #64	
	mov	ip, #63	
	b	lab615
lab595: 	ldr	r3, [r2, #12]
	cmp	r2, r3
	it	eq
	addeq	r0, #2
	bne	lab616
	ldr	r5, [r7, #16]
	ldr	ip, [pc, #328]	
	cmp	r5, ip
	bne	lab617
lab603: 	ldr	r2, [r7, #4]
	asrs	r3, r0, #2
	movs	r1, #1
	lsls	r1, r3
	cmp	r1, r2
	bls	lab618
lab607: 	ldr	r5, [r7, #8]
	ldr	r3, [r5, #4]
	bic	r9, r3, #3
	cmp	r6, r9
	bhi	lab619
	sub	r3, r9, r6
	cmp	r3, #15
	bgt	lab620
lab619: 	ldr	fp, =__malloc_sbrk_base	
	ldr	r3, =__malloc_top_pad	
	ldr	r2, [fp]
	ldr	r3, [r3, #0]
	adds	r2, #1
	add	r3, r6
	add	sl, r5, r9
	beq	lab621
	add	r3, r3, #4096	
	adds	r3, #15
	bic	r8, r3, #4080	
	bic	r8, r8, #15
lab650: 	mov	r0, r4
push {r1, r2}
	mov.w r1, #8095
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8095
	mov.w r2, #1610612736 
	mov	r2, r0
	beq	lab622
	cmp	sl, r0
	bhi	lab623
	ldr	r3, =__malloc_current_mallinfo	
	ldr	r1, [r3, #0]
	add	r1, r8
	str	r1, [r3, #0]
	mov	r0, r1
	beq	lab624
lab656: 	str	r3, [sp, #4]
	adds	r1, #1
	ittet	ne
	subne	sl, r2, sl
	addne	r0, sl
	streq	r2, [fp]
	strne	r0, [r3, #0]
	ands	fp, r2, #7
	beq	lab625
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
	mov.w r1, #1617
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1617
	mov.w r2, #1610612736 
	ldrd	r2, r3, [sp]
	beq	lab626
lab652: 	add	r8, r0, sl
lab653: 	str	r2, [r7, #8]
	orr	r0, r8, #1
	add	r1, sl
	cmp	r5, r7
	str	r0, [r2, #4]
	str	r1, [r3, #0]
	beq	lab627
	cmp	r9, #15
	bls	lab628
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
	bhi	lab629
	ldr	r0, [r2, #4]
	mov	r5, r2
lab657: 	ldr	r2, [r3, #0]
	cmp	r2, r1
	it	cc
	strcc	r1, [r3, #0]
	ldr	r3, =__malloc_max_total_mem	
	ldr	r2, [r3, #0]
	cmp	r2, r1
	it	cc
	strcc	r1, [r3, #0]
	b	lab630
lab620: 	adds	r2, r5, r6
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
	mov.w r1, #6884
	mov.w r2, #1610612736 
lab601: 	ldr	r1, [r3, #12]
	add	r2, r3
	b	lab631
	nop
	.ltorg
lab606: 	cmp	r2, #2560	
	mov	r3, r2, lsr #9
	bcc	lab632
	cmp	r3, #20
	bhi	lab633
	add	r1, r3, #92	
	lsls	r1, r1, #3
	adds	r3, #91	
lab643: 	ldr	r1, [r7, r1]
	sub	lr, lr, #8
	cmp	lr, r1
	beq	lab634
lab636: 	bic	r3, r3, #3
	cmp	r3, r2
	bls	lab635
	ldr	r1, [r1, #8]
	cmp	lr, r1
	bne	lab636
lab635: 	ldr	lr, [r1, #12]
	ldr	r2, [r7, #4]
lab651: 	str	r5, [lr, #8]
	str	r5, [r1, #12]
	b	lab637
lab598: 	cmp	r3, #20
	bls	lab638
	cmp	r3, #84	
	bhi	lab639
	lsrs	r3, r6, #12
	add	r0, r3, #111	
	add	ip, r3, #110	
	lsls	r3, r0, #3
	b	lab615
lab611: 	add	lr, lr, #1
	tst	lr, #3
	add	r5, r5, #8
	bne	lab640
	b	lab641
lab612: 	add	r2, r8
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
	b	lab614
lab596: 	lsrs	r0, r6, #3
	add	r2, r6, #8
	b	lab642
lab605: 	add	r2, r5
	mov	r0, r4
	ldr	r3, [r2, #4]
	orr	r3, r3, #1
	str	r3, [r2, #4]
	adds	r5, #8
	bl	__malloc_unlock
	b	lab614
lab604: 	adds	r1, r5, r6
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
	b	lab614
lab632: 	lsrs	r3, r2, #6
	add	r1, r3, #57	
	lsls	r1, r1, #3
	adds	r3, #56	
	b	lab643
lab623: 	cmp	r5, r7
	beq	lab644
lab622: 	ldr	r5, [r7, #8]
	ldr	r0, [r5, #4]
lab630: 	bic	r8, r0, #3
	cmp	r6, r8
	sub	r3, r8, r6
	bhi	lab645
	cmp	r3, #15
	bgt	lab620
lab645: 	mov	r0, r4
	bl	__malloc_unlock
	movs	r5, #0
	b	lab614
lab638: 	add	r0, r3, #92	
	add	ip, r3, #91	
	lsls	r3, r0, #3
	b	lab615
lab647: 	cmp	r3, r9
	bne	lab646
lab641: 	tst	r0, #3
	add	r0, r0, #4294967295	
	bne	lab647
	ldr	r3, [r7, #4]
	bic	r3, r3, r1
	str	r3, [r7, #4]
lab661: 	cmp	r1, r3
	bhi	lab607
	cbnz	r1, lab648
	b	lab607
lab649: 	add	lr, lr, #4
lab648: 	tst	r1, r3
	beq	lab649
	mov	r0, lr
	b	lab608
lab621: 	add	r8, r3, #16
	b	lab650
lab634: 	asrs	r2, r3, #2
	mov	r8, #1
	ldr	r3, [r7, #4]
	lsl	r2, r8, r2
	orrs	r2, r3
	str	r2, [r7, #4]
	b	lab651
lab625: 	add	r1, r2, r8
	negs	r1, r1
	ubfx	sl, r1, #0, #12
	mov	r1, sl
	mov	r0, r4
	str	r2, [sp, #0]
push {r1, r2}
	mov.w r1, #1330
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1330
	mov.w r2, #1610612736 
	ldrd	r2, r3, [sp]
	bne	lab652
	mov	sl, fp
	b	lab653
lab633: 	cmp	r3, #84	
	bhi	lab654
	lsrs	r3, r2, #12
	add	r1, r3, #111	
	lsls	r1, r1, #3
	adds	r3, #110	
	b	lab643
lab639: 	cmp	r3, #340	
	bhi	lab655
	lsrs	r3, r6, #15
	add	r0, r3, #120	
	add	ip, r3, #119	
	lsls	r3, r0, #3
	b	lab615
lab644: 	ldr	r3, =__malloc_current_mallinfo	
	ldr	r0, [r3, #0]
	add	r0, r8
	str	r0, [r3, #0]
	b	lab656
lab624: 	ubfx	ip, sl, #0, #12
	cmp	ip, #0
	bne	lab656
	ldr	r5, [r7, #8]
	add	r8, r9
	orr	r0, r8, #1
	str	r0, [r5, #4]
	b	lab657
lab627: 	mov	r5, r2
	b	lab657
lab628: 	movs	r3, #1
	str	r3, [r2, #4]
	b	lab645
lab654: 	cmp	r3, #340	
	bhi	lab658
	lsrs	r3, r2, #15
	add	r1, r3, #120	
	lsls	r1, r1, #3
	adds	r3, #119	
	b	lab643
lab655: 	movw	r2, #1364	
	cmp	r3, r2
	bhi	lab659
	lsrs	r3, r6, #18
	add	r0, r3, #125	
	add	ip, r3, #124	
	lsls	r3, r0, #3
	b	lab615
lab626: 	sub	fp, fp, #8
	add	r8, fp
	sub	r8, r8, r2
	mov	sl, #0
	b	lab653
lab629: 	add	r1, r5, #8
	mov	r0, r4
	str	r3, [sp, #0]
push {r1, r2}
	mov.w r1, #6346
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6346
	mov.w r2, #1610612736 
	ldr	r3, [sp, #0]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #0]
	b	lab657
lab658: 	movw	r1, #1364	
	cmp	r3, r1
	bhi	lab660
	lsrs	r3, r2, #18
	add	r1, r3, #125	
	lsls	r1, r1, #3
	adds	r3, #124	
	b	lab643
lab659: 	mov	r3, #1016	
	movs	r0, #127	
	mov	ip, #126	
	b	lab615
lab660: 	mov	r1, #1016	
	movs	r3, #126	
	b	lab643
lab646: 	ldr	r3, [r7, #4]
	b	lab661
	.ltorg
__ascii_mbtowc:
	sub	sp, #8
	cbz	r1, lab662
	cbz	r2, lab663
lab665: 	ldrb	r3, [r2, #0]
	str	r3, [r1, #0]
	ldrb	r2, [r2, #0]
	subs	r0, r2, #0
	it	ne
	movne	r0, #1
lab666: 	bx	lr
lab662: 	add	r1, sp, #4
	cmp	r2, #0
	bne	lab665
lab663: 	mov	r0, r2
	add	sp, #8
	bx	lr
lab664: 	mvn	r0, #1
	b	lab666
	nop
	movs	r0, r0
memchr:
	and	r1, r1, #255	
	cmp	r2, #16
	blt	lab667
	tst	r0, #7
	beq	lab668
lab671: 	subs	r2, #1
	cmp	r3, r1
	beq	lab669
	tst	r0, #7
	cbz	r2, lab670
	bne	lab671
lab668: 	push	{r4, r5, r6, r7}
	orr	r1, r1, r1, lsl #8
	orr	r1, r1, r1, lsl #16
	bic	r4, r2, #7
	mvns	r7, #0
	movs	r3, #0
lab673: 	subs	r4, #8
	eor	r5, r5, r1
	eor	r6, r6, r1
	uadd8	r5, r5, r7
	sel	r5, r3, r7
	uadd8	r6, r6, r7
	sel	r6, r5, r7
	cbnz	r6, lab672
	bne	lab673
	pop	{r4, r5, r6, r7}
	and	r1, r1, #255	
	and	r2, r2, #7
lab667: 	cbz	r2, lab670
lab674: 	subs	r2, #1
	eor	r3, r3, r1
	cbz	r3, lab669
	bne	lab674
lab670: 	movs	r0, #0
	bx	lr
lab669: 	subs	r0, #1
	bx	lr
lab672: 	cmp	r5, #0
	itte	eq
	moveq	r5, r6
	subeq	r0, #3
	subne	r0, #7
	tst	r5, #1
	bne	lab675
	adds	r0, #1
	tst	r5, #256	
	ittt	eq
	addeq	r0, #1
	tsteq	r5, #98304	
	addeq	r0, #1
lab675: 	pop	{r4, r5, r6, r7}
	subs	r0, #1
	bx	lr
	nop
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
	beq	lab676
	add	r5, r7, #11
	mov	r8, r0
	mov	r4, r1
	bl	__malloc_lock
	cmp	r5, #22
	bhi	lab677
	movs	r5, #16
	mov	r2, r5
lab690: 	bhi	lab678
	ldr	r1, [r4, #-4]
	bic	r6, r1, #3
	cmp	r6, r2
	sub	r9, r4, #8
	bge	lab679
	ldr	r3, =__malloc_av_	
	ldr	ip, [r3, #8]
	add	r0, r9, r6
	cmp	ip, r0
	beq	lab680
	ldr	ip, [r0, #4]
	bic	r3, ip, #1
	add	r3, r0
	ldr	r3, [r3, #4]
	lsls	r3, r3, #31
	bmi	lab681
	bic	ip, ip, #3
	add	r3, r6, ip
	cmp	r3, r2
	bge	lab682
	lsls	r3, r1, #31
	bmi	lab683
	ldr	r3, [r4, #-8]
	sub	sl, r9, r3
	ldr	r3, [sl, #4]
	bic	r1, r3, #3
	add	ip, r1
	add	ip, r6
	cmp	ip, r2
	bge	lab684
lab692: 	cmp	r3, r2
	bge	lab685
lab683: 	mov	r1, r7
	mov	r0, r8
push {r1, r2}
	mov.w r1, #982
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #982
	mov.w r2, #1610612736 
	cbz	r0, lab686
	ldr	r3, [r4, #-4]
	bic	r3, r3, #1
	add	r3, r9
	sub	r2, r0, #8
	cmp	r3, r2
	beq	lab687
	subs	r2, r6, #4
	cmp	r2, #36	
	bhi	lab688
	cmp	r2, #19
	bhi	lab689
	mov	r3, r0
	mov	r2, r4
lab700: 	str	r1, [r3, #0]
	ldr	r1, [r2, #4]
	str	r1, [r3, #4]
	ldr	r2, [r2, #8]
	str	r2, [r3, #8]
lab704: 	mov	r0, r8
push {r1, r2}
	mov.w r1, #6462
	mov.w r2, #1610612736 
lab686:	push {r1, r2}
	mov.w r1, #6462
	mov.w r2, #1610612736 
	bl	__malloc_unlock
	mov	r0, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #82
	mov.w r2, #1610612736 
lab677: 	bic	r5, r5, #7
	cmp	r5, #0
	mov	r2, r5
	bge	lab690
lab678: 	movs	r3, #12
	str	r3, [r8]
	movs	r7, #0
lab698: 	cpsid f
	push {r1, r2}
	mov.w r1, #375
	mov.w r2, #1610612736 
lab682: 	mov	r6, r3
	ldrd	r2, r3, [r0, #8]
	str	r3, [r2, #12]
	str	r2, [r3, #8]
lab679: 	subs	r3, r6, r5
	cmp	r3, #15
	bhi	lab691
	ldr	r3, [r9, #4]
	and	r3, r3, #1
	orrs	r3, r6
	add	r6, r9
	str	r3, [r9, #4]
	ldr	r3, [r6, #4]
	orr	r3, r3, #1
	str	r3, [r6, #4]
lab693: 	mov	r7, r4
	bl	__malloc_unlock
	mov	r0, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4932
	mov.w r2, #1610612736 
lab681: 	lsls	r1, r1, #31
	bmi	lab683
	ldr	r3, [r4, #-8]
	sub	sl, r9, r3
	ldr	r1, [sl, #4]
	bic	r1, r1, #3
	b	lab692
lab676: 	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r1, r2
	b	_malloc_r
lab691: 	ldr	r1, [r9, #4]
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
	mov.w r1, #3688
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3688
	mov.w r2, #1610612736 
lab680: 	ldr	r0, [ip, #4]
	bic	fp, r0, #3
	add	ip, r6, fp
	add	r0, r5, #16
	cmp	ip, r0
	bge	lab694
	lsls	r1, r1, #31
	bmi	lab683
	ldr	r1, [r4, #-8]
	sub	sl, r9, r1
	ldr	r1, [sl, #4]
	bic	r1, r1, #3
	add	fp, r1
	add	fp, r6
	cmp	r0, fp
	bgt	lab692
	mov	r7, sl
	ldr	r1, [sl, #12]
	ldr	r0, [r7, #8]!
	subs	r2, r6, #4
	cmp	r2, #36	
	str	r1, [r0, #12]
	str	r0, [r1, #8]
	bhi	lab695
	cmp	r2, #19
	bls	lab696
	ldr	r1, [r4, #0]
	str	r1, [sl, #8]
	ldr	r1, [r4, #4]
	str	r1, [sl, #12]
	cmp	r2, #27
	bhi	lab697
	adds	r4, #8
	add	r2, sl, #16
lab713: 	str	r1, [r2, #0]
	ldr	r1, [r4, #4]
	str	r1, [r2, #4]
	ldr	r1, [r4, #8]
	str	r1, [r2, #8]
lab714: 	sub	r2, fp, r5
	orr	r2, r2, #1
	str	r1, [r3, #8]
	str	r2, [r1, #4]
	ldr	r3, [sl, #4]
	and	r3, r3, #1
	orrs	r5, r3
	mov	r0, r8
	str	r5, [sl, #4]
	bl	__malloc_unlock
	b	lab698
lab689: 	ldr	r3, [r4, #0]
	str	r3, [r0, #0]
	ldr	r3, [r4, #4]
	str	r3, [r0, #4]
	cmp	r2, #27
	bhi	lab699
	add	r2, r4, #8
	add	r3, r0, #8
	b	lab700
lab694: 	add	r2, r9, r5
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
	b	lab698
lab687: 	ldr	r3, [r0, #-4]
	bic	r3, r3, #3
	add	r6, r3
	b	lab679
lab685: 	mov	r7, sl
	ldr	r1, [sl, #12]
	ldr	r0, [r7, #8]!
	subs	r2, r6, #4
	cmp	r2, #36	
	str	r1, [r0, #12]
	str	r0, [r1, #8]
	bhi	lab701
	cmp	r2, #19
	bls	lab702
	ldr	r1, [r4, #0]
	str	r1, [sl, #8]
	ldr	r1, [r4, #4]
	str	r1, [sl, #12]
	cmp	r2, #27
	bhi	lab703
	adds	r4, #8
	add	r2, sl, #16
lab709: 	ldr	r3, [r4, #0]
	str	r3, [r2, #0]
	ldr	r3, [r4, #4]
	str	r3, [r2, #4]
	ldr	r3, [r4, #8]
	str	r3, [r2, #8]
	mov	r9, sl
	mov	r4, r7
	b	lab679
lab688: 	mov	r1, r4
push {r1, r2}
	mov.w r1, #5099
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5099
	mov.w r2, #1610612736 
lab684: 	ldrd	r1, r3, [r0, #8]
	mov	r7, sl
	str	r3, [r1, #12]
	str	r1, [r3, #8]
	ldr	r1, [r7, #8]!
	ldr	r3, [sl, #12]
	str	r3, [r1, #12]
	subs	r2, r6, #4
	cmp	r2, #36	
	str	r1, [r3, #8]
	bhi	lab705
	cmp	r2, #19
	bls	lab706
	ldr	r3, [r4, #0]
	str	r3, [sl, #8]
	ldr	r3, [r4, #4]
	str	r3, [sl, #12]
	cmp	r2, #27
	bhi	lab707
	adds	r4, #8
	add	r3, sl, #16
lab710: 	str	r2, [r3, #0]
	ldr	r2, [r4, #4]
	str	r2, [r3, #4]
	ldr	r2, [r4, #8]
	str	r2, [r3, #8]
	mov	r6, ip
	mov	r9, sl
	mov	r4, r7
	b	lab679
lab699: 	ldr	r3, [r4, #8]
	str	r3, [r0, #8]
	ldr	r3, [r4, #12]
	str	r3, [r0, #12]
	cmp	r2, #36	
	beq	lab708
	add	r2, r4, #16
	add	r3, r0, #16
	b	lab700
lab702: 	mov	r2, r7
	b	lab709
lab701: 	mov	r1, r4
	mov	r0, r7
	mov	r6, r3
	mov	r9, sl
push {r1, r2}
	mov.w r1, #1673
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1673
	mov.w r2, #1610612736 
	b	lab679
lab706: 	mov	r3, r7
	b	lab710
lab705: 	mov	r1, r4
	mov	r0, r7
	mov	r6, ip
	mov	r9, sl
push {r1, r2}
	mov.w r1, #2157
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2157
	mov.w r2, #1610612736 
	b	lab679
	.ltorg
lab703: 	ldr	r1, [r4, #8]
	str	r1, [sl, #16]
	ldr	r1, [r4, #12]
	str	r1, [sl, #20]
	cmp	r2, #36	
	beq	lab711
	adds	r4, #16
	add	r2, sl, #24
	b	lab709
lab708: 	ldr	r3, [r4, #16]
	str	r3, [r0, #16]
	ldr	r1, [r4, #20]
	str	r1, [r0, #20]
	add	r2, r4, #24
	add	r3, r0, #24
	b	lab700
lab707: 	ldr	r3, [r4, #8]
	str	r3, [sl, #16]
	ldr	r3, [r4, #12]
	str	r3, [sl, #20]
	cmp	r2, #36	
	beq	lab712
	adds	r4, #16
	add	r3, sl, #24
	b	lab710
lab696: 	mov	r2, r7
	b	lab713
lab695: 	mov	r1, r4
	mov	r0, r7
push {r1, r2}
	mov.w r1, #3442
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3442
	mov.w r2, #1610612736 
	b	lab714
lab711: 	ldr	r2, [r4, #16]
	str	r2, [sl, #24]
	ldr	r2, [r4, #20]
	str	r2, [sl, #28]
	adds	r4, #24
	add	r2, sl, #32
	b	lab709
lab697: 	ldr	r1, [r4, #8]
	str	r1, [sl, #16]
	ldr	r1, [r4, #12]
	str	r1, [sl, #20]
	cmp	r2, #36	
	beq	lab715
	adds	r4, #16
	add	r2, sl, #24
	b	lab713
lab712: 	ldr	r3, [r4, #16]
	str	r3, [sl, #24]
	ldr	r3, [r4, #20]
	str	r3, [sl, #28]
	adds	r4, #24
	add	r3, sl, #32
	b	lab710
lab715: 	ldr	r2, [r4, #16]
	str	r2, [sl, #24]
	ldr	r2, [r4, #20]
	str	r2, [sl, #28]
	adds	r4, #24
	add	r2, sl, #32
	b	lab713
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
	beq	lab716
lab717:	cpsid f
	push {r1, r2}
	mov.w r1, #2314
	mov.w r2, #1610612736 
lab716: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab717
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #2887
	mov.w r2, #1610612736 
	.ltorg
raise:
	push	{r3, r4, r5, lr}
	ldr	r3, =_impure_ptr	
	cmp	r0, #31
	ldr	r5, [r3, #0]
	bhi	lab718
	ldr	r2, [r5, #732]	
	mov	r4, r0
	cbz	r2, lab719
	ldr	r3, [r2, r0, lsl #2]
	cbz	r3, lab719
	cmp	r3, #1
	beq	lab720
	adds	r1, r3, #1
	beq	lab721
	movs	r5, #0
	str	r5, [r2, r0, lsl #2]
	blx	r3
	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #985
	mov.w r2, #1610612736 
lab719: 	mov	r0, r5
	bl	_getpid_r
	mov	r2, r4
	mov	r1, r0
	mov	r0, r5
	ldmia	sp!, {r3, r4, r5, lr}
	b	_kill_r
lab721: 	movs	r3, #22
	str	r3, [r5, #0]
	movs	r0, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #3574
	mov.w r2, #1610612736 
lab720: 	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #3663
	mov.w r2, #1610612736 
lab718: 	movs	r3, #22
	str	r3, [r5, #0]
	mov	r0, #4294967295	
	cpsid f
	push {r1, r2}
	mov.w r1, #3531
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
	beq	lab722
lab723:	cpsid f
	push {r1, r2}
	mov.w r1, #4883
	mov.w r2, #1610612736 
lab722: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab723
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #2665
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
	mov.w r1, #1199
	mov.w r2, #1610612736 
	blt	lab724
	ldr	r3, [r4, #80]	
	add	r3, r0
	str	r3, [r4, #80]	
	pop	{r4, pc}
lab724: 	ldrh	r3, [r4, #12]
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
	bmi	lab725
lab726: 	strh	r1, [r4, #12]
	mov	r3, r7
	ldrsh	r1, [r4, #14]
	mov	r2, r6
	mov	r0, r5
	ldmia	sp!, {r4, r5, r6, r7, r8, lr}
	b	_write_r
lab725: 	ldrsh	r1, [r4, #14]
	movs	r3, #2
	movs	r2, #0
push {r1, r2}
	mov.w r1, #4028
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4028
	mov.w r2, #1610612736 
	b	lab726
	nop
__sseek:
	push	{r4, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #14]
push {r1, r2}
	mov.w r1, #4246
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4246
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
strncpy:
	push	{r4, r5, lr}
	orr	r4, r0, r1
	lsls	r3, r4, #30
	bne	lab727
	cmp	r2, #3
	bhi	lab728
lab727: 	mov	ip, r0
lab732: 	b	lab729
lab731: 	strb	r1, [r3], #1
	subs	r4, r2, #1
	cbz	r1, lab730
	mov	ip, r3
	mov	r2, r4
lab729: 	mov	r3, ip
	cmp	r2, #0
	bne	lab731
lab734:	cpsid f
	push {r1, r2}
	mov.w r1, #2366
	mov.w r2, #1610612736 
lab728: 	mov	r3, r1
	mov	ip, r0
lab733: 	ldr	r5, [r3], #4
	sub	r4, r5, #16843009	
	bic	r4, r4, r5
	tst	r4, #2155905152	
	bne	lab732
	subs	r2, #4
	cmp	r2, #3
	str	r5, [ip], #4
	mov	r1, r3
	bhi	lab733
	b	lab732
lab730: 	add	r2, ip
	cmp	r4, #0
	beq	lab734
lab735: 	cmp	r3, r2
	bne	lab735
	cpsid f
	push {r1, r2}
	mov.w r1, #7189
	mov.w r2, #1610612736 
__swbuf_r:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r5, r1
	mov	r4, r2
	mov	r6, r0
	cbz	r0, lab736
	ldr	r3, [r0, #56]	
	cmp	r3, #0
	beq	lab737
lab736: 	ldrsh	r2, [r4, #12]
	ldr	r3, [r4, #24]
	str	r3, [r4, #8]
	lsls	r7, r2, #28
	uxth	r0, r2
	bpl	lab738
	ldr	r3, [r4, #16]
	cbz	r3, lab738
	uxtb	r5, r5
	lsls	r1, r0, #18
	mov	r7, r5
	bpl	lab739
lab744: 	ldr	r1, [r4, #20]
	subs	r3, r2, r3
	cmp	r1, r3
	ble	lab740
lab745: lab746: 	subs	r1, #1
	str	r1, [r4, #8]
	adds	r1, r2, #1
	str	r1, [r4, #0]
	strb	r5, [r2, #0]
	ldr	r2, [r4, #20]
	cmp	r2, r3
	beq	lab741
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #31
	bpl	lab742
	cmp	r5, #10
	beq	lab741
lab742: 	mov	r0, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4781
	mov.w r2, #1610612736 
lab738: 	mov	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #7445
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7445
	mov.w r2, #1610612736 
	ldrsh	r2, [r4, #12]
	ldr	r3, [r4, #16]
	uxth	r0, r2
	uxtb	r5, r5
	lsls	r1, r0, #18
	mov	r7, r5
	bmi	lab744
lab739: 	orr	r2, r2, #8192	
	strh	r2, [r4, #12]
	ldr	r2, [r4, #100]	
	ldr	r1, [r4, #20]
	bic	r2, r2, #8192	
	str	r2, [r4, #100]	
	ldr	r2, [r4, #0]
	subs	r3, r2, r3
	cmp	r1, r3
	bgt	lab745
lab740: 	mov	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #7860
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7860
	mov.w r2, #1610612736 
	ldr	r2, [r4, #0]
	movs	r3, #1
	b	lab746
lab737: 	bl	__sinit
	b	lab736
lab741: 	mov	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #1214
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1214
	mov.w r2, #1610612736 
	beq	lab742
lab743: 	mov	r7, #4294967295	
	b	lab742
_wcrtomb_r:
	push	{r4, r5, r6, lr}
	mov	r5, r0
	sub	sp, #16
	mov	r4, r3
	cbz	r1, lab747
	ldr	r6, =__global_locale	
	ldr	r6, [r6, #224]	
	cpsid f
	push {r1, r2}
	mov.w r1, #2817
	mov.w r2, #1610612736 
	adds	r3, r0, #1
	beq	lab748
lab749: 	cpsid f
	push {r1, r2}
	mov.w r1, #423
	mov.w r2, #1610612736 
lab747: 	mov	r2, r1
	ldr	r1, =__global_locale	
	ldr	r6, [r1, #224]	
	add	r1, sp, #4
	cpsid f
	push {r1, r2}
	mov.w r1, #7848
	mov.w r2, #1610612736 
	adds	r3, r0, #1
	bne	lab749
lab748: 	movs	r2, #0
	movs	r3, #138	
	str	r2, [r4, #0]
	str	r3, [r5, #0]
	add	sp, #16
	cpsid f
	push {r1, r2}
	mov.w r1, #572
	mov.w r2, #1610612736 
	nop
	.ltorg
__ascii_wctomb:	push {r1, r2}
	mov.w r1, #5878
	mov.w r2, #1610612736 
	cmp	r2, #255	
	bhi	lab751
	strb	r2, [r1, #0]
	movs	r0, #1
	bx	lr
lab751: 	movs	r3, #138	
	str	r3, [r0, #0]
	mov	r0, #4294967295	
	bx	lr
lab750: 	mov	r0, r1
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
	beq	lab752
lab753: lab752: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab753
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
	cbz	r4, lab754
lab758: 	cmp	r5, #31
	bgt	lab755
	cbnz	r6, lab756
lab757: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab759:	cpsid f
	push {r1, r2}
	mov.w r1, #3268
	mov.w r2, #1610612736 
lab756: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab757
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab757
lab754: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab758
lab755: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab759
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
	beq	lab760
lab761: lab760: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab761
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
	.ltorg
_fclose_r:
	push	{r4, r5, r6, lr}
	cmp	r1, #0
	beq	lab762
	mov	r6, r0
	mov	r4, r1
	cbz	r0, lab763
	ldr	r3, [r0, #56]	
	cmp	r3, #0
	beq	lab764
lab763: 	ldr	r3, [r4, #100]	
	lsls	r0, r3, #31
	bpl	lab765
lab774: 	cmp	r3, #0
	beq	lab762
lab772: 	mov	r0, r6
push {r1, r2}
	mov.w r1, #3580
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3580
	mov.w r2, #1610612736 
	mov	r5, r0
	cbz	r3, lab766
	ldr	r1, [r4, #28]
	mov	r0, r6
	blx	r3
	cmp	r0, #0
	it	lt
	movlt	r5, #4294967295	
lab766: 	ldrh	r3, [r4, #12]
	lsls	r2, r3, #24
	bmi	lab767
lab775: 	cbz	r1, lab768
	add	r3, r4, #64	
	cmp	r1, r3
	beq	lab769
	mov	r0, r6
push {r1, r2}
	mov.w r1, #7969
	mov.w r2, #1610612736 
lab769:	push {r1, r2}
	mov.w r1, #7969
	mov.w r2, #1610612736 
	str	r3, [r4, #48]	
lab768: 	ldr	r1, [r4, #68]	
	cbz	r1, lab770
	mov	r0, r6
push {r1, r2}
	mov.w r1, #7144
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7144
	mov.w r2, #1610612736 
	str	r3, [r4, #68]	
lab770: 	bl	__sfp_lock_acquire
	ldr	r3, [r4, #100]	
	movs	r2, #0
	lsls	r3, r3, #31
	strh	r2, [r4, #12]
	bpl	lab771
lab776: 	bl	__retarget_lock_close_recursive
	bl	__sfp_lock_release
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab765: 	ldrh	r3, [r4, #12]
	lsls	r1, r3, #22
	bmi	lab772
	ldr	r0, [r4, #88]	
	bl	__retarget_lock_acquire_recursive
	ldrsh	r3, [r4, #12]
	cmp	r3, #0
	bne	lab772
	ldr	r5, [r4, #100]	
	ands	r5, r5, #1
	beq	lab773
lab762: 	movs	r5, #0
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab764: 	bl	__sinit
	ldr	r3, [r4, #100]	
	lsls	r0, r3, #31
	bmi	lab774
	b	lab765
lab773: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab767: 	ldr	r1, [r4, #16]
	mov	r0, r6
push {r1, r2}
	mov.w r1, #1772
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1772
	mov.w r2, #1610612736 
lab771: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	b	lab776
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
	beq	lab777
lab778:	cpsid f
	push {r1, r2}
	mov.w r1, #7968
	mov.w r2, #1610612736 
lab777: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab778
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #5694
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
	beq	lab779
lab780:	cpsid f
	push {r1, r2}
	mov.w r1, #382
	mov.w r2, #1610612736 
lab779: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab780
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #5683
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
	beq	lab781
lab782:	cpsid f
	push {r1, r2}
	mov.w r1, #3723
	mov.w r2, #1610612736 
lab781: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab782
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #4582
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
	beq	lab783
lab784:	cpsid f
	push {r1, r2}
	mov.w r1, #2156
	mov.w r2, #1610612736 
lab783: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab784
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #605
	mov.w r2, #1610612736 
	.ltorg
__aeabi_uldivmod:
	cbnz	r3, lab785
	cbnz	r2, lab785
	cmp	r1, #0
	it	eq
	cmpeq	r0, #0
	itt	ne
	movne	r1, #4294967295	
	movne	r0, #4294967295	
	b	__aeabi_idiv0
lab785: 	sub	ip, sp, #8
	strd	ip, lr, [sp, #-16]!
	bl	__udivmoddi4
	push {r1, r2}
	mov.w r1, #5911
	mov.w r2, #1610612736 
	ldrd	r2, r3, [sp, #8]
	add	sp, #16
	cpsid f
	push {r1, r2}
	mov.w r1, #6466
	mov.w r2, #1610612736 
__udivmoddi4:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r6, [sp, #32]
	mov	r5, r1
	mov	r4, r0
	mov	r8, r1
	cmp	r3, #0
	bne	lab786
	cmp	r2, r1
	mov	ip, r2
	bls	lab787
	clz	r2, r2
	cbz	r2, lab788
	lsl	r3, r1, r2
	rsb	r1, r2, #32
	lsr	r1, r0, r1
	lsl	ip, ip, r2
	orr	r8, r1, r3
	lsls	r4, r2
lab788: 	mov	r5, ip, lsr #16
	lsrs	r1, r4, #16
	udiv	lr, r8, r5
	uxth	r7, ip
	mls	r3, r5, lr, r8
	orr	r3, r1, r3, lsl #16
	mul	r1, lr, r7
	cmp	r1, r3
	bls	lab789
	adds	r3, ip, r3
	add	r0, lr, #4294967295	
	bcs	lab790
	cmp	r1, r3
	bls	lab790
	sub	lr, lr, #2
	add	r3, ip
lab789: 	subs	r3, r3, r1
	uxth	r4, r4
	udiv	r0, r3, r5
	mls	r3, r5, r0, r3
	orr	r4, r4, r3, lsl #16
	mul	r7, r0, r7
	cmp	r7, r4
	bls	lab791
	adds	r4, ip, r4
	add	r3, r0, #4294967295	
	bcs	lab792
	cmp	r7, r4
	bls	lab792
	add	r4, ip
	subs	r0, #2
lab791: 	subs	r4, r4, r7
	orr	r0, r0, lr, lsl #16
	movs	r1, #0
lab807: 	lsrs	r4, r2
	movs	r3, #0
	strd	r4, r3, [r6]
lab793:	cpsid f
	push {r1, r2}
	mov.w r1, #7595
	mov.w r2, #1610612736 
lab786: 	cmp	r3, r1
	bls	lab794
	cmp	r6, #0
	beq	lab795
	movs	r1, #0
	strd	r0, r5, [r6]
	mov	r0, r1
	cpsid f
	push {r1, r2}
	mov.w r1, #8113
	mov.w r2, #1610612736 
lab794: 	clz	r1, r3
	cmp	r1, #0
	bne	lab796
	cmp	r3, r5
	bcc	lab797
	cmp	r2, r0
	bhi	lab798
lab797: 	subs	r4, r0, r2
	sbc	r3, r5, r3
	movs	r0, #1
	mov	r8, r3
lab821: 	beq	lab793
	strd	r4, r8, [r6]
	b	lab793
lab787: 	cbnz	r2, lab799
	udf	#255	
lab799: 	clz	r2, r2
	cmp	r2, #0
	bne	lab800
	sub	r5, r1, ip
	mov	r7, ip, lsr #16
	uxth	lr, ip
	movs	r1, #1
lab819: 	mls	r0, r7, r3, r5
	lsrs	r5, r4, #16
	orr	r5, r5, r0, lsl #16
	mul	r0, lr, r3
	cmp	r0, r5
	bls	lab801
	adds	r5, ip, r5
	add	r8, r3, #4294967295	
	bcs	lab802
	cmp	r0, r5
	bhi	lab803
lab802: 	mov	r3, r8
lab801: 	subs	r5, r5, r0
	uxth	r4, r4
	udiv	r0, r5, r7
	mls	r5, r7, r0, r5
	orr	r4, r4, r5, lsl #16
	mul	lr, lr, r0
	cmp	lr, r4
	bls	lab804
	adds	r4, ip, r4
	add	r5, r0, #4294967295	
	bcs	lab805
	cmp	lr, r4
	bhi	lab806
lab805: 	mov	r0, r5
lab804: 	sub	r4, r4, lr
	orr	r0, r0, r3, lsl #16
	b	lab807
lab796: 	rsb	r7, r1, #32
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
	bls	lab808
	adds	r5, ip, r5
	add	sl, r8, #4294967295	
	bcs	lab809
	cmp	r0, r5
	bls	lab809
	sub	r8, r8, #2
	add	r5, ip
lab808: 	subs	r5, r5, r0
	uxth	r4, r4
	udiv	r0, r5, r9
	mls	r5, r9, r0, r5
	orr	r5, r4, r5, lsl #16
	mul	lr, r0, lr
	cmp	lr, r5
	bls	lab810
	adds	r5, ip, r5
	add	r4, r0, #4294967295	
	bcs	lab811
	cmp	lr, r5
	bls	lab811
	subs	r0, #2
	add	r5, ip
lab810: 	orr	r0, r0, r8, lsl #16
	umull	r9, r4, r0, r2
	sub	r5, r5, lr
	cmp	r5, r4
	mov	r8, r9
	mov	lr, r4
	bcc	lab812
	beq	lab813
lab820: 	subs	r2, r3, r8
	sbc	r5, r5, lr
	lsl	r7, r5, r7
	lsr	r3, r2, r1
	lsrs	r5, r1
	orrs	r7, r3
	strd	r7, r5, [r6]
lab814: 	movs	r1, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #4143
	mov.w r2, #1610612736 
lab800: 	rsb	r3, r2, #32
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
	bls	lab815
	adds	r3, ip, r3
	add	r8, r1, #4294967295	
	bcs	lab816
	cmp	r0, r3
	bls	lab816
	subs	r1, #2
	add	r3, ip
lab815: 	subs	r3, r3, r0
	uxth	r5, r5
	udiv	r0, r3, r7
	mls	r3, r7, r0, r3
	orr	r5, r5, r3, lsl #16
	mul	r3, r0, lr
	cmp	r3, r5
	bls	lab817
	adds	r5, ip, r5
	add	r8, r0, #4294967295	
	bcs	lab818
	cmp	r3, r5
	bls	lab818
	subs	r0, #2
	add	r5, ip
lab817: 	subs	r5, r5, r3
	orr	r1, r0, r1, lsl #16
	b	lab819
lab795: 	mov	r1, r6
	mov	r0, r6
	b	lab793
lab790: 	mov	lr, r0
	b	lab789
lab792: 	mov	r0, r3
	b	lab791
lab813: 	cmp	r3, r9
	bcs	lab820
lab812: 	subs	r8, r9, r2
	sbc	lr, r4, ip
	subs	r0, #1
	b	lab820
lab818: 	mov	r0, r8
	b	lab817
lab811: 	mov	r0, r4
	b	lab810
lab816: 	mov	r1, r8
	b	lab815
lab809: 	mov	r8, sl
	b	lab808
lab803: 	subs	r3, #2
	add	r5, ip
	b	lab801
lab798: 	mov	r0, r1
	b	lab821
lab806: 	add	r4, ip
	subs	r0, #2
	b	lab804
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
	ldr	r1, =0x00020f08	
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

g0log:
	.word	0x190100ff
	.word	0xc61a3202
	.word	0xee33df03
	.word	0x4bc7681b
	.word	0x0ee06404
	.word	0x81ef8d34
	.word	0xf869c11c
	.word	0x714c08c8
	.word	0x2f658a05
	.word	0x210f24e1
	.word	0xda8e9335
	.word	0x458212f0
	.word	0x7dc2b51d
	.word	0xb9f9276a
	.word	0x78099ac9
	.word	0xa672e44d
	.word	0x628bbf06
	.word	0xfd30dd66
	.word	0xb32598e2
	.word	0x88229110
	.word	0xce94d036
	.word	0xbddb968f
	.word	0x5c13d2f1
	.word	0x40463883
	.word	0xa3b6421e
	.word	0x6e7e48c3
	.word	0x54283a6b
	.word	0x3dba85fa
	.word	0x9f9b5eca
	.word	0x2b79150a
	.word	0xace5d44e
	.word	0x57a7f373
	.word	0xf7c07007
	.word	0x0d63808c
	.word	0xedde4a67
	.word	0x18fec531
	.word	0x7799a5e3
	.word	0x7cb4b826
	.word	0xd9924411
	.word	0x2e892023
	.word	0x5bd13f37
	.word	0xcdcfbc95
	.word	0xb2978790
	.word	0x61befcdc
	.word	0xabd356f2
	.word	0x9e5d2a14
	.word	0x53393c84
	.word	0xa2416d47
	.word	0xd8432d1f
	.word	0x76a47bb7
	.word	0xec4917c4
	.word	0xf66f0c7f
	.word	0x523ba16c
	.word	0xaa559d29
	.word	0xb18660fb
	.word	0x5a3eccbb
	.word	0xb05f59cb
	.word	0x51a0a99c
	.word	0xeb16f50b
	.word	0xd72c757a
	.word	0xe9d5ae4f
	.word	0xe8ade7e6
	.word	0xeaf4d674
	.word	0xaf5850a8
g0exp:
	.word	0x08040201
	.word	0x80402010
	.word	0xe8743a1d
	.word	0x261387cd
	.word	0x5a2d984c
	.word	0xc9ea75b4
	.word	0x0c06038f
	.word	0xc0603018
	.word	0x9c4e279d
	.word	0x35944a25
	.word	0x77b5d46a
	.word	0x239fc1ee
	.word	0x0a058c46
	.word	0xa0502814
	.word	0xd269ba5d
	.word	0xa1de6fb9
	.word	0xc261be5f
	.word	0xbc5e2f99
	.word	0x0f89ca65
	.word	0xf0783c1e
	.word	0xbbd3e7fd
	.word	0x7fb1d66b
	.word	0xa3dfe1fe
	.word	0xe271b65b
	.word	0x8643afd9
	.word	0x88442211
	.word	0x68341a0d
	.word	0xce67bdd0
	.word	0x7c3e1f81
	.word	0x93c7edf8
	.word	0xc5ec763b
	.word	0xcc663397
	.word	0x5c2e1785
	.word	0xa9da6db8
	.word	0x42219e4f
	.word	0x542a1584
	.word	0x299a4da8
	.word	0xaa55a452
	.word	0x72399249
	.word	0x73b7d5e4
	.word	0x63bfd1e6
	.word	0x7e3f91c6
	.word	0xb3d7e5fc
	.word	0xfff1f67b
	.word	0x4babdbe3
	.word	0xc4623196
	.word	0xdc6e3795
	.word	0x41ae57a5
	.word	0x64321982
	.word	0x0e078dc8
	.word	0xe070381c
	.word	0xa653a7dd
	.word	0xb259a251
	.word	0xeff9f279
	.word	0x562b9bc3
	.word	0x098a45ac
	.word	0x90482412
	.word	0xf5f47a3d
	.word	0xebfbf3f7
	.word	0x160b8bcb
	.word	0x7db0582c
	.word	0x83cfe9fa
	.word	0xd86c361b
	.word	0x008e47ad

fmtword:
	.word	0x000077c4
	.word	0x000072f3
	.word	0x00007daa
	.word	0x0000789d
	.word	0x0000662f
	.word	0x00006318
	.word	0x00006c41
	.word	0x00006976
	.word	0x00005412
	.word	0x00005125
	.word	0x00005e7c
	.word	0x00005b4b
	.word	0x000045f9
	.word	0x000040ce
	.word	0x00004f97
	.word	0x00004aa0
	.word	0x0000355f
	.word	0x00003068
	.word	0x00003f31
	.word	0x00003a06
	.word	0x000024b4
	.word	0x00002183
	.word	0x00002eda
	.word	0x00002bed
	.word	0x00001689
	.word	0x000013be
	.word	0x00001ce7
	.word	0x000019d0
	.word	0x00000762
	.word	0x00000255
	.word	0x00000d0c
	.word	0x0000083b
adelta:
	.word	0x130f0b00
	.word	0x101f1b17
	.word	0x18161412
	.word	0x16141c1a
	.word	0x1c1a1818
	.word	0x1818161c
	.word	0x1c1c1a1a
	.word	0x1a1a1818
	.word	0x181c1c1a
	.word	0x1c1a1a1a
	.word	0x0000001c
vpat:
	.word	0x00000c94
	.word	0x000005bc
	.word	0x00000a99
	.word	0x000004d3
	.word	0x00000bf6
	.word	0x00000762
	.word	0x00000847
	.word	0x0000060d
	.word	0x00000928
	.word	0x00000b78
	.word	0x0000045d
	.word	0x00000a17
	.word	0x00000532
	.word	0x000009a6
	.word	0x00000683
	.word	0x000008c9
	.word	0x000007ec
	.word	0x00000ec4
	.word	0x000001e1
	.word	0x00000fab
	.word	0x0000008e
	.word	0x00000c1a
	.word	0x0000033f
	.word	0x00000d75
	.word	0x00000250
	.word	0x000009d5
	.word	0x000006f0
	.word	0x000008ba
	.word	0x0000079f
	.word	0x00000b0b
	.word	0x0000042e
	.word	0x00000a64
	.word	0x00000541
	.word	0x00000c69
eccblocks:
	.word	0x07130001
	.word	0x0a100001
	.word	0x0d0d0001
	.word	0x11090001
	.word	0x0a220001
	.word	0x101c0001
	.word	0x16160001
	.word	0x1c100001
	.word	0x0f370001
	.word	0x1a2c0001
	.word	0x12110002
	.word	0x160d0002
	.word	0x14500001
	.word	0x12200002
	.word	0x1a180002
	.word	0x10090004
	.word	0x1a6c0001
	.word	0x182b0002
	.word	0x120f0202
	.word	0x160b0202
	.word	0x12440002
	.word	0x101b0004
	.word	0x18130004
	.word	0x1c0f0004
	.word	0x144e0002
	.word	0x121f0004
	.word	0x120e0402
	.word	0x1a0d0104
	.word	0x18610002
	.word	0x16260202
	.word	0x16120204
	.word	0x1a0e0204
	.word	0x1e740002
	.word	0x16240203
	.word	0x14100404
	.word	0x180c0404
	.word	0x12440202
	.word	0x1a2b0104
	.word	0x18130206
	.word	0x1c0f0206
	.word	0x14510004
	.word	0x1e320401
	.word	0x1c160404
	.word	0x180c0803
	.word	0x185c0202
	.word	0x16240206
	.word	0x1a140604
	.word	0x1c0e0407
	.word	0x1a6b0004
	.word	0x16250108
	.word	0x18140408
	.word	0x160b040c
	.word	0x1e730103
	.word	0x18280504
	.word	0x1410050b
	.word	0x180c050b
	.word	0x16570105
	.word	0x18290505
	.word	0x1e180705
	.word	0x180c070b
	.word	0x18620105
	.word	0x1c2d0307
	.word	0x1813020f
	.word	0x1e0f0d03
	.word	0x1c6b0501
	.word	0x1c2e010a
	.word	0x1c160f01
	.word	0x1c0e1102
	.word	0x1e780105
	.word	0x1a2b0409
	.word	0x1c160111
	.word	0x1c0e1302
	.word	0x1c710403
	.word	0x1a2c0b03
	.word	0x1a150411
	.word	0x1a0d1009
	.word	0x1c6b0503
	.word	0x1a290d03
	.word	0x1e18050f
	.word	0x1c0f0a0f
	.word	0x1c740404
	.word	0x1a2a0011
	.word	0x1c160611
	.word	0x1e100613
	.word	0x1c6f0702
	.word	0x1c2e0011
	.word	0x1e181007
	.word	0x180d0022
	.word	0x1e790504
	.word	0x1c2f0e04
	.word	0x1e180e0b
	.word	0x1e0f0e10
	.word	0x1e750406
	.word	0x1c2d0e06
	.word	0x1e18100b
	.word	0x1e10021e
	.word	0x1a6a0408
	.word	0x1c2f0d08
	.word	0x1e181607
	.word	0x1e0f0d16
	.word	0x1c72020a
	.word	0x1c2e0413
	.word	0x1c16061c
	.word	0x1e100421
	.word	0x1e7a0408
	.word	0x1c2d0316
	.word	0x1e171a08
	.word	0x1e0f1c0c
	.word	0x1e750a03
	.word	0x1c2d1703
	.word	0x1e181f04
	.word	0x1e0f1f0b
	.word	0x1e740707
	.word	0x1c2d0715
	.word	0x1e172501
	.word	0x1e0f1a13
	.word	0x1e730a05
	.word	0x1c2f0a13
	.word	0x1e18190f
	.word	0x1e0f1917
	.word	0x1e73030d
	.word	0x1c2e1d02
	.word	0x1e18012a
	.word	0x1e0f1c17
	.word	0x1e730011
	.word	0x1c2e170a
	.word	0x1e18230a
	.word	0x1e0f2313
	.word	0x1e730111
	.word	0x1c2e150e
	.word	0x1e18131d
	.word	0x1e0f2e0b
	.word	0x1e73060d
	.word	0x1c2e170e
	.word	0x1e18072c
	.word	0x1e10013b
	.word	0x1e79070c
	.word	0x1c2f1a0c
	.word	0x1e180e27
	.word	0x1e0f2916
	.word	0x1e790e06
	.word	0x1c2f2206
	.word	0x1e180a2e
	.word	0x1e0f4002
	.word	0x1e7a0411
	.word	0x1c2e0e1d
	.word	0x1e180a31
	.word	0x1e0f2e18
	.word	0x1e7a1204
	.word	0x1c2e200d
	.word	0x1e180e30
	.word	0x1e0f202a
	.word	0x1e750414
	.word	0x1c2f0728
	.word	0x1e18162b
	.word	0x1e0f430a
	.word	0x1e760613
	.word	0x1c2f1f12
	.word	0x1e182222
	.word	0x1e0f3d14
	.word	0x803f65fe
	.word	0x80a06e82
	.word	0x802e41ba
	.word	0x802e26ba
	.word	0x80ae09ba
	.word	0x00001482
	.word	0x70747468
	.word	0x772f2f3a
	.word	0x6d2e7777
	.word	0x65656761
	.word	0x6f632e63
	.word	0x0000006d
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
	.word	0x0001e4c0
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

in_encode.0:
	.word	0x0000e288
_impure_ptr:
	.word	0x0001e4c0
impure_data:
	.word	0x00000000
	.word	0x0001e7ac
	.word	0x0001e814
	.word	0x0001e87c
	.word	0x00000001
	.word	0x00000000
	.word	0xabcd330e
	.word	0xe66d1234
	.word	0x0005deec
	.word	0x0000000b
__atexit_recursive_mutex:
	.word	0x00020ebc
__global_locale:
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x0000d69d
	.word	0x0000cf51
	.word	0x00000000
	.word	0x0000e39c
	.word	0x0000e398
	.word	0x0000e304
	.word	0x0000e304
	.word	0x0000e304
	.word	0x0000e304
	.word	0x0000e304
	.word	0x0000e304
	.word	0x0000e304
	.word	0x0000e304
	.word	0x0000e304
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0x0000ffff
	.word	0x53410001
	.word	0x00494943
	.word	0x53410000
	.word	0x00494943
__malloc_av_:
	.word	0x0001ea58
	.word	0x0001ea58
	.word	0x0001ea60
	.word	0x0001ea60
	.word	0x0001ea68
	.word	0x0001ea68
	.word	0x0001ea70
	.word	0x0001ea70
	.word	0x0001ea78
	.word	0x0001ea78
	.word	0x0001ea80
	.word	0x0001ea80
	.word	0x0001ea88
	.word	0x0001ea88
	.word	0x0001ea90
	.word	0x0001ea90
	.word	0x0001ea98
	.word	0x0001ea98
	.word	0x0001eaa0
	.word	0x0001eaa0
	.word	0x0001eaa8
	.word	0x0001eaa8
	.word	0x0001eab0
	.word	0x0001eab0
	.word	0x0001eab8
	.word	0x0001eab8
	.word	0x0001eac0
	.word	0x0001eac0
	.word	0x0001eac8
	.word	0x0001eac8
	.word	0x0001ead0
	.word	0x0001ead0
	.word	0x0001ead8
	.word	0x0001ead8
	.word	0x0001eae0
	.word	0x0001eae0
	.word	0x0001eae8
	.word	0x0001eae8
	.word	0x0001eaf0
	.word	0x0001eaf0
	.word	0x0001eaf8
	.word	0x0001eaf8
	.word	0x0001eb00
	.word	0x0001eb00
	.word	0x0001eb08
	.word	0x0001eb08
	.word	0x0001eb10
	.word	0x0001eb10
	.word	0x0001eb18
	.word	0x0001eb18
	.word	0x0001eb20
	.word	0x0001eb20
	.word	0x0001eb28
	.word	0x0001eb28
	.word	0x0001eb30
	.word	0x0001eb30
	.word	0x0001eb38
	.word	0x0001eb38
	.word	0x0001eb40
	.word	0x0001eb40
	.word	0x0001eb48
	.word	0x0001eb48
	.word	0x0001eb50
	.word	0x0001eb50
	.word	0x0001eb58
	.word	0x0001eb58
	.word	0x0001eb60
	.word	0x0001eb60
	.word	0x0001eb68
	.word	0x0001eb68
	.word	0x0001eb70
	.word	0x0001eb70
	.word	0x0001eb78
	.word	0x0001eb78
	.word	0x0001eb80
	.word	0x0001eb80
	.word	0x0001eb88
	.word	0x0001eb88
	.word	0x0001eb90
	.word	0x0001eb90
	.word	0x0001eb98
	.word	0x0001eb98
	.word	0x0001eba0
	.word	0x0001eba0
	.word	0x0001eba8
	.word	0x0001eba8
	.word	0x0001ebb0
	.word	0x0001ebb0
	.word	0x0001ebb8
	.word	0x0001ebb8
	.word	0x0001ebc0
	.word	0x0001ebc0
	.word	0x0001ebc8
	.word	0x0001ebc8
	.word	0x0001ebd0
	.word	0x0001ebd0
	.word	0x0001ebd8
	.word	0x0001ebd8
	.word	0x0001ebe0
	.word	0x0001ebe0
	.word	0x0001ebe8
	.word	0x0001ebe8
	.word	0x0001ebf0
	.word	0x0001ebf0
	.word	0x0001ebf8
	.word	0x0001ebf8
	.word	0x0001ec00
	.word	0x0001ec00
	.word	0x0001ec08
	.word	0x0001ec08
	.word	0x0001ec10
	.word	0x0001ec10
	.word	0x0001ec18
	.word	0x0001ec18
	.word	0x0001ec20
	.word	0x0001ec20
	.word	0x0001ec28
	.word	0x0001ec28
	.word	0x0001ec30
	.word	0x0001ec30
	.word	0x0001ec38
	.word	0x0001ec38
	.word	0x0001ec40
	.word	0x0001ec40
	.word	0x0001ec48
	.word	0x0001ec48
	.word	0x0001ec50
	.word	0x0001ec50
	.word	0x0001ec58
	.word	0x0001ec58
	.word	0x0001ec60
	.word	0x0001ec60
	.word	0x0001ec68
	.word	0x0001ec68
	.word	0x0001ec70
	.word	0x0001ec70
	.word	0x0001ec78
	.word	0x0001ec78
	.word	0x0001ec80
	.word	0x0001ec80
	.word	0x0001ec88
	.word	0x0001ec88
	.word	0x0001ec90
	.word	0x0001ec90
	.word	0x0001ec98
	.word	0x0001ec98
	.word	0x0001eca0
	.word	0x0001eca0
	.word	0x0001eca8
	.word	0x0001eca8
	.word	0x0001ecb0
	.word	0x0001ecb0
	.word	0x0001ecb8
	.word	0x0001ecb8
	.word	0x0001ecc0
	.word	0x0001ecc0
	.word	0x0001ecc8
	.word	0x0001ecc8
	.word	0x0001ecd0
	.word	0x0001ecd0
	.word	0x0001ecd8
	.word	0x0001ecd8
	.word	0x0001ece0
	.word	0x0001ece0
	.word	0x0001ece8
	.word	0x0001ece8
	.word	0x0001ecf0
	.word	0x0001ecf0
	.word	0x0001ecf8
	.word	0x0001ecf8
	.word	0x0001ed00
	.word	0x0001ed00
	.word	0x0001ed08
	.word	0x0001ed08
	.word	0x0001ed10
	.word	0x0001ed10
	.word	0x0001ed18
	.word	0x0001ed18
	.word	0x0001ed20
	.word	0x0001ed20
	.word	0x0001ed28
	.word	0x0001ed28
	.word	0x0001ed30
	.word	0x0001ed30
	.word	0x0001ed38
	.word	0x0001ed38
	.word	0x0001ed40
	.word	0x0001ed40
	.word	0x0001ed48
	.word	0x0001ed48
	.word	0x0001ed50
	.word	0x0001ed50
	.word	0x0001ed58
	.word	0x0001ed58
	.word	0x0001ed60
	.word	0x0001ed60
	.word	0x0001ed68
	.word	0x0001ed68
	.word	0x0001ed70
	.word	0x0001ed70
	.word	0x0001ed78
	.word	0x0001ed78
	.word	0x0001ed80
	.word	0x0001ed80
	.word	0x0001ed88
	.word	0x0001ed88
	.word	0x0001ed90
	.word	0x0001ed90
	.word	0x0001ed98
	.word	0x0001ed98
	.word	0x0001eda0
	.word	0x0001eda0
	.word	0x0001eda8
	.word	0x0001eda8
	.word	0x0001edb0
	.word	0x0001edb0
	.word	0x0001edb8
	.word	0x0001edb8
	.word	0x0001edc0
	.word	0x0001edc0
	.word	0x0001edc8
	.word	0x0001edc8
	.word	0x0001edd0
	.word	0x0001edd0
	.word	0x0001edd8
	.word	0x0001edd8
	.word	0x0001ede0
	.word	0x0001ede0
	.word	0x0001ede8
	.word	0x0001ede8
	.word	0x0001edf0
	.word	0x0001edf0
	.word	0x0001edf8
	.word	0x0001edf8
	.word	0x0001ee00
	.word	0x0001ee00
	.word	0x0001ee08
	.word	0x0001ee08
	.word	0x0001ee10
	.word	0x0001ee10
	.word	0x0001ee18
	.word	0x0001ee18
	.word	0x0001ee20
	.word	0x0001ee20
	.word	0x0001ee28
	.word	0x0001ee28
	.word	0x0001ee30
	.word	0x0001ee30
	.word	0x0001ee38
	.word	0x0001ee38
	.word	0x0001ee40
	.word	0x0001ee40
	.word	0x0001ee48
	.word	0x0001ee48
	.word	0x0001ee50
	.word	0x0001ee50
__malloc_sbrk_base:
	.word	0xffffffff
__malloc_trim_threshold:
	.word	0x00020000


	.bss

__bss_start:
	.word	0x00000000
object.0:
framebase:
	.word	0x00000000
framask:
	.word	0x00000000
rlens:
	.word	0x00000000
VERSION:
WD:
WDB:
strinbuf:
	.word	0x00000000
qrframe:
	.word	0x00000000
ECCLEVEL:
neccblk1:
neccblk2:
datablkw:
eccblkwid:
	.word	0x00000000
heap:
encode:
	.word	0x00000000
size:
	.word	0x00000000
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
