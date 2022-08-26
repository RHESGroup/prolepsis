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
	mov.w r1, #419
	mov.w r2, #1610612736 
	cbz	r3, lab1
	ldr	r0, =0x0000bbcd	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	mov.w r1, #1507
	mov.w r2, #1610612736 
	ldr	r4, =completed.1	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x0000bea4	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	mov.w r1, #7317
	mov.w r2, #1610612736 
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x0000bea4	
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
	ldr	r0, =0x0001c2ec	
	ldr	r2, =0x0001c33c	
	subs	r2, r2, r0
push {r1, r2}
	mov.w r1, #706
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #706
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
	ldr	r0, =0x0000bbc1	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x0000bbcd	
push {r1, r2}
	mov.w r1, #1207
	mov.w r2, #1610612736 
lab7:	push {r1, r2}
	mov.w r1, #1207
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #130
	mov.w r2, #1610612736 
	movs	r1, r5
	bl	main
	push {r1, r2}
	mov.w r1, #2389
	mov.w r2, #1610612736 
	nop
	.ltorg
verify_benchmark:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	mov	r2, #0
	ldr	r3, =0x40040000	
	strd	r2, r3, [r7, #16]
	ldr	r3, =soln_cnt0	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bne	lab8
	ldr	r3, =exp_res0.0	
	ldrd	r0, r1, [r3]
	ldr	r3, =res0	
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	str	r2, [r7, #0]
	bic	r3, r3, #2147483648	
	str	r3, [r7, #4]
	add	r3, pc, #180	
	ldrd	r2, r3, [r3]
	ldrd	r0, r1, [r7]
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	lab8
	ldr	r3, =exp_res0.0	
	ldrd	r0, r1, [r3, #8]
	ldr	r3, =res0	
	ldrd	r2, r3, [r3, #8]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	sl, r2
	bic	fp, r3, #2147483648	
	add	r3, pc, #136	
	ldrd	r2, r3, [r3]
	mov	r0, sl
	mov	r1, fp
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	lab8
	ldr	r3, =exp_res0.0	
	ldrd	r0, r1, [r3, #16]
	ldr	r3, =res0	
	ldrd	r2, r3, [r3, #16]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r8, r2
	bic	r9, r3, #2147483648	
	add	r3, pc, #88	
	ldrd	r2, r3, [r3]
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	lab8
	ldr	r3, =soln_cnt1	
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bne	lab8
	ldr	r3, =res1	
	ldrd	r2, r3, [r3]
	ldrd	r0, r1, [r7, #16]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	bic	r5, r3, #2147483648	
	add	r3, pc, #36	
	ldrd	r2, r3, [r3]
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	lab8
	movs	r3, #1
	b	lab9
lab8: 	movs	r3, #0
lab9: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7635
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
	mov.w r1, #1575
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1575
	mov.w r2, #1610612736 
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4846
	mov.w r2, #1610612736 
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #10
push {r1, r2}
	mov.w r1, #2331
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2331
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #7219
	mov.w r2, #1610612736 
	movs	r0, r0
benchmark_body:
	push	{r4, r5, r7, lr}
	sub	sp, sp, #560	
	add	r7, sp, #24
	add	r3, r7, #536	
	sub	r3, r3, #532	
	str	r0, [r3, #0]
	movs	r3, #0
	str	r3, [r7, #532]	
	b	lab10
lab19: 	ldr	r3, =0x3ff00000	
	strd	r2, r3, [r7, #520]	
	mov	r2, #0
	ldr	r3, =0xc0250000	
	strd	r2, r3, [r7, #512]	
	mov	r2, #0
	ldr	r3, =0x40400000	
	strd	r2, r3, [r7, #504]	
	mov	r2, #0
	ldr	r3, =0xc03e0000	
	strd	r2, r3, [r7, #496]	
	mov	r2, #0
	ldr	r3, =0x3ff00000	
	strd	r2, r3, [r7, #488]	
	mov	r2, #0
	ldr	r3, =0xc0120000	
	strd	r2, r3, [r7, #480]	
	mov	r2, #0
	ldr	r3, =0x40310000	
	strd	r2, r3, [r7, #472]	
	mov	r2, #0
	ldr	r3, =0xc03e0000	
	strd	r2, r3, [r7, #464]	
	mov	r2, #0
	ldr	r3, =0x3ff00000	
	strd	r2, r3, [r7, #456]	
	mov	r2, #0
	ldr	r3, =0xc00c0000	
	strd	r2, r3, [r7, #448]	
	mov	r2, #0
	ldr	r3, =0x40360000	
	strd	r2, r3, [r7, #440]	
	mov	r2, #0
	ldr	r3, =0xc03f0000	
	strd	r2, r3, [r7, #432]	
	mov	r2, #0
	ldr	r3, =0x3ff00000	
	strd	r2, r3, [r7, #424]	
	add	r3, pc, #328	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r7, #416]	
	mov	r2, #0
	ldr	r3, =0x3ff00000	
	strd	r2, r3, [r7, #408]	
	mov	r2, #0
	ldr	r3, =0xc0418000	
	strd	r2, r3, [r7, #400]	
	add	r3, r7, #536	
	sub	r3, r3, #528	
	mov	r0, r3
	mov	r3, #384	
	mov	r2, r3
	movs	r1, #0
push {r1, r2}
	mov.w r1, #6310
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6310
	mov.w r2, #1610612736 
	str	r3, [r7, #396]	
	add	r3, r7, #8
	str	r3, [sp, #20]
	add	r3, r7, #392	
	str	r3, [sp, #16]
	ldrd	r2, r3, [r7, #496]	
	strd	r2, r3, [sp, #8]
	ldrd	r2, r3, [r7, #504]	
	strd	r2, r3, [sp]
	ldrd	r2, r3, [r7, #512]	
	ldrd	r0, r1, [r7, #520]	
push {r1, r2}
	mov.w r1, #6320
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6320
	mov.w r2, #1610612736 
	ldr	r2, =soln_cnt0	
	str	r3, [r2, #0]
	ldr	r2, =res0	
	add	r3, r7, #536	
	sub	r3, r3, #528	
	mov	r4, r2
	mov	r5, r3
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5, {r0, r1}
	stmia	r4, {r0, r1}
	add	r3, r7, #8
	str	r3, [sp, #20]
	add	r3, r7, #392	
	str	r3, [sp, #16]
	ldrd	r2, r3, [r7, #464]	
	strd	r2, r3, [sp, #8]
	ldrd	r2, r3, [r7, #472]	
	strd	r2, r3, [sp]
	ldrd	r2, r3, [r7, #480]	
	ldrd	r0, r1, [r7, #488]	
push {r1, r2}
	mov.w r1, #7950
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7950
	mov.w r2, #1610612736 
	ldr	r2, =soln_cnt1	
	str	r3, [r2, #0]
	add	r3, r7, #536	
	sub	r3, r3, #528	
	ldrd	r2, r3, [r3]
	ldr	r1, =res1	
	strd	r2, r3, [r1]
	add	r3, r7, #8
	str	r3, [sp, #20]
	add	r3, r7, #392	
	str	r3, [sp, #16]
	ldrd	r2, r3, [r7, #432]	
	strd	r2, r3, [sp, #8]
	ldrd	r2, r3, [r7, #440]	
	strd	r2, r3, [sp]
	ldrd	r2, r3, [r7, #448]	
	ldrd	r0, r1, [r7, #456]	
push {r1, r2}
	mov.w r1, #4373
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4373
	mov.w r2, #1610612736 
	str	r3, [sp, #20]
	add	r3, r7, #392	
	str	r3, [sp, #16]
	ldrd	r2, r3, [r7, #400]	
	strd	r2, r3, [sp, #8]
	ldrd	r2, r3, [r7, #408]	
	strd	r2, r3, [sp]
	ldrd	r2, r3, [r7, #416]	
	ldrd	r0, r1, [r7, #424]	
push {r1, r2}
	mov.w r1, #1733
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1733
	mov.w r2, #1610612736 
	ldr	r3, =0x3ff00000	
	strd	r2, r3, [r7, #520]	
	b	lab11
lab18: 	ldr	r3, =0x40240000	
	strd	r2, r3, [r7, #512]	
	b	lab12
lab17: 	ldr	r3, =0x40140000	
	strd	r2, r3, [r7, #504]	
	b	lab13
lab16: 	ldr	r3, =0xbff00000	
	strd	r2, r3, [r7, #496]	
	b	lab14
	nop
	.ltorg
lab15: 	str	r3, [sp, #20]
	add	r3, r7, #392	
	str	r3, [sp, #16]
	ldrd	r2, r3, [r7, #496]	
	strd	r2, r3, [sp, #8]
	ldrd	r2, r3, [r7, #504]	
	strd	r2, r3, [sp]
	ldrd	r2, r3, [r7, #512]	
	ldrd	r0, r1, [r7, #520]	
push {r1, r2}
	mov.w r1, #4282
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4282
	mov.w r2, #1610612736 
	ldr	r3, =0x3ff00000	
	ldrd	r0, r1, [r7, #496]	
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	strd	r2, r3, [r7, #496]	
lab14: 	mov	r2, #0
	ldr	r3, =0xc0080000	
	ldrd	r0, r1, [r7, #496]	
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	lab15
	mov	r2, #0
	ldr	r3, =0x3fe00000	
	ldrd	r0, r1, [r7, #504]	
push {r1, r2}
	mov.w r1, #2482
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2482
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #504]	
lab13: 	mov	r2, #0
	ldr	r3, =0x40180000	
	ldrd	r0, r1, [r7, #504]	
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	lab16
	mov	r2, #0
	ldr	r3, =0x3ff00000	
	ldrd	r0, r1, [r7, #512]	
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	strd	r2, r3, [r7, #512]	
lab12: 	mov	r2, #0
	ldr	r3, =0x40200000	
	ldrd	r0, r1, [r7, #512]	
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	lab17
	mov	r2, #0
	ldr	r3, =0x3ff00000	
	ldrd	r0, r1, [r7, #520]	
push {r1, r2}
	mov.w r1, #7236
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7236
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #520]	
lab11: 	mov	r2, #0
	ldr	r3, =0x40080000	
	ldrd	r0, r1, [r7, #520]	
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	lab18
	ldr	r3, [r7, #532]	
	adds	r3, #1
	str	r3, [r7, #532]	
lab10: 	add	r3, r7, #536	
	sub	r3, r3, #532	
	ldr	r2, [r7, #532]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab19
	movs	r3, #0
	mov	r0, r3
	add	r7, r7, #536	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4756
	mov.w r2, #1610612736 
	nop
	.ltorg
SolveCubic:
	stmdb	sp!, {r4, r5, r7, r8, r9, lr}
	sub	sp, #72	
	add	r7, sp, #0
	strd	r0, r1, [r7, #8]
	strd	r2, r3, [r7]
	ldrd	r2, r3, [r7, #8]
	ldrd	r0, r1, [r7]
push {r1, r2}
	mov.w r1, #1436
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1436
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #64]	
	ldrd	r2, r3, [r7, #8]
	ldrd	r0, r1, [r7, #96]	
push {r1, r2}
	mov.w r1, #287
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #287
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #56]	
	ldrd	r2, r3, [r7, #8]
	ldrd	r0, r1, [r7, #104]	
push {r1, r2}
	mov.w r1, #5387
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5387
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #48]	
	ldrd	r2, r3, [r7, #64]	
	ldrd	r0, r1, [r7, #64]	
push {r1, r2}
	mov.w r1, #3139
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3139
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r8, r2
	mov	r9, r3
	mov	r2, #0
	ldr	r3, =0x40080000	
	ldrd	r0, r1, [r7, #56]	
push {r1, r2}
	mov.w r1, #2954
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2954
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, =0x40220000	
push {r1, r2}
	mov.w r1, #777
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #777
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #40]	
	ldrd	r0, r1, [r7, #64]	
	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #736
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #736
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldrd	r2, r3, [r7, #64]	
push {r1, r2}
	mov.w r1, #6839
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6839
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldrd	r2, r3, [r7, #64]	
push {r1, r2}
	mov.w r1, #6365
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6365
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r8, r2
	mov	r9, r3
	mov	r2, #0
	ldr	r3, =0x40220000	
	ldrd	r0, r1, [r7, #64]	
push {r1, r2}
	mov.w r1, #3695
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3695
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldrd	r2, r3, [r7, #56]	
push {r1, r2}
	mov.w r1, #2442
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2442
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r8, r2
	mov	r9, r3
	mov	r2, #0
	ldr	r3, =0x403b0000	
	ldrd	r0, r1, [r7, #48]	
push {r1, r2}
	mov.w r1, #5428
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5428
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #3510
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3510
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, =0x404b0000	
push {r1, r2}
	mov.w r1, #1323
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1323
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #32]
	ldrd	r2, r3, [r7, #32]
	ldrd	r0, r1, [r7, #32]
push {r1, r2}
	mov.w r1, #1427
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1427
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r8, r2
	mov	r9, r3
	ldrd	r2, r3, [r7, #40]	
	ldrd	r0, r1, [r7, #40]	
push {r1, r2}
	mov.w r1, #588
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #588
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldrd	r2, r3, [r7, #40]	
push {r1, r2}
	mov.w r1, #5608
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5608
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	strd	r2, r3, [r7, #24]
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, r1, [r7, #24]
	bl	__aeabi_dcmple
	mov	r3, r0
	cmp	r3, #0
	beq	lab20
	ldr	r3, [r7, #112]	
	movs	r2, #3
	str	r2, [r3, #0]
	ldrd	r2, r3, [r7, #40]	
	ldrd	r0, r1, [r7, #40]	
push {r1, r2}
	mov.w r1, #4773
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4773
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldrd	r2, r3, [r7, #40]	
push {r1, r2}
	mov.w r1, #4432
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4432
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #1555
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1555
	mov.w r2, #1610612736 
	mov	r3, r1
	ldrd	r0, r1, [r7, #32]
push {r1, r2}
	mov.w r1, #2888
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2888
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	acos
	push {r1, r2}
	mov.w r1, #246
	mov.w r2, #1610612736 
	ldrd	r0, r1, [r7, #40]	
push {r1, r2}
	mov.w r1, #2856
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2856
	mov.w r2, #1610612736 
	mov	r3, #3221225472	
push {r1, r2}
	mov.w r1, #8157
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8157
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	mov	r2, #0
	ldr	r3, =0x40080000	
	ldrd	r0, r1, [r7, #16]
push {r1, r2}
	mov.w r1, #386
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #386
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #5725
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5725
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #3738
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3738
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	mov	r2, #0
	ldr	r3, =0x40080000	
	ldrd	r0, r1, [r7, #64]	
push {r1, r2}
	mov.w r1, #4002
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4002
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [r7, #116]	
	strd	r2, r3, [r1]
	ldrd	r0, r1, [r7, #40]	
push {r1, r2}
	mov.w r1, #2243
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2243
	mov.w r2, #1610612736 
	mov	r3, #3221225472	
push {r1, r2}
	mov.w r1, #1503
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1503
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	add	r3, pc, #256	
	ldrd	r2, r3, [r3]
	ldrd	r0, r1, [r7, #16]
push {r1, r2}
	mov.w r1, #5018
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5018
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, =0x40080000	
push {r1, r2}
	mov.w r1, #1070
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1070
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #4573
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4573
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #621
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #621
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r8, r2
	mov	r9, r3
	mov	r2, #0
	ldr	r3, =0x40080000	
	ldrd	r0, r1, [r7, #64]	
push {r1, r2}
	mov.w r1, #4285
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4285
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [r7, #116]	
	add	r4, r3, #8
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	strd	r2, r3, [r4]
	ldrd	r0, r1, [r7, #40]	
push {r1, r2}
	mov.w r1, #2806
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2806
	mov.w r2, #1610612736 
	mov	r3, #3221225472	
push {r1, r2}
	mov.w r1, #857
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #857
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	add	r3, pc, #124	
	ldrd	r2, r3, [r3]
	ldrd	r0, r1, [r7, #16]
push {r1, r2}
	mov.w r1, #1098
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1098
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, =0x40080000	
push {r1, r2}
	mov.w r1, #2468
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2468
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #6364
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6364
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #2949
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2949
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r8, r2
	mov	r9, r3
	mov	r2, #0
	ldr	r3, =0x40080000	
	ldrd	r0, r1, [r7, #64]	
push {r1, r2}
	mov.w r1, #6898
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6898
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [r7, #116]	
	add	r4, r3, #16
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	strd	r2, r3, [r4]
	b	lab21
	nop
	.ltorg
lab20: 	ldr	r3, [r7, #112]	
	movs	r2, #1
	str	r2, [r3, #0]
	ldrd	r0, r1, [r7, #24]
push {r1, r2}
	mov.w r1, #2544
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2544
	mov.w r2, #1610612736 
	ldr	r3, [r7, #36]	
	bic	r5, r3, #2147483648	
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #5527
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5527
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	add	r3, pc, #176	
	ldrd	r2, r3, [r3]
	bl	pow
	push {r1, r2}
	mov.w r1, #614
	mov.w r2, #1610612736 
	mov	r3, r1
	ldr	r1, [r7, #116]	
	strd	r2, r3, [r1]
	ldr	r3, [r7, #116]	
	ldrd	r4, r5, [r3]
	ldr	r3, [r7, #116]	
	ldrd	r2, r3, [r3]
	ldrd	r0, r1, [r7, #40]	
push {r1, r2}
	mov.w r1, #5464
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5464
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #7322
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7322
	mov.w r2, #1610612736 
	mov	r3, r1
	ldr	r1, [r7, #116]	
	strd	r2, r3, [r1]
	ldr	r3, [r7, #116]	
	ldrd	r4, r5, [r3]
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, r1, [r7, #32]
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	lab22
	mov	r0, #0
	ldr	r1, =0x3ff00000	
	b	lab23
lab22: 	mov	r0, #0
	ldr	r1, =0xbff00000	
lab23: 	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #3245
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3245
	mov.w r2, #1610612736 
	mov	r3, r1
	ldr	r1, [r7, #116]	
	strd	r2, r3, [r1]
	ldr	r3, [r7, #116]	
	ldrd	r4, r5, [r3]
	mov	r2, #0
	ldr	r3, =0x40080000	
	ldrd	r0, r1, [r7, #64]	
push {r1, r2}
	mov.w r1, #2429
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2429
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [r7, #116]	
	strd	r2, r3, [r1]
lab21: 	nop
	adds	r7, #72	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6239
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
	mov.w r1, #2708
	mov.w r2, #1610612736 
	bl	benchmark
	push {r1, r2}
	mov.w r1, #2990
	mov.w r2, #1610612736 
	str	r3, [r7, #8]
	bl	stop_trigger
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	verify_benchmark
	push {r1, r2}
	mov.w r1, #6114
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
	mov.w r1, #5918
	mov.w r2, #1610612736 
cos:
	ldr	r2, =0x3fe921fb	
	bic	r3, r1, #2147483648	
	cmp	r3, r2
	ble	lab24
	push	{r4, lr}
	ldr	r2, =0x7fefffff	
	cmp	r3, r2
	sub	sp, #24
	ble	lab25
	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
lab29: 	mov	r1, r3
	add	sp, #24
	cpsid f
	push {r1, r2}
	mov.w r1, #521
	mov.w r2, #1610612736 
lab25: 	add	r2, sp, #8
	bl	__ieee754_rem_pio2
	push {r1, r2}
	mov.w r1, #5912
	mov.w r2, #1610612736 
	cmp	r4, #1
	beq	lab26
	cmp	r4, #2
	beq	lab27
	cbz	r4, lab28
	movs	r4, #1
	ldrd	r2, r3, [sp, #16]
	ldrd	r0, r1, [sp, #8]
	str	r4, [sp, #0]
push {r1, r2}
	mov.w r1, #4141
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4141
	mov.w r2, #1610612736 
	mov	r3, r1
	b	lab29
lab24: 	movs	r2, #0
	movs	r3, #0
	b	__kernel_cos
lab26: 	ldrd	r2, r3, [sp, #16]
	ldrd	r0, r1, [sp, #8]
	str	r4, [sp, #0]
push {r1, r2}
	mov.w r1, #409
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #409
	mov.w r2, #1610612736 
	add	r3, r1, #2147483648	
	b	lab29
lab28: 	ldrd	r2, r3, [sp, #16]
	ldrd	r0, r1, [sp, #8]
push {r1, r2}
	mov.w r1, #2546
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2546
	mov.w r2, #1610612736 
	mov	r3, r1
	b	lab29
lab27: 	ldrd	r2, r3, [sp, #16]
	ldrd	r0, r1, [sp, #8]
push {r1, r2}
	mov.w r1, #2650
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2650
	mov.w r2, #1610612736 
	add	r3, r1, #2147483648	
	b	lab29
	nop
	.ltorg
acos:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	mov	r5, r1
	bl	__ieee754_acos
	push {r1, r2}
	mov.w r1, #6920
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r7, r1
	mov	r3, r5
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmpun
	cbnz	r0, lab30
	mov	r0, r4
	mov	r1, r5
	bl	fabs
	ldr	r3, =0x3ff00000	
	movs	r2, #0
	bl	__aeabi_dcmpgt
	cbnz	r0, lab31
lab30: 	mov	r0, r6
	mov	r1, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2311
	mov.w r2, #1610612736 
lab31: 	bl	__errno
	mov	r3, r0
	movs	r2, #33	
	str	r2, [r3, #0]
	ldr	r0, [pc, #12]	
	ldmia	sp!, {r3, r4, r5, r6, r7, lr}
	b	nan
	.ltorg
pow:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r2
	mov	r5, r3
	mov	r8, r0
	mov	r9, r1
push {r1, r2}
	mov.w r1, #666
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #666
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r7, r1
	mov	r3, r5
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmpun
	cbnz	r0, lab32
	movs	r2, #0
	movs	r3, #0
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dcmpeq
	cbz	r0, lab33
	movs	r2, #0
	movs	r3, #0
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmpeq
	cbz	r0, lab34
	ldr	r7, =0x3ff00000	
	movs	r6, #0
lab32: 	mov	r0, r6
	mov	r1, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4462
	mov.w r2, #1610612736 
lab34: 	mov	r0, r4
	mov	r1, r5
	bl	finite
	cmp	r0, #0
	beq	lab32
	mov	r0, r4
	mov	r1, r5
	movs	r2, #0
	movs	r3, #0
	bl	__aeabi_dcmplt
	cmp	r0, #0
	beq	lab32
	b	lab35
lab33: 	mov	r0, r6
	mov	r1, r7
	bl	finite
	cbz	r0, lab36
lab37: 	movs	r3, #0
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	lab32
	mov	r0, r8
	mov	r1, r9
	bl	finite
	cmp	r0, #0
	beq	lab32
	mov	r0, r4
	mov	r1, r5
	bl	finite
	cmp	r0, #0
	beq	lab32
	b	lab35
lab36: 	mov	r0, r8
	mov	r1, r9
	bl	finite
	cmp	r0, #0
	beq	lab37
	mov	r0, r4
	mov	r1, r5
	bl	finite
	cmp	r0, #0
	beq	lab37
	mov	r2, r6
	mov	r3, r7
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dcmpun
	cbnz	r0, lab38
lab35: 	bl	__errno
	movs	r3, #34	
	str	r3, [r0, #0]
	b	lab32
lab38: 	bl	__errno
	movs	r3, #33	
	str	r3, [r0, #0]
	b	lab32
	nop
	.ltorg
sqrt:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	mov	r5, r1
push {r1, r2}
	mov.w r1, #5182
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5182
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r7, r1
	mov	r3, r5
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmpun
	cbnz	r0, lab39
	mov	r0, r4
	mov	r1, r5
	movs	r2, #0
	movs	r3, #0
	bl	__aeabi_dcmplt
	cbnz	r0, lab40
lab39: 	mov	r0, r6
	mov	r1, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1101
	mov.w r2, #1610612736 
lab40: 	bl	__errno
	movs	r2, #0
	movs	r3, #0
	movs	r1, #33	
	str	r1, [r0, #0]
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #5093
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5093
	mov.w r2, #1610612736 
	mov	r7, r1
	mov	r0, r6
	mov	r1, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6185
	mov.w r2, #1610612736 
	nop
	movs	r0, r0
__ieee754_acos:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r6, =0x3fefffff	
	bic	r3, r1, #2147483648	
	cmp	r3, r6
	mov	r4, r0
	mov	r5, r1
	ble	lab41
	add	r3, r3, #3221225472	
	add	r3, r3, #1048576	
	orrs	r3, r0
	bne	lab42
	cmp	r1, #0
	ble	lab43
	movs	r0, #0
	movs	r1, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #6017
	mov.w r2, #1610612736 
lab41: 	ldr	r6, =0x3fdfffff	
	cmp	r3, r6
	bgt	lab44
	ldr	r2, =0x3c600000	
	cmp	r3, r2
	bgt	lab45
	add	r1, pc, #624	
	ldrd	r0, r1, [r1]
	cpsid f
	push {r1, r2}
	mov.w r1, #2795
	mov.w r2, #1610612736 
lab44: 	cmp	r1, #0
	blt	lab46
	mov	r2, r0
	mov	r3, r1
	movs	r0, #0
	ldr	r1, =0x3ff00000	
	bl	__aeabi_dsub
	ldr	r3, =0x3fe00000	
	movs	r2, #0
push {r1, r2}
	mov.w r1, #6194
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6194
	mov.w r2, #1610612736 
	mov	r5, r1
push {r1, r2}
	mov.w r1, #2230
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2230
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r9, r1
	mov	r8, r0
	mov	r1, r5
	mov	r0, r4
push {r1, r2}
	mov.w r1, #6135
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6135
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #7803
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7803
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #8070
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8070
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #1774
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1774
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #5532
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5532
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #278
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #278
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #7250
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7250
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #2911
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2911
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #4594
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4594
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	sl, r0
	mov	fp, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #4605
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4605
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #948
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #948
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #1973
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1973
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #2433
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2433
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #5271
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5271
	mov.w r2, #1610612736 
	movs	r2, #0
push {r1, r2}
	mov.w r1, #6757
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6757
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
push {r1, r2}
	mov.w r1, #1113
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1113
	mov.w r2, #1610612736 
	mov	r3, r9
push {r1, r2}
	mov.w r1, #3700
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3700
	mov.w r2, #1610612736 
	mov	sl, r0
	mov	fp, r1
	mov	r2, r6
	mov	r3, r9
	mov	r0, r6
	mov	r1, r9
push {r1, r2}
	mov.w r1, #6584
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6584
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r4, r0
	mov	r5, r1
	mov	r3, r9
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #1729
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1729
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #811
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #811
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
push {r1, r2}
	mov.w r1, #5320
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5320
	mov.w r2, #1610612736 
	mov	r3, r9
push {r1, r2}
	mov.w r1, #284
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #284
	mov.w r2, #1610612736 
	mov	r3, r1
push {r1, r2}
	mov.w r1, #924
	mov.w r2, #1610612736 
	cpsid f
	push {r1, r2}
	mov.w r1, #2928
	mov.w r2, #1610612736 
lab42: 	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #1956
	mov.w r2, #1610612736 
	cpsid f
	push {r1, r2}
	mov.w r1, #629
	mov.w r2, #1610612736 
lab43: 	add	r1, pc, #352	
	ldrd	r0, r1, [r1]
	cpsid f
	push {r1, r2}
	mov.w r1, #3398
	mov.w r2, #1610612736 
lab45: 	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #368
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #368
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r6, r0
	mov	r7, r1
push {r1, r2}
	mov.w r1, #4318
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4318
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #5644
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5644
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #6830
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6830
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #5389
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5389
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #6271
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6271
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #2341
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2341
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #7050
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7050
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #7425
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7425
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #1083
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1083
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r8, r0
	mov	r9, r1
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #196
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #196
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #5674
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5674
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #7657
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7657
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #3660
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3660
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #7054
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7054
	mov.w r2, #1610612736 
	movs	r2, #0
push {r1, r2}
	mov.w r1, #5581
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5581
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #410
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #410
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #3674
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3674
	mov.w r2, #1610612736 
	mov	r3, r1
	add	r1, pc, #132	
	ldrd	r0, r1, [r1]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	add	r1, pc, #12	
	ldrd	r0, r1, [r1]
	bl	__aeabi_dsub
	cpsid f
	push {r1, r2}
	mov.w r1, #6250
	mov.w r2, #1610612736 
	.ltorg
lab46: 	ldr	r3, =0x3ff00000	
	movs	r2, #0
push {r1, r2}
	mov.w r1, #1984
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1984
	mov.w r2, #1610612736 
	movs	r2, #0
push {r1, r2}
	mov.w r1, #3524
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3524
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r4, r0
	mov	r5, r1
push {r1, r2}
	mov.w r1, #4669
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4669
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #1071
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1071
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #4589
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4589
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #6849
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6849
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #8021
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8021
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #6851
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6851
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #5683
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5683
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #6488
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6488
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #8091
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8091
	mov.w r2, #1610612736 
	mov	r9, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #2737
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2737
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r6, r0
	mov	r7, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #3823
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3823
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #6047
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6047
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #7037
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7037
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #8063
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8063
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #7466
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7466
	mov.w r2, #1610612736 
	movs	r2, #0
push {r1, r2}
	mov.w r1, #1829
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1829
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #747
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #747
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #1525
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1525
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #3168
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3168
	mov.w r2, #1610612736 
	mov	r3, r1
push {r1, r2}
	mov.w r1, #913
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #913
	mov.w r2, #1610612736 
	mov	r3, r1
	add	r1, pc, #100	
	ldrd	r0, r1, [r1]
	bl	__aeabi_dsub
	cpsid f
	push {r1, r2}
	mov.w r1, #1129
	mov.w r2, #1610612736 
	.ltorg
__ieee754_pow:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bic	fp, r3, #2147483648	
	mov	r8, r1
	orrs	r1, fp, r2
	sub	sp, #76	
	mov	r4, r2
	mov	r5, r3
	mov	r7, r0
	bne	lab47
	adds	r3, r0, r0
	eor	r2, r8, #524288	
	ldr	r0, =0xfff00000	
	adcs	r2, r2
	cmp	r1, r3
	sbcs	r3, r0, r2
	bcs	lab48
lab50: 	mov	r1, r8
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #2644
	mov.w r2, #1610612736 
lab70:	push {r1, r2}
	mov.w r1, #2644
	mov.w r2, #1610612736 
	cpsid f
	push {r1, r2}
	mov.w r1, #2406
	mov.w r2, #1610612736 
lab47: 	mov	r0, r2
	ldr	r2, =0x7ff00000	
	bic	r9, r8, #2147483648	
	cmp	r9, r2
	mov	sl, r3
	mov	r6, r8
	mov	r3, r7
	ble	lab49
lab52: 	add	r6, r6, #1048576	
	orrs	r6, r3
	bne	lab50
	adds	r3, r4, r4
	ldr	r1, =0xfff00000	
	eor	r2, r5, #524288	
	adcs	r2, r2
	cmp	r6, r3
	sbcs	r3, r1, r2
	bcc	lab50
lab48: 	ldr	r4, =0x3ff00000	
	movs	r3, #0
	mov	r0, r3
	mov	r1, r4
	add	sp, #76	
	cpsid f
	push {r1, r2}
	mov.w r1, #3500
	mov.w r2, #1610612736 
lab49: 	beq	lab51
lab66: 	cmp	fp, r2
	bgt	lab52
	beq	lab53
lab77: 	blt	lab54
	movs	r2, #0
	str	r2, [sp, #0]
	cbnz	r0, lab55
lab80: 	cmp	fp, r2
	beq	lab56
lab76: 	cmp	fp, r2
	beq	lab57
	cmp	sl, #1073741824	
	beq	lab58
	ldr	r2, =0x3fe00000	
	cmp	sl, r2
	beq	lab59
lab55: 	mov	r0, r7
	mov	r1, r8
	str	r3, [sp, #8]
	bl	fabs
	ldr	r3, [sp, #8]
	cbz	r3, lab60
lab68: 	lsrs	r3, r6, #31
	subs	r3, #1
	str	r3, [sp, #40]	
	orrs	r3, r2
	beq	lab61
	ldr	r3, =0x41e00000	
	cmp	fp, r3
	ble	lab62
	add	r3, r3, #34603008	
	cmp	fp, r3
	ldr	r3, =0x3fefffff	
	ble	lab63
	cmp	r9, r3
	ble	lab64
lab93: 	ble	lab65
lab97: lab103: 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__math_oflow
lab51: 	cmp	r7, #0
	bne	lab50
	b	lab66
lab99: 	mov	r1, r8
	str	r3, [sp, #0]
	bl	fabs
	ldr	r3, [sp, #0]
	cmp	r3, #0
	bne	lab61
	str	r3, [sp, #0]
lab60: 	cmp	r9, #0
	beq	lab67
	ldr	r3, =0x3ff00000	
	bic	r2, r6, #3221225472	
	cmp	r2, r3
	bne	lab68
lab67: 	cmp	sl, #0
	bge	lab69
	mov	r2, r0
	mov	r3, r1
	movs	r0, #0
	ldr	r1, =0x3ff00000	
push {r1, r2}
	mov.w r1, #1626
	mov.w r2, #1610612736 
lab69:	push {r1, r2}
	mov.w r1, #1626
	mov.w r2, #1610612736 
	bge	lab70
	ldr	r3, [sp, #0]
	add	r9, r9, #3221225472	
	add	r9, r9, #1048576	
	orrs	r3, r9, r3
	bne	lab71
	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #7499
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7499
	mov.w r2, #1610612736 
lab54: 	ldr	r2, =0x433fffff	
	cmp	fp, r2
	bgt	lab72
	sub	r2, r2, #55574528	
	cmp	fp, r2
	ble	lab73
	mov	r2, fp, asr #20
	subw	r2, r2, #1023	
	cmp	r2, #20
	ble	lab74
	rsb	r2, r2, #52	
	lsr	r1, r0, r2
	lsl	r2, r1, r2
	cmp	r2, r0
	beq	lab75
lab73: 	movs	r2, #0
	str	r2, [sp, #0]
	cmp	r0, #0
	beq	lab76
	b	lab55
lab53: 	cmp	r0, #0
	beq	lab77
	b	lab52
lab56: 	add	r2, r9, #3221225472	
	add	r2, r2, #1048576	
	orrs	r3, r2
	beq	lab48
	ldr	r3, =0x3fefffff	
	cmp	r9, r3
	ble	lab78
	cmp	sl, #0
	blt	lab79
	mov	r0, r4
	mov	r1, r5
	b	lab70
lab72: 	movs	r2, #2
	str	r2, [sp, #0]
	cmp	r0, #0
	beq	lab80
	b	lab55
lab57: 	cmp	sl, #0
	blt	lab81
	mov	r0, r7
	mov	r1, r8
	b	lab70
lab61: 	mov	r2, r7
	mov	r3, r8
	mov	r0, r7
	mov	r1, r8
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #64
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #64
	mov.w r2, #1610612736 
	nop
	.ltorg
lab62: 	ldr	r3, =0x7ff00000	
	ands	r3, r6
	movs	r2, #0
	cbnz	r3, lab82
	ldr	r3, =0x43400000	
push {r1, r2}
	mov.w r1, #6101
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6101
	mov.w r2, #1610612736 
	mov	r9, r1
lab82: 	mov	r3, r9, asr #20
	subw	r3, r3, #1023	
	adds	r2, r3, r2
	ldr	r3, =0x0003988e	
	str	r2, [sp, #44]	
	ubfx	r9, r9, #0, #20
	orr	r6, r9, #1069547520	
	cmp	r9, r3
	orr	r6, r6, #3145728	
	ble	lab83
	ldr	r3, =0x000bb679	
	cmp	r9, r3
	ble	lab84
	adds	r2, #1
	str	r2, [sp, #44]	
	sub	r6, r6, #1048576	
lab83: 	movs	r2, #0
	movs	r3, #0
	strd	r2, r3, [sp, #32]
	strd	r2, r3, [sp, #64]	
	ldr	r3, =0x3ff00000	
	movs	r2, #0
	strd	r2, r3, [sp, #24]
	movs	r7, #0
lab101: 	mov	r1, r6
	mov	sl, r0
	bl	__aeabi_dsub
	mov	fp, r6
	ldrd	r2, r3, [sp, #24]
	mov	r8, r0
	mov	r9, r1
	mov	r0, sl
	mov	r1, r6
	strd	sl, fp, [sp, #48]	
push {r1, r2}
	mov.w r1, #2088
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2088
	mov.w r2, #1610612736 
	mov	r3, r1
	movs	r0, #0
	ldr	r1, =0x3ff00000	
push {r1, r2}
	mov.w r1, #6311
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6311
	mov.w r2, #1610612736 
	mov	r1, r0
	strd	r1, r2, [sp, #56]	
	mov	r3, r2
	mov	r1, r9
	mov	r2, r0
	mov	r0, r8
push {r1, r2}
	mov.w r1, #6745
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6745
	mov.w r2, #1610612736 
	mov	fp, r0
	mov	ip, r2
	strd	fp, ip, [sp, #8]
	mov	ip, #0
	str	ip, [sp, #8]
	asrs	r6, r6, #1
	ldrd	sl, fp, [sp, #8]
	orr	r6, r6, #536870912	
	mov	r1, r0
	add	r3, r6, #524288	
	strd	r1, r2, [sp, #16]
	movs	r0, #0
	adds	r1, r3, r7
	mov	r6, r0
	mov	r7, r1
	mov	r2, r0
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
push {r1, r2}
	mov.w r1, #5793
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5793
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	ldrd	r2, r3, [sp, #24]
	mov	r8, r0
	mov	r9, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldrd	r0, r1, [sp, #48]	
	bl	__aeabi_dsub
	mov	r2, sl
	mov	r3, fp
push {r1, r2}
	mov.w r1, #3040
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3040
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	ldrd	r2, r3, [sp, #56]	
push {r1, r2}
	mov.w r1, #5667
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5667
	mov.w r2, #1610612736 
	strd	r0, r1, [sp, #24]
	mov	r2, r6
	mov	r3, r7
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #7801
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7801
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r6, r0
	mov	r7, r1
push {r1, r2}
	mov.w r1, #7360
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7360
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #6928
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6928
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #7596
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7596
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #2103
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2103
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #6225
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6225
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #4629
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4629
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #4642
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4642
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #407
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #407
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #4621
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4621
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #1609
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1609
	mov.w r2, #1610612736 
	mov	r8, r0
	mov	r9, r1
	mov	r3, r7
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #1902
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1902
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #4886
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4886
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r7, r1
	mov	r3, fp
	ldrd	r0, r1, [sp, #16]
push {r1, r2}
	mov.w r1, #4843
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4843
	mov.w r2, #1610612736 
push {r1, r2}
	mov.w r1, #8040
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8040
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #2397
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2397
	mov.w r2, #1610612736 
	mov	r8, r0
	mov	r9, r1
	mov	r3, fp
	mov	r0, sl
	mov	r1, fp
push {r1, r2}
	mov.w r1, #3414
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3414
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [sp, #48]	
	ldr	r3, =0x40080000	
	movs	r2, #0
push {r1, r2}
	mov.w r1, #7711
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7711
	mov.w r2, #1610612736 
	mov	r3, r9
push {r1, r2}
	mov.w r1, #2746
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2746
	mov.w r2, #1610612736 
	mov	r7, r1
	mov	r2, r6
	mov	r3, r7
	mov	r0, sl
	mov	r1, fp
push {r1, r2}
	mov.w r1, #7438
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7438
	mov.w r2, #1610612736 
	mov	sl, r0
	mov	fp, r1
	movs	r2, #0
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	ldrd	r2, r3, [sp, #48]	
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	ldrd	r2, r3, [sp, #16]
push {r1, r2}
	mov.w r1, #1602
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1602
	mov.w r2, #1610612736 
	mov	r8, r0
	mov	r9, r1
	mov	r3, r7
	ldrd	r0, r1, [sp, #24]
push {r1, r2}
	mov.w r1, #4181
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4181
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #1126
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1126
	mov.w r2, #1610612736 
	mov	r9, r1
	mov	r2, r0
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
push {r1, r2}
	mov.w r1, #3395
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3395
	mov.w r2, #1610612736 
	add	r3, pc, #228	
	ldrd	r2, r3, [r3]
	mov	r0, r6
	mov	r7, r1
push {r1, r2}
	mov.w r1, #6212
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6212
	mov.w r2, #1610612736 
	mov	r3, fp
	mov	sl, r0
	mov	fp, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	add	r3, pc, #192	
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #497
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #497
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r8, r0
	mov	r9, r1
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #4482
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4482
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #6684
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6684
	mov.w r2, #1610612736 
push {r1, r2}
	mov.w r1, #4110
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4110
	mov.w r2, #1610612736 
	ldr	r0, [sp, #44]	
	mov	r9, r1
push {r1, r2}
	mov.w r1, #1876
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1876
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r7, r1
	mov	r3, r9
	mov	r0, sl
	mov	r1, fp
	strd	sl, fp, [sp, #16]
push {r1, r2}
	mov.w r1, #4548
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4548
	mov.w r2, #1610612736 
push {r1, r2}
	mov.w r1, #142
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #142
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #1252
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1252
	mov.w r2, #1610612736 
	mov	r2, r6
	mov	r3, r7
	mov	r0, sl
	mov	fp, r1
	bl	__aeabi_dsub
	ldrd	r2, r3, [sp, #32]
	bl	__aeabi_dsub
	ldrd	r2, r3, [sp, #16]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	b	lab85
	.ltorg
lab85: 	strd	r0, r1, [sp, #8]
lab94: 	ldr	r2, [sp, #40]	
	subs	r3, #1
	orrs	r3, r2
	ite	eq
	ldreq	r3, =0xbff00000	
	ldrne	r3, =0x3ff00000	
	movs	r2, #0
	strd	r2, r3, [sp, #16]
	movs	r3, #0
	strd	r4, r5, [sp]
	str	r3, [sp, #0]
	ldrd	r8, r9, [sp]
	mov	r0, r4
	mov	r2, r8
	mov	r3, r9
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, sl
	mov	r3, fp
push {r1, r2}
	mov.w r1, #1889
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1889
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r7, r1
	mov	r3, r5
	ldrd	r0, r1, [sp, #8]
push {r1, r2}
	mov.w r1, #6858
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6858
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #3755
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3755
	mov.w r2, #1610612736 
	mov	r3, r9
	mov	r6, r0
	mov	r7, r1
	mov	r0, sl
	mov	r1, fp
push {r1, r2}
	mov.w r1, #1808
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1808
	mov.w r2, #1610612736 
	mov	r2, r0
	mov	r4, r0
	mov	r5, r1
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #5591
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5591
	mov.w r2, #1610612736 
	cmp	r1, r3
	mov	r8, r0
	mov	r9, r1
	mov	sl, r1
	ble	lab86
	add	r3, r1, #3204448256	
	add	r3, r3, #7340032	
	orrs	r3, r0
	bne	lab87
	add	r3, pc, #644	
	ldrd	r2, r3, [r3]
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #2296
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2296
	mov.w r2, #1610612736 
	strd	r0, r1, [sp]
	mov	r3, r5
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldrd	r0, r1, [sp]
	bl	__aeabi_dcmpgt
	cmp	r0, #0
	bne	lab87
lab92: lab104: 	subw	r3, r3, #1022	
	asr	r3, r2, r3
	add	r3, sl
	ldr	r1, =0x000fffff	
	ubfx	r2, r3, #20, #11
	subw	r2, r2, #1023	
	asr	ip, r1, r2
	ubfx	r1, r3, #0, #20
	rsb	r2, r2, #20
	orr	r1, r1, #1048576	
	asr	lr, r1, r2
	movs	r0, #0
	bic	r1, r3, ip
	cmp	sl, #0
	str	lr, [sp, #8]
	mov	r2, r0
	mov	r3, r1
	bge	lab88
	mov	r1, lr
	negs	r1, r1
	str	r1, [sp, #8]
lab88: 	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	ldr	r3, [sp, #8]
	lsls	r3, r3, #20
	str	r3, [sp, #0]
	mov	r2, r0
	mov	r3, r1
	mov	r4, r0
	mov	r5, r1
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #86
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #86
	mov.w r2, #1610612736 
lab96: 	add	r3, pc, #496	
	ldrd	r2, r3, [r3]
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #7522
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7522
	mov.w r2, #1610612736 
	mov	sl, r0
	mov	fp, r1
	mov	r3, r5
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	add	r3, pc, #460	
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #8153
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8153
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r4, r0
	mov	r5, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #4808
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4808
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #4044
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4044
	mov.w r2, #1610612736 
	mov	r7, r1
	mov	r2, r0
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
push {r1, r2}
	mov.w r1, #7634
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7634
	mov.w r2, #1610612736 
	mov	r3, fp
	mov	r4, r0
	mov	r5, r1
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r4
	mov	sl, r0
	mov	fp, r1
	mov	r3, r5
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #6470
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6470
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r6, r0
	mov	r7, r1
push {r1, r2}
	mov.w r1, #1330
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1330
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #2692
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2692
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #7639
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7639
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #2523
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2523
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #3505
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3505
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #6031
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6031
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #4283
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4283
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r6, r0
	mov	r7, r1
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #5908
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5908
	mov.w r2, #1610612736 
	mov	r8, r0
	mov	r9, r1
	mov	r0, r6
	mov	r1, r7
	mov	r3, #1073741824	
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #705
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #705
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r7, r1
	mov	r3, fp
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #897
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #897
	mov.w r2, #1610612736 
	mov	r3, fp
push {r1, r2}
	mov.w r1, #7806
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7806
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	movs	r0, #0
	ldr	r1, =0x3ff00000	
	bl	__aeabi_dsub
	ldr	r5, [sp, #0]
	mov	r4, r1
	add	r4, r5
	cmp	r4, #1048576	
	blt	lab89
	mov	r1, r4
lab102: push {r1, r2}
	mov.w r1, #5971
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5971
	mov.w r2, #1610612736 
lab59: 	cmp	r6, #0
	blt	lab55
	mov	r0, r7
	mov	r1, r8
	add	sp, #76	
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__ieee754_sqrt
lab86: 	ldr	ip, =0x4090cbff	
	bic	r3, r1, #2147483648	
	cmp	r3, ip
	ble	lab90
	ldr	r3, =0x3f6f3400	
	add	r3, r1
	orrs	r3, r0
	bne	lab91
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
	bl	__aeabi_dcmpge
	cmp	r0, #0
	beq	lab92
lab91: 	ldrd	r0, r1, [sp, #16]
	movs	r2, #0
	movs	r3, #0
	bl	__aeabi_dcmplt
	subs	r0, #0
	it	ne
	movne	r0, #1
lab98: 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__math_uflow
lab79: 	movs	r3, #0
	movs	r4, #0
	mov	r0, r3
	mov	r1, r4
	b	lab70
lab78: 	cmp	sl, #0
	bge	lab79
	add	r3, r5, #2147483648	
	mov	r0, r4
	mov	r1, r3
	b	lab70
	nop
	.ltorg
lab63: 	cmp	r9, r3
	blt	lab64
	ldr	r3, =0x3ff00000	
	cmp	r9, r3
	bgt	lab93
	ldr	r3, =0x3ff00000	
	movs	r2, #0
	bl	__aeabi_dsub
	add	r3, pc, #392	
	ldrd	r2, r3, [r3]
	mov	r6, r0
	mov	r7, r1
push {r1, r2}
	mov.w r1, #8133
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8133
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r8, r0
	mov	r9, r1
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #6438
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6438
	mov.w r2, #1610612736 
	mov	sl, r0
	mov	fp, r1
	movs	r2, #0
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #4099
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4099
	mov.w r2, #1610612736 
	mov	r3, r1
	add	r1, pc, #356	
	ldrd	r0, r1, [r1]
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #6787
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6787
	mov.w r2, #1610612736 
	mov	r3, r1
	movs	r0, #0
	ldr	r1, =0x3fe00000	
	bl	__aeabi_dsub
	mov	r2, r6
	strd	r0, r1, [sp, #8]
	mov	r3, r7
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #5361
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5361
	mov.w r2, #1610612736 
	mov	r3, r1
	ldrd	r0, r1, [sp, #8]
push {r1, r2}
	mov.w r1, #3718
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3718
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #5109
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5109
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r6, r0
	mov	r7, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #2701
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2701
	mov.w r2, #1610612736 
	mov	r2, r8
	mov	r3, r9
	mov	r0, sl
	mov	fp, r1
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	strd	r0, r1, [sp, #8]
	b	lab94
lab81: 	mov	r2, r7
	mov	r3, r8
	ldr	r1, =0x3ff00000	
	movs	r0, #0
push {r1, r2}
	mov.w r1, #3357
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3357
	mov.w r2, #1610612736 
lab58: 	mov	r2, r7
	mov	r0, r7
	mov	r3, r8
	mov	r1, r8
push {r1, r2}
	mov.w r1, #179
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #179
	mov.w r2, #1610612736 
lab90: 	ldr	r2, =0x3fe00000	
	cmp	r3, r2
	bgt	lab95
	ldrd	r2, r3, [sp]
	str	r2, [sp, #0]
	str	r2, [sp, #8]
	b	lab96
lab64: 	cmp	sl, #0
	blt	lab97
lab65: 	movs	r0, #0
	b	lab98
lab74: 	cmp	r0, #0
	bne	lab99
	rsb	r2, r2, #20
	asr	r1, fp, r2
	lsl	r2, r1, r2
	cmp	r2, fp
	beq	lab100
	str	r0, [sp, #0]
	b	lab76
lab71: 	ldr	r3, [sp, #0]
	cmp	r3, #1
	bne	lab70
	add	r3, r1, #2147483648	
	mov	r1, r3
	b	lab70
lab84: 	add	r3, pc, #136	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [sp, #32]
	add	r3, pc, #136	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [sp, #64]	
	ldr	r3, =0x3ff80000	
	movs	r2, #0
	strd	r2, r3, [sp, #24]
	mov	r7, #262144	
	b	lab101
lab89: 	ldr	r2, [sp, #8]
push {r1, r2}
	mov.w r1, #920
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #920
	mov.w r2, #1610612736 
lab87: 	ldrd	r0, r1, [sp, #16]
	movs	r2, #0
	movs	r3, #0
	bl	__aeabi_dcmplt
	subs	r0, #0
	it	ne
	movne	r0, #1
	b	lab103
lab75: 	and	r1, r1, #1
	rsb	r2, r1, #2
	str	r2, [sp, #0]
	cmp	r0, #0
	beq	lab76
	b	lab55
lab100: 	and	r1, r1, #1
	rsb	r2, r1, #2
	str	r2, [sp, #0]
	b	lab76
lab95: 	asrs	r3, r3, #20
	b	lab104
	nop
	nop
	.ltorg
__ieee754_rem_pio2:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r4, r2
	ldr	r2, =0x3fe921fb	
	bic	r5, r1, #2147483648	
	cmp	r5, r2
	sub	sp, #68	
	ble	lab105
	ldr	r2, =0x4002d97b	
	cmp	r5, r2
	mov	r7, r1
	bgt	lab106
	cmp	r1, #0
	add	r3, pc, #664	
	ldrd	r2, r3, [r3]
	ble	lab107
	bl	__aeabi_dsub
	ldr	r3, =0x3ff921fb	
	cmp	r5, r3
	mov	r8, r0
	mov	r9, r1
	beq	lab108
	add	r3, pc, #644	
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	strd	r2, r3, [r4]
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	add	r3, pc, #620	
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	strd	r0, r1, [r4, #8]
	movs	r6, #1
lab112: 	add	sp, #68	
	cpsid f
	push {r1, r2}
	mov.w r1, #1541
	mov.w r2, #1610612736 
lab106: 	ldr	r2, =0x413921fb	
	cmp	r5, r2
	ble	lab109
	ldr	r2, =0x7fefffff	
	cmp	r5, r2
	bgt	lab110
	asrs	r6, r5, #20
	subw	r6, r6, #1046	
	sub	r1, r5, r6, lsl #20
	mov	r9, r1
	mov	r8, r0
	bl	__aeabi_d2iz
push {r1, r2}
	mov.w r1, #7396
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7396
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	strd	r2, r3, [sp, #40]	
	bl	__aeabi_dsub
	ldr	r3, =0x41700000	
	movs	r2, #0
push {r1, r2}
	mov.w r1, #4833
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4833
	mov.w r2, #1610612736 
	mov	r8, r0
	bl	__aeabi_d2iz
	mov	r5, r0
push {r1, r2}
	mov.w r1, #5146
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5146
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	strd	r2, r3, [sp, #48]	
	bl	__aeabi_dsub
	ldr	r3, =0x41700000	
	movs	r2, #0
push {r1, r2}
	mov.w r1, #627
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #627
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [sp, #56]	
	movs	r2, #0
	movs	r3, #0
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	lab111
	cmp	r5, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #2
lab117: 	str	r2, [sp, #4]
	movs	r2, #2
	str	r2, [sp, #0]
	mov	r1, r4
	mov	r2, r6
	add	r0, sp, #40	
	bl	__kernel_rem_pio2
	push {r1, r2}
	mov.w r1, #1531
	mov.w r2, #1610612736 
	mov	r6, r0
	bge	lab112
	ldrd	r0, r5, [r4]
	add	r1, r5, #2147483648	
	strd	r0, r1, [r4]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #8]
	add	r3, r1, #2147483648	
	strd	r2, r3, [r4, #8]
	negs	r6, r6
	b	lab112
lab105: 	movs	r6, #0
	strd	r0, r1, [r4]
	movs	r2, #0
	movs	r3, #0
	mov	r0, r6
	strd	r2, r3, [r4, #8]
	add	sp, #68	
	cpsid f
	push {r1, r2}
	mov.w r1, #1977
	mov.w r2, #1610612736 
lab110: 	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dsub
	movs	r6, #0
	strd	r0, r1, [r4, #8]
	strd	r0, r1, [r4]
	b	lab112
lab108: 	add	r3, pc, #380	
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	add	r3, pc, #380	
	ldrd	r2, r3, [r3]
	mov	r8, r0
	mov	r9, r1
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	strd	r2, r3, [r4]
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	add	r3, pc, #348	
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	movs	r6, #1
	strd	r0, r1, [r4, #8]
	mov	r0, r6
	add	sp, #68	
	cpsid f
	push {r1, r2}
	mov.w r1, #6510
	mov.w r2, #1610612736 
lab109: 	bl	fabs
	add	r3, pc, #328	
	ldrd	r2, r3, [r3]
	mov	r8, r0
	mov	r9, r1
push {r1, r2}
	mov.w r1, #7830
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7830
	mov.w r2, #1610612736 
	movs	r2, #0
push {r1, r2}
	mov.w r1, #3629
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3629
	mov.w r2, #1610612736 
	mov	r6, r0
push {r1, r2}
	mov.w r1, #1954
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1954
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	sl, r0
	mov	fp, r1
	strd	sl, fp, [sp, #16]
push {r1, r2}
	mov.w r1, #381
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #381
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	add	r3, pc, #244	
	ldrd	r2, r3, [r3]
	strd	r0, r1, [sp, #8]
	mov	r0, sl
	mov	r1, fp
push {r1, r2}
	mov.w r1, #5421
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5421
	mov.w r2, #1610612736 
	mov	r8, r0
	mov	r9, r1
	bgt	lab113
	ldr	r3, =npio2_hw	
	subs	r2, r6, #1
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, r5
	beq	lab113
	mov	r2, r0
	mov	r3, r1
	ldrd	r0, r1, [sp, #8]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	strd	r2, r3, [r4]
	mov	sl, r0
	mov	fp, r1
	b	lab114
lab113: 	asrs	r3, r5, #20
	str	r3, [sp, #28]
	ldrd	r0, r1, [sp, #8]
	mov	r3, r9
	mov	r2, r8
	bl	__aeabi_dsub
	ubfx	r3, r1, #20, #11
	rsb	r5, r3, r5, lsr #20
	cmp	r5, #16
	mov	fp, r1
	mov	sl, r0
	ble	lab115
	add	r3, pc, #152	
	ldrd	r2, r3, [r3]
	ldrd	r0, r1, [sp, #16]
push {r1, r2}
	mov.w r1, #7511
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7511
	mov.w r2, #1610612736 
	mov	r9, r1
	mov	r2, r0
	mov	r3, r1
	ldrd	r0, r1, [sp, #8]
	bl	__aeabi_dsub
	mov	sl, r0
	mov	fp, r1
	mov	r2, sl
	mov	r3, fp
	ldrd	r0, r1, [sp, #8]
	bl	__aeabi_dsub
	mov	r2, r8
	mov	r3, r9
	bl	__aeabi_dsub
	add	r3, pc, #108	
	ldrd	r2, r3, [r3]
	mov	r8, r0
	mov	r9, r1
	ldrd	r0, r1, [sp, #16]
push {r1, r2}
	mov.w r1, #3235
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3235
	mov.w r2, #1610612736 
	mov	r3, r9
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r8, r0
	mov	r9, r1
	mov	r0, sl
	mov	r1, fp
	strd	sl, fp, [sp, #32]
	bl	__aeabi_dsub
	ldr	r2, [sp, #28]
	ubfx	r3, r1, #20, #11
	subs	r3, r2, r3
	cmp	r3, #49	
	mov	fp, r1
	mov	sl, r0
	bgt	lab116
	mov	r2, r0
	mov	r3, r1
	strd	r2, r3, [r4]
	ldrd	r2, r3, [sp, #32]
	strd	r2, r3, [sp, #8]
	b	lab114
	nop
	nop
	.ltorg
lab116: 	add	r3, pc, #288	
	ldrd	r2, r3, [r3]
	ldrd	r0, r1, [sp, #16]
push {r1, r2}
	mov.w r1, #1382
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1382
	mov.w r2, #1610612736 
	mov	r9, r1
	mov	r2, r0
	mov	r3, r1
	ldrd	r0, r1, [sp, #32]
	bl	__aeabi_dsub
	mov	sl, r0
	mov	fp, r1
	mov	r2, sl
	mov	r3, fp
	ldrd	r0, r1, [sp, #32]
	strd	sl, fp, [sp, #8]
	bl	__aeabi_dsub
	mov	r2, r8
	mov	r3, r9
	bl	__aeabi_dsub
	add	r3, pc, #240	
	ldrd	r2, r3, [r3]
	mov	r8, r0
	mov	r9, r1
	ldrd	r0, r1, [sp, #16]
push {r1, r2}
	mov.w r1, #4473
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4473
	mov.w r2, #1610612736 
	mov	r3, r9
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r8, r0
	mov	r9, r1
	mov	r0, sl
	mov	r1, fp
	bl	__aeabi_dsub
	mov	fp, r1
	mov	sl, r0
lab115: 	mov	r2, sl
	mov	r3, fp
	strd	r2, r3, [r4]
lab114: 	mov	r2, sl
	mov	r3, fp
	ldrd	r0, r1, [sp, #8]
	bl	__aeabi_dsub
	mov	r2, r8
	mov	r3, r9
	bl	__aeabi_dsub
	cmp	r7, #0
	mov	r2, r0
	mov	r3, r1
	strd	r2, r3, [r4, #8]
	bge	lab112
	add	r3, fp, #2147483648	
	add	r1, r1, #2147483648	
	str	r0, [r4, #8]
	str	sl, [r4]
	str	r3, [r4, #4]
	str	r1, [r4, #12]
	negs	r6, r6
	b	lab112
lab111: 	movs	r3, #3
	b	lab117
lab107:push {r1, r2}
	mov.w r1, #4092
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4092
	mov.w r2, #1610612736 
	cmp	r5, r3
	mov	r8, r0
	mov	r9, r1
	beq	lab118
	add	r3, pc, #120	
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #4334
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4334
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r4]
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	add	r3, pc, #92	
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #7749
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7749
	mov.w r2, #1610612736 
	strd	r0, r1, [r4, #8]
	b	lab112
lab118: 	add	r3, pc, #80	
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #7841
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7841
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r8, r0
	mov	r9, r1
push {r1, r2}
	mov.w r1, #5735
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5735
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r4]
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	add	r3, pc, #48	
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #82
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #82
	mov.w r2, #1610612736 
	strd	r0, r1, [r4, #8]
	b	lab112
	.ltorg
__ieee754_sqrt:
	ldr	r2, =0x7ff00000	
	bics	r2, r1
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	mov	r4, r1
	beq	lab119
	cmp	r1, #0
	mov	r3, r1
	mov	ip, r0
	ble	lab120
	asrs	r1, r1, #20
	beq	lab121
lab138: 	lsls	r0, r1, #31
	subw	r7, r1, #1023	
	orr	r3, r3, #1048576	
	bmi	lab122
	lsls	r3, r3, #1
	add	r3, r3, ip, lsr #31
	mov	ip, ip, lsl #1
lab122: 	mov	r2, ip, lsr #31
	movs	r6, #0
	add	r3, r2, r3, lsl #1
	asrs	r7, r7, #1
	mov	ip, ip, lsl #1
	mov	lr, #22
	mov	r4, r6
	mov	r2, #2097152	
lab124: 	cmp	r1, r3
	bgt	lab123
	subs	r3, r3, r1
	adds	r4, r1, r2
	add	r6, r2
lab123: 	lsls	r3, r3, #1
	subs	lr, lr, #1
	add	r3, r3, ip, lsr #31
	mov	r2, r2, lsr #1
	mov	ip, ip, lsl #1
	bne	lab124
	mov	r5, lr
	movs	r0, #32
	mov	r2, #2147483648	
	b	lab125
lab128: lab130: 	subs	r0, #1
	add	r3, r1, r3, lsl #1
	mov	ip, ip, lsl #1
	mov	r2, r2, lsr #1
	beq	lab127
lab125: 	cmp	r3, r4
	add	r1, r2, lr
	ble	lab128
	cmp	r1, #0
	add	lr, r1, r2
	blt	lab129
lab131: lab132: 	cmp	r1, ip
	it	hi
	addhi	r3, r3, #4294967295	
lab139: 	add	r5, r2
	mov	r4, r8
	b	lab130
lab129: 	cmp	lr, #0
	blt	lab131
	add	r8, r4, #1
	b	lab132
lab120: 	bic	r2, r1, #2147483648	
	orrs	r2, r0
	beq	lab133
	cmp	r1, #0
	bne	lab134
lab135: 	subs	r1, #21
	mov	r3, r2
	mov	ip, ip, lsl #21
	cmp	r2, #0
	beq	lab135
	lsls	r6, r2, #11
	bmi	lab136
lab121: 	movs	r0, #0
lab137: 	lsls	r5, r3, #11
	mov	r4, r0
	add	r0, r0, #1
	bpl	lab137
	mov	r2, r3
	mov	r3, ip
	lsl	ip, ip, r0
	rsb	r0, r0, #32
lab142: 	subs	r1, r1, r4
	orrs	r3, r2
	b	lab138
lab126: 	cmp	r1, ip
	bhi	lab130
	cmp	r1, #0
	add	lr, r1, r2
	blt	lab129
	mov	r8, r3
	movs	r3, #0
	b	lab139
lab127: 	orrs	r3, r3, ip
	bne	lab140
	lsrs	r0, r5, #1
lab141: 	add	r3, r3, #1069547520	
	add	r3, r3, #2097152	
	lsls	r2, r6, #31
	it	mi
	orrmi	r0, r0, #2147483648	
	add	r9, r3, r7, lsl #20
	mov	r5, r0
	mov	r4, r9
lab133: 	mov	r0, r5
	mov	r1, r4
	cpsid f
	push {r1, r2}
	mov.w r1, #6452
	mov.w r2, #1610612736 
lab140: 	adds	r1, r5, #1
	itet	ne
	addne	r0, r5, #1
	addeq	r6, #1
	lsrne	r0, r0, #1
	b	lab141
lab119: 	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #1851
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1851
	mov.w r2, #1610612736 
	mov	r3, r4
push {r1, r2}
	mov.w r1, #6420
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6420
	mov.w r2, #1610612736 
	mov	r4, r1
	mov	r0, r5
	mov	r1, r4
	cpsid f
	push {r1, r2}
	mov.w r1, #526
	mov.w r2, #1610612736 
lab134: 	mov	r2, r0
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #1485
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1485
	mov.w r2, #1610612736 
	mov	r4, r1
	b	lab133
lab136: 	mov	r3, ip
	movs	r0, #32
	mov	r4, #4294967295	
	b	lab142
	nop
	.ltorg
__kernel_cos:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bic	r8, r1, #2147483648	
	sub	sp, #28
	cmp	r8, #1044381696	
	mov	sl, r2
	mov	fp, r3
	mov	r6, r0
	str	r1, [sp, #4]
	bge	lab143
	bl	__aeabi_d2iz
	cmp	r0, #0
	beq	lab144
	ldr	r3, [sp, #4]
	mov	r2, r6
	mov	r1, r3
	mov	r0, r6
push {r1, r2}
	mov.w r1, #4404
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4404
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r4, r0
	mov	r5, r1
push {r1, r2}
	mov.w r1, #2581
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2581
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #4240
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4240
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #4703
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4703
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #1918
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1918
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #4677
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4677
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #4996
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4996
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #4682
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4682
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #2937
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2937
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #6809
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6809
	mov.w r2, #1610612736 
lab145: 	movs	r2, #0
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #3885
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3885
	mov.w r2, #1610612736 
	mov	r8, r0
	mov	r9, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #2956
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2956
	mov.w r2, #1610612736 
	ldr	r9, [sp, #4]
	mov	r4, r8
	mov	r8, r6
	mov	r7, r1
	mov	r6, r0
	mov	r2, sl
	mov	r3, fp
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #7189
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7189
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	movs	r0, #0
	ldr	r1, =0x3ff00000	
	bl	__aeabi_dsub
	add	sp, #28
	cpsid f
	push {r1, r2}
	mov.w r1, #5910
	mov.w r2, #1610612736 
lab143: 	ldr	r3, [sp, #4]
	mov	r2, r0
push {r1, r2}
	mov.w r1, #3518
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3518
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	r4, r0
	mov	r5, r1
push {r1, r2}
	mov.w r1, #7351
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7351
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #3649
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3649
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #7949
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7949
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #404
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #404
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #2874
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2874
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #1407
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1407
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r4
	mov	r3, r5
push {r1, r2}
	mov.w r1, #6632
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6632
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #760
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #760
	mov.w r2, #1610612736 
	mov	r2, r4
push {r1, r2}
	mov.w r1, #5543
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5543
	mov.w r2, #1610612736 
	cmp	r8, r3
	strd	r0, r1, [sp, #8]
	ble	lab145
	ldr	r3, =0x3fe90000	
	cmp	r8, r3
	mov	r2, #0
	bgt	lab146
	sub	r3, r8, #2097152	
	ldr	r1, =0x3ff00000	
	movs	r0, #0
	mov	r8, r2
	mov	r9, r3
	bl	__aeabi_dsub
	strd	r0, r1, [sp, #16]
lab147: 	movs	r2, #0
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #7544
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7544
	mov.w r2, #1610612736 
	mov	r3, r9
	bl	__aeabi_dsub
	ldrd	r2, r3, [sp, #8]
	mov	r8, r0
	mov	r9, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #3365
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3365
	mov.w r2, #1610612736 
	ldr	r9, [sp, #4]
	mov	r4, r8
	mov	r8, r6
	mov	r7, r1
	mov	r6, r0
	mov	r2, sl
	mov	r3, fp
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #153
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #153
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldrd	r0, r1, [sp, #16]
	bl	__aeabi_dsub
	add	sp, #28
	cpsid f
	push {r1, r2}
	mov.w r1, #2724
	mov.w r2, #1610612736 
lab146: 	ldr	r3, =0x3fe70000	
	ldr	r9, =0x3fd20000	
	strd	r2, r3, [sp, #16]
	mov	r8, #0
	b	lab147
lab144: 	ldr	r1, =0x3ff00000	
	movs	r0, #0
	add	sp, #28
	cpsid f
	push {r1, r2}
	mov.w r1, #3926
	mov.w r2, #1610612736 
	nop
	.ltorg
__kernel_rem_pio2:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #612	
	mov	r4, r3
	str	r3, [sp, #32]
	str	r1, [sp, #44]	
	ldr	r3, =init_jk	
	ldr	r1, [sp, #648]	
	ldr	r3, [r3, r1, lsl #2]
	str	r3, [sp, #20]
	cmn	r2, #20
	add	r3, r4, #4294967295	
	mov	r6, r0
	str	r3, [sp, #12]
	blt	lab148
	ldr	r1, =0x2aaaaaab	
	subs	r3, r2, #3
	smull	r0, r1, r1, r3
	asrs	r3, r3, #31
	rsb	r3, r3, r1, asr #2
	str	r3, [sp, #28]
	adds	r3, #1
	sub	r3, r3, r3, lsl #2
	lsls	r3, r3, #3
lab208: 	str	r3, [sp, #24]
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #12]
	subs	r4, r2, r3
	ldr	r2, [sp, #20]
	adds	r7, r2, r3
	bmi	lab149
	adds	r7, #1
	ldr	sl, [sp, #652]	
	add	r7, r4
	add	r5, sp, #128	
	mov	r8, #0
	mov	r9, #0
	b	lab150
lab151: push {r1, r2}
	mov.w r1, #3104
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3104
	mov.w r2, #1610612736 
	cmp	r4, r7
	strd	r0, r1, [r5], #8
	beq	lab149
lab150: 	cmp	r4, #0
	bge	lab151
	adds	r4, #1
	mov	r0, r8
	mov	r1, r9
	cmp	r4, r7
	strd	r0, r1, [r5], #8
	bne	lab150
lab149: 	ldr	r3, [sp, #20]
	cmp	r3, #0
	blt	lab152
	ldr	r3, [sp, #32]
	ldr	r9, [sp, #12]
	add	r2, sp, #128	
	add	sl, r2, r3, lsl #3
	lsls	r2, r3, #3
	str	r2, [sp, #8]
	ldr	r2, [sp, #20]
	sub	r1, r6, #8
	add	r2, r3
	str	r1, [sp, #16]
	add	fp, sp, #448	
	str	r2, [sp, #4]
	add	r8, r1, r3, lsl #3
lab155: 	cmp	r3, #0
	blt	lab153
	ldr	r6, [sp, #16]
	mov	r7, sl
	movs	r4, #0
	movs	r5, #0
lab154: 	ldrd	r0, r1, [r6, #8]!
push {r1, r2}
	mov.w r1, #5522
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5522
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #255
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #255
	mov.w r2, #1610612736 
	mov	r4, r0
	mov	r5, r1
	bne	lab154
lab187: 	add	r9, r9, #1
	cmp	r9, r3
	strd	r4, r5, [fp], #8
	add	sl, sl, #8
	bne	lab155
lab216: 	ldr	fp, [sp, #8]
	ldr	r2, [sp, #20]
	str	r2, [sp, #4]
	add	fp, r3
	add	r3, sp, #44	
	add	r3, r3, r2, lsl #2
	str	r3, [sp, #40]	
	add	r3, sp, #48	
	add	r3, r3, r2, lsl #2
	subs	r3, #8
	str	r3, [sp, #36]	
lab170: 	add	r3, sp, #608	
	add	r3, r3, r2, lsl #3
	cmp	r2, #0
	ldrd	r4, r5, [r3, #-160]	
	ble	lab156
	add	sl, sp, #448	
	add	r8, sl, r2, lsl #3
	add	r9, sp, #48	
lab157: 	movs	r2, #0
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #6398
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6398
	mov.w r2, #1610612736 
push {r1, r2}
	mov.w r1, #3516
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3516
	mov.w r2, #1610612736 
	movs	r2, #0
	mov	r6, r0
	mov	r7, r1
push {r1, r2}
	mov.w r1, #4365
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4365
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	bl	__aeabi_d2iz
	ldrd	r2, r3, [r8, #-8]!
	str	r0, [r9], #4
	mov	r1, r7
	mov	r0, r6
push {r1, r2}
	mov.w r1, #6774
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6774
	mov.w r2, #1610612736 
	mov	r4, r0
	mov	r5, r1
	bne	lab157
lab156: 	ldr	r9, [sp, #24]
	mov	r0, r4
	mov	r1, r5
	mov	r2, r9
push {r1, r2}
	mov.w r1, #3908
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3908
	mov.w r2, #1610612736 
	mov	r3, #1069547520	
	mov	r4, r0
	mov	r5, r1
push {r1, r2}
	mov.w r1, #1374
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1374
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6205
	mov.w r2, #1610612736 
	movs	r2, #0
push {r1, r2}
	mov.w r1, #4791
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4791
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r5, r1
	mov	r4, r0
	bl	__aeabi_d2iz
	mov	r8, r0
push {r1, r2}
	mov.w r1, #533
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #533
	mov.w r2, #1610612736 
	mov	r2, r0
	mov	r1, r5
	mov	r0, r4
	bl	__aeabi_dsub
	mov	r3, r9
	cmp	r3, #0
	mov	r6, r0
	mov	r7, r1
	ble	lab158
	ldr	r2, [sp, #4]
	subs	r1, r2, #1
	add	r2, sp, #48	
	rsb	r3, r9, #24
	ldr	r2, [r2, r1, lsl #2]
	asr	r0, r2, r3
	lsl	r3, r0, r3
	subs	r3, r2, r3
	rsb	r5, r9, #23
	add	r2, sp, #48	
	asr	r5, r3, r5
	cmp	r5, #0
	str	r3, [r2, r1, lsl #2]
	add	r8, r0
	bgt	lab159
lab173: 	movs	r3, #0
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	lab160
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #20]
	add	sl, r3, #4294967295	
	cmp	r2, sl
	bgt	lab161
	add	r3, r3, #1073741824	
	add	r2, sp, #48	
	subs	r3, #1
	ldr	r0, [sp, #40]	
	add	r3, r2, r3, lsl #2
	movs	r2, #0
lab162: 	cmp	r3, r0
	orr	r2, r2, r1
	bne	lab162
	cmp	r2, #0
	bne	lab163
lab161: 	ldr	r3, [sp, #20]
	add	r2, sp, #48	
	subs	r3, #1
	ldr	r3, [r2, r3, lsl #2]
	cmp	r3, #0
	bne	lab164
	ldr	r2, [sp, #36]	
	movs	r3, #1
lab165: 	adds	r3, #1
	cmp	r1, #0
	beq	lab165
	ldr	r2, [sp, #4]
	adds	r3, r2, r3
	str	r3, [sp, #8]
	adds	r3, r2, #1
	mov	r9, r3
lab186: 	ldr	r2, [sp, #32]
	add	r8, r2
	ldr	r2, [sp, #28]
	add	sl, r2, r3
	add	sl, sl, #1073741824	
	ldr	r2, [sp, #652]	
	add	sl, sl, #4294967295	
	add	sl, r2, sl, lsl #2
	add	r2, sp, #128	
	add	r8, r2, r8, lsl #3
	add	r2, sp, #448	
	add	r3, r2, r3, lsl #3
	str	r3, [sp, #4]
lab169: push {r1, r2}
	mov.w r1, #3397
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3397
	mov.w r2, #1610612736 
	cmp	r3, #0
	strd	r0, r1, [r8]
	mov	r7, r8
	add	r8, r8, #8
	blt	lab166
	ldr	r6, [sp, #16]
	subs	r7, #8
	movs	r4, #0
	movs	r5, #0
	b	lab167
lab168: lab167: 	ldrd	r2, r3, [r6, #8]!
push {r1, r2}
	mov.w r1, #279
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #279
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #1631
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1631
	mov.w r2, #1610612736 
	mov	r4, r0
	mov	r5, r1
	bne	lab168
lab171: 	strd	r4, r5, [r3], #8
	str	r3, [sp, #4]
	ldr	r3, [sp, #8]
	add	r9, r9, #1
	cmp	r9, r3
	ble	lab169
	str	r3, [sp, #4]
	b	lab170
lab166: 	movs	r4, #0
	movs	r5, #0
	b	lab171
	.ltorg
lab158: 	bne	lab172
	ldr	r3, [sp, #4]
	add	r2, sp, #48	
	subs	r3, #1
	ldr	r5, [r2, r3, lsl #2]
	asrs	r5, r5, #23
	cmp	r5, #0
	ble	lab173
lab159: 	ldr	r3, [sp, #4]
	cmp	r3, #0
	add	r8, r8, #1
	ble	lab174
lab185: 	cmp	r4, #0
	bne	lab175
	ldr	r3, [sp, #4]
	cmp	r3, #1
	beq	lab176
	add	r3, sp, #48	
	movs	r2, #1
lab184: 	cmp	r4, #0
	beq	lab177
	adds	r3, r2, #1
lab183: 	rsb	r4, r4, #16777216	
	str	r4, [r1, r2, lsl #2]
	ldr	r1, [sp, #4]
	cmp	r1, r3
	ble	lab178
	add	r2, sp, #48	
	add	r0, sp, #48	
	ldr	r2, [r2, r3, lsl #2]
	add	r3, r0, r3, lsl #2
	add	r0, r0, r1, lsl #2
	mvn	r1, #4278190080	
	b	lab179
lab180: lab179: 	subs	r2, r1, r2
	str	r2, [r3], #4
	cmp	r3, r0
	bne	lab180
lab178: 	movs	r4, #1
lab176: 	ldr	r3, [sp, #24]
	cmp	r3, #0
	ble	lab181
	cmp	r3, #1
	beq	lab182
	cmp	r3, #2
	bne	lab181
	ldr	r3, [sp, #4]
	subs	r2, r3, #1
	add	r3, sp, #48	
	add	r1, sp, #48	
	ldr	r3, [r3, r2, lsl #2]
	ubfx	r3, r3, #0, #22
	str	r3, [r1, r2, lsl #2]
lab181: 	cmp	r5, #2
	bne	lab173
	mov	r2, r6
	mov	r3, r7
	ldr	r1, =0x3ff00000	
	movs	r0, #0
	bl	__aeabi_dsub
	mov	r6, r0
	mov	r7, r1
	cmp	r4, #0
	beq	lab173
	ldr	r2, [sp, #24]
	ldr	r1, =0x3ff00000	
	movs	r0, #0
push {r1, r2}
	mov.w r1, #7202
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7202
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r6, r0
	mov	r7, r1
	b	lab173
lab175: 	movs	r3, #1
	movs	r2, #0
	b	lab183
lab177: 	ldr	r1, [sp, #4]
	adds	r2, #1
	cmp	r2, r1
	bne	lab184
	b	lab176
lab172: 	ldr	r3, =0x3fe00000	
	movs	r2, #0
	bl	__aeabi_dcmpge
	mov	r5, r0
	cmp	r0, #0
	beq	lab173
	ldr	r3, [sp, #4]
	cmp	r3, #0
	add	r8, r8, #1
	it	gt
	movgt	r5, #2
	bgt	lab185
	mov	r2, r6
	mov	r3, r7
	ldr	r1, =0x3ff00000	
	movs	r0, #0
	bl	__aeabi_dsub
	movs	r5, #2
	mov	r6, r0
	mov	r7, r1
	b	lab173
lab164: 	ldr	r3, [sp, #4]
	adds	r3, #1
	mov	r9, r3
	str	r3, [sp, #8]
	b	lab186
lab153: 	movs	r4, #0
	movs	r5, #0
	b	lab187
lab163: 	ldr	r3, [sp, #24]
	str	r5, [sp, #12]
	sub	r2, r3, #24
	add	r3, sp, #48	
	str	r8, [sp, #28]
	ldr	r3, [r3, sl, lsl #2]
	str	r2, [sp, #24]
	cbnz	r3, lab188
	ldr	r3, [sp, #4]
	add	r3, r3, #1073741824	
	subs	r3, #2
	add	r1, sp, #48	
	add	r3, r1, r3, lsl #2
lab189: 	add	sl, sl, #4294967295	
	subs	r2, #24
	cmp	r1, #0
	beq	lab189
	str	r2, [sp, #24]
lab188: 	ldr	r2, [sp, #24]
	ldr	r1, =0x3ff00000	
	movs	r0, #0
push {r1, r2}
	mov.w r1, #143
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #143
	mov.w r2, #1610612736 
	mov	r4, r0
	mov	r5, r1
	blt	lab190
	add	r3, sp, #448	
	add	fp, r3, sl, lsl #3
	add	r2, sp, #48	
	add	r3, sl, #1
	str	r3, [sp, #24]
	add	r6, r2, r3, lsl #2
	ldr	r9, =0x3e700000	
	mov	r3, sl, lsl #3
	str	r3, [sp, #16]
	add	r7, fp, #8
	mov	r8, #0
lab191: push {r1, r2}
	mov.w r1, #3795
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3795
	mov.w r2, #1610612736 
	mov	r3, r5
push {r1, r2}
	mov.w r1, #801
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #801
	mov.w r2, #1610612736 
	strd	r0, r1, [r7, #-8]!
	mov	r2, r8
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #5642
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5642
	mov.w r2, #1610612736 
	cmp	r6, r3
	mov	r4, r0
	mov	r5, r1
	bne	lab191
	add	r3, sp, #288	
	strd	r3, sl, [sp, #4]
	ldr	sl, [sp, #20]
	cmp	sl, #0
	mov	r9, #0
	blt	lab192
lab197: 	ldrd	r2, r3, [r3]
	ldr	r8, [pc, #192]	
	mov	r7, fp
	movs	r6, #0
	movs	r4, #0
	movs	r5, #0
	b	lab193
lab195: 	blt	lab194
	ldrd	r2, r3, [r8], #8
lab193: 	ldrd	r0, r1, [r7], #8
push {r1, r2}
	mov.w r1, #8121
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8121
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #3126
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3126
	mov.w r2, #1610612736 
	cmp	sl, r6
	mov	r4, r0
	mov	r5, r1
	bge	lab195
lab194: 	ldr	r3, [sp, #4]
	ldr	r2, [sp, #8]
	add	r3, r3, r9, lsl #3
	cmp	r9, r2
	strd	r4, r5, [r3]
	sub	fp, fp, #8
	add	r3, r9, #1
	beq	lab196
	cmp	sl, #0
	mov	r9, r3
	bge	lab197
lab192: 	movs	r4, #0
	movs	r5, #0
	b	lab194
lab196: 	ldr	r3, [sp, #648]	
	ldr	sl, [sp, #8]
	cmp	r3, #2
	bgt	lab198
	cmp	r3, #0
	bgt	lab199
	bne	lab200
	ldr	r4, [sp, #16]
	ldr	r2, [sp, #648]	
	ldr	r5, [sp, #4]
	adds	r4, #8
	add	r4, r5
	mov	r3, r2
lab201: 	mov	r1, r3
	ldrd	r2, r3, [r4, #-8]!
push {r1, r2}
	mov.w r1, #3550
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3550
	mov.w r2, #1610612736 
	mov	r2, r0
	mov	r3, r1
	bne	lab201
lab219: 	cbz	r1, lab202
	add	r3, r3, #2147483648	
lab202: 	mov	r1, r3
	ldr	r3, [sp, #44]	
	mov	r0, r2
	strd	r0, r1, [r3]
lab200: 	ldr	r3, [sp, #28]
	and	r0, r3, #7
	add	sp, sp, #612	
	cpsid f
	push {r1, r2}
	mov.w r1, #4729
	mov.w r2, #1610612736 
	nop
	.ltorg
lab198: 	ldr	r3, [sp, #648]	
	cmp	r3, #3
	bne	lab200
	cmp	sl, #0
	beq	lab203
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #16]
	add	r3, r2
	ldrd	r4, r5, [r3]
	mov	fp, r3
lab204: 	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #5020
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5020
	mov.w r2, #1610612736 
	mov	r9, r5
	mov	r4, r0
	mov	r5, r1
	mov	r2, r4
	mov	r3, r5
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r3, r9
	mov	r2, r8
push {r1, r2}
	mov.w r1, #1185
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1185
	mov.w r2, #1610612736 
	strd	r4, r5, [fp, #-8]!
	ldr	r3, [sp, #4]
	cmp	r3, fp
	bne	lab204
	cmp	sl, #1
	ble	lab203
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #4]
	add	r3, r2
	ldrd	r4, r5, [r3]
	str	r3, [sp, #8]
	mov	sl, r3
	add	fp, sp, #296	
lab205: 	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #3229
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3229
	mov.w r2, #1610612736 
	mov	r9, r5
	mov	r4, r0
	mov	r5, r1
	mov	r2, r4
	mov	r3, r5
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r8
	mov	r3, r9
push {r1, r2}
	mov.w r1, #2662
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2662
	mov.w r2, #1610612736 
	strd	r4, r5, [sl, #-8]!
	cmp	fp, sl
	bne	lab205
	ldr	r2, [sp, #4]
	ldr	r4, [sp, #8]
	movs	r3, #0
	add	r5, r2, #16
	adds	r4, #8
	mov	r2, r3
lab206: 	mov	r1, r2
	ldrd	r2, r3, [r4, #-8]!
push {r1, r2}
	mov.w r1, #414
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #414
	mov.w r2, #1610612736 
	mov	r3, r0
	mov	r2, r1
	bne	lab206
lab220: 	cmp	r1, #0
	bne	lab207
	mov	r0, r3
	ldr	r3, [sp, #4]
	ldr	r4, [sp, #44]	
	mov	r1, r2
	ldrd	r2, r3, [r3, #8]
	strd	r2, r3, [r4, #8]
	ldrd	r2, r3, [sp, #288]	
	strd	r2, r3, [r4]
	ldr	r3, [sp, #28]
	strd	r0, r1, [r4, #16]
	and	r0, r3, #7
	add	sp, sp, #612	
	cpsid f
	push {r1, r2}
	mov.w r1, #4125
	mov.w r2, #1610612736 
lab182: 	ldr	r3, [sp, #4]
	subs	r2, r3, #1
	add	r3, sp, #48	
	add	r1, sp, #48	
	ldr	r3, [r3, r2, lsl #2]
	ubfx	r3, r3, #0, #23
	str	r3, [r1, r2, lsl #2]
	b	lab181
lab148: 	movs	r1, #0
	mvn	r3, #23
	str	r1, [sp, #28]
	b	lab208
lab174: 	movs	r4, #0
	b	lab176
lab160: 	ldr	r4, [sp, #24]
	str	r5, [sp, #12]
	mov	r0, r6
	mov	r1, r7
	negs	r2, r4
	str	r8, [sp, #28]
push {r1, r2}
	mov.w r1, #3652
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3652
	mov.w r2, #1610612736 
	movs	r2, #0
	mov	r6, r0
	mov	r7, r1
	bl	__aeabi_dcmpge
	cmp	r0, #0
	beq	lab209
	ldr	r3, =0x3e700000	
	ldr	r5, [sp, #4]
	movs	r2, #0
	adds	r4, #24
	mov	r0, r6
	mov	r1, r7
	str	r4, [sp, #24]
push {r1, r2}
	mov.w r1, #344
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #344
	mov.w r2, #1610612736 
	mov	r4, r0
push {r1, r2}
	mov.w r1, #4554
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4554
	mov.w r2, #1610612736 
	movs	r2, #0
push {r1, r2}
	mov.w r1, #4977
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4977
	mov.w r2, #1610612736 
	mov	r2, r0
	mov	r1, r7
	mov	r0, r6
	bl	__aeabi_dsub
	bl	__aeabi_d2iz
	add	sl, r5, #1
	add	r3, sp, #48	
	str	r0, [r3, r5, lsl #2]
	str	r4, [r3, sl, lsl #2]
	b	lab188
lab199: 	ldr	r3, [sp, #24]
	ldr	r5, [sp, #4]
	movs	r6, #0
	add	r4, r5, r3, lsl #3
	mov	r3, r6
lab210: 	mov	r1, r3
	ldrd	r2, r3, [r4, #-8]!
push {r1, r2}
	mov.w r1, #5983
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5983
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r3, r1
	bne	lab210
lab221: 	mov	r0, r6
	cmp	r2, #0
	bne	lab211
	mov	r1, r3
	ldr	r3, [sp, #44]	
	mov	r2, r6
	strd	r0, r1, [r3]
	mov	r3, r1
	ldrd	r0, r1, [sp, #288]	
	bl	__aeabi_dsub
	cmp	sl, #0
	mov	r2, r0
	mov	r3, r1
	ble	lab212
lab214: 	movs	r4, #1
lab213: 	mov	r1, r3
	ldrd	r2, r3, [r5, #8]!
push {r1, r2}
	mov.w r1, #4868
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4868
	mov.w r2, #1610612736 
	cmp	sl, r4
	mov	r2, r0
	mov	r3, r1
	bge	lab213
	ldr	r1, [sp, #12]
	cbz	r1, lab212
lab215: lab212: 	mov	r1, r3
	ldr	r3, [sp, #44]	
	mov	r0, r2
	strd	r0, r1, [r3, #8]
	ldr	r3, [sp, #28]
	and	r0, r3, #7
	add	sp, sp, #612	
	cpsid f
	push {r1, r2}
	mov.w r1, #4216
	mov.w r2, #1610612736 
lab209: 	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_d2iz
	ldr	r3, [sp, #4]
	add	r2, sp, #48	
	mov	sl, r3
	str	r0, [r2, r3, lsl #2]
	b	lab188
lab207: 	ldr	r6, [sp, #44]	
	str	r3, [r6, #16]
	ldr	r3, [sp, #4]
	add	r2, r2, #2147483648	
	ldr	r0, [r3, #8]
	ldr	r4, [r3, #0]
	str	r2, [r6, #20]
	mov	r2, r3
	ldr	r3, [r3, #4]
	add	r5, r3, #2147483648	
	ldr	r3, [r2, #12]
	add	r1, r3, #2147483648	
	ldr	r3, [sp, #28]
	strd	r0, r1, [r6, #8]
	and	r0, r3, #7
	strd	r4, r5, [r6]
	add	sp, sp, #612	
	cpsid f
	push {r1, r2}
	mov.w r1, #3072
	mov.w r2, #1610612736 
lab211: 	ldr	r2, [sp, #44]	
	mov	r1, r3
	add	r3, r3, #2147483648	
	str	r3, [r2, #4]
	str	r6, [r2, #0]
	mov	r3, r1
	mov	r2, r6
	ldrd	r0, r1, [sp, #288]	
	bl	__aeabi_dsub
	cmp	sl, #0
	mov	r2, r0
	mov	r3, r1
	bgt	lab214
	b	lab215
lab152: 	sub	r3, r6, #8
	str	r3, [sp, #16]
	ldr	r3, [sp, #32]
	lsls	r3, r3, #3
	str	r3, [sp, #8]
	b	lab216
lab190: 	ldr	r3, [sp, #648]	
	cmp	r3, #2
	bgt	lab217
	cmp	r3, #0
	bgt	lab218
	bne	lab200
	ldr	r2, [sp, #648]	
	mov	r3, r2
	b	lab219
lab217: 	ldr	r3, [sp, #648]	
	cmp	r3, #3
	bne	lab200
	movs	r3, #0
	add	r1, sp, #288	
	mov	r2, r3
	str	r1, [sp, #4]
	b	lab220
lab218: 	movs	r6, #0
	mov	r3, r6
	b	lab221
lab203: 	movs	r3, #0
	mov	r2, r3
	b	lab220
	.ltorg
__kernel_sin:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r9, r3
	sub	sp, #28
	bic	r3, r1, #2147483648	
	cmp	r3, #1044381696	
	mov	r8, r2
	mov	r4, r0
	str	r1, [sp, #4]
	bge	lab222
	bl	__aeabi_d2iz
	cmp	r0, #0
	beq	lab223
lab222: 	ldr	r3, [sp, #4]
	mov	r2, r4
	mov	r1, r3
	mov	r0, r4
push {r1, r2}
	mov.w r1, #6372
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6372
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r7, r1
	mov	r2, r6
	mov	r1, r3
	mov	r0, r4
	mov	r3, r7
push {r1, r2}
	mov.w r1, #1333
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1333
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	mov	sl, r0
	mov	fp, r1
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #6718
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6718
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #4895
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4895
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #5429
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5429
	mov.w r2, #1610612736 
	mov	r3, r7
push {r1, r2}
	mov.w r1, #8038
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8038
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #3494
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3494
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #6278
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6278
	mov.w r2, #1610612736 
	strd	r0, r1, [sp, #8]
	cmp	r3, #0
	beq	lab224
	ldr	r3, =0x3fe00000	
	movs	r2, #0
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #3261
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3261
	mov.w r2, #1610612736 
	strd	r0, r1, [sp, #16]
	mov	r0, sl
	mov	r1, fp
push {r1, r2}
	mov.w r1, #3607
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3607
	mov.w r2, #1610612736 
	mov	r3, r1
	ldrd	r0, r1, [sp, #16]
	bl	__aeabi_dsub
	mov	r2, r6
	mov	r3, r7
push {r1, r2}
	mov.w r1, #3034
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3034
	mov.w r2, #1610612736 
	mov	r3, r9
	bl	__aeabi_dsub
	add	r3, pc, #160	
	ldrd	r2, r3, [r3]
	mov	r6, r0
	mov	r7, r1
	mov	r0, sl
	mov	r1, fp
push {r1, r2}
	mov.w r1, #6805
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6805
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #5968
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5968
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	ldr	r1, [sp, #4]
	bl	__aeabi_dsub
	mov	r4, r0
	mov	r5, r1
	mov	r0, r4
	mov	r1, r5
	add	sp, #28
	cpsid f
	push {r1, r2}
	mov.w r1, #6716
	mov.w r2, #1610612736 
lab224: 	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
push {r1, r2}
	mov.w r1, #5008
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5008
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
	bl	__aeabi_dsub
	mov	r2, sl
	mov	r3, fp
push {r1, r2}
	mov.w r1, #1043
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1043
	mov.w r2, #1610612736 
	ldr	r3, [sp, #4]
push {r1, r2}
	mov.w r1, #1107
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1107
	mov.w r2, #1610612736 
	mov	r5, r1
	mov	r0, r4
	mov	r1, r5
	add	sp, #28
	cpsid f
	push {r1, r2}
	mov.w r1, #3598
	mov.w r2, #1610612736 
lab223: 	ldr	r5, [sp, #4]
	mov	r0, r4
	mov	r1, r5
	add	sp, #28
	cpsid f
	push {r1, r2}
	mov.w r1, #2295
	mov.w r2, #1610612736 
	nop
	.ltorg
with_errno:
	push	{r4, r6, r7, lr}
	mov	r6, r0
	mov	r7, r1
	mov	r4, r2
	bl	__errno
	mov	r3, r0
	mov	r1, r7
	mov	r0, r6
	str	r4, [r3, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #3854
	mov.w r2, #1610612736 
	nop
xflow:
	push	{r4, r5, lr}
	sub	sp, #12
	cbz	r0, lab225
	mov	r4, r2
	add	r5, r3, #2147483648	
lab226: 	mov	r0, r2
	mov	r1, r3
	ldrd	r2, r3, [sp]
push {r1, r2}
	mov.w r1, #6685
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6685
	mov.w r2, #1610612736 
	add	sp, #12
	ldmia	sp!, {r4, r5, lr}
	b	with_errno
lab225: 	mov	r4, r2
	mov	r5, r3
	b	lab226
	nop
__math_uflow:
	movs	r2, #0
	mov	r3, #268435456	
	b	xflow
	nop
__math_oflow:
	movs	r2, #0
	mov	r3, #1879048192	
	b	xflow
	nop
fabs:
	bic	r1, r1, #2147483648	
	bx	lr
	nop
finite:
	orr	r0, r1, #2147483648	
	add	r0, r0, #1048576	
	lsrs	r0, r0, #31
	bx	lr
floor:
	ubfx	r2, r1, #20, #11
	push	{r3, r4, r5, r6, r7, lr}
	subw	r5, r2, #1023	
	cmp	r5, #19
	mov	r3, r1
	mov	ip, r0
	mov	r4, r1
	mov	r6, r0
	bgt	lab227
	cmp	r5, #0
	blt	lab228
	ldr	r7, =0x000fffff	
	asrs	r7, r5
	and	r2, r1, r7
	orrs	r2, r0
	beq	lab229
	add	r3, pc, #192	
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #784
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #784
	mov.w r2, #1610612736 
	movs	r3, #0
	bl	__aeabi_dcmpgt
	cbz	r0, lab230
	cmp	r4, #0
	bge	lab231
	mov	r3, #1048576	
	asr	r5, r3, r5
	add	r4, r5
lab231: 	bic	r4, r4, r7
	movs	r6, #0
lab230: 	mov	r3, r4
	mov	ip, r6
lab229: 	mov	r0, ip
	mov	r1, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #6002
	mov.w r2, #1610612736 
lab228: 	add	r3, pc, #140	
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #3657
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3657
	mov.w r2, #1610612736 
	movs	r3, #0
	bl	__aeabi_dcmpgt
	cmp	r0, #0
	beq	lab230
	cmp	r4, #0
	blt	lab232
	movs	r6, #0
	mov	r4, r6
	b	lab230
lab227: 	cmp	r5, #51	
	ble	lab233
	cmp	r5, #1024	
	bne	lab229
	mov	r2, r0
push {r1, r2}
	mov.w r1, #3413
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3413
	mov.w r2, #1610612736 
	mov	r3, r1
	b	lab229
lab233: 	subw	r2, r2, #1043	
	mov	r7, #4294967295	
	lsrs	r7, r2
	tst	r7, r0
	beq	lab229
	add	r3, pc, #72	
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #4433
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4433
	mov.w r2, #1610612736 
	movs	r3, #0
	bl	__aeabi_dcmpgt
	cmp	r0, #0
	beq	lab230
	cmp	r4, #0
	blt	lab234
lab236: 	b	lab230
lab232: 	bic	r3, r4, #2147483648	
	ldr	r2, =0xbff00000	
	orrs	r6, r3
	cmp	r6, #0
	it	ne
	movne	r4, r2
	movs	r6, #0
	b	lab230
lab234: 	cmp	r5, #20
	beq	lab235
	movs	r3, #1
	rsb	r5, r5, #52	
	lsl	r5, r3, r5
	adds	r6, r5, r6
	it	cs
	addcs	r4, r4, r3
	b	lab236
lab235: 	adds	r4, #1
	b	lab236
	.ltorg
nan:
	ldr	r1, =0x7ff80000	
	movs	r0, #0
	bx	lr
	nop
	.ltorg
scalbn:
	ubfx	r3, r1, #20, #11
	push	{r4, r5, r6, lr}
	mov	ip, r1
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	cbnz	r3, lab237
	bic	ip, r1, #2147483648	
	mov	r3, r0
	orrs	r3, ip, r3
	beq	lab238
	ldr	r3, =0x43500000	
	movs	r2, #0
push {r1, r2}
	mov.w r1, #2113
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2113
	mov.w r2, #1610612736 
	cmp	r6, r3
	mov	r4, r0
	mov	r5, r1
	blt	lab239
	ubfx	r3, r1, #20, #11
	mov	ip, r1
	subs	r3, #54	
lab243: 	movw	r2, #2046	
	cmp	r3, r2
	bgt	lab240
	cmp	r3, #0
	bgt	lab241
	cmn	r3, #53	
	bge	lab242
	movw	r3, #50000	
	cmp	r6, r3
	bgt	lab240
	and	r3, r5, #2147483648	
	orr	r1, r3, #27525120	
	orr	r1, r1, #93696	
	ldr	r0, =0xc2f8f359	
	orr	r1, r1, #31
lab239: 	add	r3, pc, #104	
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #2557
	mov.w r2, #1610612736 
lab238:	cpsid f
	push {r1, r2}
	mov.w r1, #7659
	mov.w r2, #1610612736 
lab237: 	movw	r2, #2047	
	cmp	r3, r2
	bne	lab243
	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #1259
	mov.w r2, #1610612736 
	cpsid f
	push {r1, r2}
	mov.w r1, #3164
	mov.w r2, #1610612736 
lab240: 	and	r3, r5, #2147483648	
	orr	r1, r3, #2113929216	
	orr	r1, r1, #3653632	
	orr	r1, r1, #9216	
	add	r3, pc, #68	
	ldrd	r2, r3, [r3]
	ldr	r0, =0x8800759c	
	orr	r1, r1, #60	
push {r1, r2}
	mov.w r1, #2702
	mov.w r2, #1610612736 
	cpsid f
	push {r1, r2}
	mov.w r1, #5019
	mov.w r2, #1610612736 
lab242: 	bic	ip, ip, #2139095040	
	adds	r3, #54	
	bic	ip, ip, #7340032	
	orr	r1, ip, r3, lsl #20
	mov	r0, r4
	ldr	r3, =0x3c900000	
	movs	r2, #0
push {r1, r2}
	mov.w r1, #5184
	mov.w r2, #1610612736 
	cpsid f
	push {r1, r2}
	mov.w r1, #3019
	mov.w r2, #1610612736 
lab241: 	bic	ip, ip, #2139095040	
	bic	ip, ip, #7340032	
	mov	r0, r4
	orr	r1, ip, r3, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #2095
	mov.w r2, #1610612736 
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
	beq	lab244
	mov	r4, r4, lsr #21
	rsbs	r5, r4, r5, lsr #21
	it	lt
	neglt	r5, r5
	ble	lab245
	add	r4, r5
	eor	r2, r0, r2
	eor	r3, r1, r3
	eor	r0, r2, r0
	eor	r1, r3, r1
	eor	r2, r0, r2
	eor	r3, r1, r3
lab245: 	cmp	r5, #54	
	it	hi
	cpsid f
	push {r1, r2}
	mov.w r1, #851
	mov.w r2, #1610612736 
	tst	r1, #2147483648	
	mov	r1, r1, lsl #12
	mov	ip, #1048576	
	orr	r1, ip, r1, lsr #12
	beq	lab246
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab246: 	tst	r3, #2147483648	
	mov	r3, r3, lsl #12
	orr	r3, ip, r3, lsr #12
	beq	lab247
	negs	r2, r2
	sbc	r3, r3, r3, lsl #1
lab247: 	teq	r4, r5
	beq	lab248
lab260: 	rsbs	lr, r5, #32
	blt	lab249
	lsl	ip, r2, lr
	lsr	r2, r2, r5
	adds	r0, r0, r2
	adc	r1, r1, #0
	lsl	r2, r3, lr
	adds	r0, r0, r2
	asr	r3, r3, r5
	adcs	r1, r3
	b	lab250
lab249: 	sub	r5, r5, #32
	add	lr, lr, #32
	cmp	r2, #1
	lsl	ip, r3, lr
	it	cs
	orrcs	ip, ip, #2
	asr	r3, r3, r5
	adds	r0, r0, r3
	adcs	r1, r1, r3, asr #31
lab250: 	and	r5, r1, #2147483648	
	bpl	lab251
	mov	lr, #0
	rsbs	ip, ip, #0
	sbcs	r0, lr, r0
	sbc	r1, lr, r1
lab251: 	cmp	r1, #1048576	
	bcc	lab252
	cmp	r1, #2097152	
	bcc	lab253
	lsrs	r1, r1, #1
	movs	r0, r0, rrx
	mov	ip, ip, rrx
	add	r4, r4, #1
	mov	r2, r4, lsl #21
	cmn	r2, #4194304	
	bcs	lab254
lab253: 	cmp	ip, #2147483648	
	it	eq
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	orr	r1, r1, r5
	pop	{r4, r5, pc}
lab252: 	movs	ip, ip, lsl #1
	adcs	r0, r0
	adc	r1, r1, r1
	subs	r4, #1
	it	cs
	cmpcs	r1, #1048576	
	bcs	lab253
lab264: 	itt	eq
	moveq	r1, r0
	moveq	r0, #0
	clz	r3, r1
	it	eq
	addeq	r3, #32
	sub	r3, r3, #11
	subs	r2, r3, #32
	bge	lab255
	adds	r2, #12
	ble	lab256
	add	ip, r2, #20
	rsb	r2, r2, #12
	lsl	r0, r1, ip
	lsr	r1, r1, r2
	b	lab257
lab256: 	add	r2, r2, #20
lab255: 	it	le
	rsble	ip, r2, #32
	lsl	r1, r1, r2
	lsr	ip, r0, ip
	itt	le
	orrle	r1, r1, ip
	lslle	r0, r2
lab257: 	subs	r4, r4, r3
	ittt	ge
	addge	r1, r1, r4, lsl #20
	orrge	r1, r5
	popge	{r4, r5, pc}
	mvn	r4, r4
	subs	r4, #31
	bge	lab258
	adds	r4, #12
	bgt	lab259
	add	r4, r4, #20
	rsb	r2, r4, #32
	lsr	r0, r0, r4
	lsl	r3, r1, r2
	orr	r0, r0, r3
	lsr	r3, r1, r4
	orr	r1, r5, r3
	pop	{r4, r5, pc}
lab259: 	rsb	r4, r4, #12
	rsb	r2, r4, #32
	lsr	r0, r0, r2
	lsl	r3, r1, r4
	orr	r0, r0, r3
	mov	r1, r5
	pop	{r4, r5, pc}
lab258: 	lsr	r0, r1, r4
	mov	r1, r5
	pop	{r4, r5, pc}
lab248: 	teq	r4, #0
	eor	r3, r3, #1048576	
	itte	eq
	eoreq	r1, r1, #1048576	
	addeq	r4, #1
	subne	r5, #1
	b	lab260
lab244: 	mvns	ip, r4, asr #21
	it	ne
	mvnsne	ip, r5, asr #21
	beq	lab261
	teq	r4, r5
	it	eq
	teqeq	r0, r2
	beq	lab262
	orrs	ip, r4, r0
	itt	eq
	moveq	r1, r3
	moveq	r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #2346
	mov.w r2, #1610612736 
lab262: 	teq	r1, r3
	ittt	ne
	movne	r1, #0
	movne	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #4190
	mov.w r2, #1610612736 
	movs	ip, r4, lsr #21
	bne	lab263
	lsls	r0, r0, #1
	adcs	r1, r1
	it	cs
	orrcs	r1, r1, #2147483648	
	cpsid f
	push {r1, r2}
	mov.w r1, #7816
	mov.w r2, #1610612736 
lab263: 	adds	r4, r4, #4194304	
	itt	cc
	addcc	r1, r1, #1048576	
	cpsid f
	push {r1, r2}
	mov.w r1, #1768
	mov.w r2, #1610612736 
	and	r5, r1, #2147483648	
lab254: 	orr	r1, r5, #2130706432	
	orr	r1, r1, #15728640	
	mov	r0, #0
	pop	{r4, r5, pc}
lab261: 	mvns	ip, r4, asr #21
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
	mov.w r1, #6751
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
	b	lab264
	nop
__aeabi_i2d:
	teq	r0, #0
	itt	eq
	moveq	r1, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #6991
	mov.w r2, #1610612736 
	push	{r4, r5, lr}
	mov	r4, #1024	
	add	r4, r4, #50	
	ands	r5, r0, #2147483648	
	it	mi
	negmi	r0, r0
	mov	r1, #0
	b	lab264
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
	b	lab264
	nop
__aeabi_ul2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	mov	r5, #0
	b	lab265
__aeabi_l2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	ands	r5, r1, #2147483648	
	bpl	lab265
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab265: 	mov	r4, #1024	
	add	r4, r4, #50	
	movs	ip, r1, lsr #22
	beq	lab251
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
	b	lab251
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
	bleq	b630 <__aeabi_dmul+0x1dc>
	add	r4, r5
	eor	r6, r1, r3
	bic	r1, r1, ip, lsl #21
	bic	r3, r3, ip, lsl #21
	orrs	r5, r0, r1, lsl #12
	it	ne
	orrsne	r5, r2, r3, lsl #12
	orr	r1, r1, #1048576	
	orr	r3, r3, #1048576	
	beq	lab266
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
	bcs	lab267
	movs	lr, lr, lsl #1
	adcs	r5, r5
	adc	r6, r6, r6
lab267: 	orr	r1, r2, r6, lsl #11
	orr	r1, r1, r5, lsr #21
	mov	r0, r5, lsl #11
	orr	r0, r0, lr, lsr #21
	mov	lr, lr, lsl #11
	subs	ip, r4, #253	
	it	hi
	cmphi	ip, #1792	
	bhi	lab268
	cmp	lr, #2147483648	
	it	eq
	movseq	lr, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #129
	mov.w r2, #1610612736 
lab266: 	and	r6, r6, #2147483648	
	orr	r1, r6, r1
	orr	r0, r0, r2
	eor	r1, r1, r3
	subs	r4, r4, ip, lsr #1
	ittt	gt
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #740
	mov.w r2, #1610612736 
	orr	r1, r1, #1048576	
	mov	lr, #0
	subs	r4, #1
lab268: 	bgt	lab269
	cmn	r4, #54	
	ittt	le
	movle	r0, #0
	andle	r1, r1, #2147483648	
	cpsid f
	push {r1, r2}
	mov.w r1, #2881
	mov.w r2, #1610612736 
	rsb	r4, r4, #0
	subs	r4, #32
	bge	lab270
	adds	r4, #12
	bgt	lab271
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
lab271: 	rsb	r4, r4, #12
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
lab270: 	rsb	r5, r4, #32
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
lab276: 	bne	lab272
	and	r6, r1, #2147483648	
lab273: 	adc	r1, r1, r1
	tst	r1, #1048576	
	it	eq
	subeq	r4, #1
	beq	lab273
	orr	r1, r1, r6
	teq	r5, #0
	it	ne
	bxne	lr
lab272: 	and	r6, r3, #2147483648	
lab274: 	adc	r3, r3, r3
	tst	r3, #1048576	
	it	eq
	subeq	r5, #1
	beq	lab274
	orr	r3, r3, r6
	bx	lr
	teq	r4, ip
	and	r5, ip, r3, lsr #20
	it	ne
	teqne	r5, ip
	beq	lab275
	orrs	r6, r0, r1, lsl #1
	it	ne
	orrsne	r6, r2, r3, lsl #1
	bne	lab276
lab287: 	and	r1, r1, #2147483648	
	mov	r0, #0
	pop	{r4, r5, r6, pc}
lab275: 	orrs	r6, r0, r1, lsl #1
	itte	eq
	moveq	r0, r2
	moveq	r1, r3
	orrsne	r6, r2, r3, lsl #1
	beq	lab277
	teq	r4, ip
	bne	lab278
	orrs	r6, r0, r1, lsl #12
	bne	lab277
lab278: 	teq	r5, ip
	bne	lab279
	orrs	r6, r2, r3, lsl #12
	itt	ne
	movne	r0, r2
	movne	r1, r3
	bne	lab277
lab279: 	eor	r1, r1, r3
lab269: 	and	r1, r1, #2147483648	
	orr	r1, r1, #2130706432	
	orr	r1, r1, #15728640	
	mov	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #5947
	mov.w r2, #1610612736 
lab277: 	orr	r1, r1, #2130706432	
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
	bleq	b816 <__aeabi_ddiv+0x16e>
	sub	r4, r4, r5
	eor	lr, r1, r3
	orrs	r5, r2, r3, lsl #12
	mov	r1, r1, lsl #12
	beq	lab280
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
	bcs	lab281
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
lab281: 	subs	r6, r6, r2
	sbc	r5, r5, r3
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
	mov	r0, #1048576	
	mov	ip, #524288	
lab283: 	sbcs	lr, r5, r3
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
	beq	lab282
	mov	r5, r5, lsl #4
	orr	r5, r5, r6, lsr #28
	mov	r6, r6, lsl #4
	mov	r3, r3, lsl #3
	orr	r3, r3, r2, lsr #29
	mov	r2, r2, lsl #3
	movs	ip, ip, lsr #4
	bne	lab283
	tst	r1, #1048576	
	bne	lab284
	orr	r1, r1, r0
	mov	r0, #0
	mov	ip, #2147483648	
	b	lab283
lab282: 	tst	r1, #1048576	
	itt	eq
	orreq	r1, r0
	moveq	r0, #0
lab284: 	subs	ip, r4, #253	
	it	hi
	cmphi	ip, #1792	
	bhi	lab268
	subs	ip, r5, r3
	itt	eq
	subseq	ip, r6, r2
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #2637
	mov.w r2, #1610612736 
lab280: 	and	lr, lr, #2147483648	
	orr	r1, lr, r1, lsr #12
	adds	r4, r4, ip, lsr #1
	ittt	gt
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #4300
	mov.w r2, #1610612736 
	orr	r1, r1, #1048576	
	mov	lr, #0
	subs	r4, #1
	b	lab268
	orr	lr, r5, r6
	b	lab268
	and	r5, ip, r3, lsr #20
	teq	r4, ip
	it	eq
	teqeq	r5, ip
	beq	lab277
	teq	r4, ip
	bne	lab285
	orrs	r4, r0, r1, lsl #12
	bne	lab277
	teq	r5, ip
	bne	lab279
	mov	r0, r2
	mov	r1, r3
	b	lab277
lab285: 	teq	r5, ip
	bne	lab286
	orrs	r5, r2, r3, lsl #12
	beq	lab287
	mov	r0, r2
	mov	r1, r3
	b	lab277
lab286: 	orrs	r6, r0, r1, lsl #1
	it	ne
	orrsne	r6, r2, r3, lsl #1
	bne	lab276
	orrs	r4, r0, r1, lsl #1
	bne	lab279
	orrs	r5, r2, r3, lsl #1
	bne	lab287
	b	lab277
__gedf2:
	mov	ip, #4294967295	
	b	lab288
	nop
__ledf2:
	mov	ip, #1
	b	lab288
	nop
__cmpdf2:
	mov	ip, #1
lab288: 	str	ip, [sp, #-4]!
	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	mov	ip, r3, lsl #1
	it	ne
	mvnsne	ip, ip, asr #21
	beq	lab289
lab292: 	orrs	ip, r0, r1, lsl #1
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
lab289: 	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	bne	lab290
	orrs	ip, r0, r1, lsl #12
	bne	lab291
lab290: 	mov	ip, r3, lsl #1
	mvns	ip, ip, asr #21
	bne	lab292
	orrs	ip, r2, r3, lsl #12
	beq	lab292
lab291: 	ldr	r0, [sp], #4
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
	mov.w r1, #3745
	mov.w r2, #1610612736 
__aeabi_dcmpeq:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #2570
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2570
	mov.w r2, #1610612736 
	moveq	r0, #1
	movne	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmplt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #2521
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2521
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmple:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #4175
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4175
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpge:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #3499
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3499
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpgt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #7683
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7683
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpun:
	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	bne	lab293
	orrs	ip, r0, r1, lsl #12
	bne	lab294
lab293: 	mov	ip, r3, lsl #1
	mvns	ip, ip, asr #21
	bne	lab295
	orrs	ip, r2, r3, lsl #12
	bne	lab294
lab295: 	mov	r0, #0
	bx	lr
lab294: 	mov	r0, #1
	bx	lr
__aeabi_d2iz:
	mov	r2, r1, lsl #1
	adds	r2, r2, #2097152	
	bcs	lab296
	bpl	lab297
	mvn	r3, #992	
	subs	r2, r3, r2, asr #21
	bls	lab298
	mov	r3, r1, lsl #11
	orr	r3, r3, #2147483648	
	orr	r3, r3, r0, lsr #21
	tst	r1, #2147483648	
	lsr	r0, r3, r2
	it	ne
	negne	r0, r0
	bx	lr
lab297: 	mov	r0, #0
	bx	lr
lab296: 	orrs	r0, r0, r1, lsl #12
	bne	lab299
lab298: 	ands	r0, r1, #2147483648	
	it	eq
	mvneq	r0, #2147483648	
	bx	lr
lab299: 	mov	r0, #0
	bx	lr
	nop
__errno:
	ldr	r3, =_impure_ptr	
	ldr	r0, [r3, #0]
	bx	lr
	nop
	.ltorg
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x0001bea8	
	ldr	r5, =0x0001bea8	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab300
	movs	r4, #0
lab301: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #8162
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #8162
	mov.w r2, #1610612736 
lab300: 	ldr	r6, =0x0001beb0	
	ldr	r5, =0x0001bea8	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab302
	movs	r4, #0
lab303: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #799
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #799
	mov.w r2, #1610612736 
lab302:	cpsid f
	push {r1, r2}
	mov.w r1, #7969
	mov.w r2, #1610612736 
	.ltorg
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab304
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab305
	uxtb	r2, r1
	mov	r3, r0
	b	lab306
lab307: 	bcc	lab305
lab306: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab307
lab315: 	bls	lab308
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab309
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab310: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab310
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab311
lab316: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab312: 	cmp	r3, r2
	bne	lab312
	and	r4, ip, #3
lab308: 	cbz	r4, lab305
lab314: 	add	r4, r3
lab313: 	cmp	r4, r3
	bne	lab313
lab305:	cpsid f
	push {r1, r2}
	mov.w r1, #3383
	mov.w r2, #1610612736 
lab311: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab314
	b	lab305
lab304: 	mov	r3, r0
	mov	r4, r2
	b	lab315
lab309: 	mov	r2, r3
	mov	ip, r4
	b	lab316
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
	cbz	r6, lab317
	mov	r9, #1
	mov	sl, #0
lab323: 	subs	r5, r4, #1
	bmi	lab317
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab319: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab318
lab320: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab319
lab317: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab318: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab320
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab321
	blx	r2
lab326: 	cmp	r2, fp
	bne	lab322
lab325: 	cmp	r3, r6
	beq	lab320
	mov	r6, r3
	cmp	r6, #0
	bne	lab323
	b	lab317
lab321: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab324
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab325
lab322: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab323
	b	lab317
lab324: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab326
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =0x0001beb4	
	ldr	r5, =0x0001beb0	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab327
	subs	r3, #4
	add	r5, r3
lab328: 	ldr	r3, [r5], #-4
	
	push {r1, r2}
	mov.w r1, #3572
	mov.w r2, #1610612736 
	cmp	r4, #0
	push {r1, r2}
	mov.w r1, #3572
	mov.w r2, #1610612736 
lab327: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab329
lab333: 	cmp	r5, #31
	bgt	lab330
	cbnz	r6, lab331
lab332: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab334:	cpsid f
	push {r1, r2}
	mov.w r1, #1232
	mov.w r2, #1610612736 
lab331: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab332
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab332
lab329: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab333
lab330: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab334
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

exp_res0.0:
	.word	0x00000000
	.word	0x40000000
	.word	0x00000000
	.word	0x40180000
	.word	0x00000000
	.word	0x40040000
	.word	0x00000000
npio2_hw:
	.word	0x3ff921fb
	.word	0x400921fb
	.word	0x4012d97c
	.word	0x401921fb
	.word	0x401f6a7a
	.word	0x4022d97c
	.word	0x4025fdbb
	.word	0x402921fb
	.word	0x402c463a
	.word	0x402f6a7a
	.word	0x4031475c
	.word	0x4032d97c
	.word	0x40346b9c
	.word	0x4035fdbb
	.word	0x40378fdb
	.word	0x403921fb
	.word	0x403ab41b
	.word	0x403c463a
	.word	0x403dd85a
	.word	0x403f6a7a
	.word	0x40407e4c
	.word	0x4041475c
	.word	0x4042106c
	.word	0x4042d97c
	.word	0x4043a28c
	.word	0x40446b9c
	.word	0x404534ac
	.word	0x4045fdbb
	.word	0x4046c6cb
	.word	0x40478fdb
	.word	0x404858eb
	.word	0x404921fb
two_over_pi:
	.word	0x00a2f983
	.word	0x006e4e44
	.word	0x001529fc
	.word	0x002757d1
	.word	0x00f534dd
	.word	0x00c0db62
	.word	0x0095993c
	.word	0x00439041
	.word	0x00fe5163
	.word	0x00abdebb
	.word	0x00c561b7
	.word	0x00246e3a
	.word	0x00424dd2
	.word	0x00e00649
	.word	0x002eea09
	.word	0x00d1921c
	.word	0x00fe1deb
	.word	0x001cb129
	.word	0x00a73ee8
	.word	0x008235f5
	.word	0x002ebb44
	.word	0x0084e99c
	.word	0x007026b4
	.word	0x005f7e41
	.word	0x003991d6
	.word	0x00398353
	.word	0x0039f49c
	.word	0x00845f8b
	.word	0x00bdf928
	.word	0x003b1ff8
	.word	0x0097ffde
	.word	0x0005980f
	.word	0x00ef2f11
	.word	0x008b5a0a
	.word	0x006d1f6d
	.word	0x00367ecf
	.word	0x0027cb09
	.word	0x00b74f46
	.word	0x003f669e
	.word	0x005fea2d
	.word	0x007527ba
	.word	0x00c7ebe5
	.word	0x00f17b3d
	.word	0x000739f7
	.word	0x008a5292
	.word	0x00ea6bfb
	.word	0x005fb11f
	.word	0x008d5d08
	.word	0x00560330
	.word	0x0046fc7b
	.word	0x006babf0
	.word	0x00cfbc20
	.word	0x009af436
	.word	0x001da9e3
	.word	0x0091615e
	.word	0x00e61b08
	.word	0x00659985
	.word	0x005f14a0
	.word	0x0068408d
	.word	0x00ffd880
	.word	0x004d7327
	.word	0x00310606
	.word	0x001556ca
	.word	0x0073a8c9
	.word	0x0060e27b
	.word	0x00c08c6b
	.word	0x00000000
PIo2:
	.word	0x40000000
	.word	0x3ff921fb
	.word	0x00000000
	.word	0x3e74442d
	.word	0x80000000
	.word	0x3cf84698
	.word	0x60000000
	.word	0x3b78cc51
	.word	0x80000000
	.word	0x39f01b83
	.word	0x40000000
	.word	0x387a2520
	.word	0x80000000
	.word	0x36e38222
	.word	0x00000000
	.word	0x3569f31d
init_jk:
	.word	0x00000002
	.word	0x00000003
	.word	0x00000004
	.word	0x00000006
_global_impure_ptr:
	.word	0x0001bec0


	.data

_impure_ptr:
	.word	0x0001bec0
	.word	0x00000000
impure_data:
	.word	0x00000000
	.word	0x0001c1ac
	.word	0x0001c214
	.word	0x0001c27c
	.word	0x00000001
	.word	0x00000000
	.word	0xabcd330e
	.word	0xe66d1234
	.word	0x0005deec
	.word	0x0000000b
__atexit_recursive_mutex:
	.word	0x0001c338


	.bss

completed.1:
	.word	0x00000000
object.0:
soln_cnt0:
	.word	0x00000000
soln_cnt1:
	.word	0x00000000
res0:
res1:
__lock___atexit_recursive_mutex:
	.word	0x00000000
