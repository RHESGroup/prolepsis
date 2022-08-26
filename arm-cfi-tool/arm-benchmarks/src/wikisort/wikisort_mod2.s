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
	mov.w r1, #2782
	mov.w r2, #1610612736 
	cbz	r3, lab1
	ldr	r0, =0x0000c4fd	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	mov.w r1, #5815
	mov.w r2, #1610612736 
	ldr	r4, =__bss_start	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x0000d280	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	mov.w r1, #190
	mov.w r2, #1610612736 
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x0000d280	
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
	ldr	r2, =0x0001e374	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	mov.w r1, #5506
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
	ldr	r0, =0x0000c4f1	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x0000c4fd	
push {r1, r2}
	mov.w r1, #6072
	mov.w r2, #1610612736 
lab7:	push {r1, r2}
	mov.w r1, #6072
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #8040
	mov.w r2, #1610612736 
	movs	r1, r5
	bl	main
	push {r1, r2}
	mov.w r1, #4122
	mov.w r2, #1610612736 
	nop
	.ltorg
Min:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #0]
	cmp	r2, r3
	bge	lab8
	ldr	r3, [r7, #4]
	b	lab9
lab8: 	ldr	r3, [r7, #0]
lab9: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
TestCompare:
	push	{r4, r7}
	sub	sp, #16
	add	r7, sp, #0
	add	r4, r7, #8
	stmia	r4, {r0, r1}
	mov	r1, r7
	stmia	r1, {r2, r3}
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #0]
	cmp	r2, r3
	ite	lt
	movlt	r3, #1
	movge	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r4, r7}
	bx	lr
Range_length:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r7
	stmia	r3, {r0, r1}
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #0]
	subs	r3, r2, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
MakeRange:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #8]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	mov	r2, r3
	add	r3, r7, #16
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	ldr	r0, [r7, #12]
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
FloorPowerOfTwo:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	asrs	r3, r3, #1
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	asrs	r3, r3, #2
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	asrs	r3, r3, #4
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	asrs	r3, r3, #8
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	asrs	r3, r3, #16
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	asrs	r3, r3, #1
	ldr	r2, [r7, #12]
	subs	r3, r2, r3
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
BinaryFirst:
	push	{r4, r7, lr}
	sub	sp, #36	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r1, r7
	stmia	r1, {r2, r3}
	ldr	r3, [r7, #0]
	str	r3, [r7, #28]
	ldr	r3, [r7, #4]
	subs	r3, #1
	str	r3, [r7, #24]
	b	lab10
lab12: 	ldr	r3, [r7, #28]
	subs	r3, r2, r3
	lsrs	r2, r3, #31
	add	r3, r2
	asrs	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #28]
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r1, r2, r3
	ldr	r3, [r7, #8]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	ldr	r4, [r7, #48]	
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab11
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #28]
	b	lab10
lab11: 	ldr	r3, [r7, #20]
	str	r3, [r7, #24]
lab10: 	ldr	r2, [r7, #28]
	ldr	r3, [r7, #24]
	cmp	r2, r3
	blt	lab12
	ldr	r3, [r7, #4]
	subs	r3, #1
	ldr	r2, [r7, #28]
	cmp	r2, r3
	bne	lab13
	ldr	r3, [r7, #28]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r1, r2, r3
	ldr	r3, [r7, #8]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	ldr	r4, [r7, #48]	
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab13
	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab13: 	ldr	r3, [r7, #28]
	mov	r0, r3
	adds	r7, #36	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1346
	mov.w r2, #1610612736 
BinaryLast:
	push	{r4, r7, lr}
	sub	sp, #36	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r1, r7
	stmia	r1, {r2, r3}
	ldr	r3, [r7, #0]
	str	r3, [r7, #28]
	ldr	r3, [r7, #4]
	subs	r3, #1
	str	r3, [r7, #24]
	b	lab14
lab16: 	ldr	r3, [r7, #28]
	subs	r3, r2, r3
	lsrs	r2, r3, #31
	add	r3, r2
	asrs	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #28]
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r1, r2, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	ldr	r4, [r7, #48]	
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab15
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #28]
	b	lab14
lab15: 	ldr	r3, [r7, #20]
	str	r3, [r7, #24]
lab14: 	ldr	r2, [r7, #28]
	ldr	r3, [r7, #24]
	cmp	r2, r3
	blt	lab16
	ldr	r3, [r7, #4]
	subs	r3, #1
	ldr	r2, [r7, #28]
	cmp	r2, r3
	bne	lab17
	ldr	r3, [r7, #8]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r1, r2, r3
	ldr	r3, [r7, #28]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	ldr	r4, [r7, #48]	
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab17
	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab17: 	ldr	r3, [r7, #28]
	mov	r0, r3
	adds	r7, #36	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2461
	mov.w r2, #1610612736 
InsertionSort:
	push	{r4, r7, lr}
	sub	sp, #36	
	add	r7, sp, #0
	str	r0, [r7, #12]
	adds	r0, r7, #4
	stmia	r0, {r1, r2}
	str	r3, [r7, #0]
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #28]
	b	lab18
lab22: 	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r2, r3
	add	r3, r7, #16
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #28]
	str	r3, [r7, #24]
	b	lab19
lab21: 	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r1, r2, r3
	ldr	r3, [r7, #24]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	mov	r2, r1
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #24]
	subs	r3, #1
	str	r3, [r7, #24]
lab19: 	ldr	r3, [r7, #4]
	ldr	r2, [r7, #24]
	cmp	r2, r3
	ble	lab20
	ldr	r3, [r7, #24]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	ldr	r4, [r7, #0]
	ldmia	r3, {r2, r3}
	add	r1, r7, #16
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab21
lab20: 	ldr	r3, [r7, #24]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	mov	r2, r3
	add	r3, r7, #16
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab18: 	ldr	r3, [r7, #8]
	ldr	r2, [r7, #28]
	cmp	r2, r3
	blt	lab22
	nop
	nop
	adds	r7, #36	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2843
	mov.w r2, #1610612736 
Reverse:
	push	{r7, lr}
	sub	sp, #40	
	add	r7, sp, #0
	str	r0, [r7, #12]
	adds	r3, r7, #4
	stmia	r3, {r1, r2}
	adds	r3, r7, #4
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	lsrs	r2, r3, #31
	add	r3, r2
	asrs	r3, r3, #1
	subs	r3, #1
	str	r3, [r7, #36]	
	b	lab23
lab24: 	ldr	r3, [r7, #36]	
	add	r3, r2
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #32]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #36]	
	subs	r3, r2, r3
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #28]
	ldr	r2, [r7, #32]
	add	r3, r7, #20
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #28]
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #28]
	mov	r2, r3
	add	r3, r7, #20
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	ldr	r3, [r7, #36]	
	subs	r3, #1
	str	r3, [r7, #36]	
lab23: 	ldr	r3, [r7, #36]	
	cmp	r3, #0
	bge	lab24
	nop
	nop
	adds	r7, #40	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #6462
	mov.w r2, #1610612736 
BlockSwap:
	push	{r7}
	sub	sp, #44	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #36]	
	b	lab25
lab26: 	ldr	r3, [r7, #36]	
	add	r3, r2
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #32]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #36]	
	add	r3, r2
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #28]
	ldr	r2, [r7, #32]
	add	r3, r7, #20
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #28]
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #28]
	mov	r2, r3
	add	r3, r7, #20
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	ldr	r3, [r7, #36]	
	adds	r3, #1
	str	r3, [r7, #36]	
lab25: 	ldr	r2, [r7, #36]	
	ldr	r3, [r7, #0]
	cmp	r2, r3
	blt	lab26
	nop
	nop
	adds	r7, #44	
	mov	sp, r7
	pop	{r7}
	bx	lr
Rotate:
	push	{r4, r5, r7, lr}
	sub	sp, #40	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r1, r7
	stmia	r1, {r2, r3}
	mov	r3, r7
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	beq	lab27
	ldr	r3, [r7, #8]
	cmp	r3, #0
	blt	lab28
	ldr	r3, [r7, #0]
	ldr	r2, [r7, #8]
	add	r3, r2
	str	r3, [r7, #36]	
	b	lab29
lab28: 	ldr	r3, [r7, #4]
	ldr	r2, [r7, #8]
	add	r3, r2
	str	r3, [r7, #36]	
lab29: 	ldr	r1, [r7, #0]
	add	r3, r7, #28
	ldr	r2, [r7, #36]	
	mov	r0, r3
	bl	MakeRange
	ldr	r2, [r7, #4]
	add	r3, r7, #20
	ldr	r1, [r7, #36]	
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #28
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r4, r0
	add	r3, r7, #20
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r4, r3
	bgt	lab30
	add	r3, r7, #28
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	ldr	r3, [r7, #60]	
	cmp	r3, r2
	blt	lab31
	ldr	r3, [r7, #28]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r4, r2, r3
	add	r3, r7, #28
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	lsls	r3, r3, #3
	mov	r2, r3
	mov	r1, r4
	ldr	r0, [r7, #56]	
	bl	memcpy
	ldr	r3, [r7, #28]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r4, r2, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r5, r2, r3
	add	r3, r7, #20
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	lsls	r3, r3, #3
	mov	r2, r3
	mov	r1, r5
	mov	r0, r4
push {r1, r2}
	mov.w r1, #2246
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2246
	mov.w r2, #1610612736 
	add	r3, r7, #20
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	add	r3, r4
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r4, r2, r3
	add	r3, r7, #28
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	lsls	r3, r3, #3
	mov	r2, r3
	ldr	r1, [r7, #56]	
	mov	r0, r4
	bl	memcpy
	b	lab32
lab30: 	add	r3, r7, #20
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	ldr	r3, [r7, #60]	
	cmp	r3, r2
	blt	lab31
	ldr	r3, [r7, #20]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r4, r2, r3
	add	r3, r7, #20
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	lsls	r3, r3, #3
	mov	r2, r3
	mov	r1, r4
	ldr	r0, [r7, #56]	
	bl	memcpy
	ldr	r4, [r7, #24]
	add	r3, r7, #28
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	subs	r3, r4, r3
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r4, r2, r3
	ldr	r3, [r7, #28]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r5, r2, r3
	add	r3, r7, #28
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	lsls	r3, r3, #3
	mov	r2, r3
	mov	r1, r5
	mov	r0, r4
push {r1, r2}
	mov.w r1, #6086
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6086
	mov.w r2, #1610612736 
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r4, r2, r3
	add	r3, r7, #20
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	lsls	r3, r3, #3
	mov	r2, r3
	ldr	r1, [r7, #56]	
	mov	r0, r4
	bl	memcpy
	b	lab32
lab31: 	add	r3, r7, #28
	ldmia	r3, {r1, r2}
	ldr	r0, [r7, #12]
push {r1, r2}
	mov.w r1, #4407
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4407
	mov.w r2, #1610612736 
	ldmia	r3, {r1, r2}
	ldr	r0, [r7, #12]
push {r1, r2}
	mov.w r1, #7515
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7515
	mov.w r2, #1610612736 
	ldmia	r3, {r1, r2}
	ldr	r0, [r7, #12]
push {r1, r2}
	mov.w r1, #4588
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4588
	mov.w r2, #1610612736 
lab27: 	nop
lab32: 	adds	r7, #40	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #3871
	mov.w r2, #1610612736 
WikiMerge:
	sub	sp, #8
	push	{r4, r5, r7, lr}
	sub	sp, #80	
	add	r7, sp, #0
	str	r0, [r7, #12]
	adds	r0, r7, #4
	stmia	r0, {r1, r2}
	str	r3, [r7, #100]	
	add	r3, r7, #100	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	ldr	r3, [r7, #124]	
	cmp	r3, r2
	blt	lab33
	ldr	r3, [r7, #120]	
	str	r3, [r7, #76]	
	ldr	r3, [r7, #108]	
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #72]	
	ldr	r3, [r7, #100]	
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #68]	
	add	r3, r7, #100	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	lsls	r3, r3, #3
	ldr	r2, [r7, #120]	
	add	r3, r2
	str	r3, [r7, #36]	
	ldr	r3, [r7, #112]	
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #32]
	add	r3, r7, #108	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	ble	lab34
	add	r3, r7, #100	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	ble	lab34
lab36: 	ldr	r1, [r7, #72]	
	ldr	r4, [r7, #116]	
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab35
	ldr	r3, [r7, #68]	
	ldr	r2, [r7, #76]	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #76]	
	adds	r3, #8
	str	r3, [r7, #76]	
	ldr	r3, [r7, #68]	
	adds	r3, #8
	str	r3, [r7, #68]	
	ldr	r2, [r7, #76]	
	ldr	r3, [r7, #36]	
	cmp	r2, r3
	bne	lab36
	b	lab34
lab35: 	ldr	r3, [r7, #68]	
	ldr	r2, [r7, #72]	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #72]	
	adds	r3, #8
	str	r3, [r7, #72]	
	ldr	r3, [r7, #68]	
	adds	r3, #8
	str	r3, [r7, #68]	
	ldr	r2, [r7, #72]	
	ldr	r3, [r7, #32]
	cmp	r2, r3
	beq	lab37
	b	lab36
lab37: 	nop
lab34: 	ldr	r2, [r7, #36]	
	ldr	r3, [r7, #76]	
	subs	r3, r2, r3
	mov	r2, r3
	ldr	r1, [r7, #76]	
	ldr	r0, [r7, #68]	
	bl	memcpy
	b	lab38
lab33: 	movs	r3, #0
	str	r3, [r7, #64]	
	movs	r3, #0
	str	r3, [r7, #60]	
	movs	r3, #0
	str	r3, [r7, #56]	
	add	r3, r7, #108	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	ble	lab39
	add	r3, r7, #100	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	ble	lab39
lab41: 	ldr	r3, [r7, #60]	
	add	r3, r2
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	adds	r1, r2, r3
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #64]	
	add	r3, r2
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	ldr	r4, [r7, #116]	
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab40
	ldr	r2, [r7, #100]	
	ldr	r3, [r7, #56]	
	add	r3, r2
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #44]	
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #64]	
	add	r3, r2
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #40]	
	ldr	r2, [r7, #44]	
	add	r3, r7, #24
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #44]	
	ldr	r2, [r7, #40]	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #40]	
	mov	r2, r3
	add	r3, r7, #24
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	ldr	r3, [r7, #64]	
	adds	r3, #1
	str	r3, [r7, #64]	
	ldr	r3, [r7, #56]	
	adds	r3, #1
	str	r3, [r7, #56]	
	add	r3, r7, #100	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	ldr	r3, [r7, #64]	
	cmp	r3, r2
	blt	lab41
	b	lab39
lab40: 	ldr	r2, [r7, #100]	
	ldr	r3, [r7, #56]	
	add	r3, r2
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #52]	
	ldr	r2, [r7, #108]	
	ldr	r3, [r7, #60]	
	add	r3, r2
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	str	r3, [r7, #48]	
	ldr	r2, [r7, #52]	
	add	r3, r7, #16
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #52]	
	ldr	r2, [r7, #48]	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #48]	
	mov	r2, r3
	add	r3, r7, #16
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	ldr	r3, [r7, #60]	
	adds	r3, #1
	str	r3, [r7, #60]	
	ldr	r3, [r7, #56]	
	adds	r3, #1
	str	r3, [r7, #56]	
	add	r3, r7, #108	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	ldr	r3, [r7, #60]	
	cmp	r3, r2
	bge	lab42
	b	lab41
lab42: 	nop
lab39: 	ldr	r2, [r7, #4]
	ldr	r3, [r7, #64]	
	adds	r4, r2, r3
	ldr	r2, [r7, #100]	
	ldr	r3, [r7, #56]	
	adds	r5, r2, r3
	add	r3, r7, #100	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	ldr	r3, [r7, #64]	
	subs	r3, r2, r3
	mov	r2, r5
	mov	r1, r4
	ldr	r0, [r7, #12]
	bl	BlockSwap
lab38: 	nop
	adds	r7, #80	
	mov	sp, r7
	ldmia	sp!, {r4, r5, r7, lr}
	add	sp, #8
	cpsid f
	push {r1, r2}
	mov.w r1, #3119
	mov.w r2, #1610612736 
WikiSort:
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #4480	
	sub	sp, #28
	add	r7, sp, #24
	add	r3, r7, #384	
	sub	r3, r3, #364	
	str	r0, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #368	
	str	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #372	
	str	r2, [r3, #0]
	mov	r3, #512	
	add	r2, r7, #4416	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #368	
	ldr	r3, [r3, #0]
	cmp	r3, #32
	bgt	lab43
	add	r0, r7, #4256	
	add	r0, r0, #8
	add	r3, r7, #384	
	sub	r3, r3, #368	
	ldr	r2, [r3, #0]
	movs	r1, #0
	bl	MakeRange
	add	r3, r7, #384	
	sub	r3, r3, #372	
	add	r2, r7, #384	
	sub	r0, r2, #364	
	ldr	r3, [r3, #0]
	add	r2, r7, #4256	
	add	r2, r2, #8
	ldmia	r2, {r1, r2}
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #1913
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1913
	mov.w r2, #1610612736 
lab43: 	add	r3, r7, #384	
	sub	r3, r3, #368	
	ldr	r0, [r3, #0]
	bl	FloorPowerOfTwo
	add	r3, r7, #4416	
	add	r3, r3, #16
	str	r0, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bge	lab45
	adds	r3, #15
lab45: 	asrs	r3, r3, #4
	add	r2, r7, #4416	
	add	r2, r2, #12
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #368	
	ldr	r3, [r3, #0]
	add	r2, r7, #4416	
	add	r2, r2, #12
	ldr	r2, [r2, #0]
	sdiv	r2, r3, r2
	add	r1, r7, #4416	
	add	r1, r1, #12
	ldr	r1, [r1, #0]
	mul	r2, r1, r2
	subs	r3, r3, r2
	add	r2, r7, #4448	
	add	r2, r2, #12
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #368	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	sdiv	r3, r2, r3
	add	r2, r7, #4448	
	add	r2, r2, #8
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #4448	
	add	r2, r2, #16
	str	r3, [r2, #0]
	movs	r3, #0
	add	r2, r7, #4448	
	add	r2, r2, #20
	str	r3, [r2, #0]
	b	lab46
lab48: 	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r2, r7, #4384	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #16
	ldr	r2, [r3, #0]
	add	r3, r7, #4448	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #4448	
	add	r2, r2, #16
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #4448	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #4448	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab47
	add	r3, r7, #4448	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	subs	r3, r2, r3
	add	r2, r7, #4448	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #16
	str	r3, [r2, #0]
lab47: 	add	r3, r7, #4448	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r2, r7, #4384	
	add	r2, r2, #12
	str	r3, [r2, #0]
	add	r3, r7, #4256	
	add	r3, r3, #16
	add	r2, r7, #4384	
	add	r2, r2, #12
	ldr	r2, [r2, #0]
	add	r1, r7, #4384	
	add	r1, r1, #20
	ldr	r1, [r1, #0]
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r3, r3, #372	
	add	r2, r7, #384	
	sub	r0, r2, #364	
	ldr	r3, [r3, #0]
	add	r2, r7, #4256	
	add	r2, r2, #16
	ldmia	r2, {r1, r2}
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #7190
	mov.w r2, #1610612736 
lab46:	push {r1, r2}
	mov.w r1, #7190
	mov.w r2, #1610612736 
	sub	r3, r3, #368	
	add	r2, r7, #4448	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab48
	movs	r3, #16
	add	r2, r7, #4448	
	add	r2, r2, #24
	str	r3, [r2, #0]
	b	lab49
lab139: 	add	r3, r3, #8
	ldr	r0, [r3, #0]
push {r1, r2}
	mov.w r1, #1465
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1465
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	sqrt
	push {r1, r2}
	mov.w r1, #6800
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	add	r2, r7, #4416	
	add	r2, r2, #8
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #8
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	sdiv	r3, r2, r3
	adds	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #4
	str	r3, [r2, #0]
	add	r3, r7, #384	
	subs	r3, #224	
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	subs	r3, #232	
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	subs	r3, #240	
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	subs	r3, #248	
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	MakeRange
	movs	r3, #0
	add	r2, r7, #4448	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	add	r2, r7, #4448	
	add	r2, r2, #16
	str	r3, [r2, #0]
	b	lab50
lab128: 	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r2, r7, #4384	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #16
	ldr	r2, [r3, #0]
	add	r3, r7, #4448	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #4448	
	add	r2, r2, #16
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #4448	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #4448	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab51
	add	r3, r7, #4448	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	subs	r3, r2, r3
	add	r2, r7, #4448	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #16
	str	r3, [r2, #0]
lab51: 	add	r3, r7, #4448	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r2, r7, #4384	
	add	r2, r2, #16
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #16
	ldr	r2, [r3, #0]
	add	r3, r7, #4448	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #4448	
	add	r2, r2, #16
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #4448	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #4448	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab52
	add	r3, r7, #4448	
	add	r3, r3, #20
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	subs	r3, r2, r3
	add	r2, r7, #4448	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #16
	str	r3, [r2, #0]
lab52: 	add	r3, r7, #4448	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r2, r7, #4384	
	add	r2, r2, #12
	str	r3, [r2, #0]
	add	r3, r7, #4384	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #4384	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab53
	add	r3, r7, #4384	
	add	r3, r3, #16
	ldr	r2, [r3, #0]
	add	r3, r7, #4384	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	subs	r4, r2, r3
	add	r3, r7, #4256	
	add	r3, r3, #24
	add	r2, r7, #4384	
	add	r2, r2, #12
	ldr	r2, [r2, #0]
	add	r1, r7, #4384	
	add	r1, r1, #20
	ldr	r1, [r1, #0]
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r0, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	str	r3, [sp, #4]
	add	r3, r7, #192	
	subs	r3, #24
	str	r3, [sp, #0]
	add	r3, r7, #4256	
	add	r3, r3, #24
	ldmia	r3, {r2, r3}
	mov	r1, r4
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #4194
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4194
	mov.w r2, #1610612736 
lab53: 	add	r3, r7, #4384	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #4384	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab50
	add	r3, r7, #384	
	sub	r3, r3, #336	
	add	r2, r7, #4384	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	add	r1, r7, #4384	
	add	r1, r1, #20
	ldr	r1, [r1, #0]
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r3, r3, #344	
	add	r2, r7, #4384	
	add	r2, r2, #12
	ldr	r2, [r2, #0]
	add	r1, r7, #4384	
	add	r1, r1, #16
	ldr	r1, [r1, #0]
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	cmp	r3, r2
	blt	lab54
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r4, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	lsls	r2, r3, #3
	add	r3, r7, #192	
	subs	r3, #24
	mov	r1, r4
	mov	r0, r3
	bl	memcpy
	add	r3, r7, #4288	
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #336	
	add	r3, r7, #384	
	sub	r4, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	str	r3, [sp, #20]
	add	r3, r7, #192	
	subs	r3, #24
	str	r3, [sp, #16]
	add	r3, r7, #384	
	sub	r3, r3, #372	
	ldr	r3, [r3, #0]
	str	r3, [sp, #12]
	add	r3, r7, #384	
	sub	r1, r3, #344	
	add	r3, sp, #4
	ldmia	r1, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r2, #4]
	str	r3, [sp, #0]
	ldr	r3, [r2, #0]
	add	r2, r7, #4288	
	ldmia	r2, {r1, r2}
	ldr	r0, [r4, #0]
push {r1, r2}
	mov.w r1, #3436
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3436
	mov.w r2, #1610612736 
lab54: 	add	r3, r7, #384	
	subs	r3, #224	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	ble	lab55
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #256	
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r1, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #264	
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #272	
	add	r3, r7, #384	
	subs	r3, #224	
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	add	r3, r7, #384	
	sub	r2, r3, #280	
	add	r3, r7, #384	
	subs	r3, #232	
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	b	lab56
lab55: 	movs	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r3, [r3, #0]
	adds	r2, r3, #1
	add	r3, r7, #384	
	sub	r3, r3, #272	
	str	r2, [r3, #0]
	b	lab57
lab61: 	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab58
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab59
lab58: 	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab60
lab59: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	adds	r2, r3, #1
	add	r3, r7, #384	
	sub	r3, r3, #272	
	str	r2, [r3, #0]
lab57: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	blt	lab61
	b	lab62
lab60: 	nop
lab62: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #272	
	str	r2, [r3, #4]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bgt	lab63
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #280	
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r3, r2
	bne	lab64
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #256	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r1, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r4, r3, #264	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #272	
	mov	r0, r3
	bl	MakeRange
	b	lab65
lab64: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r4, r3, #256	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r4, r3, #272	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	movs	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r3, [r3, #4]
	subs	r2, r3, #2
	add	r3, r7, #384	
	sub	r3, r3, #272	
	str	r2, [r3, #0]
	b	lab66
lab70: 	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	adds	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab67
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	adds	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab68
lab67: 	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab69
lab68: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	subs	r2, r3, #1
	add	r3, r7, #384	
	sub	r3, r3, #272	
	str	r2, [r3, #0]
lab66: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bge	lab70
	b	lab71
lab69: 	nop
lab71: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #272	
	str	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r3, r2
	bne	lab65
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #264	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #4]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	subs	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r4, r3, #272	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	b	lab65
lab63: 	movs	r3, #0
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	adds	r2, r3, #1
	add	r3, r7, #384	
	sub	r3, r3, #280	
	str	r2, [r3, #0]
	b	lab72
lab76: 	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab73
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab74
lab73: 	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab75
lab74: 	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	adds	r2, r3, #1
	add	r3, r7, #384	
	sub	r3, r3, #280	
	str	r2, [r3, #0]
lab72: 	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	blt	lab76
	b	lab77
lab75: 	nop
lab77: 	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #280	
	str	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r3, r2
	bne	lab78
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	lsls	r3, r3, #1
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #256	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r1, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r4, r3, #264	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #272	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	lsls	r3, r3, #1
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #280	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	b	lab65
lab78: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r3, r2
	bne	lab79
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #256	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #272	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	movs	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r3, [r3, #4]
	subs	r2, r3, #2
	add	r3, r7, #384	
	sub	r3, r3, #280	
	str	r2, [r3, #0]
	b	lab80
lab84: 	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	adds	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab81
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	adds	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab82
lab81: 	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab83
lab82: 	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	subs	r2, r3, #1
	add	r3, r7, #384	
	sub	r3, r3, #280	
	str	r2, [r3, #0]
lab80: 	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bge	lab84
	b	lab85
lab83: 	nop
lab85: 	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #280	
	str	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r3, r2
	bne	lab86
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #264	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #4]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	subs	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r4, r3, #280	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	b	lab65
lab86: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #272	
	str	r2, [r3, #4]
	b	lab65
lab79: 	movs	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r3, [r3, #4]
	subs	r2, r3, #2
	add	r3, r7, #384	
	sub	r3, r3, #272	
	str	r2, [r3, #0]
	b	lab87
lab91: 	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	adds	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab88
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	adds	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab89
lab88: 	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab90
lab89: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	subs	r2, r3, #1
	add	r3, r7, #384	
	sub	r3, r3, #272	
	str	r2, [r3, #0]
lab87: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bge	lab91
	b	lab92
lab90: 	nop
lab92: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #272	
	str	r2, [r3, #4]
	movs	r3, #0
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r3, [r3, #0]
	subs	r2, r3, #1
	add	r3, r7, #384	
	sub	r3, r3, #280	
	str	r2, [r3, #0]
	b	lab93
lab97: 	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	adds	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab94
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	adds	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab95
lab94: 	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab96
lab95: 	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r3, [r3, #0]
	subs	r2, r3, #1
	add	r3, r7, #384	
	sub	r3, r3, #280	
	str	r2, [r3, #0]
lab93: 	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bge	lab97
	b	lab98
lab96: 	nop
lab98: 	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #280	
	str	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r3, r2
	bne	lab99
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r4, r3, #256	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	lsls	r3, r3, #1
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #264	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #4]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	subs	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r4, r3, #272	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	subs	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r4, r3, #280	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	b	lab65
lab99: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #272	
	str	r2, [r3, #4]
lab65: 	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #4416	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r3, r2
	ble	lab100
	b	lab101
lab103: 	sub	r3, r3, #336	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	add	r2, r7, #384	
	sub	r0, r2, #364	
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r2, [r2, #0]
	str	r2, [sp, #0]
	ldmia	r3, {r2, r3}
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #1504
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1504
	mov.w r2, #1610612736 
	add	r3, r3, #4
	str	r0, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r3, [r3, #4]
	add	r2, r7, #4384	
	add	r2, r2, #4
	ldr	r2, [r2, #0]
	subs	r3, r2, r3
	add	r2, r7, #4384	
	str	r3, [r2, #0]
	add	r3, r7, #4384	
	ldr	r3, [r3, #0]
	negs	r4, r3
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r1, [r3, #0]
	add	r3, r7, #4288	
	add	r3, r3, #8
	add	r2, r7, #4384	
	add	r2, r2, #4
	ldr	r2, [r2, #0]
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r0, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	str	r3, [sp, #4]
	add	r3, r7, #192	
	subs	r3, #24
	str	r3, [sp, #0]
	add	r3, r7, #4288	
	add	r3, r3, #8
	ldmia	r3, {r2, r3}
	mov	r1, r4
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #7276
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7276
	mov.w r2, #1610612736 
	sub	r3, r3, #344	
	add	r2, r7, #4384	
	add	r2, r2, #4
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #0]
	add	r3, r7, #4384	
	ldr	r3, [r3, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #336	
	add	r2, r7, #384	
	sub	r0, r2, #364	
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r2, [r2, #0]
	str	r2, [sp, #0]
	ldmia	r3, {r2, r3}
	ldr	r0, [r0, #0]
	bl	BinaryLast
	push {r1, r2}
	mov.w r1, #2649
	mov.w r2, #1610612736 
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r4, r3, #336	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
lab101: 	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	ble	lab102
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	bgt	lab103
	b	lab102
lab100: 	add	r3, r7, #384	
	sub	r3, r3, #256	
	ldmia	r3, {r0, r1}
	bl	Range_length
	add	r3, r7, #4384	
	add	r3, r3, #8
	str	r0, [r3, #0]
	movs	r3, #0
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #256	
	ldr	r3, [r3, #0]
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
	b	lab104
lab107: 	sub	r3, r3, #336	
	ldr	r3, [r3, #0]
	add	r2, r7, #4448	
	add	r2, r2, #28
	ldr	r2, [r2, #0]
	cmp	r2, r3
	beq	lab105
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab105
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab106
lab105: 	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	negs	r4, r3
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r1, r3, #1
	add	r3, r7, #384	
	sub	r3, r3, #256	
	ldr	r3, [r3, #0]
	adds	r2, r3, #1
	add	r3, r7, #4288	
	add	r3, r3, #16
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r0, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	str	r3, [sp, #4]
	add	r3, r7, #192	
	subs	r3, #24
	str	r3, [sp, #0]
	add	r3, r7, #4288	
	add	r3, r3, #16
	ldmia	r3, {r2, r3}
	mov	r1, r4
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #7757
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7757
	mov.w r2, #1610612736 
	add	r3, r3, #28
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #256	
	str	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
lab106: 	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	subs	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
lab104: 	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r2, [r3, #0]
	add	r3, r7, #4384	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab107
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #0]
	add	r3, r7, #4384	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #256	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #264	
	ldmia	r3, {r0, r1}
	bl	Range_length
	add	r3, r7, #4384	
	add	r3, r3, #8
	str	r0, [r3, #0]
	movs	r3, #0
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #264	
	ldr	r3, [r3, #0]
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
	b	lab108
lab111: 	sub	r3, r3, #344	
	ldr	r3, [r3, #4]
	subs	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #28
	ldr	r2, [r2, #0]
	cmp	r2, r3
	beq	lab109
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab109
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab110
lab109: 	add	r3, r7, #384	
	sub	r3, r3, #264	
	ldr	r1, [r3, #0]
	add	r3, r7, #4288	
	add	r3, r3, #24
	add	r2, r7, #4448	
	add	r2, r2, #28
	ldr	r2, [r2, #0]
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r0, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	str	r3, [sp, #4]
	add	r3, r7, #192	
	subs	r3, #24
	str	r3, [sp, #0]
	add	r3, r7, #4288	
	add	r3, r3, #24
	ldmia	r3, {r2, r3}
	add	r1, r7, #4416	
	add	r1, r1, #24
	ldr	r1, [r1, #0]
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #5399
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5399
	mov.w r2, #1610612736 
	add	r3, r3, #28
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	subs	r2, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #264	
	str	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4416	
	add	r2, r2, #24
	str	r3, [r2, #0]
lab110: 	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
lab108: 	add	r3, r7, #4416	
	add	r3, r3, #24
	ldr	r2, [r3, #0]
	add	r3, r7, #4384	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab111
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #4]
	add	r3, r7, #4384	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	subs	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r4, r3, #264	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	add	r2, r7, #384	
	sub	r2, r2, #272	
	subs	r3, #224	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	add	r2, r7, #384	
	sub	r2, r2, #280	
	subs	r3, #232	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	add	r2, r7, #384	
	sub	r2, r2, #256	
	subs	r3, #240	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	add	r2, r7, #384	
	sub	r2, r2, #264	
	subs	r3, #248	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
lab56: 	add	r3, r7, #384	
	sub	r3, r3, #256	
	ldr	r1, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #336	
	ldr	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #288	
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r3, r3, #256	
	ldr	r5, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #256	
	ldr	r4, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	add	r2, r7, #4416	
	add	r2, r2, #8
	ldr	r2, [r2, #0]
	sdiv	r2, r3, r2
	add	r1, r7, #4416	
	add	r1, r1, #8
	ldr	r1, [r1, #0]
	mul	r2, r1, r2
	subs	r3, r3, r2
	adds	r2, r4, r3
	add	r3, r7, #384	
	sub	r3, r3, #304	
	mov	r1, r5
	mov	r0, r3
	bl	MakeRange
	movs	r3, #0
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #304	
	ldr	r3, [r3, #4]
	adds	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #4
	str	r3, [r2, #0]
	b	lab112
lab113: 	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	add	r3, r2
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #4352	
	add	r2, r2, #12
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #4352	
	add	r2, r2, #8
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #352	
	add	r2, r7, #4352	
	add	r2, r2, #12
	ldr	r2, [r2, #0]
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #4352	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r2, r7, #4352	
	add	r2, r2, #8
	ldr	r2, [r2, #0]
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #4352	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r7, #384	
	sub	r2, r2, #352	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #4
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #4448	
	add	r2, r2, #4
	str	r3, [r2, #0]
lab112: 	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r3, [r3, #4]
	add	r2, r7, #4448	
	add	r2, r2, #4
	ldr	r2, [r2, #0]
	cmp	r2, r3
	blt	lab113
	add	r3, r7, #384	
	sub	r3, r3, #312	
	add	r2, r7, #384	
	sub	r2, r2, #304	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #320	
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r5, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r4, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r6, r0
	add	r3, r7, #384	
	sub	r3, r3, #264	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	subs	r3, r6, r3
	mov	r1, r3
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r0, [r3, #0]
	bl	Min
	mov	r3, r0
	adds	r2, r4, r3
	add	r3, r7, #384	
	sub	r3, r3, #296	
	mov	r1, r5
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r3, r3, #304	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #288	
	str	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r3, [r3, #0]
	add	r2, r7, #4448	
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #328	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	movs	r3, #0
	add	r2, r7, #4448	
	add	r2, r2, #4
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #312	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	cmp	r3, r2
	blt	lab114
	add	r3, r7, #384	
	sub	r3, r3, #312	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r4, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #312	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	lsls	r2, r3, #3
	add	r3, r7, #192	
	subs	r3, #24
	mov	r1, r4
	mov	r0, r3
	bl	memcpy
	b	lab115
lab114: 	add	r3, r7, #384	
	sub	r3, r3, #312	
	ldr	r4, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r5, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #312	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	add	r2, r7, #384	
	sub	r0, r2, #364	
	mov	r2, r5
	mov	r1, r4
	ldr	r0, [r0, #0]
	bl	BlockSwap
lab115: 	add	r3, r7, #384	
	sub	r3, r3, #320	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	ble	lab116
	add	r3, r7, #384	
	sub	r3, r3, #320	
	ldr	r3, [r3, #4]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #328	
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab117
lab116: 	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	bne	lab118
lab117: 	add	r3, r7, #384	
	sub	r3, r3, #320	
	add	r2, r7, #384	
	sub	r0, r2, #364	
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r2, [r2, #0]
	str	r2, [sp, #0]
	ldmia	r3, {r2, r3}
	add	r1, r7, #4448	
	ldr	r1, [r1, #0]
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #2042
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2042
	mov.w r2, #1610612736 
	add	r3, r3, #28
	str	r0, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #320	
	ldr	r2, [r3, #4]
	add	r3, r7, #4352	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	subs	r3, r2, r3
	add	r2, r7, #4352	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r0, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r7, #4448	
	ldr	r2, [r2, #0]
	ldr	r0, [r0, #0]
	bl	BlockSwap
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r3, [r3, #0]
	adds	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #4352	
	add	r2, r2, #20
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #272	
	ldr	r2, [r3, #0]
	add	r3, r7, #4448	
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	adds	r1, r3, #1
	add	r0, r7, #4448	
	add	r0, r0, #4
	str	r1, [r0, #0]
	add	r3, r2
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #4352	
	add	r2, r2, #16
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #360	
	add	r2, r7, #4352	
	add	r2, r2, #20
	ldr	r2, [r2, #0]
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #4352	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	add	r2, r7, #4352	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #4352	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	add	r2, r7, #384	
	sub	r2, r2, #360	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #312	
	ldr	r1, [r3, #4]
	add	r3, r7, #4320	
	add	r2, r7, #4352	
	add	r2, r2, #28
	ldr	r2, [r2, #0]
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #312	
	add	r3, r7, #384	
	sub	r5, r3, #280	
	add	r3, r7, #384	
	sub	r4, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	str	r3, [sp, #20]
	add	r3, r7, #192	
	subs	r3, #24
	str	r3, [sp, #16]
	add	r3, r7, #384	
	sub	r3, r3, #372	
	ldr	r3, [r3, #0]
	str	r3, [sp, #12]
	add	r6, sp, #4
	add	r3, r7, #4320	
	ldmia	r3, {r0, r1}
	stmia	r6, {r0, r1}
	ldr	r3, [r2, #4]
	str	r3, [sp, #0]
	ldr	r3, [r2, #0]
	ldmia	r5, {r1, r2}
	ldr	r0, [r4, #0]
push {r1, r2}
	mov.w r1, #5111
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5111
	mov.w r2, #1610612736 
	add	r3, r3, #8
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bgt	lab119
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	lsls	r2, r3, #3
	add	r3, r7, #192	
	subs	r3, #24
	mov	r0, r3
	bl	memcpy
	b	lab120
lab119: 	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #280	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r0, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	ldr	r0, [r0, #0]
	bl	BlockSwap
lab120: 	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #4352	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	subs	r2, r2, r3
	add	r3, r7, #384	
	sub	r0, r3, #364	
	add	r3, r7, #4352	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r1, r7, #4352	
	add	r1, r1, #28
	ldr	r1, [r1, #0]
	ldr	r0, [r0, #0]
	bl	BlockSwap
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r2, [r3, #0]
	add	r3, r7, #4352	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	subs	r1, r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r2, [r3, #0]
	add	r3, r7, #4352	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	subs	r2, r2, r3
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #312	
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r3, r3, #312	
	ldr	r1, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #312	
	ldr	r2, [r3, #4]
	add	r3, r7, #4352	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #320	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #288	
	str	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	beq	lab121
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4448	
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #4416	
	add	r2, r2, #28
	str	r3, [r2, #0]
	b	lab122
lab124: 	add	r3, r3, #28
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #4448	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	beq	lab123
	add	r3, r7, #4416	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	add	r2, r7, #4448	
	str	r3, [r2, #0]
lab123: 	add	r3, r7, #4416	
	add	r3, r3, #28
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #4416	
	add	r2, r2, #28
	str	r3, [r2, #0]
lab122: 	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r3, [r3, #4]
	add	r2, r7, #4416	
	add	r2, r2, #28
	ldr	r2, [r2, #0]
	cmp	r2, r3
	blt	lab124
	add	r3, r7, #4448	
	ldr	r3, [r3, #0]
	subs	r3, #1
	add	r2, r7, #4448	
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #328	
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	b	lab125
lab118: 	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	cmp	r3, r2
	ble	lab126
	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	negs	r4, r3
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldr	r2, [r3, #4]
	add	r3, r7, #4320	
	add	r3, r3, #8
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r0, r3, #364	
	movs	r3, #0
	str	r3, [sp, #4]
	add	r3, r7, #192	
	subs	r3, #24
	str	r3, [sp, #0]
	add	r3, r7, #4320	
	add	r3, r3, #8
	ldmia	r3, {r2, r3}
	mov	r1, r4
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #6662
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #6662
	mov.w r2, #1610612736 
	sub	r3, r3, #288	
	ldr	r5, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r4, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	adds	r2, r4, r3
	add	r3, r7, #384	
	sub	r4, r3, #320	
	mov	r3, r7
	mov	r1, r5
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #288	
	str	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r3, [r3, #4]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #288	
	str	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	add	r3, r7, #4448	
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #4448	
	str	r3, [r2, #0]
	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #296	
	str	r2, [r3, #4]
	b	lab115
lab126: 	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r0, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	ldr	r0, [r0, #0]
	bl	BlockSwap
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r1, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r4, r3, #320	
	mov	r3, r7
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #384	
	mov	r3, r4
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r3, [r3, #0]
	add	r2, r7, #4448	
	ldr	r2, [r2, #0]
	cmp	r2, r3
	bne	lab127
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r3, [r3, #4]
	add	r2, r7, #4448	
	str	r3, [r2, #0]
lab127: 	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #288	
	str	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #288	
	ldr	r2, [r3, #4]
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #288	
	str	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #296	
	str	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldr	r2, [r3, #4]
	add	r3, r7, #4416	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3
	add	r3, r7, #384	
	sub	r3, r3, #296	
	str	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #296	
	ldr	r2, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #264	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab115
	add	r3, r7, #384	
	sub	r3, r3, #264	
	ldr	r2, [r3, #0]
	add	r3, r7, #384	
	sub	r3, r3, #296	
	str	r2, [r3, #4]
lab125: 	b	lab115
lab121: 	nop
	add	r3, r7, #384	
	sub	r3, r3, #312	
	ldr	r5, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #344	
	ldr	r4, [r3, #4]
	add	r3, r7, #384	
	sub	r3, r3, #264	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	subs	r2, r4, r3
	add	r3, r7, #4320	
	add	r3, r3, #16
	mov	r1, r5
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r2, r3, #312	
	add	r3, r7, #384	
	sub	r5, r3, #280	
	add	r3, r7, #384	
	sub	r4, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	str	r3, [sp, #20]
	add	r3, r7, #192	
	subs	r3, #24
	str	r3, [sp, #16]
	add	r3, r7, #384	
	sub	r3, r3, #372	
	ldr	r3, [r3, #0]
	str	r3, [sp, #12]
	add	r6, sp, #4
	add	r3, r7, #4320	
	add	r3, r3, #16
	ldmia	r3, {r0, r1}
	stmia	r6, {r0, r1}
	ldr	r3, [r2, #4]
	str	r3, [sp, #0]
	ldr	r3, [r2, #0]
	ldmia	r5, {r1, r2}
	ldr	r0, [r4, #0]
push {r1, r2}
	mov.w r1, #425
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #425
	mov.w r2, #1610612736 
lab102: 	nop
lab50: 	add	r3, r7, #384	
	sub	r3, r3, #368	
	add	r2, r7, #4448	
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab128
	add	r3, r7, #384	
	subs	r3, #224	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	ble	lab129
	add	r3, r7, #384	
	sub	r3, r3, #372	
	add	r2, r7, #384	
	add	r1, r7, #384	
	sub	r0, r1, #364	
	ldr	r3, [r3, #0]
	subs	r2, #232	
	ldmia	r2, {r1, r2}
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #4431
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4431
	mov.w r2, #1610612736 
	ldr	r3, [r3, #-240]
	add	r2, r7, #4416	
	str	r3, [r2, #0]
	add	r3, r7, #384	
	ldr	r3, [r3, #-236]
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
	b	lab130
lab133: 	ldr	r3, [r3, #-248]
	add	r2, r7, #4448	
	add	r2, r2, #28
	ldr	r2, [r2, #0]
	cmp	r2, r3
	beq	lab131
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #384	
	ldr	r3, [r3, #-240]
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab132
lab131: 	add	r3, r7, #384	
	ldr	r3, [r3, #-236]
	add	r2, r7, #4448	
	add	r2, r2, #28
	ldr	r2, [r2, #0]
	subs	r3, r2, r3
	add	r2, r7, #4384	
	add	r2, r2, #24
	str	r3, [r2, #0]
	add	r3, r7, #4384	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	negs	r4, r3
	add	r3, r7, #384	
	ldr	r1, [r3, #-240]
	add	r3, r7, #4320	
	add	r3, r3, #24
	add	r2, r7, #4448	
	add	r2, r2, #28
	ldr	r2, [r2, #0]
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r0, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	str	r3, [sp, #4]
	add	r3, r7, #192	
	subs	r3, #24
	str	r3, [sp, #0]
	add	r3, r7, #4320	
	add	r3, r3, #24
	ldmia	r3, {r2, r3}
	mov	r1, r4
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #576
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #576
	mov.w r2, #1610612736 
	ldr	r2, [r3, #-240]
	add	r3, r7, #4384	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r3, r2
	add	r2, r7, #384	
	str	r3, [r2, #-240]
	add	r3, r7, #384	
	ldr	r2, [r3, #-236]
	add	r3, r7, #4384	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	add	r3, r2
	add	r2, r7, #384	
	str	r3, [r2, #-236]
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	subs	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
lab132: 	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
lab130: 	add	r3, r7, #384	
	subs	r3, #240	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	bgt	lab133
	add	r3, r7, #384	
	ldr	r3, [r3, #-248]
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
	b	lab134
lab137: 	add	r3, r3, #28
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab135
	add	r3, r7, #384	
	ldr	r3, [r3, #-244]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	adds	r1, r2, r3
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r2, r7, #384	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	add	r3, r2
	add	r2, r7, #384	
	sub	r2, r2, #372	
	ldr	r4, [r2, #0]
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	lab136
lab135: 	add	r3, r7, #384	
	ldr	r2, [r3, #-248]
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	subs	r3, r2, r3
	add	r2, r7, #4384	
	add	r2, r2, #28
	str	r3, [r2, #0]
	add	r3, r7, #384	
	ldr	r2, [r3, #-244]
	add	r3, r7, #4352	
	add	r1, r7, #4448	
	add	r1, r1, #28
	ldr	r1, [r1, #0]
	mov	r0, r3
	bl	MakeRange
	add	r3, r7, #384	
	sub	r0, r3, #364	
	add	r3, r7, #4416	
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	str	r3, [sp, #4]
	add	r3, r7, #192	
	subs	r3, #24
	str	r3, [sp, #0]
	add	r3, r7, #4352	
	ldmia	r3, {r2, r3}
	add	r1, r7, #4384	
	add	r1, r1, #28
	ldr	r1, [r1, #0]
	ldr	r0, [r0, #0]
push {r1, r2}
	mov.w r1, #2974
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2974
	mov.w r2, #1610612736 
	ldr	r2, [r3, #-248]
	add	r3, r7, #4384	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	subs	r3, r2, r3
	add	r2, r7, #384	
	str	r3, [r2, #-248]
	add	r3, r7, #384	
	ldr	r2, [r3, #-244]
	add	r3, r7, #4384	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r3, #1
	subs	r3, r2, r3
	add	r2, r7, #384	
	str	r3, [r2, #-244]
	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
lab136: 	add	r3, r7, #4448	
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	subs	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #28
	str	r3, [r2, #0]
lab134: 	add	r3, r7, #384	
	subs	r3, #248	
	ldmia	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #0
	bgt	lab137
lab129: 	add	r3, r7, #4448	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	lsls	r3, r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #8
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	lsls	r3, r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #12
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #12
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab138
	add	r3, r7, #4448	
	add	r3, r3, #12
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	subs	r3, r2, r3
	add	r2, r7, #4448	
	add	r2, r2, #12
	str	r3, [r2, #0]
	add	r3, r7, #4448	
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	adds	r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #8
	str	r3, [r2, #0]
lab138: 	add	r3, r7, #4448	
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	lsls	r3, r3, #1
	add	r2, r7, #4448	
	add	r2, r2, #24
	str	r3, [r2, #0]
lab49: 	add	r3, r7, #4448	
	add	r3, r3, #24
	ldr	r2, [r3, #0]
	add	r3, r7, #4416	
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab139
lab44: 	add	r7, r7, #4480	
	adds	r7, #4
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4240
	mov.w r2, #1610612736 
TestingPathological:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	lab140
	movs	r3, #10
	b	lab141
lab140: 	ldr	r3, [r7, #0]
	lsrs	r2, r3, #31
	add	r3, r2
	asrs	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #4]
	cmp	r3, r2
	bge	lab142
	movs	r3, #11
	b	lab141
lab142: 	ldr	r3, [r7, #0]
	subs	r3, #1
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne	lab143
	movs	r3, #10
	b	lab141
lab143: 	movs	r3, #9
lab141: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
TestingRandom:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	bl	rand_beebs
	mov	r3, r0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	movs	r0, r0
	movs	r0, r0
TestingMostlyDescending:
	push	{r4, r5, r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	mov	r0, r3
push {r1, r2}
	mov.w r1, #5709
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5709
	mov.w r2, #1610612736 
	mov	r5, r1
	bl	rand_beebs
	mov	r3, r0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #642
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #642
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #5051
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5051
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, =0x40140000	
push {r1, r2}
	mov.w r1, #4062
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4062
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #1545
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1545
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, =0x40040000	
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r4, r5, r7, pc}
	nop
	.ltorg
TestingMostlyAscending:
	push	{r4, r5, r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r0, [r7, #4]
push {r1, r2}
	mov.w r1, #3194
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3194
	mov.w r2, #1610612736 
	mov	r5, r1
	bl	rand_beebs
	mov	r3, r0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #1635
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1635
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #7808
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7808
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, =0x40140000	
push {r1, r2}
	mov.w r1, #7552
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7552
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
push {r1, r2}
	mov.w r1, #4267
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4267
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, =0x40040000	
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r4, r5, r7, pc}
	.ltorg
TestingAscending:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
TestingDescending:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
TestingEqual:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	mov	r3, #1000	
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
TestingJittered:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	bl	rand_beebs
	mov	r3, r0
	mov	r0, r3
push {r1, r2}
	mov.w r1, #3164
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3164
	mov.w r2, #1610612736 
	ldrd	r2, r3, [r3]
push {r1, r2}
	mov.w r1, #474
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #474
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	add	r3, pc, #36	
	ldrd	r2, r3, [r3]
	bl	__aeabi_dcmple
	mov	r3, r0
	cmp	r3, #0
	beq	lab144
	ldr	r3, [r7, #4]
	b	lab145
lab144: 	ldr	r3, [r7, #4]
	subs	r3, #2
lab145: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.ltorg
TestingMostlyEqual:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	bl	rand_beebs
	mov	r3, r0
	negs	r2, r3
	and	r3, r3, #3
	and	r2, r2, #3
	it	pl
	negpl	r3, r2
	add	r3, r3, #1000	
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
verify_benchmark:
	push	{r7, lr}
	subw	sp, sp, #3208	
	add	r7, sp, #0
	addw	r3, r7, #3208	
	subw	r3, r3, #3204	
	str	r0, [r3, #0]
	addw	r3, r7, #3208	
	sub	r3, r3, #3200	
	ldr	r2, [pc, #56]	
	mov	r0, r3
	mov	r1, r2
	mov	r3, #3200	
	mov	r2, r3
	bl	memcpy
	mov	r3, #400	
	lsls	r2, r3, #3
	add	r3, r7, #8
	mov	r1, r3
	ldr	r0, =array1	
	bl	memcmp
	push {r1, r2}
	mov.w r1, #7045
	mov.w r2, #1610612736 
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	addw	r7, r7, #3208	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #3198
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
	mov.w r1, #3378
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3378
	mov.w r2, #1610612736 
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1491
	mov.w r2, #1610612736 
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #1
push {r1, r2}
	mov.w r1, #4915
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4915
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #6640
	mov.w r2, #1610612736 
benchmark_body:
	push	{r4, r5, r7, lr}
	sub	sp, #72	
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, =0x00008123	
	str	r3, [r7, #56]	
	ldr	r3, [pc, #156]	
	add	r4, r7, #16
	mov	r5, r3
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [r5, #0]
	str	r3, [r4, #0]
	movs	r3, #0
	str	r3, [r7, #60]	
	b	lab146
lab151: 	bl	srand_beebs
	mov	r3, #400	
	str	r3, [r7, #52]	
	movs	r3, #0
	str	r3, [r7, #64]	
	b	lab147
lab150: 	str	r3, [r7, #68]	
	b	lab148
lab149: 	lsls	r3, r3, #2
	adds	r3, #72	
	add	r3, r7
	ldr	r3, [r3, #-56]
	ldr	r1, [r7, #52]	
	ldr	r0, [r7, #68]	
	blx	r3
	mov	r3, r0
	str	r3, [r7, #8]
	ldr	r3, [r7, #68]	
	str	r3, [r7, #12]
	ldr	r2, =array1	
	ldr	r3, [r7, #68]	
	lsls	r3, r3, #3
	add	r3, r2
	add	r2, r7, #8
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	ldr	r3, [r7, #68]	
	adds	r3, #1
	str	r3, [r7, #68]	
lab148: 	ldr	r2, [r7, #68]	
	ldr	r3, [r7, #52]	
	cmp	r2, r3
	blt	lab149
	ldr	r2, [r7, #56]	
	ldr	r1, [r7, #52]	
	ldr	r0, =array1	
	bl	WikiSort
	push {r1, r2}
	mov.w r1, #4071
	mov.w r2, #1610612736 
	adds	r3, #1
	str	r3, [r7, #64]	
lab147: 	ldr	r3, [r7, #64]	
	cmp	r3, #8
	ble	lab150
	ldr	r3, [r7, #60]	
	adds	r3, #1
	str	r3, [r7, #60]	
lab146: 	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab151
	movs	r3, #0
	mov	r0, r3
	adds	r7, #72	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #750
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
	mov.w r1, #2336
	mov.w r2, #1610612736 
	bl	benchmark
	push {r1, r2}
	mov.w r1, #6867
	mov.w r2, #1610612736 
	str	r3, [r7, #8]
	bl	stop_trigger
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	verify_benchmark
	push {r1, r2}
	mov.w r1, #3427
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
	mov.w r1, #4549
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
srand_beebs:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r2, =seed	
	str	r3, [r2, #0]
	nop
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
sqrt:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	mov	r5, r1
	bl	__ieee754_sqrt
	push {r1, r2}
	mov.w r1, #3640
	mov.w r2, #1610612736 
	mov	r6, r0
	mov	r7, r1
	mov	r3, r5
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmpun
	cbnz	r0, lab152
	mov	r0, r4
	mov	r1, r5
	movs	r2, #0
	movs	r3, #0
	bl	__aeabi_dcmplt
	cbnz	r0, lab153
lab152: 	mov	r0, r6
	mov	r1, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7226
	mov.w r2, #1610612736 
lab153: 	bl	__errno
	movs	r2, #0
	movs	r3, #0
	movs	r1, #33	
	str	r1, [r0, #0]
	mov	r0, r2
	mov	r1, r3
push {r1, r2}
	mov.w r1, #4642
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4642
	mov.w r2, #1610612736 
	mov	r7, r1
	mov	r0, r6
	mov	r1, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #3759
	mov.w r2, #1610612736 
	nop
__ieee754_sqrt:
	ldr	r2, =0x7ff00000	
	bics	r2, r1
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	mov	r4, r1
	beq	lab154
	cmp	r1, #0
	mov	r3, r1
	mov	ip, r0
	ble	lab155
	asrs	r1, r1, #20
	beq	lab156
lab173: 	lsls	r0, r1, #31
	subw	r7, r1, #1023	
	orr	r3, r3, #1048576	
	bmi	lab157
	lsls	r3, r3, #1
	add	r3, r3, ip, lsr #31
	mov	ip, ip, lsl #1
lab157: 	mov	r2, ip, lsr #31
	movs	r6, #0
	add	r3, r2, r3, lsl #1
	asrs	r7, r7, #1
	mov	ip, ip, lsl #1
	mov	lr, #22
	mov	r4, r6
	mov	r2, #2097152	
lab159: 	cmp	r1, r3
	bgt	lab158
	subs	r3, r3, r1
	adds	r4, r1, r2
	add	r6, r2
lab158: 	lsls	r3, r3, #1
	subs	lr, lr, #1
	add	r3, r3, ip, lsr #31
	mov	r2, r2, lsr #1
	mov	ip, ip, lsl #1
	bne	lab159
	mov	r5, lr
	movs	r0, #32
	mov	r2, #2147483648	
	b	lab160
lab163: lab165: 	subs	r0, #1
	add	r3, r1, r3, lsl #1
	mov	ip, ip, lsl #1
	mov	r2, r2, lsr #1
	beq	lab162
lab160: 	cmp	r3, r4
	add	r1, r2, lr
	ble	lab163
	cmp	r1, #0
	add	lr, r1, r2
	blt	lab164
lab166: lab167: 	cmp	r1, ip
	it	hi
	addhi	r3, r3, #4294967295	
lab174: 	add	r5, r2
	mov	r4, r8
	b	lab165
lab164: 	cmp	lr, #0
	blt	lab166
	add	r8, r4, #1
	b	lab167
lab155: 	bic	r2, r1, #2147483648	
	orrs	r2, r0
	beq	lab168
	cmp	r1, #0
	bne	lab169
lab170: 	subs	r1, #21
	mov	r3, r2
	mov	ip, ip, lsl #21
	cmp	r2, #0
	beq	lab170
	lsls	r6, r2, #11
	bmi	lab171
lab156: 	movs	r0, #0
lab172: 	lsls	r5, r3, #11
	mov	r4, r0
	add	r0, r0, #1
	bpl	lab172
	mov	r2, r3
	mov	r3, ip
	lsl	ip, ip, r0
	rsb	r0, r0, #32
lab177: 	subs	r1, r1, r4
	orrs	r3, r2
	b	lab173
lab161: 	cmp	r1, ip
	bhi	lab165
	cmp	r1, #0
	add	lr, r1, r2
	blt	lab164
	mov	r8, r3
	movs	r3, #0
	b	lab174
lab162: 	orrs	r3, r3, ip
	bne	lab175
	lsrs	r0, r5, #1
lab176: 	add	r3, r3, #1069547520	
	add	r3, r3, #2097152	
	lsls	r2, r6, #31
	it	mi
	orrmi	r0, r0, #2147483648	
	add	r9, r3, r7, lsl #20
	mov	r5, r0
	mov	r4, r9
lab168: 	mov	r0, r5
	mov	r1, r4
	cpsid f
	push {r1, r2}
	mov.w r1, #1876
	mov.w r2, #1610612736 
lab175: 	adds	r1, r5, #1
	itet	ne
	addne	r0, r5, #1
	addeq	r6, #1
	lsrne	r0, r0, #1
	b	lab176
lab154: 	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #400
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #400
	mov.w r2, #1610612736 
	mov	r3, r4
push {r1, r2}
	mov.w r1, #5211
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5211
	mov.w r2, #1610612736 
	mov	r4, r1
	mov	r0, r5
	mov	r1, r4
	cpsid f
	push {r1, r2}
	mov.w r1, #963
	mov.w r2, #1610612736 
lab169: 	mov	r2, r0
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
push {r1, r2}
	mov.w r1, #4438
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4438
	mov.w r2, #1610612736 
	mov	r4, r1
	b	lab168
lab171: 	mov	r3, ip
	movs	r0, #32
	mov	r4, #4294967295	
	b	lab177
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
	beq	lab178
	mov	r4, r4, lsr #21
	rsbs	r5, r4, r5, lsr #21
	it	lt
	neglt	r5, r5
	ble	lab179
	add	r4, r5
	eor	r2, r0, r2
	eor	r3, r1, r3
	eor	r0, r2, r0
	eor	r1, r3, r1
	eor	r2, r0, r2
	eor	r3, r1, r3
lab179: 	cmp	r5, #54	
	it	hi
	cpsid f
	push {r1, r2}
	mov.w r1, #2280
	mov.w r2, #1610612736 
	tst	r1, #2147483648	
	mov	r1, r1, lsl #12
	mov	ip, #1048576	
	orr	r1, ip, r1, lsr #12
	beq	lab180
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab180: 	tst	r3, #2147483648	
	mov	r3, r3, lsl #12
	orr	r3, ip, r3, lsr #12
	beq	lab181
	negs	r2, r2
	sbc	r3, r3, r3, lsl #1
lab181: 	teq	r4, r5
	beq	lab182
lab194: 	rsbs	lr, r5, #32
	blt	lab183
	lsl	ip, r2, lr
	lsr	r2, r2, r5
	adds	r0, r0, r2
	adc	r1, r1, #0
	lsl	r2, r3, lr
	adds	r0, r0, r2
	asr	r3, r3, r5
	adcs	r1, r3
	b	lab184
lab183: 	sub	r5, r5, #32
	add	lr, lr, #32
	cmp	r2, #1
	lsl	ip, r3, lr
	it	cs
	orrcs	ip, ip, #2
	asr	r3, r3, r5
	adds	r0, r0, r3
	adcs	r1, r1, r3, asr #31
lab184: 	and	r5, r1, #2147483648	
	bpl	lab185
	mov	lr, #0
	rsbs	ip, ip, #0
	sbcs	r0, lr, r0
	sbc	r1, lr, r1
lab185: 	cmp	r1, #1048576	
	bcc	lab186
	cmp	r1, #2097152	
	bcc	lab187
	lsrs	r1, r1, #1
	movs	r0, r0, rrx
	mov	ip, ip, rrx
	add	r4, r4, #1
	mov	r2, r4, lsl #21
	cmn	r2, #4194304	
	bcs	lab188
lab187: 	cmp	ip, #2147483648	
	it	eq
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	orr	r1, r1, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #1603
	mov.w r2, #1610612736 
lab186: 	movs	ip, ip, lsl #1
	adcs	r0, r0
	adc	r1, r1, r1
	subs	r4, #1
	it	cs
	cmpcs	r1, #1048576	
	bcs	lab187
lab198: 	itt	eq
	moveq	r1, r0
	moveq	r0, #0
	clz	r3, r1
	it	eq
	addeq	r3, #32
	sub	r3, r3, #11
	subs	r2, r3, #32
	bge	lab189
	adds	r2, #12
	ble	lab190
	add	ip, r2, #20
	rsb	r2, r2, #12
	lsl	r0, r1, ip
	lsr	r1, r1, r2
	b	lab191
lab190: 	add	r2, r2, #20
lab189: 	it	le
	rsble	ip, r2, #32
	lsl	r1, r1, r2
	lsr	ip, r0, ip
	itt	le
	orrle	r1, r1, ip
	lslle	r0, r2
lab191: 	subs	r4, r4, r3
	ittt	ge
	addge	r1, r1, r4, lsl #20
	orrge	r1, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #2277
	mov.w r2, #1610612736 
	mvn	r4, r4
	subs	r4, #31
	bge	lab192
	adds	r4, #12
	bgt	lab193
	add	r4, r4, #20
	rsb	r2, r4, #32
	lsr	r0, r0, r4
	lsl	r3, r1, r2
	orr	r0, r0, r3
	lsr	r3, r1, r4
	orr	r1, r5, r3
	pop	{r4, r5, pc}
lab193: 	rsb	r4, r4, #12
	rsb	r2, r4, #32
	lsr	r0, r0, r2
	lsl	r3, r1, r4
	orr	r0, r0, r3
	mov	r1, r5
	pop	{r4, r5, pc}
lab192: 	lsr	r0, r1, r4
	mov	r1, r5
	pop	{r4, r5, pc}
lab182: 	teq	r4, #0
	eor	r3, r3, #1048576	
	itte	eq
	eoreq	r1, r1, #1048576	
	addeq	r4, #1
	subne	r5, #1
	b	lab194
lab178: 	mvns	ip, r4, asr #21
	it	ne
	mvnsne	ip, r5, asr #21
	beq	lab195
	teq	r4, r5
	it	eq
	teqeq	r0, r2
	beq	lab196
	orrs	ip, r4, r0
	itt	eq
	moveq	r1, r3
	moveq	r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #3698
	mov.w r2, #1610612736 
lab196: 	teq	r1, r3
	ittt	ne
	movne	r1, #0
	movne	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #3573
	mov.w r2, #1610612736 
	movs	ip, r4, lsr #21
	bne	lab197
	lsls	r0, r0, #1
	adcs	r1, r1
	it	cs
	orrcs	r1, r1, #2147483648	
	cpsid f
	push {r1, r2}
	mov.w r1, #2163
	mov.w r2, #1610612736 
lab197: 	adds	r4, r4, #4194304	
	itt	cc
	addcc	r1, r1, #1048576	
	cpsid f
	push {r1, r2}
	mov.w r1, #6053
	mov.w r2, #1610612736 
	and	r5, r1, #2147483648	
lab188: 	orr	r1, r5, #2130706432	
	orr	r1, r1, #15728640	
	mov	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #5174
	mov.w r2, #1610612736 
lab195: 	mvns	ip, r4, asr #21
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
	mov.w r1, #656
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
	b	lab198
	nop
__aeabi_i2d:
	teq	r0, #0
	itt	eq
	moveq	r1, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #7271
	mov.w r2, #1610612736 
	push	{r4, r5, lr}
	mov	r4, #1024	
	add	r4, r4, #50	
	ands	r5, r0, #2147483648	
	it	mi
	negmi	r0, r0
	mov	r1, #0
	b	lab198
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
	b	lab198
	nop
__aeabi_ul2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	mov	r5, #0
	b	lab199
__aeabi_l2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	ands	r5, r1, #2147483648	
	bpl	lab199
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab199: 	mov	r4, #1024	
	add	r4, r4, #50	
	movs	ip, r1, lsr #22
	beq	lab185
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
	b	lab185
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
	bleq	bccc <__aeabi_dmul+0x1dc>
	add	r4, r5
	eor	r6, r1, r3
	bic	r1, r1, ip, lsl #21
	bic	r3, r3, ip, lsl #21
	orrs	r5, r0, r1, lsl #12
	it	ne
	orrsne	r5, r2, r3, lsl #12
	orr	r1, r1, #1048576	
	orr	r3, r3, #1048576	
	beq	lab200
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
	bcs	lab201
	movs	lr, lr, lsl #1
	adcs	r5, r5
	adc	r6, r6, r6
lab201: 	orr	r1, r2, r6, lsl #11
	orr	r1, r1, r5, lsr #21
	mov	r0, r5, lsl #11
	orr	r0, r0, lr, lsr #21
	mov	lr, lr, lsl #11
	subs	ip, r4, #253	
	it	hi
	cmphi	ip, #1792	
	bhi	lab202
	cmp	lr, #2147483648	
	it	eq
	movseq	lr, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #4181
	mov.w r2, #1610612736 
lab200: 	and	r6, r6, #2147483648	
	orr	r1, r6, r1
	orr	r0, r0, r2
	eor	r1, r1, r3
	subs	r4, r4, ip, lsr #1
	ittt	gt
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #5329
	mov.w r2, #1610612736 
	orr	r1, r1, #1048576	
	mov	lr, #0
	subs	r4, #1
lab202: 	bgt	lab203
	cmn	r4, #54	
	ittt	le
	movle	r0, #0
	andle	r1, r1, #2147483648	
	cpsid f
	push {r1, r2}
	mov.w r1, #985
	mov.w r2, #1610612736 
	rsb	r4, r4, #0
	subs	r4, #32
	bge	lab204
	adds	r4, #12
	bgt	lab205
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
lab205: 	rsb	r4, r4, #12
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
lab204: 	rsb	r5, r4, #32
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
lab210: 	bne	lab206
	and	r6, r1, #2147483648	
lab207: 	adc	r1, r1, r1
	tst	r1, #1048576	
	it	eq
	subeq	r4, #1
	beq	lab207
	orr	r1, r1, r6
	teq	r5, #0
	it	ne
	bxne	lr
lab206: 	and	r6, r3, #2147483648	
lab208: 	adc	r3, r3, r3
	tst	r3, #1048576	
	it	eq
	subeq	r5, #1
	beq	lab208
	orr	r3, r3, r6
	bx	lr
	teq	r4, ip
	and	r5, ip, r3, lsr #20
	it	ne
	teqne	r5, ip
	beq	lab209
	orrs	r6, r0, r1, lsl #1
	it	ne
	orrsne	r6, r2, r3, lsl #1
	bne	lab210
lab221: 	and	r1, r1, #2147483648	
	mov	r0, #0
	pop	{r4, r5, r6, pc}
lab209: 	orrs	r6, r0, r1, lsl #1
	itte	eq
	moveq	r0, r2
	moveq	r1, r3
	orrsne	r6, r2, r3, lsl #1
	beq	lab211
	teq	r4, ip
	bne	lab212
	orrs	r6, r0, r1, lsl #12
	bne	lab211
lab212: 	teq	r5, ip
	bne	lab213
	orrs	r6, r2, r3, lsl #12
	itt	ne
	movne	r0, r2
	movne	r1, r3
	bne	lab211
lab213: 	eor	r1, r1, r3
lab203: 	and	r1, r1, #2147483648	
	orr	r1, r1, #2130706432	
	orr	r1, r1, #15728640	
	mov	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #6682
	mov.w r2, #1610612736 
lab211: 	orr	r1, r1, #2130706432	
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
	bleq	beb2 <__aeabi_ddiv+0x16e>
	sub	r4, r4, r5
	eor	lr, r1, r3
	orrs	r5, r2, r3, lsl #12
	mov	r1, r1, lsl #12
	beq	lab214
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
	bcs	lab215
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
lab215: 	subs	r6, r6, r2
	sbc	r5, r5, r3
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
	mov	r0, #1048576	
	mov	ip, #524288	
lab217: 	sbcs	lr, r5, r3
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
	beq	lab216
	mov	r5, r5, lsl #4
	orr	r5, r5, r6, lsr #28
	mov	r6, r6, lsl #4
	mov	r3, r3, lsl #3
	orr	r3, r3, r2, lsr #29
	mov	r2, r2, lsl #3
	movs	ip, ip, lsr #4
	bne	lab217
	tst	r1, #1048576	
	bne	lab218
	orr	r1, r1, r0
	mov	r0, #0
	mov	ip, #2147483648	
	b	lab217
lab216: 	tst	r1, #1048576	
	itt	eq
	orreq	r1, r0
	moveq	r0, #0
lab218: 	subs	ip, r4, #253	
	it	hi
	cmphi	ip, #1792	
	bhi	lab202
	subs	ip, r5, r3
	itt	eq
	subseq	ip, r6, r2
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #7164
	mov.w r2, #1610612736 
lab214: 	and	lr, lr, #2147483648	
	orr	r1, lr, r1, lsr #12
	adds	r4, r4, ip, lsr #1
	ittt	gt
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	cpsid f
	push {r1, r2}
	mov.w r1, #5774
	mov.w r2, #1610612736 
	orr	r1, r1, #1048576	
	mov	lr, #0
	subs	r4, #1
	b	lab202
	orr	lr, r5, r6
	b	lab202
	and	r5, ip, r3, lsr #20
	teq	r4, ip
	it	eq
	teqeq	r5, ip
	beq	lab211
	teq	r4, ip
	bne	lab219
	orrs	r4, r0, r1, lsl #12
	bne	lab211
	teq	r5, ip
	bne	lab213
	mov	r0, r2
	mov	r1, r3
	b	lab211
lab219: 	teq	r5, ip
	bne	lab220
	orrs	r5, r2, r3, lsl #12
	beq	lab221
	mov	r0, r2
	mov	r1, r3
	b	lab211
lab220: 	orrs	r6, r0, r1, lsl #1
	it	ne
	orrsne	r6, r2, r3, lsl #1
	bne	lab210
	orrs	r4, r0, r1, lsl #1
	bne	lab213
	orrs	r5, r2, r3, lsl #1
	bne	lab221
	b	lab211
__gedf2:
	mov	ip, #4294967295	
	b	lab222
	nop
__ledf2:
	mov	ip, #1
	b	lab222
	nop
__cmpdf2:
	mov	ip, #1
lab222: 	str	ip, [sp, #-4]!
	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	mov	ip, r3, lsl #1
	it	ne
	mvnsne	ip, ip, asr #21
	beq	lab223
lab226: 	orrs	ip, r0, r1, lsl #1
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
lab223: 	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	bne	lab224
	orrs	ip, r0, r1, lsl #12
	bne	lab225
lab224: 	mov	ip, r3, lsl #1
	mvns	ip, ip, asr #21
	bne	lab226
	orrs	ip, r2, r3, lsl #12
	beq	lab226
lab225: 	ldr	r0, [sp], #4
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
	mov.w r1, #2652
	mov.w r2, #1610612736 
__aeabi_dcmpeq:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #2116
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2116
	mov.w r2, #1610612736 
	moveq	r0, #1
	movne	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmplt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #4301
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4301
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmple:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #3232
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3232
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpge:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #7278
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7278
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpgt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #87
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #87
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpun:
	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	bne	lab227
	orrs	ip, r0, r1, lsl #12
	bne	lab228
lab227: 	mov	ip, r3, lsl #1
	mvns	ip, ip, asr #21
	bne	lab229
	orrs	ip, r2, r3, lsl #12
	bne	lab228
lab229: 	mov	r0, #0
	bx	lr
lab228: 	mov	r0, #1
	bx	lr
__aeabi_d2iz:
	mov	r2, r1, lsl #1
	adds	r2, r2, #2097152	
	bcs	lab230
	bpl	lab231
	mvn	r3, #992	
	subs	r2, r3, r2, asr #21
	bls	lab232
	mov	r3, r1, lsl #11
	orr	r3, r3, #2147483648	
	orr	r3, r3, r0, lsr #21
	tst	r1, #2147483648	
	lsr	r0, r3, r2
	it	ne
	negne	r0, r0
	bx	lr
lab231: 	mov	r0, #0
	bx	lr
lab230: 	orrs	r0, r0, r1, lsl #12
	bne	lab233
lab232: 	ands	r0, r1, #2147483648	
	it	eq
	mvneq	r0, #2147483648	
	bx	lr
lab233: 	mov	r0, #0
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
	ldr	r6, =0x0001d284	
	ldr	r5, =0x0001d284	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab234
	movs	r4, #0
lab235: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #8103
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #8103
	mov.w r2, #1610612736 
lab234: 	ldr	r6, =0x0001d28c	
	ldr	r5, =0x0001d284	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab236
	movs	r4, #0
lab237: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #256
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #256
	mov.w r2, #1610612736 
lab236:	cpsid f
	push {r1, r2}
	mov.w r1, #5178
	mov.w r2, #1610612736 
	.ltorg
memcmp:
	cmp	r2, #3
	push	{r4, lr}
	bls	lab238
	orr	ip, r0, r1
	tst	ip, #3
	mov	r4, r0
	mov	r3, r1
	bne	lab239
lab240: 	mov	r0, r4
	ldr	lr, [r1]
	ldr	ip, [r0]
	cmp	ip, lr
	add	r4, r4, #4
	add	r3, r3, #4
	bne	lab239
	subs	r2, #4
	cmp	r2, #3
	mov	r0, r4
	mov	r1, r3
	bhi	lab240
lab238: 	subs	r4, r2, #1
	cbz	r2, lab241
lab245: 	subs	r1, #1
	b	lab242
lab244: 	beq	lab243
lab242: 	ldrb	lr, [ip, #1]!
	ldrb	r2, [r1, #1]!
	cmp	lr, r2
	sub	r3, r4, ip
	beq	lab244
	sub	r0, lr, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #7053
	mov.w r2, #1610612736 
lab239: 	subs	r4, r2, #1
	b	lab245
lab243: 	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #746
	mov.w r2, #1610612736 
lab241: 	mov	r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #1333
	mov.w r2, #1610612736 
memcpy:
	mov	ip, r0
	orr	r3, r1, r0
	ands	r3, r3, #3
	bne	lab246
lab255: 	bcc	lab247
lab248: 	str	r3, [r0], #4
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
	bcs	lab248
lab247: 	adds	r2, #48	
	bcc	lab249
lab250: 	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #16
	bcs	lab250
lab249: 	adds	r2, #12
	bcc	lab251
lab252: 	str	r3, [r0], #4
	subs	r2, #4
	bcs	lab252
lab251: 	adds	r2, #4
	beq	lab253
	lsls	r2, r2, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab253
	ldrh	r3, [r1, #0]
	strh	r3, [r0, #0]
lab253: 	mov	r0, ip
	bx	lr
	nop
lab246: 	cmp	r2, #8
	bcc	lab254
	lsls	r3, r1, #30
	beq	lab255
	ands	r3, r0, #3
	beq	lab255
	rsb	r3, r3, #4
	subs	r2, r2, r3
	lsls	r3, r3, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab255
	ldrh	r3, [r1], #2
	strh	r3, [r0], #2
	b	lab255
lab254: 	subs	r2, #4
	bcc	lab251
lab256: 	ldrb	r3, [r1], #1
	strb	r3, [r0], #1
	bcs	lab256
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
	bls	lab257
	adds	r3, r1, r2
	cmp	r3, r0
	bls	lab257
	add	ip, r0, r2
	cbz	r2, lab258
	mov	r2, ip
lab259: 	strb	ip, [r2, #-1]!
	cmp	r1, r3
	bne	lab259
	cpsid f
	push {r1, r2}
	mov.w r1, #6273
	mov.w r2, #1610612736 
lab257: 	cmp	r2, #15
	bhi	lab260
	mov	r3, r0
	add	ip, r2, #4294967295	
	cbz	r2, lab258
lab268: 	subs	r3, #1
	add	ip, r1
lab261: 	strb	r2, [r3, #1]!
	cmp	r1, ip
	bne	lab261
lab258:	cpsid f
	push {r1, r2}
	mov.w r1, #7708
	mov.w r2, #1610612736 
lab260: 	orr	r3, r0, r1
	lsls	r3, r3, #30
	bne	lab262
	sub	r3, r2, #16
	push	{r4, r5, r6, lr}
	add	ip, r1, #32
	bic	r5, r3, #15
	add	lr, r1, #16
	add	r4, r0, #16
	add	ip, r5
	lsrs	r3, r3, #4
lab263: 	str	r5, [r4, #-16]
	ldr	r5, [lr, #-12]
	str	r5, [r4, #-12]
	ldr	r5, [lr, #-8]
	str	r5, [r4, #-8]
	ldr	r5, [lr, #-4]
	str	r5, [r4, #-4]
	add	lr, lr, #16
	cmp	lr, ip
	add	r4, r4, #16
	bne	lab263
	adds	r3, #1
	tst	r2, #12
	add	r1, r1, r3, lsl #4
	and	r4, r2, #15
	add	r3, r0, r3, lsl #4
	beq	lab264
	subs	r4, #4
	bic	r6, r4, #3
	mov	ip, r4, lsr #2
	add	r6, r3
	subs	r4, r3, #4
	mov	lr, r1
lab265: 	str	r5, [r4, #4]!
	cmp	r4, r6
	bne	lab265
	add	r4, ip, #1
	and	r2, r2, #3
	add	r3, r3, r4, lsl #2
	add	r1, r1, r4, lsl #2
lab269: 	cbz	r2, lab266
	add	ip, ip, #1
	subs	r3, #1
	add	ip, r1
lab267: 	strb	r2, [r3, #1]!
	cmp	r1, ip
	bne	lab267
lab266:	cpsid f
	push {r1, r2}
	mov.w r1, #3890
	mov.w r2, #1610612736 
lab262: 	add	ip, r2, #4294967295	
	mov	r3, r0
	b	lab268
lab264: 	mov	r2, r4
	b	lab269
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab270
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab271
	uxtb	r2, r1
	mov	r3, r0
	b	lab272
lab273: 	bcc	lab271
lab272: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab273
lab281: 	bls	lab274
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab275
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab276: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab276
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab277
lab282: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab278: 	cmp	r3, r2
	bne	lab278
	and	r4, ip, #3
lab274: 	cbz	r4, lab271
lab280: 	add	r4, r3
lab279: 	cmp	r4, r3
	bne	lab279
lab271:	cpsid f
	push {r1, r2}
	mov.w r1, #1903
	mov.w r2, #1610612736 
lab277: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab280
	b	lab271
lab270: 	mov	r3, r0
	mov	r4, r2
	b	lab281
lab275: 	mov	r2, r3
	mov	ip, r4
	b	lab282
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
	cbz	r6, lab283
	mov	r9, #1
	mov	sl, #0
lab289: 	subs	r5, r4, #1
	bmi	lab283
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab285: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab284
lab286: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab285
lab283: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab284: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab286
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab287
	blx	r2
lab292: 	cmp	r2, fp
	bne	lab288
lab291: 	cmp	r3, r6
	beq	lab286
	mov	r6, r3
	cmp	r6, #0
	bne	lab289
	b	lab283
lab287: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab290
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab291
lab288: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab289
	b	lab283
lab290: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab292
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
	ldr	r5, =0x0001d28c	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab293
	subs	r3, #4
	add	r5, r3
lab294: 	ldr	r3, [r5], #-4
	
	push {r1, r2}
	mov.w r1, #4024
	mov.w r2, #1610612736 
	cmp	r4, #0
	push {r1, r2}
	mov.w r1, #4024
	mov.w r2, #1610612736 
lab293: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab295
lab299: 	cmp	r5, #31
	bgt	lab296
	cbnz	r6, lab297
lab298: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab300:	cpsid f
	push {r1, r2}
	mov.w r1, #5186
	mov.w r2, #1610612736 
lab297: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab298
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab298
lab295: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab299
lab296: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab300
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

max_size:
	.word	0x00000190
	.word	0x000003e8
	.word	0x00000001
	.word	0x000003e8
	.word	0x00000002
	.word	0x000003e8
	.word	0x0000000d
	.word	0x000003e8
	.word	0x00000012
	.word	0x000003e8
	.word	0x00000013
	.word	0x000003e8
	.word	0x0000001a
	.word	0x000003e8
	.word	0x0000001f
	.word	0x000003e8
	.word	0x00000020
	.word	0x000003e8
	.word	0x00000023
	.word	0x000003e8
	.word	0x00000024
	.word	0x000003e8
	.word	0x00000025
	.word	0x000003e8
	.word	0x0000002e
	.word	0x000003e8
	.word	0x00000031
	.word	0x000003e8
	.word	0x00000037
	.word	0x000003e8
	.word	0x0000003d
	.word	0x000003e8
	.word	0x0000003e
	.word	0x000003e8
	.word	0x00000042
	.word	0x000003e8
	.word	0x00000048
	.word	0x000003e8
	.word	0x00000049
	.word	0x000003e8
	.word	0x0000004a
	.word	0x000003e8
	.word	0x0000004b
	.word	0x000003e8
	.word	0x0000004c
	.word	0x000003e8
	.word	0x0000004d
	.word	0x000003e8
	.word	0x00000051
	.word	0x000003e8
	.word	0x00000052
	.word	0x000003e8
	.word	0x00000053
	.word	0x000003e8
	.word	0x00000057
	.word	0x000003e8
	.word	0x00000059
	.word	0x000003e8
	.word	0x0000005b
	.word	0x000003e8
	.word	0x0000005c
	.word	0x000003e8
	.word	0x0000005f
	.word	0x000003e8
	.word	0x00000063
	.word	0x000003e8
	.word	0x00000065
	.word	0x000003e8
	.word	0x00000069
	.word	0x000003e8
	.word	0x0000006c
	.word	0x000003e8
	.word	0x0000006d
	.word	0x000003e8
	.word	0x00000072
	.word	0x000003e8
	.word	0x00000077
	.word	0x000003e8
	.word	0x00000078
	.word	0x000003e8
	.word	0x00000080
	.word	0x000003e8
	.word	0x00000089
	.word	0x000003e8
	.word	0x0000008f
	.word	0x000003e8
	.word	0x00000090
	.word	0x000003e8
	.word	0x00000097
	.word	0x000003e8
	.word	0x0000009e
	.word	0x000003e8
	.word	0x000000a1
	.word	0x000003e8
	.word	0x000000a2
	.word	0x000003e8
	.word	0x000000a5
	.word	0x000003e8
	.word	0x000000a9
	.word	0x000003e8
	.word	0x000000b5
	.word	0x000003e8
	.word	0x000000b6
	.word	0x000003e8
	.word	0x000000bb
	.word	0x000003e8
	.word	0x000000bc
	.word	0x000003e8
	.word	0x000000be
	.word	0x000003e8
	.word	0x000000c3
	.word	0x000003e8
	.word	0x000000c4
	.word	0x000003e8
	.word	0x000000c6
	.word	0x000003e8
	.word	0x000000c8
	.word	0x000003e8
	.word	0x000000c9
	.word	0x000003e8
	.word	0x000000cd
	.word	0x000003e8
	.word	0x000000ce
	.word	0x000003e8
	.word	0x000000d3
	.word	0x000003e8
	.word	0x000000d4
	.word	0x000003e8
	.word	0x000000d5
	.word	0x000003e8
	.word	0x000000d6
	.word	0x000003e8
	.word	0x000000d7
	.word	0x000003e8
	.word	0x000000d9
	.word	0x000003e8
	.word	0x000000dd
	.word	0x000003e8
	.word	0x000000df
	.word	0x000003e8
	.word	0x000000e1
	.word	0x000003e8
	.word	0x000000e2
	.word	0x000003e8
	.word	0x000000e3
	.word	0x000003e8
	.word	0x000000e9
	.word	0x000003e8
	.word	0x000000f2
	.word	0x000003e8
	.word	0x000000f5
	.word	0x000003e8
	.word	0x000000f9
	.word	0x000003e8
	.word	0x000000fa
	.word	0x000003e8
	.word	0x0000010a
	.word	0x000003e8
	.word	0x0000010e
	.word	0x000003e8
	.word	0x0000010f
	.word	0x000003e8
	.word	0x00000111
	.word	0x000003e8
	.word	0x00000112
	.word	0x000003e8
	.word	0x00000118
	.word	0x000003e8
	.word	0x0000011f
	.word	0x000003e8
	.word	0x00000123
	.word	0x000003e8
	.word	0x00000127
	.word	0x000003e8
	.word	0x0000012b
	.word	0x000003e8
	.word	0x0000012f
	.word	0x000003e8
	.word	0x00000130
	.word	0x000003e8
	.word	0x00000138
	.word	0x000003e8
	.word	0x00000148
	.word	0x000003e8
	.word	0x0000014a
	.word	0x000003e8
	.word	0x0000014d
	.word	0x000003e8
	.word	0x00000153
	.word	0x000003e8
	.word	0x00000156
	.word	0x000003e8
	.word	0x0000015a
	.word	0x000003e8
	.word	0x0000015e
	.word	0x000003e8
	.word	0x00000169
	.word	0x000003e8
	.word	0x00000173
	.word	0x000003e8
	.word	0x00000178
	.word	0x000003e8
	.word	0x0000017a
	.word	0x000003e8
	.word	0x0000017e
	.word	0x000003e8
	.word	0x00000180
	.word	0x000003e8
	.word	0x00000181
	.word	0x000003e8
	.word	0x00000186
	.word	0x000003e8
	.word	0x0000018c
	.word	0x000003e9
	.word	0x00000005
	.word	0x000003e9
	.word	0x00000007
	.word	0x000003e9
	.word	0x00000008
	.word	0x000003e9
	.word	0x0000000b
	.word	0x000003e9
	.word	0x00000010
	.word	0x000003e9
	.word	0x00000014
	.word	0x000003e9
	.word	0x00000015
	.word	0x000003e9
	.word	0x00000016
	.word	0x000003e9
	.word	0x0000001d
	.word	0x000003e9
	.word	0x00000022
	.word	0x000003e9
	.word	0x00000027
	.word	0x000003e9
	.word	0x00000028
	.word	0x000003e9
	.word	0x00000029
	.word	0x000003e9
	.word	0x0000002a
	.word	0x000003e9
	.word	0x0000002f
	.word	0x000003e9
	.word	0x00000036
	.word	0x000003e9
	.word	0x0000003f
	.word	0x000003e9
	.word	0x00000044
	.word	0x000003e9
	.word	0x00000047
	.word	0x000003e9
	.word	0x0000004e
	.word	0x000003e9
	.word	0x00000054
	.word	0x000003e9
	.word	0x00000055
	.word	0x000003e9
	.word	0x0000005d
	.word	0x000003e9
	.word	0x00000060
	.word	0x000003e9
	.word	0x00000061
	.word	0x000003e9
	.word	0x00000067
	.word	0x000003e9
	.word	0x00000068
	.word	0x000003e9
	.word	0x0000006b
	.word	0x000003e9
	.word	0x00000075
	.word	0x000003e9
	.word	0x00000081
	.word	0x000003e9
	.word	0x0000008b
	.word	0x000003e9
	.word	0x0000008c
	.word	0x000003e9
	.word	0x00000094
	.word	0x000003e9
	.word	0x0000009c
	.word	0x000003e9
	.word	0x000000a0
	.word	0x000003e9
	.word	0x000000a7
	.word	0x000003e9
	.word	0x000000ac
	.word	0x000003e9
	.word	0x000000ae
	.word	0x000003e9
	.word	0x000000af
	.word	0x000003e9
	.word	0x000000b3
	.word	0x000003e9
	.word	0x000000b9
	.word	0x000003e9
	.word	0x000000ba
	.word	0x000003e9
	.word	0x000000c1
	.word	0x000003e9
	.word	0x000000c2
	.word	0x000003e9
	.word	0x000000cf
	.word	0x000003e9
	.word	0x000000d0
	.word	0x000003e9
	.word	0x000000d8
	.word	0x000003e9
	.word	0x000000db
	.word	0x000003e9
	.word	0x000000e0
	.word	0x000003e9
	.word	0x000000e4
	.word	0x000003e9
	.word	0x000000e5
	.word	0x000003e9
	.word	0x000000eb
	.word	0x000003e9
	.word	0x000000ed
	.word	0x000003e9
	.word	0x000000f0
	.word	0x000003e9
	.word	0x000000f6
	.word	0x000003e9
	.word	0x000000fc
	.word	0x000003e9
	.word	0x000000ff
	.word	0x000003e9
	.word	0x00000100
	.word	0x000003e9
	.word	0x00000101
	.word	0x000003e9
	.word	0x00000103
	.word	0x000003e9
	.word	0x00000104
	.word	0x000003e9
	.word	0x00000105
	.word	0x000003e9
	.word	0x00000109
	.word	0x000003e9
	.word	0x0000010b
	.word	0x000003e9
	.word	0x0000010d
	.word	0x000003e9
	.word	0x00000113
	.word	0x000003e9
	.word	0x0000011e
	.word	0x000003e9
	.word	0x00000120
	.word	0x000003e9
	.word	0x00000121
	.word	0x000003e9
	.word	0x00000126
	.word	0x000003e9
	.word	0x0000012d
	.word	0x000003e9
	.word	0x0000012e
	.word	0x000003e9
	.word	0x00000134
	.word	0x000003e9
	.word	0x00000135
	.word	0x000003e9
	.word	0x0000013a
	.word	0x000003e9
	.word	0x00000142
	.word	0x000003e9
	.word	0x00000143
	.word	0x000003e9
	.word	0x00000145
	.word	0x000003e9
	.word	0x00000146
	.word	0x000003e9
	.word	0x00000147
	.word	0x000003e9
	.word	0x0000014e
	.word	0x000003e9
	.word	0x00000151
	.word	0x000003e9
	.word	0x00000155
	.word	0x000003e9
	.word	0x0000015b
	.word	0x000003e9
	.word	0x00000160
	.word	0x000003e9
	.word	0x00000165
	.word	0x000003e9
	.word	0x00000168
	.word	0x000003e9
	.word	0x0000016b
	.word	0x000003e9
	.word	0x0000016d
	.word	0x000003e9
	.word	0x0000016e
	.word	0x000003e9
	.word	0x00000171
	.word	0x000003e9
	.word	0x00000177
	.word	0x000003e9
	.word	0x0000017b
	.word	0x000003e9
	.word	0x0000017d
	.word	0x000003e9
	.word	0x00000189
	.word	0x000003e9
	.word	0x0000018a
	.word	0x000003e9
	.word	0x0000018e
	.word	0x000003ea
	.word	0x00000009
	.word	0x000003ea
	.word	0x00000011
	.word	0x000003ea
	.word	0x00000017
	.word	0x000003ea
	.word	0x00000018
	.word	0x000003ea
	.word	0x0000001e
	.word	0x000003ea
	.word	0x00000021
	.word	0x000003ea
	.word	0x00000026
	.word	0x000003ea
	.word	0x0000002b
	.word	0x000003ea
	.word	0x0000002d
	.word	0x000003ea
	.word	0x00000035
	.word	0x000003ea
	.word	0x00000039
	.word	0x000003ea
	.word	0x0000003b
	.word	0x000003ea
	.word	0x0000003c
	.word	0x000003ea
	.word	0x00000040
	.word	0x000003ea
	.word	0x00000045
	.word	0x000003ea
	.word	0x00000046
	.word	0x000003ea
	.word	0x0000004f
	.word	0x000003ea
	.word	0x00000058
	.word	0x000003ea
	.word	0x0000005e
	.word	0x000003ea
	.word	0x00000062
	.word	0x000003ea
	.word	0x00000064
	.word	0x000003ea
	.word	0x0000006e
	.word	0x000003ea
	.word	0x0000006f
	.word	0x000003ea
	.word	0x00000073
	.word	0x000003ea
	.word	0x00000076
	.word	0x000003ea
	.word	0x0000007b
	.word	0x000003ea
	.word	0x0000007d
	.word	0x000003ea
	.word	0x0000007f
	.word	0x000003ea
	.word	0x00000082
	.word	0x000003ea
	.word	0x00000083
	.word	0x000003ea
	.word	0x00000086
	.word	0x000003ea
	.word	0x00000088
	.word	0x000003ea
	.word	0x0000008a
	.word	0x000003ea
	.word	0x0000008e
	.word	0x000003ea
	.word	0x00000092
	.word	0x000003ea
	.word	0x00000095
	.word	0x000003ea
	.word	0x00000096
	.word	0x000003ea
	.word	0x00000098
	.word	0x000003ea
	.word	0x00000099
	.word	0x000003ea
	.word	0x0000009d
	.word	0x000003ea
	.word	0x000000a3
	.word	0x000003ea
	.word	0x000000a6
	.word	0x000003ea
	.word	0x000000a8
	.word	0x000003ea
	.word	0x000000aa
	.word	0x000003ea
	.word	0x000000ab
	.word	0x000003ea
	.word	0x000000ad
	.word	0x000003ea
	.word	0x000000b0
	.word	0x000003ea
	.word	0x000000b1
	.word	0x000003ea
	.word	0x000000b4
	.word	0x000003ea
	.word	0x000000b7
	.word	0x000003ea
	.word	0x000000b8
	.word	0x000003ea
	.word	0x000000bd
	.word	0x000003ea
	.word	0x000000bf
	.word	0x000003ea
	.word	0x000000c5
	.word	0x000003ea
	.word	0x000000ca
	.word	0x000003ea
	.word	0x000000cb
	.word	0x000003ea
	.word	0x000000cc
	.word	0x000003ea
	.word	0x000000d2
	.word	0x000003ea
	.word	0x000000da
	.word	0x000003ea
	.word	0x000000dc
	.word	0x000003ea
	.word	0x000000e8
	.word	0x000003ea
	.word	0x000000ec
	.word	0x000003ea
	.word	0x000000ee
	.word	0x000003ea
	.word	0x000000f1
	.word	0x000003ea
	.word	0x000000f3
	.word	0x000003ea
	.word	0x000000f4
	.word	0x000003ea
	.word	0x000000fb
	.word	0x000003ea
	.word	0x000000fd
	.word	0x000003ea
	.word	0x000000fe
	.word	0x000003ea
	.word	0x00000102
	.word	0x000003ea
	.word	0x00000108
	.word	0x000003ea
	.word	0x00000110
	.word	0x000003ea
	.word	0x00000115
	.word	0x000003ea
	.word	0x00000117
	.word	0x000003ea
	.word	0x0000011a
	.word	0x000003ea
	.word	0x0000011b
	.word	0x000003ea
	.word	0x0000011c
	.word	0x000003ea
	.word	0x00000122
	.word	0x000003ea
	.word	0x00000124
	.word	0x000003ea
	.word	0x00000128
	.word	0x000003ea
	.word	0x00000129
	.word	0x000003ea
	.word	0x0000012a
	.word	0x000003ea
	.word	0x0000012c
	.word	0x000003ea
	.word	0x00000132
	.word	0x000003ea
	.word	0x00000133
	.word	0x000003ea
	.word	0x00000136
	.word	0x000003ea
	.word	0x00000137
	.word	0x000003ea
	.word	0x0000013b
	.word	0x000003ea
	.word	0x0000013c
	.word	0x000003ea
	.word	0x0000013f
	.word	0x000003ea
	.word	0x00000141
	.word	0x000003ea
	.word	0x00000144
	.word	0x000003ea
	.word	0x0000014b
	.word	0x000003ea
	.word	0x0000014f
	.word	0x000003ea
	.word	0x00000154
	.word	0x000003ea
	.word	0x00000158
	.word	0x000003ea
	.word	0x0000015d
	.word	0x000003ea
	.word	0x00000161
	.word	0x000003ea
	.word	0x00000162
	.word	0x000003ea
	.word	0x00000166
	.word	0x000003ea
	.word	0x0000016a
	.word	0x000003ea
	.word	0x0000016c
	.word	0x000003ea
	.word	0x00000172
	.word	0x000003ea
	.word	0x00000176
	.word	0x000003ea
	.word	0x0000017c
	.word	0x000003ea
	.word	0x0000017f
	.word	0x000003ea
	.word	0x00000182
	.word	0x000003ea
	.word	0x00000185
	.word	0x000003ea
	.word	0x00000187
	.word	0x000003ea
	.word	0x00000188
	.word	0x000003ea
	.word	0x0000018d
	.word	0x000003eb
	.word	0x00000000
	.word	0x000003eb
	.word	0x00000003
	.word	0x000003eb
	.word	0x00000004
	.word	0x000003eb
	.word	0x00000006
	.word	0x000003eb
	.word	0x0000000a
	.word	0x000003eb
	.word	0x0000000c
	.word	0x000003eb
	.word	0x0000000e
	.word	0x000003eb
	.word	0x0000000f
	.word	0x000003eb
	.word	0x00000019
	.word	0x000003eb
	.word	0x0000001b
	.word	0x000003eb
	.word	0x0000001c
	.word	0x000003eb
	.word	0x0000002c
	.word	0x000003eb
	.word	0x00000030
	.word	0x000003eb
	.word	0x00000032
	.word	0x000003eb
	.word	0x00000033
	.word	0x000003eb
	.word	0x00000034
	.word	0x000003eb
	.word	0x00000038
	.word	0x000003eb
	.word	0x0000003a
	.word	0x000003eb
	.word	0x00000041
	.word	0x000003eb
	.word	0x00000043
	.word	0x000003eb
	.word	0x00000050
	.word	0x000003eb
	.word	0x00000056
	.word	0x000003eb
	.word	0x0000005a
	.word	0x000003eb
	.word	0x00000066
	.word	0x000003eb
	.word	0x0000006a
	.word	0x000003eb
	.word	0x00000070
	.word	0x000003eb
	.word	0x00000071
	.word	0x000003eb
	.word	0x00000074
	.word	0x000003eb
	.word	0x00000079
	.word	0x000003eb
	.word	0x0000007a
	.word	0x000003eb
	.word	0x0000007c
	.word	0x000003eb
	.word	0x0000007e
	.word	0x000003eb
	.word	0x00000084
	.word	0x000003eb
	.word	0x00000085
	.word	0x000003eb
	.word	0x00000087
	.word	0x000003eb
	.word	0x0000008d
	.word	0x000003eb
	.word	0x00000091
	.word	0x000003eb
	.word	0x00000093
	.word	0x000003eb
	.word	0x0000009a
	.word	0x000003eb
	.word	0x0000009b
	.word	0x000003eb
	.word	0x0000009f
	.word	0x000003eb
	.word	0x000000a4
	.word	0x000003eb
	.word	0x000000b2
	.word	0x000003eb
	.word	0x000000c0
	.word	0x000003eb
	.word	0x000000c7
	.word	0x000003eb
	.word	0x000000d1
	.word	0x000003eb
	.word	0x000000de
	.word	0x000003eb
	.word	0x000000e6
	.word	0x000003eb
	.word	0x000000e7
	.word	0x000003eb
	.word	0x000000ea
	.word	0x000003eb
	.word	0x000000ef
	.word	0x000003eb
	.word	0x000000f7
	.word	0x000003eb
	.word	0x000000f8
	.word	0x000003eb
	.word	0x00000106
	.word	0x000003eb
	.word	0x00000107
	.word	0x000003eb
	.word	0x0000010c
	.word	0x000003eb
	.word	0x00000114
	.word	0x000003eb
	.word	0x00000116
	.word	0x000003eb
	.word	0x00000119
	.word	0x000003eb
	.word	0x0000011d
	.word	0x000003eb
	.word	0x00000125
	.word	0x000003eb
	.word	0x00000131
	.word	0x000003eb
	.word	0x00000139
	.word	0x000003eb
	.word	0x0000013d
	.word	0x000003eb
	.word	0x0000013e
	.word	0x000003eb
	.word	0x00000140
	.word	0x000003eb
	.word	0x00000149
	.word	0x000003eb
	.word	0x0000014c
	.word	0x000003eb
	.word	0x00000150
	.word	0x000003eb
	.word	0x00000152
	.word	0x000003eb
	.word	0x00000157
	.word	0x000003eb
	.word	0x00000159
	.word	0x000003eb
	.word	0x0000015c
	.word	0x000003eb
	.word	0x0000015f
	.word	0x000003eb
	.word	0x00000163
	.word	0x000003eb
	.word	0x00000164
	.word	0x000003eb
	.word	0x00000167
	.word	0x000003eb
	.word	0x0000016f
	.word	0x000003eb
	.word	0x00000170
	.word	0x000003eb
	.word	0x00000174
	.word	0x000003eb
	.word	0x00000175
	.word	0x000003eb
	.word	0x00000179
	.word	0x000003eb
	.word	0x00000183
	.word	0x000003eb
	.word	0x00000184
	.word	0x000003eb
	.word	0x0000018b
	.word	0x000003eb
	.word	0x0000018f
	.word	0x0000b121
	.word	0x0000b163
	.word	0x0000b181
	.word	0x0000b209
	.word	0x0000b289
	.word	0x0000b29f
	.word	0x0000b2b9
	.word	0x0000b2d1
	.word	0x0000b329
_global_impure_ptr:
	.word	0x0001d298


	.data

_impure_ptr:
	.word	0x0001d298
	.word	0x00000000
impure_data:
	.word	0x00000000
	.word	0x0001d584
	.word	0x0001d5ec
	.word	0x0001d654
	.word	0x00000001
	.word	0x00000000
	.word	0xabcd330e
	.word	0xe66d1234
	.word	0x0005deec
	.word	0x0000000b
__atexit_recursive_mutex:
	.word	0x0001e370


	.bss

__bss_start:
	.word	0x00000000
object.0:
array1:
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
