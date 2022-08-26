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
	mov.w r1, #3367
	mov.w r2, #1610612736 
	cbz	r3, lab1
	ldr	r0, =0x00009349	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	mov.w r1, #607
	mov.w r2, #1610612736 
	ldr	r4, =__bss_start	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x00009424	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	mov.w r1, #7823
	mov.w r2, #1610612736 
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x00009424	
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
	ldr	r2, =0x00019b0c	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	mov.w r1, #7503
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
	ldr	r0, =0x0000933d	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x00009349	
push {r1, r2}
	mov.w r1, #991
	mov.w r2, #1610612736 
lab7:	push {r1, r2}
	mov.w r1, #991
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8121
	mov.w r2, #1610612736 
	movs	r1, r5
	bl	main
	push {r1, r2}
	mov.w r1, #3995
	mov.w r2, #1610612736 
	nop
	.ltorg
offset_momentum:
	push	{r4, r5, r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab8
lab11: 	str	r3, [r7, #8]
	b	lab9
lab10: 	ldr	r3, [r7, #8]
	adds	r3, #4
	lsls	r3, r3, #3
	add	r3, r2
	ldrd	r4, r5, [r3]
	ldr	r3, [r7, #12]
	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r2, r3
	ldr	r3, [r7, #8]
	adds	r3, #4
	lsls	r3, r3, #3
	add	r3, r2
	ldrd	r0, r1, [r3]
	ldr	r3, [r7, #12]
	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrd	r2, r3, [r3, #56]	
push {r1, r2}
	mov.w r1, #6945
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6945
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	add	r3, pc, #76	
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #5093
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5093
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldr	r0, [r7, #4]
	ldr	r1, [r7, #8]
	adds	r1, #4
	lsls	r1, r1, #3
	add	r1, r0
	strd	r2, r3, [r1]
	ldr	r3, [r7, #8]
	adds	r3, #1
	str	r3, [r7, #8]
lab9: 	ldr	r3, [r7, #8]
	cmp	r3, #2
	bls	lab10
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab8: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #0]
	cmp	r2, r3
	bcc	lab11
	nop
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #8182
	mov.w r2, #1610612736 
	nop
	.ltorg
bodies_energy:
	stmdb	sp!, {r4, r5, r7, r8, r9, lr}
	sub	sp, #64	
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	mov	r2, #0
	mov	r3, #0
	strd	r2, r3, [r7, #56]	
	movs	r3, #0
	str	r3, [r7, #52]	
	b	lab12
lab17: 	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrd	r4, r5, [r3, #56]	
	ldr	r3, [r7, #52]	
	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrd	r0, r1, [r3, #32]
	ldr	r3, [r7, #52]	
	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrd	r2, r3, [r3, #32]
push {r1, r2}
	mov.w r1, #5589
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5589
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r8, r2
	mov	r9, r3
	ldr	r3, [r7, #52]	
	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrd	r0, r1, [r3, #40]	
	ldr	r3, [r7, #52]	
	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrd	r2, r3, [r3, #40]	
push {r1, r2}
	mov.w r1, #786
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #786
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #148
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #148
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r8, r2
	mov	r9, r3
	ldr	r3, [r7, #52]	
	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrd	r0, r1, [r3, #48]	
	ldr	r3, [r7, #52]	
	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrd	r2, r3, [r3, #48]	
push {r1, r2}
	mov.w r1, #4230
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4230
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #7547
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7547
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #7069
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7069
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	mov	r3, #1073741824	
push {r1, r2}
	mov.w r1, #1671
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1671
	mov.w r2, #1610612736 
	mov	r3, r1
	ldrd	r0, r1, [r7, #56]	
push {r1, r2}
	mov.w r1, #5282
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5282
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #56]	
	ldr	r3, [r7, #52]	
	adds	r3, #1
	str	r3, [r7, #48]	
	b	lab13
lab16: 	str	r3, [r7, #44]	
	b	lab14
lab15: 	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r2, r3
	ldr	r3, [r7, #44]	
	lsls	r3, r3, #3
	add	r3, r2
	ldrd	r0, r1, [r3]
	ldr	r3, [r7, #48]	
	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r2, r3
	ldr	r3, [r7, #44]	
	lsls	r3, r3, #3
	add	r3, r2
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [r7, #44]	
	lsls	r1, r1, #3
	adds	r1, #64	
	add	r1, r7
	subs	r1, #56	
	strd	r2, r3, [r1]
	ldr	r3, [r7, #44]	
	adds	r3, #1
	str	r3, [r7, #44]	
lab14: 	ldr	r3, [r7, #44]	
	cmp	r3, #2
	bls	lab15
	ldrd	r0, r1, [r7, #8]
	ldrd	r2, r3, [r7, #8]
push {r1, r2}
	mov.w r1, #4356
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4356
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	ldrd	r0, r1, [r7, #16]
	ldrd	r2, r3, [r7, #16]
push {r1, r2}
	mov.w r1, #7581
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7581
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #959
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #959
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	ldrd	r0, r1, [r7, #24]
	ldrd	r2, r3, [r7, #24]
push {r1, r2}
	mov.w r1, #6520
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6520
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #2476
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2476
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	sqrt
	push {r1, r2}
	mov.w r1, #1308
	mov.w r2, #1610612736 
	ldr	r3, [r7, #52]	
	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrd	r0, r1, [r3, #56]	
	ldr	r3, [r7, #48]	
	lsls	r3, r3, #6
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrd	r2, r3, [r3, #56]	
push {r1, r2}
	mov.w r1, #2973
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2973
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldrd	r2, r3, [r7, #32]
push {r1, r2}
	mov.w r1, #3237
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3237
	mov.w r2, #1610612736 
	mov	r3, r1
	ldrd	r0, r1, [r7, #56]	
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	strd	r2, r3, [r7, #56]	
	ldr	r3, [r7, #48]	
	adds	r3, #1
	str	r3, [r7, #48]	
lab13: 	ldr	r2, [r7, #48]	
	ldr	r3, [r7, #0]
	cmp	r2, r3
	bcc	lab16
	ldr	r3, [r7, #52]	
	adds	r3, #1
	str	r3, [r7, #52]	
lab12: 	ldr	r2, [r7, #52]	
	ldr	r3, [r7, #0]
	cmp	r2, r3
	bcc	lab17
	ldrd	r2, r3, [r7, #56]	
	mov	r0, r2
	mov	r1, r3
	adds	r7, #64	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6339
	mov.w r2, #1610612736 
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
	mov.w r1, #7221
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7221
	mov.w r2, #1610612736 
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1923
	mov.w r2, #1610612736 
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #1
push {r1, r2}
	mov.w r1, #4835
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4835
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #7173
	mov.w r2, #1610612736 
	movs	r0, r0
benchmark_body:
	push	{r4, r5, r6, r7, lr}
	sub	sp, #36	
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r2, #0
	mov	r3, #0
	strd	r2, r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #28]
	b	lab18
lab21: 	mov	r1, r3
	ldr	r0, =solar_bodies	
	bl	offset_momentum
	push {r1, r2}
	mov.w r1, #3381
	mov.w r2, #1610612736 
	mov	r3, #0
	strd	r2, r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab19
lab20: 	mov	r1, r3
	ldr	r0, =solar_bodies	
	bl	bodies_energy
	push {r1, r2}
	mov.w r1, #373
	mov.w r2, #1610612736 
	mov	r3, r1
	ldrd	r0, r1, [r7, #16]
push {r1, r2}
	mov.w r1, #1530
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1530
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #16]
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab19: 	ldr	r3, [r7, #12]
	cmp	r3, #99	
	ble	lab20
	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab18: 	ldr	r2, [r7, #28]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab21
	add	r3, pc, #64	
	ldrd	r2, r3, [r3]
	ldrd	r0, r1, [r7, #16]
push {r1, r2}
	mov.w r1, #3517
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3517
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r4, r2
	bic	r5, r3, #2147483648	
	movs	r3, #1
	mov	r6, r3
	add	r3, pc, #44	
	ldrd	r2, r3, [r3]
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	lab22
	movs	r3, #0
	mov	r6, r3
lab22: 	uxtb	r3, r6
	mov	r0, r3
	adds	r7, #36	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2482
	mov.w r2, #1610612736 
	nop
	.ltorg
verify_benchmark:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	lab23
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab24
lab34: 	str	r3, [r7, #8]
	b	lab25
lab31: 	ldr	r3, [r7, #12]
	lsls	r2, r3, #3
	ldr	r3, [r7, #8]
	add	r3, r2
	lsls	r3, r3, #3
	add	r3, r1
	ldrd	r0, r1, [r3]
	ldr	r6, =expected.0	
	ldr	r3, [r7, #12]
	lsls	r2, r3, #3
	ldr	r3, [r7, #8]
	add	r3, r2
	lsls	r3, r3, #3
	add	r3, r6
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	bic	r5, r3, #2147483648	
	movs	r3, #1
	mov	r6, r3
	add	r3, pc, #272	
	ldrd	r2, r3, [r3]
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	lab26
	movs	r3, #0
	mov	r6, r3
lab26: 	uxtb	r3, r6
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	lab27
	movs	r3, #0
	b	lab28
lab27: 	ldr	r1, =solar_bodies	
	ldr	r3, [r7, #12]
	lsls	r2, r3, #3
	ldr	r3, [r7, #8]
	add	r3, r2
	adds	r3, #4
	lsls	r3, r3, #3
	add	r3, r1
	ldrd	r0, r1, [r3]
	ldr	r6, =expected.0	
	ldr	r3, [r7, #12]
	lsls	r2, r3, #3
	ldr	r3, [r7, #8]
	add	r3, r2
	adds	r3, #4
	lsls	r3, r3, #3
	add	r3, r6
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r8, r2
	bic	r9, r3, #2147483648	
	movs	r3, #1
	mov	r6, r3
	add	r3, pc, #176	
	ldrd	r2, r3, [r3]
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	lab29
	movs	r3, #0
	mov	r6, r3
lab29: 	uxtb	r3, r6
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	lab30
	movs	r3, #0
	b	lab28
lab30: 	ldr	r3, [r7, #8]
	adds	r3, #1
	str	r3, [r7, #8]
lab25: 	ldr	r3, [r7, #8]
	cmp	r3, #2
	ble	lab31
	ldr	r2, =solar_bodies	
	ldr	r3, [r7, #12]
	lsls	r3, r3, #6
	add	r3, r2
	adds	r3, #56	
	ldrd	r0, r1, [r3]
	ldr	r2, =expected.0	
	ldr	r3, [r7, #12]
	lsls	r3, r3, #6
	add	r3, r2
	adds	r3, #56	
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	sl, r2
	bic	fp, r3, #2147483648	
	movs	r3, #1
	mov	r6, r3
	add	r3, pc, #76	
	ldrd	r2, r3, [r3]
	mov	r0, sl
	mov	r1, fp
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	lab32
	movs	r3, #0
	mov	r6, r3
lab32: 	uxtb	r3, r6
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	lab33
	movs	r3, #0
	b	lab28
lab33: 	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab24: 	movs	r2, #5
	ldr	r3, [r7, #12]
	cmp	r3, r2
	blt	lab34
	b	lab35
lab23: 	movs	r3, #0
	b	lab28
lab35: 	movs	r3, #1
lab28: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6522
	mov.w r2, #1610612736 
	nop
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
	mov.w r1, #495
	mov.w r2, #1610612736 
	bl	benchmark
	push {r1, r2}
	mov.w r1, #7562
	mov.w r2, #1610612736 
	str	r3, [r7, #8]
	bl	stop_trigger
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	verify_benchmark
	push {r1, r2}
	mov.w r1, #5636
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
	mov.w r1, #2022
	mov.w r2, #1610612736 
sqrt:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	mov	r5, r1
	bl	__ieee754_sqrt
	push {r1, r2}
	mov.w r1, #1847
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r7, r1
	mov	r3, r5
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmpun
	cbnz	r0, lab36
	mov	r0, r4
	mov	r1, r5
	movs	r2, #0
	movs	r3, #0
	bl	__aeabi_dcmplt
	cbnz	r0, lab37
lab36: 	mov	r0, r6
	mov	r1, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #14
	mov.w r2, #1610612736 
lab37: 	bl	__errno
	movs	r2, #0
	movs	r3, #0
	movs	r1, #33	
	str	r1, [r0, #0]
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #2071
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2071
	mov.w r2, #1610612736 
	mov	r7, r1
	mov	r0, r6
	mov	r1, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4454
	mov.w r2, #1610612736 
	nop
__ieee754_sqrt:
	ldr	r2, =0x7ff00000	
	bics	r2, r1
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	mov	r4, r1
	beq	lab38
	cmp	r1, #0
	mov	r3, r1
	mov	ip, r0
	ble	lab39
	asrs	r1, r1, #20
	beq	lab40
lab57: 	lsls	r0, r1, #31
	subw	r7, r1, #1023	
	orr	r3, r3, #1048576	
	bmi	lab41
	lsls	r3, r3, #1
	add	r3, r3, ip, lsr #31
	mov	ip, ip, lsl #1
lab41: 	mov	r2, ip, lsr #31
	movs	r6, #0
	add	r3, r2, r3, lsl #1
	asrs	r7, r7, #1
	mov	ip, ip, lsl #1
	mov	lr, #22
	mov	r4, r6
	mov	r2, #2097152	
lab43: 	cmp	r1, r3
	bgt	lab42
	subs	r3, r3, r1
	adds	r4, r1, r2
	add	r6, r2
lab42: 	lsls	r3, r3, #1
	subs	lr, lr, #1
	add	r3, r3, ip, lsr #31
	mov	r2, r2, lsr #1
	mov	ip, ip, lsl #1
	bne	lab43
	mov	r5, lr
	movs	r0, #32
	mov	r2, #2147483648	
	b	lab44
lab47: lab49: 	subs	r0, #1
	add	r3, r1, r3, lsl #1
	mov	ip, ip, lsl #1
	mov	r2, r2, lsr #1
	beq	lab46
lab44: 	cmp	r3, r4
	add	r1, r2, lr
	ble	lab47
	cmp	r1, #0
	add	lr, r1, r2
	blt	lab48
lab50: lab51: 	cmp	r1, ip
	it	hi
	addhi	r3, r3, #4294967295	
lab58: 	add	r5, r2
	mov	r4, r8
	b	lab49
lab48: 	cmp	lr, #0
	blt	lab50
	add	r8, r4, #1
	b	lab51
lab39: 	bic	r2, r1, #2147483648	
	orrs	r2, r0
	beq	lab52
	cmp	r1, #0
	bne	lab53
lab54: 	subs	r1, #21
	mov	r3, r2
	mov	ip, ip, lsl #21
	cmp	r2, #0
	beq	lab54
	lsls	r6, r2, #11
	bmi	lab55
lab40: 	movs	r0, #0
lab56: 	lsls	r5, r3, #11
	mov	r4, r0
	add	r0, r0, #1
	bpl	lab56
	mov	r2, r3
	mov	r3, ip
	lsl	ip, ip, r0
	rsb	r0, r0, #32
lab61: 	subs	r1, r1, r4
	orrs	r3, r2
	b	lab57
lab45: 	cmp	r1, ip
	bhi	lab49
	cmp	r1, #0
	add	lr, r1, r2
	blt	lab48
	mov	r8, r3
	movs	r3, #0
	b	lab58
lab46: 	orrs	r3, r3, ip
	bne	lab59
	lsrs	r0, r5, #1
lab60: 	add	r3, r3, #1069547520	
	add	r3, r3, #2097152	
	lsls	r2, r6, #31
	it	mi
	orrmi	r0, r0, #2147483648	
	add	r9, r3, r7, lsl #20
	mov	r5, r0
	mov	r4, r9
lab52: 	mov	r0, r5
	mov	r1, r4
	cpsid f
	push {r1, r2}
	mov.w r1, #1044
	mov.w r2, #1610612736 
lab59: 	adds	r1, r5, #1
	itet	ne
	addne	r0, r5, #1
	addeq	r6, #1
	lsrne	r0, r0, #1
	b	lab60
lab38: 	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #3236
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3236
	mov.w r2, #1610612736 
	mov	r3, r4
push {r1, r2}
	mov.w r1, #4103
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4103
	mov.w r2, #1610612736 
	mov	r4, r1
	mov	r0, r5
	mov	r1, r4
	cpsid f
	push {r1, r2}
	mov.w r1, #4258
	mov.w r2, #1610612736 
lab53: 	mov	r2, r0
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #5443
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5443
	mov.w r2, #1610612736 
	mov	r4, r1
	b	lab52
lab55: 	mov	r3, ip
	movs	r0, #32
	mov	r4, #4294967295	
	b	lab61
	nop
	.ltorg
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
	beq	lab62
	mov	r4, r4, lsr #21
	rsbs	r5, r4, r5, lsr #21
	it	lt
	neglt	r5, r5
	ble	lab63
	add	r4, r5
	eor	r2, r0, r2
	eor	r3, r1, r3
	eor	r0, r2, r0
	eor	r1, r3, r1
	eor	r2, r0, r2
	eor	r3, r1, r3
lab63: 	cmp	r5, #54	
	it	hi
	cpsid f
	push {r1, r2}
	mov.w r1, #1063
	mov.w r2, #1610612736 
	tst	r1, #2147483648	
	mov	r1, r1, lsl #12
	mov	ip, #1048576	
	orr	r1, ip, r1, lsr #12
	beq	lab64
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab64: 	tst	r3, #2147483648	
	mov	r3, r3, lsl #12
	orr	r3, ip, r3, lsr #12
	beq	lab65
	negs	r2, r2
	sbc	r3, r3, r3, lsl #1
lab65: 	teq	r4, r5
	beq	lab66
lab78: 	rsbs	lr, r5, #32
	blt	lab67
	lsl	ip, r2, lr
	lsr	r2, r2, r5
	adds	r0, r0, r2
	adc	r1, r1, #0
	lsl	r2, r3, lr
	adds	r0, r0, r2
	asr	r3, r3, r5
	adcs	r1, r3
	b	lab68
lab67: 	sub	r5, r5, #32
	add	lr, lr, #32
	cmp	r2, #1
	lsl	ip, r3, lr
	it	cs
	orrcs	ip, ip, #2
	asr	r3, r3, r5
	adds	r0, r0, r3
	adcs	r1, r1, r3, asr #31
lab68: 	and	r5, r1, #2147483648	
	bpl	lab69
	mov	lr, #0
	rsbs	ip, ip, #0
	sbcs	r0, lr, r0
	sbc	r1, lr, r1
lab69: 	cmp	r1, #1048576	
	bcc	lab70
	cmp	r1, #2097152	
	bcc	lab71
	lsrs	r1, r1, #1
	movs	r0, r0, rrx
	mov	ip, ip, rrx
	add	r4, r4, #1
	mov	r2, r4, lsl #21
	cmn	r2, #4194304	
	bcs	lab72
lab71: 	cmp	ip, #2147483648	
	it	eq
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	orr	r1, r1, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #3945
	mov.w r2, #1610612736 
lab70: 	movs	ip, ip, lsl #1
	adcs	r0, r0
	adc	r1, r1, r1
	subs	r4, #1
	it	cs
	cmpcs	r1, #1048576	
	bcs	lab71
lab82: 	itt	eq
	moveq	r1, r0
	moveq	r0, #0
	clz	r3, r1
	it	eq
	addeq	r3, #32
	sub	r3, r3, #11
	subs	r2, r3, #32
	bge	lab73
	adds	r2, #12
	ble	lab74
	add	ip, r2, #20
	rsb	r2, r2, #12
	lsl	r0, r1, ip
	lsr	r1, r1, r2
	b	lab75
lab74: 	add	r2, r2, #20
lab73: 	it	le
	rsble	ip, r2, #32
	lsl	r1, r1, r2
	lsr	ip, r0, ip
	itt	le
	orrle	r1, r1, ip
	lslle	r0, r2
lab75: 	subs	r4, r4, r3
	ittt	ge
	addge	r1, r1, r4, lsl #20
	orrge	r1, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #8004
	mov.w r2, #1610612736 
	mvn	r4, r4
	subs	r4, #31
	bge	lab76
	adds	r4, #12
	bgt	lab77
	add	r4, r4, #20
	rsb	r2, r4, #32
	lsr	r0, r0, r4
	lsl	r3, r1, r2
	orr	r0, r0, r3
	lsr	r3, r1, r4
	orr	r1, r5, r3
	pop	{r4, r5, pc}
lab77: 	rsb	r4, r4, #12
	rsb	r2, r4, #32
	lsr	r0, r0, r2
	lsl	r3, r1, r4
	orr	r0, r0, r3
	mov	r1, r5
	pop	{r4, r5, pc}
lab76: 	lsr	r0, r1, r4
	mov	r1, r5
	pop	{r4, r5, pc}
lab66: 	teq	r4, #0
	eor	r3, r3, #1048576	
	itte	eq
	eoreq	r1, r1, #1048576	
	addeq	r4, #1
	subne	r5, #1
	b	lab78
lab62: 	mvns	ip, r4, asr #21
	it	ne
	mvnsne	ip, r5, asr #21
	beq	lab79
	teq	r4, r5
	it	eq
	teqeq	r0, r2
	beq	lab80
	orrs	ip, r4, r0
	itt	eq
	moveq	r1, r3
	moveq	r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #8133
	mov.w r2, #1610612736 
lab80: 	teq	r1, r3
	ittt	ne
	movne	r1, #0
	movne	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #793
	mov.w r2, #1610612736 
	movs	ip, r4, lsr #21
	bne	lab81
	lsls	r0, r0, #1
	adcs	r1, r1
	it	cs
	orrcs	r1, r1, #2147483648	
	cpsid f
	push {r1, r2}
	mov.w r1, #1291
	mov.w r2, #1610612736 
lab81: 	adds	r4, r4, #4194304	
	itt	cc
	addcc	r1, r1, #1048576	
	cpsid f
	push {r1, r2}
	mov.w r1, #4689
	mov.w r2, #1610612736 
	and	r5, r1, #2147483648	
lab72: 	orr	r1, r5, #2130706432	
	orr	r1, r1, #15728640	
	mov	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #4718
	mov.w r2, #1610612736 
lab79: 	mvns	ip, r4, asr #21
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
	mov.w r1, #28
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
	b	lab82
	nop
__aeabi_i2d:
	teq	r0, #0
	itt	eq
	moveq	r1, #0
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, #1024	
	add	r4, r4, #50	
	ands	r5, r0, #2147483648	
	it	mi
	negmi	r0, r0
	mov	r1, #0
	b	lab82
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
	b	lab82
	nop
__aeabi_ul2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	mov	r5, #0
	b	lab83
__aeabi_l2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	ands	r5, r1, #2147483648	
	bpl	lab83
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab83: 	mov	r4, #1024	
	add	r4, r4, #50	
	movs	ip, r1, lsr #22
	beq	lab69
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
	b	lab69
	nop
__aeabi_dmul:
	push	{r4, r5, r6, lr}
	mov	ip, #255	
	orr	ip, ip, #1792	
	ands	r4, ip, r1, lsr #20
	ittte	ne
	andsne	r5, ip, r3, lsr #20
	teqne	r4, ip
	teqne	r5, ip
	bleq	8dfc <__aeabi_dmul+0x1dc>
	add	r4, r5
	eor	r6, r1, r3
	bic	r1, r1, ip, lsl #21
	bic	r3, r3, ip, lsl #21
	orrs	r5, r0, r1, lsl #12
	it	ne
	orrsne	r5, r2, r3, lsl #12
	orr	r1, r1, #1048576	
	orr	r3, r3, #1048576	
	beq	lab84
	umull	ip, lr, r0, r2
	mov	r5, #0
	umlal	lr, r5, r1, r2
	and	r2, r6, #2147483648	
	umlal	lr, r5, r0, r3
	mov	r6, #0
	umlal	r5, r6, r1, r3
	teq	ip, #0
	it	ne
	orrne	lr, lr, #1
	sub	r4, r4, #255	
	cmp	r6, #512	
	sbc	r4, r4, #768	
	bcs	lab85
	movs	lr, lr, lsl #1
	adcs	r5, r5
	adc	r6, r6, r6
lab85: 	orr	r1, r2, r6, lsl #11
	orr	r1, r1, r5, lsr #21
	mov	r0, r5, lsl #11
	orr	r0, r0, lr, lsr #21
	mov	lr, lr, lsl #11
	subs	ip, r4, #253	
	it	hi
	cmphi	ip, #1792	
	bhi	lab86
	cmp	lr, #2147483648	
	it	eq
	movseq	lr, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #7228
	mov.w r2, #1610612736 
lab84: 	and	r6, r6, #2147483648	
	orr	r1, r6, r1
	orr	r0, r0, r2
	eor	r1, r1, r3
	subs	r4, r4, ip, lsr #1
	ittt	gt
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #593
	mov.w r2, #1610612736 
	orr	r1, r1, #1048576	
	mov	lr, #0
	subs	r4, #1
lab86: 	bgt	lab87
	cmn	r4, #54	
	ittt	le
	movle	r0, #0
	andle	r1, r1, #2147483648	
	cpsid f
	push {r1, r2}
	mov.w r1, #679
	mov.w r2, #1610612736 
	rsb	r4, r4, #0
	subs	r4, #32
	bge	lab88
	adds	r4, #12
	bgt	lab89
	add	r4, r4, #20
	rsb	r5, r4, #32
	lsl	r3, r0, r5
	lsr	r0, r0, r4
	lsl	r2, r1, r5
	orr	r0, r0, r2
	and	r2, r1, #2147483648	
	bic	r1, r1, #2147483648	
	adds	r0, r0, r3, lsr #31
	lsr	r6, r1, r4
	adc	r1, r2, r6
	orrs	lr, lr, r3, lsl #1
	it	eq
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, pc}
lab89: 	rsb	r4, r4, #12
	rsb	r5, r4, #32
	lsl	r3, r0, r4
	lsr	r0, r0, r5
	lsl	r2, r1, r4
	orr	r0, r0, r2
	and	r1, r1, #2147483648	
	adds	r0, r0, r3, lsr #31
	adc	r1, r1, #0
	orrs	lr, lr, r3, lsl #1
	it	eq
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, pc}
lab88: 	rsb	r5, r4, #32
	lsl	r2, r0, r5
	orr	lr, lr, r2
	lsr	r3, r0, r4
	lsl	r2, r1, r5
	orr	r3, r3, r2
	lsr	r0, r1, r4
	and	r1, r1, #2147483648	
	lsr	r2, r1, r4
	bic	r0, r0, r2
	add	r0, r0, r3, lsr #31
	orrs	lr, lr, r3, lsl #1
	it	eq
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, pc}
lab94: 	bne	lab90
	and	r6, r1, #2147483648	
lab91: 	adc	r1, r1, r1
	tst	r1, #1048576	
	it	eq
	subeq	r4, #1
	beq	lab91
	orr	r1, r1, r6
	teq	r5, #0
	it	ne
	bxne	lr
lab90: 	and	r6, r3, #2147483648	
lab92: 	adc	r3, r3, r3
	tst	r3, #1048576	
	it	eq
	subeq	r5, #1
	beq	lab92
	orr	r3, r3, r6
	bx	lr
	teq	r4, ip
	and	r5, ip, r3, lsr #20
	it	ne
	teqne	r5, ip
	beq	lab93
	orrs	r6, r0, r1, lsl #1
	it	ne
	orrsne	r6, r2, r3, lsl #1
	bne	lab94
lab105: 	and	r1, r1, #2147483648	
	mov	r0, #0
	pop	{r4, r5, r6, pc}
lab93: 	orrs	r6, r0, r1, lsl #1
	itte	eq
	moveq	r0, r2
	moveq	r1, r3
	orrsne	r6, r2, r3, lsl #1
	beq	lab95
	teq	r4, ip
	bne	lab96
	orrs	r6, r0, r1, lsl #12
	bne	lab95
lab96: 	teq	r5, ip
	bne	lab97
	orrs	r6, r2, r3, lsl #12
	itt	ne
	movne	r0, r2
	movne	r1, r3
	bne	lab95
lab97: 	eor	r1, r1, r3
lab87: 	and	r1, r1, #2147483648	
	orr	r1, r1, #2130706432	
	orr	r1, r1, #15728640	
	mov	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #4411
	mov.w r2, #1610612736 
lab95: 	orr	r1, r1, #2130706432	
	orr	r1, r1, #16252928	
	pop	{r4, r5, r6, pc}
__aeabi_ddiv:
	push	{r4, r5, r6, lr}
	mov	ip, #255	
	orr	ip, ip, #1792	
	ands	r4, ip, r1, lsr #20
	ittte	ne
	andsne	r5, ip, r3, lsr #20
	teqne	r4, ip
	teqne	r5, ip
	bleq	8fe2 <__aeabi_ddiv+0x16e>
	sub	r4, r4, r5
	eor	lr, r1, r3
	orrs	r5, r2, r3, lsl #12
	mov	r1, r1, lsl #12
	beq	lab98
	mov	r3, r3, lsl #12
	mov	r5, #268435456	
	orr	r3, r5, r3, lsr #4
	orr	r3, r3, r2, lsr #24
	mov	r2, r2, lsl #8
	orr	r5, r5, r1, lsr #4
	orr	r5, r5, r0, lsr #24
	mov	r6, r0, lsl #8
	and	r1, lr, #2147483648	
	cmp	r5, r3
	it	eq
	cmpeq	r6, r2
	adc	r4, r4, #253	
	add	r4, r4, #768	
	bcs	lab99
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
lab99: 	subs	r6, r6, r2
	sbc	r5, r5, r3
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
	mov	r0, #1048576	
	mov	ip, #524288	
lab101: 	sbcs	lr, r5, r3
	ittt	cs
	subcs	r6, r6, r2
	movcs	r5, lr
	orrcs	r0, r0, ip
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
	subs	lr, r6, r2
	sbcs	lr, r5, r3
	ittt	cs
	subcs	r6, r6, r2
	movcs	r5, lr
	orrcs	r0, r0, ip, lsr #1
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
	subs	lr, r6, r2
	sbcs	lr, r5, r3
	ittt	cs
	subcs	r6, r6, r2
	movcs	r5, lr
	orrcs	r0, r0, ip, lsr #2
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
	subs	lr, r6, r2
	sbcs	lr, r5, r3
	ittt	cs
	subcs	r6, r6, r2
	movcs	r5, lr
	orrcs	r0, r0, ip, lsr #3
	orrs	lr, r5, r6
	beq	lab100
	mov	r5, r5, lsl #4
	orr	r5, r5, r6, lsr #28
	mov	r6, r6, lsl #4
	mov	r3, r3, lsl #3
	orr	r3, r3, r2, lsr #29
	mov	r2, r2, lsl #3
	movs	ip, ip, lsr #4
	bne	lab101
	tst	r1, #1048576	
	bne	lab102
	orr	r1, r1, r0
	mov	r0, #0
	mov	ip, #2147483648	
	b	lab101
lab100: 	tst	r1, #1048576	
	itt	eq
	orreq	r1, r0
	moveq	r0, #0
lab102: 	subs	ip, r4, #253	
	it	hi
	cmphi	ip, #1792	
	bhi	lab86
	subs	ip, r5, r3
	itt	eq
	subseq	ip, r6, r2
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #3201
	mov.w r2, #1610612736 
lab98: 	and	lr, lr, #2147483648	
	orr	r1, lr, r1, lsr #12
	adds	r4, r4, ip, lsr #1
	ittt	gt
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #5508
	mov.w r2, #1610612736 
	orr	r1, r1, #1048576	
	mov	lr, #0
	subs	r4, #1
	b	lab86
	orr	lr, r5, r6
	b	lab86
	and	r5, ip, r3, lsr #20
	teq	r4, ip
	it	eq
	teqeq	r5, ip
	beq	lab95
	teq	r4, ip
	bne	lab103
	orrs	r4, r0, r1, lsl #12
	bne	lab95
	teq	r5, ip
	bne	lab97
	mov	r0, r2
	mov	r1, r3
	b	lab95
lab103: 	teq	r5, ip
	bne	lab104
	orrs	r5, r2, r3, lsl #12
	beq	lab105
	mov	r0, r2
	mov	r1, r3
	b	lab95
lab104: 	orrs	r6, r0, r1, lsl #1
	it	ne
	orrsne	r6, r2, r3, lsl #1
	bne	lab94
	orrs	r4, r0, r1, lsl #1
	bne	lab97
	orrs	r5, r2, r3, lsl #1
	bne	lab105
	b	lab95
__gedf2:
	mov	ip, #4294967295	
	b	lab106
	nop
__ledf2:
	mov	ip, #1
	b	lab106
	nop
__cmpdf2:
	mov	ip, #1
lab106: 	str	ip, [sp, #-4]!
	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	mov	ip, r3, lsl #1
	it	ne
	mvnsne	ip, ip, asr #21
	beq	lab107
lab110: 	orrs	ip, r0, r1, lsl #1
	ite	eq
	orrseq	ip, r2, r3, lsl #1
	teqne	r1, r3
	ittt	eq
	teqeq	r0, r2
	moveq	r0, #0
	bxeq	lr
	cmn	r0, #0
	teq	r1, r3
	it	pl
	cmppl	r1, r3
	it	eq
	cmpeq	r0, r2
	ite	cs
	asrcs	r0, r3, #31
	mvncc	r0, r3, asr #31
	orr	r0, r0, #1
	bx	lr
lab107: 	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	bne	lab108
	orrs	ip, r0, r1, lsl #12
	bne	lab109
lab108: 	mov	ip, r3, lsl #1
	mvns	ip, ip, asr #21
	bne	lab110
	orrs	ip, r2, r3, lsl #12
	beq	lab110
lab109: 	ldr	r0, [sp], #4
	bx	lr
	nop
__aeabi_cdrcmple:
	mov	ip, r0
	mov	r0, r2
	mov	r2, ip
	mov	ip, r1
	mov	r1, r3
	mov	r3, ip
	b	__aeabi_cdcmpeq
	nop
__aeabi_cdcmpeq:
	push	{r0, lr}
	bl	__cmpdf2
	cmp	r0, #0
	it	mi
	cmnmi	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #1550
	mov.w r2, #1610612736 
__aeabi_dcmpeq:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #2714
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2714
	mov.w r2, #1610612736 
	moveq	r0, #1
	movne	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmplt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #1225
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1225
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmple:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #4729
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4729
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpge:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #7378
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7378
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpgt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #7755
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7755
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpun:
	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	bne	lab111
	orrs	ip, r0, r1, lsl #12
	bne	lab112
lab111: 	mov	ip, r3, lsl #1
	mvns	ip, ip, asr #21
	bne	lab113
	orrs	ip, r2, r3, lsl #12
	bne	lab112
lab113: 	mov	r0, #0
	bx	lr
lab112: 	mov	r0, #1
	bx	lr
__errno:
	ldr	r3, =_impure_ptr	
	ldr	r0, [r3, #0]
	bx	lr
	nop
	.ltorg
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x00019428	
	ldr	r5, =0x00019428	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab114
	movs	r4, #0
lab115: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #5964
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #5964
	mov.w r2, #1610612736 
lab114: 	ldr	r6, =0x00019430	
	ldr	r5, =0x00019428	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab116
	movs	r4, #0
lab117: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #7312
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #7312
	mov.w r2, #1610612736 
lab116:	cpsid f
	push {r1, r2}
	mov.w r1, #7119
	mov.w r2, #1610612736 
	.ltorg
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab118
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab119
	uxtb	r2, r1
	mov	r3, r0
	b	lab120
lab121: 	bcc	lab119
lab120: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab121
lab129: 	bls	lab122
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab123
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab124: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab124
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab125
lab130: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab126: 	cmp	r3, r2
	bne	lab126
	and	r4, ip, #3
lab122: 	cbz	r4, lab119
lab128: 	add	r4, r3
lab127: 	cmp	r4, r3
	bne	lab127
lab119:	cpsid f
	push {r1, r2}
	mov.w r1, #1350
	mov.w r2, #1610612736 
lab125: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab128
	b	lab119
lab118: 	mov	r3, r0
	mov	r4, r2
	b	lab129
lab123: 	mov	r2, r3
	mov	ip, r4
	b	lab130
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
	cbz	r6, lab131
	mov	r9, #1
	mov	sl, #0
lab137: 	subs	r5, r4, #1
	bmi	lab131
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab133: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab132
lab134: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab133
lab131: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab132: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab134
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab135
	blx	r2
lab140: 	cmp	r2, fp
	bne	lab136
lab139: 	cmp	r3, r6
	beq	lab134
	mov	r6, r3
	cmp	r6, #0
	bne	lab137
	b	lab131
lab135: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab138
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab139
lab136: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab137
	b	lab131
lab138: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab140
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =0x00019434	
	ldr	r5, =0x00019430	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab141
	subs	r3, #4
	add	r5, r3
lab142: 	ldr	r3, [r5], #-4
	
	push {r1, r2}
	mov.w r1, #5270
	mov.w r2, #1610612736 
	cmp	r4, #0
	push {r1, r2}
	mov.w r1, #5270
	mov.w r2, #1610612736 
lab141: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab143
lab147: 	cmp	r5, #31
	bgt	lab144
	cbnz	r6, lab145
lab146: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab148:	cpsid f
	push {r1, r2}
	mov.w r1, #7480
	mov.w r2, #1610612736 
lab145: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab146
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab146
lab143: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab147
lab144: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab148
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
	.word	0x000196c0


	.data

solar_bodies:
	.word	0xc9be45de
	.word	0x4043bd3c
	.word	0x343cd92c
	.word	0x40135da0
	.word	0xc01fdb7c
	.word	0xbff290ab
	.word	0x6c25ebf0
	.word	0xbfba86f9
	.word	0x9b93ccbc
	.word	0x3fe36706
	.word	0xf57d949b
	.word	0x40067ef2
	.word	0x9a5a0715
	.word	0xbf99d2d7
	.word	0xd9ab33d8
	.word	0x3fa34c95
	.word	0xc332ca67
	.word	0x4020afcd
	.word	0x31de01b0
	.word	0x40107fcb
	.word	0xe1eb467c
	.word	0xbfd9d353
	.word	0xb8879442
	.word	0xbff02c21
	.word	0xbf1f8f13
	.word	0x3ffd35e9
	.word	0x5f1123b4
	.word	0x3f813c48
	.word	0x0d07c637
	.word	0x3f871d49
	.word	0xcea7d9cf
	.word	0x4029c9ea
	.word	0xd626667e
	.word	0xc02e38e8
	.word	0xbe257da0
	.word	0xbfcc9557
	.word	0xa9911bef
	.word	0x3ff1531c
	.word	0x3e54bbc5
	.word	0x3febcc7f
	.word	0xfaf23e7c
	.word	0xbf862f6b
	.word	0x9cf41eb3
	.word	0x3f5c3dd2
	.word	0xa905572a
	.word	0x402ec267
	.word	0x33c8a220
	.word	0xc039eb58
	.word	0x93abe540
	.word	0x3fc6f1f3
	.word	0x1659bc4a
	.word	0x3fef54b6
	.word	0x31c4fba3
	.word	0x3fe307c6
	.word	0x587665f6
	.word	0xbfa1cb88
	.word	0x531799ac
	.word	0x3f60a8f3
expected.0:
	.word	0xa7e0d6f3
	.word	0xbf3967e9
	.word	0xfe5089fb
	.word	0xbf6ad4ec
	.word	0x1f0b8a72
	.word	0x3ef91933
	.word	0xc9be45de
	.word	0x4043bd3c
	.word	0x343cd92c
	.word	0x40135da0
	.word	0xc01fdb7c
	.word	0xbff290ab
	.word	0x6c25ebf0
	.word	0xbfba86f9
	.word	0x9b93ccbc
	.word	0x3fe36706
	.word	0xf57d949b
	.word	0x40067ef2
	.word	0x9a5a0715
	.word	0xbf99d2d7
	.word	0xd9ab33d8
	.word	0x3fa34c95
	.word	0xc332ca67
	.word	0x4020afcd
	.word	0x31de01b0
	.word	0x40107fcb
	.word	0xe1eb467c
	.word	0xbfd9d353
	.word	0xb8879442
	.word	0xbff02c21
	.word	0xbf1f8f13
	.word	0x3ffd35e9
	.word	0x5f1123b4
	.word	0x3f813c48
	.word	0x0d07c637
	.word	0x3f871d49
	.word	0xcea7d9cf
	.word	0x4029c9ea
	.word	0xd626667e
	.word	0xc02e38e8
	.word	0xbe257da0
	.word	0xbfcc9557
	.word	0xa9911bef
	.word	0x3ff1531c
	.word	0x3e54bbc5
	.word	0x3febcc7f
	.word	0xfaf23e7c
	.word	0xbf862f6b
	.word	0x9cf41eb3
	.word	0x3f5c3dd2
	.word	0xa905572a
	.word	0x402ec267
	.word	0x33c8a220
	.word	0xc039eb58
	.word	0x93abe540
	.word	0x3fc6f1f3
	.word	0x1659bc4a
	.word	0x3fef54b6
	.word	0x31c4fba3
	.word	0x3fe307c6
	.word	0x587665f6
	.word	0xbfa1cb88
	.word	0x531799ac
	.word	0x3f60a8f3
_impure_ptr:
	.word	0x000196c0
	.word	0x00000000
impure_data:
	.word	0x00000000
	.word	0x000199ac
	.word	0x00019a14
	.word	0x00019a7c
	.word	0x00000001
	.word	0x00000000
	.word	0xabcd330e
	.word	0xe66d1234
	.word	0x0005deec
	.word	0x0000000b
__atexit_recursive_mutex:
	.word	0x00019b08


	.bss

__bss_start:
	.word	0x00000000
object.0:
__lock___atexit_recursive_mutex:
	.word	0x00000000
