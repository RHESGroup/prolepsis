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
	mov.w r1, #7139
	mov.w r2, #1610612736 
	cbz	r3, lab1
	ldr	r0, =0x0000933d	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	mov.w r1, #2508
	mov.w r2, #1610612736 
	ldr	r4, =completed.1	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x00009418	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	mov.w r1, #4749
	mov.w r2, #1610612736 
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x00009418	
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
	ldr	r0, =0x0001985c	
	ldr	r2, =0x00019ee4	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	mov.w r1, #8178
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
	ldr	r0, =0x00009331	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x0000933d	
push {r1, r2}
	mov.w r1, #4457
	mov.w r2, #1610612736 
lab7:	push {r1, r2}
	mov.w r1, #4457
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1817
	mov.w r2, #1610612736 
	movs	r1, r5
	bl	main
	push {r1, r2}
	mov.w r1, #7531
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
	mov.w r1, #4903
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4903
	mov.w r2, #1610612736 
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7281
	mov.w r2, #1610612736 
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #13
push {r1, r2}
	mov.w r1, #6125
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6125
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #7158
	mov.w r2, #1610612736 
benchmark_body:
	push	{r7, lr}
	sub	sp, #72	
	add	r7, sp, #8
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #60]	
	b	lab8
lab9: 	ldr	r0, =ArrayA	
push {r1, r2}
	mov.w r1, #2067
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2067
	mov.w r2, #1610612736 
	mov	r2, r3
	ldr	r1, =SumA	
	ldr	r0, =ArrayA	
