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
	ldr r1, =0x1b70a
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =0x00000000	
	cbz	r3, lab1
	ldr	r0, =0x000087a9	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	ldr r1, =0xf6ee4
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
	ldr	r0, =0x00008ec4	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	ldr r1, =0x384b3
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
	ldr	r0, =0x00008ec4	
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
	ldr	r2, =0x0001b268	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	ldr r1, =0x2af39
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
	ldr	r0, =0x0000879d	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x000087a9	
push {r1, r2}
	ldr r1, =0x6267d
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	atexit
lab7:	push {r1, r2}
	ldr r1, =0x6267d
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	bl	__libc_init_array
	push {r1, r2}
	ldr r1, =0x49ce7
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, r4
	movs	r1, r5
	bl	main
	push {r1, r2}
	ldr r1, =0x3416b
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	exit
	nop
	.ltorg
warm_caches:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
push {r1, r2}
	ldr r1, =0x647ac
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x647ac
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
	ldr r1, =0x2de48
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #46	
push {r1, r2}
	ldr r1, =0xea17b
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0xea17b
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x66cfe
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark_body:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab8
lab9: 	ldr	r3, =ArrayA_ref	
	mov	r0, r2
	mov	r1, r3
	mov	r3, #1600	
	mov	r2, r3
	bl	memcpy
	ldr	r2, =ArrayB	
	ldr	r3, =ArrayB_ref	
	mov	r0, r2
	mov	r1, r3
	mov	r3, #1600	
	mov	r2, r3
	bl	memcpy
	ldr	r2, =ResultArray	
	ldr	r1, =ArrayB	
	ldr	r0, =ArrayA	
	bl	Test
	push {r1, r2}
	ldr r1, =0x2d1e5
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab8: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab9
	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x86913
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
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
Test:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	Multiply
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0xc38a9
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
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
Multiply:
	push	{r4, r5, r6, r7}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r5, #0
	b	lab10
