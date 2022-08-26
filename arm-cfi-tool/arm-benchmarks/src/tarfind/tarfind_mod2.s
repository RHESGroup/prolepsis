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
	mov.w r1, #1646
	mov.w r2, #1610612736 
	cbz	r3, lab1
	ldr	r0, =0x00009979	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	mov.w r1, #373
	mov.w r2, #1610612736 
	ldr	r4, =__bss_start	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x0000b990	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	mov.w r1, #7537
	mov.w r2, #1610612736 
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x0000b990	
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
	ldr	r2, =0x0001e6ec	
	subs	r2, r2, r0
push {r1, r2}
	mov.w r1, #2140
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2140
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
	ldr	r0, =0x000096c1	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x00009979	
push {r1, r2}
	mov.w r1, #1749
	mov.w r2, #1610612736 
lab7:	push {r1, r2}
	mov.w r1, #1749
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1354
	mov.w r2, #1610612736 
	movs	r1, r5
	bl	main
	push {r1, r2}
	mov.w r1, #308
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
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
push {r1, r2}
	mov.w r1, #2829
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2829
	mov.w r2, #1610612736 
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6456
	mov.w r2, #1610612736 
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #47	
push {r1, r2}
	mov.w r1, #3278
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3278
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #280
	mov.w r2, #1610612736 
benchmark_body:
	push	{r7, lr}
	sub	sp, #56	
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #48]	
	b	lab8