push {r1, r2}
	mov.w r1, #4949
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4949
	mov.w r2, #1610612736 
	add	r1, r7, #16
	str	r1, [sp, #4]
	add	r1, r7, #32
	str	r1, [sp, #0]
	ldr	r0, =ArrayA	
push {r1, r2}
	mov.w r1, #6855
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6855
	mov.w r2, #1610612736 
push {r1, r2}
	mov.w r1, #3850
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3850
	mov.w r2, #1610612736 
	mov	r2, r3
	ldr	r1, =SumB	
	ldr	r0, =ArrayB	
push {r1, r2}
	mov.w r1, #4055
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4055
	mov.w r2, #1610612736 
	add	r1, r7, #8
	str	r1, [sp, #4]
	add	r1, r7, #24
	str	r1, [sp, #0]
	ldr	r0, =ArrayB	
push {r1, r2}
	mov.w r1, #8166
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8166
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r7, #40]	
	strd	r2, r3, [sp]
	mov	r2, r0
	mov	r3, r1
	ldr	r1, =ArrayB	
	ldr	r0, =ArrayA	
	bl	Calc_LinCorrCoef
	push {r1, r2}
	mov.w r1, #4305
	mov.w r2, #1610612736 
	adds	r3, #1
	str	r3, [r7, #60]	
lab8: 	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab9
	movs	r3, #0
	mov	r0, r3
	adds	r7, #64	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7852
	mov.w r2, #1610612736 
	nop
	.ltorg
InitSeed:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =Seed	
	movs	r2, #0
	str	r2, [r3, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
Calc_Sum_Mean:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r1, [r7, #8]
	mov	r2, #0
	mov	r3, #0
	strd	r2, r3, [r1]
	movs	r3, #0
	str	r3, [r7, #20]
	b	lab10
lab11: 	ldrd	r0, r1, [r3]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #2150
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2150
	mov.w r2, #1610612736 
	mov	r3, r1
	ldr	r1, [r7, #8]
	strd	r2, r3, [r1]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab10: 	ldr	r3, [r7, #20]
	cmp	r3, #99	
	ble	lab11
	ldr	r3, [r7, #8]
	ldrd	r0, r1, [r3]
	mov	r2, #0
	ldr	r3, =0x40590000	
push {r1, r2}
	mov.w r1, #6300
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6300
	mov.w r2, #1610612736 
	mov	r3, r1
	ldr	r1, [r7, #4]
	strd	r2, r3, [r1]
	nop
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #14
	mov.w r2, #1610612736 
	nop
	.ltorg
Square:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	strd	r0, r1, [r7]
	ldrd	r2, r3, [r7]
	ldrd	r0, r1, [r7]
push {r1, r2}
	mov.w r1, #623
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #623
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5276
	mov.w r2, #1610612736 
Calc_Var_Stddev:
	push	{r7, lr}
	sub	sp, #32
	add	r7, sp, #0
	str	r0, [r7, #12]
	strd	r2, r3, [r7]
	mov	r2, #0
	mov	r3, #0
	strd	r2, r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #28]
	b	lab12
lab13: 	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrd	r0, r1, [r3]
	ldrd	r2, r3, [r7]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #1936
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1936
	mov.w r2, #1610612736 
	mov	r3, r1
	ldrd	r0, r1, [r7, #16]
push {r1, r2}
	mov.w r1, #6638
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6638
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #16]
	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab12: 	ldr	r3, [r7, #28]
	cmp	r3, #99	
	ble	lab13
	mov	r2, #0
	ldr	r3, =0x40590000	
	ldrd	r0, r1, [r7, #16]
push {r1, r2}
	mov.w r1, #4419
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4419
	mov.w r2, #1610612736 
	mov	r3, r1
	ldr	r1, [r7, #40]	
	strd	r2, r3, [r1]
	ldr	r3, [r7, #40]	
	ldrd	r2, r3, [r3]
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #7168
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7168
	mov.w r2, #1610612736 
	mov	r3, r1
	ldr	r1, [r7, #44]	
	strd	r2, r3, [r1]
	nop
	adds	r7, #32
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #3194
	mov.w r2, #1610612736 
	nop
	.ltorg
Calc_LinCorrCoef:
	push	{r4, r5, r7, lr}
	sub	sp, #48	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	strd	r2, r3, [r7]
	mov	r2, #0
	mov	r3, #0
	strd	r2, r3, [r7, #32]
	mov	r2, #0
	mov	r3, #0
	strd	r2, r3, [r7, #16]
	ldrd	r2, r3, [r7, #16]
	strd	r2, r3, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #44]	
	b	lab14
lab15: 	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrd	r0, r1, [r3]
	ldrd	r2, r3, [r7]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	ldr	r3, [r7, #44]	
	lsls	r3, r3, #3
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrd	r0, r1, [r3]
	ldrd	r2, r3, [r7, #64]	
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #6134
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6134
	mov.w r2, #1610612736 
	mov	r3, r1
	ldrd	r0, r1, [r7, #32]
push {r1, r2}
	mov.w r1, #2149
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2149
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #32]
	ldr	r3, [r7, #44]	
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrd	r0, r1, [r3]
	ldrd	r2, r3, [r7]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #5130
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5130
	mov.w r2, #1610612736 
	mov	r3, r1
	ldrd	r0, r1, [r7, #24]
push {r1, r2}
	mov.w r1, #7210
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7210
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #24]
	ldr	r3, [r7, #44]	
	lsls	r3, r3, #3
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrd	r0, r1, [r3]
	ldrd	r2, r3, [r7, #64]	
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #5119
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5119
	mov.w r2, #1610612736 
	mov	r3, r1
	ldrd	r0, r1, [r7, #16]
push {r1, r2}
	mov.w r1, #1789
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1789
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r7, #16]
	ldr	r3, [r7, #44]	
	adds	r3, #1
	str	r3, [r7, #44]	
lab14: 	ldr	r3, [r7, #44]	
	cmp	r3, #99	
	ble	lab15
	ldrd	r0, r1, [r7, #24]
push {r1, r2}
	mov.w r1, #4625
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4625
	mov.w r2, #1610612736 
	mov	r5, r1
	ldrd	r0, r1, [r7, #16]
push {r1, r2}
	mov.w r1, #5054
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5054
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #4280
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4280
	mov.w r2, #1610612736 
	mov	r3, r1
	ldrd	r0, r1, [r7, #32]
push {r1, r2}
	mov.w r1, #4308
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4308
	mov.w r2, #1610612736 
	mov	r3, r1
	ldr	r1, =Coef	
	strd	r2, r3, [r1]
	nop
	adds	r7, #48	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5775
	mov.w r2, #1610612736 
	nop
	.ltorg
Initialize:
	stmdb	sp!, {r4, r5, r7, r8, r9, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r4, #0
	b	lab16
lab17: push {r1, r2}
	mov.w r1, #2775
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2775
	mov.w r2, #1610612736 
	mov	r9, r1
	bl	RandomInteger
	mov	r3, r0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #7533
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7533
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #302
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #302
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r3, r4
	lsls	r3, r3, #3
	ldr	r2, [r7, #4]
	adds	r5, r2, r3
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
push {r1, r2}
	mov.w r1, #1179
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1179
	mov.w r2, #1610612736 
	mov	r3, r1
	strd	r2, r3, [r5]
	adds	r4, #1
lab16: 	cmp	r4, #99	
	ble	lab17
	nop
	nop
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6968
	mov.w r2, #1610612736 
	nop
	.ltorg
RandomInteger:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =Seed	
	ldr	r2, [r3, #0]
	mov	r3, r2
	lsls	r3, r3, #5
	add	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	add	r2, r3, #81	
	ldr	r3, =0x103114c7	
	smull	r1, r3, r3, r2
	asrs	r1, r3, #9
	asrs	r3, r2, #31
	subs	r3, r1, r3
	movw	r1, #8095	
	mul	r3, r1, r3
	subs	r3, r2, r3
	ldr	r2, =Seed	
	str	r3, [r2, #0]
	ldr	r3, =Seed	
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
verify_benchmark:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp, lr}
	sub	sp, #32
	add	r7, sp, #0
	str	r0, [r7, #4]
	add	r3, pc, #180	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r7, #24]
	add	r3, pc, #176	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r7, #16]
	add	r3, pc, #176	
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r7, #8]
	ldr	r3, =SumA	
	ldrd	r2, r3, [r3]
	ldrd	r0, r1, [r7, #24]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	sl, r2
	bic	fp, r3, #2147483648	
	add	r3, pc, #148	
	ldrd	r2, r3, [r3]
	mov	r0, sl
	mov	r1, fp
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	lab18
	ldr	r3, =SumB	
	ldrd	r2, r3, [r3]
	ldrd	r0, r1, [r7, #16]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r8, r2
	bic	r9, r3, #2147483648	
	add	r3, pc, #104	
	ldrd	r2, r3, [r3]
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	lab18
	ldr	r3, =Coef	
	ldrd	r2, r3, [r3]
	ldrd	r0, r1, [r7, #8]
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	bic	r5, r3, #2147483648	
	add	r3, pc, #60	
	ldrd	r2, r3, [r3]
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	lab18
	movs	r3, #1
	b	lab19
lab18: 	movs	r3, #0
lab19: 	mov	r0, r3
	adds	r7, #32
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7190
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
	mov.w r1, #6008
	mov.w r2, #1610612736 
	bl	benchmark
	push {r1, r2}
	mov.w r1, #1618
	mov.w r2, #1610612736 
	str	r3, [r7, #8]
	bl	stop_trigger
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	verify_benchmark
	push {r1, r2}
	mov.w r1, #2010
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
	mov.w r1, #957
	mov.w r2, #1610612736 
sqrt:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	mov	r5, r1
	bl	__ieee754_sqrt
	push {r1, r2}
	mov.w r1, #1515
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r7, r1
	mov	r3, r5
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmpun
	cbnz	r0, lab20
	mov	r0, r4
	mov	r1, r5
	movs	r2, #0
	movs	r3, #0
	bl	__aeabi_dcmplt
	cbnz	r0, lab21
lab20: 	mov	r0, r6
	mov	r1, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4886
	mov.w r2, #1610612736 
lab21: 	bl	__errno
	movs	r2, #0
	movs	r3, #0
	movs	r1, #33	
	str	r1, [r0, #0]
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #3699
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3699
	mov.w r2, #1610612736 
	mov	r7, r1
	mov	r0, r6
	mov	r1, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7844
	mov.w r2, #1610612736 
	nop
__ieee754_sqrt:
	ldr	r2, =0x7ff00000	
	bics	r2, r1
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	mov	r4, r1
	beq	lab22
	cmp	r1, #0
	mov	r3, r1
	mov	ip, r0
	ble	lab23
	asrs	r1, r1, #20
	beq	lab24
lab41: 	lsls	r0, r1, #31
	subw	r7, r1, #1023	
	orr	r3, r3, #1048576	
	bmi	lab25
	lsls	r3, r3, #1
	add	r3, r3, ip, lsr #31
	mov	ip, ip, lsl #1
lab25: 	mov	r2, ip, lsr #31
	movs	r6, #0
	add	r3, r2, r3, lsl #1
	asrs	r7, r7, #1
	mov	ip, ip, lsl #1
	mov	lr, #22
	mov	r4, r6
	mov	r2, #2097152	
lab27: 	cmp	r1, r3
	bgt	lab26
	subs	r3, r3, r1
	adds	r4, r1, r2
	add	r6, r2
lab26: 	lsls	r3, r3, #1
	subs	lr, lr, #1
	add	r3, r3, ip, lsr #31
	mov	r2, r2, lsr #1
	mov	ip, ip, lsl #1
	bne	lab27
	mov	r5, lr
	movs	r0, #32
	mov	r2, #2147483648	
	b	lab28
lab31: lab33: 	subs	r0, #1
	add	r3, r1, r3, lsl #1
	mov	ip, ip, lsl #1
	mov	r2, r2, lsr #1
	beq	lab30
lab28: 	cmp	r3, r4
	add	r1, r2, lr
	ble	lab31
	cmp	r1, #0
	add	lr, r1, r2
	blt	lab32
lab34: lab35: 	cmp	r1, ip
	it	hi
	addhi	r3, r3, #4294967295	
lab42: 	add	r5, r2
	mov	r4, r8
	b	lab33
lab32: 	cmp	lr, #0
	blt	lab34
	add	r8, r4, #1
	b	lab35
lab23: 	bic	r2, r1, #2147483648	
	orrs	r2, r0
	beq	lab36
	cmp	r1, #0
	bne	lab37
lab38: 	subs	r1, #21
	mov	r3, r2
	mov	ip, ip, lsl #21
	cmp	r2, #0
	beq	lab38
	lsls	r6, r2, #11
	bmi	lab39
lab24: 	movs	r0, #0
lab40: 	lsls	r5, r3, #11
	mov	r4, r0
	add	r0, r0, #1
	bpl	lab40
	mov	r2, r3
	mov	r3, ip
	lsl	ip, ip, r0
	rsb	r0, r0, #32
lab45: 	subs	r1, r1, r4
	orrs	r3, r2
	b	lab41
lab29: 	cmp	r1, ip
	bhi	lab33
	cmp	r1, #0
	add	lr, r1, r2
	blt	lab32
	mov	r8, r3
	movs	r3, #0
	b	lab42
lab30: 	orrs	r3, r3, ip
	bne	lab43
	lsrs	r0, r5, #1
lab44: 	add	r3, r3, #1069547520	
	add	r3, r3, #2097152	
	lsls	r2, r6, #31
	it	mi
	orrmi	r0, r0, #2147483648	
	add	r9, r3, r7, lsl #20
	mov	r5, r0
	mov	r4, r9
lab36: 	mov	r0, r5
	mov	r1, r4
	cpsid f
	push {r1, r2}
	mov.w r1, #4234
	mov.w r2, #1610612736 
lab43: 	adds	r1, r5, #1
	itet	ne
	addne	r0, r5, #1
	addeq	r6, #1
	lsrne	r0, r0, #1
	b	lab44
lab22: 	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #1065
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1065
	mov.w r2, #1610612736 
	mov	r3, r4
push {r1, r2}
	mov.w r1, #1863
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1863
	mov.w r2, #1610612736 
	mov	r4, r1
	mov	r0, r5
	mov	r1, r4
	cpsid f
	push {r1, r2}
	mov.w r1, #5031
	mov.w r2, #1610612736 
lab37: 	mov	r2, r0
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #1962
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1962
	mov.w r2, #1610612736 
	mov	r4, r1
	b	lab36
lab39: 	mov	r3, ip
	movs	r0, #32
	mov	r4, #4294967295	
	b	lab45
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
	beq	lab46
	mov	r4, r4, lsr #21
	rsbs	r5, r4, r5, lsr #21
	it	lt
	neglt	r5, r5
	ble	lab47
	add	r4, r5
	eor	r2, r0, r2
	eor	r3, r1, r3
	eor	r0, r2, r0
	eor	r1, r3, r1
	eor	r2, r0, r2
	eor	r3, r1, r3
lab47: 	cmp	r5, #54	
	it	hi
	cpsid f
	push {r1, r2}
	mov.w r1, #6337
	mov.w r2, #1610612736 
	tst	r1, #2147483648	
	mov	r1, r1, lsl #12
	mov	ip, #1048576	
	orr	r1, ip, r1, lsr #12
	beq	lab48
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab48: 	tst	r3, #2147483648	
	mov	r3, r3, lsl #12
	orr	r3, ip, r3, lsr #12
	beq	lab49
	negs	r2, r2
	sbc	r3, r3, r3, lsl #1
lab49: 	teq	r4, r5
	beq	lab50
lab62: 	rsbs	lr, r5, #32
	blt	lab51
	lsl	ip, r2, lr
	lsr	r2, r2, r5
	adds	r0, r0, r2
	adc	r1, r1, #0
	lsl	r2, r3, lr
	adds	r0, r0, r2
	asr	r3, r3, r5
	adcs	r1, r3
	b	lab52
lab51: 	sub	r5, r5, #32
	add	lr, lr, #32
	cmp	r2, #1
	lsl	ip, r3, lr
	it	cs
	orrcs	ip, ip, #2
	asr	r3, r3, r5
	adds	r0, r0, r3
	adcs	r1, r1, r3, asr #31
lab52: 	and	r5, r1, #2147483648	
	bpl	lab53
	mov	lr, #0
	rsbs	ip, ip, #0
	sbcs	r0, lr, r0
	sbc	r1, lr, r1
lab53: 	cmp	r1, #1048576	
	bcc	lab54
	cmp	r1, #2097152	
	bcc	lab55
	lsrs	r1, r1, #1
	movs	r0, r0, rrx
	mov	ip, ip, rrx
	add	r4, r4, #1
	mov	r2, r4, lsl #21
	cmn	r2, #4194304	
	bcs	lab56
lab55: 	cmp	ip, #2147483648	
	it	eq
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	orr	r1, r1, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #2534
	mov.w r2, #1610612736 
lab54: 	movs	ip, ip, lsl #1
	adcs	r0, r0
	adc	r1, r1, r1
	subs	r4, #1
	it	cs
	cmpcs	r1, #1048576	
	bcs	lab55
lab66: 	itt	eq
	moveq	r1, r0
	moveq	r0, #0
	clz	r3, r1
	it	eq
	addeq	r3, #32
	sub	r3, r3, #11
	subs	r2, r3, #32
	bge	lab57
	adds	r2, #12
	ble	lab58
	add	ip, r2, #20
	rsb	r2, r2, #12
	lsl	r0, r1, ip
	lsr	r1, r1, r2
	b	lab59
lab58: 	add	r2, r2, #20
lab57: 	it	le
	rsble	ip, r2, #32
	lsl	r1, r1, r2
	lsr	ip, r0, ip
	itt	le
	orrle	r1, r1, ip
	lslle	r0, r2
lab59: 	subs	r4, r4, r3
	ittt	ge
	addge	r1, r1, r4, lsl #20
	orrge	r1, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #1893
	mov.w r2, #1610612736 
	mvn	r4, r4
	subs	r4, #31
	bge	lab60
	adds	r4, #12
	bgt	lab61
	add	r4, r4, #20
	rsb	r2, r4, #32
	lsr	r0, r0, r4
	lsl	r3, r1, r2
	orr	r0, r0, r3
	lsr	r3, r1, r4
	orr	r1, r5, r3
	pop	{r4, r5, pc}
lab61: 	rsb	r4, r4, #12
	rsb	r2, r4, #32
	lsr	r0, r0, r2
	lsl	r3, r1, r4
	orr	r0, r0, r3
	mov	r1, r5
	pop	{r4, r5, pc}
lab60: 	lsr	r0, r1, r4
	mov	r1, r5
	pop	{r4, r5, pc}
lab50: 	teq	r4, #0
	eor	r3, r3, #1048576	
	itte	eq
	eoreq	r1, r1, #1048576	
	addeq	r4, #1
	subne	r5, #1
	b	lab62
lab46: 	mvns	ip, r4, asr #21
	it	ne
	mvnsne	ip, r5, asr #21
	beq	lab63
	teq	r4, r5
	it	eq
	teqeq	r0, r2
	beq	lab64
	orrs	ip, r4, r0
	itt	eq
	moveq	r1, r3
	moveq	r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #7183
	mov.w r2, #1610612736 
lab64: 	teq	r1, r3
	ittt	ne
	movne	r1, #0
	movne	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #4186
	mov.w r2, #1610612736 
	movs	ip, r4, lsr #21
	bne	lab65
	lsls	r0, r0, #1
	adcs	r1, r1
	it	cs
	orrcs	r1, r1, #2147483648	
	cpsid f
	push {r1, r2}
	mov.w r1, #4676
	mov.w r2, #1610612736 
lab65: 	adds	r4, r4, #4194304	
	itt	cc
	addcc	r1, r1, #1048576	
	cpsid f
	push {r1, r2}
	mov.w r1, #111
	mov.w r2, #1610612736 
	and	r5, r1, #2147483648	
lab56: 	orr	r1, r5, #2130706432	
	orr	r1, r1, #15728640	
	mov	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #7087
	mov.w r2, #1610612736 
lab63: 	mvns	ip, r4, asr #21
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
	mov.w r1, #286
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
	b	lab66
	nop
__aeabi_i2d:
	teq	r0, #0
	itt	eq
	moveq	r1, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #356
	mov.w r2, #1610612736 
	push	{r4, r5, lr}
	mov	r4, #1024	
	add	r4, r4, #50	
	ands	r5, r0, #2147483648	
	it	mi
	negmi	r0, r0
	mov	r1, #0
	b	lab66
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
	b	lab66
	nop
__aeabi_ul2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	mov	r5, #0
	b	lab67
__aeabi_l2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	ands	r5, r1, #2147483648	
	bpl	lab67
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab67: 	mov	r4, #1024	
	add	r4, r4, #50	
	movs	ip, r1, lsr #22
	beq	lab53
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
	b	lab53
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
	bleq	8df0 <__aeabi_dmul+0x1dc>
	add	r4, r5
	eor	r6, r1, r3
	bic	r1, r1, ip, lsl #21
	bic	r3, r3, ip, lsl #21
	orrs	r5, r0, r1, lsl #12
	it	ne
	orrsne	r5, r2, r3, lsl #12
	orr	r1, r1, #1048576	
	orr	r3, r3, #1048576	
	beq	lab68
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
	bcs	lab69
	movs	lr, lr, lsl #1
	adcs	r5, r5
	adc	r6, r6, r6
lab69: 	orr	r1, r2, r6, lsl #11
	orr	r1, r1, r5, lsr #21
	mov	r0, r5, lsl #11
	orr	r0, r0, lr, lsr #21
	mov	lr, lr, lsl #11
	subs	ip, r4, #253	
	it	hi
	cmphi	ip, #1792	
	bhi	lab70
	cmp	lr, #2147483648	
	it	eq
	movseq	lr, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #486
	mov.w r2, #1610612736 
lab68: 	and	r6, r6, #2147483648	
	orr	r1, r6, r1
	orr	r0, r0, r2
	eor	r1, r1, r3
	subs	r4, r4, ip, lsr #1
	ittt	gt
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #5000
	mov.w r2, #1610612736 
	orr	r1, r1, #1048576	
	mov	lr, #0
	subs	r4, #1
lab70: 	bgt	lab71
	cmn	r4, #54	
	ittt	le
	movle	r0, #0
	andle	r1, r1, #2147483648	
	cpsid f
	push {r1, r2}
	mov.w r1, #4135
	mov.w r2, #1610612736 
	rsb	r4, r4, #0
	subs	r4, #32
	bge	lab72
	adds	r4, #12
	bgt	lab73
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
lab73: 	rsb	r4, r4, #12
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
lab72: 	rsb	r5, r4, #32
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
lab78: 	bne	lab74
	and	r6, r1, #2147483648	
lab75: 	adc	r1, r1, r1
	tst	r1, #1048576	
	it	eq
	subeq	r4, #1
	beq	lab75
	orr	r1, r1, r6
	teq	r5, #0
	it	ne
	bxne	lr
lab74: 	and	r6, r3, #2147483648	
lab76: 	adc	r3, r3, r3
	tst	r3, #1048576	
	it	eq
	subeq	r5, #1
	beq	lab76
	orr	r3, r3, r6
	bx	lr
	teq	r4, ip
	and	r5, ip, r3, lsr #20
	it	ne
	teqne	r5, ip
	beq	lab77
	orrs	r6, r0, r1, lsl #1
	it	ne
	orrsne	r6, r2, r3, lsl #1
	bne	lab78
lab89: 	and	r1, r1, #2147483648	
	mov	r0, #0
	pop	{r4, r5, r6, pc}
lab77: 	orrs	r6, r0, r1, lsl #1
	itte	eq
	moveq	r0, r2
	moveq	r1, r3
	orrsne	r6, r2, r3, lsl #1
	beq	lab79
	teq	r4, ip
	bne	lab80
	orrs	r6, r0, r1, lsl #12
	bne	lab79
lab80: 	teq	r5, ip
	bne	lab81
	orrs	r6, r2, r3, lsl #12
	itt	ne
	movne	r0, r2
	movne	r1, r3
	bne	lab79
lab81: 	eor	r1, r1, r3
lab71: 	and	r1, r1, #2147483648	
	orr	r1, r1, #2130706432	
	orr	r1, r1, #15728640	
	mov	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #3938
	mov.w r2, #1610612736 
lab79: 	orr	r1, r1, #2130706432	
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
	bleq	8fd6 <__aeabi_ddiv+0x16e>
	sub	r4, r4, r5
	eor	lr, r1, r3
	orrs	r5, r2, r3, lsl #12
	mov	r1, r1, lsl #12
	beq	lab82
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
	bcs	lab83
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
lab83: 	subs	r6, r6, r2
	sbc	r5, r5, r3
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
	mov	r0, #1048576	
	mov	ip, #524288	
lab85: 	sbcs	lr, r5, r3
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
	beq	lab84
	mov	r5, r5, lsl #4
	orr	r5, r5, r6, lsr #28
	mov	r6, r6, lsl #4
	mov	r3, r3, lsl #3
	orr	r3, r3, r2, lsr #29
	mov	r2, r2, lsl #3
	movs	ip, ip, lsr #4
	bne	lab85
	tst	r1, #1048576	
	bne	lab86
	orr	r1, r1, r0
	mov	r0, #0
	mov	ip, #2147483648	
	b	lab85
lab84: 	tst	r1, #1048576	
	itt	eq
	orreq	r1, r0
	moveq	r0, #0
lab86: 	subs	ip, r4, #253	
	it	hi
	cmphi	ip, #1792	
	bhi	lab70
	subs	ip, r5, r3
	itt	eq
	subseq	ip, r6, r2
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #2034
	mov.w r2, #1610612736 
lab82: 	and	lr, lr, #2147483648	
	orr	r1, lr, r1, lsr #12
	adds	r4, r4, ip, lsr #1
	ittt	gt
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #4624
	mov.w r2, #1610612736 
	orr	r1, r1, #1048576	
	mov	lr, #0
	subs	r4, #1
	b	lab70
	orr	lr, r5, r6
	b	lab70
	and	r5, ip, r3, lsr #20
	teq	r4, ip
	it	eq
	teqeq	r5, ip
	beq	lab79
	teq	r4, ip
	bne	lab87
	orrs	r4, r0, r1, lsl #12
	bne	lab79
	teq	r5, ip
	bne	lab81
	mov	r0, r2
	mov	r1, r3
	b	lab79
lab87: 	teq	r5, ip
	bne	lab88
	orrs	r5, r2, r3, lsl #12
	beq	lab89
	mov	r0, r2
	mov	r1, r3
	b	lab79
lab88: 	orrs	r6, r0, r1, lsl #1
	it	ne
	orrsne	r6, r2, r3, lsl #1
	bne	lab78
	orrs	r4, r0, r1, lsl #1
	bne	lab81
	orrs	r5, r2, r3, lsl #1
	bne	lab89
	b	lab79
__gedf2:
	mov	ip, #4294967295	
	b	lab90
	nop
__ledf2:
	mov	ip, #1
	b	lab90
	nop
__cmpdf2:
	mov	ip, #1
lab90: 	str	ip, [sp, #-4]!
	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	mov	ip, r3, lsl #1
	it	ne
	mvnsne	ip, ip, asr #21
	beq	lab91
lab94: 	orrs	ip, r0, r1, lsl #1
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
lab91: 	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	bne	lab92
	orrs	ip, r0, r1, lsl #12
	bne	lab93
lab92: 	mov	ip, r3, lsl #1
	mvns	ip, ip, asr #21
	bne	lab94
	orrs	ip, r2, r3, lsl #12
	beq	lab94
lab93: 	ldr	r0, [sp], #4
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
	mov.w r1, #7017
	mov.w r2, #1610612736 
__aeabi_dcmpeq:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #6284
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6284
	mov.w r2, #1610612736 
	moveq	r0, #1
	movne	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmplt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #6575
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6575
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmple:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #2729
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2729
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpge:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #5694
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5694
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpgt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #4428
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4428
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpun:
	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	bne	lab95
	orrs	ip, r0, r1, lsl #12
	bne	lab96
lab95: 	mov	ip, r3, lsl #1
	mvns	ip, ip, asr #21
	bne	lab97
	orrs	ip, r2, r3, lsl #12
	bne	lab96
lab97: 	mov	r0, #0
	bx	lr
lab96: 	mov	r0, #1
	bx	lr
__errno:
	ldr	r3, =_impure_ptr	
	ldr	r0, [r3, #0]
	bx	lr
	nop
	.ltorg
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x0001941c	
	ldr	r5, =0x0001941c	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab98
	movs	r4, #0
lab99: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #591
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #591
	mov.w r2, #1610612736 
lab98: 	ldr	r6, =0x00019424	
	ldr	r5, =0x0001941c	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab100
	movs	r4, #0
lab101: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #2916
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #2916
	mov.w r2, #1610612736 
lab100:	cpsid f
	push {r1, r2}
	mov.w r1, #1005
	mov.w r2, #1610612736 
	.ltorg
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab102
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab103
	uxtb	r2, r1
	mov	r3, r0
	b	lab104
lab105: 	bcc	lab103
lab104: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab105
lab113: 	bls	lab106
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab107
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab108: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab108
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab109
lab114: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab110: 	cmp	r3, r2
	bne	lab110
	and	r4, ip, #3
lab106: 	cbz	r4, lab103
lab112: 	add	r4, r3
lab111: 	cmp	r4, r3
	bne	lab111
lab103:	cpsid f
	push {r1, r2}
	mov.w r1, #10
	mov.w r2, #1610612736 
lab109: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab112
	b	lab103
lab102: 	mov	r3, r0
	mov	r4, r2
	b	lab113
lab107: 	mov	r2, r3
	mov	ip, r4
	b	lab114
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
	cbz	r6, lab115
	mov	r9, #1
	mov	sl, #0
lab121: 	subs	r5, r4, #1
	bmi	lab115
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab117: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab116
lab118: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab117
lab115: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab116: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab118
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab119
	blx	r2
lab124: 	cmp	r2, fp
	bne	lab120
lab123: 	cmp	r3, r6
	beq	lab118
	mov	r6, r3
	cmp	r6, #0
	bne	lab121
	b	lab115
lab119: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab122
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab123
lab120: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab121
	b	lab115
lab122: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab124
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =_impure_ptr	
	ldr	r5, =0x00019424	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab125
	subs	r3, #4
	add	r5, r3
lab126: 	ldr	r3, [r5], #-4
	
	push {r1, r2}
	mov.w r1, #1546
	mov.w r2, #1610612736 
	cmp	r4, #0
	push {r1, r2}
	mov.w r1, #1546
	mov.w r2, #1610612736 
lab125: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab127
lab131: 	cmp	r5, #31
	bgt	lab128
	cbnz	r6, lab129
lab130: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab132:	cpsid f
	push {r1, r2}
	mov.w r1, #6312
	mov.w r2, #1610612736 
lab129: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab130
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab130
lab127: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab131
lab128: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab132
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
	.word	0x00019430


	.data

_impure_ptr:
	.word	0x00019430
	.word	0x00000000
impure_data:
	.word	0x00000000
	.word	0x0001971c
	.word	0x00019784
	.word	0x000197ec
	.word	0x00000001
	.word	0x00000000
	.word	0xabcd330e
	.word	0xe66d1234
	.word	0x0005deec
	.word	0x0000000b
__atexit_recursive_mutex:
	.word	0x00019ee0


	.bss

completed.1:
	.word	0x00000000
object.0:
Seed:
ArrayA:
ArrayB:
SumA:
SumB:
Coef:
__lock___atexit_recursive_mutex:
	.word	0x00000000