lab15: 	b	lab11
lab14: 	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #4
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r2
	movs	r2, #0
	str	r2, [r3, r4, lsl #2]
	movs	r6, #0
	b	lab12
lab13: 	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #4
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r2
	ldr	r1, [r3, r4, lsl #2]
	mov	r2, r5
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #4
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2
	ldr	r2, [r3, r6, lsl #2]
	mov	r0, r6
	mov	r3, r0
	lsls	r3, r3, #2
	add	r3, r0
	lsls	r3, r3, #4
	mov	r0, r3
	ldr	r3, [r7, #8]
	add	r3, r0
	ldr	r3, [r3, r4, lsl #2]
	mul	r2, r3, r2
	mov	r0, r5
	mov	r3, r0
	lsls	r3, r3, #2
	add	r3, r0
	lsls	r3, r3, #4
	mov	r0, r3
	ldr	r3, [r7, #4]
	add	r3, r0
	add	r2, r1
	str	r2, [r3, r4, lsl #2]
	adds	r6, #1
lab12: 	cmp	r6, #19
	ble	lab13
	adds	r4, #1
lab11: 	cmp	r4, #19
	ble	lab14
	adds	r5, #1
lab10: 	cmp	r5, #19
	ble	lab15
	nop
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r4, r5, r6, r7}
	bx	lr
	movs	r0, r0
initialise_benchmark:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	bl	InitSeed
	movs	r3, #0
	str	r3, [r7, #4]
	b	lab16
lab19: 	str	r3, [r7, #0]
	b	lab17
lab18: 	mov	r1, r0
	ldr	r0, =ArrayA_ref	
	ldr	r2, [r7, #4]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #0]
	add	r3, r2
	str	r1, [r0, r3, lsl #2]
	ldr	r3, [r7, #0]
	adds	r3, #1
	str	r3, [r7, #0]
lab17: 	ldr	r3, [r7, #0]
	cmp	r3, #19
	ble	lab18
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab16: 	ldr	r3, [r7, #4]
	cmp	r3, #19
	ble	lab19
	movs	r3, #0
	str	r3, [r7, #4]
	b	lab20
lab23: 	str	r3, [r7, #0]
	b	lab21
lab22: 	mov	r1, r0
	ldr	r0, =ArrayB_ref	
	ldr	r2, [r7, #4]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #0]
	add	r3, r2
	str	r1, [r0, r3, lsl #2]
	ldr	r3, [r7, #0]
	adds	r3, #1
	str	r3, [r7, #0]
lab21: 	ldr	r3, [r7, #0]
	cmp	r3, #19
	ble	lab22
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab20: 	ldr	r3, [r7, #4]
	cmp	r3, #19
	ble	lab23
	nop
	nop
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x616e7
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	.ltorg
verify_benchmark:
	push	{r7, lr}
	sub	sp, sp, #1608	
	add	r7, sp, #0
	add	r3, r7, #1608	
	subw	r3, r3, #1604	
	str	r0, [r3, #0]
	add	r3, r7, #1608	
	sub	r3, r3, #1600	
	ldr	r2, =_global_impure_ptr_2
	mov	r0, r3
	mov	r1, r2
	mov	r3, #1600	
	mov	r2, r3
	bl	memcpy
	add	r3, r7, #8
	mov	r2, #1600	
	mov	r1, r3
	ldr	r0, =ResultArray	
	bl	memcmp
	push {r1, r2}
	ldr r1, =0x111e5
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	add	r7, r7, #1608	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0xd2db0
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
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
	push {r1, r2}
	ldr r1, =0x510b9
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, #1
	bl	warm_caches
	push {r1, r2}
	ldr r1, =0xc4958
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	start_trigger
	bl	benchmark
	push {r1, r2}
	ldr r1, =0x90dbb
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
	push {r1, r2}
	ldr r1, =0x22ff2
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
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
	ldr r1, =0x3e635
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x00018ec8	
	ldr	r5, =0x00018ec8	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab24
	movs	r4, #0
lab25: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x59733
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0xe267d
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab25
lab24: 	ldr	r6, =0x00018ed0	
	ldr	r5, =0x00018ec8	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab26
	movs	r4, #0
lab27: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0xd9733
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x707dc
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab27
lab26:	cpsid f
	push {r1, r2}
	ldr r1, =0x2f695
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, r6, pc}
	.ltorg
memcmp:
	cmp	r2, #3
	push	{r4, lr}
	bls	lab28
	orr	ip, r0, r1
	tst	ip, #3
	mov	r4, r0
	mov	r3, r1
	bne	lab29
lab30: 	mov	r0, r4
	ldr	lr, [r1]
	ldr	ip, [r0]
	cmp	ip, lr
	add	r4, r4, #4
	add	r3, r3, #4
	bne	lab29
	subs	r2, #4
	cmp	r2, #3
	mov	r0, r4
	mov	r1, r3
	bhi	lab30
lab28: 	subs	r4, r2, #1
	cbz	r2, lab31
lab35: 	subs	r1, #1
	b	lab32
lab34: 	beq	lab33
lab32: 	ldrb	lr, [ip, #1]!
	ldrb	r2, [r1, #1]!
	cmp	lr, r2
	sub	r3, r4, ip
	beq	lab34
	sub	r0, lr, r2
	cpsid f
	push {r1, r2}
	ldr r1, =0x268d4
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, pc}
lab29: 	subs	r4, r2, #1
	b	lab35
lab33: 	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x668d4
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, pc}
lab31: 	mov	r0, r2
	cpsid f
	push {r1, r2}
	ldr r1, =0xa68d4
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, pc}
memcpy:
	mov	ip, r0
	orr	r3, r1, r0
	ands	r3, r3, #3
	bne	lab36
lab45: 	bcc	lab37
lab38: 	str	r3, [r0], #4
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
	bcs	lab38
lab37: 	adds	r2, #48	
	bcc	lab39
lab40: 	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #16
	bcs	lab40
lab39: 	adds	r2, #12
	bcc	lab41
lab42: 	str	r3, [r0], #4
	subs	r2, #4
	bcs	lab42
lab41: 	adds	r2, #4
	beq	lab43
	lsls	r2, r2, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab43
	ldrh	r3, [r1, #0]
	strh	r3, [r0, #0]
lab43: 	mov	r0, ip
	bx	lr
	nop
lab36: 	cmp	r2, #8
	bcc	lab44
	lsls	r3, r1, #30
	beq	lab45
	ands	r3, r0, #3
	beq	lab45
	rsb	r3, r3, #4
	subs	r2, r2, r3
	lsls	r3, r3, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab45
	ldrh	r3, [r1], #2
	strh	r3, [r0], #2
	b	lab45
lab44: 	subs	r2, #4
	bcc	lab41
lab46: 	ldrb	r3, [r1], #1
	strb	r3, [r0], #1
	bcs	lab46
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
	beq	lab47
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab48
	uxtb	r2, r1
	mov	r3, r0
	b	lab49
lab50: 	bcc	lab48
lab49: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab50
lab58: 	bls	lab51
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab52
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab53: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab53
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab54
lab59: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab55: 	cmp	r3, r2
	bne	lab55
	and	r4, ip, #3
lab51: 	cbz	r4, lab48
lab57: 	add	r4, r3
lab56: 	cmp	r4, r3
	bne	lab56
lab48:	cpsid f
	push {r1, r2}
	ldr r1, =0x07867
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, pc}
lab54: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab57
	b	lab48
lab47: 	mov	r3, r0
	mov	r4, r2
	b	lab58
lab52: 	mov	r2, r3
	mov	ip, r4
	b	lab59
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
	cbz	r6, lab60
	mov	r9, #1
	mov	sl, #0
lab66: 	subs	r5, r4, #1
	bmi	lab60
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab62: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab61
lab63: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab62
lab60: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab61: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab63
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab64
	blx	r2
lab69: 	cmp	r2, fp
	bne	lab65
lab68: 	cmp	r3, r6
	beq	lab63
	mov	r6, r3
	cmp	r6, #0
	bne	lab66
	b	lab60
lab64: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab67
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab68
lab65: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab66
	b	lab60
lab67: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab69
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =0x00018ed4	
	ldr	r5, =0x00018ed0	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab70
	subs	r3, #4
	add	r5, r3
lab71: 	ldr	r3, [r5], #-4
	cpsid f
	push {r1, r2}
	ldr r1, =0x02498
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r4, #0
	push {r1, r2}
	ldr r1, =0x32c0c
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab71
lab70: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab72
lab76: 	cmp	r5, #31
	bgt	lab73
	cbnz	r6, lab74
lab75: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab77:	cpsid f
	push {r1, r2}
	ldr r1, =0x055c6
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 lab74: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab75
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab75
lab72: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab76
lab73: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab77
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

_global_impure_ptr_2:
	.word	0x11589510
	.word	0x12c6850b
	.word	0x10a1f6f2
	.word	0x0c392f27
	.word	0x16cfd7a1
	.word	0x12093f19
	.word	0x14befcf3
	.word	0x126ac1da
	.word	0x147437b8
	.word	0x124df91f
	.word	0x11702f4a
	.word	0x0e5cac8e
	.word	0x0ddf9267
	.word	0x0eb17831
	.word	0x1394018e
	.word	0x0fb732f7
	.word	0x1350190b
	.word	0x13f27246
	.word	0x110bb083
	.word	0x1495eef8
	.word	0x0f08e7ab
	.word	0x13dfc78b
	.word	0x11d5bd33
	.word	0x0ec44d17
	.word	0x192ef9be
	.word	0x12e0e4b9
	.word	0x157002be
	.word	0x108e83b0
	.word	0x1345ba5b
	.word	0x131cd4d8
	.word	0x0ee53a4a
	.word	0x0efd9360
	.word	0x0e6f9cf4
	.word	0x0fb47378
	.word	0x14c13a13
	.word	0x1141312c
	.word	0x13962743
	.word	0x11edd75b
	.word	0x100df9f2
	.word	0x1238aa24
	.word	0x122c6b92
	.word	0x12d9a28f
	.word	0x0fb09343
	.word	0x0c742807
	.word	0x19271d0c
	.word	0x13f7bd32
	.word	0x14c6c622
	.word	0x10bf999b
	.word	0x11453bd2
	.word	0x0f7ab9b7
	.word	0x11992846
	.word	0x1287f543
	.word	0x0ef460f1
	.word	0x0ee90c79
	.word	0x12c7fbe3
	.word	0x0e16a400
	.word	0x12a628fb
	.word	0x12a19a4d
	.word	0x107366e3
	.word	0x1483209d
	.word	0x1116b3ed
	.word	0x136e2540
	.word	0x0f154ffa
	.word	0x0d5f7c12
	.word	0x151203b2
	.word	0x12457ea2
	.word	0x1348192c
	.word	0x0f71eac1
	.word	0x12579c9a
	.word	0x10d54d4a
	.word	0x10c1ab82
	.word	0x0eb7f567
	.word	0x0c64297f
	.word	0x0def5864
	.word	0x14417f3a
	.word	0x108734de
	.word	0x1311ad74
	.word	0x1253a22f
	.word	0x1151406c
	.word	0x116c1b3f
	.word	0x103f1b77
	.word	0x1682af58
	.word	0x122700c1
	.word	0x0fad14fc
	.word	0x165a9405
	.word	0x1365925e
	.word	0x187991dc
	.word	0x12aaed32
	.word	0x15473b77
	.word	0x126376c3
	.word	0x0cfe798a
	.word	0x103dd2df
	.word	0x0fdad75c
	.word	0x0fc787f6
	.word	0x15e835a4
	.word	0x1220e8f3
	.word	0x152d610c
	.word	0x1073ba1c
	.word	0x0efc4c8f
	.word	0x11f45513
	.word	0x103ec03c
	.word	0x132a0a7c
	.word	0x112f05c9
	.word	0x0ec455af
	.word	0x173d9917
	.word	0x13c8024a
	.word	0x1619eeeb
	.word	0x12cda5f7
	.word	0x15e86fb5
	.word	0x1297f18c
	.word	0x0f6d1f55
	.word	0x10200f3e
	.word	0x0f4d6593
	.word	0x111d7480
	.word	0x15a444b6
	.word	0x11070547
	.word	0x151493e8
	.word	0x1222062f
	.word	0x10629967
	.word	0x135a4b74
	.word	0x0de5309b
	.word	0x0d89eb50
	.word	0x0cacdc33
	.word	0x0bd64722
	.word	0x149565d2
	.word	0x120a40d5
	.word	0x0f1a31cd
	.word	0x0de702a9
	.word	0x0deebe0e
	.word	0x0d62f8d8
	.word	0x0bf1ef54
	.word	0x0ef2c4df
	.word	0x0df8bf80
	.word	0x0c9ea57d
	.word	0x10ba1395
	.word	0x0b0aa0b3
	.word	0x11ab10f1
	.word	0x1077ad2f
	.word	0x0f0ad589
	.word	0x109d0787
	.word	0x108d38a7
	.word	0x143e1ed0
	.word	0x1320dfce
	.word	0x124e314b
	.word	0x17da5f4f
	.word	0x13ee26ff
	.word	0x166daec8
	.word	0x11a480ba
	.word	0x15a2c1f4
	.word	0x153c4a3c
	.word	0x11858e99
	.word	0x0f975036
	.word	0x0f7a91df
	.word	0x0fada309
	.word	0x18d715b9
	.word	0x105f558b
	.word	0x16fb58d6
	.word	0x1801f8b1
	.word	0x134ebbe2
	.word	0x159f9056
	.word	0x0fecacca
	.word	0x1346b7d0
	.word	0x10a8709a
	.word	0x0c09461d
	.word	0x159d352c
	.word	0x13b6a211
	.word	0x16291f0b
	.word	0x11dc4ce8
	.word	0x13e308b5
	.word	0x0fc865c2
	.word	0x0cdea6f0
	.word	0x108a8238
	.word	0x0fbd5d53
	.word	0x0dfb079f
	.word	0x132ddbe3
	.word	0x0cf6e4d1
	.word	0x127fe858
	.word	0x12ed592e
	.word	0x0ea26dcd
	.word	0x1474904b
	.word	0x10c43302
	.word	0x13764ad1
	.word	0x0dead8b1
	.word	0x0e377761
	.word	0x11b47178
	.word	0x0fdf028c
	.word	0x14d5468e
	.word	0x0f7544aa
	.word	0x123dae7f
	.word	0x0fe0e8db
	.word	0x0c888a68
	.word	0x0fb8666d
	.word	0x0dcf4d8a
	.word	0x0f0471e9
	.word	0x117f6974
	.word	0x0d850af4
	.word	0x126e67e0
	.word	0x110f3fa0
	.word	0x0c48f82b
	.word	0x0e1b6f49
	.word	0x1130b37e
	.word	0x127f190f
	.word	0x10d997f6
	.word	0x0e8d71d4
	.word	0x196bb624
	.word	0x17192c9e
	.word	0x1462c88e
	.word	0x136faf69
	.word	0x14fee994
	.word	0x1312c727
	.word	0x11eb7dcb
	.word	0x10fa0c84
	.word	0x1033e900
	.word	0x1054ea1f
	.word	0x159109aa
	.word	0x0f0b4ff0
	.word	0x14c6f1b0
	.word	0x166676bc
	.word	0x12dec0df
	.word	0x1338f226
	.word	0x104b46cc
	.word	0x13a6eb37
	.word	0x1134baaf
	.word	0x0dfa3621
	.word	0x16c44972
	.word	0x14749b6d
	.word	0x141e264d
	.word	0x0f79c09d
	.word	0x11a0dec9
	.word	0x10f95e79
	.word	0x0c3cca3d
	.word	0x0ee09166
	.word	0x0f4c5bc6
	.word	0x0efe18df
	.word	0x1409641a
	.word	0x0edca8c6
	.word	0x13e1b69a
	.word	0x13a0aace
	.word	0x1095d4fd
	.word	0x11ebeb44
	.word	0x12fd4a87
	.word	0x12ce7ef0
	.word	0x0f88eee7
	.word	0x0ee6d8a5
	.word	0x14182932
	.word	0x12a51bfa
	.word	0x14aa335e
	.word	0x0f8ba52e
	.word	0x1724d576
	.word	0x141773c5
	.word	0x10e7eed2
	.word	0x0c681882
	.word	0x0df47259
	.word	0x0f79fe2d
	.word	0x160f82b7
	.word	0x0e80a35a
	.word	0x1684e575
	.word	0x1562a6d2
	.word	0x1118d3b2
	.word	0x13300003
	.word	0x0dae8825
	.word	0x0f233c5a
	.word	0x0d4abfb1
	.word	0x0c0ee433
	.word	0x12163bab
	.word	0x100091a4
	.word	0x11059b21
	.word	0x0c93cf1d
	.word	0x11259e08
	.word	0x10ad02d6
	.word	0x0d8d809e
	.word	0x0bc5048f
	.word	0x0d429e53
	.word	0x0ab382e7
	.word	0x124bcc44
	.word	0x0aa246a3
	.word	0x10c081b2
	.word	0x10ac28e8
	.word	0x0dffce06
	.word	0x1139a92f
	.word	0x11539f5b
	.word	0x12f0292e
	.word	0x11c11bcb
	.word	0x0cb8fd51
	.word	0x1bf88197
	.word	0x165f4f0e
	.word	0x137d6f3c
	.word	0x13f11130
	.word	0x1363af48
	.word	0x114e0497
	.word	0x0f2e78d1
	.word	0x10fb7510
	.word	0x0ea635fc
	.word	0x107d36e6
	.word	0x1348620b
	.word	0x1027a820
	.word	0x141caf7a
	.word	0x157556b0
	.word	0x10c79600
	.word	0x13bea65f
	.word	0x111c6b35
	.word	0x12aaf962
	.word	0x10162f41
	.word	0x0c677e3b
	.word	0x1912ab6a
	.word	0x13c86582
	.word	0x152f9819
	.word	0x12f54a03
	.word	0x147dbf90
	.word	0x1202a45b
	.word	0x126a5880
	.word	0x12a2e7fe
	.word	0x1008946c
	.word	0x11330967
	.word	0x16102ae1
	.word	0x0c383eaa
	.word	0x12f7540b
	.word	0x16eac4a8
	.word	0x12dca539
	.word	0x1692b95c
	.word	0x109c5404
	.word	0x15449174
	.word	0x12558f04
	.word	0x0ce10495
	.word	0x174c5803
	.word	0x15627991
	.word	0x15644e7e
	.word	0x1243d084
	.word	0x12cf3390
	.word	0x1040e402
	.word	0x0edde9c5
	.word	0x105dd422
	.word	0x104dc05a
	.word	0x0fd27459
	.word	0x13610ef0
	.word	0x12a4fb02
	.word	0x12e71834
	.word	0x11cb083e
	.word	0x10177fae
	.word	0x13d2de27
	.word	0x0ea40354
	.word	0x0fea6d02
	.word	0x0dfd120b
	.word	0x0c722881
	.word	0x15d62643
	.word	0x0feb0168
	.word	0x14d2a0a5
	.word	0x101a4ba3
	.word	0x14becbd4
	.word	0x1160b6d2
	.word	0x104157e8
	.word	0x0f7aed6a
	.word	0x0e119735
	.word	0x10ba099a
	.word	0x13f9106a
	.word	0x0a86dcab
	.word	0x0f7536ae
	.word	0x133cd148
	.word	0x0e1467b7
	.word	0x13a6a10e
	.word	0x0d80617a
	.word	0x103b0f55
	.word	0x102e84b0
	.word	0x0ce21e6b
	.word	0x17e6592b
	.word	0x1131c9fd
	.word	0x13d8b64e
	.word	0x142bbd99
	.word	0x139cf02d
	.word	0x13b162c9
	.word	0x1244a31f
	.word	0x1036124d
	.word	0x0de02f38
	.word	0x0f5a9259
	.word	0x143d3f15
	.word	0x0c14f5f3
	.word	0x131c4df1
	.word	0x17073d72
	.word	0x12cbc7e1
	.word	0x139fb402
	.word	0x0d66fa82
	.word	0x0dc93e7c
	.word	0x0e1f81d3
	.word	0x0e80100c
	.word	0x140bf180
	.word	0x12302368
	.word	0x0ecc2d20
	.word	0x0b6cad35
	.word	0x0e6809ad
	.word	0x0fae5c90
	.word	0x0bdab983
	.word	0x0a799fa5
	.word	0x0c122d5a
	.word	0x0a47096e
	.word	0x11a93e20
	.word	0x0c77f7f2
	.word	0x1376b60b
	.word	0x0f1453fc
	.word	0x0e3c7a77
	.word	0x1145498d
_global_impure_ptr:
	.word	0x00018ed8


	.data

impure_data:
	.word	0x00000000
	.word	0x000191c4
	.word	0x0001922c
	.word	0x00019294
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
	.word	0x0001b264


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
Seed:
	.word	0x00000000
ArrayA_ref:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
ArrayA:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
ArrayB_ref:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
ArrayB:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
ResultArray:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