lab22: 	ldr	r0, =heap	
	bl	init_heap_beebs
	push {r1, r2}
	mov.w r1, #1574
	mov.w r2, #1610612736 
	str	r3, [r7, #28]
	ldr	r2, [r7, #28]
	mov	r3, r2
	lsls	r3, r3, #8
	add	r3, r2
	mov	r0, r3
	bl	malloc_beebs
	str	r0, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #52]	
	b	lab9
lab12: 	mov	r3, r2
	lsls	r3, r3, #8
	add	r3, r2
	ldr	r2, [r7, #24]
	add	r3, r2
	str	r3, [r7, #12]
	movw	r2, #257	
	movs	r1, #0
	ldr	r0, [r7, #12]
push {r1, r2}
	mov.w r1, #5142
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5142
	mov.w r2, #1610612736 
	ldr	r2, =0xae4c415d	
	smull	r1, r2, r2, r3
	add	r2, r3
	asrs	r1, r2, #6
	asrs	r2, r3, #31
	subs	r2, r1, r2
	movs	r1, #94	
	mul	r2, r1, r2
	subs	r2, r3, r2
	adds	r3, r2, #5
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r2, #48	
	strb	r2, [r3, #156]	
	movs	r3, #0
	str	r3, [r7, #44]	
	b	lab10
lab11: 	mov	r3, r0
	ldr	r2, =0x4ec4ec4f	
	smull	r1, r2, r2, r3
	asrs	r1, r2, #3
	asrs	r2, r3, #31
	subs	r2, r1, r2
	movs	r1, #26
	mul	r2, r1, r2
	subs	r2, r3, r2
	uxtb	r3, r2
	adds	r3, #65	
	uxtb	r1, r3
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #44]	
	add	r3, r2
	mov	r2, r1
	strb	r2, [r3, #0]
	ldr	r3, [r7, #44]	
	adds	r3, #1
	str	r3, [r7, #44]	
lab10: 	ldr	r2, [r7, #44]	
	ldr	r3, [r7, #8]
	cmp	r2, r3
	blt	lab11
	ldr	r3, [r7, #12]
	movs	r2, #48	
	strb	r2, [r3, #124]	
	ldr	r3, [r7, #52]	
	adds	r3, #1
	str	r3, [r7, #52]	
lab9: 	ldr	r2, [r7, #52]	
	ldr	r3, [r7, #28]
	cmp	r2, r3
	blt	lab12
	movs	r3, #0
	str	r3, [r7, #40]	
	movs	r3, #0
	str	r3, [r7, #44]	
	b	lab13
lab21: 	add	r2, r3, #17
	ldr	r3, =0xea0ea0eb	
	smull	r1, r3, r3, r2
	add	r3, r2
	asrs	r1, r3, #5
	asrs	r3, r2, #31
	subs	r1, r1, r3
	mov	r3, r1
	lsls	r3, r3, #2
	add	r3, r1
	lsls	r1, r3, #3
	subs	r1, r1, r3
	subs	r1, r2, r1
	mov	r2, r1
	mov	r3, r2
	lsls	r3, r3, #8
	add	r3, r2
	ldr	r2, [r7, #24]
	add	r3, r2
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #52]	
	b	lab14
lab20: 	mov	r3, r2
	lsls	r3, r3, #8
	add	r3, r2
	ldr	r2, [r7, #24]
	add	r3, r2
	str	r3, [r7, #16]
	ldr	r2, [r7, #52]	
	mov	r3, r2
	lsls	r3, r3, #8
	add	r3, r2
	ldr	r2, [r7, #24]
	add	r3, r2
	str	r3, [r7, #36]	
	ldr	r3, [r7, #20]
	str	r3, [r7, #32]
	b	lab15
lab17: 	adds	r3, #1
	str	r3, [r7, #36]	
	ldr	r3, [r7, #32]
	adds	r3, #1
	str	r3, [r7, #32]
lab15: 	ldr	r3, [r7, #36]	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab16
	ldr	r3, [r7, #32]
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab16
	ldr	r3, [r7, #36]	
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #32]
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab17
lab16: 	ldr	r3, [r7, #36]	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab18
	ldr	r3, [r7, #32]
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab18
	ldr	r3, [r7, #40]	
	adds	r3, #1
	str	r3, [r7, #40]	
	b	lab19
lab18: 	ldr	r3, [r7, #52]	
	adds	r3, #1
	str	r3, [r7, #52]	
lab14: 	ldr	r2, [r7, #52]	
	ldr	r3, [r7, #28]
	cmp	r2, r3
	blt	lab20
lab19: 	ldr	r3, [r7, #44]	
	adds	r3, #1
	str	r3, [r7, #44]	
lab13: 	ldr	r3, [r7, #44]	
	cmp	r3, #4
	ble	lab21
	ldr	r0, [r7, #24]
	bl	free_beebs
	ldr	r3, [r7, #48]	
	adds	r3, #1
	str	r3, [r7, #48]	
lab8: 	ldr	r2, [r7, #48]	
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab22
	ldr	r3, [r7, #40]	
	cmp	r3, #5
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #56	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4202
	mov.w r2, #1610612736 
	.ltorg
verify_benchmark:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #1
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
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
	mov.w r1, #3402
	mov.w r2, #1610612736 
	bl	benchmark
	push {r1, r2}
	mov.w r1, #8108
	mov.w r2, #1610612736 
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
	mov.w r1, #5151
	mov.w r2, #1610612736 
rand_beebs:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =seed	
	ldr	r3, [r3, #0]
	ldr	r2, =0x41c64e6d	
	mul	r3, r2, r3
	add	r3, r3, #12288	
	adds	r3, #57	
	bic	r3, r3, #2147483648	
	ldr	r2, =seed	
	str	r3, [r2, #0]
	ldr	r3, =seed	
	ldr	r3, [r3, #0]
	asrs	r3, r3, #16
	mov	r0, r3
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
init_heap_beebs:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	and	r3, r3, #3
	cmp	r3, #0
	beq	lab23
	ldr	r3, =__func__.0-0x48	
	ldr	r2, =__func__.0	
	movs	r1, #65	
	ldr	r0, [pc, #44]	
	bl	__assert_func
lab23: 	ldr	r2, =heap_ptr	
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
	mov.w r1, #3574
	mov.w r2, #1610612736 
	.ltorg
malloc_beebs:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	lab24
	movs	r3, #0
	b	lab25
lab24: 	ldr	r3, =heap_ptr	
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
	beq	lab26
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
lab26: 	ldr	r3, =heap_end	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #20]
	cmp	r2, r3
	bls	lab27
	movs	r3, #0
	b	lab25
lab27: 	ldr	r3, =heap_ptr	
	ldr	r3, [r3, #0]
	str	r3, [r7, #8]
	ldr	r2, =heap_ptr	
	ldr	r3, [r7, #20]
	str	r3, [r2, #0]
	ldr	r3, [r7, #8]
lab25: 	mov	r0, r3
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
	cbz	r4, lab28
	ldr	r1, [pc, #28]	
lab29: 	strd	r1, r4, [sp, #4]
	mov	r0, r6
	ldr	r1, [pc, #24]	
	bl	fiprintf
	push {r1, r2}
	mov.w r1, #5315
	mov.w r2, #1610612736 
lab28: 	ldr	r1, [pc, #16]	
	mov	r4, r1
	b	lab29
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
	mov.w r1, #2354
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2354
	mov.w r2, #1610612736 
	ldmia	sp!, {r4, lr}
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #3790
	mov.w r2, #1610612736 
	nop
	.ltorg
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x0001b994	
	ldr	r5, =0x0001b994	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab30
	movs	r4, #0
lab31: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #7842
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #7842
	mov.w r2, #1610612736 
lab30: 	ldr	r6, =0x0001b99c	
	ldr	r5, =0x0001b994	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab32
	movs	r4, #0
lab33: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #6355
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #6355
	mov.w r2, #1610612736 
lab32:	cpsid f
	push {r1, r2}
	mov.w r1, #3924
	mov.w r2, #1610612736 
	.ltorg
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab34
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab35
	uxtb	r2, r1
	mov	r3, r0
	b	lab36
lab37: 	bcc	lab35
lab36: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab37
lab45: 	bls	lab38
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab39
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab40: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab40
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab41
lab46: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab42: 	cmp	r3, r2
	bne	lab42
	and	r4, ip, #3
lab38: 	cbz	r4, lab35
lab44: 	add	r4, r3
lab43: 	cmp	r4, r3
	bne	lab43
lab35:	cpsid f
	push {r1, r2}
	mov.w r1, #1524
	mov.w r2, #1610612736 
lab41: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab44
	b	lab35
lab34: 	mov	r3, r0
	mov	r4, r2
	b	lab45
lab39: 	mov	r2, r3
	mov	ip, r4
	b	lab46
__sprint_r.part.0:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, [r1, #100]	
	lsls	r4, r3, #18
	mov	r8, r2
	bpl	lab47
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #0]
	cbz	r3, lab48
	mov	fp, r1
	mov	r6, r0
	add	r9, r2, #8
lab53: 	movs	r7, sl, lsr #2
	beq	lab49
	subs	r5, #4
	movs	r4, #0
	b	lab50
lab52: 	beq	lab51
lab50: 	ldr	r1, [r5, #4]!
	mov	r2, fp
	mov	r0, r6
	bl	_fputwc_r
	push {r1, r2}
	mov.w r1, #277
	mov.w r2, #1610612736 
	add	r4, r4, #1
	bne	lab52
lab54: 	strd	r3, r3, [r8, #4]
	cpsid f
	push {r1, r2}
	mov.w r1, #5912
	mov.w r2, #1610612736 
lab51: 	ldr	r3, [r8, #8]
lab49: 	bic	sl, sl, #3
	sub	r3, r3, sl
	str	r3, [r8, #8]
	add	r9, r9, #8
	cmp	r3, #0
	bne	lab53
lab48: 	movs	r0, #0
	b	lab54
lab47: 	bl	__sfvwrite_r
	push {r1, r2}
	mov.w r1, #2776
	mov.w r2, #1610612736 
	strd	r3, r3, [r8, #4]
	cpsid f
	push {r1, r2}
	mov.w r1, #7649
	mov.w r2, #1610612736 
	nop
_vfiprintf_r:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, #244	
	strd	r3, r0, [sp, #16]
	mov	r4, r3
	str	r1, [sp, #4]
	mov	r7, r2
	cbz	r0, lab55
	ldr	r3, [r0, #56]	
	cmp	r3, #0
	beq	lab56
lab55: 	ldr	r2, [sp, #4]
	ldr	r3, [r2, #100]	
	lsls	r6, r3, #31
	bpl	lab57
	ldrsh	r1, [r2, #12]
	uxth	r2, r1
lab96: 	bmi	lab58
	orr	r2, r1, #8192	
	ldr	r1, [sp, #4]
	ldr	r3, [r1, #100]	
	strh	r2, [r1, #12]
	bic	r3, r3, #8192	
	uxth	r2, r2
	str	r3, [r1, #100]	
lab58: 	lsls	r1, r2, #28
	bpl	lab59
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	lab59
	and	r3, r2, #26
	cmp	r3, #10
	beq	lab60
lab78: 	str	r3, [sp, #64]	
	movs	r3, #0
	strd	r3, r3, [sp, #68]	
	strd	r3, r3, [sp, #40]	
	str	r3, [sp, #32]
	add	r9, sp, #76	
	str	r3, [sp, #36]	
	str	r3, [sp, #12]
lab111: 	cmp	r3, #0
	beq	lab61
	mov	r4, r7
	b	lab62
lab64: 	cmp	r3, #0
	beq	lab63
lab62: 	cmp	r3, #37	
	bne	lab64
	subs	r5, r4, r7
	bne	lab65
lab89: 	cmp	r3, #0
	beq	lab61
	mov	r3, #0
	movs	r5, #0
	strb	r3, [sp, #59]	
	adds	r7, r4, #1
	ldrb	r3, [r4, #1]
	str	r5, [sp, #8]
	mov	fp, #4294967295	
	movs	r4, #43	
lab70: lab68: 	cmp	r2, #90	
	bhi	lab66
	tbh	[pc, r2, lsl #1]
	.ltorg
		0x007e
	sub	r2, r3, #48	
	movs	r1, #0
lab67: 	add	r1, r1, r1, lsl #2
	add	r1, r2, r1, lsl #1
	sub	r2, r3, #48	
	cmp	r2, #9
	bls	lab67
	str	r1, [sp, #8]
	b	lab68
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
	bne	lab69
lab129: 	b	lab70
	ldrb	r3, [r7, #0]
	orr	r5, r5, #32
	b	lab70
	orr	r5, r5, #16
	lsls	r4, r5, #26
	ldr	r6, [sp, #16]
	bpl	lab71
	adds	r6, #7
	bic	r6, r6, #7
	mov	r2, r6
	ldr	r3, [r6, #4]
	ldr	r6, [r2], #8
	str	r2, [sp, #16]
	mov	r8, r3
lab118: 	blt	lab72
	cmp	fp, #4294967295	
	beq	lab73
	orrs	r3, r6, r8
	bic	sl, r5, #128	
	beq	lab74
lab132: 	sbcs	r3, r8, #0
	bcs	lab75
lab173: 	movs	r3, #1
	strb	r6, [sp, #239]	
	mov	r5, sl
	str	r3, [sp, #0]
	add	r4, sp, #239	
lab87: 	ldrb	r3, [sp, #59]	
	cmp	r8, fp
	it	lt
	movlt	r8, fp
	cmp	r3, #0
	beq	lab76
	add	r8, r8, #1
	b	lab76
lab59: 	ldr	r5, [sp, #4]
	ldr	r0, [sp, #20]
	mov	r1, r5
push {r1, r2}
	mov.w r1, #6730
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6730
	mov.w r2, #1610612736 
	bne	lab77
	ldrh	r2, [r5, #12]
	and	r3, r2, #26
	cmp	r3, #10
	bne	lab78
lab60: 	ldr	r1, [sp, #4]
	ldrsh	r3, [r1, #14]
	cmp	r3, #0
	blt	lab78
	ldr	r3, [r1, #100]	
	lsls	r6, r3, #31
	bmi	lab79
	lsls	r5, r2, #22
	bpl	lab80
lab79: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	mov	r3, r4
	mov	r2, r7
	add	sp, #244	
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__sbprintf
	orr	r5, r5, #16
	ands	r8, r5, #32
	beq	lab81
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r3, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r3], #8
	str	r3, [sp, #16]
lab115: 	movs	r3, #0
lab125: 	strb	r2, [sp, #59]	
lab176: 	beq	lab82
	orrs	r2, r6, r8
	bic	r5, sl, #128	
	bne	lab83
	cmp	fp, #0
	bne	lab84
	cmp	r3, #0
	bne	lab85
	ands	r3, sl, #1
	str	r3, [sp, #0]
	beq	lab86
	movs	r3, #48	
	strb	r3, [sp, #239]	
	add	r4, sp, #239	
	b	lab87
lab63: 	subs	r5, r4, r7
	beq	lab61
lab65: 	ldr	r3, [sp, #68]	
	ldr	r2, [sp, #72]	
	adds	r3, #1
	add	r2, r5
	cmp	r3, #7
	strd	r7, r5, [r9]
	str	r2, [sp, #72]	
	str	r3, [sp, #68]	
	bgt	lab88
	add	r9, r9, #8
lab92: 	add	r3, r5
	str	r3, [sp, #12]
	b	lab89
lab88: 	cmp	r2, #0
	beq	lab90
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #5222
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5222
	mov.w r2, #1610612736 
	add	r9, sp, #76	
	b	lab92
lab61: 	ldr	r3, [sp, #72]	
	cmp	r3, #0
	bne	lab93
lab198: 	str	r3, [sp, #68]	
lab91: 	ldr	r2, [sp, #4]
	ldr	r3, [r2, #100]	
	lsls	r1, r3, #31
	bpl	lab94
	ldrh	r3, [r2, #12]
lab112: 	bmi	lab95
lab200: 	add	sp, #244	
	cpsid f
	push {r1, r2}
	mov.w r1, #3033
	mov.w r2, #1610612736 
lab57: 	ldr	r3, [sp, #4]
	ldrsh	r1, [r3, #12]
	lsls	r5, r1, #22
	uxth	r2, r1
	bmi	lab96
	mov	r5, r3
	ldr	r0, [r3, #88]	
	bl	__retarget_lock_acquire_recursive
	ldrsh	r1, [r5, #12]
	uxth	r2, r1
	b	lab96
lab66: 	cmp	r3, #0
	beq	lab61
	strb	r3, [sp, #140]	
	mov	r8, #1
	mov	r3, #0
	strb	r3, [sp, #59]	
	str	r8, [sp]
	add	r4, sp, #140	
lab122: lab76: 	ands	r3, r5, #2
	str	r3, [sp, #24]
	it	ne
	addne	r8, r8, #2
	ands	r3, r5, #132	
	str	r3, [sp, #28]
	bne	lab97
	ldr	r3, [sp, #8]
	sub	r6, r3, r8
	cmp	r6, #0
	bgt	lab98
lab97: 	ldrd	r2, r1, [sp, #68]	
	adds	r0, r2, #1
lab162: 	cbz	r6, lab99
	add	r2, sp, #59	
	adds	r1, #1
	str	r2, [r9]
	cmp	r0, #7
	mov	r2, #1
	strd	r0, r1, [sp, #68]	
	str	r2, [r9, #4]
	bgt	lab100
lab185: 	add	r9, r9, #8
	adds	r0, #1
lab99: 	ldr	r3, [sp, #24]
	cbz	r3, lab101
	add	r3, sp, #60	
	adds	r1, #2
	str	r3, [r9]
	cmp	r0, #7
	mov	r3, #2
	strd	r0, r1, [sp, #68]	
	str	r3, [r9, #4]
	ble	lab102
	cmp	r1, #0
	beq	lab103
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #3448
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3448
	mov.w r2, #1610612736 
	bne	lab91
	ldrd	r2, r1, [sp, #68]	
	add	r9, sp, #76	
	adds	r0, r2, #1
lab101: 	ldr	r3, [sp, #28]
	cmp	r3, #128	
	beq	lab104
lab137: 	sub	r6, fp, r3
	cmp	r6, #0
	bgt	lab105
lab145: 	str	r4, [r9]
	add	r1, r3
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	
	str	r3, [r9, #4]
	ble	lab106
	cmp	r1, #0
	beq	lab107
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #6080
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6080
	mov.w r2, #1610612736 
	bne	lab91
	ldr	r1, [sp, #72]	
	add	r9, sp, #76	
lab136: 	bpl	lab108
	ldr	r3, [sp, #8]
	sub	r4, r3, r8
	cmp	r4, #0
	bgt	lab109
lab108: 	ldrd	r2, r3, [sp, #8]
	cmp	r2, r8
	ite	ge
	addge	r3, r3, r2
	addlt	r3, r8
	str	r3, [sp, #12]
	cmp	r1, #0
	bne	lab110
lab153: 	str	r3, [sp, #68]	
	add	r9, sp, #76	
	b	lab111
lab94: 	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #12]
	lsls	r2, r3, #22
	bmi	lab112
	ldr	r4, [sp, #4]
	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	ldrh	r3, [r4, #12]
	b	lab112
lab81: 	ands	r3, r5, #16
	bne	lab113
	ands	r2, r5, #64	
	beq	lab114
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	mov	r8, r3
	uxth	r6, r6
	b	lab115
lab71: 	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	lsls	r0, r5, #27
	bmi	lab116
	lsls	r1, r5, #25
	bpl	lab117
	sbfx	r8, r3, #15, #1
	sxth	r6, r3
	mov	r3, r8
	b	lab118
	ldr	r6, [sp, #16]
	ldr	r4, [r6], #4
	mov	r3, #0
	strb	r3, [sp, #59]	
	cmp	r4, #0
	beq	lab119
	cmp	fp, #4294967295	
	beq	lab120
	mov	r2, fp
	movs	r1, #0
	mov	r0, r4
	bl	memchr
	cmp	r0, #0
	beq	lab121
	subs	r3, r0, r4
	str	r3, [sp, #0]
	str	r6, [sp, #16]
	mov	fp, #0
	b	lab87
	ldr	r6, [sp, #16]
	mov	r3, #0
	strb	r3, [sp, #59]	
	mov	r8, #1
	ldr	r3, [r6], #4
	strb	r3, [sp, #140]	
	str	r6, [sp, #16]
	str	r8, [sp]
	add	r4, sp, #140	
	b	lab122
lab56: 	bl	__sinit
	b	lab55
	ldr	r3, [sp, #16]
	ldr	r2, [r3], #4
	str	r2, [sp, #8]
	cmp	r2, #0
	bge	lab123
	ldr	r2, [sp, #8]
	str	r3, [sp, #16]
	negs	r2, r2
	str	r2, [sp, #8]
	ldrb	r3, [r7, #0]
	orr	r5, r5, #4
	b	lab70
	ldrb	r3, [r7, #0]
	cmp	r3, #108	
	ittte	eq
	ldrbeq	r3, [r7, #1]
	orreq	r5, r5, #32
	addeq	r7, #1
	orrne	r5, r5, #16
	b	lab70
	ldrb	r3, [r7, #0]
	cmp	r3, #104	
	ittte	eq
	ldrbeq	r3, [r7, #1]
	orreq	r5, r5, #512	
	addeq	r7, #1
	orrne	r5, r5, #64	
	b	lab70
	orr	sl, r5, #16
lab182: 	beq	lab124
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r3, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r3], #8
	str	r3, [sp, #16]
	movs	r3, #1
	b	lab125
	ldrb	r3, [r7, #0]
	strb	r4, [sp, #59]	
	b	lab70
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
	b	lab125
	lsls	r6, r5, #26
	bmi	lab126
	lsls	r4, r5, #27
	bmi	lab127
	lsls	r0, r5, #25
	bmi	lab128
	lsls	r1, r5, #22
	bpl	lab127
	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	strb	r2, [r3, #0]
	b	lab111
	ldrb	r3, [r7, #0]
	orr	r5, r5, #1
	b	lab70
	ldrb	r3, [sp, #59]	
	cmp	r3, #0
	bne	lab129
	movs	r3, #32
	strb	r3, [sp, #59]	
	ldrb	r3, [r7, #0]
	b	lab70
	ldrb	r3, [r7, #0]
	orr	r5, r5, #128	
	b	lab70
	mov	r1, r7
	ldrb	r3, [r1], #1
	cmp	r3, #42	
	beq	lab130
	sub	r2, r3, #48	
	cmp	r2, #9
	mov	r7, r1
	mov	fp, #0
	bhi	lab68
lab131: 	add	fp, fp, fp, lsl #2
	add	fp, r2, fp, lsl #1
	sub	r2, r3, #48	
	cmp	r2, #9
	bls	lab131
	b	lab68
lab83: 	mov	sl, r5
lab82: 	cmp	r3, #1
	beq	lab132
lab193: 	add	r4, sp, #240	
	bne	lab133
	ldr	r2, [sp, #32]
lab134: 	lsrs	r6, r6, #4
	ldrb	r3, [r2, r3]
	strb	r3, [r4, #-1]!
	orr	r6, r6, r8, lsl #28
	mov	r8, r8, lsr #4
	orrs	r3, r6, r8
	bne	lab134
lab135: 	subs	r3, r3, r4
	mov	r5, sl
	str	r3, [sp, #0]
	b	lab87
lab133: 	and	r3, r6, #7
	lsrs	r6, r6, #3
	orr	r6, r6, r8, lsl #29
	mov	r8, r8, lsr #3
	adds	r3, #48	
	orrs	r1, r6, r8
	mov	r2, r4
	strb	r3, [r4, #-1]!
	bne	lab133
	tst	sl, #1
	beq	lab135
	cmp	r3, #48	
	beq	lab135
	movs	r3, #48	
	subs	r2, #2
	strb	r3, [r4, #-1]
	add	r3, sp, #240	
	subs	r3, r3, r2
	mov	r5, sl
	str	r3, [sp, #0]
	mov	r4, r2
	b	lab87
lab171: 	str	r4, [sp, #76]	
	movs	r3, #1
	str	r1, [sp, #80]	
	str	r1, [sp, #72]	
	str	r3, [sp, #68]	
	add	r9, sp, #76	
lab106: 	add	r9, r9, #8
	b	lab136
lab104: 	ldr	r3, [sp, #8]
	sub	r6, r3, r8
	cmp	r6, #0
	ble	lab137
	cmp	r6, #16
	ble	lab138
	ldr	sl, =zeroes.0	
	mov	r3, sl
	strd	fp, r4, [sp, #24]
	mov	sl, r7
	ldr	fp, [sp, #20]
	ldr	r4, [sp, #4]
	mov	r7, r5
	mov	r5, r3
	b	lab139
lab141: 	add	r9, r9, #8
	mov	r2, r0
lab154: 	cmp	r6, #16
	ble	lab140
lab139: 	adds	r0, r2, #1
	adds	r1, #16
	movs	r3, #16
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	
	str	r5, [r9]
	str	r3, [r9, #4]
	ble	lab141
	add	r2, sp, #64	
	cmp	r1, #0
	beq	lab142
	mov	r1, r4
	mov	r0, fp
	add	r9, sp, #76	
push {r1, r2}
	mov.w r1, #6596
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6596
	mov.w r2, #1610612736 
	bne	lab91
	ldrd	r2, r1, [sp, #68]	
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	bgt	lab139
lab140: 	ldrd	fp, r4, [sp, #24]
	mov	r3, r5
	mov	r5, r7
	mov	r7, sl
	mov	sl, r3
lab201: 	cmp	ip, #7
	strd	ip, r1, [sp, #68]	
	str	sl, [r9]
	str	r6, [r9, #4]
	ble	lab143
	cmp	r1, #0
	beq	lab144
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #3809
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3809
	mov.w r2, #1610612736 
	bne	lab91
	ldr	r3, [sp, #0]
	ldrd	r2, r1, [sp, #68]	
	sub	r6, fp, r3
	cmp	r6, #0
	add	r0, r2, #1
	add	r9, sp, #76	
	ble	lab145
lab105: 	cmp	r6, #16
	ldr	sl, =zeroes.0	
	ble	lab146
	mov	r3, sl
	strd	r4, r5, [sp, #24]
	mov	sl, r7
	ldr	r4, [sp, #20]
	ldr	r5, [sp, #4]
	mov	fp, #16
	mov	r7, r3
	b	lab147
lab149: 	add	r9, r9, #8
	mov	r2, r0
lab152: 	cmp	r6, #16
	ble	lab148
lab147: 	adds	r0, r2, #1
	adds	r1, #16
	cmp	r0, #7
	strd	r7, fp, [r9]
	strd	r0, r1, [sp, #68]	
	ble	lab149
	add	r2, sp, #64	
	cbz	r1, lab150
	mov	r1, r5
	mov	r0, r4
	add	r9, sp, #76	
push {r1, r2}
	mov.w r1, #2378
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2378
	mov.w r2, #1610612736 
	bne	lab91
	ldrd	r2, r1, [sp, #68]	
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	bgt	lab147
lab148: 	ldrd	r4, r5, [sp, #24]
	mov	r3, r7
	mov	r0, ip
	mov	r7, sl
	mov	sl, r3
lab146: 	add	r1, r6
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	
	str	sl, [r9]
	str	r6, [r9, #4]
	bgt	lab151
	add	r9, r9, #8
	adds	r0, #1
	b	lab145
lab150: 	mov	ip, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab152
lab110: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #1501
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1501
	mov.w r2, #1610612736 
	beq	lab153
	b	lab91
lab142: 	mov	ip, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab154
lab100: 	cmp	r1, #0
	beq	lab155
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #3954
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3954
	mov.w r2, #1610612736 
	bne	lab91
	ldrd	r2, r1, [sp, #68]	
	add	r9, sp, #76	
	adds	r0, r2, #1
	b	lab99
lab196: 	add	r3, sp, #60	
	str	r1, [sp, #80]	
	str	r3, [sp, #76]	
	movs	r0, #1
	add	r9, sp, #76	
lab102: 	mov	r2, r0
lab179: 	adds	r0, r2, #1
	b	lab101
lab98: 	cmp	r6, #16
	ble	lab156
	ldrd	ip, r1, [sp, #68]	
	ldr	sl, =blanks.1	
	strd	fp, r4, [sp, #48]	
	movs	r3, #16
	mov	r4, sl
	ldr	fp, [sp, #4]
	ldr	sl, [sp, #20]
	mov	r2, ip
	b	lab157
	.ltorg
lab159: 	add	r9, r9, #8
	mov	r2, r0
lab163: 	cmp	r6, #16
	ble	lab158
lab157: 	adds	r0, r2, #1
	adds	r1, #16
	cmp	r0, #7
	strd	r4, r3, [r9]
	strd	r0, r1, [sp, #68]	
	ble	lab159
	add	r2, sp, #64	
	cbz	r1, lab160
	mov	r1, fp
	mov	r0, sl
	add	r9, sp, #76	
push {r1, r2}
	mov.w r1, #339
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #339
	mov.w r2, #1610612736 
	bne	lab91
	ldrd	r2, r1, [sp, #68]	
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	mov	r3, #16
	bgt	lab157
lab158: 	mov	sl, r4
	ldr	fp, [sp, #48]	
	ldr	r4, [sp, #52]	
	mov	r2, ip
lab197: 	cmp	r2, #7
	strd	r2, r1, [sp, #68]	
	str	sl, [r9]
	str	r6, [r9, #4]
	bgt	lab161
	add	r9, r9, #8
	adds	r0, r2, #1
	b	lab162
lab160: 	mov	r2, r1
	mov	ip, #1
	add	r9, sp, #76	
	b	lab163
lab107: 	lsls	r4, r5, #29
	str	r1, [sp, #68]	
	bpl	lab164
	ldr	r3, [sp, #8]
	sub	r4, r3, r8
	cmp	r4, #0
	ble	lab164
	add	r9, sp, #76	
lab109: 	cmp	r4, #16
	ble	lab165
	ldr	sl, =blanks.1	
	ldr	r2, [sp, #68]	
	ldr	r6, [sp, #20]
	ldr	fp, [sp, #4]
	mov	r3, sl
	movs	r5, #16
	mov	sl, r7
	mov	r7, r3
	b	lab166
lab168: 	add	r9, r9, #8
	mov	r2, r3
lab170: 	cmp	r4, #16
	ble	lab167
lab166: 	adds	r3, r2, #1
	adds	r1, #16
	cmp	r3, #7
	strd	r7, r5, [r9]
	strd	r3, r1, [sp, #68]	
	ble	lab168
	add	r2, sp, #64	
	cbz	r1, lab169
	mov	r1, fp
	mov	r0, r6
push {r1, r2}
	mov.w r1, #4802
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4802
	mov.w r2, #1610612736 
	bne	lab91
	ldrd	r2, r1, [sp, #68]	
	subs	r4, #16
	cmp	r4, #16
	add	r0, r2, #1
	add	r9, sp, #76	
	bgt	lab166
lab167: 	mov	r3, r7
	mov	r7, sl
	mov	sl, r3
lab199: 	cmp	r0, #7
	strd	sl, r4, [r9]
	strd	r0, r1, [sp, #68]	
	ble	lab108
	cbz	r1, lab164
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #311
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #311
	mov.w r2, #1610612736 
	bne	lab91
	ldr	r1, [sp, #72]	
	b	lab108
lab169: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab170
lab164: 	ldrd	r2, r3, [sp, #8]
	cmp	r2, r8
	ite	ge
	addge	r3, r3, r2
	addlt	r3, r8
	str	r3, [sp, #12]
	b	lab153
lab151: 	cmp	r1, #0
	beq	lab171
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #6237
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6237
	mov.w r2, #1610612736 
	bne	lab91
	ldr	r0, [sp, #68]	
	ldr	r1, [sp, #72]	
	adds	r0, #1
	add	r9, sp, #76	
	b	lab145
lab155: 	ldr	r3, [sp, #24]
	cmp	r3, #0
	bne	lab172
lab103: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab101
lab90: 	str	r2, [sp, #68]	
	add	r9, sp, #76	
	b	lab92
lab74: 	cmp	fp, #0
	bne	lab173
	mov	r5, sl
lab85: 	mov	fp, #0
	str	fp, [sp]
	add	r4, sp, #240	
	b	lab87
lab124: 	ands	r3, sl, #16
	bne	lab174
	ands	r2, sl, #64	
	beq	lab175
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	mov	r8, r3
	uxth	r6, r6
	movs	r3, #1
	b	lab125
lab72: 	movs	r3, #45	
	negs	r6, r6
	strb	r3, [sp, #59]	
	sbc	r8, r8, r8, lsl #1
	mov	sl, r5
	movs	r3, #1
	b	lab176
lab161: 	cmp	r1, #0
	beq	lab177
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #3419
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3419
	mov.w r2, #1610612736 
	bne	lab91
	ldrd	r2, r1, [sp, #68]	
	add	r9, sp, #76	
	adds	r0, r2, #1
	b	lab162
lab123: 	str	r3, [sp, #16]
	ldrb	r3, [r7, #0]
	b	lab70
lab86: 	add	r4, sp, #240	
	b	lab87
lab143: 	add	r9, r9, #8
	add	r0, ip, #1
	mov	r2, ip
	b	lab137
lab117: 	lsls	r2, r5, #22
	bmi	lab178
lab116: 	mov	r8, r3, asr #31
	mov	r6, r3
	mov	r3, r8
	b	lab118
lab174: 	ldr	r3, [sp, #16]
	ldr	r6, [r3], #4
	str	r3, [sp, #16]
	movs	r3, #1
	b	lab125
lab69: 	ldr	r3, [sp, #36]	
	cmp	r3, #0
	beq	lab129
	ldr	r3, [sp, #36]	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab129
	ldrb	r3, [r7, #0]
	orr	r5, r5, #1024	
	b	lab70
lab126: 	ldrd	r1, r6, [sp, #12]
	ldr	r2, [r6], #4
	str	r6, [sp, #16]
	asrs	r3, r1, #31
	strd	r1, r3, [r2]
	b	lab111
lab113: 	ldr	r3, [sp, #16]
	ldr	r6, [r3], #4
	str	r3, [sp, #16]
	b	lab115
lab172: 	movs	r1, #2
	add	r3, sp, #60	
	str	r1, [sp, #80]	
	str	r3, [sp, #76]	
	add	r9, sp, #76	
	b	lab179
	ldr	r2, [pc, #300]	
	str	r2, [sp, #32]
lab183: 	beq	lab180
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r2, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r2], #8
	str	r2, [sp, #16]
lab187: 	bpl	lab181
	orrs	r2, r6, r8
	beq	lab181
	strb	r3, [sp, #61]	
	movs	r3, #48	
	orr	r5, r5, #2
	strb	r3, [sp, #60]	
lab181: 	bic	sl, r5, #1024	
	movs	r3, #2
	b	lab125
	mov	sl, r5
	b	lab182
	ldr	r2, [pc, #236]	
	str	r2, [sp, #32]
	b	lab183
lab120: 	mov	r0, r4
	str	r6, [sp, #16]
	bl	strlen
	mov	fp, #0
	str	r0, [sp, #0]
	b	lab87
lab177: 	ldrb	r2, [sp, #59]	
	cmp	r2, #0
	beq	lab184
	movs	r0, #1
	add	r2, sp, #59	
	str	r0, [sp, #80]	
	str	r2, [sp, #76]	
	add	r9, sp, #76	
	mov	r1, r0
	b	lab185
lab180: 	ands	r2, r5, #16
	beq	lab186
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	b	lab187
lab75: 	and	r3, sl, #1024	
	str	fp, [sp]
	str	r9, [sp, #24]
	mov	fp, r7
	ldr	r9, [sp, #36]	
	movs	r5, #0
	add	r4, sp, #240	
	mov	r7, r3
	b	lab188
lab190: 	mov	r1, r8
push {r1, r2}
	mov.w r1, #3404
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3404
	mov.w r2, #1610612736 
	sbcs	r3, r8, #0
	bcc	lab189
lab195: 	mov	r8, r1
lab188: 	mov	r0, r6
	mov	r1, r8
	movs	r2, #10
	movs	r3, #0
push {r1, r2}
	mov.w r1, #793
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #793
	mov.w r2, #1610612736 
	adds	r1, #48	
	strb	r1, [r4, #-1]
	movs	r2, #10
	movs	r3, #0
	subs	r4, #1
	adds	r5, #1
	cmp	r7, #0
	beq	lab190
	ldrb	r1, [r9]
	cmp	r1, r5
	bne	lab190
	cmp	r5, #255	
	beq	lab190
	cmp	r6, #10
	sbcs	r3, r8, #0
	bcs	lab191
lab189: 	add	r3, sp, #240	
	subs	r3, r3, r4
	str	r9, [sp, #36]	
	mov	r7, fp
	ldr	r9, [sp, #24]
	ldr	fp, [sp]
	str	r3, [sp, #0]
	mov	r5, sl
	b	lab87
lab186: 	ands	r1, r5, #64	
	beq	lab192
	ldr	r1, [sp, #16]
	ldr	r6, [r1], #4
	str	r1, [sp, #16]
	mov	r8, r2
	uxth	r6, r6
	b	lab187
lab73: 	mov	sl, r5
	b	lab132
lab84: 	cmp	r3, #1
	mov	sl, r5
	bne	lab193
	b	lab173
	nop
	.ltorg
lab127: 	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r2, [r3, #0]
	str	r6, [sp, #16]
	b	lab111
lab119: 	cmp	fp, #6
	mov	r8, fp
	it	cs
	movcs	r8, #6
	ldr	r4, [pc, #320]	
	str	r8, [sp]
	str	r6, [sp, #16]
	b	lab122
lab175: 	ldr	r3, [sp, #16]
	ands	r8, sl, #512	
	ite	ne
	ldrne	r6, [r3], #4
	ldreq	r6, [r3], #4
	str	r3, [sp, #16]
	itt	ne
	movne	r8, r2
	uxtbne	r6, r6
	movs	r3, #1
	b	lab125
lab114: 	ldr	r3, [sp, #16]
	ands	r8, r5, #512	
	ite	ne
	ldrne	r6, [r3], #4
	ldreq	r6, [r3], #4
	str	r3, [sp, #16]
	itt	ne
	movne	r8, r2
	uxtbne	r6, r6
	b	lab115
lab192: 	ldr	r2, [sp, #16]
	ands	r8, r5, #512	
	ite	ne
	ldrne	r6, [r2], #4
	ldreq	r6, [r2], #4
	str	r2, [sp, #16]
	itt	ne
	movne	r8, r1
	uxtbne	r6, r6
	b	lab187
lab191: 	ldr	r3, [sp, #44]	
	ldr	r1, [sp, #40]	
	subs	r4, r4, r3
	mov	r2, r3
	mov	r0, r4
	bl	strncpy
	push {r1, r2}
	mov.w r1, #1307
	mov.w r2, #1610612736 
	cbz	r3, lab194
	add	r9, r9, #1
lab194: 	mov	r0, r6
	mov	r1, r8
	movs	r2, #10
	movs	r3, #0
	movs	r5, #0
push {r1, r2}
	mov.w r1, #5909
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5909
	mov.w r2, #1610612736 
lab144: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	
	b	lab137
lab184: 	ldr	r3, [sp, #24]
	cmp	r3, #0
	bne	lab196
	mov	r2, r1
	movs	r0, #1
	add	r9, sp, #76	
	b	lab137
lab128: 	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	strh	r2, [r3, #0]
	b	lab111
lab178: 	sbfx	r8, r3, #7, #1
	sxtb	r6, r3
	mov	r3, r8
	b	lab118
lab80: 	ldr	r0, [r1, #88]	
	bl	__retarget_lock_release_recursive
	b	lab79
lab121: 	str	fp, [sp]
	str	r6, [sp, #16]
	mov	fp, r0
	b	lab87
lab156: 	ldr	r2, [sp, #68]	
	ldr	r1, [sp, #72]	
	ldr	sl, =blanks.1	
	adds	r2, #1
	b	lab197
lab93: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	
push {r1, r2}
	mov.w r1, #2047
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2047
	mov.w r2, #1610612736 
	beq	lab198
	b	lab91
lab165: 	ldr	r0, [sp, #68]	
	ldr	sl, =blanks.1	
	adds	r0, #1
	b	lab199
lab77: 	ldr	r3, [sp, #4]
	ldr	r3, [r3, #100]	
	lsls	r3, r3, #31
	bmi	lab95
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #12]
	lsls	r7, r3, #22
	bmi	lab95
	ldr	r3, [sp, #4]
	ldr	r0, [r3, #88]	
	bl	__retarget_lock_release_recursive
lab95: 	mov	r3, #4294967295	
	str	r3, [sp, #12]
	b	lab200
lab138: 	ldr	sl, =zeroes.0	
	mov	ip, r0
	b	lab201
lab130: 	ldr	r2, [sp, #16]
	ldrb	r3, [r7, #1]
	mov	r7, r1
	ldr	r1, [r2], #4
	str	r2, [sp, #16]
	orr	fp, r1, r1, asr #31
	b	lab70
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
	mov.w r1, #4551
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4551
	mov.w r2, #1610612736 
	blt	lab202
	mov	r1, sp
	mov	r0, r6
push {r1, r2}
	mov.w r1, #516
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #516
	mov.w r2, #1610612736 
	it	ne
	movne	r5, #4294967295	
lab202: 	ldrh	r3, [sp, #12]
	lsls	r3, r3, #25
	bpl	lab203
	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
lab203: 	ldr	r0, [sp, #88]	
	bl	__retarget_lock_close_recursive
	mov	r0, r5
	addw	sp, sp, #1132	
	cpsid f
	push {r1, r2}
	mov.w r1, #1121
	mov.w r2, #1610612736 
__swsetup_r:
	push	{r3, r4, r5, lr}
	ldr	r3, =_impure_ptr	
	ldr	r3, [r3, #0]
	mov	r5, r0
	mov	r4, r1
	cbz	r3, lab204
	ldr	r2, [r3, #56]	
	cbz	r2, lab205
lab204: 	ldrsh	r3, [r4, #12]
	lsls	r0, r3, #28
	uxth	r2, r3
	bpl	lab206
lab212: 	cmp	r1, #0
	beq	lab207
lab215: 	beq	lab208
	movs	r0, #0
	str	r0, [r4, #8]
	ldr	r0, [r4, #20]
	negs	r0, r0
	str	r0, [r4, #24]
	cbz	r1, lab209
lab210: lab211:	cpsid f
	push {r1, r2}
	mov.w r1, #2382
	mov.w r2, #1610612736 
lab208: 	lsls	r5, r2, #30
	it	pl
	ldrpl	r0, [r4, #20]
	str	r0, [r4, #8]
	cmp	r1, #0
	bne	lab210
lab209: 	lsls	r2, r2, #24
	it	pl
	movpl	r0, r1
	bpl	lab211
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
	mov	r0, #4294967295	
	cpsid f
	push {r1, r2}
	mov.w r1, #1741
	mov.w r2, #1610612736 
lab205: 	mov	r0, r3
	bl	__sinit
	ldrsh	r3, [r4, #12]
	lsls	r0, r3, #28
	uxth	r2, r3
	bmi	lab212
lab206: 	lsls	r1, r2, #27
	bpl	lab213
	lsls	r2, r2, #29
	bmi	lab214
	ldr	r1, [r4, #16]
lab218: 	strh	r3, [r4, #12]
	uxth	r2, r3
	cmp	r1, #0
	bne	lab215
lab207: 	and	r0, r2, #640	
	cmp	r0, #512	
	beq	lab215
	mov	r1, r4
	mov	r0, r5
	bl	__smakebuf_r
	push {r1, r2}
	mov.w r1, #3715
	mov.w r2, #1610612736 
	ldr	r1, [r4, #16]
	uxth	r2, r3
	b	lab215
lab214: 	ldr	r1, [r4, #48]	
	cbz	r1, lab216
	add	r2, r4, #64	
	cmp	r1, r2
	beq	lab217
	mov	r0, r5
push {r1, r2}
	mov.w r1, #12
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #12
	mov.w r2, #1610612736 
lab217: 	movs	r2, #0
	str	r2, [r4, #48]	
lab216: 	ldr	r1, [r4, #16]
	movs	r2, #0
	strd	r1, r2, [r4]
	bic	r3, r3, #36	
	b	lab218
lab213: 	movs	r2, #9
	orr	r3, r3, #64	
	str	r2, [r5, #0]
	mov	r0, #4294967295	
	strh	r3, [r4, #12]
	cpsid f
	push {r1, r2}
	mov.w r1, #7772
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
	cbz	r6, lab219
	mov	r9, #1
	mov	sl, #0
lab225: 	subs	r5, r4, #1
	bmi	lab219
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab221: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab220
lab222: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab221
lab219: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab220: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab222
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab223
	blx	r2
lab228: 	cmp	r2, fp
	bne	lab224
lab227: 	cmp	r3, r6
	beq	lab222
	mov	r6, r3
	cmp	r6, #0
	bne	lab225
	b	lab219
lab223: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab226
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab227
lab224: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab225
	b	lab219
lab226: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab228
	.ltorg
abort:
	push	{r3, lr}
	movs	r0, #6
	bl	raise
	push {r1, r2}
	mov.w r1, #1361
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
	bmi	lab229
	ldr	r3, [r4, #4]
	orr	r2, r2, #2048	
	cmp	r3, #0
	strh	r2, [r4, #12]
	ble	lab230
lab242: 	cmp	r5, #0
	beq	lab231
	movs	r3, #0
	ldr	r6, [r7, #0]
	str	r3, [r7, #0]
	uxth	r3, r2
	ands	r2, r2, #4096	
	bne	lab232
	ldr	r1, [r4, #28]
	movs	r3, #1
	mov	r0, r7
	blx	r5
	adds	r2, r0, #1
	beq	lab233
lab245: 	ldr	r5, [r4, #40]	
lab243: 	bpl	lab234
	ldr	r3, [r4, #4]
	subs	r0, r0, r3
	ldr	r3, [r4, #48]	
	cbz	r3, lab234
	ldr	r3, [r4, #60]	
	subs	r0, r0, r3
lab234: 	ldr	r1, [r4, #28]
	mov	r2, r0
	movs	r3, #0
	mov	r0, r7
	blx	r5
	adds	r1, r0, #1
	bne	lab235
	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq	lab235
	cmp	r3, #29
	beq	lab236
	cmp	r3, #22
	bne	lab237
lab236: 	ldrh	r3, [r4, #12]
	ldr	r2, [r4, #16]
	str	r2, [r4, #0]
	bic	r3, r3, #2048	
	movs	r1, #0
	str	r1, [r4, #4]
	strh	r3, [r4, #12]
lab244: 	str	r6, [r7, #0]
	cbz	r1, lab231
	add	r3, r4, #64	
	cmp	r1, r3
	beq	lab238
	mov	r0, r7
push {r1, r2}
	mov.w r1, #5675
	mov.w r2, #1610612736 
lab238:	push {r1, r2}
	mov.w r1, #5675
	mov.w r2, #1610612736 
	str	r0, [r4, #48]	
	cpsid f
	push {r1, r2}
	mov.w r1, #5597
	mov.w r2, #1610612736 
lab229: 	ldr	r6, [r4, #16]
	cbz	r6, lab231
	uxth	r3, r2
	ldr	r5, [r4, #0]
	str	r6, [r4, #0]
	lsls	r2, r3, #30
	ite	eq
	ldreq	r3, [r4, #20]
	movne	r3, #0
	subs	r5, r5, r6
	str	r3, [r4, #8]
	b	lab239
lab241: 	ldr	r1, [r4, #28]
	mov	r3, r5
	mov	r2, r6
	mov	r0, r7
	blx	ip
	subs	ip, r0, #0
	sub	r5, r5, ip
	add	r6, ip
	ble	lab240
lab239: 	cmp	r5, #0
	bgt	lab241
lab231: 	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #1170
	mov.w r2, #1610612736 
lab230: 	ldr	r3, [r4, #60]	
	cmp	r3, #0
	bgt	lab242
	b	lab231
lab232: 	ldr	r0, [r4, #80]	
	b	lab243
lab235: 	ldrsh	r3, [r4, #12]
	ldr	r2, [r4, #16]
	str	r2, [r4, #0]
	bic	r3, r3, #2048	
	strh	r3, [r4, #12]
	movs	r2, #0
	lsls	r3, r3, #19
	str	r2, [r4, #4]
	bpl	lab244
	str	r0, [r4, #80]	
	b	lab244
lab240: 	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	
	mov	r0, #4294967295	
	strh	r3, [r4, #12]
	cpsid f
	push {r1, r2}
	mov.w r1, #958
	mov.w r2, #1610612736 
lab233: 	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq	lab245
	cmp	r3, #29
	beq	lab246
	cmp	r3, #22
	beq	lab246
lab237: 	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
	cpsid f
	push {r1, r2}
	mov.w r1, #1497
	mov.w r2, #1610612736 
lab246: 	str	r6, [r7, #0]
	b	lab231
	nop
_fflush_r:
	push	{r3, r4, r5, lr}
	mov	r4, r1
	mov	r5, r0
	cbz	r0, lab247
	ldr	r3, [r0, #56]	
	cbz	r3, lab248
lab247: 	ldrsh	r0, [r4, #12]
	cbz	r0, lab249
lab254: 	lsls	r3, r3, #31
	bmi	lab250
	lsls	r1, r0, #22
	bpl	lab251
lab250: 	mov	r0, r5
	mov	r1, r4
push {r1, r2}
	mov.w r1, #4955
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4955
	mov.w r2, #1610612736 
	lsls	r2, r3, #31
	mov	r5, r0
	bmi	lab252
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #22
	bpl	lab253
lab252: 	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #4287
	mov.w r2, #1610612736 
lab248: 	bl	__sinit
	ldrsh	r0, [r4, #12]
	cmp	r0, #0
	bne	lab254
lab249: 	mov	r5, r0
	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #6467
	mov.w r2, #1610612736 
lab251: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_acquire_recursive
	b	lab250
lab253: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #2642
	mov.w r2, #1610612736 
	nop
_cleanup_r:
	ldr	r1, =0x0000b265	
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
	bne	lab255
	ldr	r5, [sl, #4]
	ldr	r2, =0x00009849	
	str	r2, [sl, #60]	
	movs	r3, #3
	strd	r4, r3, [sl, #736]	
	ldr	r9, =0x0000ae8d	
	ldr	r8, =0x0000aeb1	
	ldr	r7, =0x0000aef1	
	ldr	r6, =0x0000af11	
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
	mov.w r1, #3539
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3539
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
	mov.w r1, #5851
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5851
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
	mov.w r1, #2874
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2874
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
lab255: 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
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
	ldr	r3, =_impure_ptr	
	ldr	r5, =0x0001b99c	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab256
	subs	r3, #4
	add	r5, r3
lab257: 	ldr	r3, [r5], #-4
	
	push {r1, r2}
	mov.w r1, #6423
	mov.w r2, #1610612736 
	cmp	r4, #0
	push {r1, r2}
	mov.w r1, #6423
	mov.w r2, #1610612736 
lab256: 	ldmia	sp!, {r3, r4, r5, lr}
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
	bne	lab258
	add	r3, r8, #4294967295	
	cmp	r3, #254	
	bls	lab259
lab258: 	mov	r2, r8
	add	r3, r4, #92	
	add	r1, sp, #4
	mov	r0, r7
	bl	_wcrtomb_r
	push {r1, r2}
	mov.w r1, #5288
	mov.w r2, #1610612736 
	mov	r6, r0
	beq	lab260
	cbz	r0, lab261
	ldrb	ip, [sp, #4]
lab266: 	movs	r5, #0
	b	lab262
lab263: 	adds	r2, r3, #1
	str	r2, [r4, #0]
	strb	ip, [r3]
lab265: 	cmp	r5, r6
	bcs	lab261
	ldrb	ip, [r9], #1
lab262: 	ldr	r3, [r4, #8]
	subs	r3, #1
	cmp	r3, #0
	str	r3, [r4, #8]
	bge	lab263
	ldr	lr, [r4, #24]
	cmp	r3, lr
	mov	r1, ip
	mov	r2, r4
	mov	r0, r7
	blt	lab264
	cmp	ip, #10
	bne	lab263
lab264: 	bl	__swbuf_r
	push {r1, r2}
	mov.w r1, #2583
	mov.w r2, #1610612736 
	bne	lab265
	mov	r6, r0
	mov	r0, r6
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #5792
	mov.w r2, #1610612736 
lab261: 	mov	r6, r8
	mov	r0, r6
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #2289
	mov.w r2, #1610612736 
lab259: 	uxtb	ip, r8
	strb	ip, [sp, #4]
	mov	r6, r0
	b	lab266
lab260: 	ldrh	r3, [r4, #12]
	mov	r0, r6
	orr	r3, r3, #64	
	strh	r3, [r4, #12]
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #4731
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
	bne	lab267
	lsls	r0, r3, #22
	bpl	lab268
lab267: 	lsls	r0, r2, #18
	bmi	lab269
	ldr	r2, [r4, #100]	
	orr	r3, r3, #8192	
	orr	r2, r2, #8192	
	strh	r3, [r4, #12]
	str	r2, [r4, #100]	
lab269: 	mov	r2, r4
	mov	r0, r5
	bl	__fputwc
	push {r1, r2}
	mov.w r1, #1602
	mov.w r2, #1610612736 
	lsls	r2, r3, #31
	mov	r5, r0
	bmi	lab270
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #22
	bpl	lab271
lab270: 	mov	r0, r5
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #5848
	mov.w r2, #1610612736 
lab271: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #5476
	mov.w r2, #1610612736 
lab268: 	ldr	r0, [r4, #88]	
	str	r1, [sp, #4]
	bl	__retarget_lock_acquire_recursive
	ldrsh	r3, [r4, #12]
	ldr	r1, [sp, #4]
	uxth	r2, r3
	b	lab267
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
	blt	lab272
	movs	r1, #0
	mov	r0, r6
push {r1, r2}
	mov.w r1, #6610
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6610
	mov.w r2, #1610612736 
	add	r3, r5
	cmp	r0, r3
	beq	lab273
lab272: 	mov	r0, r6
	bl	__malloc_unlock
	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #3784
	mov.w r2, #1610612736 
lab273: 	negs	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #7248
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7248
	mov.w r2, #1610612736 
	beq	lab274
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
	mov.w r1, #3646
	mov.w r2, #1610612736 
lab274: 	movs	r1, #0
	mov	r0, r6
push {r1, r2}
	mov.w r1, #6953
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6953
	mov.w r2, #1610612736 
	subs	r3, r0, r2
	cmp	r3, #15
	ble	lab272
	orr	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, =__malloc_sbrk_base	
	ldr	r1, =__malloc_current_mallinfo	
	ldr	r3, [r3, #0]
	subs	r0, r0, r3
	str	r0, [r1, #0]
	b	lab272
	nop
	.ltorg
_free_r:
	cmp	r1, #0
	beq	lab275
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
	beq	lab276
	lsls	r2, r2, #31
	str	r3, [ip, #4]
	bmi	lab277
	ldr	r2, [r4, #-8]
	subs	r5, r5, r2
	add	r1, r2
	ldr	r2, [r5, #8]
	add	r0, r7, #8
	cmp	r2, r0
	beq	lab278
	add	r4, ip, r3
	ldr	lr, [r4, #4]
	ldr	r4, [r5, #12]
	str	r4, [r2, #12]
	tst	lr, #1
	str	r2, [r4, #8]
	beq	lab279
	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [ip]
lab283: 	bcs	lab280
lab284: 	lsrs	r3, r1, #3
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
lab291: 	ldmia	sp!, {r3, r4, r5, r6, r7, lr}
	b	__malloc_unlock
lab277: 	add	r2, ip, r3
	ldr	r2, [r2, #4]
	lsls	r0, r2, #31
	bmi	lab281
	add	r1, r3
	add	r0, r7, #8
lab295: 	cmp	r3, r0
	beq	lab282
	ldr	r2, [ip, #12]
	str	r2, [r3, #12]
	str	r3, [r2, #8]
	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [r5, r1]
	b	lab283
lab275:	cpsid f
	push {r1, r2}
	mov.w r1, #4864
	mov.w r2, #1610612736 
lab281: 	orr	r3, r1, #1
	cmp	r1, #512	
	str	r3, [r4, #-4]
	str	r1, [ip]
	bcc	lab284
lab280: 	cmp	r1, #2560	
	mov	r3, r1, lsr #9
	bcs	lab285
	lsrs	r3, r1, #6
	add	r0, r3, #57	
	add	r2, r3, #56	
	lsls	r3, r0, #3
lab294: 	ldr	r3, [r7, r3]
	subs	r0, #8
	cmp	r0, r3
	beq	lab286
lab288: 	bic	r2, r2, #3
	cmp	r2, r1
	bls	lab287
	ldr	r3, [r3, #8]
	cmp	r0, r3
	bne	lab288
lab287: 	ldr	r0, [r3, #12]
lab296: 	str	r5, [r0, #8]
	str	r5, [r3, #12]
	mov	r0, r6
	ldmia	sp!, {r3, r4, r5, r6, r7, lr}
	b	__malloc_unlock
lab278: 	add	r2, ip, r3
	ldr	r2, [r2, #4]
	lsls	r2, r2, #31
	bmi	lab289
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
lab276: 	add	r3, r1
	lsls	r1, r2, #31
	bmi	lab290
	ldr	r2, [r4, #-8]
	subs	r5, r5, r2
	add	r3, r2
	ldrd	r1, r2, [r5, #8]
	str	r2, [r1, #12]
	str	r1, [r2, #8]
lab290: 	orr	r2, r3, #1
	str	r2, [r5, #4]
	ldr	r2, =__malloc_trim_threshold	
	str	r5, [r7, #8]
	ldr	r2, [r2, #0]
	cmp	r2, r3
	bhi	lab291
	ldr	r3, =__malloc_top_pad	
	mov	r0, r6
	ldr	r1, [r3, #0]
	bl	_malloc_trim_r
	push {r1, r2}
	mov.w r1, #3529
	mov.w r2, #1610612736 
lab285: 	cmp	r3, #20
	bls	lab292
	cmp	r3, #84	
	bhi	lab293
	lsrs	r3, r1, #12
	add	r0, r3, #111	
	add	r2, r3, #110	
	lsls	r3, r0, #3
	b	lab294
lab279: 	add	r1, r3
	b	lab295
lab292: 	add	r0, r3, #92	
	add	r2, r3, #91	
	lsls	r3, r0, #3
	b	lab294
lab282: 	orr	r3, r1, #1
	strd	r5, r5, [r7, #16]
	strd	r0, r0, [r5, #8]
	str	r3, [r5, #4]
	str	r1, [r5, r1]
	b	lab291
lab286: 	ldr	r1, [r7, #4]
	asrs	r2, r2, #2
	movs	r4, #1
	lsl	r2, r4, r2
	orrs	r2, r1
	str	r2, [r7, #4]
	b	lab296
lab293: 	cmp	r3, #340	
	bhi	lab297
	lsrs	r3, r1, #15
	add	r0, r3, #120	
	add	r2, r3, #119	
	lsls	r3, r0, #3
	b	lab294
lab297: 	movw	r2, #1364	
	cmp	r3, r2
	bhi	lab298
	lsrs	r3, r1, #18
	add	r0, r3, #125	
	add	r2, r3, #124	
	lsls	r3, r0, #3
	b	lab294
lab298: 	mov	r3, #1016	
	movs	r2, #126	
	b	lab294
lab289: 	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [ip]
	b	lab291
	nop
	.ltorg
__sfvwrite_r:
	ldr	r3, [r2, #8]
	cmp	r3, #0
	beq	lab299
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldrsh	r3, [r1, #12]
	mov	r4, r1
	lsls	r1, r3, #28
	mov	r8, r0
	sub	sp, #12
	mov	r7, r2
	uxth	r0, r3
	bpl	lab300
	ldr	r3, [r4, #16]
	cbz	r3, lab300
	ands	r3, r0, #2
	ldr	r5, [r7, #0]
	beq	lab301
lab306: 	ldr	fp, =0x7ffffc00	
	mov	r6, sl
lab304: 	mov	r3, r6
	mov	r2, sl
	it	cs
	movcs	r3, fp
	mov	r0, r8
	cmp	r6, #0
	beq	lab302
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #36]	
	blx	ip
	cmp	r0, #0
	ble	lab303
	ldr	r3, [r7, #8]
	subs	r3, r3, r0
	add	sl, r0
	subs	r6, r6, r0
	str	r3, [r7, #8]
	cmp	r3, #0
	bne	lab304
lab312: lab336: 	cpsid f
	push {r1, r2}
	mov.w r1, #4542
	mov.w r2, #1610612736 
lab300: 	mov	r1, r4
	mov	r0, r8
push {r1, r2}
	mov.w r1, #7590
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7590
	mov.w r2, #1610612736 
	bne	lab305
	ldrsh	r3, [r4, #12]
	ldr	r5, [r7, #0]
	uxth	r0, r3
	ands	r3, r0, #2
	bne	lab306
lab301: 	ands	r9, r0, #1
	bne	lab307
	mov	r6, r9
lab314: lab313: 	ldr	fp, [r4, #8]
	bpl	lab309
	cmp	fp, r6
	mov	r2, fp
	bhi	lab310
	tst	r0, #1152	
	bne	lab311
	ldr	r0, [r4, #0]
lab329: 	mov	r1, r9
push {r1, r2}
	mov.w r1, #4797
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4797
	mov.w r2, #1610612736 
	ldr	r1, [r4, #0]
	ldr	r2, [sp, #4]
	sub	r3, r3, fp
	add	r2, r1
	mov	sl, r6
	str	r3, [r4, #8]
	str	r2, [r4, #0]
	movs	r6, #0
lab327: 	sub	r0, r0, sl
	add	r9, sl
	str	r0, [r7, #8]
	cmp	r0, #0
	beq	lab312
	ldrsh	r0, [r4, #12]
	uxth	r0, r0
	cmp	r6, #0
	bne	lab313
lab308: 	ldrd	r9, r6, [r5]
	adds	r5, #8
	b	lab314
lab302: 	ldrd	sl, r6, [r5]
	adds	r5, #8
	b	lab304
lab321: 	mov	r0, r8
push {r1, r2}
	mov.w r1, #6466
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6466
	mov.w r2, #1610612736 
lab303: 	ldrsh	r3, [r4, #12]
lab334: 	mov	r0, #4294967295	
	strh	r3, [r4, #12]
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #2190
	mov.w r2, #1610612736 
lab299: 	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #3117
	mov.w r2, #1610612736 
lab307: 	mov	r6, r3
	mov	sl, r5
	mov	r9, r3
	mov	r0, r3
	mov	r5, r3
	cbz	r6, lab316
lab322: lab325: lab335: 	ldr	r0, [r4, #0]
	cmp	r2, r6
	it	cs
	movcs	r2, r6
	cmp	r0, r1
	bls	lab318
	ldr	r1, [r4, #8]
	add	fp, r3, r1
	cmp	r2, fp
	bgt	lab319
lab318: 	cmp	r3, r2
	bgt	lab320
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #36]	
	mov	r2, r5
	mov	r0, r8
	blx	ip
	subs	fp, r0, #0
	ble	lab303
lab330: 	beq	lab321
	movs	r0, #1
lab315: 	ldr	r3, [r7, #8]
	sub	r3, r3, fp
	add	r5, fp
	sub	r6, r6, fp
	str	r3, [r7, #8]
	cmp	r3, #0
	beq	lab312
	cmp	r6, #0
	bne	lab322
lab316: 	add	r3, sl, #8
lab323: 	mov	sl, r3
	adds	r3, #8
	cmp	r6, #0
	beq	lab323
lab317: 	mov	r2, r6
	movs	r1, #10
	mov	r0, r5
	bl	memchr
	cmp	r0, #0
	beq	lab324
	adds	r0, #1
	sub	r9, r0, r5
	b	lab325
lab309: 	ldr	r0, [r4, #0]
	ldr	r3, [r4, #16]
	cmp	r0, r3
	bhi	lab326
	ldr	r3, [r4, #20]
	cmp	r3, r6
	bhi	lab326
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
	ble	lab303
lab328: 	b	lab327
lab326: 	cmp	fp, r6
	mov	sl, fp
	it	cs
	movcs	sl, r6
	mov	r2, sl
	mov	r1, r9
push {r1, r2}
	mov.w r1, #955
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #955
	mov.w r2, #1610612736 
	ldr	r2, [r4, #0]
	sub	r3, r3, sl
	add	r2, sl
	str	r3, [r4, #8]
	str	r2, [r4, #0]
	cmp	r3, #0
	bne	lab328
	mov	r1, r4
	mov	r0, r8
push {r1, r2}
	mov.w r1, #545
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #545
	mov.w r2, #1610612736 
	beq	lab328
	b	lab303
lab310: 	ldr	r0, [r4, #0]
	mov	fp, r6
	mov	r2, r6
	b	lab329
lab320: 	mov	r1, r5
	str	r2, [sp, #4]
push {r1, r2}
	mov.w r1, #4113
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4113
	mov.w r2, #1610612736 
	ldr	r3, [r4, #8]
	subs	r3, r3, r2
	str	r3, [r4, #8]
	ldr	r3, [r4, #0]
	add	r3, r2
	str	r3, [r4, #0]
	mov	fp, r2
	b	lab330
lab311: 	ldr	r3, [r4, #0]
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
	bpl	lab331
	mov	r1, r2
	mov	r0, r8
push {r1, r2}
	mov.w r1, #1113
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1113
	mov.w r2, #1610612736 
	beq	lab332
	mov	r2, fp
	ldr	r1, [r4, #16]
	str	r0, [sp, #4]
	bl	memcpy
	ldrh	r2, [r4, #12]
	ldr	r3, [sp, #4]
	bic	r2, r2, #1152	
	orr	r2, r2, #128	
	strh	r2, [r4, #12]
lab333: 	str	r3, [r4, #16]
	sub	r3, sl, fp
	str	sl, [r4, #20]
	str	r3, [r4, #8]
	str	r0, [r4, #0]
	mov	fp, r6
	mov	r2, r6
	b	lab329
lab319: 	mov	r1, r5
	mov	r2, fp
push {r1, r2}
	mov.w r1, #338
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #338
	mov.w r2, #1610612736 
	add	r3, fp
	str	r3, [r4, #0]
	mov	r1, r4
	mov	r0, r8
push {r1, r2}
	mov.w r1, #2492
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2492
	mov.w r2, #1610612736 
	beq	lab330
	b	lab303
lab331: 	mov	r0, r8
push {r1, r2}
	mov.w r1, #5267
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5267
	mov.w r2, #1610612736 
	cmp	r0, #0
	bne	lab333
	ldr	r1, [r4, #16]
	mov	r0, r8
push {r1, r2}
	mov.w r1, #3620
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3620
	mov.w r2, #1610612736 
	movs	r2, #12
	bic	r3, r3, #128	
	str	r2, [r8]
	b	lab334
lab324: 	adds	r2, r6, #1
	mov	r9, r2
	b	lab335
lab332: 	movs	r2, #12
	ldrsh	r3, [r4, #12]
	str	r2, [r8]
	b	lab334
lab305: 	mov	r0, #4294967295	
	b	lab336
	nop
	.ltorg
_fwalk_reent:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r0
	mov	r8, r1
	add	r6, r0, #736	
	mov	r9, #0
lab340: 	subs	r5, #1
	bmi	lab337
lab339: 	cmp	r3, #1
	add	r5, r5, #4294967295	
	bls	lab338
	ldrsh	r3, [r4, #14]
	adds	r3, #1
	mov	r1, r4
	beq	lab338
	mov	r0, r7
	blx	r8
	orr	r9, r9, r0
lab338: 	adds	r3, r5, #1
	add	r4, r4, #104	
	bne	lab339
lab337: 	ldr	r6, [r6, #0]
	cmp	r6, #0
	bne	lab340
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
	bpl	lab341
	add	r3, r4, #67	
	movs	r2, #1
	strd	r3, r2, [r4, #16]
	str	r3, [r4, #0]
lab348: 	cpsid f
	push {r1, r2}
	mov.w r1, #515
	mov.w r2, #1610612736 
lab341: 	ldrsh	r1, [r4, #14]
	cmp	r1, #0
	mov	r6, r0
	blt	lab342
	mov	r2, sp
	bl	_fstat_r
	push {r1, r2}
	mov.w r1, #3421
	mov.w r2, #1610612736 
	blt	lab343
	ldr	r5, [sp, #4]
	and	r5, r5, #61440	
	sub	r5, r5, #8192	
	clz	r5, r5
	mov	r8, #1024	
	lsrs	r5, r5, #5
	mov	r7, #2048	
lab349: 	mov	r0, r6
push {r1, r2}
	mov.w r1, #3356
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3356
	mov.w r2, #1610612736 
	cbz	r0, lab344
lab347: 	str	r2, [r6, #60]	
	orr	r3, r3, #128	
	str	r8, [r4, #20]
	strh	r3, [r4, #12]
	str	r0, [r4, #0]
	str	r0, [r4, #16]
	cbnz	r5, lab345
lab351: 	strh	r3, [r4, #12]
	add	sp, #88	
	cpsid f
	push {r1, r2}
	mov.w r1, #6451
	mov.w r2, #1610612736 
lab343: 	ldrh	r3, [r4, #12]
lab342: 	ands	r5, r3, #128	
	beq	lab346
	mov	r8, #64	
	mov	r1, r8
	mov	r0, r6
push {r1, r2}
	mov.w r1, #6679
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6679
	mov.w r2, #1610612736 
	ldrsh	r3, [r4, #12]
	mov	r7, r5
	cmp	r0, #0
	bne	lab347
lab344: 	lsls	r2, r3, #22
	bmi	lab348
	bic	r3, r3, #3
	add	r2, r4, #67	
	orr	r3, r3, #2
	movs	r1, #1
	strd	r2, r1, [r4, #16]
	strh	r3, [r4, #12]
	str	r2, [r4, #0]
	b	lab348
lab346: 	mov	r8, #1024	
	mov	r7, r5
	b	lab349
lab345: 	ldrsh	r1, [r4, #14]
	mov	r0, r6
	bl	_isatty_r
	push {r1, r2}
	mov.w r1, #6855
	mov.w r2, #1610612736 
	ldrsh	r3, [r4, #12]
	b	lab351
lab350: 	ldrh	r3, [r4, #12]
	bic	r3, r3, #3
	orr	r3, r3, #1
	sxth	r3, r3
	b	lab351
	.ltorg
_malloc_r:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	r6, r1, #11
	cmp	r6, #22
	sub	sp, #12
	mov	r4, r0
	bhi	lab352
	cmp	r1, #16
	bhi	lab353
	bl	__malloc_lock
	movs	r6, #16
	movs	r2, #24
	movs	r0, #2
lab401: 	add	r2, r7
	sub	r1, r2, #8
	ldr	r3, [r2, #4]
	cmp	r3, r1
	beq	lab354
lab375: 	ldr	r1, [r3, #12]
	bic	r2, r2, #3
	add	r2, r3
lab390: 	str	r1, [r5, #12]
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
	mov.w r1, #7103
	mov.w r2, #1610612736 
lab352: 	bics	r6, r6, #7
	bmi	lab353
	cmp	r1, r6
	bhi	lab353
	bl	__malloc_lock
	cmp	r6, #504	
	bcc	lab355
	lsrs	r3, r6, #9
	beq	lab356
	cmp	r3, #4
	bhi	lab357
	lsrs	r3, r6, #6
	add	r0, r3, #57	
	add	ip, r3, #56	
	lsls	r3, r0, #3
lab374: 	add	r3, r7
	sub	r5, r3, #8
	ldr	r3, [r3, #4]
	cmp	r5, r3
	bne	lab358
	b	lab359
lab361: 	bge	lab360
	ldr	r3, [r3, #12]
	cmp	r5, r3
	beq	lab359
lab358: 	ldr	r2, [r3, #4]
	bic	r2, r2, #3
	subs	r1, r2, r6
	cmp	r1, #15
	ble	lab361
	mov	r0, ip
lab359: 	ldr	r5, [r7, #16]
	ldr	ip, [pc, #576]	
	cmp	r5, ip
	beq	lab362
lab376: 	bic	r2, r2, #3
	subs	r3, r2, r6
	cmp	r3, #15
	bgt	lab363
	cmp	r3, #0
	strd	ip, ip, [r7, #16]
	bge	lab364
	cmp	r2, #512	
	bcs	lab365
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
lab396: 	movs	r1, #1
	lsls	r1, r3
	cmp	r1, r2
	bhi	lab366
lab377: 	bne	lab367
	bic	r0, r0, #3
lab368: 	tst	r1, r2
	add	r0, r0, #4
	beq	lab368
lab367: 	add	r9, r7, r0, lsl #3
	mov	r5, r9
	mov	lr, r0
lab399: 	cmp	r5, r8
	bne	lab369
	b	lab370
lab372: 	bge	lab371
	ldr	r8, [r8, #12]
	cmp	r5, r8
	beq	lab370
lab369: 	ldr	r2, [r8, #4]
	bic	r2, r2, #3
	subs	r3, r2, r6
	cmp	r3, #15
	ble	lab372
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
	b	lab373
lab353: 	movs	r3, #12
	str	r3, [r4, #0]
	movs	r5, #0
lab373: 	mov	r0, r5
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #5451
	mov.w r2, #1610612736 
lab356: 	mov	r3, #512	
	movs	r0, #64	
	mov	ip, #63	
	b	lab374
lab354: 	ldr	r3, [r2, #12]
	cmp	r2, r3
	it	eq
	addeq	r0, #2
	bne	lab375
	ldr	r5, [r7, #16]
	ldr	ip, [pc, #328]	
	cmp	r5, ip
	bne	lab376
lab362: 	ldr	r2, [r7, #4]
	asrs	r3, r0, #2
	movs	r1, #1
	lsls	r1, r3
	cmp	r1, r2
	bls	lab377
lab366: 	ldr	r5, [r7, #8]
	ldr	r3, [r5, #4]
	bic	r9, r3, #3
	cmp	r6, r9
	bhi	lab378
	sub	r3, r9, r6
	cmp	r3, #15
	bgt	lab379
lab378: 	ldr	fp, =__malloc_sbrk_base	
	ldr	r3, =__malloc_top_pad	
	ldr	r2, [fp]
	ldr	r3, [r3, #0]
	adds	r2, #1
	add	r3, r6
	add	sl, r5, r9
	beq	lab380
	add	r3, r3, #4096	
	adds	r3, #15
	bic	r8, r3, #4080	
	bic	r8, r8, #15
lab409: 	mov	r0, r4
push {r1, r2}
	mov.w r1, #2774
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2774
	mov.w r2, #1610612736 
	mov	r2, r0
	beq	lab381
	cmp	sl, r0
	bhi	lab382
	ldr	r3, =__malloc_current_mallinfo	
	ldr	r1, [r3, #0]
	add	r1, r8
	str	r1, [r3, #0]
	mov	r0, r1
	beq	lab383
lab415: 	str	r3, [sp, #4]
	adds	r1, #1
	ittet	ne
	subne	sl, r2, sl
	addne	r0, sl
	streq	r2, [fp]
	strne	r0, [r3, #0]
	ands	fp, r2, #7
	beq	lab384
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
	mov.w r1, #7413
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7413
	mov.w r2, #1610612736 
	ldrd	r2, r3, [sp]
	beq	lab385
lab411: 	add	r8, r0, sl
lab412: 	str	r2, [r7, #8]
	orr	r0, r8, #1
	add	r1, sl
	cmp	r5, r7
	str	r0, [r2, #4]
	str	r1, [r3, #0]
	beq	lab386
	cmp	r9, #15
	bls	lab387
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
	bhi	lab388
	ldr	r0, [r2, #4]
	mov	r5, r2
lab416: 	ldr	r2, [r3, #0]
	cmp	r2, r1
	it	cc
	strcc	r1, [r3, #0]
	ldr	r3, =__malloc_max_total_mem	
	ldr	r2, [r3, #0]
	cmp	r2, r1
	it	cc
	strcc	r1, [r3, #0]
	b	lab389
lab379: 	adds	r2, r5, r6
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
	mov.w r1, #2313
	mov.w r2, #1610612736 
lab360: 	ldr	r1, [r3, #12]
	add	r2, r3
	b	lab390
	nop
	.ltorg
lab365: 	cmp	r2, #2560	
	mov	r3, r2, lsr #9
	bcc	lab391
	cmp	r3, #20
	bhi	lab392
	add	r1, r3, #92	
	lsls	r1, r1, #3
	adds	r3, #91	
lab402: 	ldr	r1, [r7, r1]
	sub	lr, lr, #8
	cmp	lr, r1
	beq	lab393
lab395: 	bic	r3, r3, #3
	cmp	r3, r2
	bls	lab394
	ldr	r1, [r1, #8]
	cmp	lr, r1
	bne	lab395
lab394: 	ldr	lr, [r1, #12]
	ldr	r2, [r7, #4]
lab410: 	str	r5, [lr, #8]
	str	r5, [r1, #12]
	b	lab396
lab357: 	cmp	r3, #20
	bls	lab397
	cmp	r3, #84	
	bhi	lab398
	lsrs	r3, r6, #12
	add	r0, r3, #111	
	add	ip, r3, #110	
	lsls	r3, r0, #3
	b	lab374
lab370: 	add	lr, lr, #1
	tst	lr, #3
	add	r5, r5, #8
	bne	lab399
	b	lab400
lab371: 	add	r2, r8
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
	b	lab373
lab355: 	lsrs	r0, r6, #3
	add	r2, r6, #8
	b	lab401
lab364: 	add	r2, r5
	mov	r0, r4
	ldr	r3, [r2, #4]
	orr	r3, r3, #1
	str	r3, [r2, #4]
	adds	r5, #8
	bl	__malloc_unlock
	b	lab373
lab363: 	adds	r1, r5, r6
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
	b	lab373
lab391: 	lsrs	r3, r2, #6
	add	r1, r3, #57	
	lsls	r1, r1, #3
	adds	r3, #56	
	b	lab402
lab382: 	cmp	r5, r7
	beq	lab403
lab381: 	ldr	r5, [r7, #8]
	ldr	r0, [r5, #4]
lab389: 	bic	r8, r0, #3
	cmp	r6, r8
	sub	r3, r8, r6
	bhi	lab404
	cmp	r3, #15
	bgt	lab379
lab404: 	mov	r0, r4
	bl	__malloc_unlock
	movs	r5, #0
	b	lab373
lab397: 	add	r0, r3, #92	
	add	ip, r3, #91	
	lsls	r3, r0, #3
	b	lab374
lab406: 	cmp	r3, r9
	bne	lab405
lab400: 	tst	r0, #3
	add	r0, r0, #4294967295	
	bne	lab406
	ldr	r3, [r7, #4]
	bic	r3, r3, r1
	str	r3, [r7, #4]
lab420: 	cmp	r1, r3
	bhi	lab366
	cbnz	r1, lab407
	b	lab366
lab408: 	add	lr, lr, #4
lab407: 	tst	r1, r3
	beq	lab408
	mov	r0, lr
	b	lab367
lab380: 	add	r8, r3, #16
	b	lab409
lab393: 	asrs	r2, r3, #2
	mov	r8, #1
	ldr	r3, [r7, #4]
	lsl	r2, r8, r2
	orrs	r2, r3
	str	r2, [r7, #4]
	b	lab410
lab384: 	add	r1, r2, r8
	negs	r1, r1
	ubfx	sl, r1, #0, #12
	mov	r1, sl
	mov	r0, r4
	str	r2, [sp, #0]
push {r1, r2}
	mov.w r1, #7617
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7617
	mov.w r2, #1610612736 
	ldrd	r2, r3, [sp]
	bne	lab411
	mov	sl, fp
	b	lab412
lab392: 	cmp	r3, #84	
	bhi	lab413
	lsrs	r3, r2, #12
	add	r1, r3, #111	
	lsls	r1, r1, #3
	adds	r3, #110	
	b	lab402
lab398: 	cmp	r3, #340	
	bhi	lab414
	lsrs	r3, r6, #15
	add	r0, r3, #120	
	add	ip, r3, #119	
	lsls	r3, r0, #3
	b	lab374
lab403: 	ldr	r3, =__malloc_current_mallinfo	
	ldr	r0, [r3, #0]
	add	r0, r8
	str	r0, [r3, #0]
	b	lab415
lab383: 	ubfx	ip, sl, #0, #12
	cmp	ip, #0
	bne	lab415
	ldr	r5, [r7, #8]
	add	r8, r9
	orr	r0, r8, #1
	str	r0, [r5, #4]
	b	lab416
lab386: 	mov	r5, r2
	b	lab416
lab387: 	movs	r3, #1
	str	r3, [r2, #4]
	b	lab404
lab413: 	cmp	r3, #340	
	bhi	lab417
	lsrs	r3, r2, #15
	add	r1, r3, #120	
	lsls	r1, r1, #3
	adds	r3, #119	
	b	lab402
lab414: 	movw	r2, #1364	
	cmp	r3, r2
	bhi	lab418
	lsrs	r3, r6, #18
	add	r0, r3, #125	
	add	ip, r3, #124	
	lsls	r3, r0, #3
	b	lab374
lab385: 	sub	fp, fp, #8
	add	r8, fp
	sub	r8, r8, r2
	mov	sl, #0
	b	lab412
lab388: 	add	r1, r5, #8
	mov	r0, r4
	str	r3, [sp, #0]
push {r1, r2}
	mov.w r1, #1090
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1090
	mov.w r2, #1610612736 
	ldr	r3, [sp, #0]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #0]
	b	lab416
lab417: 	movw	r1, #1364	
	cmp	r3, r1
	bhi	lab419
	lsrs	r3, r2, #18
	add	r1, r3, #125	
	lsls	r1, r1, #3
	adds	r3, #124	
	b	lab402
lab418: 	mov	r3, #1016	
	movs	r0, #127	
	mov	ip, #126	
	b	lab374
lab419: 	mov	r1, #1016	
	movs	r3, #126	
	b	lab402
lab405: 	ldr	r3, [r7, #4]
	b	lab420
	.ltorg
__ascii_mbtowc:
	sub	sp, #8
	cbz	r1, lab421
	cbz	r2, lab422
lab424: 	ldrb	r3, [r2, #0]
	str	r3, [r1, #0]
	ldrb	r2, [r2, #0]
	subs	r0, r2, #0
	it	ne
	movne	r0, #1
lab425: 	bx	lr
lab421: 	add	r1, sp, #4
	cmp	r2, #0
	bne	lab424
lab422: 	mov	r0, r2
	add	sp, #8
	bx	lr
lab423: 	mvn	r0, #1
	b	lab425
	nop
memchr:
	and	r1, r1, #255	
	cmp	r2, #16
	blt	lab426
	tst	r0, #7
	beq	lab427
lab430: 	subs	r2, #1
	cmp	r3, r1
	beq	lab428
	tst	r0, #7
	cbz	r2, lab429
	bne	lab430
lab427: 	push	{r4, r5, r6, r7}
	orr	r1, r1, r1, lsl #8
	orr	r1, r1, r1, lsl #16
	bic	r4, r2, #7
	mvns	r7, #0
	movs	r3, #0
lab432: 	subs	r4, #8
	eor	r5, r5, r1
	eor	r6, r6, r1
	uadd8	r5, r5, r7
	sel	r5, r3, r7
	uadd8	r6, r6, r7
	sel	r6, r5, r7
	cbnz	r6, lab431
	bne	lab432
	pop	{r4, r5, r6, r7}
	and	r1, r1, #255	
	and	r2, r2, #7
lab426: 	cbz	r2, lab429
lab433: 	subs	r2, #1
	eor	r3, r3, r1
	cbz	r3, lab428
	bne	lab433
lab429: 	movs	r0, #0
	bx	lr
lab428: 	subs	r0, #1
	bx	lr
lab431: 	cmp	r5, #0
	itte	eq
	moveq	r5, r6
	subeq	r0, #3
	subne	r0, #7
	tst	r5, #1
	bne	lab434
	adds	r0, #1
	tst	r5, #256	
	ittt	eq
	addeq	r0, #1
	tsteq	r5, #98304	
	addeq	r0, #1
lab434: 	pop	{r4, r5, r6, r7}
	subs	r0, #1
	bx	lr
	nop
memcpy:
	mov	ip, r0
	orr	r3, r1, r0
	ands	r3, r3, #3
	bne	lab435
lab444: 	bcc	lab436
lab437: 	str	r3, [r0], #4
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
	bcs	lab437
lab436: 	adds	r2, #48	
	bcc	lab438
lab439: 	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #16
	bcs	lab439
lab438: 	adds	r2, #12
	bcc	lab440
lab441: 	str	r3, [r0], #4
	subs	r2, #4
	bcs	lab441
lab440: 	adds	r2, #4
	beq	lab442
	lsls	r2, r2, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab442
	ldrh	r3, [r1, #0]
	strh	r3, [r0, #0]
lab442: 	mov	r0, ip
	bx	lr
	nop
lab435: 	cmp	r2, #8
	bcc	lab443
	lsls	r3, r1, #30
	beq	lab444
	ands	r3, r0, #3
	beq	lab444
	rsb	r3, r3, #4
	subs	r2, r2, r3
	lsls	r3, r3, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab444
	ldrh	r3, [r1], #2
	strh	r3, [r0], #2
	b	lab444
lab443: 	subs	r2, #4
	bcc	lab440
lab445: 	ldrb	r3, [r1], #1
	strb	r3, [r0], #1
	bcs	lab445
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
	bls	lab446
	adds	r3, r1, r2
	cmp	r3, r0
	bls	lab446
	add	ip, r0, r2
	cbz	r2, lab447
	mov	r2, ip
lab448: 	strb	ip, [r2, #-1]!
	cmp	r1, r3
	bne	lab448
	cpsid f
	push {r1, r2}
	mov.w r1, #1555
	mov.w r2, #1610612736 
lab446: 	cmp	r2, #15
	bhi	lab449
	mov	r3, r0
	add	ip, r2, #4294967295	
	cbz	r2, lab447
lab457: 	subs	r3, #1
	add	ip, r1
lab450: 	strb	r2, [r3, #1]!
	cmp	r1, ip
	bne	lab450
lab447:	cpsid f
	push {r1, r2}
	mov.w r1, #3719
	mov.w r2, #1610612736 
lab449: 	orr	r3, r0, r1
	lsls	r3, r3, #30
	bne	lab451
	sub	r3, r2, #16
	push	{r4, r5, r6, lr}
	add	ip, r1, #32
	bic	r5, r3, #15
	add	lr, r1, #16
	add	r4, r0, #16
	add	ip, r5
	lsrs	r3, r3, #4
lab452: 	str	r5, [r4, #-16]
	ldr	r5, [lr, #-12]
	str	r5, [r4, #-12]
	ldr	r5, [lr, #-8]
	str	r5, [r4, #-8]
	ldr	r5, [lr, #-4]
	str	r5, [r4, #-4]
	add	lr, lr, #16
	cmp	lr, ip
	add	r4, r4, #16
	bne	lab452
	adds	r3, #1
	tst	r2, #12
	add	r1, r1, r3, lsl #4
	and	r4, r2, #15
	add	r3, r0, r3, lsl #4
	beq	lab453
	subs	r4, #4
	bic	r6, r4, #3
	mov	ip, r4, lsr #2
	add	r6, r3
	subs	r4, r3, #4
	mov	lr, r1
lab454: 	str	r5, [r4, #4]!
	cmp	r4, r6
	bne	lab454
	add	r4, ip, #1
	and	r2, r2, #3
	add	r3, r3, r4, lsl #2
	add	r1, r1, r4, lsl #2
lab458: 	cbz	r2, lab455
	add	ip, ip, #1
	subs	r3, #1
	add	ip, r1
lab456: 	strb	r2, [r3, #1]!
	cmp	r1, ip
	bne	lab456
lab455:	cpsid f
	push {r1, r2}
	mov.w r1, #2964
	mov.w r2, #1610612736 
lab451: 	add	ip, r2, #4294967295	
	mov	r3, r0
	b	lab457
lab453: 	mov	r2, r4
	b	lab458
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
	beq	lab459
	add	r5, r7, #11
	mov	r8, r0
	mov	r4, r1
	bl	__malloc_lock
	cmp	r5, #22
	bhi	lab460
	movs	r5, #16
	mov	r2, r5
lab473: 	bhi	lab461
	ldr	r1, [r4, #-4]
	bic	r6, r1, #3
	cmp	r6, r2
	sub	r9, r4, #8
	bge	lab462
	ldr	r3, =__malloc_av_	
	ldr	ip, [r3, #8]
	add	r0, r9, r6
	cmp	ip, r0
	beq	lab463
	ldr	ip, [r0, #4]
	bic	r3, ip, #1
	add	r3, r0
	ldr	r3, [r3, #4]
	lsls	r3, r3, #31
	bmi	lab464
	bic	ip, ip, #3
	add	r3, r6, ip
	cmp	r3, r2
	bge	lab465
	lsls	r3, r1, #31
	bmi	lab466
	ldr	r3, [r4, #-8]
	sub	sl, r9, r3
	ldr	r3, [sl, #4]
	bic	r1, r3, #3
	add	ip, r1
	add	ip, r6
	cmp	ip, r2
	bge	lab467
lab475: 	cmp	r3, r2
	bge	lab468
lab466: 	mov	r1, r7
	mov	r0, r8
push {r1, r2}
	mov.w r1, #1529
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1529
	mov.w r2, #1610612736 
	cbz	r0, lab469
	ldr	r3, [r4, #-4]
	bic	r3, r3, #1
	add	r3, r9
	sub	r2, r0, #8
	cmp	r3, r2
	beq	lab470
	subs	r2, r6, #4
	cmp	r2, #36	
	bhi	lab471
	cmp	r2, #19
	bhi	lab472
	mov	r3, r0
	mov	r2, r4
lab483: 	str	r1, [r3, #0]
	ldr	r1, [r2, #4]
	str	r1, [r3, #4]
	ldr	r2, [r2, #8]
	str	r2, [r3, #8]
lab487: 	mov	r0, r8
push {r1, r2}
	mov.w r1, #1378
	mov.w r2, #1610612736 
lab469:	push {r1, r2}
	mov.w r1, #1378
	mov.w r2, #1610612736 
	bl	__malloc_unlock
	mov	r0, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1287
	mov.w r2, #1610612736 
lab460: 	bic	r5, r5, #7
	cmp	r5, #0
	mov	r2, r5
	bge	lab473
lab461: 	movs	r3, #12
	str	r3, [r8]
	movs	r7, #0
lab481: 	cpsid f
	push {r1, r2}
	mov.w r1, #5940
	mov.w r2, #1610612736 
lab465: 	mov	r6, r3
	ldrd	r2, r3, [r0, #8]
	str	r3, [r2, #12]
	str	r2, [r3, #8]
lab462: 	subs	r3, r6, r5
	cmp	r3, #15
	bhi	lab474
	ldr	r3, [r9, #4]
	and	r3, r3, #1
	orrs	r3, r6
	add	r6, r9
	str	r3, [r9, #4]
	ldr	r3, [r6, #4]
	orr	r3, r3, #1
	str	r3, [r6, #4]
lab476: 	mov	r7, r4
	bl	__malloc_unlock
	mov	r0, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #3944
	mov.w r2, #1610612736 
lab464: 	lsls	r1, r1, #31
	bmi	lab466
	ldr	r3, [r4, #-8]
	sub	sl, r9, r3
	ldr	r1, [sl, #4]
	bic	r1, r1, #3
	b	lab475
lab459: 	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r1, r2
	b	_malloc_r
lab474: 	ldr	r1, [r9, #4]
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
	mov.w r1, #1763
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1763
	mov.w r2, #1610612736 
lab463: 	ldr	r0, [ip, #4]
	bic	fp, r0, #3
	add	ip, r6, fp
	add	r0, r5, #16
	cmp	ip, r0
	bge	lab477
	lsls	r1, r1, #31
	bmi	lab466
	ldr	r1, [r4, #-8]
	sub	sl, r9, r1
	ldr	r1, [sl, #4]
	bic	r1, r1, #3
	add	fp, r1
	add	fp, r6
	cmp	r0, fp
	bgt	lab475
	mov	r7, sl
	ldr	r1, [sl, #12]
	ldr	r0, [r7, #8]!
	subs	r2, r6, #4
	cmp	r2, #36	
	str	r1, [r0, #12]
	str	r0, [r1, #8]
	bhi	lab478
	cmp	r2, #19
	bls	lab479
	ldr	r1, [r4, #0]
	str	r1, [sl, #8]
	ldr	r1, [r4, #4]
	str	r1, [sl, #12]
	cmp	r2, #27
	bhi	lab480
	adds	r4, #8
	add	r2, sl, #16
lab496: 	str	r1, [r2, #0]
	ldr	r1, [r4, #4]
	str	r1, [r2, #4]
	ldr	r1, [r4, #8]
	str	r1, [r2, #8]
lab497: 	sub	r2, fp, r5
	orr	r2, r2, #1
	str	r1, [r3, #8]
	str	r2, [r1, #4]
	ldr	r3, [sl, #4]
	and	r3, r3, #1
	orrs	r5, r3
	mov	r0, r8
	str	r5, [sl, #4]
	bl	__malloc_unlock
	b	lab481
lab472: 	ldr	r3, [r4, #0]
	str	r3, [r0, #0]
	ldr	r3, [r4, #4]
	str	r3, [r0, #4]
	cmp	r2, #27
	bhi	lab482
	add	r2, r4, #8
	add	r3, r0, #8
	b	lab483
lab477: 	add	r2, r9, r5
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
	b	lab481
lab470: 	ldr	r3, [r0, #-4]
	bic	r3, r3, #3
	add	r6, r3
	b	lab462
lab468: 	mov	r7, sl
	ldr	r1, [sl, #12]
	ldr	r0, [r7, #8]!
	subs	r2, r6, #4
	cmp	r2, #36	
	str	r1, [r0, #12]
	str	r0, [r1, #8]
	bhi	lab484
	cmp	r2, #19
	bls	lab485
	ldr	r1, [r4, #0]
	str	r1, [sl, #8]
	ldr	r1, [r4, #4]
	str	r1, [sl, #12]
	cmp	r2, #27
	bhi	lab486
	adds	r4, #8
	add	r2, sl, #16
lab492: 	ldr	r3, [r4, #0]
	str	r3, [r2, #0]
	ldr	r3, [r4, #4]
	str	r3, [r2, #4]
	ldr	r3, [r4, #8]
	str	r3, [r2, #8]
	mov	r9, sl
	mov	r4, r7
	b	lab462
lab471: 	mov	r1, r4
push {r1, r2}
	mov.w r1, #1064
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1064
	mov.w r2, #1610612736 
lab467: 	ldrd	r1, r3, [r0, #8]
	mov	r7, sl
	str	r3, [r1, #12]
	str	r1, [r3, #8]
	ldr	r1, [r7, #8]!
	ldr	r3, [sl, #12]
	str	r3, [r1, #12]
	subs	r2, r6, #4
	cmp	r2, #36	
	str	r1, [r3, #8]
	bhi	lab488
	cmp	r2, #19
	bls	lab489
	ldr	r3, [r4, #0]
	str	r3, [sl, #8]
	ldr	r3, [r4, #4]
	str	r3, [sl, #12]
	cmp	r2, #27
	bhi	lab490
	adds	r4, #8
	add	r3, sl, #16
lab493: 	str	r2, [r3, #0]
	ldr	r2, [r4, #4]
	str	r2, [r3, #4]
	ldr	r2, [r4, #8]
	str	r2, [r3, #8]
	mov	r6, ip
	mov	r9, sl
	mov	r4, r7
	b	lab462
lab482: 	ldr	r3, [r4, #8]
	str	r3, [r0, #8]
	ldr	r3, [r4, #12]
	str	r3, [r0, #12]
	cmp	r2, #36	
	beq	lab491
	add	r2, r4, #16
	add	r3, r0, #16
	b	lab483
lab485: 	mov	r2, r7
	b	lab492
lab484: 	mov	r1, r4
	mov	r0, r7
	mov	r6, r3
	mov	r9, sl
push {r1, r2}
	mov.w r1, #6576
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6576
	mov.w r2, #1610612736 
	b	lab462
lab489: 	mov	r3, r7
	b	lab493
lab488: 	mov	r1, r4
	mov	r0, r7
	mov	r6, ip
	mov	r9, sl
push {r1, r2}
	mov.w r1, #3017
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3017
	mov.w r2, #1610612736 
	b	lab462
	.ltorg
lab486: 	ldr	r1, [r4, #8]
	str	r1, [sl, #16]
	ldr	r1, [r4, #12]
	str	r1, [sl, #20]
	cmp	r2, #36	
	beq	lab494
	adds	r4, #16
	add	r2, sl, #24
	b	lab492
lab491: 	ldr	r3, [r4, #16]
	str	r3, [r0, #16]
	ldr	r1, [r4, #20]
	str	r1, [r0, #20]
	add	r2, r4, #24
	add	r3, r0, #24
	b	lab483
lab490: 	ldr	r3, [r4, #8]
	str	r3, [sl, #16]
	ldr	r3, [r4, #12]
	str	r3, [sl, #20]
	cmp	r2, #36	
	beq	lab495
	adds	r4, #16
	add	r3, sl, #24
	b	lab493
lab479: 	mov	r2, r7
	b	lab496
lab478: 	mov	r1, r4
	mov	r0, r7
push {r1, r2}
	mov.w r1, #2962
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2962
	mov.w r2, #1610612736 
	b	lab497
lab494: 	ldr	r2, [r4, #16]
	str	r2, [sl, #24]
	ldr	r2, [r4, #20]
	str	r2, [sl, #28]
	adds	r4, #24
	add	r2, sl, #32
	b	lab492
lab480: 	ldr	r1, [r4, #8]
	str	r1, [sl, #16]
	ldr	r1, [r4, #12]
	str	r1, [sl, #20]
	cmp	r2, #36	
	beq	lab498
	adds	r4, #16
	add	r2, sl, #24
	b	lab496
lab495: 	ldr	r3, [r4, #16]
	str	r3, [sl, #24]
	ldr	r3, [r4, #20]
	str	r3, [sl, #28]
	adds	r4, #24
	add	r3, sl, #32
	b	lab493
lab498: 	ldr	r2, [r4, #16]
	str	r2, [sl, #24]
	ldr	r2, [r4, #20]
	str	r2, [sl, #28]
	adds	r4, #24
	add	r2, sl, #32
	b	lab496
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
	beq	lab499
lab500:	cpsid f
	push {r1, r2}
	mov.w r1, #5590
	mov.w r2, #1610612736 
lab499: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab500
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #2645
	mov.w r2, #1610612736 
	.ltorg
raise:
	push	{r3, r4, r5, lr}
	ldr	r3, =_impure_ptr	
	cmp	r0, #31
	ldr	r5, [r3, #0]
	bhi	lab501
	ldr	r2, [r5, #732]	
	mov	r4, r0
	cbz	r2, lab502
	ldr	r3, [r2, r0, lsl #2]
	cbz	r3, lab502
	cmp	r3, #1
	beq	lab503
	adds	r1, r3, #1
	beq	lab504
	movs	r5, #0
	str	r5, [r2, r0, lsl #2]
	blx	r3
	mov	r0, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #1165
	mov.w r2, #1610612736 
lab502: 	mov	r0, r5
	bl	_getpid_r
	mov	r2, r4
	mov	r1, r0
	mov	r0, r5
	ldmia	sp!, {r3, r4, r5, lr}
	b	_kill_r
lab504: 	movs	r3, #22
	str	r3, [r5, #0]
	movs	r0, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #5999
	mov.w r2, #1610612736 
lab503: 	movs	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #5093
	mov.w r2, #1610612736 
lab501: 	movs	r3, #22
	str	r3, [r5, #0]
	mov	r0, #4294967295	
	cpsid f
	push {r1, r2}
	mov.w r1, #7582
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
	beq	lab505
lab506:	cpsid f
	push {r1, r2}
	mov.w r1, #2538
	mov.w r2, #1610612736 
lab505: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab506
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #206
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
	mov.w r1, #4213
	mov.w r2, #1610612736 
	blt	lab507
	ldr	r3, [r4, #80]	
	add	r3, r0
	str	r3, [r4, #80]	
	pop	{r4, pc}
lab507: 	ldrh	r3, [r4, #12]
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
	bmi	lab508
lab509: 	strh	r1, [r4, #12]
	mov	r3, r7
	ldrsh	r1, [r4, #14]
	mov	r2, r6
	mov	r0, r5
	ldmia	sp!, {r4, r5, r6, r7, r8, lr}
	b	_write_r
lab508: 	ldrsh	r1, [r4, #14]
	movs	r3, #2
	movs	r2, #0
push {r1, r2}
	mov.w r1, #8168
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8168
	mov.w r2, #1610612736 
	b	lab509
	nop
__sseek:
	push	{r4, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #14]
push {r1, r2}
	mov.w r1, #4137
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4137
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
	bne	lab510
	mov	r4, #0
	mvn	r0, #7
lab512: 	pld	[r1, #64]	
	add	r0, r0, #8
lab513: 	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab511
	ldrd	r2, r3, [r1, #8]
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab511
	ldrd	r2, r3, [r1, #16]
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab511
	ldrd	r2, r3, [r1, #24]
	add	r1, r1, #32
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cmp	r3, #0
	beq	lab512
lab511: 	cmp	r2, #0
	itt	eq
	addeq	r0, #4
	moveq	r2, r3
	rev	r2, r2
	clz	r2, r2
	ldrd	r4, r5, [sp], #8
	add	r0, r0, r2, lsr #3
	bx	lr
lab510: 	ldrd	r2, r3, [r1]
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
	b	lab513
strncpy:
	push	{r4, r5, lr}
	orr	r4, r0, r1
	lsls	r3, r4, #30
	bne	lab514
	cmp	r2, #3
	bhi	lab515
lab514: 	mov	ip, r0
lab519: 	b	lab516
lab518: 	strb	r1, [r3], #1
	subs	r4, r2, #1
	cbz	r1, lab517
	mov	ip, r3
	mov	r2, r4
lab516: 	mov	r3, ip
	cmp	r2, #0
	bne	lab518
lab521:	cpsid f
	push {r1, r2}
	mov.w r1, #4920
	mov.w r2, #1610612736 
lab515: 	mov	r3, r1
	mov	ip, r0
lab520: 	ldr	r5, [r3], #4
	sub	r4, r5, #16843009	
	bic	r4, r4, r5
	tst	r4, #2155905152	
	bne	lab519
	subs	r2, #4
	cmp	r2, #3
	str	r5, [ip], #4
	mov	r1, r3
	bhi	lab520
	b	lab519
lab517: 	add	r2, ip
	cmp	r4, #0
	beq	lab521
lab522: 	cmp	r3, r2
	bne	lab522
	cpsid f
	push {r1, r2}
	mov.w r1, #175
	mov.w r2, #1610612736 
__swbuf_r:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r5, r1
	mov	r4, r2
	mov	r6, r0
	cbz	r0, lab523
	ldr	r3, [r0, #56]	
	cmp	r3, #0
	beq	lab524
lab523: 	ldrsh	r2, [r4, #12]
	ldr	r3, [r4, #24]
	str	r3, [r4, #8]
	lsls	r7, r2, #28
	uxth	r0, r2
	bpl	lab525
	ldr	r3, [r4, #16]
	cbz	r3, lab525
	uxtb	r5, r5
	lsls	r1, r0, #18
	mov	r7, r5
	bpl	lab526
lab531: 	ldr	r1, [r4, #20]
	subs	r3, r2, r3
	cmp	r1, r3
	ble	lab527
lab532: lab533: 	subs	r1, #1
	str	r1, [r4, #8]
	adds	r1, r2, #1
	str	r1, [r4, #0]
	strb	r5, [r2, #0]
	ldr	r2, [r4, #20]
	cmp	r2, r3
	beq	lab528
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #31
	bpl	lab529
	cmp	r5, #10
	beq	lab528
lab529: 	mov	r0, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6875
	mov.w r2, #1610612736 
lab525: 	mov	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #5227
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5227
	mov.w r2, #1610612736 
	ldrsh	r2, [r4, #12]
	ldr	r3, [r4, #16]
	uxth	r0, r2
	uxtb	r5, r5
	lsls	r1, r0, #18
	mov	r7, r5
	bmi	lab531
lab526: 	orr	r2, r2, #8192	
	strh	r2, [r4, #12]
	ldr	r2, [r4, #100]	
	ldr	r1, [r4, #20]
	bic	r2, r2, #8192	
	str	r2, [r4, #100]	
	ldr	r2, [r4, #0]
	subs	r3, r2, r3
	cmp	r1, r3
	bgt	lab532
lab527: 	mov	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #422
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #422
	mov.w r2, #1610612736 
	ldr	r2, [r4, #0]
	movs	r3, #1
	b	lab533
lab524: 	bl	__sinit
	b	lab523
lab528: 	mov	r1, r4
	mov	r0, r6
push {r1, r2}
	mov.w r1, #3303
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3303
	mov.w r2, #1610612736 
	beq	lab529
lab530: 	mov	r7, #4294967295	
	b	lab529
_wcrtomb_r:
	push	{r4, r5, r6, lr}
	mov	r5, r0
	sub	sp, #16
	mov	r4, r3
	cbz	r1, lab534
	ldr	r6, =__global_locale	
	ldr	r6, [r6, #224]	
	cpsid f
	push {r1, r2}
	mov.w r1, #7884
	mov.w r2, #1610612736 
	adds	r3, r0, #1
	beq	lab535
lab536: 	cpsid f
	push {r1, r2}
	mov.w r1, #5368
	mov.w r2, #1610612736 
lab534: 	mov	r2, r1
	ldr	r1, =__global_locale	
	ldr	r6, [r1, #224]	
	add	r1, sp, #4
	cpsid f
	push {r1, r2}
	mov.w r1, #2605
	mov.w r2, #1610612736 
	adds	r3, r0, #1
	bne	lab536
lab535: 	movs	r2, #0
	movs	r3, #138	
	str	r2, [r4, #0]
	str	r3, [r5, #0]
	add	sp, #16
	cpsid f
	push {r1, r2}
	mov.w r1, #5206
	mov.w r2, #1610612736 
	nop
	.ltorg
__ascii_wctomb:	push {r1, r2}
	mov.w r1, #2314
	mov.w r2, #1610612736 
	cmp	r2, #255	
	bhi	lab538
	strb	r2, [r1, #0]
	movs	r0, #1
	bx	lr
lab538: 	movs	r3, #138	
	str	r3, [r0, #0]
	mov	r0, #4294967295	
	bx	lr
lab537: 	mov	r0, r1
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
	beq	lab539
lab540: lab539: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab540
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
	cbz	r4, lab541
lab545: 	cmp	r5, #31
	bgt	lab542
	cbnz	r6, lab543
lab544: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab546:	cpsid f
	push {r1, r2}
	mov.w r1, #7123
	mov.w r2, #1610612736 
lab543: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab544
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab544
lab541: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab545
lab542: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab546
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
	beq	lab547
lab548: lab547: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab548
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
	.ltorg
_fclose_r:
	push	{r4, r5, r6, lr}
	cmp	r1, #0
	beq	lab549
	mov	r6, r0
	mov	r4, r1
	cbz	r0, lab550
	ldr	r3, [r0, #56]	
	cmp	r3, #0
	beq	lab551
lab550: 	ldr	r3, [r4, #100]	
	lsls	r0, r3, #31
	bpl	lab552
lab561: 	cmp	r3, #0
	beq	lab549
lab559: 	mov	r0, r6
push {r1, r2}
	mov.w r1, #1374
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1374
	mov.w r2, #1610612736 
	mov	r5, r0
	cbz	r3, lab553
	ldr	r1, [r4, #28]
	mov	r0, r6
	blx	r3
	cmp	r0, #0
	it	lt
	movlt	r5, #4294967295	
lab553: 	ldrh	r3, [r4, #12]
	lsls	r2, r3, #24
	bmi	lab554
lab562: 	cbz	r1, lab555
	add	r3, r4, #64	
	cmp	r1, r3
	beq	lab556
	mov	r0, r6
push {r1, r2}
	mov.w r1, #766
	mov.w r2, #1610612736 
lab556:	push {r1, r2}
	mov.w r1, #766
	mov.w r2, #1610612736 
	str	r3, [r4, #48]	
lab555: 	ldr	r1, [r4, #68]	
	cbz	r1, lab557
	mov	r0, r6
push {r1, r2}
	mov.w r1, #5559
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5559
	mov.w r2, #1610612736 
	str	r3, [r4, #68]	
lab557: 	bl	__sfp_lock_acquire
	ldr	r3, [r4, #100]	
	movs	r2, #0
	lsls	r3, r3, #31
	strh	r2, [r4, #12]
	bpl	lab558
lab563: 	bl	__retarget_lock_close_recursive
	bl	__sfp_lock_release
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab552: 	ldrh	r3, [r4, #12]
	lsls	r1, r3, #22
	bmi	lab559
	ldr	r0, [r4, #88]	
	bl	__retarget_lock_acquire_recursive
	ldrsh	r3, [r4, #12]
	cmp	r3, #0
	bne	lab559
	ldr	r5, [r4, #100]	
	ands	r5, r5, #1
	beq	lab560
lab549: 	movs	r5, #0
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab551: 	bl	__sinit
	ldr	r3, [r4, #100]	
	lsls	r0, r3, #31
	bmi	lab561
	b	lab552
lab560: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab554: 	ldr	r1, [r4, #16]
	mov	r0, r6
push {r1, r2}
	mov.w r1, #6683
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6683
	mov.w r2, #1610612736 
lab558: 	ldr	r0, [r4, #88]	
	bl	__retarget_lock_release_recursive
	b	lab563
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
	beq	lab564
lab565:	cpsid f
	push {r1, r2}
	mov.w r1, #7474
	mov.w r2, #1610612736 
lab564: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab565
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #4752
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
	beq	lab566
lab567:	cpsid f
	push {r1, r2}
	mov.w r1, #2802
	mov.w r2, #1610612736 
lab566: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab567
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #4790
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
	beq	lab568
lab569:	cpsid f
	push {r1, r2}
	mov.w r1, #3263
	mov.w r2, #1610612736 
lab568: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab569
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #359
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
	beq	lab570
lab571:	cpsid f
	push {r1, r2}
	mov.w r1, #5746
	mov.w r2, #1610612736 
lab570: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab571
	str	r3, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #2016
	mov.w r2, #1610612736 
	.ltorg
__aeabi_uldivmod:
	cbnz	r3, lab572
	cbnz	r2, lab572
	cmp	r1, #0
	it	eq
	cmpeq	r0, #0
	itt	ne
	movne	r1, #4294967295	
	movne	r0, #4294967295	
	b	__aeabi_idiv0
lab572: 	sub	ip, sp, #8
	strd	ip, lr, [sp, #-16]!
	bl	__udivmoddi4
	push {r1, r2}
	mov.w r1, #7957
	mov.w r2, #1610612736 
	ldrd	r2, r3, [sp, #8]
	add	sp, #16
	cpsid f
	push {r1, r2}
	mov.w r1, #3343
	mov.w r2, #1610612736 
__udivmoddi4:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r6, [sp, #32]
	mov	r5, r1
	mov	r4, r0
	mov	r8, r1
	cmp	r3, #0
	bne	lab573
	cmp	r2, r1
	mov	ip, r2
	bls	lab574
	clz	r2, r2
	cbz	r2, lab575
	lsl	r3, r1, r2
	rsb	r1, r2, #32
	lsr	r1, r0, r1
	lsl	ip, ip, r2
	orr	r8, r1, r3
	lsls	r4, r2
lab575: 	mov	r5, ip, lsr #16
	lsrs	r1, r4, #16
	udiv	lr, r8, r5
	uxth	r7, ip
	mls	r3, r5, lr, r8
	orr	r3, r1, r3, lsl #16
	mul	r1, lr, r7
	cmp	r1, r3
	bls	lab576
	adds	r3, ip, r3
	add	r0, lr, #4294967295	
	bcs	lab577
	cmp	r1, r3
	bls	lab577
	sub	lr, lr, #2
	add	r3, ip
lab576: 	subs	r3, r3, r1
	uxth	r4, r4
	udiv	r0, r3, r5
	mls	r3, r5, r0, r3
	orr	r4, r4, r3, lsl #16
	mul	r7, r0, r7
	cmp	r7, r4
	bls	lab578
	adds	r4, ip, r4
	add	r3, r0, #4294967295	
	bcs	lab579
	cmp	r7, r4
	bls	lab579
	add	r4, ip
	subs	r0, #2
lab578: 	subs	r4, r4, r7
	orr	r0, r0, lr, lsl #16
	movs	r1, #0
lab594: 	lsrs	r4, r2
	movs	r3, #0
	strd	r4, r3, [r6]
lab580:	cpsid f
	push {r1, r2}
	mov.w r1, #1962
	mov.w r2, #1610612736 
lab573: 	cmp	r3, r1
	bls	lab581
	cmp	r6, #0
	beq	lab582
	movs	r1, #0
	strd	r0, r5, [r6]
	mov	r0, r1
	cpsid f
	push {r1, r2}
	mov.w r1, #6967
	mov.w r2, #1610612736 
lab581: 	clz	r1, r3
	cmp	r1, #0
	bne	lab583
	cmp	r3, r5
	bcc	lab584
	cmp	r2, r0
	bhi	lab585
lab584: 	subs	r4, r0, r2
	sbc	r3, r5, r3
	movs	r0, #1
	mov	r8, r3
lab608: 	beq	lab580
	strd	r4, r8, [r6]
	b	lab580
lab574: 	cbnz	r2, lab586
	udf	#255	
lab586: 	clz	r2, r2
	cmp	r2, #0
	bne	lab587
	sub	r5, r1, ip
	mov	r7, ip, lsr #16
	uxth	lr, ip
	movs	r1, #1
lab606: 	mls	r0, r7, r3, r5
	lsrs	r5, r4, #16
	orr	r5, r5, r0, lsl #16
	mul	r0, lr, r3
	cmp	r0, r5
	bls	lab588
	adds	r5, ip, r5
	add	r8, r3, #4294967295	
	bcs	lab589
	cmp	r0, r5
	bhi	lab590
lab589: 	mov	r3, r8
lab588: 	subs	r5, r5, r0
	uxth	r4, r4
	udiv	r0, r5, r7
	mls	r5, r7, r0, r5
	orr	r4, r4, r5, lsl #16
	mul	lr, lr, r0
	cmp	lr, r4
	bls	lab591
	adds	r4, ip, r4
	add	r5, r0, #4294967295	
	bcs	lab592
	cmp	lr, r4
	bhi	lab593
lab592: 	mov	r0, r5
lab591: 	sub	r4, r4, lr
	orr	r0, r0, r3, lsl #16
	b	lab594
lab583: 	rsb	r7, r1, #32
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
	bls	lab595
	adds	r5, ip, r5
	add	sl, r8, #4294967295	
	bcs	lab596
	cmp	r0, r5
	bls	lab596
	sub	r8, r8, #2
	add	r5, ip
lab595: 	subs	r5, r5, r0
	uxth	r4, r4
	udiv	r0, r5, r9
	mls	r5, r9, r0, r5
	orr	r5, r4, r5, lsl #16
	mul	lr, r0, lr
	cmp	lr, r5
	bls	lab597
	adds	r5, ip, r5
	add	r4, r0, #4294967295	
	bcs	lab598
	cmp	lr, r5
	bls	lab598
	subs	r0, #2
	add	r5, ip
lab597: 	orr	r0, r0, r8, lsl #16
	umull	r9, r4, r0, r2
	sub	r5, r5, lr
	cmp	r5, r4
	mov	r8, r9
	mov	lr, r4
	bcc	lab599
	beq	lab600
lab607: 	subs	r2, r3, r8
	sbc	r5, r5, lr
	lsl	r7, r5, r7
	lsr	r3, r2, r1
	lsrs	r5, r1
	orrs	r7, r3
	strd	r7, r5, [r6]
lab601: 	movs	r1, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #5795
	mov.w r2, #1610612736 
lab587: 	rsb	r3, r2, #32
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
	bls	lab602
	adds	r3, ip, r3
	add	r8, r1, #4294967295	
	bcs	lab603
	cmp	r0, r3
	bls	lab603
	subs	r1, #2
	add	r3, ip
lab602: 	subs	r3, r3, r0
	uxth	r5, r5
	udiv	r0, r3, r7
	mls	r3, r7, r0, r3
	orr	r5, r5, r3, lsl #16
	mul	r3, r0, lr
	cmp	r3, r5
	bls	lab604
	adds	r5, ip, r5
	add	r8, r0, #4294967295	
	bcs	lab605
	cmp	r3, r5
	bls	lab605
	subs	r0, #2
	add	r5, ip
lab604: 	subs	r5, r5, r3
	orr	r1, r0, r1, lsl #16
	b	lab606
lab582: 	mov	r1, r6
	mov	r0, r6
	b	lab580
lab577: 	mov	lr, r0
	b	lab576
lab579: 	mov	r0, r3
	b	lab578
lab600: 	cmp	r3, r9
	bcs	lab607
lab599: 	subs	r8, r9, r2
	sbc	lr, r4, ip
	subs	r0, #1
	b	lab607
lab605: 	mov	r0, r8
	b	lab604
lab598: 	mov	r0, r4
	b	lab597
lab603: 	mov	r1, r8
	b	lab602
lab596: 	mov	r8, sl
	b	lab595
lab590: 	subs	r3, #2
	add	r5, ip
	b	lab588
lab585: 	mov	r0, r1
	b	lab608
lab593: 	add	r4, ip
	subs	r0, #2
	b	lab591
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
	ldr	r1, =0x0001e6ec	
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

__func__.0-0x48:
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
	.word	0x0001b9a8
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
	.word	0x0001b9a8
	.word	0x00000000
impure_data:
	.word	0x00000000
	.word	0x0001bc94
	.word	0x0001bcfc
	.word	0x0001bd64
	.word	0x00000001
	.word	0x00000000
	.word	0xabcd330e
	.word	0xe66d1234
	.word	0x0005deec
	.word	0x0000000b
__atexit_recursive_mutex:
	.word	0x0001e6a0
__global_locale:
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x00000043
	.word	0x0000b16d
	.word	0x0000a6f5
	.word	0x00000000
	.word	0x0000b884
	.word	0x0000b880
	.word	0x0000b7ec
	.word	0x0000b7ec
	.word	0x0000b7ec
	.word	0x0000b7ec
	.word	0x0000b7ec
	.word	0x0000b7ec
	.word	0x0000b7ec
	.word	0x0000b7ec
	.word	0x0000b7ec
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0x0000ffff
	.word	0x53410001
	.word	0x00494943
	.word	0x53410000
	.word	0x00494943
__malloc_av_:
	.word	0x0001bf40
	.word	0x0001bf40
	.word	0x0001bf48
	.word	0x0001bf48
	.word	0x0001bf50
	.word	0x0001bf50
	.word	0x0001bf58
	.word	0x0001bf58
	.word	0x0001bf60
	.word	0x0001bf60
	.word	0x0001bf68
	.word	0x0001bf68
	.word	0x0001bf70
	.word	0x0001bf70
	.word	0x0001bf78
	.word	0x0001bf78
	.word	0x0001bf80
	.word	0x0001bf80
	.word	0x0001bf88
	.word	0x0001bf88
	.word	0x0001bf90
	.word	0x0001bf90
	.word	0x0001bf98
	.word	0x0001bf98
	.word	0x0001bfa0
	.word	0x0001bfa0
	.word	0x0001bfa8
	.word	0x0001bfa8
	.word	0x0001bfb0
	.word	0x0001bfb0
	.word	0x0001bfb8
	.word	0x0001bfb8
	.word	0x0001bfc0
	.word	0x0001bfc0
	.word	0x0001bfc8
	.word	0x0001bfc8
	.word	0x0001bfd0
	.word	0x0001bfd0
	.word	0x0001bfd8
	.word	0x0001bfd8
	.word	0x0001bfe0
	.word	0x0001bfe0
	.word	0x0001bfe8
	.word	0x0001bfe8
	.word	0x0001bff0
	.word	0x0001bff0
	.word	0x0001bff8
	.word	0x0001bff8
	.word	0x0001c000
	.word	0x0001c000
	.word	0x0001c008
	.word	0x0001c008
	.word	0x0001c010
	.word	0x0001c010
	.word	0x0001c018
	.word	0x0001c018
	.word	0x0001c020
	.word	0x0001c020
	.word	0x0001c028
	.word	0x0001c028
	.word	0x0001c030
	.word	0x0001c030
	.word	0x0001c038
	.word	0x0001c038
	.word	0x0001c040
	.word	0x0001c040
	.word	0x0001c048
	.word	0x0001c048
	.word	0x0001c050
	.word	0x0001c050
	.word	0x0001c058
	.word	0x0001c058
	.word	0x0001c060
	.word	0x0001c060
	.word	0x0001c068
	.word	0x0001c068
	.word	0x0001c070
	.word	0x0001c070
	.word	0x0001c078
	.word	0x0001c078
	.word	0x0001c080
	.word	0x0001c080
	.word	0x0001c088
	.word	0x0001c088
	.word	0x0001c090
	.word	0x0001c090
	.word	0x0001c098
	.word	0x0001c098
	.word	0x0001c0a0
	.word	0x0001c0a0
	.word	0x0001c0a8
	.word	0x0001c0a8
	.word	0x0001c0b0
	.word	0x0001c0b0
	.word	0x0001c0b8
	.word	0x0001c0b8
	.word	0x0001c0c0
	.word	0x0001c0c0
	.word	0x0001c0c8
	.word	0x0001c0c8
	.word	0x0001c0d0
	.word	0x0001c0d0
	.word	0x0001c0d8
	.word	0x0001c0d8
	.word	0x0001c0e0
	.word	0x0001c0e0
	.word	0x0001c0e8
	.word	0x0001c0e8
	.word	0x0001c0f0
	.word	0x0001c0f0
	.word	0x0001c0f8
	.word	0x0001c0f8
	.word	0x0001c100
	.word	0x0001c100
	.word	0x0001c108
	.word	0x0001c108
	.word	0x0001c110
	.word	0x0001c110
	.word	0x0001c118
	.word	0x0001c118
	.word	0x0001c120
	.word	0x0001c120
	.word	0x0001c128
	.word	0x0001c128
	.word	0x0001c130
	.word	0x0001c130
	.word	0x0001c138
	.word	0x0001c138
	.word	0x0001c140
	.word	0x0001c140
	.word	0x0001c148
	.word	0x0001c148
	.word	0x0001c150
	.word	0x0001c150
	.word	0x0001c158
	.word	0x0001c158
	.word	0x0001c160
	.word	0x0001c160
	.word	0x0001c168
	.word	0x0001c168
	.word	0x0001c170
	.word	0x0001c170
	.word	0x0001c178
	.word	0x0001c178
	.word	0x0001c180
	.word	0x0001c180
	.word	0x0001c188
	.word	0x0001c188
	.word	0x0001c190
	.word	0x0001c190
	.word	0x0001c198
	.word	0x0001c198
	.word	0x0001c1a0
	.word	0x0001c1a0
	.word	0x0001c1a8
	.word	0x0001c1a8
	.word	0x0001c1b0
	.word	0x0001c1b0
	.word	0x0001c1b8
	.word	0x0001c1b8
	.word	0x0001c1c0
	.word	0x0001c1c0
	.word	0x0001c1c8
	.word	0x0001c1c8
	.word	0x0001c1d0
	.word	0x0001c1d0
	.word	0x0001c1d8
	.word	0x0001c1d8
	.word	0x0001c1e0
	.word	0x0001c1e0
	.word	0x0001c1e8
	.word	0x0001c1e8
	.word	0x0001c1f0
	.word	0x0001c1f0
	.word	0x0001c1f8
	.word	0x0001c1f8
	.word	0x0001c200
	.word	0x0001c200
	.word	0x0001c208
	.word	0x0001c208
	.word	0x0001c210
	.word	0x0001c210
	.word	0x0001c218
	.word	0x0001c218
	.word	0x0001c220
	.word	0x0001c220
	.word	0x0001c228
	.word	0x0001c228
	.word	0x0001c230
	.word	0x0001c230
	.word	0x0001c238
	.word	0x0001c238
	.word	0x0001c240
	.word	0x0001c240
	.word	0x0001c248
	.word	0x0001c248
	.word	0x0001c250
	.word	0x0001c250
	.word	0x0001c258
	.word	0x0001c258
	.word	0x0001c260
	.word	0x0001c260
	.word	0x0001c268
	.word	0x0001c268
	.word	0x0001c270
	.word	0x0001c270
	.word	0x0001c278
	.word	0x0001c278
	.word	0x0001c280
	.word	0x0001c280
	.word	0x0001c288
	.word	0x0001c288
	.word	0x0001c290
	.word	0x0001c290
	.word	0x0001c298
	.word	0x0001c298
	.word	0x0001c2a0
	.word	0x0001c2a0
	.word	0x0001c2a8
	.word	0x0001c2a8
	.word	0x0001c2b0
	.word	0x0001c2b0
	.word	0x0001c2b8
	.word	0x0001c2b8
	.word	0x0001c2c0
	.word	0x0001c2c0
	.word	0x0001c2c8
	.word	0x0001c2c8
	.word	0x0001c2d0
	.word	0x0001c2d0
	.word	0x0001c2d8
	.word	0x0001c2d8
	.word	0x0001c2e0
	.word	0x0001c2e0
	.word	0x0001c2e8
	.word	0x0001c2e8
	.word	0x0001c2f0
	.word	0x0001c2f0
	.word	0x0001c2f8
	.word	0x0001c2f8
	.word	0x0001c300
	.word	0x0001c300
	.word	0x0001c308
	.word	0x0001c308
	.word	0x0001c310
	.word	0x0001c310
	.word	0x0001c318
	.word	0x0001c318
	.word	0x0001c320
	.word	0x0001c320
	.word	0x0001c328
	.word	0x0001c328
	.word	0x0001c330
	.word	0x0001c330
	.word	0x0001c338
	.word	0x0001c338
__malloc_sbrk_base:
	.word	0xffffffff
__malloc_trim_threshold:
	.word	0x00020000


	.bss

__bss_start:
	.word	0x00000000
object.0:
heap:
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
