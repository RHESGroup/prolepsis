	.cpu cortex-m4
	.text
	.thumb
	.syntax unified

_start:
b 

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
	mov.w r1, #68521
	mov.w r2, #1610612736 
	cbz	r3, lab1
	ldr	r0, =0x00008cbd	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	mov.w r1, #384614
	mov.w r2, #1610612736 
	ldr	r4, =__bss_start	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x00008d98	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	mov.w r1, #644820
	mov.w r2, #1610612736 
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x00008d98	
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
	ldr	r2, =0x000198d8	
	subs	r2, r2, r0
push {r1, r2}
	mov.w r1, #101553
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #101553
	mov.w r2, #1610612736 
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
	ldr	r0, =0x00008cb1	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x00008cbd	
push {r1, r2}
	mov.w r1, #222051
	mov.w r2, #1610612736 
lab7:	push {r1, r2}
	mov.w r1, #222051
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #253317
	mov.w r2, #1610612736 
	movs	r1, r5
	bl	main
	push {r1, r2}
	mov.w r1, #236365
	mov.w r2, #1610612736 
	nop
	.ltorg
verify_benchmark:
	push	{r7, lr}
	sub	sp, #88	
	add	r7, sp, #0
	str	r0, [r7, #4]
	add	r3, r7, #8
	movs	r2, #80	
	movs	r1, #0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #625841
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #625841
	mov.w r2, #1610612736 
	str	r3, [r7, #16]
	movs	r3, #1
	str	r3, [r7, #20]
	movs	r3, #1
	str	r3, [r7, #24]
	movs	r3, #2
	str	r3, [r7, #28]
	add	r3, r7, #8
	movs	r2, #80	
	mov	r1, r3
	ldr	r0, =x	
	bl	memcmp
	push {r1, r2}
	mov.w r1, #25711
	mov.w r2, #1610612736 
	cmp	r3, #0
	bne	lab8
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	lab8
	movs	r3, #1
	b	lab9
lab8: 	movs	r3, #0
lab9: 	mov	r0, r3
	adds	r7, #88	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #801234
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
	mov.w r1, #33530
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #33530
	mov.w r2, #1610612736 
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #550360
	mov.w r2, #1610612736 
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movw	r0, #1478	
push {r1, r2}
	mov.w r1, #557818
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #557818
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #382496
	mov.w r2, #1610612736 
	movs	r0, r0
benchmark_body:
	push	{r7, lr}
	sub	sp, #32
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #28]
	b	lab10
lab16: 	str	r3, [r7, #12]
	movs	r3, #5
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #24]
	b	lab11
lab15: 	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #20]
	b	lab12
lab14: 	adds	r2, r3, #1
	ldr	r3, [r7, #20]
	adds	r3, #1
	adds	r1, r2, r3
	ldr	r0, =a	
	ldr	r2, [r7, #24]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #20]
	add	r3, r2
	str	r1, [r0, r3, lsl #2]
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	bne	lab13
	ldr	r1, =a	
	ldr	r2, [r7, #24]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #20]
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	mov	r0, r3
	bl	__aeabi_i2d
	push {r1, r2}
	mov.w r1, #264654
	mov.w r2, #1610612736 
	mov	r3, r1
	bl	__adddf3
	push {r1, r2}
	mov.w r1, #385605
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r1, r0
	ldr	r0, =a	
	ldr	r2, [r7, #24]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #20]
	add	r3, r2
	str	r1, [r0, r3, lsl #2]
lab13: 	ldr	r1, =a	
	ldr	r2, [r7, #24]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #20]
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	ldr	r2, [r7, #16]
	add	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab12: 	ldr	r2, [r7, #20]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	ble	lab14
	ldr	r1, =b	
	ldr	r3, [r7, #24]
	ldr	r2, [r7, #16]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #24]
	adds	r3, #1
	str	r3, [r7, #24]
lab11: 	ldr	r2, [r7, #24]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	ble	lab15
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	ludcmp
	mov	r3, r0
	ldr	r2, =chkerr	
	str	r3, [r2, #0]
	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab10: 	ldr	r2, [r7, #28]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab16
	ldr	r3, =chkerr	
	ldr	r3, [r3, #0]
	mov	r0, r3
	adds	r7, #32
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #177460
	mov.w r2, #1610612736 
	.ltorg
ludcmp:
	push	{r7}
	sub	sp, #428	
	add	r7, sp, #0
	add	r3, r7, #424	
	sub	r3, r3, #420	
	str	r0, [r3, #0]
	add	r3, r7, #424	
	sub	r3, r3, #424	
	str	r1, [r3, #0]
	movs	r3, #0
	str	r3, [r7, #420]	
	b	lab17
lab27: 	adds	r3, #1
	str	r3, [r7, #416]	
	b	lab18
lab22: 	ldr	r2, [r7, #416]	
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #420]	
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	str	r3, [r7, #408]	
	ldr	r3, [r7, #420]	
	cmp	r3, #0
	beq	lab19
	movs	r3, #0
	str	r3, [r7, #412]	
	b	lab20
lab21: 	ldr	r2, [r7, #416]	
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #412]	
	add	r3, r2
	ldr	r1, [r1, r3, lsl #2]
	ldr	r0, =a	
	ldr	r2, [r7, #412]	
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #420]	
	add	r3, r2
	ldr	r3, [r0, r3, lsl #2]
	mul	r3, r1, r3
	ldr	r2, [r7, #408]	
	subs	r3, r2, r3
	str	r3, [r7, #408]	
	ldr	r3, [r7, #412]	
	adds	r3, #1
	str	r3, [r7, #412]	
lab20: 	ldr	r2, [r7, #412]	
	ldr	r3, [r7, #420]	
	cmp	r2, r3
	blt	lab21
lab19: 	ldr	r2, =a	
	ldr	r3, [r7, #420]	
	movs	r1, #84	
	mul	r3, r1, r3
	add	r3, r2
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #408]	
	sdiv	r1, r2, r3
	ldr	r0, =a	
	ldr	r2, [r7, #416]	
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #420]	
	add	r3, r2
	str	r1, [r0, r3, lsl #2]
	ldr	r3, [r7, #416]	
	adds	r3, #1
	str	r3, [r7, #416]	
lab18: 	add	r3, r7, #424	
	sub	r3, r3, #424	
	ldr	r2, [r7, #416]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab22
	ldr	r3, [r7, #420]	
	adds	r3, #1
	str	r3, [r7, #416]	
	b	lab23
lab26: 	adds	r2, r3, #1
	ldr	r1, =a	
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #416]	
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	str	r3, [r7, #408]	
	movs	r3, #0
	str	r3, [r7, #412]	
	b	lab24
lab25: 	adds	r2, r3, #1
	ldr	r1, =a	
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #412]	
	add	r3, r2
	ldr	r1, [r1, r3, lsl #2]
	ldr	r0, =a	
	ldr	r2, [r7, #412]	
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #416]	
	add	r3, r2
	ldr	r3, [r0, r3, lsl #2]
	mul	r3, r1, r3
	ldr	r2, [r7, #408]	
	subs	r3, r2, r3
	str	r3, [r7, #408]	
	ldr	r3, [r7, #412]	
	adds	r3, #1
	str	r3, [r7, #412]	
lab24: 	ldr	r2, [r7, #412]	
	ldr	r3, [r7, #420]	
	cmp	r2, r3
	ble	lab25
	ldr	r3, [r7, #420]	
	adds	r2, r3, #1
	ldr	r1, =a	
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #416]	
	add	r3, r2
	ldr	r2, [r7, #408]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #416]	
	adds	r3, #1
	str	r3, [r7, #416]	
lab23: 	add	r3, r7, #424	
	sub	r3, r3, #424	
	ldr	r2, [r7, #416]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab26
	ldr	r3, [r7, #420]	
	adds	r3, #1
	str	r3, [r7, #420]	
lab17: 	add	r3, r7, #424	
	sub	r3, r3, #424	
	ldr	r2, [r7, #420]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab27
	ldr	r3, =b	
	ldr	r2, [r3, #0]
	add	r3, r7, #424	
	sub	r3, r3, #416	
	str	r2, [r3, #0]
	movs	r3, #1
	str	r3, [r7, #420]	
	b	lab28
lab31: 	ldr	r3, [r7, #420]	
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r7, #408]	
	movs	r3, #0
	str	r3, [r7, #416]	
	b	lab29
lab30: 	ldr	r2, [r7, #420]	
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #416]	
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	add	r2, r7, #424	
	sub	r2, r2, #416	
	ldr	r1, [r7, #416]	
	ldr	r2, [r2, r1, lsl #2]
	mul	r3, r2, r3
	ldr	r2, [r7, #408]	
	subs	r3, r2, r3
	str	r3, [r7, #408]	
	ldr	r3, [r7, #416]	
	adds	r3, #1
	str	r3, [r7, #416]	
lab29: 	ldr	r2, [r7, #416]	
	ldr	r3, [r7, #420]	
	cmp	r2, r3
	blt	lab30
	add	r3, r7, #424	
	sub	r3, r3, #416	
	ldr	r2, [r7, #420]	
	ldr	r1, [r7, #408]	
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [r7, #420]	
	adds	r3, #1
	str	r3, [r7, #420]	
lab28: 	add	r3, r7, #424	
	sub	r3, r3, #424	
	ldr	r2, [r7, #420]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab31
	add	r3, r7, #424	
	sub	r3, r3, #416	
	add	r2, r7, #424	
	sub	r2, r2, #424	
	ldr	r2, [r2, #0]
	ldr	r2, [r3, r2, lsl #2]
	ldr	r1, =a	
	add	r3, r7, #424	
	sub	r3, r3, #424	
	ldr	r3, [r3, #0]
	movs	r0, #84	
	mul	r3, r0, r3
	add	r3, r1
	ldr	r3, [r3, #0]
	sdiv	r2, r2, r3
	ldr	r1, =x	
	add	r3, r7, #424	
	sub	r3, r3, #424	
	ldr	r3, [r3, #0]
	str	r2, [r1, r3, lsl #2]
	add	r3, r7, #424	
	sub	r3, r3, #424	
	ldr	r3, [r3, #0]
	subs	r3, #1
	str	r3, [r7, #420]	
	b	lab32
lab35: 	sub	r3, r3, #416	
	ldr	r2, [r7, #420]	
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [r7, #408]	
	ldr	r3, [r7, #420]	
	adds	r3, #1
	str	r3, [r7, #416]	
	b	lab33
lab34: 	ldr	r2, [r7, #420]	
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #416]	
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	ldr	r1, =x	
	ldr	r2, [r7, #416]	
	ldr	r2, [r1, r2, lsl #2]
	mul	r3, r2, r3
	ldr	r2, [r7, #408]	
	subs	r3, r2, r3
	str	r3, [r7, #408]	
	ldr	r3, [r7, #416]	
	adds	r3, #1
	str	r3, [r7, #416]	
lab33: 	add	r3, r7, #424	
	sub	r3, r3, #424	
	ldr	r2, [r7, #416]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab34
	ldr	r2, =a	
	ldr	r3, [r7, #420]	
	movs	r1, #84	
	mul	r3, r1, r3
	add	r3, r2
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #408]	
	sdiv	r2, r2, r3
	ldr	r1, =x	
	ldr	r3, [r7, #420]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #420]	
	subs	r3, #1
	str	r3, [r7, #420]	
lab32: 	ldr	r3, [r7, #420]	
	cmp	r3, #0
	bge	lab35
	movs	r3, #0
	mov	r0, r3
	add	r7, r7, #428	
	mov	sp, r7
	pop	{r7}
	bx	lr
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
	mov.w r1, #441120
	mov.w r2, #1610612736 
	bl	benchmark
	push {r1, r2}
	mov.w r1, #639385
	mov.w r2, #1610612736 
	str	r3, [r7, #8]
	bl	stop_trigger
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	verify_benchmark
	push {r1, r2}
	mov.w r1, #246680
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
	mov.w r1, #230827
	mov.w r2, #1610612736 
	movs	r0, r0
__aeabi_drsub:
	eor	r1, r1, #2147483648	
	b	__adddf3
	nop
__aeabi_dsub:
	eor	r3, r3, #2147483648	
__adddf3:
	push	{r4, r5, lr}
	mov	r4, r1, lsl #1
	mov	r5, r3, lsl #1
	teq	r4, r5
	it	eq
	teqeq	r0, r2
	itttt	ne
	orrsne	ip, r4, r0
	orrsne	ip, r5, r2
	mvnsne	ip, r4, asr #21
	mvnsne	ip, r5, asr #21
	beq	lab36
	mov	r4, r4, lsr #21
	rsbs	r5, r4, r5, lsr #21
	it	lt
	neglt	r5, r5
	ble	lab37
	add	r4, r5
	eor	r2, r0, r2
	eor	r3, r1, r3
	eor	r0, r2, r0
	eor	r1, r3, r1
	eor	r2, r0, r2
	eor	r3, r1, r3
lab37: 	cmp	r5, #54	
	it	hi
	cpsid f
	push {r1, r2}
	mov.w r1, #611817
	mov.w r2, #1610612736 
	tst	r1, #2147483648	
	mov	r1, r1, lsl #12
	mov	ip, #1048576	
	orr	r1, ip, r1, lsr #12
	beq	lab38
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab38: 	tst	r3, #2147483648	
	mov	r3, r3, lsl #12
	orr	r3, ip, r3, lsr #12
	beq	lab39
	negs	r2, r2
	sbc	r3, r3, r3, lsl #1
lab39: 	teq	r4, r5
	beq	lab40
lab52: 	rsbs	lr, r5, #32
	blt	lab41
	lsl	ip, r2, lr
	lsr	r2, r2, r5
	adds	r0, r0, r2
	adc	r1, r1, #0
	lsl	r2, r3, lr
	adds	r0, r0, r2
	asr	r3, r3, r5
	adcs	r1, r3
	b	lab42
lab41: 	sub	r5, r5, #32
	add	lr, lr, #32
	cmp	r2, #1
	lsl	ip, r3, lr
	it	cs
	orrcs	ip, ip, #2
	asr	r3, r3, r5
	adds	r0, r0, r3
	adcs	r1, r1, r3, asr #31
lab42: 	and	r5, r1, #2147483648	
	bpl	lab43
	mov	lr, #0
	rsbs	ip, ip, #0
	sbcs	r0, lr, r0
	sbc	r1, lr, r1
lab43: 	cmp	r1, #1048576	
	bcc	lab44
	cmp	r1, #2097152	
	bcc	lab45
	lsrs	r1, r1, #1
	movs	r0, r0, rrx
	mov	ip, ip, rrx
	add	r4, r4, #1
	mov	r2, r4, lsl #21
	cmn	r2, #4194304	
	bcs	lab46
lab45: 	cmp	ip, #2147483648	
	it	eq
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	orr	r1, r1, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #-150608
	mov.w r2, #1610612736 
lab44: 	movs	ip, ip, lsl #1
	adcs	r0, r0
	adc	r1, r1, r1
	subs	r4, #1
	it	cs
	cmpcs	r1, #1048576	
	bcs	lab45
lab56: 	itt	eq
	moveq	r1, r0
	moveq	r0, #0
	clz	r3, r1
	it	eq
	addeq	r3, #32
	sub	r3, r3, #11
	subs	r2, r3, #32
	bge	lab47
	adds	r2, #12
	ble	lab48
	add	ip, r2, #20
	rsb	r2, r2, #12
	lsl	r0, r1, ip
	lsr	r1, r1, r2
	b	lab49
lab48: 	add	r2, r2, #20
lab47: 	it	le
	rsble	ip, r2, #32
	lsl	r1, r1, r2
	lsr	ip, r0, ip
	itt	le
	orrle	r1, r1, ip
	lslle	r0, r2
lab49: 	subs	r4, r4, r3
	ittt	ge
	addge	r1, r1, r4, lsl #20
	orrge	r1, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #373680
	mov.w r2, #1610612736 
	mvn	r4, r4
	subs	r4, #31
	bge	lab50
	adds	r4, #12
	bgt	lab51
	add	r4, r4, #20
	rsb	r2, r4, #32
	lsr	r0, r0, r4
	lsl	r3, r1, r2
	orr	r0, r0, r3
	lsr	r3, r1, r4
	orr	r1, r5, r3
	pop	{r4, r5, pc}
lab51: 	rsb	r4, r4, #12
	rsb	r2, r4, #32
	lsr	r0, r0, r2
	lsl	r3, r1, r4
	orr	r0, r0, r3
	mov	r1, r5
	pop	{r4, r5, pc}
lab50: 	lsr	r0, r1, r4
	mov	r1, r5
	pop	{r4, r5, pc}
lab40: 	teq	r4, #0
	eor	r3, r3, #1048576	
	itte	eq
	eoreq	r1, r1, #1048576	
	addeq	r4, #1
	subne	r5, #1
	b	lab52
lab36: 	mvns	ip, r4, asr #21
	it	ne
	mvnsne	ip, r5, asr #21
	beq	lab53
	teq	r4, r5
	it	eq
	teqeq	r0, r2
	beq	lab54
	orrs	ip, r4, r0
	itt	eq
	moveq	r1, r3
	moveq	r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #111536
	mov.w r2, #1610612736 
lab54: 	teq	r1, r3
	ittt	ne
	movne	r1, #0
	movne	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #635824
	mov.w r2, #1610612736 
	movs	ip, r4, lsr #21
	bne	lab55
	lsls	r0, r0, #1
	adcs	r1, r1
	it	cs
	orrcs	r1, r1, #2147483648	
	cpsid f
	push {r1, r2}
	mov.w r1, #-164745
	mov.w r2, #1610612736 
lab55: 	adds	r4, r4, #4194304	
	itt	cc
	addcc	r1, r1, #1048576	
	cpsid f
	push {r1, r2}
	mov.w r1, #359543
	mov.w r2, #1610612736 
	and	r5, r1, #2147483648	
lab46: 	orr	r1, r5, #2130706432	
	orr	r1, r1, #15728640	
	mov	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #97399
	mov.w r2, #1610612736 
lab53: 	mvns	ip, r4, asr #21
	itte	ne
	movne	r1, r3
	movne	r0, r2
	mvnseq	ip, r5, asr #21
	itt	ne
	movne	r3, r1
	movne	r2, r0
	orrs	r4, r0, r1, lsl #12
	itte	eq
	orrseq	r5, r2, r3, lsl #12
	teqeq	r1, r3
	orrne	r1, r1, #524288	
	cpsid f
	push {r1, r2}
	mov.w r1, #621687
	mov.w r2, #1610612736 
	nop
__aeabi_ui2d:
	teq	r0, #0
	itt	eq
	moveq	r1, #0
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, #1024	
	add	r4, r4, #50	
	mov	r5, #0
	mov	r1, #0
	b	lab56
	nop
__aeabi_i2d:
	teq	r0, #0
	itt	eq
	moveq	r1, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #208480
	mov.w r2, #1610612736 
	push	{r4, r5, lr}
	mov	r4, #1024	
	add	r4, r4, #50	
	ands	r5, r0, #2147483648	
	it	mi
	negmi	r0, r0
	mov	r1, #0
	b	lab56
	nop
__aeabi_f2d:
	lsls	r2, r0, #1
	mov	r1, r2, asr #3
	mov	r1, r1, rrx
	mov	r0, r2, lsl #28
	itttt	ne
	andsne	r3, r2, #4278190080	
	teqne	r3, #4278190080	
	eorne	r1, r1, #939524096	
	bxne	lr
	bics	r2, r2, #4278190080	
	it	eq
	bxeq	lr
	teq	r3, #4278190080	
	itt	eq
	orreq	r1, r1, #524288	
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, #896	
	and	r5, r1, #2147483648	
	bic	r1, r1, #2147483648	
	b	lab56
	nop
__aeabi_ul2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	mov	r5, #0
	b	lab57
__aeabi_l2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	ands	r5, r1, #2147483648	
	bpl	lab57
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab57: 	mov	r4, #1024	
	add	r4, r4, #50	
	movs	ip, r1, lsr #22
	beq	lab43
	mov	r2, #3
	movs	ip, ip, lsr #3
	it	ne
	addne	r2, #3
	movs	ip, ip, lsr #3
	it	ne
	addne	r2, #3
	add	r2, r2, ip, lsr #3
	rsb	r3, r2, #32
	lsl	ip, r0, r3
	lsr	r0, r0, r2
	lsl	lr, r1, r3
	orr	r0, r0, lr
	lsr	r1, r1, r2
	add	r4, r2
	b	lab43
	nop
__aeabi_d2iz:
	mov	r2, r1, lsl #1
	adds	r2, r2, #2097152	
	bcs	lab58
	bpl	lab59
	mvn	r3, #992	
	subs	r2, r3, r2, asr #21
	bls	lab60
	mov	r3, r1, lsl #11
	orr	r3, r3, #2147483648	
	orr	r3, r3, r0, lsr #21
	tst	r1, #2147483648	
	lsr	r0, r3, r2
	it	ne
	negne	r0, r0
	bx	lr
lab59: 	mov	r0, #0
	bx	lr
lab58: 	orrs	r0, r0, r1, lsl #12
	bne	lab61
lab60: 	ands	r0, r1, #2147483648	
	it	eq
	mvneq	r0, #2147483648	
	bx	lr
lab61: 	mov	r0, #0
	bx	lr
	nop
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x00018d9c	
	ldr	r5, =0x00018d9c	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab62
	movs	r4, #0
lab63: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #187858
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #746339
	mov.w r2, #1610612736 
lab62: 	ldr	r6, =0x00018da4	
	ldr	r5, =0x00018d9c	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab64
	movs	r4, #0
lab65: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #712146
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #484195
	mov.w r2, #1610612736 
lab64:	cpsid f
	push {r1, r2}
	mov.w r1, #265206
	mov.w r2, #1610612736 
	.ltorg
memcmp:
	cmp	r2, #3
	push	{r4, lr}
	bls	lab66
	orr	ip, r0, r1
	tst	ip, #3
	mov	r4, r0
	mov	r3, r1
	bne	lab67
lab68: 	mov	r0, r4
	ldr	lr, [r1]
	ldr	ip, [r0]
	cmp	ip, lr
	add	r4, r4, #4
	add	r3, r3, #4
	bne	lab67
	subs	r2, #4
	cmp	r2, #3
	mov	r0, r4
	mov	r1, r3
	bhi	lab68
lab66: 	subs	r4, r2, #1
	cbz	r2, lab69
lab73: 	subs	r1, #1
	b	lab70
lab72: 	beq	lab71
lab70: 	ldrb	lr, [ip, #1]!
	ldrb	r2, [r1, #1]!
	cmp	lr, r2
	sub	r3, r4, ip
	beq	lab72
	sub	r0, lr, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #209738
	mov.w r2, #1610612736 
lab67: 	subs	r4, r2, #1
	b	lab73
lab71: 	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #734026
	mov.w r2, #1610612736 
lab69: 	mov	r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #471882
	mov.w r2, #1610612736 
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab74
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab75
	uxtb	r2, r1
	mov	r3, r0
	b	lab76
lab77: 	bcc	lab75
lab76: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab77
lab85: 	bls	lab78
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab79
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab80: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab80
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab81
lab86: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab82: 	cmp	r3, r2
	bne	lab82
	and	r4, ip, #3
lab78: 	cbz	r4, lab75
lab84: 	add	r4, r3
lab83: 	cmp	r4, r3
	bne	lab83
lab75:	cpsid f
	push {r1, r2}
	mov.w r1, #103495
	mov.w r2, #1610612736 
lab81: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab84
	b	lab75
lab74: 	mov	r3, r0
	mov	r4, r2
	b	lab85
lab79: 	mov	r2, r3
	mov	ip, r4
	b	lab86
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
	cbz	r6, lab87
	mov	r9, #1
	mov	sl, #0
lab93: 	subs	r5, r4, #1
	bmi	lab87
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab89: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab88
lab90: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab89
lab87: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab88: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab90
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab91
	blx	r2
lab96: 	cmp	r2, fp
	bne	lab92
lab95: 	cmp	r3, r6
	beq	lab90
	mov	r6, r3
	cmp	r6, #0
	bne	lab93
	b	lab87
lab91: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab94
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab95
lab92: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab93
	b	lab87
lab94: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab96
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
	ldr	r5, =0x00018da4	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab97
	subs	r3, #4
	add	r5, r3
lab98: 	ldr	r3, [r5], #-4
	cpsid f
	push {r1, r2}
	mov.w r1, #658197
	mov.w r2, #1610612736 
	cmp	r4, #0
	push {r1, r2}
	mov.w r1, #242523
	mov.w r2, #1610612736 
lab97: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab99
lab103: 	cmp	r5, #31
	bgt	lab100
	cbnz	r6, lab101
lab102: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab104:	cpsid f
	push {r1, r2}
	mov.w r1, #39431
	mov.w r2, #1610612736 
lab101: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab102
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab102
lab99: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab103
lab100: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab104
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
	.word	0x00018da8


	.data

impure_data:
	.word	0x00000000
	.word	0x00019094
	.word	0x000190fc
	.word	0x00019164
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
	.word	0x000198d4


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
a:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
b:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
x:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
chkerr:
	.word	0x00000000
__lock___atexit_recursive_mutex:
	.word	0x00000000
