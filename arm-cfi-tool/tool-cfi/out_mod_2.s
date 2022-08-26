exit:
	push	{r4, lr}
	mov	r1, #0
	mov	r4, r0
	bl	__call_exitprocs
	push{r1, r2}
	mov.w r1, #5231
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [pc, #24]	; 8048 <exit+0x30>
	ldr	r0, [r3]
	ldr	r3, [r0, #60]	; 0x3c
	cmp	r3, #0
	movne	lr, pc
	bxne	r3
	mov	r0, r4
	bl	_exit
	andeq	r2, r1, r8, lsl #30
main:
	push	{lr}
	sub	sp, #12
	bl	initialise_board
	bl	initialise_benchmark
	movs	r0, #1
	push {r1, r2}
	mov.w r1, #3809
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	warm_caches
	push{r1, r2}
	mov.w r1, #3809
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	start_trigger
	push {r1, r2}
	mov.w r1, #1586
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark
	push{r1, r2}
	mov.w r1, #1586
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [sp, #4]
	bl	stop_trigger
	ldr	r0, [sp, #4]
	bl	verify_benchmark
	clz	r0, r0
	lsrs	r0, r0, #5
	add	sp, #12
	ldr.w	pc, [sp], #4
	nop
register_fini:
	ldr	r3, [pc, #24]	; 80a0 <register_fini+0x20>
	cmp	r3, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #3234
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxeq	lr
	push	{r4, lr}
	ldr	r0, [pc, #12]	; 80a4 <register_fini+0x24>
	push {r1, r2}
	mov.w r1, #1112
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	atexit
	push{r1, r2}
	mov.w r1, #1112
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	pop	{r4, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #385
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	andeq	r0, r0, r0
	andeq	pc, r0, r8, asr #6
__do_global_dtors_aux:
	push	{r4, lr}
	ldr	r4, [pc, #40]	; 80dc <__do_global_dtors_aux+0x34>
	ldrb	r3, [r4]
	cmp	r3, #0
	bne	lab0
	ldr	r3, [pc, #28]	; 80e0 <__do_global_dtors_aux+0x38>
	cmp	r3, #0
	ldrne	r0, [pc, #24]	; 80e4 <__do_global_dtors_aux+0x3c>
	movne	r0, r0
	mov	r3, #1
	strb	r3, [r4]
lab0: 	pop	{r4, lr}
	bx	lr
	muleq	r2, r0, ip
	andeq	r0, r0, r0
	ldrdeq	r3, [r1], -r0
frame_dummy:
	ldr	r3, [pc, #28]	; 810c <frame_dummy+0x24>
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldr	r1, [pc, #16]	; 8110 <frame_dummy+0x28>
	ldr	r0, [pc, #16]	; 8114 <frame_dummy+0x2c>
	nop			; (mov r0, r0)
	pop	{r4, lr}
	bx	lr
	andeq	r0, r0, r0
	muleq	r2, r4, ip
	ldrdeq	r3, [r1], -r0
_stack_init:
	mrs	r4, CPSR
	tst	r4, #15
	beq	lab1
	mov	r3, sp
	mov	r1, #209	; 0xd1
	msr	CPSR_c, r1
	mov	sp, r3
	sub	sl, sp, #4096	; 0x1000
	mov	r3, sl
	mov	r1, #215	; 0xd7
	msr	CPSR_c, r1
	mov	sp, r3
	sub	r3, r3, #4096	; 0x1000
	mov	r1, #219	; 0xdb
	msr	CPSR_c, r1
	mov	sp, r3
	sub	r3, r3, #4096	; 0x1000
	mov	r1, #210	; 0xd2
	msr	CPSR_c, r1
	mov	sp, r3
	sub	r3, r3, #8192	; 0x2000
	mov	r1, #211	; 0xd3
	msr	CPSR_c, r1
	mov	sp, r3
	sub	r3, r3, #32768	; 0x8000
	bic	r3, r3, #255	; 0xff
	bic	r3, r3, #65280	; 0xff00
	mov	r1, #223	; 0xdf
	msr	CPSR_c, r1
	mov	sp, r3
	orr	r4, r4, #192	; 0xc0
	msr	CPSR_c, r4
lab1: 	sub	sl, r3, #65536	; 0x10000
	bx	lr
_mainCRTStartup:
	ldr	r3, [pc, #148]	; 823c <_mainCRTStartup+0x9c>
	cmp	r3, #0
	ldreq	r3, [pc, #128]	; 8230 <_mainCRTStartup+0x90>
	mov	sp, r3
	bl	_stack_init
	movs	r1, #0
	mov	fp, r1
	mov	r7, r1
	ldr	r0, [pc, #120]	; 8240 <_mainCRTStartup+0xa0>
	ldr	r2, [pc, #120]	; 8244 <_mainCRTStartup+0xa4>
	subs	r2, r2, r0
	push {r1, r2}
	mov.w r1, #3519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
	push{r1, r2}
	mov.w r1, #3519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [pc, #92]	; 8234 <_mainCRTStartup+0x94>
	cmp	r3, #0
	beq	lab2
	mov	lr, pc
	mov	pc, r3
lab2: 	ldr	r3, [pc, #76]	; 8238 <_mainCRTStartup+0x98>
	cmp	r3, #0
	beq	lab3
	mov	lr, pc
	mov	pc, r3
lab3: 	movs	r0, #0
	movs	r1, #0
	movs	r4, r0
	movs	r5, r1
	ldr	r0, [pc, #56]	; 8248 <_mainCRTStartup+0xa8>
	cmp	r0, #0
	beq	lab4
	ldr	r0, [pc, #48]	; 824c <_mainCRTStartup+0xac>
	push {r1, r2}
	mov.w r1, #7867
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	atexit
lab4:	push{r1, r2}
	mov.w r1, #7867
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	bl	__libc_init_array
	push{r1, r2}
	mov.w r1, #137
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #137
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #137
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, r4
	movs	r1, r5
	blx	804c <main>
	bl	exit
	andeq	r0, r8, r0
	muleq	r2, r0, ip
	andeq	r4, r2, r8, ror #9
	andeq	sp, r0, r8, lsl #11
	andeq	pc, r0, r8, asr #6
md5:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub.w	sp, sp, #540	; 0x21c
	mov	r4, r1
	mov.w	r2, #256	; 0x100
	ldr	r1, [pc, #376]	; (83d8 <md5+0x188>)
	ldr	r7, [pc, #376]	; (83dc <md5+0x18c>)
	ldr.w	r8, [pc, #380]	; 83e0 <md5+0x190>
	ldr	r6, [pc, #380]	; (83e4 <md5+0x194>)
	ldr.w	r9, [pc, #380]	; 83e8 <md5+0x198>
	mov	sl, r0
	add	r0, sp, #24
	push {r1, r2}
	mov.w r1, #6980
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6980
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6980
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memcpy
	push{r1, r2}
	mov.w r1, #6980
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6980
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6980
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r1, [pc, #372]	; (83ec <md5+0x19c>)
	mov.w	r2, #256	; 0x100
	add	r0, sp, #280	; 0x118
	push {r1, r2}
	mov.w r1, #3621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memcpy
	push{r1, r2}
	mov.w r1, #3621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add.w	r3, r4, #8
	ldr	r2, [pc, #360]	; (83f0 <md5+0x1a0>)
	bic.w	r3, r3, #63	; 0x3f
	movs	r1, #1
	add.w	r0, r3, #120	; 0x78
	adds	r3, #56	; 0x38
	mov	fp, r3
	str	r3, [sp, #20]
	strd	r7, r8, [r2, #4]
	str	r6, [r2, #0]
	str.w	r9, [r2, #12]
	bl	calloc
	mov	r2, r4
	mov	r5, r0
	mov	r1, sl
	push {r1, r2}
	mov.w r1, #4542
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4542
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4542
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memcpy
	push{r1, r2}
	mov.w r1, #4542
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4542
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4542
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r3, #128	; 0x80
	strb	r3, [r5, r4]
	mov	r3, fp
	lsls	r4, r4, #3
	cmp	r3, #0
	str.w	r4, [r5, fp]
	ble.w	lab5
	strd	r7, r6, [sp, #4]
	str.w	r8, [sp, #12]
	mov.w	r8, #0
lab13: 	ldmia	r0, {r0, r3, r6}
	add.w	sl, sp, #280	; 0x118
	add.w	lr, sp, #24
	mov	ip, r9
	movs	r4, #1
	movs	r1, #0
	str.w	r9, [sp, #16]
	b.n	lab6
lab8: 	and.w	r7, r7, #15
lab11: 	ldr.w	r2, [lr]
	add.w	r7, r5, r7, lsl #2
	add	r3, r9
	ldr.w	r7, [r7, r8]
	add	fp, r3
	add	fp, r7
	rsb	r2, r2, #32
	ror.w	fp, fp, r2
	add	fp, r0
lab12: 	adds	r1, #1
	mov	ip, r6
	adds	r4, #1
	mov	r6, r0
	add.w	sl, sl, #4
	add.w	lr, lr, #4
	mov	r0, fp
lab6: 	cmp	r1, #15
	bls.n	lab7
	eor.w	fp, r0, r6
	add.w	r7, r4, r4, lsl #2
	cmp	r1, #31
	and.w	fp, fp, ip
	sub.w	r7, r7, #4
	bls.n	lab8
	add.w	r7, r4, r4, lsl #1
	cmp	r1, #47	; 0x2f
	eor.w	fp, r0, r6
	add.w	r7, r7, #2
	bhi.n	lab9
	eor.w	fp, fp, ip
	and.w	r7, r7, #15
	b.n	lab10
lab7: 	eor.w	fp, r6, ip
	and.w	fp, fp, r0
	eor.w	fp, fp, ip
	mov	r7, r1
	b.n	lab11
lab9: 	rsb	fp, r1, r1, lsl #3
	and.w	fp, fp, #15
	ldr.w	r7, [sl]
	add.w	fp, r5, fp, lsl #2
	orn	r2, r0, ip
	add	r3, r7
	eors	r2, r6
	ldr.w	r7, [fp, r8]
	add	r3, r2
	add.w	fp, r3, r7
	ldr.w	r3, [lr]
	rsb	r7, r3, #32
	ror.w	fp, fp, r7
	cmp	r4, #64	; 0x40
	add	fp, r0
	bne.n	lab12
	ldr	r3, [sp, #8]
	ldr.w	r9, [sp, #16]
	add	r3, ip
	str	r3, [sp, #8]
	ldr	r3, [sp, #4]
	add	r3, fp
	str	r3, [sp, #4]
	ldr	r3, [sp, #12]
	add	r3, r0
	str	r3, [sp, #12]
	ldr	r3, [sp, #20]
	add.w	r8, r8, #64	; 0x40
	cmp	r3, r8
	add	r9, r6
	bgt.n	lab13
	ldr	r3, [pc, #52]	; (83f0 <md5+0x1a0>)
	ldr	r2, [sp, #8]
	str	r2, [r3, #0]
	ldr	r2, [sp, #4]
	str	r2, [r3, #4]
	ldr	r2, [sp, #12]
	strd	r2, r9, [r3, #8]
lab5: 	mov	r0, r5
	add.w	sp, sp, #540	; 0x21c
	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b.w	free
	nop
	andeq	r2, r1, r0, ror ip
	svc	0x00cdab89
	ldmls	sl!, {r1, r2, r3, r4, r5, r6, r7, sl, fp, ip, lr, pc}
	strbvs	r2, [r5, -r1, lsl #6]
	eorsne	r5, r2, r6, ror r4
	andeq	r2, r1, r0, ror sp
	andeq	r3, r2, ip, lsr #25
benchmark_body.constprop.0:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
	subs.w	r8, r0, #0
	ldr	r4, [pc, #148]	; (8494 <benchmark_body.constprop.0+0xa0>)
	sub	sp, #12
	ble.n	lab14
	ldr	r7, [pc, #148]	; (8498 <benchmark_body.constprop.0+0xa4>)
	movs	r6, #0
	add.w	r9, r4, #16
lab16: 	mov	r0, r9
	bl	init_heap_beebs
	push{r1, r2}
	mov.w r1, #7290
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov.w	r0, #1000	; 0x3e8
	bl	malloc_beebs
	movs	r1, #0
	mov	r5, r0
	subs	r3, r0, #1
lab15: 	adds	r1, #1
	cmp.w	r1, #1000	; 0x3e8
	bne.n	lab15
	mov	r0, r5
	bl	md5
	mov	r0, r5
	bl	free_beebs
	ldrb	r0, [r4, #3]
	ldrb	r3, [r4, #2]
	ldrb	r2, [r4, #1]
	ldrb	r1, [r4, #0]
	str	r0, [sp, #0]
	mov	r0, r7
	bl	printf
	ldrb	r0, [r4, #7]
	ldrb	r3, [r4, #6]
	ldrb	r2, [r4, #5]
	ldrb	r1, [r4, #4]
	str	r0, [sp, #0]
	mov	r0, r7
	bl	printf
	ldrb	r0, [r4, #11]
	ldrb	r3, [r4, #10]
	ldrb	r2, [r4, #9]
	ldrb	r1, [r4, #8]
	str	r0, [sp, #0]
	mov	r0, r7
	bl	printf
	ldrb	r5, [r4, #15]
	ldrb	r3, [r4, #14]
	ldrb	r2, [r4, #13]
	ldrb	r1, [r4, #12]
	ldr	r0, [pc, #40]	; (849c <benchmark_body.constprop.0+0xa8>)
	str	r5, [sp, #0]
	adds	r6, #1
	bl	printf
	cmp	r6, r8
	bne.n	lab16
lab14: 	ldrd	r3, r1, [r4]
	ldrd	r2, r0, [r4, #8]
	add	r3, r1
	add	r3, r2
	add	r0, r3
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #4252
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
	andeq	r3, r2, ip, lsr #25
	andeq	r2, r1, r0, asr #24
	andeq	r2, r1, r8, asr ip
initialise_benchmark:
	bx	lr
	nop
warm_caches:
	b.n	benchmark_body.constprop.0
	nop
benchmark:
	movs	r0, #51	; 0x33
	b.n	benchmark_body.constprop.0
verify_benchmark:
	movs	r0, #0
	bx	lr
initialise_board:
	mov.w	r2, #3758153728	; 0xe000e000
	ldr	r1, [pc, #16]	; (84c8 <initialise_board+0x18>)
	ldr.w	r3, [r2, #3580]	; 0xdfc
	movs	r0, #0
	orr.w	r3, r3, #16777216	; 0x1000000
	str.w	r3, [r2, #3580]	; 0xdfc
	str	r0, [r1, #4]
	bx	lr
	and	r1, r0, r0
start_trigger:
	ldr	r2, [pc, #8]	; (84d8 <start_trigger+0xc>)
	ldr	r3, [r2, #0]
	orr.w	r3, r3, #1
	str	r3, [r2, #0]
	bx	lr
	and	r1, r0, r0
stop_trigger:
	ldr	r3, [pc, #12]	; (84ec <stop_trigger+0x10>)
	movs	r2, #0
	str	r2, [r3, #4]
	ldr	r2, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
	bx	lr
	and	r1, r0, r0
rand_beebs:
	ldr	r3, [pc, #20]	; (8508 <rand_beebs+0x18>)
	ldr	r1, [pc, #24]	; (850c <rand_beebs+0x1c>)
	ldr	r2, [r3, #0]
	movw	r0, #12345	; 0x3039
	mla	r0, r1, r2, r0
	bic.w	r0, r0, #2147483648	; 0x80000000
	str	r0, [r3, #0]
	lsrs	r0, r0, #16
	bx	lr
	andeq	r4, r2, ip, lsl #9
	bicmi	r4, r6, sp, ror #28
srand_beebs:
	ldr	r3, [pc, #4]	; (8518 <srand_beebs+0x8>)
	str	r0, [r3, #0]
	bx	lr
	nop
	andeq	r4, r2, ip, lsl #9
init_heap_beebs:
	ands.w	r2, r1, #3
	push	{r3, lr}
	bne.n	lab17
	ldr	r3, [pc, #20]	; (853c <init_heap_beebs+0x20>)
	add	r1, r0
	strd	r0, r1, [r3, #4]
	str	r2, [r3, #12]
	cpsid f
	push {r1, r2}
	mov.w r1, #2309
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r3, pc}
lab17: 	ldr	r3, [pc, #12]	; (8540 <init_heap_beebs+0x24>)
	ldr	r2, [pc, #16]	; (8544 <init_heap_beebs+0x28>)
	ldr	r0, [pc, #16]	; (8548 <init_heap_beebs+0x2c>)
	movs	r1, #65	; 0x41
	bl	__assert_func
	andeq	r4, r2, ip, lsl #9
	andeq	r2, r1, r0, ror lr
	; <UNDEFINED> instruction: 0x00012eb8
	muleq	r1, r0, lr
check_heap_beebs:
	ldr	r3, [pc, #16]	; (8560 <check_heap_beebs+0x14>)
	ldrd	r3, r2, [r3, #8]
	add	r0, r2
	cmp	r3, r0
	ite	cc
	movcc	r0, #0
	movcs	r0, #1
	bx	lr
	nop
	andeq	r4, r2, ip, lsl #9
malloc_beebs:
	mov	r3, r0
	cbz	r0, lab18
	ldr	r2, [pc, #40]	; (8594 <malloc_beebs+0x30>)
	ldr	r0, [r2, #4]
	ldr.w	ip, [r2, #12]
	adds	r1, r0, r3
	add	r3, ip
	ands.w	ip, r1, #3
	itt	ne
	rsbne	ip, ip, #4
	addne	r3, ip
	str	r3, [r2, #12]
	ldr	r3, [r2, #8]
	it	ne
	addne	r1, ip
	cmp	r3, r1
	bcc.n	lab19
	str	r1, [r2, #4]
	bx	lr
lab19: 	movs	r0, #0
	bx	lr
	andeq	r4, r2, ip, lsl #9
calloc_beebs:
	mul.w	r2, r1, r0
	push	{r4, lr}
	cbz	r2, lab20
	ldr	r3, [pc, #52]	; (85d8 <calloc_beebs+0x40>)
	ldr	r4, [r3, #4]
	ldr	r0, [r3, #12]
	adds	r1, r4, r2
	ands.w	ip, r1, #3
	add	r0, r2
	itt	ne
	rsbne	ip, ip, #4
	addne	r0, ip
	str	r0, [r3, #12]
	ldr	r0, [r3, #8]
	it	ne
	addne	r1, ip
	cmp	r0, r1
	bcc.n	lab21
	str	r1, [r3, #4]
	cbz	r4, lab22
	movs	r1, #0
	mov	r0, r4
	push {r1, r2}
	mov.w r1, #6621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
lab22:	push{r1, r2}
	mov.w r1, #6621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	mov	r0, r4
	pop	{r4, pc}
lab21: 	movs	r4, #0
	mov	r0, r4
	pop	{r4, pc}
	andeq	r4, r2, ip, lsl #9
realloc_beebs:
	cbz	r0, lab23
	push	{r3, r4, r5, lr}
	mov	r4, r0
	mov	r0, r1
	mov	r5, r1
	bl	malloc_beebs
	cbz	r0, lab24
	cbz	r5, lab25
	subs	r2, r5, #1
	subs	r3, r4, #1
	add.w	ip, r0, #4294967295	; 0xffffffff
	add	r2, r4
lab26: 	strb.w	r1, [ip, #1]!
	cmp	r3, r2
	bne.n	lab26
lab25: 	pop	{r3, r4, r5, pc}
lab24: 	movs	r0, #0
	pop	{r3, r4, r5, pc}
lab23: 	movs	r0, #0
	bx	lr
	nop
free_beebs:
	bx	lr
	nop
__assert_func:
	ldr	ip, [pc, #68]	; 8660 <__assert_func+0x4c>
	ldr	ip, [ip]
	ldr	r5, [ip, #12]
	subs	ip, r2, #0
	push	{lr}		; (str lr, [sp, #-4]!)
	mov	lr, r1
	ldreq	r1, [pc, #48]	; 8664 <__assert_func+0x50>
	moveq	ip, r1
	ldrne	r1, [pc, #44]	; 8668 <__assert_func+0x54>
	sub	sp, sp, #20
	mov	r2, r3
	str	ip, [sp, #8]
	mov	r3, r0
	str	r1, [sp, #4]
	str	lr, [sp]
	ldr	r1, [pc, #20]	; 866c <__assert_func+0x58>
	mov	r0, r5
	bl	fiprintf
	push{r1, r2}
	mov.w r1, #7413
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	abort
	andeq	r3, r2, r0, ror #5
	ldrdeq	r2, [r1], -r4
	andeq	r2, r1, r8, asr #29
	ldrdeq	r2, [r1], -r8
calloc:
	mov	r3, r0
	push	{r4, lr}
	mov	r2, r1
	ldr	r1, [pc, #16]	; 8694 <calloc+0x24>
	ldr	r0, [r1]
	mov	r1, r3
	push {r1, r2}
	mov.w r1, #694
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #694
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_calloc_r
	push{r1, r2}
	mov.w r1, #694
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #694
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	pop	{r4, lr}
	bx	lr
	andeq	r3, r2, r0, ror #5
_calloc_r:
	mov	r3, r1
	push	{r4, r5, r6, lr}
	mov	r4, #0
	umull	r1, r5, r3, r2
	cmp	r5, r4
	bne	lab27
	push {r1, r2}
	mov.w r1, #5073
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5073
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5073
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5073
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_malloc_r
	push{r1, r2}
	mov.w r1, #5073
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5073
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5073
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5073
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r4, r0, #0
	beq	lab28
	ldr	r2, [r4, #-4]
	bic	r2, r2, #3
	sub	r2, r2, #4
	cmp	r2, #36	; 0x24
	bhi	lab29
	cmp	r2, #19
	movls	r2, r4
	bls	lab30
	cmp	r2, #27
	str	r5, [r4]
	str	r5, [r4, #4]
	addls	r2, r4, #8
	bhi	lab31
lab30: 	mov	r3, #0
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
lab33: 	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #5784
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab29: 	mov	r1, r5
	push {r1, r2}
	mov.w r1, #1904
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1904
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1904
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1904
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1904
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
	push{r1, r2}
	mov.w r1, #1904
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1904
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1904
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1904
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1904
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r0, r4
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #722
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab31: 	mov	r3, #0
	cmp	r2, #36	; 0x24
	addne	r2, r4, #16
	addeq	r2, r4, #24
	str	r5, [r4, #8]
	str	r5, [r4, #12]
	streq	r5, [r4, #16]
	streq	r5, [r4, #20]
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	b	lab32
lab27: 	bl	__errno
	mov	r3, #12
	str	r3, [r0]
	b	lab33
__errno:
	ldr	r3, [pc, #4]	; 876c <__errno+0xc>
	ldr	r0, [r3]
	bx	lr
	andeq	r3, r2, r0, ror #5
fiprintf:
	push	{r1, r2, r3}
	push	{lr}		; (str lr, [sp, #-4]!)
	mov	r1, r0
	ldr	r0, [pc, #36]	; 87a8 <fiprintf+0x38>
	sub	sp, sp, #8
	add	r3, sp, #16
	ldr	r2, [sp, #12]
	ldr	r0, [r0]
	str	r3, [sp, #4]
	push {r1, r2}
	mov.w r1, #613
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #613
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_vfiprintf_r
	push{r1, r2}
	mov.w r1, #613
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #613
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	sp, sp, #8
	pop	{lr}		; (ldr lr, [sp], #4)
	add	sp, sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #2037
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	andeq	r3, r2, r0, ror #5
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, [pc, #108]	; 8824 <__libc_init_array+0x78>
	ldr	r5, [pc, #108]	; 8828 <__libc_init_array+0x7c>
	sub	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab34
	mov	r4, #0
	sub	r5, r5, #4
lab35: 	add	r4, r4, #1
	mov	lr, pc
	bx	r3
	cmp	r6, r4
	bne	lab35
lab34: 	ldr	r6, [pc, #64]	; 882c <__libc_init_array+0x80>
	ldr	r5, [pc, #64]	; 8830 <__libc_init_array+0x84>
	sub	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab36
	mov	r4, #0
	sub	r5, r5, #4
lab37: 	add	r4, r4, #1
	mov	lr, pc
	bx	r3
	cmp	r6, r4
	bne	lab37
lab36: 	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #5986
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	ldrdeq	r3, [r2], -r4
	ldrdeq	r3, [r2], -r4
	ldrdeq	r3, [r2], -ip
	ldrdeq	r3, [r2], -r4
free:
	push	{r4, lr}
	ldr	r3, [pc, #16]	; 8850 <free+0x1c>
	mov	r1, r0
	ldr	r0, [r3]
	bl	_free_r
	pop	{r4, lr}
	bx	lr
	andeq	r3, r2, r0, ror #5
_malloc_r:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	r3, r1, #11
	cmp	r3, #22
	mov	r7, r0
	sub	sp, sp, #12
	bhi	lab38
	cmp	r1, #16
	bhi	lab39
	push {r1, r2}
	mov.w r1, #3619
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_lock
	push{r1, r2}
	mov.w r1, #3619
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r5, #16
	mov	r2, #24
	mov	ip, #2
lab91: 	add	r2, r8, r2
	ldr	r4, [r2, #4]
	sub	r3, r2, #8
	cmp	r4, r3
	beq	lab40
lab51: 	ldr	r2, [r4, #12]
	ldr	r1, [r4, #8]
	bic	r3, r3, #3
	add	r3, r4, r3
	str	r2, [r1, #12]
	str	r1, [r2, #8]
	ldr	r2, [r3, #4]
	orr	r2, r2, #1
	mov	r0, r7
	str	r2, [r3, #4]
	add	r4, r4, #8
	push {r1, r2}
	mov.w r1, #2639
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
lab92:	push{r1, r2}
	mov.w r1, #2639
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6593
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab38: 	bic	r5, r3, #7
	cmp	r1, r5
	movls	r1, #0
	movhi	r1, #1
	orrs	r3, r1, r3, lsr #31
	bne	lab41
	push {r1, r2}
	mov.w r1, #515
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_lock
	push{r1, r2}
	mov.w r1, #515
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r5, #504	; 0x1f8
	bcc	lab42
	lsrs	r3, r5, #9
	beq	lab43
	cmp	r3, #4
	bhi	lab44
	lsr	r3, r5, #6
	add	ip, r3, #57	; 0x39
	add	lr, r3, #56	; 0x38
	lsl	r0, ip, #3
lab118: 	add	r0, r8, r0
	ldr	r3, [r0, #4]
	sub	r0, r0, #8
	cmp	r0, r3
	bne	lab45
	b	lab46
lab49: 	bge	lab47
	ldr	r3, [r3, #12]
	cmp	r0, r3
	beq	lab48
lab45: 	ldr	r2, [r3, #4]
	bic	r2, r2, #3
	sub	r1, r2, r5
	cmp	r1, #15
	ble	lab49
	mov	ip, lr
	b	lab50
lab41: 	mov	r4, #0
	mov	r3, #12
	mov	r0, r4
	str	r3, [r7]
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #557
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab40: 	ldr	r4, [r2, #12]
	cmp	r2, r4
	addeq	ip, ip, #2
	bne	lab51
lab50: 	ldr	r4, [r8, #16]
	ldr	lr, [pc, #1696]	; 9048 <_malloc_r+0x7f4>
	cmp	r4, lr
	ldreq	r6, [r8, #4]
	beq	lab52
	ldr	r1, [r4, #4]
	bic	r1, r1, #3
	sub	r3, r1, r5
	cmp	r3, #15
	bgt	lab53
	cmp	r3, #0
	str	lr, [r8, #20]
	str	lr, [r8, #16]
	bge	lab54
	cmp	r1, #512	; 0x200
	bcs	lab55
	mov	r2, #1
	ldr	r6, [r8, #4]
	lsr	r3, r1, #3
	add	r3, r3, r2
	lsr	r1, r1, #5
	orr	r6, r6, r2, lsl r1
	ldr	r1, [r8, r3, lsl #3]
	add	r2, r8, r3, lsl #3
	sub	r2, r2, #8
	str	r1, [r4, #8]
	str	r2, [r4, #12]
	str	r6, [r8, #4]
	str	r4, [r8, r3, lsl #3]
	str	r4, [r1, #12]
lab84: 	asr	r3, ip, #2
	lsl	r1, r1, r3
	cmp	r1, r6
	bls	lab56
lab99: 	ldr	r6, [r4, #4]
	bic	r6, r6, #3
	cmp	r5, r6
	movls	r2, #0
	movhi	r2, #1
	sub	r3, r6, r5
	cmp	r3, #15
	orrle	r2, r2, #1
	cmp	r2, #0
	beq	lab57
	ldr	sl, [pc, #1520]	; 904c <_malloc_r+0x7f8>
	ldr	r3, [pc, #1520]	; 9050 <_malloc_r+0x7fc>
	ldr	r2, [sl]
	ldr	r3, [r3]
	cmn	r2, #1
	add	r3, r5, r3
	addne	r3, r3, #4096	; 0x1000
	addne	r3, r3, #15
	bicne	r9, r3, #4080	; 0xff0
	addeq	r9, r3, #16
	bicne	r9, r9, #15
	mov	r1, r9
	mov	r0, r7
	push {r1, r2}
	mov.w r1, #7019
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7019
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_sbrk_r
	push{r1, r2}
	mov.w r1, #7019
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7019
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmn	r0, #1
	mov	r2, r0
	add	fp, r4, r6
	beq	lab58
	cmp	r4, r8
	cmpne	fp, r0
	bhi	lab59
	ldr	r3, [pc, #1444]	; 9054 <_malloc_r+0x800>
	ldr	r1, [r3]
	cmp	fp, r0
	add	r1, r9, r1
	str	r1, [r3]
	beq	lab60
lab103: 	cmn	r0, #1
	subne	fp, r2, fp
	addne	r1, fp, r1
	streq	r2, [sl]
	strne	r1, [r3]
	ands	fp, r2, #7
	bne	lab61
	add	r1, r2, r9
	rsb	r1, r1, #0
	lsl	sl, r1, #20
	lsr	sl, sl, #20
	mov	r1, sl
	mov	r0, r7
	str	r2, [sp, #4]
	push {r1, r2}
	mov.w r1, #297
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #297
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_sbrk_r
	push{r1, r2}
	mov.w r1, #297
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #297
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmn	r0, #1
	moveq	sl, fp
	ldr	r2, [sp, #4]
	ldr	r3, [pc, #1344]	; 9054 <_malloc_r+0x800>
	beq	lab62
lab95: 	add	r9, r0, sl
lab96: 	orr	r9, r9, #1
	add	r1, sl, r1
	cmp	r4, r8
	str	r2, [r8, #8]
	str	r1, [r3]
	str	r9, [r2, #4]
	beq	lab63
	cmp	r6, #15
	movls	r3, #1
	strls	r3, [r2, #4]
	bls	lab64
	mov	lr, #5
	ldr	ip, [r4, #4]
	sub	r0, r6, #12
	bic	r0, r0, #7
	and	ip, ip, #1
	orr	ip, ip, r0
	cmp	r0, #15
	add	r0, r4, r0
	str	ip, [r4, #4]
	str	lr, [r0, #4]
	str	lr, [r0, #8]
	bhi	lab65
	mov	r4, r2
	ldr	r9, [r2, #4]
lab116: 	ldr	r2, [r3]
	cmp	r2, r1
	strcc	r1, [r3]
	ldr	r3, [pc, #1216]	; 905c <_malloc_r+0x808>
	ldr	r2, [r3]
	cmp	r2, r1
	strcc	r1, [r3]
lab105: 	sub	r3, r9, r5
	cmp	r3, #15
	movgt	r2, #0
	movle	r2, #1
	cmp	r5, r9
	orrhi	r2, r2, #1
	cmp	r2, #0
	beq	lab66
lab64: 	mov	r0, r7
	push {r1, r2}
	mov.w r1, #6208
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #6208
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r4, #0
	b	lab67
lab43: 	mov	r0, #512	; 0x200
	mov	ip, #64	; 0x40
	mov	lr, #63	; 0x3f
	b	lab68
lab56: 	tst	r1, r6
	bne	lab69
	lsl	r1, r1, #1
	bic	ip, ip, #3
	tst	r1, r6
	add	ip, ip, #4
	bne	lab70
lab71: 	tst	r1, r6
	add	ip, ip, #4
	beq	lab71
lab102: 	mov	r0, r9
	mov	r4, ip
lab88: 	cmp	r0, r6
	bne	lab72
	b	lab73
lab76: 	bge	lab74
	ldr	r6, [r6, #12]
	cmp	r0, r6
	beq	lab75
lab72: 	ldr	r3, [r6, #4]
	bic	r3, r3, #3
	sub	r2, r3, r5
	cmp	r2, #15
	ble	lab76
	add	r4, r6, #8
	ldm	r4, {r4, ip}
	add	r1, r6, r5
	orr	r5, r5, #1
	str	r5, [r6, #4]
	str	ip, [r4, #12]
	str	r4, [ip, #8]
	orr	ip, r2, #1
	str	r1, [r8, #20]
	str	r1, [r8, #16]
	mov	r0, r7
	str	lr, [r1, #12]
	str	lr, [r1, #8]
	str	ip, [r1, #4]
	str	r2, [r6, r3]
	push {r1, r2}
	mov.w r1, #6319
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #6319
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r4, r6, #8
	b	lab77
lab54: 	add	r1, r4, r1
	ldr	r3, [r1, #4]
	orr	r3, r3, #1
	mov	r0, r7
	str	r3, [r1, #4]
	push {r1, r2}
	mov.w r1, #5221
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #5221
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r4, r4, #8
	b	lab78
lab66: 	add	r2, r4, r5
	orr	r3, r3, #1
	orr	r5, r5, #1
	str	r5, [r4, #4]
	mov	r0, r7
	str	r2, [r8, #8]
	add	r4, r4, #8
	str	r3, [r2, #4]
	push {r1, r2}
	mov.w r1, #2315
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #2315
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r0, r4
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #7597
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab47: 	ldr	r1, [r3, #12]
	ldr	ip, [r3, #8]
	add	r2, r3, r2
	str	r1, [ip, #12]
	str	ip, [r1, #8]
	ldr	r1, [r2, #4]
	add	r4, r3, #8
	orr	r3, r1, #1
	mov	r0, r7
	str	r3, [r2, #4]
	push {r1, r2}
	mov.w r1, #6620
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #6620
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r0, r4
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #5117
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab55: 	cmp	r1, #2560	; 0xa00
	lsr	r3, r1, #9
	bcc	lab79
	cmp	r3, #20
	bhi	lab80
	add	r2, r3, #92	; 0x5c
	lsl	r2, r2, #3
	add	r3, r3, #91	; 0x5b
lab117: 	add	r2, r8, r2
	sub	r2, r2, #8
	cmp	r2, r0
	beq	lab81
lab83: 	bic	r3, r3, #3
	cmp	r3, r1
	bls	lab82
	ldr	r0, [r0, #8]
	cmp	r2, r0
	bne	lab83
lab82: 	ldr	r2, [r0, #12]
	ldr	r6, [r8, #4]
lab106: 	str	r0, [r4, #8]
	str	r4, [r2, #8]
	str	r4, [r0, #12]
	b	lab84
lab44: 	cmp	r3, #20
	bls	lab85
	cmp	r3, #84	; 0x54
	bhi	lab86
	lsr	r3, r5, #12
	add	ip, r3, #111	; 0x6f
	add	lr, r3, #110	; 0x6e
	lsl	r0, ip, #3
	b	lab87
lab75: 	add	r4, r4, #1
	tst	r4, #3
	add	r0, r0, #8
	bne	lab88
	b	lab89
lab74: 	mov	r4, r6
	add	r3, r6, r3
	ldr	r2, [r3, #4]
	orr	r2, r2, #1
	ldr	r1, [r6, #12]
	str	r2, [r3, #4]
	ldr	r3, [r4, #8]!
	mov	r0, r7
	str	r1, [r3, #12]
	str	r3, [r1, #8]
	push {r1, r2}
	mov.w r1, #2414
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #2414
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab90
lab42: 	lsr	ip, r5, #3
	add	r2, r5, #8
	b	lab91
lab53: 	add	r2, r4, r5
	orr	ip, r3, #1
	orr	r5, r5, #1
	str	r5, [r4, #4]
	mov	r0, r7
	str	r2, [r8, #20]
	str	r2, [r8, #16]
	str	lr, [r2, #12]
	str	lr, [r2, #8]
	str	ip, [r2, #4]
	str	r3, [r4, r1]
	push {r1, r2}
	mov.w r1, #7950
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #7950
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r4, r4, #8
	b	lab92
lab79: 	lsr	r3, r1, #6
	add	r2, r3, #57	; 0x39
	lsl	r2, r2, #3
	add	r3, r3, #56	; 0x38
	b	lab93
lab85: 	add	ip, r3, #92	; 0x5c
	add	lr, r3, #91	; 0x5b
	lsl	r0, ip, #3
	b	lab94
lab61: 	rsb	r1, fp, #8
	add	r2, r2, r1
	rsb	r1, fp, #4096	; 0x1000
	add	r9, r2, r9
	add	r1, r1, #8
	sub	r1, r1, r9
	lsl	sl, r1, #20
	lsr	sl, sl, #20
	mov	r1, sl
	mov	r0, r7
	str	r2, [sp, #4]
	push {r1, r2}
	mov.w r1, #6223
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6223
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_sbrk_r
	push{r1, r2}
	mov.w r1, #6223
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6223
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmn	r0, #1
	ldr	r2, [sp, #4]
	ldr	r3, [pc, #424]	; 9054 <_malloc_r+0x800>
	bne	lab95
	sub	fp, fp, #8
	add	r9, r9, fp
	mov	sl, #0
	sub	r9, r9, r2
	b	lab96
lab98: 	cmp	r3, r9
	sub	ip, ip, #1
	bne	lab97
lab89: 	tst	ip, #3
	bne	lab98
	ldr	r3, [r8, #4]
	bic	r3, r3, r1
	str	r3, [r8, #4]
lab119: 	movne	r2, #1
	moveq	r2, #0
	cmp	r1, r3
	movhi	r2, #0
	andls	r2, r2, #1
	cmp	r2, #0
	beq	lab99
	tst	r1, r3
	bne	lab100
lab101: 	tst	r1, r3
	add	r4, r4, #4
	beq	lab101
lab100: 	mov	ip, r4
	b	lab102
lab60: 	lsl	r0, fp, #20
	lsr	r0, r0, #20
	cmp	r0, #0
	bne	lab103
	ldr	r4, [r8, #8]
	add	r9, r6, r9
	orr	r9, r9, #1
	str	r9, [r4, #4]
	b	lab104
lab59: 	ldr	r4, [r8, #8]
	ldr	r9, [r4, #4]
	b	lab105
lab81: 	mov	r1, #1
	ldr	r6, [r8, #4]
	asr	r3, r3, #2
	orr	r6, r6, r1, lsl r3
	str	r6, [r8, #4]
	b	lab106
lab80: 	cmp	r3, #84	; 0x54
	bhi	lab107
	lsr	r3, r1, #12
	add	r2, r3, #111	; 0x6f
	lsl	r2, r2, #3
	add	r3, r3, #110	; 0x6e
	b	lab108
lab86: 	cmp	r3, #340	; 0x154
	bhi	lab109
	lsr	r3, r5, #15
	add	ip, r3, #120	; 0x78
	add	lr, r3, #119	; 0x77
	lsl	r0, ip, #3
	b	lab110
lab63: 	mov	r4, r2
	b	lab111
lab107: 	cmp	r3, #340	; 0x154
	bhi	lab112
	lsr	r3, r1, #15
	add	r2, r3, #120	; 0x78
	lsl	r2, r2, #3
	add	r3, r3, #119	; 0x77
	b	lab113
lab109: 	ldr	r2, [pc, #144]	; 9060 <_malloc_r+0x80c>
	cmp	r3, r2
	bhi	lab114
	lsr	r3, r5, #18
	add	ip, r3, #125	; 0x7d
	add	lr, r3, #124	; 0x7c
	lsl	r0, ip, #3
	b	lab115
lab65: 	add	r1, r4, #8
	mov	r0, r7
	push {r1, r2}
	mov.w r1, #3867
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_free_r
	push{r1, r2}
	mov.w r1, #3867
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r4, [r8, #8]
	ldr	r3, [pc, #84]	; 9054 <_malloc_r+0x800>
	ldr	r9, [r4, #4]
	ldr	r1, [r3]
	b	lab116
lab112: 	ldr	r2, [pc, #80]	; 9060 <_malloc_r+0x80c>
	cmp	r3, r2
	lsrls	r3, r1, #18
	addls	r2, r3, #125	; 0x7d
	movhi	r2, #1016	; 0x3f8
	movhi	r3, #126	; 0x7e
	addls	r3, r3, #124	; 0x7c
	lslls	r2, r2, #3
	b	lab117
lab114: 	mov	r0, #1016	; 0x3f8
	mov	ip, #127	; 0x7f
	mov	lr, #126	; 0x7e
	b	lab118
lab97: 	ldr	r3, [r8, #4]
	b	lab119
	andeq	r3, r2, r0, lsl r7
	andeq	r3, r2, r8, lsl r7
	andeq	r3, r2, r8, lsl fp
	andeq	r4, r2, ip, asr #9
	muleq	r2, ip, r4
	andeq	r4, r2, r4, asr #9
	andeq	r4, r2, r8, asr #9
	andeq	r0, r0, r4, asr r5
memcpy:
	cmp	r2, #15
	bls	lab120
	orr	r3, r0, r1
	tst	r3, #3
	bne	lab121
	sub	ip, r2, #16
	push	{r4, r5, r6, r7, lr}
	add	r4, r1, #32
	bic	lr, ip, #15
	add	r3, r1, #16
	add	r6, r0, #16
	add	r4, r4, lr
	lsr	r5, ip, #4
lab122: 	ldr	ip, [r3, #-8]
	ldr	r7, [r3, #-16]
	str	lr, [r6, #-12]
	add	r3, r3, #16
	ldr	lr, [r3, #-20]	; 0xffffffec
	cmp	r3, r4
	stmdb	r6, {ip, lr}
	str	r7, [r6, #-16]
	add	r6, r6, #16
	bne	lab122
	add	ip, r5, #1
	tst	r2, #12
	and	r3, r2, #15
	add	r1, r1, ip, lsl #4
	moveq	r2, r3
	add	ip, r0, ip, lsl #4
	beq	lab123
	mov	r4, r1
	sub	r3, r3, #4
	bic	r6, r3, #3
	lsr	lr, r3, #2
	add	r6, ip, r6
	sub	r3, ip, #4
lab124: 	str	r5, [r3, #4]!
	cmp	r3, r6
	bne	lab124
	add	r3, lr, #1
	and	r2, r2, #3
	add	ip, ip, r3, lsl #2
	add	r1, r1, r3, lsl #2
lab123: 	cmp	r2, #0
	sub	r3, r2, #1
	addne	r3, r3, #1
	subne	r2, ip, #1
	addne	r3, r1, r3
	beq	lab125
lab126: 	cmp	r1, r3
	strb	ip, [r2, #1]!
	bne	lab126
lab125: 	pop	{r4, r5, r6, r7, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3534
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab120: 	cmp	r2, #0
	mov	ip, r0
	sub	r3, r2, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #3547
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxeq	lr
lab128: 	sub	r2, ip, #1
	add	r3, r1, r3
lab127: 	cmp	r1, r3
	strb	ip, [r2, #1]!
	bne	lab127
	cpsid f
	push {r1, r2}
	mov.w r1, #2093
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab121: 	mov	ip, r0
	sub	r3, r2, #1
	b	lab128
memset:
	tst	r0, #3
	beq	lab129
	cmp	r2, #0
	sub	r2, r2, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #2570
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxeq	lr
	mov	r3, r0
	and	ip, r1, #255	; 0xff
	b	lab130
lab131: 	cmn	r2, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #2492
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxeq	lr
lab130: 	strb	ip, [r3], #1
	tst	r3, #3
	bne	lab131
lab141: 	bls	lab132
	push	{r4, r5, lr}
	and	lr, r1, #255	; 0xff
	orr	lr, lr, lr, lsl #8
	cmp	r2, #15
	orr	lr, lr, lr, lsl #16
	bls	lab133
	sub	ip, r2, #16
	bic	r4, ip, #15
	add	r5, r3, #32
	add	r5, r5, r4
	lsr	r4, ip, #4
	add	ip, r3, #16
lab134: 	str	lr, [ip, #-12]
	str	lr, [ip, #-8]
	str	lr, [ip, #-4]
	add	ip, ip, #16
	cmp	ip, r5
	bne	lab134
	add	ip, r4, #1
	tst	r2, #12
	add	ip, r3, ip, lsl #4
	and	r2, r2, #15
	beq	lab135
lab142: 	bic	r3, r3, #3
	add	r3, r3, #4
	add	r3, ip, r3
lab136: 	cmp	r3, ip
	bne	lab136
	and	r2, r2, #3
lab140: 	beq	lab137
	and	r1, r1, #255	; 0xff
	add	r2, r3, r2
lab138: 	cmp	r2, r3
	bne	lab138
lab137: 	pop	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #7826
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab132: 	cmp	r2, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #810
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxeq	lr
	and	r1, r1, #255	; 0xff
	add	r2, r3, r2
lab139: 	cmp	r2, r3
	bne	lab139
	cpsid f
	push {r1, r2}
	mov.w r1, #7367
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab135: 	mov	r3, ip
	b	lab140
lab129: 	mov	r3, r0
	b	lab141
lab133: 	mov	ip, r3
	b	lab142
__malloc_lock:
	push	{r4, lr}
	ldr	r0, [pc, #8]	; 92b4 <__malloc_lock+0x14>
	bl	__retarget_lock_acquire_recursive
	pop	{r4, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #4436
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	ldrdeq	r4, [r2], -r4	; <UNPREDICTABLE>
__malloc_unlock:
	push	{r4, lr}
	ldr	r0, [pc, #8]	; 92cc <__malloc_unlock+0x14>
	bl	__retarget_lock_release_recursive
	pop	{r4, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6630
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	ldrdeq	r4, [r2], -r4	; <UNPREDICTABLE>
printf:
	push	{r0, r1, r2, r3}
	push	{lr}		; (str lr, [sp, #-4]!)
	ldr	r2, [pc, #40]	; 9308 <printf+0x38>
	ldr	r0, [r2]
	sub	sp, sp, #12
	add	r3, sp, #20
	ldr	r2, [sp, #16]
	ldr	r1, [r0, #8]
	str	r3, [sp, #4]
	bl	_vfprintf_r
	add	sp, sp, #12
	pop	{lr}		; (ldr lr, [sp], #4)
	add	sp, sp, #16
	bx	lr
	andeq	r3, r2, r0, ror #5
_sbrk_r:
	mov	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r5, [pc, #48]	; 934c <_sbrk_r+0x40>
	mov	r4, r0
	mov	r0, r1
	str	r2, [r5]
	bl	_sbrk
	cmn	r0, #1
	beq	lab143
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #7116
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab143: 	ldr	r3, [r5]
	cmp	r3, #0
	strne	r3, [r4]
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #5562
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	andeq	r4, r2, r0, ror #9
__sprint_r.part.0:
	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, [r1, #100]	; 0x64
	tst	r3, #8192	; 0x2000
	mov	r8, r2
	beq	lab144
	ldr	r3, [r2, #8]
	ldr	r9, [r2]
	cmp	r3, #0
	movne	fp, r1
	movne	r6, r0
	addne	r9, r9, #8
	beq	lab145
lab150: 	lsrs	r7, sl, #2
	beq	lab146
	mov	r4, #0
	sub	r5, r5, #4
	b	lab147
lab149: 	beq	lab148
lab147: 	mov	r2, fp
	mov	r0, r6
	ldr	r1, [r5, #4]!
	bl	_fputwc_r
	push{r1, r2}
	mov.w r1, #1116
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1116
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmn	r0, #1
	add	r4, r4, #1
	bne	lab149
lab152: 	str	r3, [r8, #8]
	str	r3, [r8, #4]
	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
lab148: 	ldr	r3, [r8, #8]
lab146: 	bic	sl, sl, #3
	sub	r3, r3, sl
	cmp	r3, #0
	str	r3, [r8, #8]
	add	r9, r9, #8
	bne	lab150
lab145: 	mov	r0, #0
	b	lab151
lab144: 	bl	__sfvwrite_r
	push{r1, r2}
	mov.w r1, #5591
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5591
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5591
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab152
__sprint_r:
	ldr	ip, [r2, #8]
	cmp	ip, #0
	bne	__sprint_r.part.0
	mov	r0, ip
	str	ip, [r2, #4]
	bx	lr
_vfiprintf_r:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r4, r3
	sub	sp, sp, #236	; 0xec
	subs	r3, r0, #0
	mov	fp, r1
	mov	r7, r2
	str	r3, [sp, #12]
	str	r4, [sp, #16]
	beq	lab153
	ldr	r3, [r3, #56]	; 0x38
	cmp	r3, #0
	beq	lab154
lab224: 	tst	r3, #1
	ldrsh	r1, [fp, #12]
	bne	lab155
	lsl	r2, r1, #16
	tst	r1, #512	; 0x200
	lsr	r2, r2, #16
	beq	lab156
lab192: 	bne	lab157
	ldr	r3, [fp, #100]	; 0x64
	orr	r2, r1, #8192	; 0x2000
	bic	r3, r3, #8192	; 0x2000
	strh	r2, [fp, #12]
	str	r3, [fp, #100]	; 0x64
	lsl	r2, r2, #16
	lsr	r2, r2, #16
lab157: 	tst	r2, #8
	beq	lab158
	ldr	r3, [fp, #16]
	cmp	r3, #0
	beq	lab159
	and	r3, r2, #26
	cmp	r3, #10
	beq	lab160
lab181: 	str	r3, [sp, #56]	; 0x38
	mov	r3, #0
	mov	sl, fp
	str	r3, [sp, #64]	; 0x40
	str	r3, [sp, #60]	; 0x3c
	str	r3, [sp, #28]
	str	r3, [sp, #32]
	str	r3, [sp, #40]	; 0x28
	str	r3, [sp, #36]	; 0x24
	str	r3, [sp, #8]
	add	r9, sp, #68	; 0x44
lab354: 	cmp	r3, #37	; 0x25
	cmpne	r3, #0
	mov	r5, r7
	beq	lab161
lab162: 	ldrb	r3, [r5, #1]!
	cmp	r3, #0
	cmpne	r3, #37	; 0x25
	bne	lab162
	subs	r6, r5, r7
	beq	lab163
	ldr	r3, [sp, #60]	; 0x3c
	add	r3, r3, #1
	cmp	r3, #7
	str	r3, [sp, #60]	; 0x3c
	ldr	r3, [sp, #64]	; 0x40
	add	r3, r6, r3
	str	r7, [r9]
	str	r6, [r9, #4]
	str	r3, [sp, #64]	; 0x40
	addle	r9, r9, #8
	ble	lab164
	cmp	r3, #0
	streq	r3, [sp, #60]	; 0x3c
	addeq	r9, sp, #68	; 0x44
	beq	lab165
	mov	r1, sl
	ldr	r0, [sp, #12]
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab166
	add	r9, sp, #68	; 0x44
lab165: 	ldr	r3, [sp, #8]
	add	r3, r3, r6
	str	r3, [sp, #8]
	ldrb	r3, [r4, #1]
lab163: 	cmp	r3, #0
	beq	lab167
	mov	r2, #0
	mvn	r4, #0
	mov	fp, r2
	mov	r6, r4
	ldrb	r3, [r5, #1]
	strb	r2, [sp, #51]	; 0x33
	str	r2, [sp, #4]
	add	r7, r5, #1
lab364: lab231: 	cmp	r2, #90	; 0x5a
	ldrls	pc, [pc, r2, lsl #2]
	b	lab168
	; <UNDEFINED> instruction: 0x00009cb8
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr #25
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	ldrdeq	r9, [r0], -r4
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, r0, asr #14
	andeq	r9, r0, r0, ror #23
	andeq	r9, r0, ip, lsr r9
	ldrdeq	r9, [r0], -r4
	strdeq	r9, [r0], -ip
	andeq	r9, r0, ip, lsr r9
	strdeq	r9, [r0], -r0
	andeq	r9, r0, r8, lsl r7
	andeq	r9, r0, r8, lsl r7
	andeq	r9, r0, r8, lsl r7
	andeq	r9, r0, r8, lsl r7
	andeq	r9, r0, r8, lsl r7
	andeq	r9, r0, r8, lsl r7
	andeq	r9, r0, r8, lsl r7
	andeq	r9, r0, r8, lsl r7
	andeq	r9, r0, r8, lsl r7
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	muleq	r0, r8, fp
	andeq	r9, r0, ip, ror #14
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, r4, lsr r8
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, asr #22
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, r4, ror ip
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	sl, r0, r4, lsl #9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	muleq	r0, r8, fp
	andeq	r9, r0, r0, ror r7
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, r8, asr ip
	andeq	r9, r0, r0, ror r7
	andeq	r9, r0, r0, ror #14
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr ip
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, ror #26
	andeq	r9, r0, r8, lsr r8
	andeq	r9, r0, r4, lsr sp
	andeq	r9, r0, r0, ror #14
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, asr #22
	andeq	r9, r0, r8, asr r7
	andeq	sl, r0, ip, ror r4
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, ip, lsr r9
	andeq	sl, r0, r0, ror #9
	andeq	r9, r0, ip, lsr r9
	andeq	r9, r0, r8, asr r7
	mov	r1, #0
	sub	r2, r3, #48	; 0x30
lab169: 	add	r1, r1, r1, lsl #2
	add	r1, r2, r1, lsl #1
	sub	r2, r3, #48	; 0x30
	cmp	r2, #9
	bls	lab169
	str	r1, [sp, #4]
	b	lab170
	ldr	r3, [sp, #16]
	ldr	r2, [r3], #4
	cmp	r2, #0
	str	r2, [sp, #4]
	str	r3, [sp, #16]
	blt	lab171
lab240: 	b	lab172
	ldrb	r3, [r7]
	orr	fp, fp, #32
	b	lab173
	orr	fp, fp, #16
	tst	fp, #32
	beq	lab174
	ldr	r3, [sp, #16]
	add	r5, r3, #7
	bic	r5, r5, #7
	mov	r2, r5
	ldr	r3, [r5, #4]
	mov	r6, r3
	ldr	r5, [r2], #8
	str	r2, [sp, #16]
lab351: 	blt	lab175
	cmn	r4, #1
	beq	lab176
	orr	r3, r5, r6
	cmp	r3, #0
	cmpeq	r4, #0
	bic	fp, fp, #128	; 0x80
	movne	r3, #1
	moveq	r3, #0
	bne	lab177
	mov	r4, r3
	str	r3, [sp]
	add	r8, sp, #232	; 0xe8
	b	lab178
lab159: 	mov	r1, fp
	ldr	r0, [sp, #12]
	push {r1, r2}
	mov.w r1, #2559
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2559
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__swsetup_r
	push{r1, r2}
	mov.w r1, #2559
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2559
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bne	lab179
	ldrh	r2, [fp, #12]
	and	r3, r2, #26
	cmp	r3, #10
	bne	lab180
lab160: 	ldrsh	r3, [fp, #14]
	cmp	r3, #0
	blt	lab181
	ldr	r3, [fp, #100]	; 0x64
	tst	r3, #1
	bne	lab182
	tst	r2, #512	; 0x200
	beq	lab183
lab355: 	mov	r2, r7
	mov	r1, fp
	ldr	r0, [sp, #12]
	add	sp, sp, #236	; 0xec
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__sbprintf
	orr	fp, fp, #16
	ands	r6, fp, #32
	beq	lab184
	ldr	r3, [sp, #16]
	add	r5, r3, #7
	bic	r5, r5, #7
	mov	r3, r5
	ldr	r6, [r5, #4]
	ldr	r5, [r3], #8
	str	r3, [sp, #16]
lab353: 	str	r3, [sp]
	mov	r3, #0
lab352: 	strb	r2, [sp, #51]	; 0x33
lab316: 	beq	lab185
	orr	r2, r5, r6
	cmp	r2, #0
	cmpeq	r4, #0
	ldr	r1, [sp]
	movne	r2, #1
	moveq	r2, #0
	bic	fp, r1, #128	; 0x80
	bne	lab186
	cmp	r3, #0
	bne	lab187
	ldr	r2, [sp]
	ands	r2, r2, #1
	mov	r4, r3
	str	r2, [sp]
	addeq	r8, sp, #232	; 0xe8
	movne	r3, #48	; 0x30
	strbne	r3, [sp, #231]	; 0xe7
	addne	r8, sp, #231	; 0xe7
lab357: 	cmp	r4, r2
	movge	r6, r4
	movlt	r6, r2
	ldrb	r3, [sp, #51]	; 0x33
	cmp	r3, #0
	addne	r6, r6, #1
	b	lab188
lab209: 	ldr	r0, [sp, #12]
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	beq	lab189
lab305: lab361: 	tst	r3, #1
	ldrh	r3, [fp, #12]
	beq	lab190
lab212: 	bne	lab191
lab363: 	add	sp, sp, #236	; 0xec
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #5708
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab156: 	ldr	r0, [fp, #88]	; 0x58
	bl	__retarget_lock_acquire_recursive
	ldrsh	r1, [fp, #12]
lab155: 	lsl	r2, r1, #16
	lsr	r2, r2, #16
	b	lab192
lab168: 	cmp	r3, #0
	beq	lab193
	mov	r6, #1
	strb	r3, [sp, #132]	; 0x84
	mov	r3, #0
	str	r6, [sp]
	strb	r3, [sp, #51]	; 0x33
	add	r8, sp, #132	; 0x84
lab346: lab188: 	ands	r3, fp, #2
	str	r3, [sp, #20]
	addne	r6, r6, #2
	ands	r3, fp, #132	; 0x84
	str	r3, [sp, #24]
	bne	lab194
	ldr	r3, [sp, #4]
	sub	r5, r3, r6
	cmp	r5, #0
	bgt	lab195
lab293: 	ldm	r1, {r1, r2}
	add	r0, r1, #1
lab290: 	cmp	ip, #0
	beq	lab196
	mov	r1, #1
	add	r2, r2, #1
	add	ip, sp, #51	; 0x33
	cmp	r0, #7
	str	r2, [sp, #64]	; 0x40
	str	r0, [sp, #60]	; 0x3c
	str	ip, [r9]
	str	r1, [r9, #4]
	bgt	lab197
lab349: 	add	r9, r9, #8
	add	r0, r0, #1
lab281: 	cmp	r3, #0
	beq	lab198
	mov	r3, #2
	add	r2, r2, #2
	str	r3, [r9, #4]
	cmp	r0, #7
	add	r3, sp, #52	; 0x34
	str	r2, [sp, #64]	; 0x40
	str	r0, [sp, #60]	; 0x3c
	str	r3, [r9]
	ble	lab199
	cmp	r2, #0
	beq	lab200
	mov	r1, sl
	ldr	r0, [sp, #12]
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab201
	add	r1, sp, #60	; 0x3c
	ldm	r1, {r1, r2}
	add	r9, sp, #68	; 0x44
	add	r0, r1, #1
lab312: 	cmp	r3, #128	; 0x80
	beq	lab202
lab333: 	sub	r4, r4, r3
	cmp	r4, #0
	bgt	lab203
lab278: 	cmp	r0, #7
	add	r2, r3, r2
	str	r8, [r9]
	str	r3, [r9, #4]
	str	r0, [sp, #60]	; 0x3c
	str	r2, [sp, #64]	; 0x40
	ble	lab204
	cmp	r2, #0
	beq	lab205
	mov	r1, sl
	ldr	r0, [sp, #12]
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab206
	ldr	r2, [sp, #64]	; 0x40
	add	r9, sp, #68	; 0x44
lab248: 	beq	lab207
	ldr	r3, [sp, #4]
	sub	r4, r3, r6
	cmp	r4, #0
	bgt	lab208
lab306: 	cmp	r1, r6
	addge	r3, r3, r1
	addlt	r3, r3, r6
	cmp	r2, #0
	str	r3, [sp, #8]
	bne	lab209
lab307: 	add	r9, sp, #68	; 0x44
	str	r3, [sp, #60]	; 0x3c
	b	lab210
lab190: 	tst	r3, #512	; 0x200
	bne	lab211
	ldr	r0, [fp, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	ldrh	r3, [fp, #12]
	b	lab212
lab174: 	tst	fp, #16
	bne	lab213
	tst	fp, #64	; 0x40
	beq	lab214
	ldr	r5, [sp, #16]
	ldr	r3, [r5], #4
	lsl	r3, r3, #16
	asr	r6, r3, #31
	str	r5, [sp, #16]
	asr	r5, r3, #16
	mov	r3, r6
	b	lab215
lab184: 	ands	r3, fp, #16
	bne	lab216
	ands	r2, fp, #64	; 0x40
	beq	lab217
	ldr	r2, [sp, #16]
	ldr	r5, [r2], #4
	lsl	r5, r5, #16
	mov	r6, r3
	str	r2, [sp, #16]
	lsr	r5, r5, #16
	b	lab218
	mov	r6, #0
	ldr	r5, [sp, #16]
	ldr	r8, [r5], #4
	cmp	r8, r6
	strb	r6, [sp, #51]	; 0x33
	beq	lab219
	cmn	r4, #1
	beq	lab220
	mov	r2, r4
	mov	r1, r6
	mov	r0, r8
	push {r1, r2}
	mov.w r1, #8191
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #8191
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #8191
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #8191
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memchr
	push{r1, r2}
	mov.w r1, #8191
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #8191
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #8191
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #8191
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab221
	sub	r3, r0, r8
	mov	r4, r6
	str	r5, [sp, #16]
	str	r3, [sp]
	b	lab222
	mov	r3, #0
	mov	r6, #1
	ldr	r5, [sp, #16]
	strb	r3, [sp, #51]	; 0x33
	ldr	r3, [r5], #4
	str	r6, [sp]
	strb	r3, [sp, #132]	; 0x84
	str	r5, [sp, #16]
	add	r8, sp, #132	; 0x84
	b	lab223
lab154:	push {r1, r2}
	mov.w r1, #2779
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2779
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
 	bl	__sinit
	push{r1, r2}
	mov.w r1, #2779
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2779
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab224
lab171: 	ldr	r3, [sp, #4]
	rsb	r3, r3, #0
	str	r3, [sp, #4]
	ldrb	r3, [r7]
	orr	fp, fp, #4
	b	lab225
	mov	r3, #43	; 0x2b
	strb	r3, [sp, #51]	; 0x33
	ldrb	r3, [r7]
	b	lab226
	ldrb	r3, [r7]
	orr	fp, fp, #128	; 0x80
	b	lab227
	mov	r1, r7
	ldrb	r3, [r1], #1
	cmp	r3, #42	; 0x2a
	beq	lab228
	sub	r2, r3, #48	; 0x30
	cmp	r2, #9
	mov	r7, r1
	mov	r4, #0
	bhi	lab229
lab230: 	add	r4, r4, r4, lsl #2
	add	r4, r2, r4, lsl #1
	sub	r2, r3, #48	; 0x30
	cmp	r2, #9
	bls	lab230
	b	lab231
	ldrb	r3, [r7]
	cmp	r3, #108	; 0x6c
	ldrbeq	r3, [r7, #1]
	orreq	fp, fp, #32
	addeq	r7, r7, #1
	orrne	fp, fp, #16
	b	lab232
	ldrb	r3, [r7]
	cmp	r3, #104	; 0x68
	ldrbeq	r3, [r7, #1]
	orreq	fp, fp, #512	; 0x200
	addeq	r7, r7, #1
	orrne	fp, fp, #64	; 0x40
	b	lab233
	orr	r3, fp, #16
	str	r3, [sp]
lab326: 	ands	r6, r3, #32
	beq	lab234
	ldr	r3, [sp, #16]
	add	r5, r3, #7
	bic	r5, r5, #7
	mov	r2, r5
	ldr	r6, [r5, #4]
	ldr	r5, [r2], #8
	mov	r3, #1
	str	r2, [sp, #16]
	b	lab235
	ldrb	r3, [r7]
	orr	fp, fp, #1
	b	lab236
	ldrb	r3, [sp, #51]	; 0x33
	cmp	r3, #0
	bne	lab237
	mov	r3, #32
	strb	r3, [sp, #51]	; 0x33
	ldrb	r3, [r7]
	b	lab238
	ldr	r5, [sp, #12]
	mov	r0, r5
	bl	_localeconv_r
	ldr	r3, [r0, #4]
	mov	r0, r3
	str	r3, [sp, #36]	; 0x24
	bl	strlen
	mov	r3, r0
	mov	r0, r5
	str	r3, [sp, #40]	; 0x28
	mov	r5, r3
	bl	_localeconv_r
	ldr	r2, [r0, #8]
	cmp	r5, #0
	cmpne	r2, #0
	str	r2, [sp, #32]
	beq	lab239
	ldr	r3, [sp, #32]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	lab240
	ldrb	r3, [r7]
	orr	fp, fp, #1024	; 0x400
	b	lab241
	orr	r2, fp, #2
	str	r2, [sp]
	mov	r2, #48	; 0x30
	strb	r2, [sp, #52]	; 0x34
	mov	r2, #120	; 0x78
	ldr	r3, [sp, #16]
	ldr	r5, [r3], #4
	str	r3, [sp, #16]
	ldr	r3, [pc, #2732]	; a808 <_vfiprintf_r+0x13f4>
	mov	r6, #0
	str	r3, [sp, #28]
	strb	r2, [sp, #53]	; 0x35
	mov	r3, #2
	b	lab242
	tst	fp, #32
	bne	lab243
	tst	fp, #16
	bne	lab244
	tst	fp, #64	; 0x40
	bne	lab245
	tst	fp, #512	; 0x200
	beq	lab246
	ldr	r5, [sp, #16]
	ldr	r2, [sp, #8]
	ldr	r3, [r5], #4
	strb	r2, [r3]
	str	r5, [sp, #16]
	b	lab247
lab276: 	ldr	r2, [sp]
	str	r8, [sp, #68]	; 0x44
	str	r3, [sp, #60]	; 0x3c
	str	r2, [sp, #72]	; 0x48
	str	r2, [sp, #64]	; 0x40
	add	r9, sp, #68	; 0x44
lab204: 	add	r9, r9, #8
	b	lab248
lab186: 	str	fp, [sp]
lab185: 	cmp	r3, #1
	beq	lab249
	cmp	r3, #2
	add	r8, sp, #232	; 0xe8
	bne	lab250
	ldr	r2, [sp, #28]
lab251: 	ldrb	r3, [r2, r3]
	lsr	r5, r5, #4
	orr	r5, r5, r6, lsl #28
	lsr	r6, r6, #4
	strb	r3, [r8, #-1]!
	orrs	r3, r5, r6
	bne	lab251
lab344: lab254: 	sub	r3, r3, r8
	str	r3, [sp]
	b	lab252
lab253: 	and	r3, r5, #7
	orr	r5, r2, r6, lsl #29
	lsr	r6, r6, #3
	add	r3, r3, #48	; 0x30
	orrs	r2, r5, r6
	mov	r2, r8
	strb	r3, [r8, #-1]!
	bne	lab253
	ldr	fp, [sp]
	mov	r1, fp
	cmp	r3, #48	; 0x30
	moveq	r1, #0
	andne	r1, r1, #1
	cmp	r1, #0
	beq	lab254
	mov	r3, #48	; 0x30
	sub	r2, r2, #2
	strb	r3, [r8, #-1]
	add	r3, sp, #232	; 0xe8
	sub	r3, r3, r2
	ldr	fp, [sp]
	mov	r8, r2
	str	r3, [sp]
	b	lab255
lab202: 	ldr	r3, [sp, #4]
	sub	r5, r3, r6
	cmp	r5, #0
	ble	lab256
	cmp	r5, #16
	ble	lab257
	mov	ip, r9
	mov	r9, r5
	mov	r5, r4
	ldr	r4, [sp, #12]
	b	lab258
lab260: 	mov	r1, r3
	add	ip, ip, #8
lab261: 	cmp	r9, #16
	ble	lab259
lab263: 	str	r0, [ip]
	mov	r0, #16
	add	r3, r1, #1
	add	r2, r2, #16
	cmp	r3, #7
	str	r0, [ip, #4]
	str	r2, [sp, #64]	; 0x40
	str	r3, [sp, #60]	; 0x3c
	ble	lab260
	cmp	r2, #0
	moveq	r0, #1
	moveq	r1, r2
	addeq	ip, sp, #68	; 0x44
	beq	lab261
	mov	r1, sl
	mov	r0, r4
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab262
	add	r1, sp, #60	; 0x3c
	ldm	r1, {r1, r2}
	sub	r9, r9, #16
	cmp	r9, #16
	add	ip, sp, #68	; 0x44
	add	r0, r1, #1
	bgt	lab263
lab259: 	mov	r4, r5
	mov	r5, r9
	mov	r9, ip
lab257: 	ldr	r3, [pc, #2248]	; a80c <_vfiprintf_r+0x13f8>
	add	r2, r2, r5
	cmp	r0, #7
	str	r5, [r9, #4]
	str	r3, [r9]
	str	r2, [sp, #64]	; 0x40
	str	r0, [sp, #60]	; 0x3c
	ble	lab264
	cmp	r2, #0
	moveq	r0, #1
	moveq	r1, r2
	addeq	r9, sp, #68	; 0x44
	beq	lab265
	mov	r1, sl
	ldr	r0, [sp, #12]
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab266
	ldr	r3, [sp]
	add	r1, sp, #60	; 0x3c
	ldm	r1, {r1, r2}
	sub	r4, r4, r3
	cmp	r4, #0
	add	r9, sp, #68	; 0x44
	add	r0, r1, #1
	ble	lab267
lab203: 	cmp	r4, #16
	ble	lab268
	mov	ip, r9
	mov	r5, #16
	mov	r9, r4
	ldr	r4, [sp, #12]
	b	lab269
lab271: 	mov	r1, r3
	add	ip, ip, #8
lab272: 	cmp	r9, #16
	ble	lab270
lab274: 	ldr	r0, [pc, #2084]	; a80c <_vfiprintf_r+0x13f8>
	add	r2, r2, #16
	cmp	r3, #7
	stm	ip, {r0, r5}
	str	r2, [sp, #64]	; 0x40
	str	r3, [sp, #60]	; 0x3c
	ble	lab271
	cmp	r2, #0
	moveq	r0, #1
	moveq	r1, r2
	addeq	ip, sp, #68	; 0x44
	beq	lab272
	mov	r1, sl
	mov	r0, r4
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab273
	add	r1, sp, #60	; 0x3c
	ldm	r1, {r1, r2}
	sub	r9, r9, #16
	cmp	r9, #16
	add	ip, sp, #68	; 0x44
	add	r0, r1, #1
	bgt	lab274
lab270: 	mov	r4, r9
	mov	r9, ip
lab268: 	ldr	r3, [pc, #1976]	; a80c <_vfiprintf_r+0x13f8>
	cmp	r0, #7
	add	r2, r2, r4
	str	r4, [r9, #4]
	str	r3, [r9]
	str	r0, [sp, #60]	; 0x3c
	str	r2, [sp, #64]	; 0x40
	addle	r9, r9, #8
	addle	r0, r0, #1
	ble	lab275
	cmp	r2, #0
	beq	lab276
	mov	r1, sl
	ldr	r0, [sp, #12]
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab277
	ldr	r0, [sp, #60]	; 0x3c
	ldr	r2, [sp, #64]	; 0x40
	add	r9, sp, #68	; 0x44
	add	r0, r0, #1
	b	lab278
lab197: 	cmp	r2, #0
	beq	lab279
	mov	r1, sl
	ldr	r0, [sp, #12]
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab280
	add	r1, sp, #60	; 0x3c
	ldm	r1, {r1, r2}
	add	r9, sp, #68	; 0x44
	add	r0, r1, #1
	b	lab281
lab332: 	mov	r0, #1
	add	r3, sp, #52	; 0x34
	str	r3, [sp, #68]	; 0x44
	str	r2, [sp, #72]	; 0x48
	add	r9, sp, #68	; 0x44
lab199: 	mov	r1, r0
lab325: 	add	r0, r1, #1
	b	lab282
lab195: 	cmp	r5, #16
	ble	lab283
	mov	lr, r9
	mov	r3, #16
	mov	r9, r7
	ldr	r2, [sp, #64]	; 0x40
	mov	r7, r6
	ldr	ip, [sp, #60]	; 0x3c
	mov	r6, r4
	ldr	r4, [sp, #12]
	b	lab284
lab286: 	mov	ip, r0
	add	lr, lr, #8
lab287: 	cmp	r5, #16
	ble	lab285
lab289: 	ldr	r1, [pc, #1724]	; a810 <_vfiprintf_r+0x13fc>
	add	r2, r2, #16
	cmp	r0, #7
	stm	lr, {r1, r3}
	str	r2, [sp, #64]	; 0x40
	str	r0, [sp, #60]	; 0x3c
	ble	lab286
	cmp	r2, #0
	moveq	ip, r2
	moveq	r1, #1
	addeq	lr, sp, #68	; 0x44
	beq	lab287
	mov	r1, sl
	mov	r0, r4
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab288
	ldr	ip, [sp, #60]	; 0x3c
	sub	r5, r5, #16
	cmp	r5, #16
	mov	r3, #16
	ldr	r2, [sp, #64]	; 0x40
	add	lr, sp, #68	; 0x44
	add	r1, ip, #1
	bgt	lab289
lab285: 	mov	r4, r6
	mov	r6, r7
	mov	r7, r9
	mov	r9, lr
lab358: 	cmp	r1, #7
	add	r2, r5, r2
	str	r5, [r9, #4]
	str	r3, [r9]
	str	r2, [sp, #64]	; 0x40
	str	r1, [sp, #60]	; 0x3c
	addle	r9, r9, #8
	addle	r0, r1, #1
	ble	lab290
	cmp	r2, #0
	beq	lab291
	mov	r1, sl
	ldr	r0, [sp, #12]
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab292
	add	r9, sp, #68	; 0x44
	b	lab293
lab205: 	tst	fp, #4
	str	r2, [sp, #60]	; 0x3c
	beq	lab294
	ldr	r3, [sp, #4]
	sub	r4, r3, r6
	cmp	r4, #0
	ble	lab295
	add	r9, sp, #68	; 0x44
lab208: 	cmp	r4, #16
	ble	lab296
	ldr	r1, [sp, #60]	; 0x3c
	mov	r5, #16
	mov	ip, r1
	ldr	r8, [sp, #12]
	b	lab297
lab299: 	mov	ip, r3
	add	r9, r9, #8
lab300: 	cmp	r4, #16
	ble	lab298
lab302: 	ldr	r1, [pc, #1436]	; a810 <_vfiprintf_r+0x13fc>
	add	r2, r2, #16
	cmp	r3, #7
	stm	r9, {r1, r5}
	str	r2, [sp, #64]	; 0x40
	str	r3, [sp, #60]	; 0x3c
	ble	lab299
	cmp	r2, #0
	moveq	r0, #1
	moveq	ip, r2
	addeq	r9, sp, #68	; 0x44
	beq	lab300
	mov	r1, sl
	mov	r0, r8
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab301
	ldr	ip, [sp, #60]	; 0x3c
	sub	r4, r4, #16
	cmp	r4, #16
	ldr	r2, [sp, #64]	; 0x40
	add	r9, sp, #68	; 0x44
	add	r0, ip, #1
	bgt	lab302
lab359: 	add	r2, r2, r4
	cmp	r0, #7
	str	r4, [r9, #4]
	str	r3, [r9]
	str	r0, [sp, #60]	; 0x3c
	str	r2, [sp, #64]	; 0x40
	ble	lab303
	cmp	r2, #0
	beq	lab304
	mov	r1, sl
	ldr	r0, [sp, #12]
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab305
	ldr	r2, [sp, #64]	; 0x40
	b	lab306
lab304: 	ldmib	sp, {r2, r3}
	cmp	r2, r6
	addge	r3, r3, r2
	addlt	r3, r3, r6
	str	r3, [sp, #8]
	b	lab307
lab187: 	mov	r4, r2
	str	r2, [sp]
	add	r8, sp, #232	; 0xe8
	b	lab308
lab177: 	str	fp, [sp]
lab249: 	cmp	r5, #10
	sbcs	r3, r6, #0
	bcs	lab309
	mov	r3, #1
	add	r5, r5, #48	; 0x30
	ldr	fp, [sp]
	strb	r5, [sp, #231]	; 0xe7
	str	r3, [sp]
	add	r8, sp, #231	; 0xe7
	b	lab310
lab279: 	ldr	r3, [sp, #20]
	cmp	r3, #0
	bne	lab311
lab200: 	mov	r0, #1
	mov	r1, r2
	add	r9, sp, #68	; 0x44
	b	lab312
lab234: 	ldr	r3, [sp]
	ands	r3, r3, #16
	bne	lab313
	ldr	r2, [sp]
	ands	r2, r2, #64	; 0x40
	beq	lab314
	ldr	r2, [sp, #16]
	ldr	r5, [r2], #4
	lsl	r5, r5, #16
	mov	r6, r3
	str	r2, [sp, #16]
	mov	r3, #1
	lsr	r5, r5, #16
	b	lab315
lab175: 	mov	r3, #45	; 0x2d
	rsbs	r5, r5, #0
	strb	r3, [sp, #51]	; 0x33
	str	fp, [sp]
	mov	r3, #1
	rsc	r6, r6, #0
	b	lab316
lab264: 	mov	r1, r0
	add	r9, r9, #8
	add	r0, r0, #1
	b	lab317
lab314: 	ldr	r3, [sp]
	ands	r6, r3, #512	; 0x200
	bne	lab318
lab313: 	ldr	r2, [sp, #16]
	ldr	r5, [r2], #4
	mov	r3, #1
	str	r2, [sp, #16]
	b	lab319
lab214: 	tst	fp, #512	; 0x200
	bne	lab320
lab213: 	ldr	r5, [sp, #16]
	ldr	r3, [r5], #4
	asr	r6, r3, #31
	str	r5, [sp, #16]
	mov	r5, r3
	mov	r3, r6
	b	lab321
lab217: 	ands	r6, fp, #512	; 0x200
	bne	lab322
lab216: 	ldr	r3, [sp, #16]
	ldr	r5, [r3], #4
	str	r3, [sp, #16]
	b	lab323
lab243: 	ldr	r5, [sp, #16]
	ldr	r1, [sp, #8]
	ldr	r2, [r5], #4
	asr	r3, r1, #31
	stm	r2, {r1, r3}
	str	r5, [sp, #16]
	b	lab324
lab311: 	mov	r2, #2
	add	r3, sp, #52	; 0x34
	str	r3, [sp, #68]	; 0x44
	str	r2, [sp, #72]	; 0x48
	add	r9, sp, #68	; 0x44
	b	lab325
	str	fp, [sp]
	b	lab326
	ldr	r2, [pc, #904]	; a814 <_vfiprintf_r+0x1400>
	str	r2, [sp, #28]
lab329: 	beq	lab327
	ldr	r2, [sp, #16]
	add	r5, r2, #7
	bic	r5, r5, #7
	mov	r2, r5
	ldr	r6, [r5, #4]
	ldr	r5, [r2], #8
	str	r2, [sp, #16]
lab350: 	moveq	r2, #0
	andne	r2, fp, #1
	cmp	r2, #0
	strbne	r3, [sp, #53]	; 0x35
	movne	r3, #48	; 0x30
	orrne	fp, fp, #2
	strbne	r3, [sp, #52]	; 0x34
	bic	r3, fp, #1024	; 0x400
	str	r3, [sp]
	mov	r3, #2
	b	lab328
	ldr	r2, [pc, #800]	; a808 <_vfiprintf_r+0x13f4>
	str	r2, [sp, #28]
	b	lab329
lab220: 	mov	r0, r8
	str	r5, [sp, #16]
	bl	strlen
	mov	r4, r6
	str	r0, [sp]
	b	lab330
lab291: 	ldrb	r1, [sp, #51]	; 0x33
	cmp	r1, #0
	bne	lab331
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bne	lab332
	mov	r1, r2
	mov	r0, #1
	add	r9, sp, #68	; 0x44
	b	lab333
lab327: 	ands	r2, fp, #16
	bne	lab334
	ands	r1, fp, #64	; 0x40
	beq	lab335
	ldr	r1, [sp, #16]
	ldr	r5, [r1], #4
	lsl	r5, r5, #16
	mov	r6, r2
	str	r1, [sp, #16]
	lsr	r5, r5, #16
	b	lab336
lab335: 	ands	r6, fp, #512	; 0x200
	bne	lab337
lab334: 	ldr	r2, [sp, #16]
	ldr	r5, [r2], #4
	str	r2, [sp, #16]
	b	lab338
lab309: 	mov	r3, #0
	ldr	r2, [sp]
	and	r2, r2, #1024	; 0x400
	str	r4, [sp, #20]
	str	r9, [sp, #24]
	str	r7, [sp, #44]	; 0x2c
	mov	r4, r3
	mov	r9, r2
	ldr	r7, [sp, #32]
	add	fp, sp, #232	; 0xe8
	b	lab339
lab342: 	mov	r1, r6
	mov	r3, #0
	mov	r2, #10
	push {r1, r2}
	mov.w r1, #6913
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_uldivmod
	push{r1, r2}
	mov.w r1, #6913
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r5, #10
	sbcs	r3, r6, #0
	mov	r5, r0
	mov	r6, r1
	bcc	lab340
lab356: lab339: 	mov	r2, #10
	mov	r3, #0
	mov	r0, r5
	mov	r1, r6
	push {r1, r2}
	mov.w r1, #5958
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_uldivmod
	push{r1, r2}
	mov.w r1, #5958
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r9, #0
	add	r2, r2, #48	; 0x30
	strb	r2, [fp, #-1]
	sub	r8, fp, #1
	add	r4, r4, #1
	beq	lab341
	ldrb	r3, [r7]
	sub	r1, r3, r4
	rsbs	r2, r1, #0
	adc	r2, r2, r1
	cmp	r3, #255	; 0xff
	moveq	r2, #0
	cmp	r2, #0
	beq	lab342
	cmp	r5, #10
	sbcs	r3, r6, #0
	bcs	lab343
lab340: 	str	r7, [sp, #32]
	ldr	r4, [sp, #20]
	ldr	r9, [sp, #24]
	ldr	r7, [sp, #44]	; 0x2c
	b	lab344
lab246: 	ldr	r5, [sp, #16]
	ldr	r2, [sp, #8]
	ldr	r3, [r5], #4
	str	r2, [r3]
	str	r5, [sp, #16]
	b	lab345
lab219: 	cmp	r4, #6
	movcc	r6, r4
	movcs	r6, #6
	str	r5, [sp, #16]
	str	r6, [sp]
	ldr	r8, [pc, #432]	; a818 <_vfiprintf_r+0x1404>
	b	lab346
lab193: 	ldr	r3, [sp, #64]	; 0x40
	cmp	r3, #0
	mov	fp, sl
	bne	lab347
lab360: 	str	r3, [sp, #60]	; 0x3c
	b	lab348
lab331: 	mov	r0, #1
	add	r2, sp, #51	; 0x33
	str	r2, [sp, #68]	; 0x44
	str	r0, [sp, #72]	; 0x48
	mov	r2, r0
	add	r9, sp, #68	; 0x44
	b	lab349
lab337: 	ldr	r5, [sp, #16]
	ldr	r2, [r5], #4
	mov	r6, r1
	str	r5, [sp, #16]
	and	r5, r2, #255	; 0xff
	b	lab350
lab320: 	ldr	r3, [sp, #16]
	ldr	r5, [r3], #4
	lsl	r5, r5, #24
	asr	r6, r5, #31
	str	r3, [sp, #16]
	asr	r5, r5, #24
	mov	r3, r6
	b	lab351
lab318: 	ldr	r5, [sp, #16]
	mov	r6, r2
	ldr	r2, [r5], #4
	mov	r3, #1
	str	r5, [sp, #16]
	and	r5, r2, #255	; 0xff
	b	lab352
lab322: 	ldr	r5, [sp, #16]
	ldr	r3, [r5], #4
	mov	r6, r2
	str	r5, [sp, #16]
	and	r5, r3, #255	; 0xff
	b	lab353
lab245: 	ldr	r5, [sp, #16]
	ldr	r2, [sp, #8]
	ldr	r3, [r5], #4
	strh	r2, [r3]
	str	r5, [sp, #16]
	b	lab354
lab183: 	ldr	r0, [fp, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	b	lab355
lab343: 	ldr	r3, [sp, #40]	; 0x28
	sub	r8, r8, r3
	mov	r2, r3
	ldr	r1, [sp, #36]	; 0x24
	mov	r0, r8
	push {r1, r2}
	mov.w r1, #6744
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6744
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	strncpy
	push{r1, r2}
	mov.w r1, #6744
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6744
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldrb	r3, [r7, #1]
	mov	r0, r5
	cmp	r3, #0
	mov	r1, r6
	mov	r2, #10
	mov	r3, #0
	addne	r7, r7, #1
	push {r1, r2}
	mov.w r1, #1193
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_uldivmod
	push{r1, r2}
	mov.w r1, #1193
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r4, #0
	mov	r5, r0
	mov	r6, r1
	b	lab356
lab221: 	str	r4, [sp]
	str	r5, [sp, #16]
	mov	r4, r0
	b	lab357
lab283: 	ldr	r1, [sp, #60]	; 0x3c
	ldr	r2, [sp, #64]	; 0x40
	add	r1, r1, #1
	b	lab358
lab296: 	ldr	r0, [sp, #60]	; 0x3c
	add	r0, r0, #1
	b	lab359
lab347: 	mov	r1, sl
	ldr	r0, [sp, #12]
	add	r2, sp, #56	; 0x38
	bl	__sprint_r.part.0
	cmp	r0, #0
	beq	lab360
	b	lab361
lab179: 	ldr	r3, [fp, #100]	; 0x64
	tst	r3, #1
	bne	lab362
	ldrh	r3, [fp, #12]
	tst	r3, #512	; 0x200
	ldreq	r0, [fp, #88]	; 0x58
	bleq	feac <__retarget_lock_release_recursive>
lab362: 	mvn	r3, #0
	str	r3, [sp, #8]
	b	lab363
lab228: 	ldr	r2, [sp, #16]
	ldr	r4, [r2], #4
	cmp	r4, r6
	ldrb	r3, [r7, #1]
	movlt	r4, r6
	mov	r7, r1
	str	r2, [sp, #16]
	b	lab364
	andeq	r2, r1, r0, lsr #30
	andeq	r2, r1, ip, asr #30
	andeq	r2, r1, ip, lsr pc
	andeq	r2, r1, ip, lsl #30
	andeq	r2, r1, r4, lsr pc
__sbprintf:
	push	{r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #1120	; 0x460
	sub	sp, sp, #8
	mov	r7, sp
	mov	ip, #1024	; 0x400
	mov	lr, #0
	mov	r5, r2
	mov	r6, r0
	mov	r8, r3
	add	r3, sp, #104	; 0x68
	str	r3, [sp]
	str	r3, [sp, #16]
	ldrh	r3, [r1, #12]
	bic	r3, r3, #2
	strh	r3, [r7, #12]
	ldr	r3, [r1, #100]	; 0x64
	str	r3, [sp, #100]	; 0x64
	ldrh	r3, [r1, #14]
	strh	r3, [r7, #14]
	ldr	r3, [r1, #28]
	str	r3, [sp, #28]
	ldr	r3, [r1, #36]	; 0x24
	add	r0, sp, #88	; 0x58
	mov	r4, r1
	str	lr, [sp, #24]
	str	ip, [sp, #8]
	str	ip, [sp, #20]
	str	r3, [sp, #36]	; 0x24
	bl	__retarget_lock_init_recursive
	mov	r2, r5
	mov	r3, r8
	mov	r1, r7
	mov	r0, r6
	push {r1, r2}
	mov.w r1, #483
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #483
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_vfiprintf_r
	push{r1, r2}
	mov.w r1, #483
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #483
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r5, r0, #0
	blt	lab365
	mov	r1, r7
	mov	r0, r6
	push {r1, r2}
	mov.w r1, #3326
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3326
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_fflush_r
	push{r1, r2}
	mov.w r1, #3326
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3326
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	mvnne	r5, #0
lab365: 	ldrh	r3, [sp, #12]
	tst	r3, #64	; 0x40
	ldrhne	r3, [r4, #12]
	orrne	r3, r3, #64	; 0x40
	ldr	r0, [sp, #88]	; 0x58
	strhne	r3, [r4, #12]
	bl	__retarget_lock_close_recursive
	mov	r0, r5
	add	sp, sp, #1120	; 0x460
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r8, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #7415
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
_vfprintf_r:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #340	; 0x154
	mov	r4, r3
	mov	fp, r1
	mov	r8, r2
	mov	r7, r0
	bl	_localeconv_r
	ldr	r3, [r0]
	mov	r0, r3
	str	r3, [sp, #96]	; 0x60
	str	r4, [sp, #52]	; 0x34
	bl	strlen
	cmp	r7, #0
	str	r0, [sp, #92]	; 0x5c
	beq	lab366
	ldr	r3, [r7, #56]	; 0x38
	cmp	r3, #0
	beq	lab367
lab410: 	tst	r3, #1
	ldrsh	r2, [fp, #12]
	bne	lab368
	lsl	r1, r2, #16
	tst	r2, #512	; 0x200
	lsr	r1, r1, #16
	beq	lab369
lab389: 	bne	lab370
	ldr	r3, [fp, #100]	; 0x64
	orr	r2, r2, #8192	; 0x2000
	bic	r3, r3, #8192	; 0x2000
	lsl	r1, r2, #16
	strh	r2, [fp, #12]
	str	r3, [fp, #100]	; 0x64
	lsr	r1, r1, #16
lab370: 	tst	r1, #8
	beq	lab371
	ldr	r3, [fp, #16]
	cmp	r3, #0
	beq	lab372
	and	r3, r1, #26
	cmp	r3, #10
	beq	lab373
lab386: 	add	r3, sp, #172	; 0xac
	mov	r2, r4
	mov	r9, r3
	str	r3, [sp, #160]	; 0xa0
	str	r4, [sp, #168]	; 0xa8
	mov	r3, #0
	str	r4, [sp, #164]	; 0xa4
	str	r4, [sp, #76]	; 0x4c
	mov	r4, #0
	str	r3, [sp, #80]	; 0x50
	str	r4, [sp, #84]	; 0x54
	mov	r3, fp
	mov	fp, r7
	mov	r7, r3
	str	r2, [sp, #104]	; 0x68
	str	r2, [sp, #108]	; 0x6c
	str	r2, [sp, #116]	; 0x74
	str	r2, [sp, #120]	; 0x78
	str	r2, [sp, #112]	; 0x70
	str	r2, [sp, #36]	; 0x24
lab655: 	cmp	r3, #37	; 0x25
	cmpne	r3, #0
	mov	r4, r8
	beq	lab374
lab375: 	ldrb	r3, [r4, #1]!
	cmp	r3, #0
	cmpne	r3, #37	; 0x25
	bne	lab375
	subs	r6, r4, r8
	beq	lab376
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	cmp	r3, #7
	str	r3, [sp, #164]	; 0xa4
	ldr	r3, [sp, #168]	; 0xa8
	add	r3, r3, r6
	str	r8, [r9]
	str	r6, [r9, #4]
	str	r3, [sp, #168]	; 0xa8
	addle	r9, r9, #8
	bgt	lab377
lab391: 	add	r3, r3, r6
	str	r3, [sp, #36]	; 0x24
	ldrb	r3, [r5, #1]
lab376: 	cmp	r3, #0
	beq	lab378
	mov	r2, #0
	mvn	r5, #0
	ldrb	r3, [r4, #1]
	add	r8, r4, #1
	mov	sl, r2
	mov	r4, r5
	strb	r2, [sp, #131]	; 0x83
	str	r2, [sp, #32]
lab755: lab434: 	cmp	r2, #90	; 0x5a
	ldrls	pc, [pc, r2, lsl #2]
	b	lab379
	andeq	fp, r0, ip, ror #5
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	fp, r0, r0, ror #5
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	fp, r0, r4, lsl #5
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, ip, lsr #24
	andeq	fp, r0, ip, ror #2
	andeq	sl, r0, r4, ror #25
	andeq	fp, r0, ip, lsl #1
	andeq	fp, r0, r8, lsl #3
	andeq	sl, r0, r4, ror #25
	andeq	fp, r0, ip, ror r1
	andeq	sl, r0, r4, lsl #24
	andeq	sl, r0, r4, lsl #24
	andeq	sl, r0, r4, lsl #24
	andeq	sl, r0, r4, lsl #24
	andeq	sl, r0, r4, lsl #24
	andeq	sl, r0, r4, lsl #24
	andeq	sl, r0, r4, lsl #24
	andeq	sl, r0, r4, lsl #24
	andeq	sl, r0, r4, lsl #24
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, ip, ror lr
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #30
	andeq	fp, r0, r4, asr #4
	andeq	sl, r0, ip, ror lr
	andeq	sl, r0, ip, ror lr
	andeq	sl, r0, ip, ror lr
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	fp, r0, r8, lsr r2
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	fp, r0, r8, asr #3
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	muleq	r0, r8, pc	; <UNPREDICTABLE>
	andeq	sl, r0, r4, ror #25
	muleq	r0, r8, r0
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	ip, r0, r0, lsl r1
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, ip, ror lr
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #30
	andeq	fp, r0, r4, lsl r0
	andeq	sl, r0, ip, ror lr
	andeq	sl, r0, ip, ror lr
	andeq	sl, r0, ip, ror lr
	andeq	fp, r0, r0, lsl #4
	andeq	fp, r0, r4, lsl r0
	andeq	sl, r0, r8, asr pc
	andeq	sl, r0, r4, ror #25
	andeq	fp, r0, ip, lsl r2
	andeq	sl, r0, r4, ror #25
	andeq	fp, r0, r4, asr #6
	andeq	ip, r0, r8, lsl #2
	andeq	fp, r0, r8, lsl #6
	andeq	sl, r0, r8, asr pc
	andeq	sl, r0, r4, ror #25
	muleq	r0, r8, pc	; <UNPREDICTABLE>
	andeq	sl, r0, r4, asr #24
	strdeq	ip, [r0], -ip	; <UNPREDICTABLE>
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, ror #25
	muleq	r0, ip, r0
	andeq	sl, r0, r4, ror #25
	andeq	sl, r0, r4, asr #24
	mov	r1, #0
	sub	r2, r3, #48	; 0x30
lab380: 	add	r1, r1, r1, lsl #2
	add	r1, r2, r1, lsl #1
	sub	r2, r3, #48	; 0x30
	cmp	r2, #9
	bls	lab380
	str	r1, [sp, #32]
	b	lab381
	ldr	r3, [sp, #52]	; 0x34
	ldr	r2, [r3], #4
	cmp	r2, #0
	str	r2, [sp, #32]
	str	r3, [sp, #52]	; 0x34
	blt	lab382
lab448: 	b	lab383
lab372: 	mov	r1, fp
	mov	r0, r7
	push {r1, r2}
	mov.w r1, #2277
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2277
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__swsetup_r
	push{r1, r2}
	mov.w r1, #2277
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2277
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bne	lab384
	ldrh	r1, [fp, #12]
	and	r3, r1, #26
	cmp	r3, #10
	bne	lab385
lab373: 	ldrsh	r3, [fp, #14]
	cmp	r3, #0
	blt	lab386
	ldr	r3, [fp, #100]	; 0x64
	tst	r3, #1
	bne	lab387
	tst	r1, #512	; 0x200
	beq	lab388
lab657: 	mov	r2, r8
	mov	r1, fp
	mov	r0, r7
	add	sp, sp, #340	; 0x154
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__sbprintf
lab369: 	ldr	r0, [fp, #88]	; 0x58
	bl	__retarget_lock_acquire_recursive
	ldrsh	r2, [fp, #12]
lab368: 	lsl	r1, r2, #16
	lsr	r1, r1, #16
	b	lab389
lab377: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab390
	add	r9, sp, #172	; 0xac
	b	lab391
lab379: 	cmp	r3, #0
	str	r3, [sp, #64]	; 0x40
	beq	lab392
	mov	r2, #0
	strb	r3, [sp, #236]	; 0xec
	mov	r3, #1
	add	r1, sp, #236	; 0xec
	str	r3, [sp, #28]
	str	r1, [sp, #56]	; 0x38
	strb	r2, [sp, #131]	; 0x83
	str	r3, [sp, #40]	; 0x28
lab412: 	str	r2, [sp, #48]	; 0x30
	str	r2, [sp, #88]	; 0x58
	str	r2, [sp, #72]	; 0x48
	str	r2, [sp, #68]	; 0x44
lab428: 	ldrne	r1, [sp, #28]
	addne	r1, r1, #2
	strne	r1, [sp, #28]
	ands	r1, sl, #132	; 0x84
	str	r1, [sp, #60]	; 0x3c
	bne	lab393
	add	r0, sp, #28
	ldm	r0, {r0, r1}
	sub	r6, r1, r0
	cmp	r6, #0
	bgt	lab394
lab393: 	ldr	r4, [sp, #168]	; 0xa8
lab606: 	beq	lab395
	mov	r2, #1
	str	r2, [r9, #4]
	ldr	r2, [sp, #164]	; 0xa4
	add	r2, r2, #1
	cmp	r2, #7
	str	r2, [sp, #164]	; 0xa4
	add	r4, r4, #1
	add	r2, sp, #131	; 0x83
	str	r2, [r9]
	str	r4, [sp, #168]	; 0xa8
	addle	r9, r9, #8
	bgt	lab396
lab513: 	beq	lab397
	mov	r3, #2
	str	r3, [r9, #4]
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	cmp	r3, #7
	str	r3, [sp, #164]	; 0xa4
	add	r4, r4, #2
	add	r3, sp, #132	; 0x84
	str	r3, [r9]
	str	r4, [sp, #168]	; 0xa8
	addle	r9, r9, #8
	bgt	lab398
lab515: 	cmp	r3, #128	; 0x80
	beq	lab399
lab477: 	sub	r5, r5, r3
	cmp	r5, #0
	bgt	lab400
lab486: 	bne	lab401
	ldr	r3, [sp, #56]	; 0x38
	str	r3, [r9]
	ldr	r3, [sp, #40]	; 0x28
	add	r4, r4, r3
	str	r3, [r9, #4]
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	cmp	r3, #7
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	bgt	lab402
lab612: lab709: 	beq	lab403
	add	r2, sp, #28
	ldm	r2, {r2, r3}
	sub	r5, r3, r2
	cmp	r5, #0
	bgt	lab404
lab526: 	ldm	r1, {r1, r2, r3}
	cmp	r2, r1
	addge	r3, r3, r2
	addlt	r3, r3, r1
	cmp	r4, #0
	str	r3, [sp, #36]	; 0x24
	bne	lab405
lab492: 	cmp	r3, #0
	mov	r3, #0
	str	r3, [sp, #164]	; 0xa4
	movne	r0, fp
	ldrne	r1, [sp, #48]	; 0x30
	push {r1, r2}
	mov.w r1, #5365
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	blne	f65c <_free_r>
	push{r1, r2}
	mov.w r1, #5365
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r9, sp, #172	; 0xac
	b	lab406
	str	r3, [sp, #64]	; 0x40
	ldr	r3, [sp, #52]	; 0x34
	add	r3, r3, #7
	bic	r2, r3, #7
	ldm	r2!, {r3, r4}
	str	r3, [sp, #80]	; 0x50
	str	r4, [sp, #84]	; 0x54
	add	r4, sp, #80	; 0x50
	ldm	r4, {r3, r4}
	bic	r4, r4, #-2147483648	; 0x80000000
	mov	r0, r3
	str	r2, [sp, #52]	; 0x34
	mov	r6, r3
	mov	r1, r4
	mvn	r2, #0
	ldr	r3, [pc, #3960]	; be38 <_vfprintf_r+0x1548>
	bl	__aeabi_dcmpun
	cmp	r0, #0
	bne	lab407
	mov	r0, r6
	mov	r1, r4
	mvn	r2, #0
	ldr	r3, [pc, #3932]	; be38 <_vfprintf_r+0x1548>
	push {r1, r2}
	mov.w r1, #2557
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmple
	push{r1, r2}
	mov.w r1, #2557
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bne	lab408
	mov	r2, #0
	mov	r3, #0
	add	r1, sp, #80	; 0x50
	ldm	r1, {r0, r1}
	push {r1, r2}
	mov.w r1, #3987
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmplt
	push{r1, r2}
	mov.w r1, #3987
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	movne	r2, #45	; 0x2d
	strbne	r2, [sp, #131]	; 0x83
	ldrbeq	r2, [sp, #131]	; 0x83
	mov	r0, #0
	mov	ip, #3
	str	r0, [sp, #48]	; 0x30
	str	ip, [sp, #28]
	ldr	r1, [pc, #3868]	; be3c <_vfprintf_r+0x154c>
	ldr	r3, [pc, #3868]	; be40 <_vfprintf_r+0x1550>
	bic	sl, sl, #128	; 0x80
lab740: 	cmp	lr, #71	; 0x47
	movgt	r1, r3
	mov	r5, r0
	str	r1, [sp, #56]	; 0x38
	str	ip, [sp, #40]	; 0x28
	str	r0, [sp, #88]	; 0x58
	str	r0, [sp, #72]	; 0x48
	str	r0, [sp, #68]	; 0x44
	b	lab409
lab367: 	mov	r0, r7
	push {r1, r2}
	mov.w r1, #3684
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3684
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__sinit
	push{r1, r2}
	mov.w r1, #3684
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3684
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab410
	ldrb	r3, [r8]
	orr	sl, sl, #32
	b	lab411
	mov	r0, #1
	mov	r2, #0
	str	r3, [sp, #64]	; 0x40
	ldr	r3, [sp, #52]	; 0x34
	add	r1, sp, #236	; 0xec
	str	r1, [sp, #56]	; 0x38
	ldr	r1, [r3], #4
	str	r0, [sp, #28]
	strb	r2, [sp, #131]	; 0x83
	strb	r1, [sp, #236]	; 0xec
	str	r3, [sp, #52]	; 0x34
	str	r0, [sp, #40]	; 0x28
	b	lab412
	mov	r6, #0
	ldr	r4, [sp, #52]	; 0x34
	str	r3, [sp, #64]	; 0x40
	ldr	r3, [r4], #4
	cmp	r3, r6
	strb	r6, [sp, #131]	; 0x83
	str	r3, [sp, #56]	; 0x38
	beq	lab413
	cmn	r5, #1
	beq	lab414
	mov	r2, r5
	mov	r1, r6
	ldr	r0, [sp, #56]	; 0x38
	push {r1, r2}
	mov.w r1, #3913
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3913
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3913
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3913
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memchr
	push{r1, r2}
	mov.w r1, #3913
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3913
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3913
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3913
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r3, r0, #0
	str	r3, [sp, #48]	; 0x30
	beq	lab415
	ldr	r3, [sp, #48]	; 0x30
	ldr	r2, [sp, #56]	; 0x38
	sub	r3, r3, r2
	str	r3, [sp, #40]	; 0x28
	bic	r3, r3, r3, asr #31
	mov	r5, r6
	str	r4, [sp, #52]	; 0x34
	ldrb	r2, [sp, #131]	; 0x83
	str	r3, [sp, #28]
	str	r6, [sp, #48]	; 0x30
	str	r6, [sp, #88]	; 0x58
	str	r6, [sp, #72]	; 0x48
	str	r6, [sp, #68]	; 0x44
	b	lab416
	tst	sl, #32
	str	r3, [sp, #64]	; 0x40
	ldr	r3, [sp, #52]	; 0x34
	beq	lab417
lab440: 	bic	r3, r3, #7
	mov	r2, r3
	ldr	r3, [r3, #4]
	mov	r6, r3
	ldr	r4, [r2], #8
	str	r2, [sp, #52]	; 0x34
lab656: 	blt	lab418
	cmn	r5, #1
	beq	lab419
	orr	r3, r4, r6
	cmp	r3, #0
	cmpeq	r5, #0
	bic	sl, sl, #128	; 0x80
	movne	r3, #1
	moveq	r3, #0
	bne	lab420
lab426: 	add	r3, sp, #336	; 0x150
	str	r3, [sp, #56]	; 0x38
	str	r5, [sp, #40]	; 0x28
	b	lab421
lab382: 	ldr	r3, [sp, #32]
	rsb	r3, r3, #0
	str	r3, [sp, #32]
	ldrb	r3, [r8]
	orr	sl, sl, #4
	b	lab422
	str	r3, [sp, #64]	; 0x40
	orr	r3, sl, #16
	str	r3, [sp, #28]
lab592: 	ands	r6, r3, #32
	beq	lab423
	mov	r2, #1
	ldr	r3, [sp, #52]	; 0x34
	add	r3, r3, #7
	bic	r3, r3, #7
	ldr	r6, [r3, #4]
	ldr	r4, [r3], #8
	str	r3, [sp, #52]	; 0x34
lab632: 	strb	r3, [sp, #131]	; 0x83
lab563: 	beq	lab424
	orr	r3, r4, r6
	cmp	r3, #0
	cmpeq	r5, #0
	ldr	r1, [sp, #28]
	movne	r3, #1
	moveq	r3, #0
	bic	sl, r1, #128	; 0x80
	bne	lab425
	cmp	r2, #0
	bne	lab426
	ldr	r3, [sp, #28]
	ands	r3, r3, #1
	str	r3, [sp, #40]	; 0x28
	movne	r3, #48	; 0x30
	mov	r5, r2
	strbne	r3, [sp, #335]	; 0x14f
	addne	r3, sp, #332	; 0x14c
	addne	r3, r3, #3
	addeq	r3, sp, #336	; 0x150
	str	r3, [sp, #56]	; 0x38
lab619: 	cmp	r5, r2
	mov	r3, #0
	movge	r2, r5
	str	r3, [sp, #48]	; 0x30
	str	r2, [sp, #28]
	str	r3, [sp, #88]	; 0x58
	ldrb	r2, [sp, #131]	; 0x83
	str	r3, [sp, #72]	; 0x48
	str	r3, [sp, #68]	; 0x44
lab719: 	beq	lab427
lab682: 	add	r3, r3, #1
	str	r3, [sp, #28]
	b	lab428
	mov	r3, #43	; 0x2b
	strb	r3, [sp, #131]	; 0x83
	ldrb	r3, [r8]
	b	lab429
	ldrb	r3, [r8]
	orr	sl, sl, #128	; 0x80
	b	lab430
	mov	r1, r8
	ldrb	r3, [r1], #1
	cmp	r3, #42	; 0x2a
	beq	lab431
	sub	r2, r3, #48	; 0x30
	cmp	r2, #9
	mov	r8, r1
	mov	r5, #0
	bhi	lab432
lab433: 	add	r5, r5, r5, lsl #2
	add	r5, r2, r5, lsl #1
	sub	r2, r3, #48	; 0x30
	cmp	r2, #9
	bls	lab433
	b	lab434
	str	r3, [sp, #64]	; 0x40
	orr	sl, sl, #16
lab593: 	beq	lab435
	ldr	r3, [sp, #52]	; 0x34
	add	r3, r3, #7
	bic	r3, r3, #7
	ldr	r6, [r3, #4]
	ldr	r4, [r3], #8
	str	r3, [sp, #52]	; 0x34
lab633: 	mov	r2, #0
	str	r3, [sp, #28]
	b	lab436
	ldrb	r3, [r8]
	cmp	r3, #104	; 0x68
	ldrbeq	r3, [r8, #1]
	orreq	sl, sl, #512	; 0x200
	addeq	r8, r8, #1
	orrne	sl, sl, #64	; 0x40
	b	lab437
	ldrb	r3, [r8]
	cmp	r3, #108	; 0x6c
	ldrbeq	r3, [r8, #1]
	orreq	sl, sl, #32
	addeq	r8, r8, #1
	orrne	sl, sl, #16
	b	lab438
	ldrb	r3, [r8]
	orr	sl, sl, #8
	b	lab439
	orr	sl, sl, #16
	tst	sl, #32
	str	r3, [sp, #64]	; 0x40
	ldr	r3, [sp, #52]	; 0x34
	bne	lab440
lab417: 	tst	sl, #16
	ldr	r4, [r3], #4
	bne	lab441
	tst	sl, #64	; 0x40
	beq	lab442
	lsl	r4, r4, #16
	asr	r6, r4, #31
	str	r3, [sp, #52]	; 0x34
	asr	r4, r4, #16
	mov	r3, r6
	b	lab443
	mov	r0, fp
	bl	_localeconv_r
	ldr	r3, [r0, #4]
	mov	r0, r3
	str	r3, [sp, #112]	; 0x70
	bl	strlen
	mov	r3, r0
	mov	r0, fp
	mov	r6, r3
	str	r3, [sp, #120]	; 0x78
	bl	_localeconv_r
	ldr	r2, [r0, #8]
	cmp	r6, #0
	cmpne	r2, #0
	str	r2, [sp, #116]	; 0x74
	beq	lab444
	ldr	r3, [sp, #116]	; 0x74
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	lab445
	ldrb	r3, [r8]
	orr	sl, sl, #1024	; 0x400
	b	lab446
	ldrb	r3, [r8]
	orr	sl, sl, #1
	b	lab447
	ldrb	r3, [sp, #131]	; 0x83
	cmp	r3, #0
	bne	lab448
	mov	r3, #32
	strb	r3, [sp, #131]	; 0x83
	ldrb	r3, [r8]
	b	lab449
	orr	r2, sl, #2
	mov	r1, #48	; 0x30
	str	r2, [sp, #28]
	mov	r2, #120	; 0x78
	ldr	r3, [sp, #52]	; 0x34
	ldr	r4, [r3], #4
	str	r3, [sp, #52]	; 0x34
	ldr	r3, [pc, #2852]	; be50 <_vfprintf_r+0x1560>
	strb	r2, [sp, #133]	; 0x85
	str	r2, [sp, #64]	; 0x40
	mov	r6, #0
	mov	r2, #2
	strb	r1, [sp, #132]	; 0x84
	str	r3, [sp, #104]	; 0x68
	b	lab450
	tst	sl, #32
	bne	lab451
	tst	sl, #16
	bne	lab452
	tst	sl, #64	; 0x40
	bne	lab453
	tst	sl, #512	; 0x200
	beq	lab454
	ldr	r3, [sp, #52]	; 0x34
	ldr	r1, [sp, #36]	; 0x24
	ldr	r2, [r3], #4
	strb	r1, [r2]
	str	r3, [sp, #52]	; 0x34
	b	lab455
lab401: 	ldr	r3, [sp, #64]	; 0x40
	cmp	r3, #101	; 0x65
	ble	lab456
	mov	r2, #0
	mov	r3, #0
	add	r1, sp, #80	; 0x50
	ldm	r1, {r0, r1}
	push {r1, r2}
	mov.w r1, #7861
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmpeq
	push{r1, r2}
	mov.w r1, #7861
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab457
	mov	r3, #1
	str	r3, [r9, #4]
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	cmp	r3, #7
	str	r3, [sp, #164]	; 0xa4
	ldr	r3, [pc, #2688]	; be44 <_vfprintf_r+0x1554>
	add	r4, r4, #1
	str	r3, [r9]
	str	r4, [sp, #168]	; 0xa8
	addle	r9, r9, #8
	bgt	lab458
lab611: 	ldr	r2, [sp, #76]	; 0x4c
	cmp	r3, r2
	bge	lab459
lab565: 	ldr	r2, [sp, #96]	; 0x60
	add	r4, r4, r3
	stm	r9, {r2, r3}
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	cmp	r3, #7
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	bgt	lab460
lab596: 	sub	r5, r3, #1
	cmp	r5, #0
	ble	lab461
	cmp	r5, #16
	ble	lab462
	mov	r6, #16
	ldr	r3, [sp, #164]	; 0xa4
	b	lab463
lab467: 	cmp	r5, #16
	ble	lab464
lab463: 	add	r3, r3, #1
	ldr	r2, [pc, #2580]	; be60 <_vfprintf_r+0x1570>
	cmp	r3, #7
	add	r4, r4, #16
	stm	r9, {r2, r6}
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	ble	lab465
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab466
	add	r3, sp, #164	; 0xa4
	ldm	r3, {r3, r4}
	add	r9, sp, #172	; 0xac
	b	lab467
lab399: 	add	r2, sp, #28
	ldm	r2, {r2, r3}
	sub	r6, r3, r2
	cmp	r6, #0
	ble	lab468
	cmp	r6, #16
	ldr	r3, [sp, #164]	; 0xa4
	bgt	lab469
	b	lab470
lab472: 	cmp	r6, #16
	ble	lab471
lab474: 	str	r2, [r9]
	mov	r2, #16
	add	r3, r3, #1
	cmp	r3, #7
	add	r4, r4, #16
	str	r2, [r9, #4]
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	ble	lab472
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab473
	sub	r6, r6, #16
	add	r3, sp, #164	; 0xa4
	cmp	r6, #16
	ldm	r3, {r3, r4}
	add	r9, sp, #172	; 0xac
	bgt	lab474
lab471: 	add	r3, r3, #1
	cmp	r3, #7
	str	r3, [sp, #164]	; 0xa4
	ldr	r3, [pc, #2356]	; be60 <_vfprintf_r+0x1570>
	add	r4, r4, r6
	str	r6, [r9, #4]
	str	r3, [r9]
	str	r4, [sp, #168]	; 0xa8
	addle	r9, r9, #8
	ble	lab475
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab476
	ldr	r4, [sp, #168]	; 0xa8
	add	r9, sp, #172	; 0xac
	b	lab477
lab400: 	cmp	r5, #16
	ble	lab478
	mov	r6, #16
	ldr	r3, [sp, #164]	; 0xa4
	b	lab479
lab481: 	cmp	r5, #16
	ble	lab480
lab483: 	ldr	r2, [pc, #2256]	; be60 <_vfprintf_r+0x1570>
	cmp	r3, #7
	add	r4, r4, #16
	stm	r9, {r2, r6}
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	ble	lab481
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab482
	sub	r5, r5, #16
	add	r3, sp, #164	; 0xa4
	cmp	r5, #16
	ldm	r3, {r3, r4}
	add	r9, sp, #172	; 0xac
	bgt	lab483
lab635: 	cmp	r3, #7
	str	r3, [sp, #164]	; 0xa4
	ldr	r3, [pc, #2164]	; be60 <_vfprintf_r+0x1570>
	add	r4, r4, r5
	str	r5, [r9, #4]
	str	r3, [r9]
	str	r4, [sp, #168]	; 0xa8
	addle	r9, r9, #8
	ble	lab484
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab485
	ldr	r4, [sp, #168]	; 0xa8
	add	r9, sp, #172	; 0xac
	b	lab486
lab425: 	str	sl, [sp, #28]
lab424: 	cmp	r2, #1
	beq	lab487
	cmp	r2, #2
	add	r3, sp, #336	; 0x150
	beq	lab488
	mov	r1, r3
lab489: 	and	r3, r4, #7
	orr	r4, r2, r6, lsl #29
	lsr	r6, r6, #3
	add	r3, r3, #48	; 0x30
	orrs	r2, r4, r6
	mov	r2, r1
	strb	r3, [r1, #-1]!
	bne	lab489
	ldr	sl, [sp, #28]
	mov	r0, r1
	str	r1, [sp, #56]	; 0x38
	mov	r1, sl
	cmp	r3, #48	; 0x30
	moveq	r1, #0
	andne	r1, r1, #1
	cmp	r1, #0
	bne	lab490
	add	r3, sp, #336	; 0x150
	sub	r3, r3, r0
	str	r3, [sp, #40]	; 0x28
	b	lab491
lab405: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	beq	lab492
lab737: 	mov	r7, fp
	mov	fp, r3
lab704: 	cmp	r1, #0
	movne	r0, r7
	push {r1, r2}
	mov.w r1, #6150
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	blne	f65c <_free_r>
lab759:	push{r1, r2}
	mov.w r1, #6150
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	tst	r3, #1
	ldrh	r3, [fp, #12]
	bne	lab493
	tst	r3, #512	; 0x200
	beq	lab494
lab604: 	bne	lab495
lab735: 	add	sp, sp, #340	; 0x154
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #5200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab456: 	ldr	r3, [sp, #76]	; 0x4c
	cmp	r3, #1
	ble	lab496
lab546: 	str	r3, [r9]
	mov	r3, #1
	ldr	r5, [sp, #164]	; 0xa4
	add	r5, r5, r3
	add	r4, r4, #1
	cmp	r5, #7
	str	r3, [r9, #4]
	str	r4, [sp, #168]	; 0xa8
	str	r5, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	bgt	lab497
lab603: 	add	r5, r5, #1
	ldr	r2, [sp, #96]	; 0x60
	add	r4, r3, r4
	cmp	r5, #7
	stm	r9, {r2, r3}
	str	r4, [sp, #168]	; 0xa8
	str	r5, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	bgt	lab498
lab601: 	mov	r3, #0
	add	r1, sp, #80	; 0x50
	ldm	r1, {r0, r1}
	push {r1, r2}
	mov.w r1, #5712
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmpeq
	push{r1, r2}
	mov.w r1, #5712
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bne	lab499
	ldr	r3, [sp, #56]	; 0x38
	add	r3, r3, #1
	str	r3, [r9]
	ldr	r3, [sp, #76]	; 0x4c
	add	r5, r5, #1
	sub	r3, r3, #1
	add	r4, r4, r3
	cmp	r5, #7
	str	r5, [sp, #164]	; 0xa4
	str	r3, [r9, #4]
	str	r4, [sp, #168]	; 0xa8
	bgt	lab500
lab623: lab550: 	add	r5, r5, #1
	add	r4, r3, r4
	str	r3, [r9, #4]
	cmp	r5, #7
	add	r3, sp, #144	; 0x90
	str	r5, [sp, #164]	; 0xa4
	str	r4, [sp, #168]	; 0xa8
	str	r3, [r9]
	ble	lab501
lab613: 	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab502
	ldr	r4, [sp, #168]	; 0xa8
	add	r9, sp, #172	; 0xac
	b	lab503
lab394: 	cmp	r6, #16
	ble	lab504
	ldr	ip, [pc, #1624]	; be64 <_vfprintf_r+0x1574>
	ldr	r1, [sp, #168]	; 0xa8
	str	r8, [sp, #124]	; 0x7c
	mov	r4, #16
	mov	r8, r3
	mov	r0, r1
	mov	r3, r9
	ldr	r2, [sp, #164]	; 0xa4
	mov	r9, r5
	str	ip, [sp, #100]	; 0x64
	mov	r5, ip
	b	lab505
lab507: 	cmp	r6, #16
	ble	lab506
lab509: 	add	r0, r0, #16
	cmp	r2, #7
	str	r5, [r3]
	str	r4, [r3, #4]
	str	r0, [sp, #168]	; 0xa8
	str	r2, [sp, #164]	; 0xa4
	addle	r3, r3, #8
	ble	lab507
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab508
	sub	r6, r6, #16
	cmp	r6, #16
	ldr	r0, [sp, #168]	; 0xa8
	ldr	r2, [sp, #164]	; 0xa4
	add	r3, sp, #172	; 0xac
	bgt	lab509
lab506: 	mov	r1, r0
	mov	r5, r9
	mov	r9, r3
	mov	r3, r8
	ldr	r8, [sp, #124]	; 0x7c
lab720: 	ldr	r0, [sp, #100]	; 0x64
	add	r4, r6, r1
	cmp	r2, #7
	str	r0, [r9]
	str	r6, [r9, #4]
	str	r2, [sp, #164]	; 0xa4
	str	r4, [sp, #168]	; 0xa8
	bgt	lab510
	ldrb	r2, [sp, #131]	; 0x83
	add	r9, r9, #8
	b	lab511
lab396: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	str	r3, [sp, #100]	; 0x64
	bl	__sprint_r
	cmp	r0, #0
	bne	lab512
	ldr	r4, [sp, #168]	; 0xa8
	ldr	r3, [sp, #100]	; 0x64
	add	r9, sp, #172	; 0xac
	b	lab513
lab398: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab514
	ldr	r4, [sp, #168]	; 0xa8
	add	r9, sp, #172	; 0xac
	b	lab515
lab488: 	ldr	r1, [sp, #104]	; 0x68
lab516: 	ldrb	r2, [r1, r2]
	lsr	r4, r4, #4
	orr	r4, r4, r6, lsl #28
	lsr	r6, r6, #4
	strb	r2, [r3, #-1]!
	orrs	r2, r4, r6
	bne	lab516
	add	r2, sp, #336	; 0x150
	str	r3, [sp, #56]	; 0x38
	sub	r3, r2, r3
	ldr	sl, [sp, #28]
	str	r3, [sp, #40]	; 0x28
	b	lab517
lab404: 	cmp	r5, #16
	ble	lab518
	ldr	sl, [pc, #1264]	; be64 <_vfprintf_r+0x1574>
	mov	r6, #16
	ldr	r3, [sp, #164]	; 0xa4
	str	sl, [sp, #100]	; 0x64
	b	lab519
lab521: 	cmp	r5, #16
	ble	lab520
lab523: 	cmp	r3, #7
	add	r4, r4, #16
	str	sl, [r9]
	str	r6, [r9, #4]
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	ble	lab521
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab522
	sub	r5, r5, #16
	add	r3, sp, #164	; 0xa4
	cmp	r5, #16
	ldm	r3, {r3, r4}
	add	r9, sp, #172	; 0xac
	bgt	lab523
lab731: 	ldr	r2, [sp, #100]	; 0x64
	add	r4, r4, r5
	cmp	r3, #7
	stm	r9, {r2, r5}
	str	r3, [sp, #164]	; 0xa4
	str	r4, [sp, #168]	; 0xa8
	ble	lab524
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab525
	ldr	r4, [sp, #168]	; 0xa8
	b	lab526
lab420: 	str	sl, [sp, #28]
lab487: 	cmp	r4, #10
	sbcs	r3, r6, #0
	bcs	lab527
	mov	r3, #1
	str	r3, [sp, #40]	; 0x28
	add	r3, sp, #332	; 0x14c
	add	r4, r4, #48	; 0x30
	add	r3, r3, #3
	strb	r4, [sp, #335]	; 0x14f
	ldr	sl, [sp, #28]
	str	r3, [sp, #56]	; 0x38
	b	lab528
lab457: 	ldr	r5, [sp, #136]	; 0x88
	cmp	r5, #0
	ble	lab529
	ldr	r3, [sp, #68]	; 0x44
	ldr	r2, [sp, #76]	; 0x4c
	cmp	r3, r2
	movlt	r6, r3
	movge	r6, r2
	cmp	r6, #0
	ble	lab530
	ldr	r3, [sp, #56]	; 0x38
	stm	r9, {r3, r6}
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	add	r4, r4, r6
	cmp	r3, #7
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	bgt	lab531
lab706: 	cmp	r6, #0
	subge	r5, r5, r6
	cmp	r5, #0
	bgt	lab532
lab653: 	ldr	r2, [sp, #68]	; 0x44
	tst	sl, #1024	; 0x400
	add	r3, r3, r2
	str	r3, [sp, #60]	; 0x3c
	bne	lab533
lab751: 	ldr	r3, [sp, #76]	; 0x4c
	cmp	r5, r3
	blt	lab534
	tst	sl, #1
	beq	lab535
lab534: 	ldr	r3, [sp, #92]	; 0x5c
	ldr	r2, [sp, #96]	; 0x60
	add	r4, r4, r3
	stm	r9, {r2, r3}
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	cmp	r3, #7
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	bgt	lab536
lab715: 	ldr	r3, [sp, #76]	; 0x4c
	add	r6, r2, r3
	ldr	r2, [sp, #60]	; 0x3c
	sub	r5, r3, r5
	sub	r6, r6, r2
	cmp	r5, r6
	movlt	r6, r5
	cmp	r6, #0
	ble	lab537
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	add	r4, r4, r6
	cmp	r3, #7
	str	r2, [r9]
	str	r6, [r9, #4]
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	bgt	lab538
lab722: 	subge	r5, r5, r6
	cmp	r5, #0
	ble	lab539
	cmp	r5, #16
	ble	lab540
	mov	r6, #16
	ldr	r3, [sp, #164]	; 0xa4
	b	lab541
lab545: 	cmp	r5, #16
	ble	lab542
lab541: 	add	r3, r3, #1
	ldr	r2, [pc, #704]	; be60 <_vfprintf_r+0x1570>
	cmp	r3, #7
	add	r4, r4, #16
	stm	r9, {r2, r6}
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	ble	lab543
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab544
	add	r3, sp, #164	; 0xa4
	ldm	r3, {r3, r4}
	add	r9, sp, #172	; 0xac
	b	lab545
lab496: 	tst	sl, #1
	bne	lab546
	ldr	r3, [sp, #56]	; 0x38
	str	r3, [r9]
	mov	r3, #1
	ldr	r5, [sp, #164]	; 0xa4
	add	r5, r5, r3
	add	r4, r4, #1
	cmp	r5, #7
	str	r4, [sp, #168]	; 0xa8
	str	r3, [r9, #4]
	str	r5, [sp, #164]	; 0xa4
	ble	lab547
lab624: 	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab548
	ldr	r4, [sp, #168]	; 0xa8
	ldr	r5, [sp, #164]	; 0xa4
	add	r9, sp, #172	; 0xac
	b	lab549
lab499: 	ldr	r3, [sp, #76]	; 0x4c
	sub	r6, r3, #1
	cmp	r6, #0
	ble	lab550
	cmp	r6, #16
	ble	lab551
	mov	r3, #16
	b	lab552
lab556: 	cmp	r6, #16
	ble	lab553
lab552: 	add	r5, r5, #1
	ldr	r2, [pc, #492]	; be60 <_vfprintf_r+0x1570>
	cmp	r5, #7
	add	r4, r4, #16
	stm	r9, {r2, r3}
	str	r4, [sp, #168]	; 0xa8
	str	r5, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	ble	lab554
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab555
	mov	r3, #16
	ldr	r4, [sp, #168]	; 0xa8
	ldr	r5, [sp, #164]	; 0xa4
	add	r9, sp, #172	; 0xac
	b	lab556
lab423: 	ldr	r3, [sp, #28]
	ands	r3, r3, #16
	bne	lab557
	ldr	r2, [sp, #28]
	ands	r2, r2, #64	; 0x40
	beq	lab558
	ldr	r1, [sp, #52]	; 0x34
	ldr	r4, [r1], #4
	lsl	r4, r4, #16
	mov	r6, r3
	mov	r2, #1
	str	r1, [sp, #52]	; 0x34
	lsr	r4, r4, #16
	b	lab559
lab435: 	ands	r3, sl, #16
	bne	lab560
	ands	r2, sl, #64	; 0x40
	beq	lab561
	ldr	r2, [sp, #52]	; 0x34
	ldr	r4, [r2], #4
	lsl	r4, r4, #16
	mov	r6, r3
	str	r2, [sp, #52]	; 0x34
	lsr	r4, r4, #16
	b	lab562
lab418: 	mov	r3, #45	; 0x2d
	rsbs	r4, r4, #0
	mov	r2, #1
	str	sl, [sp, #28]
	strb	r3, [sp, #131]	; 0x83
	rsc	r6, r6, #0
	b	lab563
lab459: 	tst	sl, #1
	beq	lab564
	b	lab565
lab529: 	mov	r3, #1
	str	r3, [r9, #4]
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	cmp	r3, #7
	str	r3, [sp, #164]	; 0xa4
	ldr	r3, [pc, #224]	; be44 <_vfprintf_r+0x1554>
	add	r4, r4, #1
	str	r3, [r9]
	str	r4, [sp, #168]	; 0xa8
	addle	r9, r9, #8
	bgt	lab566
lab703: 	orrs	r3, r3, r5
	beq	lab567
	ldr	r3, [sp, #92]	; 0x5c
	ldr	r2, [sp, #96]	; 0x60
	add	r4, r3, r4
	stm	r9, {r2, r3}
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	cmp	r3, #7
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	bgt	lab568
lab708: 	blt	lab569
lab738: 	str	r2, [r9]
	ldr	r2, [sp, #76]	; 0x4c
	add	r3, r3, #1
	add	r4, r2, r4
	cmp	r3, #7
	str	r3, [sp, #164]	; 0xa4
	str	r2, [r9, #4]
	str	r4, [sp, #168]	; 0xa8
	ble	lab570
	b	lab571
lab442: 	tst	sl, #512	; 0x200
	bne	lab572
lab441: 	asr	r6, r4, #31
	str	r3, [sp, #52]	; 0x34
	mov	r3, r6
	b	lab573
lab451: 	ldr	r3, [sp, #52]	; 0x34
	ldr	r0, [sp, #36]	; 0x24
	ldr	r1, [r3], #4
	asr	r2, r0, #31
	stm	r1, {r0, r2}
	str	r3, [sp, #52]	; 0x34
	b	lab574
lab557: 	ldr	r3, [sp, #52]	; 0x34
	ldr	r4, [r3], #4
	mov	r2, #1
	str	r3, [sp, #52]	; 0x34
	b	lab575
lab560: 	ldr	r3, [sp, #52]	; 0x34
	ldr	r4, [r3], #4
	str	r3, [sp, #52]	; 0x34
	b	lab576
	svcvc	0x00efffff
	andeq	r2, r1, ip, asr pc
	andeq	r2, r1, r0, ror #30
	andeq	r2, r1, ip, ror #30
	eorsmi	r0, r0, r0
	svccc	0x00e00000
	andeq	r2, r1, r0, lsr #30
	andeq	r2, r1, ip, lsl #30
	andeq	r2, r1, r4, lsr pc
	strbtvs	r6, [r6], -r7, ror #12
	andeq	r2, r1, r0, lsl #31
	andeq	r2, r1, r0, ror pc
lab408: 	add	r1, sp, #80	; 0x50
	ldm	r1, {r0, r1}
	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dcmpun
	cmp	r0, #0
	bne	lab577
	ldr	r2, [sp, #64]	; 0x40
	bic	r3, r2, #32
	cmp	r3, #65	; 0x41
	str	r3, [sp, #28]
	bne	lab578
	cmp	r2, #97	; 0x61
	moveq	r3, #120	; 0x78
	movne	r3, #88	; 0x58
	strb	r3, [sp, #133]	; 0x85
	mov	r3, #48	; 0x30
	cmp	r5, #99	; 0x63
	strb	r3, [sp, #132]	; 0x84
	addle	r3, sp, #236	; 0xec
	strle	r0, [sp, #48]	; 0x30
	strle	r3, [sp, #56]	; 0x38
	bgt	lab579
lab667: 	ldm	r2, {r1, r2}
	mov	r3, r2
	cmp	r3, #0
	bge	lab580
	mov	r1, #45	; 0x2d
	add	r4, sp, #80	; 0x50
	ldm	r4, {r3, r4}
	str	r1, [sp, #60]	; 0x3c
	mov	r2, r3
	add	r3, r4, #-2147483648	; 0x80000000
lab658: 	mov	r1, r3
	add	r2, sp, #136	; 0x88
	bl	frexp
	push{r1, r2}
	mov.w r1, #3671
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, #0
	mov	r3, #1069547520	; 0x3fc00000
	push {r1, r2}
	mov.w r1, #7938
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7938
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #7938
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7938
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r1
	mov	r2, r0
	str	r2, [sp, #40]	; 0x28
	str	r3, [sp, #44]	; 0x2c
	mov	r3, #0
	mov	r2, #0
	push {r1, r2}
	mov.w r1, #6227
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmpeq
	push{r1, r2}
	mov.w r1, #6227
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	movne	r3, #1
	ldr	r1, [sp, #64]	; 0x40
	strne	r3, [sp, #136]	; 0x88
	ldr	r3, [pc, #-236]	; be54 <_vfprintf_r+0x1564>
	cmp	r1, #97	; 0x61
	ldr	r2, [pc, #-248]	; be50 <_vfprintf_r+0x1560>
	movne	r2, r3
	str	sl, [sp, #76]	; 0x4c
	str	fp, [sp, #100]	; 0x64
	str	r7, [sp, #108]	; 0x6c
	str	r2, [sp, #68]	; 0x44
	mov	r7, r2
	ldr	r6, [sp, #56]	; 0x38
	str	r9, [sp, #88]	; 0x58
	add	fp, sp, #40	; 0x28
	ldm	fp, {sl, fp}
	str	r8, [sp, #124]	; 0x7c
	sub	r4, r5, #1
	b	lab581
lab583: 	mov	r3, #0
	push {r1, r2}
	mov.w r1, #4958
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmpeq
	push{r1, r2}
	mov.w r1, #4958
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bne	lab582
lab581: 	mov	r2, #0
	ldr	r3, [pc, #-336]	; be48 <_vfprintf_r+0x1558>
	mov	r0, sl
	mov	r1, fp
	push {r1, r2}
	mov.w r1, #3200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #3200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	fp, r1
	mov	sl, r0
	bl	__aeabi_d2iz
	mov	r5, r0
	push {r1, r2}
	mov.w r1, #4911
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #4911
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r1
	mov	r2, r0
	mov	r1, fp
	mov	r0, sl
	bl	__aeabi_dsub
	ldrb	r3, [r7, r5]
	cmn	r4, #1
	mov	r8, r6
	mov	r9, r4
	mov	sl, r0
	mov	fp, r1
	strb	r3, [r6], #1
	sub	r4, r4, #1
	bne	lab583
lab582: 	mov	r0, sl
	mov	r1, fp
	mov	r2, #0
	ldr	r3, [pc, #-436]	; be4c <_vfprintf_r+0x155c>
	str	r8, [sp, #72]	; 0x48
	str	r9, [sp, #40]	; 0x28
	mov	r4, r0
	ldr	sl, [sp, #76]	; 0x4c
	str	r5, [sp, #76]	; 0x4c
	mov	r5, r1
	bl	__aeabi_dcmpgt
	cmp	r0, #0
	ldr	r9, [sp, #88]	; 0x58
	ldr	fp, [sp, #100]	; 0x64
	ldr	r7, [sp, #108]	; 0x6c
	ldr	r8, [sp, #124]	; 0x7c
	bne	lab584
	mov	r0, r4
	mov	r1, r5
	mov	r2, #0
	ldr	r3, [pc, #-504]	; be4c <_vfprintf_r+0x155c>
	push {r1, r2}
	mov.w r1, #3147
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmpeq
	push{r1, r2}
	mov.w r1, #3147
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab585
	ldr	r3, [sp, #76]	; 0x4c
	tst	r3, #1
	bne	lab586
lab585: 	ldr	r3, [sp, #40]	; 0x28
	cmp	r3, #0
	blt	lab587
	mov	r2, #48	; 0x30
	ldr	r3, [sp, #40]	; 0x28
	add	r3, r3, #1
	add	r3, r6, r3
lab588: 	cmp	r3, r6
	bne	lab588
lab744: 	sub	r3, r6, r3
	str	r3, [sp, #76]	; 0x4c
	orr	sl, sl, #2
lab760: 	str	r3, [sp, #68]	; 0x44
	b	lab589
	str	r3, [sp, #64]	; 0x40
	ldr	r3, [pc, #-600]	; be50 <_vfprintf_r+0x1560>
	str	r3, [sp, #104]	; 0x68
lab594: 	beq	lab590
	ldr	r3, [sp, #52]	; 0x34
	add	r3, r3, #7
	bic	r3, r3, #7
	ldr	r6, [r3, #4]
	ldr	r4, [r3], #8
	str	r3, [sp, #52]	; 0x34
lab634: 	moveq	r3, #0
	andne	r3, sl, #1
	cmp	r3, #0
	ldrne	r3, [sp, #64]	; 0x40
	strbne	r3, [sp, #133]	; 0x85
	movne	r3, #48	; 0x30
	orrne	sl, sl, #2
	strbne	r3, [sp, #132]	; 0x84
	bic	r3, sl, #1024	; 0x400
	mov	r2, #2
	str	r3, [sp, #28]
	b	lab591
	str	r3, [sp, #64]	; 0x40
	str	sl, [sp, #28]
	b	lab592
	str	r3, [sp, #64]	; 0x40
	b	lab593
	str	r3, [sp, #64]	; 0x40
	ldr	r3, [pc, #-712]	; be54 <_vfprintf_r+0x1564>
	str	r3, [sp, #104]	; 0x68
	b	lab594
lab460: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab595
	ldr	r4, [sp, #168]	; 0xa8
	add	r9, sp, #172	; 0xac
	b	lab596
lab413: 	cmp	r5, #6
	movcc	r3, r5
	movcs	r3, #6
	ldr	r2, [sp, #56]	; 0x38
	ldr	r1, [pc, #-772]	; be58 <_vfprintf_r+0x1568>
	mov	r5, r2
	str	r3, [sp, #28]
	str	r4, [sp, #52]	; 0x34
	str	r2, [sp, #48]	; 0x30
	str	r1, [sp, #56]	; 0x38
	str	r3, [sp, #40]	; 0x28
	str	r2, [sp, #88]	; 0x58
	str	r2, [sp, #72]	; 0x48
	str	r2, [sp, #68]	; 0x44
	b	lab597
lab590: 	ands	r3, sl, #16
	beq	lab598
	ldr	r3, [sp, #52]	; 0x34
	ldr	r4, [r3], #4
	str	r3, [sp, #52]	; 0x34
	b	lab599
lab498: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab600
	ldr	r4, [sp, #168]	; 0xa8
	ldr	r5, [sp, #164]	; 0xa4
	add	r9, sp, #172	; 0xac
	b	lab601
lab497: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab602
	ldr	r4, [sp, #168]	; 0xa8
	ldr	r5, [sp, #164]	; 0xa4
	add	r9, sp, #172	; 0xac
	b	lab603
lab494: 	ldr	r0, [fp, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	ldrh	r3, [fp, #12]
	b	lab604
lab510: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	str	r3, [sp, #100]	; 0x64
	bl	__sprint_r
	cmp	r0, #0
	bne	lab605
	ldrb	r2, [sp, #131]	; 0x83
	ldr	r4, [sp, #168]	; 0xa8
	ldr	r3, [sp, #100]	; 0x64
	add	r9, sp, #172	; 0xac
	b	lab606
lab598: 	ands	r2, sl, #64	; 0x40
	beq	lab607
	ldr	r2, [sp, #52]	; 0x34
	ldr	r4, [r2], #4
	lsl	r4, r4, #16
	mov	r6, r3
	str	r2, [sp, #52]	; 0x34
	lsr	r4, r4, #16
	b	lab608
lab490: 	mov	r3, #48	; 0x30
	ldr	r1, [sp, #56]	; 0x38
	sub	r2, r2, #2
	strb	r3, [r1, #-1]
	add	r3, sp, #336	; 0x150
	sub	r3, r3, r2
	ldr	sl, [sp, #28]
	str	r3, [sp, #40]	; 0x28
	str	r2, [sp, #56]	; 0x38
	b	lab609
lab458: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab610
	ldr	r4, [sp, #168]	; 0xa8
	add	r9, sp, #172	; 0xac
	b	lab611
lab540: 	ldr	r3, [sp, #164]	; 0xa4
lab542: 	add	r3, r3, #1
	str	r5, [r9, #4]
	cmp	r3, #7
	str	r3, [sp, #164]	; 0xa4
	ldr	r3, [pc, #-1108]	; be60 <_vfprintf_r+0x1570>
	add	r4, r4, r5
	str	r3, [r9]
	str	r4, [sp, #168]	; 0xa8
	ble	lab612
	b	lab613
lab527: 	mov	r3, #0
	ldr	r2, [sp, #28]
	and	r2, r2, #1024	; 0x400
	str	r5, [sp, #40]	; 0x28
	str	fp, [sp, #60]	; 0x3c
	str	r7, [sp, #68]	; 0x44
	mov	r5, r3
	mov	fp, r2
	str	r9, [sp, #48]	; 0x30
	ldr	r7, [sp, #116]	; 0x74
	add	sl, sp, #336	; 0x150
	b	lab614
lab617: 	mov	r1, r6
	mov	r3, #0
	mov	r2, #10
	push {r1, r2}
	mov.w r1, #1796
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_uldivmod
	push{r1, r2}
	mov.w r1, #1796
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r4, #10
	sbcs	r3, r6, #0
	mov	r4, r0
	mov	r6, r1
	bcc	lab615
lab716: lab614: 	mov	r0, r4
	mov	r1, r6
	mov	r2, #10
	mov	r3, #0
	push {r1, r2}
	mov.w r1, #4797
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_uldivmod
	push{r1, r2}
	mov.w r1, #4797
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	fp, #0
	add	r2, r2, #48	; 0x30
	strb	r2, [sl, #-1]
	sub	r9, sl, #1
	add	r5, r5, #1
	beq	lab616
	ldrb	r3, [r7]
	subs	r2, r3, #255	; 0xff
	movne	r2, #1
	cmp	r3, r5
	movne	r2, #0
	cmp	r2, #0
	beq	lab617
	cmp	r4, #10
	sbcs	r3, r6, #0
	bcs	lab618
lab615: 	mov	r3, r9
	add	r2, sp, #336	; 0x150
	sub	r3, r2, r3
	str	r9, [sp, #56]	; 0x38
	str	r7, [sp, #116]	; 0x74
	str	r5, [sp, #76]	; 0x4c
	ldr	r9, [sp, #48]	; 0x30
	ldr	r5, [sp, #40]	; 0x28
	ldr	fp, [sp, #60]	; 0x3c
	ldr	r7, [sp, #68]	; 0x44
	ldr	sl, [sp, #28]
	str	r3, [sp, #40]	; 0x28
	b	lab619
lab454: 	ldr	r3, [sp, #52]	; 0x34
	ldr	r1, [sp, #36]	; 0x24
	ldr	r2, [r3], #4
	str	r1, [r2]
	str	r3, [sp, #52]	; 0x34
	b	lab620
lab392: 	mov	r3, r7
	mov	r7, fp
	mov	fp, r3
	ldr	r3, [sp, #168]	; 0xa8
	cmp	r3, #0
	bne	lab621
lab732: 	str	r3, [sp, #164]	; 0xa4
	b	lab622
lab553: 	add	r5, r5, #1
	ldr	r3, [pc, #-1424]	; be60 <_vfprintf_r+0x1570>
	add	r4, r4, r6
	cmp	r5, #7
	str	r6, [r9, #4]
	str	r3, [r9]
	str	r4, [sp, #168]	; 0xa8
	str	r5, [sp, #164]	; 0xa4
	ble	lab623
	b	lab624
lab532: 	cmp	r5, #16
	ble	lab625
	mov	r6, #16
	ldr	r3, [sp, #164]	; 0xa4
	b	lab626
lab630: 	cmp	r5, #16
	ble	lab627
lab626: 	add	r3, r3, #1
	ldr	r2, [pc, #-1496]	; be60 <_vfprintf_r+0x1570>
	cmp	r3, #7
	add	r4, r4, #16
	stm	r9, {r2, r6}
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	ble	lab628
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab629
	add	r3, sp, #164	; 0xa4
	ldm	r3, {r3, r4}
	add	r9, sp, #172	; 0xac
	b	lab630
lab414: 	ldr	r0, [sp, #56]	; 0x38
	str	r4, [sp, #52]	; 0x34
	bl	strlen
	bic	r3, r0, r0, asr #31
	mov	r5, r6
	ldrb	r2, [sp, #131]	; 0x83
	str	r0, [sp, #40]	; 0x28
	str	r6, [sp, #48]	; 0x30
	str	r6, [sp, #88]	; 0x58
	str	r6, [sp, #72]	; 0x48
	str	r6, [sp, #68]	; 0x44
	str	r3, [sp, #28]
	b	lab631
lab558: 	ldr	r3, [sp, #28]
	ands	r6, r3, #512	; 0x200
	ldr	r3, [sp, #52]	; 0x34
	ldrne	r4, [r3], #4
	ldreq	r4, [r3], #4
	movne	r6, r2
	moveq	r2, #1
	movne	r2, #1
	strne	r3, [sp, #52]	; 0x34
	streq	r3, [sp, #52]	; 0x34
	andne	r4, r4, #255	; 0xff
	b	lab632
lab561: 	ldr	r3, [sp, #52]	; 0x34
	ands	r6, sl, #512	; 0x200
	ldrne	r4, [r3], #4
	ldreq	r4, [r3], #4
	movne	r6, r2
	strne	r3, [sp, #52]	; 0x34
	streq	r3, [sp, #52]	; 0x34
	andne	r4, r4, #255	; 0xff
	b	lab633
lab607: 	ldr	r3, [sp, #52]	; 0x34
	ands	r6, sl, #512	; 0x200
	ldrne	r4, [r3], #4
	ldreq	r4, [r3], #4
	movne	r6, r2
	strne	r3, [sp, #52]	; 0x34
	streq	r3, [sp, #52]	; 0x34
	andne	r4, r4, #255	; 0xff
	b	lab634
lab478: 	ldr	r3, [sp, #164]	; 0xa4
	b	lab635
lab578: 	cmn	r5, #1
	beq	lab636
	ldr	r3, [sp, #28]
	cmp	r3, #71	; 0x47
	cmpeq	r5, #0
	bne	lab637
	add	r4, sp, #80	; 0x50
	ldm	r4, {r3, r4}
	orr	r2, sl, #256	; 0x100
	subs	r6, r4, #0
	str	r2, [sp, #48]	; 0x30
	blt	lab638
	mov	r5, #1
	mov	r4, r5
	str	r0, [sp, #60]	; 0x3c
	str	r3, [sp, #40]	; 0x28
lab758: 	str	r1, [sp]
	add	r1, sp, #152	; 0x98
	str	r1, [sp, #16]
	add	r1, sp, #140	; 0x8c
	str	r1, [sp, #12]
	add	r1, sp, #136	; 0x88
	mov	r3, r6
	mov	r0, fp
	ldr	r2, [sp, #40]	; 0x28
	str	r4, [sp, #4]
	str	r1, [sp, #8]
	push {r1, r2}
	mov.w r1, #7311
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7311
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7311
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7311
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_dtoa_r
	push{r1, r2}
	mov.w r1, #7311
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7311
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7311
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7311
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [sp, #28]
	cmp	r3, #71	; 0x47
	str	r0, [sp, #56]	; 0x38
	bne	lab639
	tst	sl, #1
	bne	lab640
	ldr	r3, [sp, #152]	; 0x98
lab665: 	cmp	r2, #71	; 0x47
	ldr	r2, [sp, #56]	; 0x38
	sub	r3, r3, r2
	str	r3, [sp, #76]	; 0x4c
	bne	lab641
	ldr	r2, [sp, #136]	; 0x88
	cmn	r2, #3
	movge	r3, #0
	movlt	r3, #1
	cmp	r2, r5
	orrgt	r3, r3, #1
	cmp	r3, #0
	str	r2, [sp, #68]	; 0x44
	beq	lab642
	mov	r2, #0
	ldr	r3, [sp, #64]	; 0x40
	sub	r3, r3, #2
	str	r3, [sp, #64]	; 0x40
	bic	r3, r3, #32
	str	r2, [sp, #48]	; 0x30
	str	r3, [sp, #28]
lab589: 	ldr	r3, [sp, #28]
	ldr	r2, [sp, #64]	; 0x40
	cmp	r3, #65	; 0x41
	ldr	r3, [sp, #68]	; 0x44
	addeq	r2, r2, #15
	sub	r3, r3, #1
	cmp	r3, #0
	and	r2, r2, #255	; 0xff
	strb	r2, [sp, #144]	; 0x90
	movlt	r2, #45	; 0x2d
	movge	r2, #43	; 0x2b
	str	r3, [sp, #136]	; 0x88
	ldrlt	r3, [sp, #68]	; 0x44
	rsblt	r3, r3, #1
	cmp	r3, #9
	strb	r2, [sp, #145]	; 0x91
	ble	lab643
	add	r0, sp, #159	; 0x9f
	mov	r2, r0
lab644: 	ldr	ip, [pc, #-2064]	; be5c <_vfprintf_r+0x156c>
	smull	r2, ip, r3, ip
	asr	r2, r3, #31
	rsb	r2, r2, ip, asr #2
	add	ip, r2, r2, lsl #2
	cmp	r3, #99	; 0x63
	sub	r3, r3, ip, lsl #1
	add	r3, r3, #48	; 0x30
	strb	r3, [r1, #-1]
	mov	r3, r2
	sub	r2, r1, #1
	bgt	lab644
	add	r3, r3, #48	; 0x30
	sub	ip, r1, #2
	and	r3, r3, #255	; 0xff
	cmp	r0, ip
	strb	r3, [r2, #-1]
	bls	lab645
	add	ip, sp, #146	; 0x92
	b	lab646
lab647: lab646: 	cmp	r0, r2
	strb	r3, [ip], #1
	bne	lab647
	add	r3, sp, #161	; 0xa1
	add	r2, sp, #146	; 0x92
	sub	r3, r3, r1
	add	r3, r2, r3
	add	r2, sp, #144	; 0x90
	sub	r3, r3, r2
	str	r3, [sp, #108]	; 0x6c
lab761: 	ldr	r2, [sp, #108]	; 0x6c
	cmp	r3, #1
	add	r3, r2, r3
	str	r3, [sp, #40]	; 0x28
	ble	lab648
lab750: 	ldr	r2, [sp, #92]	; 0x5c
	add	r3, r3, r2
	str	r3, [sp, #40]	; 0x28
lab749: 	orr	sl, r3, #256	; 0x100
	mov	r3, #0
	ldr	r2, [sp, #40]	; 0x28
	bic	r2, r2, r2, asr #31
	str	r3, [sp, #88]	; 0x58
	str	r2, [sp, #28]
	str	r3, [sp, #72]	; 0x48
	str	r3, [sp, #68]	; 0x44
lab681: 	cmp	r3, #0
	bne	lab649
	mov	r5, r3
	ldrb	r2, [sp, #131]	; 0x83
	b	lab650
lab625: 	ldr	r3, [sp, #164]	; 0xa4
lab627: 	add	r3, r3, #1
	cmp	r3, #7
	str	r3, [sp, #164]	; 0xa4
	ldr	r3, [pc, #-2300]	; be60 <_vfprintf_r+0x1570>
	add	r4, r4, r5
	str	r5, [r9, #4]
	str	r3, [r9]
	str	r4, [sp, #168]	; 0xa8
	addle	r9, r9, #8
	ble	lab651
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab652
	ldr	r4, [sp, #168]	; 0xa8
	add	r9, sp, #172	; 0xac
	b	lab653
lab535: 	ldr	r2, [sp, #56]	; 0x38
	ldr	r3, [sp, #76]	; 0x4c
	add	r6, r2, r3
	ldr	r2, [sp, #60]	; 0x3c
	sub	r5, r3, r5
	sub	r6, r6, r2
	cmp	r5, r6
	movlt	r6, r5
	b	lab654
lab453: 	ldr	r3, [sp, #52]	; 0x34
	ldr	r1, [sp, #36]	; 0x24
	ldr	r2, [r3], #4
	strh	r1, [r2]
	str	r3, [sp, #52]	; 0x34
	b	lab655
lab572: 	lsl	r4, r4, #24
	asr	r6, r4, #31
	str	r3, [sp, #52]	; 0x34
	asr	r4, r4, #24
	mov	r3, r6
	b	lab656
lab388: 	ldr	r0, [fp, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	b	lab657
lab580: 	mov	r2, r1
	mov	r1, #0
	str	r1, [sp, #60]	; 0x3c
	b	lab658
lab636: 	mov	r5, #6
lab637: 	add	r4, sp, #80	; 0x50
	ldm	r4, {r3, r4}
	orr	r2, sl, #256	; 0x100
	subs	r6, r4, #0
	str	r2, [sp, #48]	; 0x30
	blt	lab659
	str	r3, [sp, #40]	; 0x28
	mov	r3, #0
	str	r3, [sp, #60]	; 0x3c
lab739: 	cmp	r3, #70	; 0x46
	bne	lab660
	mov	r1, #3
	str	r1, [sp]
	add	r1, sp, #152	; 0x98
	ldr	r4, [sp, #40]	; 0x28
	str	r1, [sp, #16]
	add	r1, sp, #140	; 0x8c
	str	r1, [sp, #12]
	add	r1, sp, #136	; 0x88
	mov	r2, r4
	mov	r3, r6
	str	r1, [sp, #8]
	mov	r0, fp
	str	r5, [sp, #4]
	push {r1, r2}
	mov.w r1, #7173
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7173
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7173
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7173
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_dtoa_r
	push{r1, r2}
	mov.w r1, #7173
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7173
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7173
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7173
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	ip, r0
	str	r0, [sp, #56]	; 0x38
	mov	r0, r4
	ldrb	r4, [ip]
	sub	r3, r4, #48	; 0x30
	rsbs	r4, r3, #0
	adc	r4, r4, r3
	mov	r1, r6
	mov	r3, #0
	mov	r2, #0
	push {r1, r2}
	mov.w r1, #3075
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmpeq
	push{r1, r2}
	mov.w r1, #3075
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	movne	r4, #0
	andeq	r4, r4, #1
	cmp	r4, #0
	ldreq	r3, [sp, #136]	; 0x88
	bne	lab661
lab756: 	add	r3, r3, r5
	add	r4, r2, r3
lab718: 	mov	r1, r6
	mov	r2, #0
	ldr	r0, [sp, #40]	; 0x28
	push {r1, r2}
	mov.w r1, #5378
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmpeq
	push{r1, r2}
	mov.w r1, #5378
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	movne	r3, r4
	bne	lab662
	ldr	r3, [sp, #152]	; 0x98
	cmp	r3, r4
	bcs	lab663
	mov	r1, #48	; 0x30
lab664: 	str	r2, [sp, #152]	; 0x98
	strb	r1, [r3]
	ldr	r3, [sp, #152]	; 0x98
	cmp	r4, r3
	bhi	lab664
	b	lab665
lab579: 	mov	r0, fp
	add	r1, r5, #1
	push {r1, r2}
	mov.w r1, #5317
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5317
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5317
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5317
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_malloc_r
	push{r1, r2}
	mov.w r1, #5317
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5317
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5317
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5317
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r3, r0, #0
	str	r3, [sp, #56]	; 0x38
	beq	lab666
	ldr	r3, [sp, #56]	; 0x38
	str	r3, [sp, #48]	; 0x30
	b	lab667
lab641: 	ldr	r3, [sp, #28]
	cmp	r3, #70	; 0x46
	bne	lab668
	ldr	r2, [sp, #136]	; 0x88
	cmp	r2, #0
	str	r2, [sp, #68]	; 0x44
	and	r3, sl, #1
	ble	lab669
	orrs	r3, r3, r5
	bne	lab670
	ldr	r3, [sp, #68]	; 0x44
	str	r3, [sp, #40]	; 0x28
	mov	r3, #102	; 0x66
	str	r3, [sp, #64]	; 0x40
lab748: 	bne	lab671
lab746: 	bic	r3, r3, r3, asr #31
	str	r3, [sp, #28]
lab754: 	ldr	sl, [sp, #48]	; 0x30
	str	r3, [sp, #88]	; 0x58
	str	r3, [sp, #48]	; 0x30
	str	r3, [sp, #72]	; 0x48
	b	lab672
lab642: 	ldr	r3, [sp, #68]	; 0x44
	ldr	r2, [sp, #76]	; 0x4c
	cmp	r3, r2
	blt	lab673
	tst	sl, #1
	beq	lab674
	ldr	r2, [sp, #92]	; 0x5c
	add	r3, r3, r2
	str	r3, [sp, #40]	; 0x28
lab745: 	beq	lab675
	ldr	r3, [sp, #68]	; 0x44
	cmp	r3, #0
	mov	r3, #103	; 0x67
	str	r3, [sp, #64]	; 0x40
	ble	lab676
lab671: 	ldr	r1, [sp, #116]	; 0x74
	ldrb	r3, [r1]
	cmp	r3, #255	; 0xff
	beq	lab677
	mov	ip, #0
	ldr	r2, [sp, #68]	; 0x44
	mov	r0, ip
	b	lab678
lab680: 	ldrb	r3, [r1, #1]
	cmp	r3, #0
	ldrbeq	r3, [r1]
	addne	r0, r0, #1
	addne	r1, r1, #1
	addeq	ip, ip, #1
	cmp	r3, #255	; 0xff
	beq	lab679
lab678: 	cmp	r3, r2
	blt	lab680
lab679: 	str	r2, [sp, #68]	; 0x44
	str	r1, [sp, #116]	; 0x74
	str	r0, [sp, #72]	; 0x48
	str	ip, [sp, #88]	; 0x58
lab763: 	ldr	r3, [sp, #72]	; 0x48
	ldr	r1, [sp, #40]	; 0x28
	add	r3, r3, r2
	ldr	r2, [sp, #120]	; 0x78
	mla	r2, r3, r2, r1
	mov	r3, #0
	ldr	sl, [sp, #48]	; 0x30
	str	r3, [sp, #48]	; 0x30
	bic	r3, r2, r2, asr #31
	str	r2, [sp, #40]	; 0x28
	str	r3, [sp, #28]
	b	lab681
lab649: 	mov	r2, #45	; 0x2d
	mov	r5, #0
	strb	r2, [sp, #131]	; 0x83
	b	lab682
lab533: 	ldr	r3, [sp, #88]	; 0x58
	ldr	r2, [sp, #72]	; 0x48
	cmp	r2, #0
	cmple	r3, #0
	ble	lab683
	ldr	r2, [sp, #56]	; 0x38
	ldr	r1, [sp, #76]	; 0x4c
	add	r2, r2, r1
	mov	r0, r4
	str	r2, [sp, #64]	; 0x40
	str	sl, [sp, #68]	; 0x44
	mov	r2, r9
	str	r8, [sp, #88]	; 0x58
	mov	r9, r7
	mov	r8, r3
	ldr	sl, [sp, #116]	; 0x74
	ldr	r6, [sp, #60]	; 0x3c
	ldr	r4, [sp, #120]	; 0x78
	b	lab684
lab713: 	cmp	r8, #0
	cmple	r3, #0
	add	r6, r6, ip
	ble	lab685
lab684: 	cmp	r8, #0
	ldreq	r3, [sp, #72]	; 0x48
	subeq	r3, r3, #1
	streq	r3, [sp, #72]	; 0x48
	ldr	r3, [sp, #112]	; 0x70
	stm	r2, {r3, r4}
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	subne	r8, r8, #1
	subeq	sl, sl, #1
	add	r0, r0, r4
	cmp	r3, #7
	str	r0, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r2, r2, #8
	bgt	lab686
lab699: 	ldrb	ip, [sl]
	sub	r3, r1, r6
	cmp	ip, r3
	movlt	r7, ip
	movge	r7, r3
	cmp	r7, #0
	str	r1, [sp, #40]	; 0x28
	ble	lab687
	ldr	ip, [sp, #164]	; 0xa4
	add	ip, ip, #1
	add	r0, r0, r7
	cmp	ip, #7
	stm	r2, {r6, r7}
	str	r0, [sp, #168]	; 0xa8
	str	ip, [sp, #164]	; 0xa4
	bgt	lab688
	ldrb	ip, [sl]
	add	r2, r2, #8
lab701: 	movlt	r5, ip
	subge	r5, ip, r7
	cmp	r5, #0
	ble	lab689
	cmp	r5, #16
	ble	lab690
	mov	r7, #16
	ldr	ip, [sp, #164]	; 0xa4
	b	lab691
lab693: 	cmp	r5, #16
	ble	lab692
lab695: 	ldr	r3, [pc, #-3392]	; be60 <_vfprintf_r+0x1570>
	cmp	ip, #7
	add	r0, r0, #16
	stm	r2, {r3, r7}
	str	r0, [sp, #168]	; 0xa8
	str	ip, [sp, #164]	; 0xa4
	addle	r2, r2, #8
	ble	lab693
	mov	r1, r9
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab694
	sub	r5, r5, #16
	cmp	r5, #16
	ldr	r0, [sp, #168]	; 0xa8
	ldr	ip, [sp, #164]	; 0xa4
	add	r2, sp, #172	; 0xac
	bgt	lab695
lab757: 	ldr	r3, [pc, #-3476]	; be60 <_vfprintf_r+0x1570>
	add	r0, r0, r5
	cmp	ip, #7
	str	r5, [r2, #4]
	str	ip, [sp, #164]	; 0xa4
	str	r3, [r2]
	str	r0, [sp, #168]	; 0xa8
	bgt	lab696
	ldrb	ip, [sl]
	add	r2, r2, #8
	b	lab697
lab686: 	mov	r1, r9
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab698
	ldr	r0, [sp, #168]	; 0xa8
	add	r2, sp, #172	; 0xac
	b	lab699
lab688: 	mov	r1, r9
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab700
	ldrb	ip, [sl]
	ldr	r0, [sp, #168]	; 0xa8
	add	r2, sp, #172	; 0xac
	b	lab701
lab566: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab702
	ldr	r5, [sp, #136]	; 0x88
	ldr	r4, [sp, #168]	; 0xa8
	add	r9, sp, #172	; 0xac
	b	lab703
lab712: 	mov	fp, r9
	b	lab704
lab531: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab705
	ldr	r4, [sp, #168]	; 0xa8
	add	r9, sp, #172	; 0xac
	b	lab706
lab710: 	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab707
	add	r3, sp, #164	; 0xa4
	ldr	r5, [sp, #136]	; 0x88
	ldm	r3, {r3, r4}
	add	r9, sp, #172	; 0xac
	b	lab708
lab567: 	tst	sl, #1
	beq	lab709
	ldr	r3, [sp, #92]	; 0x5c
	ldr	r2, [sp, #96]	; 0x60
	add	r4, r3, r4
	stm	r9, {r2, r3}
	ldr	r3, [sp, #164]	; 0xa4
	add	r3, r3, #1
	cmp	r3, #7
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	bgt	lab710
lab736: 	b	lab711
lab696: 	mov	r1, r9
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab712
	ldrb	ip, [sl]
	ldr	r0, [sp, #168]	; 0xa8
	add	r2, sp, #172	; 0xac
	b	lab713
lab536: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab714
	ldr	r5, [sp, #136]	; 0x88
	ldr	r4, [sp, #168]	; 0xa8
	add	r9, sp, #172	; 0xac
	b	lab715
lab618: 	ldr	r3, [sp, #120]	; 0x78
	sub	r9, r9, r3
	mov	r2, r3
	ldr	r1, [sp, #112]	; 0x70
	mov	r0, r9
	push {r1, r2}
	mov.w r1, #3802
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3802
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	strncpy
	push{r1, r2}
	mov.w r1, #3802
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3802
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldrb	r3, [r7, #1]
	mov	r0, r4
	cmp	r3, #0
	mov	r1, r6
	mov	r2, #10
	mov	r3, #0
	addne	r7, r7, #1
	push {r1, r2}
	mov.w r1, #3540
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_uldivmod
	push{r1, r2}
	mov.w r1, #3540
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r5, #0
	mov	r4, r0
	mov	r6, r1
	b	lab716
lab660: 	cmp	r3, #69	; 0x45
	bne	lab717
	mov	r1, #2
	str	r1, [sp]
	add	r1, sp, #152	; 0x98
	str	r1, [sp, #16]
	add	r1, sp, #140	; 0x8c
	str	r1, [sp, #12]
	add	r4, r5, #1
	add	r1, sp, #136	; 0x88
	mov	r3, r6
	mov	r0, fp
	ldr	r2, [sp, #40]	; 0x28
	str	r4, [sp, #4]
	str	r1, [sp, #8]
	push {r1, r2}
	mov.w r1, #6119
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6119
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6119
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6119
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_dtoa_r
	push{r1, r2}
	mov.w r1, #6119
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6119
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6119
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6119
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [sp, #56]	; 0x38
lab640: 	ldr	r3, [sp, #56]	; 0x38
	add	r4, r3, r4
	b	lab718
lab415: 	str	r5, [sp, #28]
	str	r5, [sp, #40]	; 0x28
	str	r4, [sp, #52]	; 0x34
	mov	r5, r0
	ldrb	r2, [sp, #131]	; 0x83
	str	r0, [sp, #88]	; 0x58
	str	r0, [sp, #72]	; 0x48
	str	r0, [sp, #68]	; 0x44
	b	lab719
lab504: 	ldr	r0, [pc, #-4048]	; be64 <_vfprintf_r+0x1574>
	ldr	r1, [sp, #168]	; 0xa8
	ldr	r2, [sp, #164]	; 0xa4
	str	r0, [sp, #100]	; 0x64
	b	lab720
lab538: 	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab721
	ldr	r5, [sp, #136]	; 0x88
	ldr	r3, [sp, #76]	; 0x4c
	ldr	r4, [sp, #168]	; 0xa8
	add	r9, sp, #172	; 0xac
	sub	r5, r3, r5
	b	lab722
lab673: 	ldr	r3, [sp, #68]	; 0x44
	cmp	r3, #0
	movgt	r3, #103	; 0x67
	ldr	r2, [sp, #76]	; 0x4c
	ldr	r1, [sp, #92]	; 0x5c
	add	r2, r2, r1
	str	r2, [sp, #40]	; 0x28
	strgt	r3, [sp, #64]	; 0x40
	bgt	lab723
	rsb	r3, r3, #1
	add	r3, r2, r3
	mov	r2, #103	; 0x67
	str	r3, [sp, #40]	; 0x28
	bic	r3, r3, r3, asr #31
	str	r2, [sp, #64]	; 0x40
	str	r3, [sp, #28]
	b	lab724
lab569: 	cmn	r5, #16
	rsb	r5, r5, #0
	bge	lab725
	mov	r6, #16
	b	lab726
lab730: 	cmp	r5, #16
	ble	lab727
lab726: 	add	r3, r3, #1
	ldr	r2, [pc, #780]	; d1ec <_vfprintf_r+0x28fc>
	add	r4, r4, #16
	cmp	r3, #7
	stm	r9, {r2, r6}
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	addle	r9, r9, #8
	ble	lab728
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab729
	add	r3, sp, #164	; 0xa4
	ldm	r3, {r3, r4}
	add	r9, sp, #172	; 0xac
	b	lab730
lab518: 	ldr	r2, [pc, #712]	; d1f0 <_vfprintf_r+0x2900>
	ldr	r3, [sp, #164]	; 0xa4
	str	r2, [sp, #100]	; 0x64
	b	lab731
lab621: 	mov	r1, fp
	mov	r0, r7
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	beq	lab732
	b	lab733
lab384: 	ldr	r3, [fp, #100]	; 0x64
	tst	r3, #1
	bne	lab734
	ldrh	r3, [fp, #12]
	tst	r3, #512	; 0x200
	ldreq	r0, [fp, #88]	; 0x58
	bleq	feac <__retarget_lock_release_recursive>
lab734: 	mvn	r3, #0
	str	r3, [sp, #36]	; 0x24
	b	lab735
lab727: 	add	r3, r3, #1
	ldr	r2, [pc, #620]	; d1ec <_vfprintf_r+0x28fc>
	add	r4, r4, r5
	cmp	r3, #7
	str	r5, [r9, #4]
	str	r2, [r9]
	str	r4, [sp, #168]	; 0xa8
	str	r3, [sp, #164]	; 0xa4
	ble	lab736
	mov	r1, r7
	mov	r0, fp
	add	r2, sp, #160	; 0xa0
	bl	__sprint_r
	cmp	r0, #0
	bne	lab737
	add	r3, sp, #164	; 0xa4
	ldm	r3, {r3, r4}
	add	r9, sp, #172	; 0xac
	b	lab738
lab638: 	mov	r5, #1
lab659: 	mov	r2, #45	; 0x2d
	add	r4, sp, #80	; 0x50
	ldm	r4, {r3, r4}
	str	r2, [sp, #60]	; 0x3c
	str	r3, [sp, #40]	; 0x28
	add	r6, r4, #-2147483648	; 0x80000000
	b	lab739
lab577: 	ldr	r3, [sp, #84]	; 0x54
	cmp	r3, #0
	movlt	r2, #45	; 0x2d
	mov	r0, #0
	mov	ip, #3
	ldrbge	r2, [sp, #131]	; 0x83
	strblt	r2, [sp, #131]	; 0x83
	str	r0, [sp, #48]	; 0x30
	str	ip, [sp, #28]
	ldr	r1, [pc, #488]	; d1f4 <_vfprintf_r+0x2904>
	ldr	r3, [pc, #488]	; d1f8 <_vfprintf_r+0x2908>
	bic	sl, sl, #128	; 0x80
	b	lab740
lab390: 	mov	fp, r7
	b	lab741
lab586: 	ldr	r3, [sp, #72]	; 0x48
	str	r3, [sp, #152]	; 0x98
	ldr	r3, [sp, #68]	; 0x44
	ldrb	r2, [r6, #-1]
	ldrb	r1, [r3, #15]
	cmp	r2, r1
	mov	r3, r6
	bne	lab742
	mov	r0, #48	; 0x30
lab743: 	ldr	r3, [sp, #152]	; 0x98
	sub	r2, r3, #1
	str	r2, [sp, #152]	; 0x98
	ldrb	r2, [r3, #-1]
	cmp	r1, r2
	beq	lab743
lab742: 	cmp	r2, #57	; 0x39
	ldreq	r2, [sp, #68]	; 0x44
	addne	r2, r2, #1
	ldrbeq	r2, [r2, #10]
	andne	r2, r2, #255	; 0xff
	strb	r2, [r3, #-1]
	b	lab744
lab674: 	ldr	r3, [sp, #68]	; 0x44
	str	r3, [sp, #40]	; 0x28
	b	lab745
lab675: 	mov	r3, #103	; 0x67
	str	r3, [sp, #64]	; 0x40
	b	lab746
lab643: 	ldr	r2, [sp, #28]
	cmp	r2, #65	; 0x41
	movne	r2, #48	; 0x30
	addeq	r2, sp, #146	; 0x92
	strbne	r2, [sp, #146]	; 0x92
	add	r3, r3, #48	; 0x30
	addne	r2, sp, #147	; 0x93
	strb	r3, [r2], #1
	add	r3, sp, #144	; 0x90
	sub	r3, r2, r3
	str	r3, [sp, #108]	; 0x6c
	b	lab747
lab670: 	ldr	r3, [sp, #92]	; 0x5c
	add	r3, r2, r3
	add	r3, r3, r5
	str	r3, [sp, #40]	; 0x28
	mov	r3, #102	; 0x66
	str	r3, [sp, #64]	; 0x40
	b	lab748
lab648: 	tst	sl, #1
	beq	lab749
	b	lab750
lab685: 	mov	r7, r9
	mov	r4, r0
	mov	r9, r2
	str	sl, [sp, #116]	; 0x74
	str	r6, [sp, #60]	; 0x3c
	ldr	sl, [sp, #68]	; 0x44
	ldr	r8, [sp, #88]	; 0x58
lab762: 	ldr	r2, [sp, #40]	; 0x28
	cmp	r3, r2
	movcs	r3, r2
	str	r3, [sp, #60]	; 0x3c
	b	lab751
lab669: 	orrs	r3, r3, r5
	bne	lab752
	mov	r3, #1
	mov	r2, #102	; 0x66
	str	r3, [sp, #28]
	str	r2, [sp, #64]	; 0x40
	str	r3, [sp, #40]	; 0x28
	b	lab753
lab752: 	mov	r2, #102	; 0x66
	ldr	r3, [sp, #92]	; 0x5c
	add	r3, r3, #1
	add	r3, r3, r5
	str	r3, [sp, #40]	; 0x28
	bic	r3, r3, r3, asr #31
	str	r2, [sp, #64]	; 0x40
	str	r3, [sp, #28]
	b	lab754
lab431: 	ldr	r2, [sp, #52]	; 0x34
	ldr	r5, [r2], #4
	cmp	r5, r4
	ldrb	r3, [r8, #1]
	movlt	r5, r4
	mov	r8, r1
	str	r2, [sp, #52]	; 0x34
	b	lab755
lab661: 	rsb	r3, r5, #1
	str	r3, [sp, #136]	; 0x88
	b	lab756
lab690: 	ldr	ip, [sp, #164]	; 0xa4
	b	lab757
lab717: 	mov	r4, r5
	b	lab758
lab666: 	ldrh	r3, [r7, #12]
	orr	r3, r3, #64	; 0x40
	mov	fp, r7
	strh	r3, [r7, #12]
	b	lab759
lab668: 	mov	r3, #0
	str	r3, [sp, #48]	; 0x30
	b	lab760
lab645: 	mov	r3, #2
	str	r3, [sp, #108]	; 0x6c
	b	lab761
lab683: 	ldr	r3, [sp, #56]	; 0x38
	ldr	r2, [sp, #76]	; 0x4c
	add	r3, r3, r2
	str	r3, [sp, #40]	; 0x28
	b	lab762
lab677: 	mov	r3, #0
	str	r3, [sp, #88]	; 0x58
	str	r3, [sp, #72]	; 0x48
	b	lab763
	andeq	r2, r1, r0, lsl #31
	andeq	r2, r1, r0, ror pc
	andeq	r2, r1, r4, ror #30
	andeq	r2, r1, r8, ror #30
__sbprintf:
	push	{r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #1120	; 0x460
	sub	sp, sp, #8
	mov	r7, sp
	mov	ip, #1024	; 0x400
	mov	lr, #0
	mov	r5, r2
	mov	r6, r0
	mov	r8, r3
	add	r3, sp, #104	; 0x68
	str	r3, [sp]
	str	r3, [sp, #16]
	ldrh	r3, [r1, #12]
	bic	r3, r3, #2
	strh	r3, [r7, #12]
	ldr	r3, [r1, #100]	; 0x64
	str	r3, [sp, #100]	; 0x64
	ldrh	r3, [r1, #14]
	strh	r3, [r7, #14]
	ldr	r3, [r1, #28]
	str	r3, [sp, #28]
	ldr	r3, [r1, #36]	; 0x24
	add	r0, sp, #88	; 0x58
	mov	r4, r1
	str	lr, [sp, #24]
	str	ip, [sp, #8]
	str	ip, [sp, #20]
	str	r3, [sp, #36]	; 0x24
	bl	__retarget_lock_init_recursive
	mov	r2, r5
	mov	r3, r8
	mov	r1, r7
	mov	r0, r6
	bl	_vfprintf_r
	push{r1, r2}
	mov.w r1, #8192
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #8192
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r5, r0, #0
	blt	lab764
	mov	r1, r7
	mov	r0, r6
	push {r1, r2}
	mov.w r1, #4332
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4332
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_fflush_r
	push{r1, r2}
	mov.w r1, #4332
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4332
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	mvnne	r5, #0
lab764: 	ldrh	r3, [sp, #12]
	tst	r3, #64	; 0x40
	ldrhne	r3, [r4, #12]
	orrne	r3, r3, #64	; 0x40
	ldr	r0, [sp, #88]	; 0x58
	strhne	r3, [r4, #12]
	bl	__retarget_lock_close_recursive
	mov	r0, r5
	add	sp, sp, #1120	; 0x460
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r8, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3150
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
__swsetup_r:
	ldr	r3, [pc, #352]	; d438 <__swsetup_r+0x168>
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r1
	beq	lab765
	ldr	r2, [r3, #56]	; 0x38
	cmp	r2, #0
	beq	lab766
lab772: 	lsl	r3, r2, #16
	tst	r2, #8
	lsr	r3, r3, #16
	beq	lab767
	ldr	r1, [r4, #16]
	cmp	r1, #0
	beq	lab768
lab777: 	bne	lab769
	tst	r3, #2
	ldreq	r0, [r4, #20]
	cmp	r1, #0
	str	r0, [r4, #8]
	movne	r0, #0
	beq	lab770
lab781: 	cpsid f
	push {r1, r2}
	mov.w r1, #7118
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab769: 	mov	ip, #0
	ldr	r0, [r4, #20]
	cmp	r1, #0
	rsb	r0, r0, #0
	str	r0, [r4, #24]
	str	ip, [r4, #8]
	movne	r0, #0
	bne	lab771
lab770: 	tst	r3, #128	; 0x80
	orrne	r2, r2, #64	; 0x40
	mvnne	r0, #0
	moveq	r0, r1
	strhne	r2, [r4, #12]
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #4510
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab766: 	mov	r0, r3
	push {r1, r2}
	mov.w r1, #6793
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6793
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__sinit
	push{r1, r2}
	mov.w r1, #6793
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6793
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab772
lab767: 	tst	r3, #16
	beq	lab773
	tst	r3, #4
	bne	lab774
	ldr	r1, [r4, #16]
lab780: 	lsl	r3, r2, #16
	cmp	r1, #0
	strh	r2, [r4, #12]
	lsr	r3, r3, #16
	bne	lab775
lab768: 	and	r0, r3, #640	; 0x280
	cmp	r0, #512	; 0x200
	beq	lab776
	mov	r1, r4
	mov	r0, r5
	bl	__smakebuf_r
	ldrsh	r2, [r4, #12]
	lsl	r3, r2, #16
	ldr	r1, [r4, #16]
	lsr	r3, r3, #16
	b	lab777
lab774: 	ldr	r1, [r4, #48]	; 0x30
	cmp	r1, #0
	beq	lab778
	add	r3, r4, #64	; 0x40
	cmp	r1, r3
	beq	lab779
	mov	r0, r5
	push {r1, r2}
	mov.w r1, #2633
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_free_r
	push{r1, r2}
	mov.w r1, #2633
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldrsh	r2, [r4, #12]
lab779: 	mov	r3, #0
	str	r3, [r4, #48]	; 0x30
lab778: 	mov	r3, #0
	ldr	r1, [r4, #16]
	bic	r2, r2, #36	; 0x24
	stm	r4, {r1, r3}
	b	lab780
lab773: 	mov	r3, #9
	orr	r2, r2, #64	; 0x40
	str	r3, [r5]
	mvn	r0, #0
	strh	r2, [r4, #12]
	b	lab781
	andeq	r3, r2, r0, ror #5
__call_exitprocs:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	fp, r0
	ldr	r3, [pc, #288]	; d56c <__call_exitprocs+0x130>
	sub	sp, sp, #12
	ldr	r0, [r3]
	mov	r7, r1
	str	fp, [sp, #4]
	bl	__retarget_lock_acquire_recursive
	ldr	r3, [pc, #268]	; d570 <__call_exitprocs+0x134>
	ldr	r8, [r3]
	ldr	r6, [r8, #328]	; 0x148
	cmp	r6, #0
	beq	lab782
	mov	r9, #1
	mov	sl, #0
lab792: 	subs	r5, r4, #1
	bmi	lab783
	add	r4, r4, #1
	add	r4, r6, r4, lsl #2
	b	lab784
lab791: 	cmn	r5, #1
	sub	r4, r4, #4
	beq	lab785
lab784: 	cmp	r7, #0
	beq	lab786
	ldr	r3, [r4, #256]	; 0x100
	cmp	r3, r7
	bne	lab787
lab786: 	ldr	r3, [r6, #4]
	ldr	r2, [r4]
	sub	r3, r3, #1
	cmp	r3, r5
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab788
	ldr	r3, [r6, #392]	; 0x188
	lsl	r1, r9, r5
	tst	r1, r3
	ldr	fp, [r6, #4]
	bne	lab789
	mov	lr, pc
	bx	r2
lab796: 	cmp	r2, fp
	bne	lab790
lab794: 	cmp	r3, r6
	beq	lab791
	mov	r6, r3
lab795: 	bne	lab792
lab785: 	ldr	r3, [pc, #80]	; d56c <__call_exitprocs+0x130>
	ldr	r0, [r3]
	bl	__retarget_lock_release_recursive
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3127
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab789: 	ldr	r0, [r6, #396]	; 0x18c
	tst	r1, r0
	bne	lab793
	ldr	r0, [sp, #4]
	ldr	r1, [r4, #128]	; 0x80
	mov	lr, pc
	bx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab794
lab790: 	ldr	r6, [r8, #328]	; 0x148
	b	lab795
lab793: 	ldr	r0, [r4, #128]	; 0x80
	mov	lr, pc
	bx	r2
	b	lab796
	andeq	r3, r2, r0, lsr #22
	andeq	r2, r1, r8, lsl #30
abort:
	mov	r0, #6
	push	{r4, lr}
	bl	raise
	push{r1, r2}
	mov.w r1, #5224
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5224
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r0, #1
	bl	_exit
atexit:
	mov	r3, #0
	push	{r4, lr}
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	bl	__register_exitproc
	push{r1, r2}
	mov.w r1, #4631
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	pop	{r4, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #1957
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
quorem:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, [r0, #16]
	ldr	r4, [r1, #16]
	sub	sp, sp, #20
	cmp	r3, r4
	stm	sp, {r0, r1}
	movlt	r0, #0
	blt	lab797
	sub	r4, r4, #1
	add	r5, r1, #20
	add	r8, r0, #20
	ldr	r7, [r5, r4, lsl #2]
	ldr	r9, [r8, r4, lsl #2]
	add	r7, r7, #1
	lsl	r3, r4, #2
	mov	r1, r7
	mov	r0, r9
	str	r3, [sp, #8]
	bl	__udivsi3
	cmp	r9, r7
	add	r3, r8, r4, lsl #2
	mov	r6, r0
	str	r3, [sp, #12]
	add	r7, r5, r4, lsl #2
	bcc	lab798
	mov	r1, #0
	mov	r9, r5
	mov	r0, r8
	mov	r2, r1
	ldr	ip, [pc, #320]	; d764 <quorem+0x1bc>
lab799: 	and	r3, lr, ip
	mla	r1, r6, r3, r1
	lsr	lr, lr, #16
	lsr	r3, r1, #16
	mla	lr, r6, lr, r3
	ldr	sl, [r0]
	and	r3, r1, ip
	sub	r3, r2, r3
	and	fp, sl, ip
	and	r2, lr, ip
	add	r3, r3, fp
	rsb	r2, r2, sl, lsr #16
	and	r1, r3, ip
	add	r3, r2, r3, asr #16
	orr	r1, r1, r3, lsl #16
	cmp	r7, r9
	str	r1, [r0], #4
	asr	r2, r3, #16
	lsr	r1, lr, #16
	bcs	lab799
	ldr	r3, [sp, #8]
	ldr	r3, [r8, r3]
	cmp	r3, #0
	bne	lab800
	ldr	r3, [sp, #12]
	sub	r3, r3, #4
	cmp	r8, r3
	bcc	lab801
	b	lab802
lab804: 	sub	r4, r4, #1
	bcs	lab803
lab801: 	ldr	r2, [r3], #-4
	cmp	r2, #0
	beq	lab804
lab803: 	ldr	r3, [sp]
	str	r4, [r3, #16]
lab800: 	ldm	sp, {r0, r1}
	push {r1, r2}
	mov.w r1, #1333
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1333
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__mcmp
	push{r1, r2}
	mov.w r1, #1333
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1333
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	blt	lab805
	mov	r0, r8
	mov	r2, #0
	ldr	r1, [pc, #140]	; d764 <quorem+0x1bc>
	add	r6, r6, #1
lab806: 	ldr	lr, [r0]
	and	r3, ip, r1
	sub	r2, r2, r3
	lsr	ip, ip, #16
	and	r3, lr, r1
	add	r3, r2, r3
	rsb	ip, ip, lr, lsr #16
	add	r2, ip, r3, asr #16
	and	r3, r3, r1
	orr	r3, r3, r2, lsl #16
	cmp	r7, r5
	str	r3, [r0], #4
	asr	r2, r2, #16
	bcs	lab806
	ldr	r2, [r8, r4, lsl #2]
	cmp	r2, #0
	add	r3, r8, r4, lsl #2
	bne	lab807
	sub	r3, r3, #4
	cmp	r8, r3
	bcc	lab808
	b	lab809
lab811: 	sub	r4, r4, #1
	bcs	lab810
lab808: 	ldr	r2, [r3], #-4
	cmp	r2, #0
	beq	lab811
lab810: 	ldr	r3, [sp]
	str	r4, [r3, #16]
lab807: 	mov	r0, r6
lab797: 	add	sp, sp, #20
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3926
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	strdeq	pc, [r0], -pc	; <UNPREDICTABLE>
_dtoa_r:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r6, r2
	mov	r7, r3
	ldr	r1, [r0, #64]	; 0x40
	sub	sp, sp, #108	; 0x6c
	cmp	r1, #0
	mov	r4, r0
	str	r6, [sp, #8]
	str	r7, [sp, #12]
	ldr	r5, [sp, #156]	; 0x9c
	beq	lab812
	mov	r3, #1
	ldr	r2, [r0, #68]	; 0x44
	lsl	r3, r3, r2
	str	r3, [r1, #8]
	str	r2, [r1, #4]
	bl	_Bfree
	mov	r3, #0
	str	r3, [r4, #64]	; 0x40
lab812: 	subs	r9, r7, #0
	movlt	r3, #1
	movge	r3, #0
	str	r3, [r5]
	ldr	r3, [pc, #772]	; dad0 <_dtoa_r+0x368>
	biclt	r9, r9, #-2147483648	; 0x80000000
	strlt	r9, [sp, #12]
	bics	r3, r3, r9
	beq	lab813
	add	r3, sp, #8
	ldm	r3, {r2, r3}
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	mov	r3, #0
	str	r0, [sp, #32]
	str	r1, [sp, #36]	; 0x24
	push {r1, r2}
	mov.w r1, #5626
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmpeq
	push{r1, r2}
	mov.w r1, #5626
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r8, r0, #0
	beq	lab814
	mov	r3, #1
	ldr	r2, [sp, #160]	; 0xa0
	cmp	r2, #0
	ldr	r2, [sp, #152]	; 0x98
	str	r3, [r2]
	beq	lab815
	ldr	r8, [pc, #644]	; daa8 <_dtoa_r+0x340>
	ldr	r3, [sp, #160]	; 0xa0
	str	r8, [r3]
	sub	r8, r8, #1
lab872: 	add	sp, sp, #108	; 0x6c
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #926
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab814: 	add	r3, sp, #96	; 0x60
	str	r3, [sp, #4]
	add	r3, sp, #100	; 0x64
	str	r3, [sp]
	mov	r0, r4
	add	r3, sp, #32
	ldm	r3, {r2, r3}
	bl	__d2b
	push{r1, r2}
	mov.w r1, #5606
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5606
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	lsrs	r5, r9, #20
	mov	fp, r0
	bne	lab816
	ldr	r8, [sp, #96]	; 0x60
	ldr	r5, [sp, #100]	; 0x64
	add	r5, r8, r5
	add	r0, r5, #1072	; 0x430
	add	r0, r0, #2
	cmp	r0, #32
	rsbgt	r3, r0, #64	; 0x40
	addgt	r0, r5, #1040	; 0x410
	addgt	r0, r0, #2
	lsrgt	r0, r6, r0
	rsble	r0, r0, #32
	orrgt	r0, r0, r9, lsl r3
	lslle	r0, r6, r0
	bl	__aeabi_ui2d
	push{r1, r2}
	mov.w r1, #627
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, #1
	str	r3, [sp, #64]	; 0x40
	sub	r5, r5, #1
	sub	r1, r1, #32505856	; 0x1f00000
lab826: 	ldr	r3, [pc, #496]	; daac <_dtoa_r+0x344>
	bl	__aeabi_dsub
	add	r3, pc, #460	; 0x1cc
	ldm	r3, {r2, r3}
	push {r1, r2}
	mov.w r1, #4863
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4863
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #4863
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4863
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r3, pc, #456	; 0x1c8
	ldm	r3, {r2, r3}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__adddf3
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3816
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r6, r0
	mov	r0, r5
	mov	r7, r1
	push {r1, r2}
	mov.w r1, #7983
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #7983
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r3, pc, #436	; 0x1b4
	ldm	r3, {r2, r3}
	push {r1, r2}
	mov.w r1, #1699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #1699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__adddf3
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2316
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r6, r0
	mov	r7, r1
	bl	__aeabi_d2iz
	mov	r2, #0
	mov	sl, r0
	mov	r3, #0
	mov	r0, r6
	mov	r1, r7
	push {r1, r2}
	mov.w r1, #5524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmplt
	push{r1, r2}
	mov.w r1, #5524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab817
	mov	r0, sl
	push {r1, r2}
	mov.w r1, #1867
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #1867
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r6
	mov	r3, r7
	push {r1, r2}
	mov.w r1, #2769
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmpeq
	push{r1, r2}
	mov.w r1, #2769
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	subeq	sl, sl, #1
lab817: 	cmp	sl, #22
	bhi	lab818
	ldr	r3, [pc, #384]	; dadc <_dtoa_r+0x374>
	add	r3, r3, sl, lsl #3
	ldm	r3, {r2, r3}
	add	r1, sp, #32
	ldm	r1, {r0, r1}
	push {r1, r2}
	mov.w r1, #4283
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmplt
	push{r1, r2}
	mov.w r1, #4283
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab819
	mov	r3, #0
	str	r3, [sp, #52]	; 0x34
	sub	sl, sl, #1
lab873: 	subs	r3, r5, #1
	str	r3, [sp, #24]
	movpl	r3, #0
	strpl	r3, [sp, #40]	; 0x28
	bmi	lab820
lab874: 	bge	lab821
	ldr	r3, [sp, #40]	; 0x28
	sub	r3, r3, sl
	str	r3, [sp, #40]	; 0x28
	rsb	r3, sl, #0
	str	r3, [sp, #48]	; 0x30
	ldr	r3, [sp, #144]	; 0x90
	cmp	r3, #9
	str	sl, [sp, #20]
	mov	sl, #0
	bhi	lab822
lab830: 	movle	r5, #1
	movgt	r5, #0
	subgt	r3, r3, #4
	strgt	r3, [sp, #144]	; 0x90
	ldr	r3, [sp, #144]	; 0x90
	sub	r3, r3, #2
	cmp	r3, #3
	ldrls	pc, [pc, r3, lsl #2]
	b	lab823
	andeq	lr, r0, r0, ror #10
	andeq	lr, r0, r4, asr r5
	andeq	lr, r0, r0, lsr r5
	andeq	lr, r0, ip, asr #9
lab813: 	ldr	r3, [pc, #168]	; dab0 <_dtoa_r+0x348>
	ldr	r2, [sp, #152]	; 0x98
	bic	r9, r9, #-16777216	; 0xff000000
	bic	r9, r9, #15728640	; 0xf00000
	str	r3, [r2]
	orrs	r3, r9, r6
	beq	lab824
	ldr	r3, [sp, #160]	; 0xa0
	cmp	r3, #0
	ldr	r8, [pc, #136]	; dab4 <_dtoa_r+0x34c>
	beq	lab825
	add	r3, r8, #3
lab827: 	ldr	r2, [sp, #160]	; 0xa0
	str	r3, [r2]
	add	sp, sp, #108	; 0x6c
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #4522
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab816: 	add	r2, sp, #32
	ldm	r2, {r1, r2}
	bic	r3, r2, #-16777216	; 0xff000000
	bic	r3, r3, #15728640	; 0xf00000
	mov	r0, r1
	sub	r5, r5, #1020	; 0x3fc
	orr	r1, r3, #1069547520	; 0x3fc00000
	str	r8, [sp, #64]	; 0x40
	sub	r5, r5, #3
	ldr	r8, [sp, #96]	; 0x60
	orr	r1, r1, #3145728	; 0x300000
	b	lab826
lab824: 	ldr	r3, [sp, #160]	; 0xa0
	ldr	r8, [pc, #52]	; dab8 <_dtoa_r+0x350>
	cmp	r3, #0
	addne	r3, r8, #8
	bne	lab827
	b	lab828
	cmnvs	pc, #-2080374783	; 0x84000001
	svccc	0x00d287a7
	blhi	183fd6c <_stack+0x17bfd6c>
	svccc	0x00c68a28
	; <UNDEFINED> instruction: 0x509f79fb
	svccc	0x00d34413
	andeq	r2, r1, sp, ror #30
	svccc	0x00f80000
	andeq	r2, r0, pc, lsl #14
	muleq	r1, r0, pc	; <UNPREDICTABLE>
	muleq	r1, r4, pc	; <UNPREDICTABLE>
	svccc	0x00f00000	; IMB
	andeq	r2, r1, ip, ror #30
	andeq	r3, r1, r8, asr #1
	andsmi	r0, r4, r0
	svccc	0x00e00000
	svcvc	0x00f00000	; IMB
	eormi	r0, r4, r0
	andsmi	r0, ip, r0
	strdeq	r3, [r1], -r0
lab819: 	sub	r5, r8, r5
	subs	r3, r5, #1
	str	r3, [sp, #24]
	strmi	r0, [sp, #52]	; 0x34
	bmi	lab829
	str	r0, [sp, #52]	; 0x34
	str	r0, [sp, #40]	; 0x28
lab821: 	ldr	r3, [sp, #24]
	add	r3, r3, sl
	str	r3, [sp, #24]
	mov	r3, #0
	str	r3, [sp, #48]	; 0x30
	ldr	r3, [sp, #144]	; 0x90
	cmp	r3, #9
	str	sl, [sp, #20]
	bls	lab830
lab822: 	mov	r3, #0
	str	r3, [sp, #144]	; 0x90
	mvn	r3, #0
	mov	r5, #1
	str	r3, [sp, #28]
	mov	r3, #0
	str	r5, [sp, #44]	; 0x2c
	str	r3, [sp, #148]	; 0x94
lab938: 	ldr	r3, [sp, #28]
	str	r1, [r4, #68]	; 0x44
	str	r3, [sp, #68]	; 0x44
lab906: 	push {r1, r2}
	mov.w r1, #2823
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_Balloc
	push{r1, r2}
	mov.w r1, #2823
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r3, r0, #0
	str	r3, [sp, #16]
	beq	lab831
	ldr	r3, [sp, #28]
	cmp	r3, #14
	movhi	r5, #0
	andls	r5, r5, #1
	ldr	r3, [sp, #16]
	cmp	r5, #0
	str	r3, [r4, #64]	; 0x40
	beq	lab832
	ldr	r1, [sp, #20]
	cmp	r1, #0
	ble	lab833
	ldr	r3, [pc, #-188]	; dadc <_dtoa_r+0x374>
	and	r2, r1, #15
	add	r3, r3, r2, lsl #3
	tst	r1, #256	; 0x100
	ldm	r3, {r6, r7}
	asr	r5, r1, #4
	beq	lab834
	ldr	r3, [pc, #-240]	; dac4 <_dtoa_r+0x35c>
	add	r1, sp, #32
	ldm	r1, {r0, r1}
	add	r3, r3, #32
	ldm	r3, {r2, r3}
	push {r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_ddiv
	push{r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3985
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r8, #3
	str	r0, [sp, #56]	; 0x38
	str	r1, [sp, #60]	; 0x3c
	and	r5, r5, #15
lab903: 	beq	lab835
	ldr	r9, [pc, #-288]	; dac4 <_dtoa_r+0x35c>
lab837: 	beq	lab836
	mov	r0, r6
	mov	r1, r7
	ldm	r9, {r2, r3}
	push {r1, r2}
	mov.w r1, #4870
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4870
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #4870
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4870
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r6, r0
	mov	r7, r1
	add	r8, r8, #1
lab836: 	asrs	r5, r5, #1
	add	r9, r9, #8
	bne	lab837
lab835: 	add	r1, sp, #56	; 0x38
	ldm	r1, {r0, r1}
	mov	r2, r6
	mov	r3, r7
	push {r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_ddiv
	push{r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5733
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [sp, #56]	; 0x38
	str	r1, [sp, #60]	; 0x3c
lab987: 	cmp	r3, #0
	beq	lab838
	add	r6, sp, #56	; 0x38
	ldm	r6, {r5, r6}
	mov	r2, #0
	mov	r0, r5
	mov	r1, r6
	ldr	r3, [pc, #-408]	; dabc <_dtoa_r+0x354>
	push {r1, r2}
	mov.w r1, #5075
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmplt
	push{r1, r2}
	mov.w r1, #5075
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bne	lab839
lab838: 	mov	r0, r8
	push {r1, r2}
	mov.w r1, #4525
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #4525
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r3, sp, #56	; 0x38
	ldm	r3, {r2, r3}
	push {r1, r2}
	mov.w r1, #571
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #571
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #571
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #571
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [pc, #-416]	; dad8 <_dtoa_r+0x370>
	mov	r2, #0
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__adddf3
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5013
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [sp, #28]
	cmp	r3, #0
	mov	r8, r0
	sub	r9, r1, #54525952	; 0x3400000
	beq	lab840
	ldr	r3, [sp, #20]
	str	r3, [sp, #88]	; 0x58
	ldr	r3, [sp, #28]
	str	r3, [sp, #72]	; 0x48
lab945: 	cmp	r3, #0
	beq	lab841
	ldr	r2, [sp, #72]	; 0x48
	ldr	r3, [pc, #-476]	; dadc <_dtoa_r+0x374>
	add	r3, r3, r2, lsl #3
	ldmdb	r3, {r2, r3}
	mov	r0, #0
	ldr	r1, [pc, #-508]	; dacc <_dtoa_r+0x364>
	push {r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_ddiv
	push{r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2200
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r8
	mov	r3, r9
	bl	__aeabi_dsub
	add	r9, sp, #56	; 0x38
	ldm	r9, {r8, r9}
	str	r0, [sp, #80]	; 0x50
	str	r1, [sp, #84]	; 0x54
	mov	r1, r9
	mov	r0, r8
	bl	__aeabi_d2iz
	mov	r7, r0
	push {r1, r2}
	mov.w r1, #6299
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #6299
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	ldr	r5, [sp, #16]
	add	r7, r7, #48	; 0x30
	mov	r6, r0
	strb	r7, [r5], #1
	mov	r7, r1
	mov	r2, r6
	mov	r3, r7
	add	r1, sp, #80	; 0x50
	ldm	r1, {r0, r1}
	bl	__aeabi_dcmpgt
	cmp	r0, #0
	bne	lab842
	str	sl, [sp, #92]	; 0x5c
	str	fp, [sp, #56]	; 0x38
	ldr	r9, [sp, #72]	; 0x48
	mov	r8, #0
	add	fp, sp, #80	; 0x50
	ldm	fp, {sl, fp}
	str	r4, [sp, #72]	; 0x48
	b	lab843
lab846: 	cmp	r8, r9
	bge	lab844
	mov	r0, sl
	mov	r1, fp
	mov	r2, #0
	ldr	r3, [pc, #-680]	; dad4 <_dtoa_r+0x36c>
	push {r1, r2}
	mov.w r1, #23
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #23
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #23
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #23
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, #0
	ldr	r3, [pc, #-692]	; dad4 <_dtoa_r+0x36c>
	mov	sl, r0
	mov	fp, r1
	mov	r0, r6
	mov	r1, r7
	push {r1, r2}
	mov.w r1, #3651
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3651
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #3651
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3651
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r7, r1
	mov	r6, r0
	bl	__aeabi_d2iz
	mov	r4, r0
	push {r1, r2}
	mov.w r1, #5683
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #5683
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	add	r4, r4, #48	; 0x30
	mov	r2, sl
	mov	r3, fp
	strb	r4, [r5], #1
	mov	r6, r0
	mov	r7, r1
	push {r1, r2}
	mov.w r1, #5467
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmplt
	push{r1, r2}
	mov.w r1, #5467
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bne	lab845
lab843: 	mov	r2, r6
	mov	r3, r7
	mov	r0, #0
	ldr	r1, [pc, #-828]	; dabc <_dtoa_r+0x354>
	bl	__aeabi_dsub
	mov	r2, sl
	mov	r3, fp
	push {r1, r2}
	mov.w r1, #1818
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmplt
	push{r1, r2}
	mov.w r1, #1818
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab846
	ldr	fp, [sp, #56]	; 0x38
	ldr	r1, [sp, #16]
	ldr	r4, [sp, #72]	; 0x48
	b	lab847
lab849: 	beq	lab848
lab974: 	ldrb	r3, [r5, #-1]!
	cmp	r3, #57	; 0x39
	beq	lab849
	add	r3, r3, #1
	str	r1, [sp, #16]
	and	r3, r3, #255	; 0xff
lab961: lab916: 	add	r3, r3, #1
	ldr	r8, [sp, #16]
	str	r3, [sp, #20]
	str	r2, [sp, #16]
	b	lab850
lab943: 	push {r1, r2}
	mov.w r1, #4278
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #4278
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r3, sp, #56	; 0x38
	ldm	r3, {r2, r3}
	push {r1, r2}
	mov.w r1, #2256
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2256
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #2256
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2256
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, #0
	ldr	r3, [pc, #-932]	; dad8 <_dtoa_r+0x370>
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__adddf3
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5699
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r8, r0
	sub	r9, r1, #54525952	; 0x3400000
lab840: 	mov	r2, #0
	ldr	r3, [pc, #-968]	; dac8 <_dtoa_r+0x360>
	add	r1, sp, #56	; 0x38
	ldm	r1, {r0, r1}
	bl	__aeabi_dsub
	mov	r2, r8
	mov	r3, r9
	mov	r5, r0
	mov	r6, r1
	bl	__aeabi_dcmpgt
	subs	r7, r0, #0
	bne	lab851
	mov	r2, r8
	mov	r0, r5
	mov	r1, r6
	add	r3, r9, #-2147483648	; 0x80000000
	push {r1, r2}
	mov.w r1, #1143
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmplt
	push{r1, r2}
	mov.w r1, #1143
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bne	lab852
lab970: 	mvn	r2, r3
	ldr	r1, [sp, #20]
	cmp	r1, #14
	lsr	r2, r2, #31
	movgt	r2, #0
	cmp	r2, #0
	bne	lab853
	ldr	r2, [sp, #44]	; 0x2c
	cmp	r2, #0
	beq	lab854
lab991: 	cmp	r2, #1
	ble	lab855
	ldr	r3, [sp, #28]
	sub	r2, r3, #1
	ldr	r3, [sp, #48]	; 0x30
	cmp	r3, r2
	ldrlt	r3, [sp, #48]	; 0x30
	sublt	r3, r2, r3
	subge	r7, r3, r2
	addlt	sl, sl, r3
	ldr	r3, [sp, #28]
	strlt	r2, [sp, #48]	; 0x30
	movlt	r7, #0
	cmp	r3, #0
	ldrge	r2, [sp, #24]
	addge	r2, r2, r3
	strge	r2, [sp, #24]
	ldrge	r2, [sp, #40]	; 0x28
	movge	r5, r2
	ldrlt	r3, [sp, #40]	; 0x28
	ldrlt	r2, [sp, #28]
	addge	r3, r2, r3
	strge	r3, [sp, #40]	; 0x28
	sublt	r5, r3, r2
lab946: 	mov	r0, r4
	push {r1, r2}
	mov.w r1, #1395
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__i2b
	push{r1, r2}
	mov.w r1, #1395
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r6, r0
lab876: 	cmp	r5, #0
	cmpgt	r2, #0
	ble	lab856
	cmp	r5, r2
	movlt	r3, r5
	movge	r3, r2
	ldr	r1, [sp, #40]	; 0x28
	sub	r5, r5, r3
	sub	r1, r1, r3
	sub	r3, r2, r3
	str	r1, [sp, #40]	; 0x28
	str	r3, [sp, #24]
lab856: 	ldr	r3, [sp, #48]	; 0x30
	cmp	r3, #0
	beq	lab857
	ldr	r3, [sp, #44]	; 0x2c
	cmp	r3, #0
	beq	lab858
	cmp	r7, #0
	bgt	lab859
lab933: 	subs	r2, r3, r7
	bne	lab860
lab947: 	mov	r0, r4
	push {r1, r2}
	mov.w r1, #2069
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__i2b
	push{r1, r2}
	mov.w r1, #2069
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	sl, #0
	mov	r7, r0
	bgt	lab861
	ldr	r3, [sp, #144]	; 0x90
	cmp	r3, #1
	ble	lab862
lab940: lab941: 	moveq	r3, #1
	bne	lab863
lab898: 	add	r3, r3, r1
	ands	r3, r3, #31
	beq	lab864
	rsb	r2, r3, #32
	cmp	r2, #4
	ble	lab865
	ldr	r2, [sp, #40]	; 0x28
	rsb	r3, r3, #28
	add	r2, r2, r3
	add	r5, r5, r3
	add	r3, r1, r3
	str	r2, [sp, #40]	; 0x28
	str	r3, [sp, #24]
lab989: 	cmp	r3, #0
	ble	lab866
	mov	r1, fp
	mov	r2, r3
	mov	r0, r4
	push {r1, r2}
	mov.w r1, #5545
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__lshift
	push{r1, r2}
	mov.w r1, #5545
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	fp, r0
lab866: 	ldr	r3, [sp, #24]
	cmp	r3, #0
	ble	lab867
	mov	r1, r7
	mov	r2, r3
	mov	r0, r4
	push {r1, r2}
	mov.w r1, #1327
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__lshift
	push{r1, r2}
	mov.w r1, #1327
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r7, r0
lab867: 	ldr	r3, [sp, #52]	; 0x34
	cmp	r3, #0
	bne	lab868
lab899: 	ldr	r2, [sp, #144]	; 0x90
	cmp	r3, #0
	movle	r3, #1
	movgt	r3, #0
	cmp	r2, #2
	movle	r3, #0
	cmp	r3, #0
	beq	lab869
lab902: 	cmp	r3, #0
	beq	lab870
lab935: 	mvn	r5, r3
	ldr	r8, [sp, #16]
lab918: 	mov	r0, r4
	bl	_Bfree
	add	r3, r5, #1
	cmp	r6, #0
	str	r3, [sp, #20]
	beq	lab871
lab990: 	mov	r0, r4
	bl	_Bfree
lab966: 	mov	r0, r4
	bl	_Bfree
	ldr	r3, [sp, #160]	; 0xa0
	cmp	r3, #0
	mov	r3, #0
	ldr	r2, [sp, #16]
	ldr	r1, [sp, #20]
	strb	r3, [r2]
	ldr	r3, [sp, #152]	; 0x98
	str	r1, [r3]
	beq	lab872
	mov	r0, r8
	ldr	r3, [sp, #160]	; 0xa0
	str	r2, [r3]
	add	sp, sp, #108	; 0x6c
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #7384
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab818: 	mov	r3, #1
	str	r3, [sp, #52]	; 0x34
	b	lab873
lab829: 	rsb	r3, r5, #1
	str	r3, [sp, #40]	; 0x28
	mov	r3, #0
	str	r3, [sp, #24]
	b	lab874
lab815: 	ldr	r8, [pc, #-1692]	; dac0 <_dtoa_r+0x358>
	mov	r0, r8
	add	sp, sp, #108	; 0x6c
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2480
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab864: 	mov	r3, #28
lab988: 	add	r2, r2, r3
	str	r2, [sp, #40]	; 0x28
	ldr	r2, [sp, #24]
	add	r5, r5, r3
	add	r3, r2, r3
	str	r3, [sp, #24]
	b	lab875
lab854: 	add	r5, sp, #40	; 0x28
	ldm	r5, {r5, r6, r7}
	b	lab876
lab869: 	ldr	r3, [sp, #44]	; 0x2c
	cmp	r3, #0
	beq	lab877
lab983: 	ble	lab878
	mov	r1, r6
	mov	r2, r5
	mov	r0, r4
	push {r1, r2}
	mov.w r1, #3129
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__lshift
	push{r1, r2}
	mov.w r1, #3129
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r6, r0
lab878: 	cmp	r9, #0
	moveq	sl, r6
	bne	lab879
lab969: 	and	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #28]
	mov	r5, r3
	sub	r3, r3, #1
	add	r3, r3, r2
	str	r3, [sp, #32]
lab937: 	mov	r0, fp
	push {r1, r2}
	mov.w r1, #2740
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	quorem
	push{r1, r2}
	mov.w r1, #2740
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r1, r6
	mov	r9, r0
	mov	r0, fp
	push {r1, r2}
	mov.w r1, #3758
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3758
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__mcmp
	push{r1, r2}
	mov.w r1, #3758
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3758
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, sl
	mov	r1, r7
	mov	r8, r0
	mov	r0, r4
	bl	__mdiff
	push{r1, r2}
	mov.w r1, #6887
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r2, [r0, #12]
	cmp	r2, #0
	mov	r1, r0
	add	r3, r9, #48	; 0x30
	bne	lab880
	str	r0, [sp, #24]
	mov	r0, fp
	str	r3, [sp, #28]
	push {r1, r2}
	mov.w r1, #3100
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3100
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__mcmp
	push{r1, r2}
	mov.w r1, #3100
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3100
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	ldr	r1, [sp, #24]
	mov	r0, r4
	str	r2, [sp, #24]
	bl	_Bfree
	ldr	r3, [sp, #144]	; 0x90
	ldr	r2, [sp, #24]
	orr	r1, r2, r3
	ldr	r3, [sp, #8]
	orrs	r3, r3, r1
	ldr	r3, [sp, #28]
	beq	lab881
lab936: 	blt	lab882
	ldr	r1, [sp, #144]	; 0x90
	orr	r8, r8, r1
	ldr	r1, [sp, #8]
	orrs	r1, r1, r8
	beq	lab883
	cmp	r2, #0
	bgt	lab884
	ldr	r2, [sp, #32]
	strb	r3, [r5]
	cmp	r2, r5
	add	r5, r5, #1
	mov	r8, r5
	beq	lab885
	mov	r1, fp
	mov	r3, #0
	mov	r2, #10
	mov	r0, r4
	bl	__multadd
	cmp	r6, sl
	mov	fp, r0
	mov	r1, r6
	mov	r3, #0
	mov	r2, #10
	mov	r0, r4
	beq	lab886
	bl	__multadd
	mov	r1, sl
	mov	r6, r0
	mov	r3, #0
	mov	r2, #10
	mov	r0, r4
	bl	__multadd
	mov	sl, r0
	b	lab887
lab833: 	beq	lab888
	ldr	r3, [sp, #20]
	rsb	r6, r3, #0
	ldr	r3, [pc, #-2108]	; dadc <_dtoa_r+0x374>
	and	r2, r6, #15
	add	r3, r3, r2, lsl #3
	ldm	r3, {r2, r3}
	add	r1, sp, #32
	ldm	r1, {r0, r1}
	push {r1, r2}
	mov.w r1, #854
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #854
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #854
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #854
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	asrs	r6, r6, #4
	str	r0, [sp, #72]	; 0x48
	str	r1, [sp, #76]	; 0x4c
	beq	lab889
	mov	r3, #0
	mov	r8, #2
	ldr	r7, [pc, #-2184]	; dac4 <_dtoa_r+0x35c>
lab891: 	beq	lab890
	ldm	r7, {r2, r3}
	push {r1, r2}
	mov.w r1, #1036
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1036
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #1036
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1036
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r5
	add	r8, r8, #1
lab890: 	asrs	r6, r6, #1
	add	r7, r7, #8
	bne	lab891
	cmp	r3, #0
	str	r0, [sp, #56]	; 0x38
	str	r1, [sp, #60]	; 0x3c
	addeq	r3, sp, #72	; 0x48
	ldmeq	r3, {r2, r3}
	streq	r2, [sp, #56]	; 0x38
	streq	r3, [sp, #60]	; 0x3c
	b	lab892
lab853: 	ldr	r7, [sp, #28]
	cmp	r7, #0
	movgt	r3, #0
	movle	r3, #1
	ldr	r1, [sp, #148]	; 0x94
	ands	r3, r3, r1, lsr #31
	ldr	r1, [sp, #20]
	ldr	r3, [pc, #-2260]	; dadc <_dtoa_r+0x374>
	add	r3, r3, r1, lsl #3
	ldm	r3, {r0, r1}
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	beq	lab893
	cmp	r7, #0
	bne	lab894
	mov	r2, #0
	ldr	r3, [pc, #-2316]	; dac8 <_dtoa_r+0x360>
	push {r1, r2}
	mov.w r1, #3094
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3094
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #3094
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3094
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r1
	add	r1, sp, #32
	ldm	r1, {r0, r1}
	push {r1, r2}
	mov.w r1, #1015
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmple
	push{r1, r2}
	mov.w r1, #1015
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab895
	ldr	r7, [sp, #28]
lab852: 	mov	r6, r7
	b	lab896
lab861: 	mov	r1, r0
	mov	r2, sl
	mov	r0, r4
	push {r1, r2}
	mov.w r1, #5621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__pow5mult
	push{r1, r2}
	mov.w r1, #5621
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [sp, #144]	; 0x90
	cmp	r3, #1
	mov	r7, r0
	ble	lab897
lab930: lab863: 	ldr	r3, [r7, #16]
	add	r3, r7, r3, lsl #2
	ldr	r0, [r3, #16]
	bl	__hi0bits
	rsb	r3, r0, #32
	b	lab898
lab868: 	mov	r1, r7
	mov	r0, fp
	push {r1, r2}
	mov.w r1, #3313
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3313
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__mcmp
	push{r1, r2}
	mov.w r1, #3313
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3313
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bge	lab899
	mov	r1, fp
	mov	r3, #0
	mov	r2, #10
	mov	r0, r4
	bl	__multadd
	ldr	r3, [sp, #44]	; 0x2c
	cmp	r3, #0
	ldr	r3, [sp, #20]
	mov	fp, r0
	sub	r8, r3, #1
	bne	lab900
	ldr	r2, [sp, #68]	; 0x44
	ldr	r1, [sp, #144]	; 0x90
	cmp	r2, #0
	mov	r3, r2
	movle	r3, #1
	movgt	r3, #0
	cmp	r1, #2
	movle	r3, #0
	cmp	r3, #0
	streq	r2, [sp, #28]
	beq	lab901
	str	r8, [sp, #20]
lab982: 	str	r3, [sp, #28]
	b	lab902
lab834: 	add	r3, sp, #32
	ldm	r3, {r2, r3}
	mov	r8, #2
	str	r2, [sp, #56]	; 0x38
	str	r3, [sp, #60]	; 0x3c
	b	lab903
	mov	r3, #1
	str	r3, [sp, #44]	; 0x2c
lab909: 	ldr	r2, [sp, #20]
	add	r3, r3, r2
	str	r3, [sp, #68]	; 0x44
	add	r3, r3, #1
	cmp	r3, #1
	movge	r0, r3
	movlt	r0, #1
	str	r3, [sp, #28]
lab908: 	cmp	r0, #23
	str	r1, [r4, #68]	; 0x44
	ble	lab904
	mov	r2, #1
	mov	r3, #4
lab905: 	lsl	r3, r3, #1
	add	r2, r3, #20
	cmp	r2, r0
	add	r2, r1, #1
	bls	lab905
	str	r1, [r4, #68]	; 0x44
	b	lab906
	mov	r3, #1
	str	r3, [sp, #44]	; 0x2c
lab910: 	cmp	r3, #0
	ble	lab907
	mov	r0, r3
	str	r3, [sp, #68]	; 0x44
	str	r3, [sp, #28]
	b	lab908
	mov	r3, #0
	str	r3, [sp, #44]	; 0x2c
	b	lab909
	mov	r3, #0
	str	r3, [sp, #44]	; 0x2c
	b	lab910
lab841: 	mov	r3, r9
	ldr	r1, [pc, #-2716]	; dadc <_dtoa_r+0x374>
	ldr	r9, [sp, #72]	; 0x48
	add	r1, r1, r9, lsl #3
	mov	r2, r8
	ldmdb	r1, {r0, r1}
	push {r1, r2}
	mov.w r1, #7788
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7788
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #7788
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7788
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r7, sp, #56	; 0x38
	ldm	r7, {r6, r7}
	str	r0, [sp, #80]	; 0x50
	str	r1, [sp, #84]	; 0x54
	mov	r1, r7
	mov	r0, r6
	bl	__aeabi_d2iz
	mov	r5, r0
	push {r1, r2}
	mov.w r1, #4262
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #4262
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	ldr	r8, [sp, #16]
	add	r5, r5, #48	; 0x30
	cmp	r9, #1
	mov	r6, r0
	mov	r7, r1
	strb	r5, [r8], #1
	beq	lab911
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #72]	; 0x48
	add	r5, r3, r2
lab912: 	ldr	r3, [pc, #-2848]	; dad4 <_dtoa_r+0x36c>
	mov	r0, r6
	mov	r1, r7
	push {r1, r2}
	mov.w r1, #4808
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4808
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #4808
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4808
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r7, r1
	mov	r6, r0
	bl	__aeabi_d2iz
	mov	r9, r0
	push {r1, r2}
	mov.w r1, #3245
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #3245
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	add	r9, r9, #48	; 0x30
	strb	r9, [r8], #1
	cmp	r8, r5
	mov	r6, r0
	mov	r7, r1
	bne	lab912
lab981: 	ldm	r9, {r8, r9}
	mov	r2, #0
	ldr	r3, [pc, #-2948]	; dacc <_dtoa_r+0x364>
	mov	r0, r8
	mov	r1, r9
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__adddf3
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4273
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dcmpgt
	cmp	r0, #0
	bne	lab913
	mov	r2, r8
	mov	r3, r9
	mov	r0, #0
	ldr	r1, [pc, #-3004]	; dacc <_dtoa_r+0x364>
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	push {r1, r2}
	mov.w r1, #5487
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmplt
	push{r1, r2}
	mov.w r1, #5487
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab914
lab915: 	ldrb	r3, [r5, #-1]!
	cmp	r3, #48	; 0x30
	beq	lab915
	b	lab916
lab870: 	mov	r1, r7
	mov	r2, #5
	mov	r0, r4
	bl	__multadd
	mov	r7, r0
	mov	r0, fp
	mov	r1, r7
	push {r1, r2}
	mov.w r1, #8045
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #8045
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__mcmp
	push{r1, r2}
	mov.w r1, #8045
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #8045
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	ble	lab917
lab939: 	add	r5, r3, #1
	mov	r3, #49	; 0x31
	ldr	r0, [sp, #16]
	mov	r8, r0
	strb	r3, [r0], #1
	str	r0, [sp, #16]
	b	lab918
lab877: 	ldr	r3, [sp, #20]
	add	r3, r3, #1
	str	r3, [sp, #20]
lab901: 	mov	r5, #1
	ldr	r8, [sp, #16]
	ldr	r9, [sp, #28]
	b	lab919
lab920: 	mov	r3, #0
	mov	r2, #10
	mov	r0, r4
	bl	__multadd
	mov	fp, r0
	add	r5, r5, #1
lab919: 	mov	r1, r7
	mov	r0, fp
	push {r1, r2}
	mov.w r1, #5564
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	quorem
	push{r1, r2}
	mov.w r1, #5564
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r5, r9
	add	r3, r0, #48	; 0x30
	strb	r3, [r8], #1
	blt	lab920
	ldr	r2, [sp, #28]
	cmp	r2, #0
	movgt	r5, r2
	movle	r5, #1
	mov	r9, #0
	ldr	r2, [sp, #16]
	add	r8, r2, r5
lab977: 	mov	r2, #1
	mov	r0, r4
	str	r3, [sp, #8]
	push {r1, r2}
	mov.w r1, #2622
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__lshift
	push{r1, r2}
	mov.w r1, #2622
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r1, r7
	mov	fp, r0
	push {r1, r2}
	mov.w r1, #3740
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3740
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__mcmp
	push{r1, r2}
	mov.w r1, #3740
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3740
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	ble	lab921
lab958: lab976: 	sub	r8, r8, #1
	b	lab922
lab924: 	beq	lab923
	ldrb	r3, [r8, #-1]!
lab922: 	cmp	r3, #57	; 0x39
	add	r5, r8, #1
	beq	lab924
	add	r3, r3, #1
	strb	r3, [r8]
lab965: 	mov	r0, r4
	bl	_Bfree
	cmp	r6, #0
	beq	lab925
	cmp	r9, #0
	cmpne	r9, r6
	beq	lab926
	mov	r1, r9
	mov	r0, r4
	ldr	r8, [sp, #16]
	str	r5, [sp, #16]
	bl	_Bfree
	b	lab927
lab888: 	add	r3, sp, #32
	ldm	r3, {r2, r3}
	mov	r8, #2
	str	r2, [sp, #56]	; 0x38
	str	r3, [sp, #60]	; 0x3c
	b	lab928
lab897: 	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	lab929
	add	r2, sp, #8
	ldm	r2, {r1, r2}
	bic	r3, r2, #-16777216	; 0xff000000
	bic	r3, r3, #15728640	; 0xf00000
	cmp	r3, #0
	mov	r3, r2
	bne	lab930
lab942: 	and	r9, r9, r3
	cmp	r9, #0
	beq	lab931
	ldr	r3, [sp, #40]	; 0x28
	add	r3, r3, #1
	str	r3, [sp, #40]	; 0x28
	ldr	r3, [sp, #24]
	add	r3, r3, #1
	mov	r9, #1
	str	r3, [sp, #24]
	b	lab932
lab859: 	mov	r1, r6
	mov	r2, r7
	mov	r0, r4
	push {r1, r2}
	mov.w r1, #5104
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__pow5mult
	push{r1, r2}
	mov.w r1, #5104
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r6, r0
	mov	r2, fp
	mov	r1, r6
	mov	r0, r4
	push {r1, r2}
	mov.w r1, #4238
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__multiply
	push{r1, r2}
	mov.w r1, #4238
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r8, r0
	mov	r1, fp
	mov	r0, r4
	bl	_Bfree
	mov	fp, r8
	b	lab933
lab860: 	mov	r1, fp
	mov	r0, r4
	push {r1, r2}
	mov.w r1, #6583
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__pow5mult
	push{r1, r2}
	mov.w r1, #6583
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	fp, r0
	b	lab934
lab894: 	mov	r7, #0
	mov	r6, r7
	b	lab935
lab880: 	mov	r0, r4
	str	r3, [sp, #24]
	bl	_Bfree
	mov	r2, #1
	ldr	r3, [sp, #24]
	b	lab936
lab886: 	bl	__multadd
	mov	r6, r0
	mov	sl, r0
	b	lab937
lab907: 	mov	r3, #1
	str	r3, [sp, #148]	; 0x94
	str	r3, [sp, #28]
	b	lab938
lab851: 	mov	r7, #0
lab895: 	mov	r6, r7
	b	lab939
lab862: 	add	r2, sp, #8
	ldm	r2, {r1, r2}
	cmp	r1, #0
	mov	r3, r1
	bne	lab940
	bic	r3, r2, #-16777216	; 0xff000000
	bic	r3, r3, #15728640	; 0xf00000
	cmp	r3, #0
	ldrne	r9, [sp, #8]
	mov	r3, r2
	bne	lab941
	b	lab942
lab839: 	ldr	r3, [sp, #28]
	cmp	r3, #0
	beq	lab943
	ldr	r3, [sp, #68]	; 0x44
	cmp	r3, #0
	ble	lab944
	str	r3, [sp, #72]	; 0x48
	ldr	r3, [sp, #20]
	sub	r3, r3, #1
	mov	r0, r5
	mov	r1, r6
	mov	r2, #0
	str	r3, [sp, #88]	; 0x58
	ldr	r3, [pc, #-3752]	; dad4 <_dtoa_r+0x36c>
	push {r1, r2}
	mov.w r1, #5631
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5631
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #5631
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5631
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r6, r1
	mov	r5, r2
	add	r0, r8, #1
	str	r5, [sp, #56]	; 0x38
	str	r6, [sp, #60]	; 0x3c
	push {r1, r2}
	mov.w r1, #7889
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #7889
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r5
	mov	r3, r6
	push {r1, r2}
	mov.w r1, #3724
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3724
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #3724
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3724
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, #0
	ldr	r3, [pc, #-3800]	; dad8 <_dtoa_r+0x370>
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__adddf3
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6472
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r8, r0
	sub	r9, r1, #54525952	; 0x3400000
	b	lab945
lab855: 	ldr	r2, [sp, #64]	; 0x40
	cmp	r2, #0
	ldreq	r3, [sp, #96]	; 0x60
	addne	r3, r3, #1072	; 0x430
	ldr	r2, [sp, #24]
	addne	r3, r3, #3
	rsbeq	r3, r3, #54	; 0x36
	add	r2, r2, r3
	str	r2, [sp, #24]
	ldr	r2, [sp, #40]	; 0x28
	add	r3, r2, r3
	mov	r5, r2
	str	r3, [sp, #40]	; 0x28
	ldr	r7, [sp, #48]	; 0x30
	b	lab946
lab858: 	mov	r1, fp
	mov	r0, r4
	ldr	r2, [sp, #48]	; 0x30
	push {r1, r2}
	mov.w r1, #5811
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__pow5mult
	push{r1, r2}
	mov.w r1, #5811
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	fp, r0
	b	lab947
lab823: 	mov	r1, #0
	mov	r0, r4
	str	r1, [r4, #68]	; 0x44
	push {r1, r2}
	mov.w r1, #1139
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_Balloc
	push{r1, r2}
	mov.w r1, #1139
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r3, r0, #0
	str	r3, [sp, #16]
	beq	lab948
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #20]
	str	r3, [r4, #64]	; 0x40
	ldr	r3, [sp, #100]	; 0x64
	cmp	r2, #14
	movgt	r2, #0
	movle	r2, #1
	cmp	r3, #0
	movlt	r2, #0
	cmp	r2, #0
	beq	lab949
	ldr	r2, [sp, #20]
	ldr	r3, [pc, #-3976]	; dadc <_dtoa_r+0x374>
	add	r3, r3, r2, lsl #3
	mvn	r2, #0
	str	r2, [sp, #28]
	ldm	r3, {r2, r3}
	str	r2, [sp, #8]
	str	r3, [sp, #12]
lab893: 	add	sl, sp, #8
	ldm	sl, {r9, sl}
	add	r7, sp, #32
	ldm	r7, {r6, r7}
	mov	r2, r9
	mov	r3, sl
	mov	r0, r6
	mov	r1, r7
	push {r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_ddiv
	push{r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4237
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	__aeabi_d2iz
	mov	r8, r0
	push {r1, r2}
	mov.w r1, #4373
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #4373
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r9
	mov	r3, sl
	push {r1, r2}
	mov.w r1, #2108
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2108
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #2108
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2108
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r1
	mov	r2, r0
	mov	r1, r7
	mov	r0, r6
	bl	__aeabi_dsub
	ldr	r3, [sp, #28]
	ldr	r5, [sp, #16]
	cmp	r3, #1
	add	r3, r8, #48	; 0x30
	strb	r3, [r5], #1
	beq	lab950
	str	fp, [sp, #24]
	mov	r9, #1
	ldr	fp, [sp, #28]
	mov	sl, r5
	add	r7, sp, #8
	ldm	r7, {r6, r7}
	str	r4, [sp, #28]
	b	lab951
lab953: 	mov	r3, r7
	mov	r0, r4
	mov	r1, r5
	push {r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_ddiv
	push{r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3553
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	__aeabi_d2iz
	mov	r8, r0
	push {r1, r2}
	mov.w r1, #7927
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_i2d
	push{r1, r2}
	mov.w r1, #7927
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r6
	mov	r3, r7
	push {r1, r2}
	mov.w r1, #3081
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3081
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #3081
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3081
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r9, r9, #1
	mov	r3, r1
	mov	r2, r0
	mov	r1, r5
	mov	r0, r4
	bl	__aeabi_dsub
	add	r3, r8, #48	; 0x30
	cmp	r9, fp
	strb	r3, [sl], #1
	beq	lab952
lab951: 	mov	r2, #0
	ldr	r3, [pc, #800]	; ee80 <_dtoa_r+0x1718>
	push {r1, r2}
	mov.w r1, #4562
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4562
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #4562
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4562
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, #0
	mov	r3, #0
	mov	r4, r0
	mov	r5, r1
	push {r1, r2}
	mov.w r1, #6318
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmpeq
	push{r1, r2}
	mov.w r1, #6318
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab953
	mov	r5, sl
	ldr	fp, [sp, #24]
	ldr	r4, [sp, #28]
lab973: 	add	r3, r3, #1
	ldr	r8, [sp, #16]
	str	r3, [sp, #20]
	str	r5, [sp, #16]
	b	lab954
lab925: 	ldr	r8, [sp, #16]
	str	r5, [sp, #16]
	b	lab955
lab923: 	ldr	r3, [sp, #20]
	add	r3, r3, #1
	str	r3, [sp, #20]
	mov	r3, #49	; 0x31
	ldr	r2, [sp, #16]
	strb	r3, [r2]
	b	lab956
lab921: 	bne	lab957
	ldr	r3, [sp, #8]
	tst	r3, #1
	bne	lab958
lab959: 	ldrb	r3, [r8, #-1]!
	cmp	r3, #48	; 0x30
	beq	lab959
	b	lab960
lab848: 	ldr	r3, [sp, #88]	; 0x58
	add	r3, r3, #1
	str	r3, [sp, #88]	; 0x58
	str	r1, [sp, #16]
	mov	r3, #49	; 0x31
	b	lab961
lab883: 	cmp	r2, #0
	ble	lab962
	mov	r1, fp
	mov	r2, #1
	mov	r0, r4
	str	r3, [sp, #8]
	push {r1, r2}
	mov.w r1, #7164
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__lshift
	push{r1, r2}
	mov.w r1, #7164
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r1, r7
	mov	fp, r0
	push {r1, r2}
	mov.w r1, #5361
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5361
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__mcmp
	push{r1, r2}
	mov.w r1, #5361
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5361
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	ldr	r3, [sp, #8]
	ble	lab963
lab985: 	beq	lab964
lab979: lab986: 	add	r2, r2, #1
	mov	r9, r6
	str	r2, [sp, #20]
	mov	r6, sl
	strb	r3, [r5], #1
	b	lab965
lab845: 	ldr	fp, [sp, #56]	; 0x38
	ldr	r4, [sp, #72]	; 0x48
lab842: 	ldr	r3, [sp, #88]	; 0x58
	add	r3, r3, #1
	ldr	r8, [sp, #16]
	str	r3, [sp, #20]
	str	r5, [sp, #16]
	b	lab966
lab913: 	ldr	r1, [sp, #16]
	b	lab967
lab879: 	mov	r0, r4
	ldr	r1, [r6, #4]
	push {r1, r2}
	mov.w r1, #6896
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_Balloc
	push{r1, r2}
	mov.w r1, #6896
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r5, r0, #0
	beq	lab968
	ldr	r2, [r6, #16]
	add	r2, r2, #2
	lsl	r2, r2, #2
	add	r1, r6, #12
	add	r0, r5, #12
	push {r1, r2}
	mov.w r1, #7437
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7437
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7437
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memcpy
	push{r1, r2}
	mov.w r1, #7437
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7437
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7437
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r1, r5
	mov	r2, #1
	mov	r0, r4
	push {r1, r2}
	mov.w r1, #4061
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__lshift
	push{r1, r2}
	mov.w r1, #4061
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	sl, r0
	b	lab969
lab844: 	ldr	sl, [sp, #92]	; 0x5c
	ldr	fp, [sp, #56]	; 0x38
	ldr	r4, [sp, #72]	; 0x48
	b	lab970
lab952: 	mov	r5, sl
	ldr	fp, [sp, #24]
	ldr	r4, [sp, #28]
lab950: 	mov	r2, r0
	mov	r3, r1
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__adddf3
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3171
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	sl, sp, #8
	ldm	sl, {r9, sl}
	mov	r2, r9
	mov	r3, sl
	mov	r6, r0
	mov	r7, r1
	bl	__aeabi_dcmpgt
	cmp	r0, #0
	bne	lab971
	mov	r2, r9
	mov	r3, sl
	mov	r0, r6
	mov	r1, r7
	push {r1, r2}
	mov.w r1, #5417
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dcmpeq
	push{r1, r2}
	mov.w r1, #5417
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab972
	tst	r8, #1
	beq	lab973
lab971: 	ldr	r3, [sp, #20]
	ldr	r1, [sp, #16]
	str	r3, [sp, #88]	; 0x58
	b	lab974
lab884: 	cmp	r3, #57	; 0x39
	addne	r3, r3, #1
	bne	lab975
lab978: 	add	r3, r3, #1
	mov	r8, r5
	str	r3, [sp, #20]
	mov	r3, #57	; 0x39
	mov	r9, r6
	strb	r3, [r8], #1
	mov	r6, sl
	b	lab976
lab885: 	ldr	r2, [sp, #20]
	add	r2, r2, #1
	mov	r9, r6
	str	r2, [sp, #20]
	mov	r6, sl
	b	lab977
lab881: 	cmp	r3, #57	; 0x39
	beq	lab978
	cmp	r8, #0
	bgt	lab979
	b	lab980
lab911: 	mov	r5, r8
	b	lab981
lab900: 	mov	r1, r6
	mov	r3, #0
	mov	r2, #10
	mov	r0, r4
	bl	__multadd
	ldr	r2, [sp, #68]	; 0x44
	ldr	r1, [sp, #144]	; 0x90
	cmp	r2, #0
	mov	r3, r2
	movle	r3, #1
	movgt	r3, #0
	cmp	r1, #2
	movle	r3, #0
	cmp	r3, #0
	mov	r6, r0
	str	r8, [sp, #20]
	streq	r2, [sp, #28]
	bne	lab982
	b	lab983
lab963: 	bne	lab984
	tst	r3, #1
	bne	lab985
	b	lab986
lab889: 	add	r3, sp, #72	; 0x48
	ldm	r3, {r2, r3}
	mov	r8, #2
	str	r2, [sp, #56]	; 0x38
	str	r3, [sp, #60]	; 0x3c
	b	lab987
lab865: 	rsbne	r3, r3, #60	; 0x3c
	bne	lab988
	b	lab989
lab948: 	mov	r2, #0
	ldr	r3, [pc, #72]	; ee84 <_dtoa_r+0x171c>
	ldr	r1, [pc, #72]	; ee88 <_dtoa_r+0x1720>
	ldr	r0, [pc, #72]	; ee8c <_dtoa_r+0x1724>
	bl	__assert_func
lab968: 	mov	r2, r5
	ldr	r3, [pc, #52]	; ee84 <_dtoa_r+0x171c>
	ldr	r1, [pc, #60]	; ee90 <_dtoa_r+0x1728>
	ldr	r0, [pc, #52]	; ee8c <_dtoa_r+0x1724>
	bl	__assert_func
lab926: 	ldr	r8, [sp, #16]
	str	r5, [sp, #16]
	b	lab990
lab949: 	mov	r1, #1
	str	r2, [sp, #148]	; 0x94
	mvn	r2, #0
	str	r1, [sp, #44]	; 0x2c
	str	r2, [sp, #28]
	str	r2, [sp, #68]	; 0x44
	b	lab991
	eormi	r0, r4, r0
	andeq	r2, r1, r0, lsr #31
	andeq	r0, r0, sl, lsr #3
	; <UNDEFINED> instruction: 0x00012fb4
	andeq	r0, r0, sl, ror #5
__sflush_r:
	ldrsh	r2, [r1, #12]
	tst	r2, #8
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	mov	r7, r0
	bne	lab992
	ldr	r3, [r1, #4]
	orr	r2, r2, #2048	; 0x800
	cmp	r3, #0
	strh	r2, [r1, #12]
	ble	lab993
lab1007: 	cmp	r6, #0
	beq	lab994
	mov	r3, #0
	ldr	r8, [r7]
	ands	r5, r2, #4096	; 0x1000
	str	r3, [r7]
	lsl	r3, r2, #16
	lsr	r3, r3, #16
	bne	lab995
	mov	r3, #1
	mov	r2, r5
	mov	r0, r7
	ldr	r1, [r4, #28]
	mov	lr, pc
	bx	r6
	cmn	r0, #1
	beq	lab996
lab1011: 	ldr	r6, [r4, #40]	; 0x28
lab1008: 	beq	lab997
	ldr	r3, [r4, #48]	; 0x30
	cmp	r3, #0
	ldr	r3, [r4, #4]
	sub	r0, r0, r3
	ldrne	r3, [r4, #60]	; 0x3c
	subne	r0, r0, r3
lab997: 	mov	r2, r0
	mov	r3, #0
	mov	r0, r7
	ldr	r1, [r4, #28]
	mov	lr, pc
	bx	r6
	cmn	r0, #1
	bne	lab998
	ldr	r2, [r7]
	cmp	r2, #29
	cmpne	r2, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r2, #22
	orreq	r3, r3, #1
	cmp	r3, #0
	beq	lab999
	mov	r3, #0
	str	r3, [r4, #4]
	ldrsh	r3, [r4, #12]
	bic	r3, r3, #2048	; 0x800
	strh	r3, [r4, #12]
	tst	r3, #4096	; 0x1000
	ldr	r3, [r4, #16]
	str	r3, [r4]
	bne	lab1000
lab1014: 	cmp	r1, #0
	str	r8, [r7]
	beq	lab1001
	add	r3, r4, #64	; 0x40
	cmp	r1, r3
	movne	r0, r7
	push {r1, r2}
	mov.w r1, #3920
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	blne	f65c <_free_r>
	push{r1, r2}
	mov.w r1, #3920
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #48]	; 0x30
	pop	{r4, r5, r6, r7, r8, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #145
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab992: 	ldr	r6, [r1, #16]
	cmp	r6, #0
	beq	lab1002
	lsl	r3, r2, #16
	lsr	r3, r3, #16
	tst	r3, #3
	movne	r3, #0
	ldr	r5, [r1]
	ldreq	r3, [r1, #20]
	sub	r5, r5, r6
	cmp	r5, #0
	str	r6, [r1]
	str	r3, [r1, #8]
	bgt	lab1003
	b	lab1004
lab1006: 	add	r6, r6, r0
	ble	lab1005
lab1003: 	mov	r3, r5
	mov	r2, r6
	mov	r0, r7
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #36]	; 0x24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	sub	r5, r5, r0
	bgt	lab1006
	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	; 0x40
	mvn	r0, #0
	strh	r3, [r4, #12]
	pop	{r4, r5, r6, r7, r8, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2421
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab993: 	ldr	r3, [r1, #60]	; 0x3c
	cmp	r3, #0
	bgt	lab1007
lab1005: 	mov	r0, #0
lab1013: 	cpsid f
	push {r1, r2}
	mov.w r1, #7283
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab995: 	ldr	r0, [r4, #80]	; 0x50
	b	lab1008
lab998: 	ldrsh	r3, [r4, #12]
	bic	r3, r3, #2048	; 0x800
	strh	r3, [r4, #12]
	tst	r3, #4096	; 0x1000
	mov	r3, #0
	ldr	r2, [r4, #16]
	stm	r4, {r2, r3}
	beq	lab1009
lab1015: 	b	lab1010
lab996: 	ldr	r3, [r7]
	cmp	r3, #0
	beq	lab1011
	cmp	r3, #22
	cmpne	r3, #29
	moveq	r0, r5
	streq	r8, [r7]
	beq	lab1012
lab999: 	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	; 0x40
	strh	r3, [r4, #12]
	b	lab1013
lab1000: 	cmp	r2, #0
	bne	lab1014
	b	lab1015
_fflush_r:
	push	{r4, r5, r6, lr}
	subs	r5, r0, #0
	mov	r4, r1
	beq	lab1016
	ldr	r3, [r5, #56]	; 0x38
	cmp	r3, #0
	beq	lab1017
lab1023: 	cmp	r0, #0
	moveq	r5, r0
	beq	lab1018
	ldr	r3, [r4, #100]	; 0x64
	tst	r3, #1
	bne	lab1019
	tst	r0, #512	; 0x200
	beq	lab1020
lab1024: 	mov	r1, r4
	push {r1, r2}
	mov.w r1, #5646
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5646
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5646
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__sflush_r
	push{r1, r2}
	mov.w r1, #5646
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5646
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5646
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r4, #100]	; 0x64
	tst	r3, #1
	mov	r5, r0
	bne	lab1021
	ldrh	r3, [r4, #12]
	tst	r3, #512	; 0x200
	beq	lab1022
lab1021: 	mov	r0, r5
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3838
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1017:	push {r1, r2}
	mov.w r1, #7565
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7565
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
 	bl	__sinit
	push{r1, r2}
	mov.w r1, #7565
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7565
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab1023
lab1020: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_acquire_recursive
	b	lab1024
lab1022: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2883
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
_cleanup_r:
	push	{r4, lr}
	ldr	r1, [pc, #8]	; f188 <_cleanup_r+0x14>
	bl	_fwalk_reent
	push{r1, r2}
	mov.w r1, #845
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	pop	{r4, lr}
	bx	lr
	strdeq	r1, [r1], -r4
__sinit:
	push	{r4, r5, r6, r7, r8, r9, sl, lr}
	mov	sl, r0
	ldr	r0, [pc, #348]	; f2f8 <__sinit+0x16c>
	bl	__retarget_lock_acquire_recursive
	ldr	r4, [sl, #56]	; 0x38
	cmp	r4, #0
	bne	lab1025
	mov	r3, #4
	mov	r2, #3
	ldr	r1, [pc, #324]	; f2fc <__sinit+0x170>
	ldr	r5, [sl, #4]
	str	r1, [sl, #60]	; 0x3c
	ldr	r9, [pc, #316]	; f300 <__sinit+0x174>
	ldr	r8, [pc, #316]	; f304 <__sinit+0x178>
	ldr	r7, [pc, #316]	; f308 <__sinit+0x17c>
	ldr	r6, [pc, #316]	; f30c <__sinit+0x180>
	add	r1, sl, #748	; 0x2ec
	str	r1, [sl, #744]	; 0x2e8
	str	r2, [sl, #740]	; 0x2e4
	str	r4, [sl, #736]	; 0x2e0
	mov	r1, r4
	str	r3, [r5, #12]
	mov	r2, #8
	str	r4, [r5, #100]	; 0x64
	str	r4, [r5]
	str	r4, [r5, #4]
	str	r4, [r5, #8]
	str	r4, [r5, #16]
	str	r4, [r5, #20]
	str	r4, [r5, #24]
	add	r0, r5, #92	; 0x5c
	push {r1, r2}
	mov.w r1, #3329
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3329
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3329
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3329
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3329
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
	push{r1, r2}
	mov.w r1, #3329
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3329
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3329
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3329
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3329
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r9, [r5, #32]
	str	r8, [r5, #36]	; 0x24
	str	r7, [r5, #40]	; 0x28
	str	r6, [r5, #44]	; 0x2c
	add	r0, r5, #88	; 0x58
	str	r5, [r5, #28]
	bl	__retarget_lock_init_recursive
	ldr	r5, [sl, #8]
	ldr	r3, [pc, #220]	; f310 <__sinit+0x184>
	mov	r1, r4
	str	r3, [r5, #12]
	mov	r2, #8
	str	r4, [r5, #100]	; 0x64
	str	r4, [r5]
	str	r4, [r5, #4]
	str	r4, [r5, #8]
	str	r4, [r5, #16]
	str	r4, [r5, #20]
	str	r4, [r5, #24]
	add	r0, r5, #92	; 0x5c
	push {r1, r2}
	mov.w r1, #6524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
	push{r1, r2}
	mov.w r1, #6524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6524
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r9, [r5, #32]
	str	r8, [r5, #36]	; 0x24
	str	r7, [r5, #40]	; 0x28
	str	r6, [r5, #44]	; 0x2c
	add	r0, r5, #88	; 0x58
	str	r5, [r5, #28]
	bl	__retarget_lock_init_recursive
	ldr	r5, [sl, #12]
	ldr	r3, [pc, #140]	; f314 <__sinit+0x188>
	mov	r1, r4
	str	r3, [r5, #12]
	mov	r2, #8
	str	r4, [r5, #100]	; 0x64
	str	r4, [r5]
	str	r4, [r5, #4]
	str	r4, [r5, #8]
	str	r4, [r5, #16]
	str	r4, [r5, #20]
	str	r4, [r5, #24]
	add	r0, r5, #92	; 0x5c
	push {r1, r2}
	mov.w r1, #2705
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2705
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2705
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2705
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2705
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
	push{r1, r2}
	mov.w r1, #2705
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2705
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2705
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2705
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2705
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	add	r0, r5, #88	; 0x58
	str	r9, [r5, #32]
	str	r5, [r5, #28]
	str	r8, [r5, #36]	; 0x24
	str	r7, [r5, #40]	; 0x28
	str	r6, [r5, #44]	; 0x2c
	bl	__retarget_lock_init_recursive
	mov	r3, #1
	ldr	r0, [pc, #28]	; f2f8 <__sinit+0x16c>
	str	r3, [sl, #56]	; 0x38
	bl	__retarget_lock_release_recursive
	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6600
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1025: 	ldr	r0, [pc, #8]	; f2f8 <__sinit+0x16c>
	bl	__retarget_lock_release_recursive
	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3017
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	ldrdeq	r4, [r2], -ip
	andeq	pc, r0, r4, ror r1	; <UNPREDICTABLE>
	strdeq	r1, [r1], -r8
	andeq	r1, r1, ip, lsr #10
	andeq	r1, r1, r8, lsl #11
	; <UNDEFINED> instruction: 0x000115b8
	andeq	r0, r1, r9
	andeq	r0, r2, r2, lsl r0
__sfp_lock_acquire:
	push	{r4, lr}
	ldr	r0, [pc, #8]	; f32c <__sfp_lock_acquire+0x14>
	bl	__retarget_lock_acquire_recursive
	pop	{r4, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3407
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	ldrdeq	r4, [r2], -r8
__sfp_lock_release:
	push	{r4, lr}
	ldr	r0, [pc, #8]	; f344 <__sfp_lock_release+0x14>
	bl	__retarget_lock_release_recursive
	pop	{r4, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2730
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	ldrdeq	r4, [r2], -r8
__libc_fini_array:
	push	{r4, r5, r6, lr}
	ldr	r5, [pc, #48]	; f384 <__libc_fini_array+0x3c>
	ldr	r4, [pc, #48]	; f388 <__libc_fini_array+0x40>
	sub	r4, r5, r4
	asrs	r4, r4, #2
	beq	lab1026
lab1027: 	sub	r4, r4, #1
	mov	lr, pc
	bx	r3
	cmp	r4, #0
	bne	lab1027
lab1026: 	bl	_fini
	pop	{r4, r5, r6, lr}
	bx	lr
	andeq	r3, r2, r0, ror #5
	ldrdeq	r3, [r2], -ip
__fputwc:
	push	{r4, r5, r6, r7, r8, r9, lr}
	sub	sp, sp, #12
	mov	r7, r0
	mov	r8, r1
	mov	r4, r2
	bl	__locale_mb_cur_max
	cmp	r0, #1
	bne	lab1028
	sub	r3, r8, #1
	cmp	r3, #254	; 0xfe
	bls	lab1029
lab1028: 	mov	r2, r8
	mov	r0, r7
	add	r3, r4, #92	; 0x5c
	add	r1, sp, #4
	bl	_wcrtomb_r
	cmn	r0, #1
	mov	r6, r0
	beq	lab1030
	cmp	r0, #0
	beq	lab1031
	ldrb	r1, [sp, #4]
lab1037: 	add	r9, sp, #5
	b	lab1032
lab1035: 	add	r2, r3, #1
	str	r2, [r4]
	strb	r1, [r3]
lab1036: 	cmp	r5, r6
	bcs	lab1033
	ldrb	r1, [r9], #1
lab1032: 	ldr	r3, [r4, #8]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #8]
	bge	lab1034
	ldr	r2, [r4, #24]
	cmp	r3, r2
	movlt	r3, #0
	movge	r3, #1
	cmp	r1, #10
	moveq	r3, #0
	cmp	r3, #0
	bne	lab1035
	mov	r2, r4
	mov	r0, r7
	bl	__swbuf_r
	cmn	r0, #1
	bne	lab1036
	mov	r6, r0
lab1038: 	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3576
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1029: 	and	r1, r8, #255	; 0xff
	mov	r6, r0
	strb	r1, [sp, #4]
	b	lab1037
lab1033: 	mov	r6, r8
	mov	r0, r6
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #8101
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1030: 	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	; 0x40
	strh	r3, [r4, #12]
	b	lab1038
_fputwc_r:
	push	{r4, r5, lr}
	ldr	r3, [r2, #100]	; 0x64
	mov	r4, r2
	ldrsh	r2, [r2, #12]
	tst	r3, #1
	lsl	r3, r2, #16
	mov	r5, r0
	sub	sp, sp, #12
	lsrne	r3, r3, #16
	bne	lab1039
	tst	r2, #512	; 0x200
	lsr	r3, r3, #16
	beq	lab1040
lab1043: 	ldreq	r3, [r4, #100]	; 0x64
	orreq	r2, r2, #8192	; 0x2000
	orreq	r3, r3, #8192	; 0x2000
	strheq	r2, [r4, #12]
	streq	r3, [r4, #100]	; 0x64
	mov	r0, r5
	mov	r2, r4
	bl	__fputwc
	push{r1, r2}
	mov.w r1, #4020
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4020
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r4, #100]	; 0x64
	tst	r3, #1
	mov	r5, r0
	bne	lab1041
	ldrh	r3, [r4, #12]
	tst	r3, #512	; 0x200
	beq	lab1042
lab1041: 	mov	r0, r5
	add	sp, sp, #12
	pop	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #755
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1042: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	add	sp, sp, #12
	pop	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #1320
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1040: 	ldr	r0, [r4, #88]	; 0x58
	str	r1, [sp, #4]
	bl	__retarget_lock_acquire_recursive
	ldrsh	r2, [r4, #12]
	lsl	r3, r2, #16
	ldr	r1, [sp, #4]
	lsr	r3, r3, #16
	b	lab1043
_malloc_trim_r:
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	ldr	r7, [pc, #228]	; f650 <_malloc_trim_r+0xf4>
	mov	r6, r0
	push {r1, r2}
	mov.w r1, #1249
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_lock
	push{r1, r2}
	mov.w r1, #1249
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r7, #8]
	ldr	r5, [r3, #4]
	rsb	r3, r4, #4064	; 0xfe0
	bic	r5, r5, #3
	add	r3, r3, #15
	add	r3, r3, r5
	bic	r3, r3, #4080	; 0xff0
	bic	r3, r3, #15
	sub	r4, r3, #4096	; 0x1000
	cmp	r4, #4096	; 0x1000
	blt	lab1044
	mov	r1, #0
	mov	r0, r6
	push {r1, r2}
	mov.w r1, #4476
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4476
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_sbrk_r
	push{r1, r2}
	mov.w r1, #4476
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4476
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r7, #8]
	add	r3, r3, r5
	cmp	r0, r3
	beq	lab1045
lab1048: 	push {r1, r2}
	mov.w r1, #3823
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #3823
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2642
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1045: 	mov	r0, r6
	rsb	r1, r4, #0
	push {r1, r2}
	mov.w r1, #7658
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7658
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_sbrk_r
	push{r1, r2}
	mov.w r1, #7658
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7658
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmn	r0, #1
	beq	lab1046
	ldr	r3, [r7, #8]
	ldr	r2, [pc, #104]	; f654 <_malloc_trim_r+0xf8>
	sub	r5, r5, r4
	orr	r5, r5, #1
	str	r5, [r3, #4]
	ldr	r3, [r2]
	mov	r0, r6
	sub	r3, r3, r4
	str	r3, [r2]
	push {r1, r2}
	mov.w r1, #209
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #209
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r0, #1
	pop	{r4, r5, r6, r7, r8, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #4494
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1046: 	mov	r1, #0
	mov	r0, r6
	push {r1, r2}
	mov.w r1, #2949
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2949
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_sbrk_r
	push{r1, r2}
	mov.w r1, #2949
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2949
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r2, [r7, #8]
	sub	r3, r0, r2
	cmp	r3, #15
	ble	lab1047
	orr	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [pc, #24]	; f658 <_malloc_trim_r+0xfc>
	ldr	r3, [r3]
	ldr	r1, [pc, #12]	; f654 <_malloc_trim_r+0xf8>
	sub	r0, r0, r3
	str	r0, [r1]
	b	lab1048
	andeq	r3, r2, r0, lsl r7
	muleq	r2, ip, r4
	andeq	r3, r2, r8, lsl fp
_free_r:
	push	{r4, r5, r6, lr}
	subs	r4, r1, #0
	beq	lab1049
	mov	r5, r0
	push {r1, r2}
	mov.w r1, #7240
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_lock
	push{r1, r2}
	mov.w r1, #7240
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r0, [r4, #-4]
	ldr	r2, [pc, #700]	; f938 <_free_r+0x2dc>
	sub	ip, r4, #8
	ldr	r3, [r2, #8]
	bic	r1, r0, #1
	add	lr, ip, r1
	cmp	r3, lr
	ldr	r3, [lr, #4]
	bic	r3, r3, #3
	beq	lab1050
	tst	r0, #1
	str	r3, [lr, #4]
	bne	lab1051
	ldr	r0, [r4, #-8]
	sub	ip, ip, r0
	add	r1, r1, r0
	ldr	r0, [ip, #8]
	add	r4, r2, #8
	cmp	r0, r4
	beq	lab1052
	add	r6, lr, r3
	ldr	r6, [r6, #4]
	tst	r6, #1
	ldr	r6, [ip, #12]
	str	r6, [r0, #12]
	str	r0, [r6, #8]
	beq	lab1053
	orr	r3, r1, #1
	str	r3, [ip, #4]
	str	r1, [lr]
lab1057: 	bcs	lab1054
lab1058: 	ldr	r0, [r2, #4]
	lsr	r3, r1, #3
	lsr	r1, r1, #5
	add	r3, r3, #1
	orr	r1, r0, lr, lsl r1
	str	r1, [r2, #4]
	ldr	r0, [r2, r3, lsl #3]
	add	r1, r2, r3, lsl #3
	sub	r1, r1, #8
	str	r1, [ip, #12]
	str	r0, [ip, #8]
	str	ip, [r2, r3, lsl #3]
	str	ip, [r0, #12]
lab1075: 	push {r1, r2}
	mov.w r1, #6675
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
lab1049:	push{r1, r2}
	mov.w r1, #6675
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3146
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1051: 	add	r0, lr, r3
	ldr	r0, [r0, #4]
	tst	r0, #1
	bne	lab1055
	add	r1, r1, r3
	add	r4, r2, #8
lab1072: 	cmp	r3, r4
	beq	lab1056
	ldr	r0, [lr, #12]
	str	r0, [r3, #12]
	str	r3, [r0, #8]
	orr	r3, r1, #1
	str	r3, [ip, #4]
	str	r1, [ip, r1]
	b	lab1057
lab1055: 	orr	r3, r1, #1
	cmp	r1, #512	; 0x200
	str	r3, [r4, #-4]
	str	r1, [lr]
	bcc	lab1058
lab1054: 	cmp	r1, #2560	; 0xa00
	lsr	r3, r1, #9
	bcs	lab1059
	lsr	r3, r1, #6
	add	r0, r3, #57	; 0x39
	add	lr, r3, #56	; 0x38
	lsl	r0, r0, #3
lab1078: 	add	r0, r2, r0
	sub	r0, r0, #8
	cmp	r0, r3
	beq	lab1060
lab1062: 	bic	r2, r2, #3
	cmp	r2, r1
	bls	lab1061
	ldr	r3, [r3, #8]
	cmp	r0, r3
	bne	lab1062
lab1061: 	ldr	r0, [r3, #12]
lab1074: 	str	r3, [ip, #8]
	str	ip, [r0, #8]
	str	ip, [r3, #12]
	b	lab1063
lab1052: 	add	r2, lr, r3
	ldr	r2, [r2, #4]
	tst	r2, #1
	orrne	r3, r1, #1
	strne	r3, [ip, #4]
	strne	r1, [lr]
	bne	lab1064
	add	r3, r3, r1
	add	r1, lr, #8
	ldm	r1, {r1, r2}
	str	r2, [r1, #12]
	str	r1, [r2, #8]
	orr	r2, r3, #1
	str	r2, [ip, #4]
	str	r3, [ip, r3]
	b	lab1065
lab1050: 	tst	r0, #1
	add	r3, r1, r3
	bne	lab1066
	ldr	r1, [r4, #-8]
	sub	ip, ip, r1
	add	r0, ip, #8
	add	r3, r3, r1
	ldm	r0, {r0, r1}
	str	r1, [r0, #12]
	str	r0, [r1, #8]
lab1066: 	orr	r1, r3, #1
	str	r1, [ip, #4]
	ldr	r1, [pc, #212]	; f93c <_free_r+0x2e0>
	str	ip, [r2, #8]
	ldr	r2, [r1]
	cmp	r2, r3
	bhi	lab1067
	ldr	r3, [pc, #196]	; f940 <_free_r+0x2e4>
	mov	r0, r5
	ldr	r1, [r3]
	bl	_malloc_trim_r
	push{r1, r2}
	mov.w r1, #129
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #129
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab1068
lab1059: 	cmp	r3, #20
	bls	lab1069
	cmp	r3, #84	; 0x54
	bhi	lab1070
	lsr	r3, r1, #12
	add	r0, r3, #111	; 0x6f
	add	lr, r3, #110	; 0x6e
	lsl	r0, r0, #3
	b	lab1071
lab1053: 	add	r1, r1, r3
	b	lab1072
lab1069: 	add	r0, r3, #92	; 0x5c
	add	lr, r3, #91	; 0x5b
	lsl	r0, r0, #3
	b	lab1073
lab1060: 	mov	r4, #1
	ldr	r1, [r2, #4]
	asr	lr, lr, #2
	orr	lr, r1, r4, lsl lr
	str	lr, [r2, #4]
	b	lab1074
lab1056: 	orr	r3, r1, #1
	str	ip, [r2, #20]
	str	ip, [r2, #16]
	stmib	ip, {r3, r4}
	str	r4, [ip, #12]
	str	r1, [ip, r1]
	b	lab1075
lab1070: 	cmp	r3, #340	; 0x154
	bhi	lab1076
	lsr	r3, r1, #15
	add	r0, r3, #120	; 0x78
	add	lr, r3, #119	; 0x77
	lsl	r0, r0, #3
	b	lab1077
lab1076: 	ldr	r0, [pc, #40]	; f944 <_free_r+0x2e8>
	cmp	r3, r0
	lsrls	r3, r1, #18
	addls	r0, r3, #125	; 0x7d
	movhi	r0, #1016	; 0x3f8
	movhi	lr, #126	; 0x7e
	addls	lr, r3, #124	; 0x7c
	lslls	r0, r0, #3
	b	lab1078
	andeq	r3, r2, r0, lsl r7
	andeq	r3, r2, ip, lsl fp
	andeq	r4, r2, ip, asr #9
	andeq	r0, r0, r4, asr r5
__sfvwrite_r:
	ldr	r3, [r2, #8]
	cmp	r3, #0
	beq	lab1079
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldrsh	r3, [r1, #12]
	lsl	r3, r3, #16
	tst	r3, #524288	; 0x80000
	mov	r7, r2
	mov	r9, r0
	mov	r4, r1
	sub	sp, sp, #12
	lsr	r8, r3, #16
	beq	lab1080
	ldr	r2, [r1, #16]
	cmp	r2, #0
	beq	lab1081
	ands	sl, r8, #2
	ldr	r6, [r7]
	beq	lab1082
lab1087: 	mov	r5, sl
	ldr	r8, [pc, #1124]	; fe08 <__sfvwrite_r+0x4c0>
lab1098: 	beq	lab1083
	cmp	r5, r8
	movcc	r3, r5
	movcs	r3, r8
	mov	r2, sl
	mov	r0, r9
	ldr	fp, [r4, #36]	; 0x24
	ldr	r1, [r4, #28]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ble	lab1084
	ldr	r3, [r7, #8]
	sub	r3, r3, r0
	cmp	r3, #0
	str	r3, [r7, #8]
	add	sl, sl, r0
	sub	r5, r5, r0
	bne	lab1085
lab1106: lab1126: 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #1319
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1081: 	mov	r1, r4
	mov	r0, r9
	push {r1, r2}
	mov.w r1, #3322
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3322
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__swsetup_r
	push{r1, r2}
	mov.w r1, #3322
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3322
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bne	lab1086
	ldrsh	r3, [r4, #12]
	lsl	r3, r3, #16
	lsr	r8, r3, #16
	ands	sl, r8, #2
	ldr	r6, [r7]
	bne	lab1087
lab1082: 	ands	r8, r8, #1
	bne	lab1088
	mov	r5, r8
lab1097: 	beq	lab1089
lab1096: 	ldr	sl, [r4, #8]
	lsr	r3, r3, #16
	beq	lab1090
	cmp	sl, r5
	mov	r2, sl
	bhi	lab1091
	tst	r3, #1152	; 0x480
	beq	lab1092
	ldr	r0, [r4, #16]
	ldr	sl, [r4]
	ldr	r2, [r4, #20]
	sub	sl, sl, r0
	add	r2, r2, r2, lsl #1
	add	r2, r2, r2, lsr #31
	add	r1, sl, #1
	asr	r2, r2, #1
	add	r1, r1, r5
	cmp	r1, r2
	movls	fp, r2
	movhi	fp, r1
	movhi	r2, r1
	tst	r3, #1024	; 0x400
	beq	lab1093
	mov	r1, r2
	mov	r0, r9
	push {r1, r2}
	mov.w r1, #5335
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5335
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5335
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5335
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_malloc_r
	push{r1, r2}
	mov.w r1, #5335
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5335
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5335
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5335
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r3, r0, #0
	beq	lab1094
	mov	r2, sl
	ldr	r1, [r4, #16]
	str	r3, [sp, #4]
	push {r1, r2}
	mov.w r1, #7905
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7905
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7905
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memcpy
	push{r1, r2}
	mov.w r1, #7905
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7905
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7905
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldrh	r2, [r4, #12]
	bic	r2, r2, #1152	; 0x480
	orr	r2, r2, #128	; 0x80
	strh	r2, [r4, #12]
	ldr	r3, [sp, #4]
lab1122: 	sub	sl, fp, sl
	str	sl, [r4, #8]
	mov	r2, r5
	mov	sl, r5
	str	r3, [r4, #16]
	str	fp, [r4, #20]
	str	r0, [r4]
lab1115: 	mov	r5, #0
	mov	r1, r8
	str	r2, [sp, #4]
	push {r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memmove
	push{r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1668
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r4, #8]
	ldr	r2, [sp, #4]
	sub	sl, r3, sl
	ldr	r3, [r4]
	add	r2, r3, r2
	str	sl, [r4, #8]
	str	r2, [r4]
lab1114: 	add	r8, r8, fp
	sub	fp, r0, fp
	cmp	fp, #0
	str	fp, [r7, #8]
	beq	lab1095
	ldrsh	r3, [r4, #12]
	cmp	r5, #0
	lsl	r3, r3, #16
	bne	lab1096
lab1089: 	ldr	r8, [r6]
	ldr	r5, [r6, #4]
	add	r6, r6, #8
	b	lab1097
lab1083: 	ldr	sl, [r6]
	ldr	r5, [r6, #4]
	add	r6, r6, #8
	b	lab1098
lab1105: 	mov	r0, r9
	push {r1, r2}
	mov.w r1, #4512
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4512
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_fflush_r
	push{r1, r2}
	mov.w r1, #4512
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4512
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab1099
lab1121: lab1125: 	orr	r3, r3, #64	; 0x40
	strh	r3, [r4, #12]
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6847
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1079: 	mov	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #1695
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1088: 	mov	r0, sl
	mov	fp, sl
	mov	r8, sl
	b	lab1100
lab1107: 	beq	lab1101
lab1110: lab1124: 	movcc	r2, r8
	ldr	r1, [r4, #16]
	ldr	r3, [r4, #20]
	ldr	r5, [r4, #8]
	ldr	r0, [r4]
	add	r5, r3, r5
	cmp	r0, r1
	movls	r1, #0
	movhi	r1, #1
	cmp	r2, r5
	movle	r1, #0
	cmp	r1, #0
	bne	lab1102
	cmp	r3, r2
	bgt	lab1103
	ldr	r5, [r4, #36]	; 0x24
	mov	r2, fp
	mov	r0, r9
	ldr	r1, [r4, #28]
	mov	lr, pc
	bx	r5
	subs	r5, r0, #0
	ble	lab1104
lab1120: 	movne	r0, #1
	beq	lab1105
lab1099: 	ldr	r3, [r7, #8]
	sub	r3, r3, r5
	cmp	r3, #0
	str	r3, [r7, #8]
	add	fp, fp, r5
	sub	r8, r8, r5
	beq	lab1106
lab1100: 	cmp	r8, #0
	bne	lab1107
	add	r3, r6, #8
lab1108: 	cmp	r8, #0
	mov	r6, r3
	ldr	fp, [r3, #-8]
	add	r3, r3, #8
	beq	lab1108
lab1101: 	mov	r2, r8
	mov	r1, #10
	mov	r0, fp
	push {r1, r2}
	mov.w r1, #14
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #14
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #14
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #14
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memchr
	push{r1, r2}
	mov.w r1, #14
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #14
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #14
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #14
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab1109
	add	r0, r0, #1
	sub	sl, r0, fp
	b	lab1110
lab1090: 	ldr	r0, [r4]
	ldr	r3, [r4, #16]
	cmp	r0, r3
	bhi	lab1111
	ldr	fp, [r4, #20]
	cmp	fp, r5
	bhi	lab1112
	cmn	r5, #-2147483647	; 0x80000001
	movcc	r0, r5
	mvncs	r0, #-2147483648	; 0x80000000
	mov	r1, fp
	bl	__divsi3
	mov	r2, r8
	mul	r3, fp, r0
	ldr	sl, [r4, #36]	; 0x24
	mov	r0, r9
	ldr	r1, [r4, #28]
	mov	lr, pc
	bx	sl
	subs	fp, r0, #0
	ble	lab1113
lab1117: 	b	lab1114
lab1091: 	mov	sl, r5
	mov	r2, r5
lab1092: 	ldr	r0, [r4]
	b	lab1115
lab1112: 	cmp	sl, r5
	movcc	fp, sl
	movcs	fp, r5
	mov	r1, r8
	mov	r2, fp
	push {r1, r2}
	mov.w r1, #6006
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6006
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6006
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6006
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #6006
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memmove
	push{r1, r2}
	mov.w r1, #6006
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6006
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6006
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6006
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #6006
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r4, #8]
	sub	r3, r3, fp
	str	r3, [r4, #8]
	cmp	r3, #0
	ldr	r3, [r4]
	add	r3, r3, fp
	str	r3, [r4]
	bne	lab1116
	mov	r1, r4
	mov	r0, r9
	push {r1, r2}
	mov.w r1, #5079
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5079
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_fflush_r
	push{r1, r2}
	mov.w r1, #5079
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5079
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab1117
	b	lab1118
lab1103: 	mov	r1, fp
	mov	r5, r2
	str	r2, [sp, #4]
	push {r1, r2}
	mov.w r1, #4643
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4643
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4643
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4643
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4643
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memmove
	push{r1, r2}
	mov.w r1, #4643
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4643
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4643
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4643
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4643
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r4, #8]
	ldr	r2, [sp, #4]
	sub	r3, r3, r2
	str	r3, [r4, #8]
	ldr	r3, [r4]
	add	r2, r3, r2
	str	r2, [r4]
	b	lab1119
lab1102: 	mov	r2, r5
	mov	r1, fp
	push {r1, r2}
	mov.w r1, #2722
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2722
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2722
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2722
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2722
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memmove
	push{r1, r2}
	mov.w r1, #2722
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2722
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2722
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2722
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2722
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r4]
	add	r3, r3, r5
	mov	r1, r4
	mov	r0, r9
	str	r3, [r4]
	push {r1, r2}
	mov.w r1, #552
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #552
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_fflush_r
	push{r1, r2}
	mov.w r1, #552
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #552
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab1120
	b	lab1121
lab1093: 	mov	r1, r0
	mov	r0, r9
	bl	_realloc_r
	push{r1, r2}
	mov.w r1, #226
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #226
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #226
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r3, r0, #0
	bne	lab1122
	mov	r0, r9
	ldr	r1, [r4, #16]
	push {r1, r2}
	mov.w r1, #1519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_free_r
	push{r1, r2}
	mov.w r1, #1519
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, #12
	ldrsh	r3, [r4, #12]
	str	r2, [r9]
	bic	r3, r3, #128	; 0x80
	b	lab1123
lab1109: 	add	r2, r8, #1
	mov	sl, r2
	b	lab1124
lab1094: 	mov	r2, #12
	ldrsh	r3, [r4, #12]
	str	r2, [r9]
	b	lab1125
lab1086: 	mvn	r0, #0
	b	lab1126
	svcvc	0x00fffc00
_fwalk_reent:
	push	{r4, r5, r6, r7, r8, r9, sl, lr}
	mov	r9, #0
	mov	r7, r0
	mov	r8, r1
	add	r6, r0, #736	; 0x2e0
lab1131: 	subs	r5, r5, #1
	ldr	r4, [r6, #8]
	bmi	lab1127
lab1130: 	cmp	r3, #1
	sub	r5, r5, #1
	bls	lab1128
	ldrsh	r3, [r4, #14]
	cmn	r3, #1
	beq	lab1129
	mov	r1, r4
	mov	r0, r7
	mov	lr, pc
	bx	r8
	orr	r9, r9, r0
lab1129: 	cmn	r5, #1
	add	r4, r4, #104	; 0x68
	bne	lab1130
lab1127: 	ldr	r6, [r6]
	cmp	r6, #0
	bne	lab1131
	mov	r0, r9
	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #1042
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
__locale_mb_cur_max:
	ldr	r3, [pc, #4]	; fe90 <__locale_mb_cur_max+0xc>
	ldrb	r0, [r3, #296]	; 0x128
	bx	lr
	andeq	r3, r2, r4, lsr #22
_localeconv_r:
	ldr	r0, [pc]	; fe9c <_localeconv_r+0x8>
	bx	lr
	andeq	r3, r2, r4, lsl ip
__retarget_lock_init_recursive:
	bx	lr
__retarget_lock_close_recursive:
	bx	lr
__retarget_lock_acquire_recursive:
	bx	lr
__retarget_lock_release_recursive:
	bx	lr
__smakebuf_r:
	push	{r4, r5, r6, r7, r8, lr}
	ldrh	r3, [r1, #12]
	tst	r3, #2
	mov	r4, r1
	sub	sp, sp, #88	; 0x58
	beq	lab1132
	mov	r2, #1
	add	r3, r1, #67	; 0x43
	str	r3, [r1]
	str	r3, [r1, #16]
	str	r2, [r1, #20]
lab1139: 	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
lab1132: 	ldrsh	r1, [r1, #14]
	cmp	r1, #0
	mov	r6, r0
	blt	lab1133
	mov	r2, sp
	bl	_fstat_r
	push{r1, r2}
	mov.w r1, #2562
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	blt	lab1134
	mov	r8, #1024	; 0x400
	mov	r7, #2048	; 0x800
	ldr	r5, [sp, #4]
	and	r5, r5, #61440	; 0xf000
	sub	r3, r5, #8192	; 0x2000
	rsbs	r5, r3, #0
	adc	r5, r5, r3
lab1137: 	mov	r0, r6
	push {r1, r2}
	mov.w r1, #5841
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5841
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5841
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5841
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_malloc_r
	push{r1, r2}
	mov.w r1, #5841
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5841
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5841
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5841
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab1135
	ldrsh	r3, [r4, #12]
	ldr	r2, [pc, #172]	; fff0 <__smakebuf_r+0x140>
	orr	r3, r3, #128	; 0x80
	cmp	r5, #0
	str	r2, [r6, #60]	; 0x3c
	str	r8, [r4, #20]
	strh	r3, [r4, #12]
	str	r0, [r4]
	str	r0, [r4, #16]
	bne	lab1136
lab1140: 	strh	r3, [r4, #12]
	add	sp, sp, #88	; 0x58
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
lab1134: 	ldrh	r3, [r4, #12]
lab1133: 	ands	r5, r3, #128	; 0x80
	moveq	r8, #1024	; 0x400
	moveq	r7, r5
	movne	r5, #0
	movne	r8, #64	; 0x40
	movne	r7, r5
	b	lab1137
lab1135: 	ldrsh	r3, [r4, #12]
	tst	r3, #512	; 0x200
	bne	lab1138
	mov	r1, #1
	bic	r3, r3, #3
	add	r2, r4, #67	; 0x43
	orr	r3, r3, #2
	strh	r3, [r4, #12]
	str	r2, [r4]
	str	r2, [r4, #16]
	str	r1, [r4, #20]
	b	lab1139
lab1136: 	mov	r0, r6
	ldrsh	r1, [r4, #14]
	bl	_isatty_r
	push{r1, r2}
	mov.w r1, #2620
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	ldrhne	r3, [r4, #12]
	bicne	r3, r3, #3
	orrne	r3, r3, #1
	lslne	r3, r3, #16
	ldrsheq	r3, [r4, #12]
	asrne	r3, r3, #16
	b	lab1140
	andeq	pc, r0, r4, ror r1	; <UNPREDICTABLE>
__ascii_mbtowc:
	cmp	r1, #0
	sub	sp, sp, #8
	addeq	r1, sp, #4
	cmp	r2, #0
	moveq	r0, r2
	beq	lab1141
	cmp	r3, #0
	beq	lab1142
	ldrb	r3, [r2]
	str	r3, [r1]
	ldrb	r2, [r2]
	subs	r0, r2, #0
	movne	r0, #1
lab1143: 	bx	lr
lab1142: 	mvn	r0, #1
	b	lab1143
memchr:
	tst	r0, #3
	and	r1, r1, #255	; 0xff
	beq	lab1144
	cmp	r2, #0
	mov	r3, r0
	sub	ip, r2, #1
	bne	lab1145
	b	lab1146
lab1148: 	bcc	lab1147
lab1145: 	mov	r0, r3
	ldrb	r2, [r3], #1
	cmp	r2, r1
	cpsid f
	push {r1, r2}
	mov.w r1, #6962
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxeq	lr
	tst	r3, #3
	mov	r0, r3
	bne	lab1148
lab1157: 	push	{r4, r5, r6, lr}
	bhi	lab1149
lab1156: 	beq	lab1150
lab1154: 	add	r3, r0, ip
	b	lab1151
lab1153: 	beq	lab1152
lab1151: 	mov	r0, r2
	ldrb	ip, [r2], #1
	cmp	ip, r1
	bne	lab1153
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #1471
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1147: 	mov	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #1842
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1149: 	mov	r2, r0
	orr	r4, r1, r1, lsl #8
	ldr	r6, [pc, #76]	; 10120 <memchr+0xe8>
	ldr	r5, [pc, #76]	; 10124 <memchr+0xec>
	orr	r4, r4, r4, lsl #16
lab1155: 	ldr	r3, [r0]
	eor	r3, r3, r4
	add	lr, r3, r6
	bic	r3, lr, r3
	tst	r3, r5
	add	r2, r2, #4
	bne	lab1154
	sub	ip, ip, #4
	cmp	ip, #3
	mov	r0, r2
	bhi	lab1155
	b	lab1156
lab1152: 	mov	r0, #0
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #1444
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1144: 	mov	ip, r2
	b	lab1157
	mrc2	14, 7, pc, cr14, cr15, {7}
	addhi	r8, r0, r0, lsl #1
memmove:
	cmp	r0, r1
	bls	lab1158
	add	r3, r1, r2
	cmp	r3, r0
	bls	lab1159
	cmp	r2, #0
	add	r2, r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #6998
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxeq	lr
lab1160: 	cmp	r1, r3
	strb	ip, [r2, #-1]!
	bne	lab1160
	cpsid f
	push {r1, r2}
	mov.w r1, #2521
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1159: 	cmp	r2, #15
	bhi	lab1161
	cmp	r2, #0
	mov	ip, r0
	sub	r2, r2, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #3475
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxeq	lr
lab1169: 	sub	ip, ip, #1
	add	r3, r1, r2
lab1162: 	cmp	r1, r3
	strb	r2, [ip, #1]!
	bne	lab1162
	cpsid f
	push {r1, r2}
	mov.w r1, #5963
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1161: 	orr	r3, r0, r1
	tst	r3, #3
	bne	lab1163
	sub	ip, r2, #16
	push	{r4, r5, r6, lr}
	bic	r3, ip, #15
	add	lr, r1, #32
	add	r4, r1, #16
	add	r5, r0, #16
	add	lr, lr, r3
	lsr	ip, ip, #4
lab1164: 	str	r3, [r5, #-16]
	ldr	r3, [r4, #-12]
	str	r3, [r5, #-12]
	ldr	r3, [r4, #-8]
	str	r3, [r5, #-8]
	add	r4, r4, #16
	ldr	r3, [r4, #-20]	; 0xffffffec
	cmp	r4, lr
	str	r3, [r5, #-4]
	add	r5, r5, #16
	bne	lab1164
	add	ip, ip, #1
	tst	r2, #12
	and	r3, r2, #15
	add	r1, r1, ip, lsl #4
	moveq	r2, r3
	add	ip, r0, ip, lsl #4
	beq	lab1165
	mov	r4, r1
	sub	r3, r3, #4
	bic	r6, r3, #3
	lsr	lr, r3, #2
	add	r6, ip, r6
	sub	r3, ip, #4
lab1166: 	str	r5, [r3, #4]!
	cmp	r3, r6
	bne	lab1166
	add	r3, lr, #1
	and	r2, r2, #3
	add	ip, ip, r3, lsl #2
	add	r1, r1, r3, lsl #2
lab1165: 	cmp	r2, #0
	sub	r2, r2, #1
	addne	r2, r2, #1
	subne	ip, ip, #1
	addne	r3, r1, r2
	beq	lab1167
lab1168: 	cmp	r1, r3
	strb	r2, [ip, #1]!
	bne	lab1168
lab1167: 	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6134
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1163: 	mov	ip, r0
	sub	r2, r2, #1
	b	lab1169
_Balloc:
	ldr	r3, [r0, #76]	; 0x4c
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r1
	beq	lab1170
lab1172: 	cmp	r0, #0
	beq	lab1171
	ldr	r2, [r0]
	str	r2, [r3, r4, lsl #2]
lab1175: 	str	r3, [r0, #16]
	str	r3, [r0, #12]
lab1173: 	cpsid f
	push {r1, r2}
	mov.w r1, #3140
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1170: 	mov	r2, #33	; 0x21
	mov	r1, #4
	push {r1, r2}
	mov.w r1, #1192
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #1192
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_calloc_r
	push{r1, r2}
	mov.w r1, #1192
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #1192
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	mov	r3, r0
	str	r0, [r5, #76]	; 0x4c
	bne	lab1172
lab1174: 	b	lab1173
lab1171: 	mov	r1, #1
	mov	r0, r5
	lsl	r5, r1, r4
	add	r2, r5, #5
	lsl	r2, r2, #2
	push {r1, r2}
	mov.w r1, #3074
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #3074
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_calloc_r
	push{r1, r2}
	mov.w r1, #3074
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #3074
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab1174
	stmib	r0, {r4, r5}
	b	lab1175
_Bfree:
	cmp	r1, #0
	ldrne	r3, [r0, #76]	; 0x4c
	ldrne	r2, [r1, #4]
	ldrne	r0, [r3, r2, lsl #2]
	strne	r0, [r1]
	strne	r1, [r3, r2, lsl #2]
	bx	lr
__multadd:
	push	{r4, r5, r6, r7, r8, lr}
	mov	lr, #0
	mov	r7, r0
	mov	r4, r3
	ldr	r8, [pc, #220]	; 1041c <__multadd+0xf4>
	mov	r6, r1
	ldr	r5, [r1, #16]
	add	r1, r1, #20
lab1176: 	and	r3, ip, r8
	mla	r3, r2, r3, r4
	lsr	r0, ip, #16
	lsr	ip, r3, #16
	mla	ip, r2, r0, ip
	add	lr, lr, #1
	and	r3, r3, r8
	add	r3, r3, ip, lsl #16
	cmp	r5, lr
	str	r3, [r1], #4
	lsr	r4, ip, #16
	bgt	lab1176
	cmp	r4, #0
	beq	lab1177
	ldr	r3, [r6, #8]
	cmp	r3, r5
	ble	lab1178
	add	r3, r6, r5, lsl #2
	add	r5, r5, #1
	str	r4, [r3, #20]
	str	r5, [r6, #16]
lab1180: 	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
lab1178: 	ldr	r1, [r6, #4]
	mov	r0, r7
	add	r1, r1, #1
	push {r1, r2}
	mov.w r1, #2483
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_Balloc
	push{r1, r2}
	mov.w r1, #2483
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r8, r0, #0
	beq	lab1179
	ldr	r2, [r6, #16]
	add	r2, r2, #2
	add	r1, r6, #12
	lsl	r2, r2, #2
	add	r0, r8, #12
	push {r1, r2}
	mov.w r1, #7978
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7978
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7978
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memcpy
	push{r1, r2}
	mov.w r1, #7978
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7978
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7978
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r7, #76]	; 0x4c
	ldr	r2, [r6, #4]
	ldr	r1, [r3, r2, lsl #2]
	str	r1, [r6]
	str	r6, [r3, r2, lsl #2]
	mov	r6, r8
	add	r3, r6, r5, lsl #2
	add	r5, r5, #1
	str	r4, [r3, #20]
	str	r5, [r6, #16]
	b	lab1180
lab1179: 	mov	r2, r8
	mov	r1, #181	; 0xb5
	ldr	r3, [pc, #8]	; 10420 <__multadd+0xf8>
	ldr	r0, [pc, #8]	; 10424 <__multadd+0xfc>
	bl	__assert_func
	strdeq	pc, [r0], -pc	; <UNPREDICTABLE>
	andeq	r2, r1, r0, lsr #31
	andeq	r3, r1, r4, asr #32
__hi0bits:
	lsr	r2, r0, #16
	lsl	r2, r2, #16
	cmp	r2, #0
	mov	r3, r0
	moveq	r0, #16
	movne	r0, #0
	lsleq	r3, r3, r0
	tst	r3, #-16777216	; 0xff000000
	lsleq	r3, r3, #8
	addeq	r0, r0, #8
	tst	r3, #-268435456	; 0xf0000000
	lsleq	r3, r3, #4
	addeq	r0, r0, #4
	tst	r3, #-1073741824	; 0xc0000000
	lsleq	r3, r3, #2
	addeq	r0, r0, #2
	cmp	r3, #0
	bxlt	lr
	tst	r3, #1073741824	; 0x40000000
	addne	r0, r0, #1
	moveq	r0, #32
	bx	lr
__lo0bits:
	ldr	r3, [r0]
	mov	r2, r0
	ands	r0, r3, #7
	beq	lab1181
	tst	r3, #1
	bne	lab1182
	tst	r3, #2
	lsrne	r3, r3, #1
	lsreq	r3, r3, #2
	movne	r0, #1
	moveq	r0, #2
	str	r3, [r2]
	bx	lr
lab1181: 	lsl	r1, r3, #16
	lsr	r1, r1, #16
	cmp	r1, #0
	moveq	r0, #16
	lsreq	r3, r3, r0
	and	r1, r3, #255	; 0xff
	cmp	r1, #0
	lsreq	r3, r3, #8
	addeq	r0, r0, #8
	tst	r3, #15
	lsreq	r3, r3, #4
	addeq	r0, r0, #4
	tst	r3, #3
	lsreq	r3, r3, #2
	addeq	r0, r0, #2
	tst	r3, #1
	bne	lab1183
	lsrs	r3, r3, #1
	add	r0, r0, #1
	beq	lab1184
lab1183: 	str	r3, [r2]
	bx	lr
lab1182: 	mov	r0, #0
	bx	lr
lab1184: 	mov	r0, #32
	bx	lr
__i2b:
	ldr	r3, [r0, #76]	; 0x4c
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	mov	r5, r1
	beq	lab1185
lab1187: 	cmp	r0, #0
	beq	lab1186
	ldr	r2, [r0]
	str	r2, [r3, #4]
lab1189: 	mov	r3, #1
	str	r5, [r0, #20]
	str	r2, [r0, #12]
	str	r3, [r0, #16]
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6702
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1185: 	mov	r2, #33	; 0x21
	mov	r1, #4
	push {r1, r2}
	mov.w r1, #2911
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2911
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_calloc_r
	push{r1, r2}
	mov.w r1, #2911
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2911
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	mov	r3, r0
	str	r0, [r4, #76]	; 0x4c
	bne	lab1187
lab1188: 	mov	r1, #320	; 0x140
	ldr	r3, [pc, #44]	; 105bc <__i2b+0xa0>
	ldr	r0, [pc, #44]	; 105c0 <__i2b+0xa4>
	bl	__assert_func
lab1186: 	mov	r2, #28
	mov	r1, #1
	mov	r0, r4
	push {r1, r2}
	mov.w r1, #2488
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2488
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_calloc_r
	push{r1, r2}
	mov.w r1, #2488
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2488
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab1188
	mov	r2, #1
	mov	r3, #2
	stmib	r0, {r2, r3}
	b	lab1189
	andeq	r2, r1, r0, lsr #31
	andeq	r3, r1, r4, asr #32
__multiply:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, [r2, #16]
	ldr	r5, [r1, #16]
	cmp	r5, r3
	movlt	r4, r2
	movge	r4, r1
	movlt	r6, r3
	movge	r6, r5
	movge	r5, r3
	movlt	r9, r1
	ldmib	r4, {r1, r3}
	add	r7, r6, r5
	movge	r9, r2
	cmp	r3, r7
	sub	sp, sp, #20
	addlt	r1, r1, #1
	push {r1, r2}
	mov.w r1, #2428
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_Balloc
	push{r1, r2}
	mov.w r1, #2428
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r3, r0, #0
	str	r3, [sp, #4]
	beq	lab1190
	ldr	r3, [sp, #4]
	add	sl, r3, #20
	add	fp, sl, r7, lsl #2
	cmp	sl, fp
	movcc	r3, sl
	movcc	r2, #0
	bcs	lab1191
lab1192: 	cmp	fp, r3
	bhi	lab1192
lab1191: 	add	r9, r9, #20
	add	r3, r9, r5, lsl #2
	mov	r2, r3
	cmp	r9, r3
	add	r3, r4, #20
	str	r3, [sp]
	add	r6, r3, r6, lsl #2
	bcs	lab1193
	sub	r3, r6, r4
	sub	r3, r3, #21
	add	r4, r4, #21
	bic	r3, r3, #3
	cmp	r6, r4
	add	r3, r3, #4
	movcc	r3, #4
	str	fp, [sp, #8]
	str	r7, [sp, #12]
	mov	fp, r2
	mov	r7, r3
	ldr	r0, [pc, #312]	; 107c8 <__multiply+0x204>
	b	lab1194
lab1197: 	bne	lab1195
lab1199: 	add	sl, sl, #4
	bls	lab1196
lab1201: 	ands	r5, ip, r0
	beq	lab1197
	mov	lr, sl
	mov	r3, #0
	ldr	r4, [sp]
lab1198: 	ldr	r1, [lr]
	and	r2, ip, r0
	and	r8, r1, r0
	mla	r8, r5, r2, r8
	lsr	ip, ip, #16
	lsr	r2, r1, #16
	mla	r2, r5, ip, r2
	add	r3, r8, r3
	add	r2, r2, r3, lsr #16
	and	r3, r3, r0
	orr	r3, r3, r2, lsl #16
	cmp	r6, r4
	str	r3, [lr], #4
	lsr	r3, r2, #16
	bhi	lab1198
	str	r3, [sl, r7]
	ldr	ip, [r9, #-4]
	lsrs	ip, ip, #16
	beq	lab1199
lab1195: 	ldr	r3, [sl]
	mov	r4, sl
	mov	r1, r3
	mov	r2, #0
	ldr	lr, [sp]
lab1200: 	lsr	r1, r1, #16
	and	r5, r5, r0
	mla	r1, ip, r5, r1
	and	r3, r3, r0
	add	r2, r1, r2
	orr	r3, r3, r2, lsl #16
	str	r3, [r4], #4
	ldr	r3, [lr], #4
	ldr	r1, [r4]
	lsr	r5, r3, #16
	and	r3, r1, r0
	mla	r3, ip, r5, r3
	cmp	r6, lr
	add	r3, r3, r2, lsr #16
	lsr	r2, r3, #16
	bhi	lab1200
	cmp	fp, r9
	str	r3, [sl, r7]
	add	sl, sl, #4
	bhi	lab1201
lab1196: 	ldr	fp, [sp, #8]
	ldr	r7, [sp, #12]
lab1193: 	cmp	r7, #0
	bgt	lab1202
	b	lab1203
lab1205: 	beq	lab1204
lab1202: 	ldr	r3, [fp, #-4]!
	cmp	r3, #0
	beq	lab1205
lab1204: 	ldr	r3, [sp, #4]
	mov	r0, r3
	str	r7, [r3, #16]
	add	sp, sp, #20
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2721
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1190: 	mov	r2, r3
	ldr	r1, [pc, #12]	; 107cc <__multiply+0x208>
	ldr	r3, [pc, #12]	; 107d0 <__multiply+0x20c>
	ldr	r0, [pc, #12]	; 107d4 <__multiply+0x210>
	bl	__assert_func
	strdeq	pc, [r0], -pc	; <UNPREDICTABLE>
	andeq	r0, r0, sp, asr r1
	andeq	r2, r1, r0, lsr #31
	andeq	r3, r1, r4, asr #32
__pow5mult:
	ands	r3, r2, #3
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r2
	mov	r7, r0
	moveq	r6, r1
	bne	lab1206
lab1215: 	beq	lab1207
	ldr	r5, [r7, #72]	; 0x48
	cmp	r5, #0
	beq	lab1208
lab1217: 	b	lab1209
lab1212: 	beq	lab1210
lab1213: 	cmp	r0, #0
	beq	lab1211
lab1214: lab1209: 	tst	r4, #1
	beq	lab1212
	mov	r2, r5
	mov	r1, r6
	mov	r0, r7
	push {r1, r2}
	mov.w r1, #5158
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__multiply
	push{r1, r2}
	mov.w r1, #5158
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r6, #0
	ldrne	r2, [r6, #4]
	ldrne	r3, [r7, #76]	; 0x4c
	ldrne	r1, [r3, r2, lsl #2]
	strne	r1, [r6]
	strne	r6, [r3, r2, lsl #2]
	asrs	r4, r4, #1
	mov	r6, r0
	bne	lab1213
lab1210: 	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6151
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1211: 	mov	r2, r5
	mov	r1, r5
	mov	r0, r7
	push {r1, r2}
	mov.w r1, #1280
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__multiply
	push{r1, r2}
	mov.w r1, #1280
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r5]
	str	r8, [r0]
	b	lab1214
lab1206: 	ldr	r2, [pc, #92]	; 108ec <__pow5mult+0x114>
	sub	r3, r3, #1
	ldr	r2, [r2, r3, lsl #2]
	mov	r3, #0
	bl	__multadd
	mov	r6, r0
	b	lab1215
lab1208: 	mov	r1, #1
	mov	r0, r7
	push {r1, r2}
	mov.w r1, #5941
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_Balloc
	push{r1, r2}
	mov.w r1, #5941
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r5, r0, #0
	beq	lab1216
	ldr	r3, [pc, #48]	; 108f0 <__pow5mult+0x118>
	mov	r2, #1
	str	r3, [r5, #20]
	mov	r3, #0
	str	r2, [r5, #16]
	str	r5, [r7, #72]	; 0x48
	str	r3, [r5]
	b	lab1217
lab1216: 	mov	r2, r5
	mov	r1, #320	; 0x140
	ldr	r3, [pc, #12]	; 108f4 <__pow5mult+0x11c>
	ldr	r0, [pc, #12]	; 108f8 <__pow5mult+0x120>
	bl	__assert_func
	; <UNDEFINED> instruction: 0x000131b8
	andeq	r0, r0, r1, ror r2
	andeq	r2, r1, r0, lsr #31
	andeq	r3, r1, r4, asr #32
__lshift:
	push	{r4, r5, r6, r7, r8, r9, sl, lr}
	mov	r4, r1
	ldr	r6, [r4, #16]
	ldr	r3, [r4, #8]
	add	r6, r6, r2, asr #5
	add	r5, r6, #1
	cmp	r5, r3
	mov	r8, r2
	mov	r7, r0
	ldr	r1, [r1, #4]
	asr	r9, r2, #5
	ble	lab1218
lab1219: 	cmp	r5, r3
	add	r1, r1, #1
	bgt	lab1219
lab1218: 	mov	r0, r7
	push {r1, r2}
	mov.w r1, #6268
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_Balloc
	push{r1, r2}
	mov.w r1, #6268
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab1220
	cmp	r9, #0
	add	lr, r0, #20
	ble	lab1221
	mov	r3, lr
	mov	r1, #0
	add	r2, r9, #5
	lsl	ip, r2, #2
	add	r2, r0, r2, lsl #2
lab1222: 	cmp	r3, r2
	bne	lab1222
	sub	r3, ip, #20
	add	lr, lr, r3
lab1221: 	ldr	r9, [r4, #16]
	add	r3, r4, #20
	ands	r8, r8, #31
	add	r9, r3, r9, lsl #2
	beq	lab1223
	mov	r2, lr
	mov	ip, #0
	rsb	sl, r8, #32
lab1224: 	orr	ip, ip, r1, lsl r8
	str	ip, [r2], #4
	ldr	ip, [r3], #4
	cmp	r9, r3
	lsr	ip, ip, sl
	bhi	lab1224
	sub	r3, r9, r4
	cmp	ip, #0
	sub	r3, r3, #21
	add	r2, r4, #21
	movne	r6, r5
	bic	r3, r3, #3
	cmp	r9, r2
	add	r3, r3, #4
	movcc	r3, #4
	str	ip, [lr, r3]
lab1226: 	ldr	r2, [r4, #4]
	ldr	r1, [r3, r2, lsl #2]
	str	r6, [r0, #16]
	str	r1, [r4]
	str	r4, [r3, r2, lsl #2]
	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2696
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1223: 	sub	r1, lr, #4
lab1225: 	cmp	r9, r3
	str	r2, [r1, #4]!
	bhi	lab1225
	b	lab1226
lab1220: 	mov	r2, r0
	ldr	r3, [pc, #8]	; 10a30 <__lshift+0x134>
	ldr	r1, [pc, #8]	; 10a34 <__lshift+0x138>
	ldr	r0, [pc, #8]	; 10a38 <__lshift+0x13c>
	bl	__assert_func
	andeq	r2, r1, r0, lsr #31
	ldrdeq	r0, [r0], -r9
	andeq	r3, r1, r4, asr #32
__mcmp:
	push	{lr}		; (str lr, [sp, #-4]!)
	ldr	r3, [r1, #16]
	mov	lr, r0
	ldr	r0, [r0, #16]
	subs	r0, r0, r3
	bne	lab1227
	add	lr, lr, #20
	add	r1, r1, #20
	add	r2, lr, r3, lsl #2
	add	r3, r1, r3, lsl #2
	b	lab1228
lab1230: 	bcs	lab1229
lab1228: 	ldr	ip, [r2, #-4]!
	ldr	r1, [r3, #-4]!
	cmp	ip, r1
	beq	lab1230
	movcs	r0, #1
	bcc	lab1231
lab1229: 	pop	{lr}		; (ldr lr, [sp], #4)
	cpsid f
	push {r1, r2}
	mov.w r1, #6065
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1231: 	mvn	r0, #0
	pop	{lr}		; (ldr lr, [sp], #4)
	cpsid f
	push {r1, r2}
	mov.w r1, #957
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
__mdiff:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, [r2, #16]
	ldr	r5, [r1, #16]
	sub	r5, r5, r3
	cmp	r5, #0
	mov	r4, r1
	mov	r9, r2
	sub	sp, sp, #12
	bne	lab1232
	add	lr, r1, #20
	add	r2, r2, #20
	add	r2, r2, r3, lsl #2
	add	r3, lr, r3, lsl #2
	b	lab1233
lab1235: 	bcs	lab1234
lab1233: 	ldr	ip, [r3, #-4]!
	ldr	r1, [r2, #-4]!
	cmp	ip, r1
	beq	lab1235
	bcc	lab1236
lab1244: 	push {r1, r2}
	mov.w r1, #4495
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_Balloc
	push{r1, r2}
	mov.w r1, #4495
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab1237
	add	fp, r0, #20
	mov	r8, fp
	mov	r3, #0
	ldr	r7, [r4, #16]
	ldr	sl, [r9, #16]
	add	r2, r4, #20
	str	r5, [r0, #12]
	add	lr, r4, #16
	ldr	r5, [pc, #344]	; 10c80 <__mdiff+0x1e4>
	add	r4, r9, #20
	str	r2, [sp, #4]
	add	sl, r4, sl, lsl #2
	add	r2, r2, r7, lsl #2
lab1238: 	ldr	ip, [r4], #4
	and	r1, r6, r5
	add	r1, r1, r3
	and	r3, ip, r5
	sub	r1, r1, r3
	lsr	r3, ip, #16
	rsb	r3, r3, r6, lsr #16
	add	r3, r3, r1, asr #16
	and	r1, r1, r5
	orr	ip, r1, r3, lsl #16
	cmp	sl, r4
	str	ip, [r8], #4
	asr	r3, r3, #16
	bhi	lab1238
	sub	r1, sl, r9
	sub	r1, r1, #21
	add	r9, r9, #21
	cmp	sl, r9
	bic	lr, r1, #3
	add	lr, lr, #4
	movcc	lr, #4
	bic	r1, r1, #3
	movcc	r1, #0
	ldr	r4, [sp, #4]
	add	r5, r4, lr
	cmp	r2, r5
	add	r1, fp, r1
	add	fp, fp, lr
	bls	lab1239
	mov	r4, fp
	mov	r1, r5
	ldr	lr, [pc, #196]	; 10c80 <__mdiff+0x1e4>
lab1240: 	and	ip, r8, lr
	add	r3, ip, r3
	asr	r6, r3, #16
	add	r6, r6, r8, lsr #16
	and	r3, r3, lr
	orr	ip, r3, r6, lsl #16
	cmp	r2, r1
	str	ip, [r4], #4
	asr	r3, r6, #16
	bhi	lab1240
	sub	r1, r2, #1
	sub	r1, r1, r5
	bic	r1, r1, #3
	add	r1, fp, r1
lab1239: 	cmp	ip, #0
	bne	lab1241
lab1242: 	cmp	r3, #0
	sub	r7, r7, #1
	beq	lab1242
lab1241: 	str	r7, [r0, #16]
lab1245: 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #7686
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1232: 	movge	r5, #0
	bge	lab1243
lab1236: 	mov	r3, r4
	mov	r5, #1
	mov	r4, r9
	mov	r9, r3
	b	lab1244
lab1234: 	mov	r1, #0
	push {r1, r2}
	mov.w r1, #2495
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_Balloc
	push{r1, r2}
	mov.w r1, #2495
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	movne	r2, #1
	movne	r3, #0
	strne	r2, [r0, #16]
	strne	r3, [r0, #20]
	bne	lab1245
	mov	r2, r0
	ldr	r3, [pc, #32]	; 10c84 <__mdiff+0x1e8>
	ldr	r1, [pc, #32]	; 10c88 <__mdiff+0x1ec>
	ldr	r0, [pc, #32]	; 10c8c <__mdiff+0x1f0>
	bl	__assert_func
lab1237: 	mov	r2, r0
	mov	r1, #576	; 0x240
	ldr	r3, [pc, #8]	; 10c84 <__mdiff+0x1e8>
	ldr	r0, [pc, #12]	; 10c8c <__mdiff+0x1f0>
	bl	__assert_func
	strdeq	pc, [r0], -pc	; <UNPREDICTABLE>
	andeq	r2, r1, r0, lsr #31
	andeq	r0, r0, r2, lsr r2
	andeq	r3, r1, r4, asr #32
__d2b:
	push	{r4, r5, r6, lr}
	mov	r1, #1
	sub	sp, sp, #8
	mov	r6, r2
	mov	r4, r3
	push {r1, r2}
	mov.w r1, #746
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_Balloc
	push{r1, r2}
	mov.w r1, #746
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r5, r0, #0
	beq	lab1246
	ldr	r1, [pc, #268]	; 10dc4 <__d2b+0x134>
	bic	r2, r4, #-16777216	; 0xff000000
	bic	r2, r2, #15728640	; 0xf00000
	ands	r4, r1, r4, lsr #20
	orrne	r2, r2, #1048576	; 0x100000
	cmp	r6, #0
	str	r2, [sp, #4]
	bne	lab1247
	add	r0, sp, #4
	bl	__lo0bits
	mov	r3, #1
	ldr	r2, [sp, #4]
	cmp	r4, #0
	mov	r1, r3
	str	r2, [r5, #20]
	str	r3, [r5, #16]
	add	r0, r0, #32
	beq	lab1248
lab1249: 	ldr	r2, [sp, #24]
	sub	r3, r3, #3
	add	r3, r3, r0
	str	r3, [r2]
	ldr	r3, [sp, #28]
	rsb	r0, r0, #53	; 0x35
	str	r0, [r3]
	mov	r0, r5
	add	sp, sp, #8
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2334
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1247: 	mov	r0, sp
	str	r6, [sp]
	bl	__lo0bits
	cmp	r0, #0
	ldrne	r3, [sp, #4]
	ldrne	r1, [sp]
	ldmeq	sp, {r2, r3}
	rsbne	r2, r0, #32
	orrne	r2, r1, r3, lsl r2
	lsrne	r3, r3, r0
	strne	r2, [r5, #20]
	strne	r3, [sp, #4]
	streq	r2, [r5, #20]
	cmp	r3, #0
	movne	r1, #2
	moveq	r1, #1
	cmp	r4, #0
	str	r3, [r5, #24]
	str	r1, [r5, #16]
	bne	lab1249
lab1248: 	add	r2, r5, r1, lsl #2
	sub	r3, r0, #1072	; 0x430
	ldr	r0, [r2, #16]
	ldr	r2, [sp, #24]
	sub	r3, r3, #2
	str	r3, [r2]
	bl	__hi0bits
	rsb	r1, r0, r1, lsl #5
	mov	r0, r5
	ldr	r3, [sp, #28]
	str	r1, [r3]
	add	sp, sp, #8
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #403
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1246: 	mov	r2, r5
	ldr	r3, [pc, #12]	; 10dc8 <__d2b+0x138>
	ldr	r1, [pc, #12]	; 10dcc <__d2b+0x13c>
	ldr	r0, [pc, #12]	; 10dd0 <__d2b+0x140>
	bl	__assert_func
	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
	andeq	r2, r1, r0, lsr #31
	andeq	r0, r0, sl, lsl #6
	andeq	r3, r1, r4, asr #32
_realloc_r:
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	subs	r4, r1, #0
	mov	r7, r2
	sub	sp, sp, #12
	beq	lab1250
	add	r5, r7, #11
	mov	r9, r0
	push {r1, r2}
	mov.w r1, #4190
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_lock
	push{r1, r2}
	mov.w r1, #4190
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r5, #22
	movls	r2, #16
	movls	r3, #0
	movls	r5, r2
	bichi	r5, r5, #7
	lsrhi	r3, r5, #31
	movhi	r2, r5
	cmp	r5, r7
	orrcc	r3, r3, #1
	cmp	r3, #0
	movne	r3, #12
	ldr	r1, [r4, #-4]
	movne	r7, #0
	strne	r3, [r9]
	sub	r8, r4, #8
	bic	r6, r1, #3
	bne	lab1251
	cmp	r6, r2
	bge	lab1252
	ldr	fp, [pc, #1308]	; 11364 <_realloc_r+0x590>
	ldr	r0, [fp, #8]
	add	r3, r8, r6
	cmp	r0, r3
	beq	lab1253
	ldr	ip, [r3, #4]
	bic	r0, ip, #1
	add	r0, r3, r0
	ldr	r0, [r0, #4]
	tst	r0, #1
	bne	lab1254
	bic	ip, ip, #3
	add	r0, r6, ip
	cmp	r0, r2
	bge	lab1255
	tst	r1, #1
	bne	lab1256
	ldr	sl, [r4, #-8]
	sub	sl, r8, sl
	ldr	r1, [sl, #4]
	bic	r1, r1, #3
	add	ip, r1, ip
	add	ip, ip, r6
	cmp	ip, r2
	bge	lab1257
lab1269: 	cmp	r3, r2
	bge	lab1258
lab1268: 	mov	r0, r9
	push {r1, r2}
	mov.w r1, #4521
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4521
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4521
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4521
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_malloc_r
	push{r1, r2}
	mov.w r1, #4521
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4521
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4521
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4521
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	subs	r7, r0, #0
	beq	lab1259
	ldr	r3, [r4, #-4]
	bic	r3, r3, #1
	add	r3, r8, r3
	sub	r2, r7, #8
	cmp	r3, r2
	beq	lab1260
	sub	r2, r6, #4
	cmp	r2, #36	; 0x24
	bhi	lab1261
	cmp	r2, #19
	movls	r3, r7
	movls	r2, r4
	bhi	lab1262
lab1276: 	str	r1, [r3]
	ldr	r1, [r2, #4]
	str	r1, [r3, #4]
	ldr	r2, [r2, #8]
	str	r2, [r3, #8]
lab1281: 	mov	r0, r9
	push {r1, r2}
	mov.w r1, #628
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_free_r
lab1259:	push{r1, r2}
	mov.w r1, #628
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	mov	r0, r9
	push {r1, r2}
	mov.w r1, #2963
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
lab1287:	push{r1, r2}
	mov.w r1, #2963
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3768
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1255: 	mov	r6, r0
	ldr	r2, [r3, #12]
	ldr	r3, [r3, #8]
	str	r2, [r3, #12]
	str	r3, [r2, #8]
lab1288: 	cmp	r3, #15
	bhi	lab1263
	ldr	r3, [r8, #4]
	and	r3, r3, #1
	orr	r3, r3, r6
	str	r3, [r8, #4]
	add	r6, r8, r6
	ldr	r3, [r6, #4]
	orr	r3, r3, #1
	str	r3, [r6, #4]
lab1264: 	mov	r0, r9
	push {r1, r2}
	mov.w r1, #4129
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #4129
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r0, r7
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #1967
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1263: 	ldr	r1, [r8, #4]
	and	r1, r1, #1
	orr	r1, r1, r5
	str	r1, [r8, #4]
	orr	r3, r3, #1
	add	r1, r8, r5
	str	r3, [r1, #4]
	add	r6, r8, r6
	ldr	r3, [r6, #4]
	orr	r3, r3, #1
	mov	r0, r9
	str	r3, [r6, #4]
	add	r1, r1, #8
	push {r1, r2}
	mov.w r1, #69
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_free_r
	push{r1, r2}
	mov.w r1, #69
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab1264
lab1254: 	tst	r1, #1
	bne	lab1265
	ldr	sl, [r4, #-8]
	sub	sl, r8, sl
	ldr	r1, [sl, #4]
	bic	r1, r1, #3
	b	lab1266
lab1250: 	mov	r1, r2
	push {r1, r2}
	mov.w r1, #7306
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7306
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7306
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7306
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_malloc_r
	push{r1, r2}
	mov.w r1, #7306
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7306
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7306
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7306
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r7, r0
	mov	r0, r7
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #5346
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1253: 	ldr	r3, [r0, #4]
	bic	r3, r3, #3
	add	ip, r6, r3
	add	r0, r5, #16
	cmp	ip, r0
	bge	lab1267
	tst	r1, #1
	bne	lab1268
	ldr	sl, [r4, #-8]
	sub	sl, r8, sl
	ldr	r1, [sl, #4]
	bic	r1, r1, #3
	add	r3, r1, r3
	add	r3, r3, r6
	cmp	r0, r3
	bgt	lab1269
	mov	r7, sl
	ldr	r1, [sl, #12]
	ldr	r0, [r7, #8]!
	sub	r2, r6, #4
	cmp	r2, #36	; 0x24
	str	r1, [r0, #12]
	str	r0, [r1, #8]
	bhi	lab1270
	cmp	r2, #19
	movls	r2, r7
	bls	lab1271
	ldr	r1, [r4]
	str	r1, [sl, #8]
	ldr	r1, [r4, #4]
	cmp	r2, #27
	str	r1, [sl, #12]
	addls	r4, r4, #8
	addls	r2, sl, #16
	bls	lab1272
	cmp	r2, #36	; 0x24
	ldr	r2, [r4, #8]
	str	r2, [sl, #16]
	ldr	r2, [r4, #12]
	str	r2, [sl, #20]
	ldreq	r2, [r4, #16]
	streq	r2, [sl, #24]
	ldreq	r1, [r4, #20]
	streq	r1, [sl, #28]
	addne	r4, r4, #16
	addne	r2, sl, #24
	addeq	r2, sl, #32
	addeq	r4, r4, #24
lab1272: 	ldr	r1, [r4]
	str	r1, [r2]
	ldr	r1, [r4, #4]
	str	r1, [r2, #4]
	ldr	r1, [r4, #8]
	str	r1, [r2, #8]
lab1289: 	add	r2, sl, r5
	orr	r3, r3, #1
	str	r2, [fp, #8]
	str	r3, [r2, #4]
	ldr	r3, [sl, #4]
	and	r3, r3, #1
	orr	r5, r3, r5
	mov	r0, r9
	str	r5, [sl, #4]
	push {r1, r2}
	mov.w r1, #6731
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #6731
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab1273
lab1260: 	ldr	r3, [r7, #-4]
	bic	r3, r3, #3
	add	r6, r6, r3
	b	lab1274
lab1262: 	ldr	r3, [r4]
	str	r3, [r7]
	ldr	r3, [r4, #4]
	cmp	r2, #27
	str	r3, [r7, #4]
	addls	r2, r4, #8
	addls	r3, r7, #8
	bls	lab1275
	ldr	r3, [r4, #8]
	str	r3, [r7, #8]
	ldr	r3, [r4, #12]
	str	r3, [r7, #12]
	cmp	r2, #36	; 0x24
	ldreq	r3, [r4, #16]
	streq	r3, [r7, #16]
	ldreq	r1, [r4, #20]
	addne	r2, r4, #16
	streq	r1, [r7, #20]
	addne	r3, r7, #16
	addeq	r2, r4, #24
	addeq	r3, r7, #24
	b	lab1276
lab1258: 	mov	r7, sl
	ldr	r1, [sl, #12]
	ldr	r0, [r7, #8]!
	sub	r2, r6, #4
	cmp	r2, #36	; 0x24
	str	r1, [r0, #12]
	str	r0, [r1, #8]
	bhi	lab1277
	cmp	r2, #19
	movls	r2, r7
	bls	lab1278
	ldr	r1, [r4]
	str	r1, [sl, #8]
	ldr	r1, [r4, #4]
	cmp	r2, #27
	str	r1, [sl, #12]
	addls	r4, r4, #8
	addls	r2, sl, #16
	bls	lab1279
	cmp	r2, #36	; 0x24
	ldr	r2, [r4, #8]
	str	r2, [sl, #16]
	ldr	r2, [r4, #12]
	str	r2, [sl, #20]
	ldreq	r2, [r4, #16]
	streq	r2, [sl, #24]
	ldreq	r1, [r4, #20]
	streq	r1, [sl, #28]
	addne	r4, r4, #16
	addne	r2, sl, #24
	addeq	r2, sl, #32
	addeq	r4, r4, #24
lab1279: 	mov	r6, r3
	ldr	r3, [r4]
	str	r3, [r2]
	ldr	r3, [r4, #4]
	str	r3, [r2, #4]
	ldr	r3, [r4, #8]
	mov	r8, sl
	mov	r4, r7
	str	r3, [r2, #8]
	b	lab1280
lab1261: 	mov	r1, r4
	push {r1, r2}
	mov.w r1, #2083
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2083
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2083
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2083
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2083
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memmove
	push{r1, r2}
	mov.w r1, #2083
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2083
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2083
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2083
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2083
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab1281
lab1257: 	mov	r7, sl
	ldr	r1, [r3, #12]
	ldr	r3, [r3, #8]
	str	r1, [r3, #12]
	str	r3, [r1, #8]
	sub	r2, r6, #4
	ldr	r3, [sl, #12]
	ldr	r1, [r7, #8]!
	cmp	r2, #36	; 0x24
	str	r3, [r1, #12]
	str	r1, [r3, #8]
	bhi	lab1282
	cmp	r2, #19
	movls	r3, r7
	bls	lab1283
	ldr	r3, [r4]
	str	r3, [sl, #8]
	ldr	r3, [r4, #4]
	cmp	r2, #27
	str	r3, [sl, #12]
	addls	r4, r4, #8
	addls	r3, sl, #16
	bls	lab1284
	ldr	r3, [r4, #8]
	str	r3, [sl, #16]
	ldr	r3, [r4, #12]
	str	r3, [sl, #20]
	cmp	r2, #36	; 0x24
	ldreq	r3, [r4, #16]
	streq	r3, [sl, #24]
	ldreq	r2, [r4, #20]
	streq	r2, [sl, #28]
	addne	r4, r4, #16
	addne	r3, sl, #24
	addeq	r3, sl, #32
	addeq	r4, r4, #24
lab1284: 	ldr	r2, [r4]
	str	r2, [r3]
	ldr	r2, [r4, #4]
	str	r2, [r3, #4]
	ldr	r2, [r4, #8]
	mov	r6, ip
	mov	r8, sl
	mov	r4, r7
	str	r2, [r3, #8]
	b	lab1285
lab1277: 	mov	r1, r4
	mov	r0, r7
	mov	r6, r3
	mov	r8, sl
	push {r1, r2}
	mov.w r1, #202
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #202
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #202
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #202
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #202
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memmove
	push{r1, r2}
	mov.w r1, #202
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #202
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #202
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #202
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #202
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r4, r7
	b	lab1286
lab1267: 	sub	r3, ip, r5
	add	r8, r8, r5
	orr	r3, r3, #1
	str	r8, [fp, #8]
	str	r3, [r8, #4]
	ldr	r3, [r4, #-4]
	and	r3, r3, #1
	orr	r5, r3, r5
	mov	r0, r9
	str	r5, [r4, #-4]
	mov	r7, r4
	push {r1, r2}
	mov.w r1, #5244
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__malloc_unlock
	push{r1, r2}
	mov.w r1, #5244
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab1287
lab1282: 	mov	r1, r4
	mov	r0, r7
	mov	r6, ip
	mov	r8, sl
	push {r1, r2}
	mov.w r1, #825
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #825
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #825
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #825
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #825
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memmove
	push{r1, r2}
	mov.w r1, #825
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #825
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #825
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #825
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #825
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r4, r7
	b	lab1288
lab1270: 	mov	r1, r4
	mov	r0, r7
	str	r3, [sp, #4]
	push {r1, r2}
	mov.w r1, #7196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memmove
	push{r1, r2}
	mov.w r1, #7196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [sp, #4]
	b	lab1289
	andeq	r3, r2, r0, lsl r7
frexp:
	mov	ip, #0
	push	{r4, r5, r6, lr}
	ldr	lr, [pc, #136]	; 11400 <frexp+0x98>
	bic	r3, r1, #-2147483648	; 0x80000000
	cmp	r3, lr
	mov	r4, r0
	mov	r5, r1
	str	ip, [r2]
	bgt	lab1290
	mov	lr, r0
	orrs	lr, r3, lr
	beq	lab1291
	ldr	lr, [pc, #100]	; 11404 <frexp+0x9c>
	and	lr, lr, r1
	cmp	lr, ip
	mov	r6, r2
	mov	r2, r1
	bne	lab1292
	mov	r2, #0
	ldr	r3, [pc, #76]	; 11408 <frexp+0xa0>
	push {r1, r2}
	mov.w r1, #5581
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #5581
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_dmul
	push{r1, r2}
	mov.w r1, #5581
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #5581
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mvn	ip, #53	; 0x35
	mov	r4, r0
	mov	r2, r1
	bic	r3, r1, #-2147483648	; 0x80000000
lab1292: 	asr	r3, r3, #20
	sub	r3, r3, #1020	; 0x3fc
	bic	r2, r2, #2130706432	; 0x7f000000
	sub	r3, r3, #2
	bic	r2, r2, #15728640	; 0xf00000
	add	r3, r3, ip
	orr	r5, r2, #1069547520	; 0x3fc00000
	str	r3, [r6]
	orr	r5, r5, #2097152	; 0x200000
lab1291: 	mov	r0, r4
	mov	r1, r5
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #7211
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	svcvc	0x00efffff
	svcvc	0x00f00000	; IMB
	cmpmi	r0, #0
raise:
	ldr	r3, [pc, #144]	; 114a4 <raise+0x98>
	cmp	r0, #31
	push	{r4, r5, r6, lr}
	ldr	r5, [r3]
	movhi	r3, #22
	mvnhi	r0, #0
	strhi	r3, [r5]
	bhi	lab1293
	ldr	r2, [r5, #732]	; 0x2dc
	cmp	r2, #0
	mov	r4, r0
	beq	lab1294
	ldr	r3, [r2, r0, lsl #2]
	cmp	r3, #0
	beq	lab1295
	cmp	r3, #1
	moveq	r0, #0
	beq	lab1296
	cmn	r3, #1
	moveq	r3, #22
	moveq	r0, #1
	streq	r3, [r5]
	beq	lab1297
	mov	r5, #0
	str	r5, [r2, r4, lsl #2]
	mov	lr, pc
	bx	r3
	mov	r0, r5
lab1297: 	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #4977
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1295: 	mov	r0, r5
	bl	_getpid_r
	push{r1, r2}
	mov.w r1, #5805
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r4
	mov	r1, r0
	mov	r0, r5
	bl	_kill_r
	push{r1, r2}
	mov.w r1, #6350
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #7276
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	andeq	r3, r2, r0, ror #5
_kill_r:
	mov	ip, #0
	push	{r4, r5, r6, lr}
	ldr	r5, [pc, #44]	; 114e4 <_kill_r+0x3c>
	mov	r4, r0
	mov	r0, r1
	mov	r1, r2
	str	ip, [r5]
	bl	_kill
	cmn	r0, #1
	bne	lab1298
	ldr	r3, [r5]
	cmp	r3, #0
	strne	r3, [r4]
lab1298: 	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6235
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	andeq	r4, r2, r0, ror #9
_getpid_r:
	push	{r4, lr}
	bl	_getpid
	pop	{r4, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6360
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
__sread:
	push	{r4, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #14]
	bl	_read_r
	push{r1, r2}
	mov.w r1, #1819
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	ldrge	r3, [r4, #80]	; 0x50
	ldrhlt	r3, [r4, #12]
	addge	r3, r3, r0
	biclt	r3, r3, #4096	; 0x1000
	strge	r3, [r4, #80]	; 0x50
	strhlt	r3, [r4, #12]
	pop	{r4, lr}
	bx	lr
__swrite:
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #12]
	tst	r1, #256	; 0x100
	mov	r5, r0
	mov	r6, r2
	mov	r7, r3
	bne	lab1299
lab1300: 	strh	r1, [r4, #12]
	mov	r3, r7
	mov	r2, r6
	mov	r0, r5
	ldrsh	r1, [r4, #14]
	bl	_write_r
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
lab1299: 	ldrsh	r1, [r4, #14]
	mov	r3, #2
	mov	r2, #0
	push {r1, r2}
	mov.w r1, #2902
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_lseek_r
	push{r1, r2}
	mov.w r1, #2902
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldrsh	r1, [r4, #12]
	b	lab1300
__sseek:
	push	{r4, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #14]
	push {r1, r2}
	mov.w r1, #2775
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_lseek_r
	push{r1, r2}
	mov.w r1, #2775
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldrh	r3, [r4, #12]
	cmn	r0, #1
	biceq	r3, r3, #4096	; 0x1000
	orrne	r3, r3, #4096	; 0x1000
	strne	r0, [r4, #80]	; 0x50
	strh	r3, [r4, #12]
	pop	{r4, lr}
	bx	lr
__sclose:
	push	{r4, lr}
	ldrsh	r1, [r1, #14]
	bl	_close_r
	push{r1, r2}
	mov.w r1, #7975
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	pop	{r4, lr}
	bx	lr
strlen:
	bic	r1, r0, #3
	ands	r0, r0, #3
	rsb	r0, r0, #0
	ldr	r3, [r1], #4
	add	ip, r0, #4
	lsl	ip, ip, #3
	mvn	r2, #0
	orrne	r3, r3, r2, lsr ip
	mov	ip, #1
	orr	ip, ip, ip, lsl #8
	orr	ip, ip, ip, lsl #16
lab1301: 	bic	r2, r2, r3
	ands	r2, r2, ip, lsl #7
	ldreq	r3, [r1], #4
	addeq	r0, r0, #4
	beq	lab1301
	tst	r3, #255	; 0xff
	addne	r0, r0, #1
	tstne	r3, #65280	; 0xff00
	addne	r0, r0, #1
	tstne	r3, #16711680	; 0xff0000
	addne	r0, r0, #1
	bx	lr
strncpy:
	orr	r3, r0, r1
	cmp	r2, #3
	and	r3, r3, #3
	movls	ip, #0
	movhi	ip, #1
	cmp	r3, #0
	movne	ip, #0
	cmp	ip, #0
	moveq	ip, r0
	push	{r4, r5, r6, lr}
	bne	lab1302
lab1310: 	b	lab1303
lab1305: 	ldrb	r1, [lr, #1]!
	cmp	r1, #0
	strb	r1, [r3], #1
	sub	r4, r2, #1
	beq	lab1304
	mov	ip, r3
	mov	r2, r4
lab1303: 	cmp	r2, #0
	bne	lab1305
lab1306: 	cpsid f
	push {r1, r2}
	mov.w r1, #5833
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1304: 	cmp	r4, #0
	addne	r2, ip, r2
	beq	lab1306
lab1307: 	cmp	r3, r2
	bne	lab1307
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2355
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1302: 	mov	r3, r1
	mov	ip, r0
	ldr	r6, [pc, #48]	; 116f0 <strncpy+0xc4>
	ldr	r5, [pc, #48]	; 116f4 <strncpy+0xc8>
lab1309: 	ldr	r4, [r3], #4
	add	lr, r4, r6
	bic	lr, lr, r4
	tst	lr, r5
	bne	lab1308
	sub	r2, r2, #4
	cmp	r2, #3
	mov	r1, r3
	str	r4, [ip], #4
	bhi	lab1309
	b	lab1310
	mrc2	14, 7, pc, cr14, cr15, {7}
	addhi	r8, r0, r0, lsl #1
__swbuf_r:
	push	{r4, r5, r6, r7, r8, lr}
	subs	r6, r0, #0
	mov	r5, r1
	mov	r4, r2
	beq	lab1311
	ldr	r3, [r6, #56]	; 0x38
	cmp	r3, #0
	beq	lab1312
lab1320: 	ldr	r3, [r4, #24]
	lsl	r2, r0, #16
	tst	r0, #8
	str	r3, [r4, #8]
	lsr	r2, r2, #16
	beq	lab1313
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	lab1314
lab1319: 	ldreq	r2, [r4, #100]	; 0x64
	biceq	r2, r2, #8192	; 0x2000
	streq	r2, [r4, #100]	; 0x64
	ldr	r2, [r4]
	ldr	r1, [r4, #20]
	orreq	r0, r0, #8192	; 0x2000
	sub	r3, r2, r3
	strheq	r0, [r4, #12]
	and	r5, r5, #255	; 0xff
	cmp	r1, r3
	mov	r7, r5
	addgt	r3, r3, #1
	ble	lab1315
lab1324: 	sub	r1, r1, #1
	str	r1, [r4, #8]
	add	r1, r2, #1
	str	r1, [r4]
	strb	r5, [r2]
	ldr	r2, [r4, #20]
	cmp	r2, r3
	beq	lab1316
	ldrh	r3, [r4, #12]
	cmp	r5, #10
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	bne	lab1317
lab1322: 	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
lab1314: 	mov	r1, r4
	mov	r0, r6
	push {r1, r2}
	mov.w r1, #7068
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7068
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__swsetup_r
	push{r1, r2}
	mov.w r1, #7068
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7068
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bne	lab1318
	ldrsh	r0, [r4, #12]
	lsl	r2, r0, #16
	ldr	r3, [r4, #16]
	lsr	r2, r2, #16
	b	lab1319
lab1312:	push {r1, r2}
	mov.w r1, #2950
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #2950
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
 	bl	__sinit
	push{r1, r2}
	mov.w r1, #2950
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #2950
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab1320
lab1317: 	mov	r1, r4
	mov	r0, r6
	push {r1, r2}
	mov.w r1, #7379
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7379
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_fflush_r
	push{r1, r2}
	mov.w r1, #7379
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7379
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	beq	lab1321
lab1323: 	b	lab1322
lab1315: 	mov	r1, r4
	mov	r0, r6
	push {r1, r2}
	mov.w r1, #7623
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #7623
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_fflush_r
	push{r1, r2}
	mov.w r1, #7623
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #7623
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	cmp	r0, #0
	bne	lab1323
	mov	r3, #1
	ldr	r2, [r4]
	b	lab1324
_wcrtomb_r:
	push	{r4, r5, r6, lr}
	subs	ip, r1, #0
	ldreq	r1, [pc, #68]	; 11880 <_wcrtomb_r+0x54>
	ldrne	ip, [pc, #64]	; 11880 <_wcrtomb_r+0x54>
	sub	sp, sp, #16
	moveq	r2, ip
	ldreq	r6, [r1, #224]	; 0xe0
	ldrne	r6, [ip, #224]	; 0xe0
	addeq	r1, sp, #4
	mov	r4, r3
	mov	r5, r0
	mov	lr, pc
	bx	r6
	cmn	r0, #1
	moveq	r2, #0
	moveq	r3, #138	; 0x8a
	streq	r2, [r4]
	streq	r3, [r5]
	add	sp, sp, #16
	pop	{r4, r5, r6, lr}
	bx	lr
	andeq	r3, r2, r4, lsr #22
__ascii_wctomb:
	cmp	r1, #0
	mov	r3, r0
	beq	lab1325
	cmp	r2, #255	; 0xff
	movhi	r2, #138	; 0x8a
	mvnhi	r0, #0
	strhi	r2, [r3]
	movls	r0, #1
	strbls	r2, [r1]
	bx	lr
lab1325: 	mov	r0, r1
	bx	lr
_write_r:
	push	{r4, r5, r6, lr}
	mov	lr, r1
	mov	r1, r2
	mov	r2, #0
	ldr	r5, [pc, #44]	; 118f8 <_write_r+0x44>
	mov	r4, r0
	str	r2, [r5]
	mov	r0, lr
	mov	r2, r3
	bl	_write
	cmn	r0, #1
	bne	lab1326
	ldr	r3, [r5]
	cmp	r3, #0
	strne	r3, [r4]
lab1326: 	pop	{r4, r5, r6, lr}
	bx	lr
	andeq	r4, r2, r0, ror #9
__register_exitproc:
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r8, [pc, #168]	; 119b0 <__register_exitproc+0xb4>
	mov	r4, r0
	ldr	r0, [r8]
	mov	r6, r3
	mov	r5, r1
	mov	r7, r2
	bl	__retarget_lock_acquire_recursive
	ldr	r3, [pc, #144]	; 119b4 <__register_exitproc+0xb8>
	ldr	r3, [r3]
	ldr	ip, [r3, #328]	; 0x148
	cmp	ip, #0
	addeq	ip, r3, #332	; 0x14c
	ldr	lr, [ip, #4]
	streq	ip, [r3, #328]	; 0x148
	cmp	lr, #31
	bgt	lab1327
	cmp	r4, #0
	bne	lab1328
lab1329: 	add	lr, lr, #2
	str	r3, [ip, #4]
	ldr	r0, [r8]
	str	r5, [ip, lr, lsl #2]
	bl	__retarget_lock_release_recursive
	mov	r0, #0
lab1330: 	cpsid f
	push {r1, r2}
	mov.w r1, #5753
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1328: 	mov	r3, #1
	add	r1, ip, lr, lsl #2
	str	r7, [r1, #136]	; 0x88
	ldr	r2, [ip, #392]	; 0x188
	lsl	r3, r3, lr
	orr	r2, r2, r3
	str	r2, [ip, #392]	; 0x188
	str	r6, [r1, #264]	; 0x108
	cmp	r4, #2
	ldreq	r2, [ip, #396]	; 0x18c
	orreq	r3, r2, r3
	streq	r3, [ip, #396]	; 0x18c
	b	lab1329
lab1327: 	ldr	r0, [r8]
	bl	__retarget_lock_release_recursive
	mvn	r0, #0
	b	lab1330
	andeq	r3, r2, r0, lsr #22
	andeq	r2, r1, r8, lsl #30
_close_r:
	mov	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r5, [pc, #40]	; 119f0 <_close_r+0x38>
	mov	r4, r0
	mov	r0, r1
	str	r2, [r5]
	bl	_close
	cmn	r0, #1
	bne	lab1331
	ldr	r3, [r5]
	cmp	r3, #0
	strne	r3, [r4]
lab1331: 	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #7122
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	andeq	r4, r2, r0, ror #9
_fclose_r:
	push	{r4, r5, r6, lr}
	subs	r4, r1, #0
	beq	lab1332
	cmp	r0, #0
	mov	r5, r0
	beq	lab1333
	ldr	r3, [r0, #56]	; 0x38
	cmp	r3, #0
	beq	lab1334
lab1333: 	ldr	r3, [r4, #100]	; 0x64
	tst	r3, #1
	beq	lab1335
lab1345: 	cmp	r3, #0
	beq	lab1336
lab1343: 	mov	r0, r5
	push {r1, r2}
	mov.w r1, #4972
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4972
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #4972
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__sflush_r
	push{r1, r2}
	mov.w r1, #4972
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4972
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #4972
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r4, #44]	; 0x2c
	cmp	r3, #0
	mov	r6, r0
	beq	lab1337
	mov	r0, r5
	ldr	r1, [r4, #28]
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	mvnlt	r6, #0
lab1337: 	ldrh	r3, [r4, #12]
	tst	r3, #128	; 0x80
	bne	lab1338
lab1347: 	cmp	r1, #0
	beq	lab1339
	add	r3, r4, #64	; 0x40
	cmp	r1, r3
	movne	r0, r5
	push {r1, r2}
	mov.w r1, #6470
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	blne	f65c <_free_r>
	push{r1, r2}
	mov.w r1, #6470
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, #0
	str	r3, [r4, #48]	; 0x30
lab1339: 	ldr	r1, [r4, #68]	; 0x44
	cmp	r1, #0
	beq	lab1340
	mov	r0, r5
	push {r1, r2}
	mov.w r1, #342
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_free_r
	push{r1, r2}
	mov.w r1, #342
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, #0
	str	r3, [r4, #68]	; 0x44
lab1340: 	bl	__sfp_lock_acquire
	push{r1, r2}
	mov.w r1, #2807
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, #0
	ldr	r2, [r4, #100]	; 0x64
	tst	r2, #1
	strh	r3, [r4, #12]
	beq	lab1341
lab1348: 	bl	__retarget_lock_close_recursive
	bl	__sfp_lock_release
	push{r1, r2}
	mov.w r1, #5471
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r0, r6
	pop	{r4, r5, r6, lr}
	bx	lr
lab1346: 	tst	r3, #512	; 0x200
	bne	lab1342
	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_acquire_recursive
	ldrsh	r3, [r4, #12]
	cmp	r3, #0
	bne	lab1343
	ldr	r6, [r4, #100]	; 0x64
	ands	r6, r6, #1
	beq	lab1344
lab1336: 	mov	r6, #0
	mov	r0, r6
	pop	{r4, r5, r6, lr}
	bx	lr
lab1334:	push {r1, r2}
	mov.w r1, #82
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	push {r1, r2}
	mov.w r1, #82
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
 	bl	__sinit
	push{r1, r2}
	mov.w r1, #82
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push{r1, r2}
	mov.w r1, #82
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r4, #100]	; 0x64
	tst	r3, #1
	bne	lab1345
	b	lab1346
lab1344: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	mov	r0, r6
	pop	{r4, r5, r6, lr}
	bx	lr
lab1338: 	mov	r0, r5
	ldr	r1, [r4, #16]
	push {r1, r2}
	mov.w r1, #4649
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	_free_r
	push{r1, r2}
	mov.w r1, #4649
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b	lab1347
lab1341: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	b	lab1348
_fstat_r:
	mov	ip, #0
	push	{r4, r5, r6, lr}
	ldr	r5, [pc, #44]	; 11b9c <_fstat_r+0x3c>
	mov	r4, r0
	mov	r0, r1
	mov	r1, r2
	str	ip, [r5]
	bl	_fstat
	cmn	r0, #1
	bne	lab1349
	ldr	r3, [r5]
	cmp	r3, #0
	strne	r3, [r4]
lab1349: 	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6102
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	andeq	r4, r2, r0, ror #9
_isatty_r:
	mov	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r5, [pc, #40]	; 11bd8 <_isatty_r+0x38>
	mov	r4, r0
	mov	r0, r1
	str	r2, [r5]
	bl	_isatty
	cmn	r0, #1
	bne	lab1350
	ldr	r3, [r5]
	cmp	r3, #0
	strne	r3, [r4]
lab1350: 	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3993
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	andeq	r4, r2, r0, ror #9
_lseek_r:
	push	{r4, r5, r6, lr}
	mov	lr, r1
	mov	r1, r2
	mov	r2, #0
	ldr	r5, [pc, #44]	; 11c20 <_lseek_r+0x44>
	mov	r4, r0
	str	r2, [r5]
	mov	r0, lr
	mov	r2, r3
	bl	_lseek
	cmn	r0, #1
	bne	lab1351
	ldr	r3, [r5]
	cmp	r3, #0
	strne	r3, [r4]
lab1351: 	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3779
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	andeq	r4, r2, r0, ror #9
_read_r:
	push	{r4, r5, r6, lr}
	mov	lr, r1
	mov	r1, r2
	mov	r2, #0
	ldr	r5, [pc, #44]	; 11c68 <_read_r+0x44>
	mov	r4, r0
	str	r2, [r5]
	mov	r0, lr
	mov	r2, r3
	bl	_read
	cmn	r0, #1
	bne	lab1352
	ldr	r3, [r5]
	cmp	r3, #0
	strne	r3, [r4]
lab1352: 	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #1587
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
	andeq	r4, r2, r0, ror #9
__udivsi3:
	subs	r2, r1, #1
	bxeq	lr
	bcc	lab1353
	cmp	r0, r1
	bls	lab1354
	tst	r1, r2
	beq	lab1355
	tst	r1, #-536870912	; 0xe0000000
	lsleq	r1, r1, #3
	moveq	r3, #8
	movne	r3, #1
lab1356: 	cmpcc	r1, r0
	lslcc	r1, r1, #4
	lslcc	r3, r3, #4
	bcc	lab1356
lab1357: 	cmpcc	r1, r0
	lslcc	r1, r1, #1
	lslcc	r3, r3, #1
	bcc	lab1357
	mov	r2, #0
lab1358: 	subcs	r0, r0, r1
	orrcs	r2, r2, r3
	cmp	r0, r1, lsr #1
	subcs	r0, r0, r1, lsr #1
	orrcs	r2, r2, r3, lsr #1
	cmp	r0, r1, lsr #2
	subcs	r0, r0, r1, lsr #2
	orrcs	r2, r2, r3, lsr #2
	cmp	r0, r1, lsr #3
	subcs	r0, r0, r1, lsr #3
	orrcs	r2, r2, r3, lsr #3
	cmp	r0, #0
	lsrsne	r3, r3, #4
	lsrne	r1, r1, #4
	bne	lab1358
	mov	r0, r2
	bx	lr
lab1354: 	moveq	r0, #1
	movne	r0, #0
	bx	lr
lab1355: 	cmp	r1, #65536	; 0x10000
	lsrcs	r1, r1, #16
	movcs	r2, #16
	movcc	r2, #0
	cmp	r1, #256	; 0x100
	lsrcs	r1, r1, #8
	addcs	r2, r2, #8
	cmp	r1, #16
	lsrcs	r1, r1, #4
	addcs	r2, r2, #4
	cmp	r1, #4
	addhi	r2, r2, #3
	addls	r2, r2, r1, lsr #1
	lsr	r0, r0, r2
	bx	lr
lab1359: 	mvnne	r0, #0
	b	__aeabi_idiv0
__aeabi_uidivmod:
	cmp	r1, #0
	beq	lab1359
	push	{r0, r1, lr}
	bl	__udivsi3
	pop	{r1, r2, lr}
	mul	r3, r2, r0
	sub	r1, r1, r3
	bx	lr
__divsi3:
	cmp	r1, #0
	beq	lab1360
.divsi3_skip_div0_test:
	eor	ip, r0, r1
	rsbmi	r1, r1, #0
	subs	r2, r1, #1
	beq	lab1361
	movs	r3, r0
	rsbmi	r3, r0, #0
	cmp	r3, r1
	bls	lab1362
	tst	r1, r2
	beq	lab1363
	tst	r1, #-536870912	; 0xe0000000
	lsleq	r1, r1, #3
	moveq	r2, #8
	movne	r2, #1
lab1364: 	cmpcc	r1, r3
	lslcc	r1, r1, #4
	lslcc	r2, r2, #4
	bcc	lab1364
lab1365: 	cmpcc	r1, r3
	lslcc	r1, r1, #1
	lslcc	r2, r2, #1
	bcc	lab1365
	mov	r0, #0
lab1366: 	subcs	r3, r3, r1
	orrcs	r0, r0, r2
	cmp	r3, r1, lsr #1
	subcs	r3, r3, r1, lsr #1
	orrcs	r0, r0, r2, lsr #1
	cmp	r3, r1, lsr #2
	subcs	r3, r3, r1, lsr #2
	orrcs	r0, r0, r2, lsr #2
	cmp	r3, r1, lsr #3
	subcs	r3, r3, r1, lsr #3
	orrcs	r0, r0, r2, lsr #3
	cmp	r3, #0
	lsrsne	r2, r2, #4
	lsrne	r1, r1, #4
	bne	lab1366
	cmp	ip, #0
	rsbmi	r0, r0, #0
	bx	lr
lab1361: 	teq	ip, r0
	rsbmi	r0, r0, #0
	bx	lr
lab1362: 	movcc	r0, #0
	asreq	r0, ip, #31
	orreq	r0, r0, #1
	bx	lr
lab1363: 	cmp	r1, #65536	; 0x10000
	lsrcs	r1, r1, #16
	movcs	r2, #16
	movcc	r2, #0
	cmp	r1, #256	; 0x100
	lsrcs	r1, r1, #8
	addcs	r2, r2, #8
	cmp	r1, #16
	lsrcs	r1, r1, #4
	addcs	r2, r2, #4
	cmp	r1, #4
	addhi	r2, r2, #3
	addls	r2, r2, r1, lsr #1
	cmp	ip, #0
	lsr	r0, r3, r2
	rsbmi	r0, r0, #0
	bx	lr
lab1367: 	mvngt	r0, #-2147483648	; 0x80000000
	movlt	r0, #-2147483648	; 0x80000000
	b	__aeabi_idiv0
__aeabi_idivmod:
	cmp	r1, #0
	beq	lab1367
	push	{r0, r1, lr}
	bl	.divsi3_skip_div0_test
	pop	{r1, r2, lr}
	mul	r3, r2, r0
	sub	r1, r1, r3
	bx	lr
__aeabi_idiv0:
	bx	lr
__aeabi_drsub:
	eor	r1, r1, #-2147483648	; 0x80000000
	b	__adddf3
__aeabi_dsub:
	eor	r3, r3, #-2147483648	; 0x80000000
__adddf3:
	push	{r4, r5, lr}
	lsl	r4, r1, #1
	lsl	r5, r3, #1
	teq	r4, r5
	teqeq	r0, r2
	orrsne	ip, r4, r0
	orrsne	ip, r5, r2
	mvnsne	ip, r4, asr #21
	mvnsne	ip, r5, asr #21
	beq	lab1368
	lsr	r4, r4, #21
	rsbs	r5, r4, r5, lsr #21
	rsblt	r5, r5, #0
	ble	lab1369
	add	r4, r4, r5
	eor	r2, r0, r2
	eor	r3, r1, r3
	eor	r0, r2, r0
	eor	r1, r3, r1
	eor	r2, r0, r2
	eor	r3, r1, r3
lab1369: 	cmp	r5, #54	; 0x36
	pophi	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #7071
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxhi	lr
	tst	r1, #-2147483648	; 0x80000000
	lsl	r1, r1, #12
	mov	ip, #1048576	; 0x100000
	orr	r1, ip, r1, lsr #12
	beq	lab1370
	rsbs	r0, r0, #0
	rsc	r1, r1, #0
lab1370: 	tst	r3, #-2147483648	; 0x80000000
	lsl	r3, r3, #12
	orr	r3, ip, r3, lsr #12
	beq	lab1371
	rsbs	r2, r2, #0
	rsc	r3, r3, #0
lab1371: 	teq	r4, r5
	beq	lab1372
lab1385: 	rsbs	lr, r5, #32
	blt	lab1373
	lsl	ip, r2, lr
	adds	r0, r0, r2, lsr r5
	adc	r1, r1, #0
	adds	r0, r0, r3, lsl lr
	adcs	r1, r1, r3, asr r5
	b	lab1374
lab1373: 	sub	r5, r5, #32
	add	lr, lr, #32
	cmp	r2, #1
	lsl	ip, r3, lr
	orrcs	ip, ip, #2
	adds	r0, r0, r3, asr r5
	adcs	r1, r1, r3, asr #31
lab1374: 	and	r5, r1, #-2147483648	; 0x80000000
	bpl	lab1375
	rsbs	ip, ip, #0
	rscs	r0, r0, #0
	rsc	r1, r1, #0
lab1395: 	bcc	lab1376
	cmp	r1, #2097152	; 0x200000
	bcc	lab1377
	lsrs	r1, r1, #1
	rrxs	r0, r0
	rrx	ip, ip
	add	r4, r4, #1
	lsl	r2, r4, #21
	cmn	r2, #4194304	; 0x400000
	bcs	lab1378
lab1379: 	lsrseq	ip, r0, #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	orr	r1, r1, r5
	pop	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1376: 	lsls	ip, ip, #1
	adcs	r0, r0, r0
	adc	r1, r1, r1
	subs	r4, r4, #1
	cmpcs	r1, #1048576	; 0x100000
	bcs	lab1379
lab1391: 	movne	r3, #20
	moveq	r3, #52	; 0x34
	moveq	r1, r0
	moveq	r0, #0
	mov	r2, r1
	cmp	r2, #65536	; 0x10000
	lsrcs	r2, r2, #16
	subcs	r3, r3, #16
	cmp	r2, #256	; 0x100
	lsrcs	r2, r2, #8
	subcs	r3, r3, #8
	cmp	r2, #16
	lsrcs	r2, r2, #4
	subcs	r3, r3, #4
	cmp	r2, #4
	subcs	r3, r3, #2
	subcc	r3, r3, r2, lsr #1
	sub	r3, r3, r2, lsr #3
	subs	r2, r3, #32
	bge	lab1380
	adds	r2, r2, #12
	ble	lab1381
	add	ip, r2, #20
	rsb	r2, r2, #12
	lsl	r0, r1, ip
	lsr	r1, r1, r2
	b	lab1382
lab1381: 	add	r2, r2, #20
lab1380: 	rsble	ip, r2, #32
	lsl	r1, r1, r2
	orrle	r1, r1, r0, lsr ip
	lslle	r0, r0, r2
lab1382: 	subs	r4, r4, r3
	addge	r1, r1, r4, lsl #20
	orrge	r1, r1, r5
	popge	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #423
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxge	lr
	mvn	r4, r4
	subs	r4, r4, #31
	bge	lab1383
	adds	r4, r4, #12
	bgt	lab1384
	add	r4, r4, #20
	rsb	r2, r4, #32
	lsr	r0, r0, r4
	orr	r0, r0, r1, lsl r2
	orr	r1, r5, r1, lsr r4
	pop	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6586
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1384: 	rsb	r4, r4, #12
	rsb	r2, r4, #32
	lsr	r0, r0, r2
	orr	r0, r0, r1, lsl r4
	mov	r1, r5
	pop	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #6833
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1383: 	lsr	r0, r1, r4
	mov	r1, r5
	pop	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2080
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1372: 	teq	r4, #0
	eor	r3, r3, #1048576	; 0x100000
	eoreq	r1, r1, #1048576	; 0x100000
	addeq	r4, r4, #1
	subne	r5, r5, #1
	b	lab1385
lab1368: 	mvns	ip, r4, asr #21
	mvnsne	ip, r5, asr #21
	beq	lab1386
	teq	r4, r5
	teqeq	r0, r2
	beq	lab1387
	orrs	ip, r4, r0
	moveq	r1, r3
	moveq	r0, r2
	pop	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #4786
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1387: 	teq	r1, r3
	movne	r1, #0
	movne	r0, #0
	popne	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #562
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxne	lr
	lsrs	ip, r4, #21
	bne	lab1388
	lsls	r0, r0, #1
	adcs	r1, r1, r1
	orrcs	r1, r1, #-2147483648	; 0x80000000
	pop	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #1966
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1388: 	adds	r4, r4, #4194304	; 0x400000
	addcc	r1, r1, #1048576	; 0x100000
	popcc	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #4196
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxcc	lr
	and	r5, r1, #-2147483648	; 0x80000000
lab1378: 	orr	r1, r5, #2130706432	; 0x7f000000
	orr	r1, r1, #15728640	; 0xf00000
	mov	r0, #0
	pop	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #4247
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1386: 	mvns	ip, r4, asr #21
	movne	r1, r3
	movne	r0, r2
	mvnseq	ip, r5, asr #21
	movne	r3, r1
	movne	r2, r0
	orrs	r4, r0, r1, lsl #12
	orrseq	r5, r2, r3, lsl #12
	teqeq	r1, r3
	orrne	r1, r1, #524288	; 0x80000
	pop	{r4, r5, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2193
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
__aeabi_ui2d:
	teq	r0, #0
	moveq	r1, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #2848
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, #1024	; 0x400
	add	r4, r4, #50	; 0x32
	mov	r5, #0
	mov	r1, #0
	b	lab1389
__aeabi_i2d:
	teq	r0, #0
	moveq	r1, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #4847
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, #1024	; 0x400
	add	r4, r4, #50	; 0x32
	ands	r5, r0, #-2147483648	; 0x80000000
	rsbmi	r0, r0, #0
	mov	r1, #0
	b	lab1390
__aeabi_f2d:
	lsls	r2, r0, #1
	asr	r1, r2, #3
	rrx	r1, r1
	lsl	r0, r2, #28
	andsne	r3, r2, #-16777216	; 0xff000000
	teqne	r3, #-16777216	; 0xff000000
	eorne	r1, r1, #939524096	; 0x38000000
	bxne	lr
	bics	r2, r2, #-16777216	; 0xff000000
	bxeq	lr
	teq	r3, #-16777216	; 0xff000000
	orreq	r1, r1, #524288	; 0x80000
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, #896	; 0x380
	and	r5, r1, #-2147483648	; 0x80000000
	bic	r1, r1, #-2147483648	; 0x80000000
	b	lab1391
__aeabi_ul2d:
	orrs	r2, r0, r1
	bxeq	lr
	push	{r4, r5, lr}
	mov	r5, #0
	b	lab1392
__aeabi_l2d:
	orrs	r2, r0, r1
	bxeq	lr
	push	{r4, r5, lr}
	ands	r5, r1, #-2147483648	; 0x80000000
	bpl	lab1393
	rsbs	r0, r0, #0
	rsc	r1, r1, #0
lab1393: 	mov	r4, #1024	; 0x400
	add	r4, r4, #50	; 0x32
	lsrs	ip, r1, #22
	beq	lab1394
	mov	r2, #3
	lsrs	ip, ip, #3
	addne	r2, r2, #3
	lsrs	ip, ip, #3
	addne	r2, r2, #3
	add	r2, r2, ip, lsr #3
	rsb	r3, r2, #32
	lsl	ip, r0, r3
	lsr	r0, r0, r2
	orr	r0, r0, r1, lsl r3
	lsr	r1, r1, r2
	add	r4, r4, r2
	b	lab1395
__aeabi_dmul:
	push	{r4, r5, r6, lr}
	mov	ip, #255	; 0xff
	orr	ip, ip, #1792	; 0x700
	ands	r4, ip, r1, lsr #20
	andsne	r5, ip, r3, lsr #20
	teqne	r4, ip
	teqne	r5, ip
	bleq	124e8 <__aeabi_dmul+0x1f8>
	add	r4, r4, r5
	eor	r6, r1, r3
	bic	r1, r1, ip, lsl #21
	bic	r3, r3, ip, lsl #21
	orrs	r5, r0, r1, lsl #12
	orrsne	r5, r2, r3, lsl #12
	orr	r1, r1, #1048576	; 0x100000
	orr	r3, r3, #1048576	; 0x100000
	beq	lab1396
	umull	ip, lr, r0, r2
	mov	r5, #0
	umlal	lr, r5, r1, r2
	and	r2, r6, #-2147483648	; 0x80000000
	umlal	lr, r5, r0, r3
	mov	r6, #0
	umlal	r5, r6, r1, r3
	teq	ip, #0
	orrne	lr, lr, #1
	sub	r4, r4, #255	; 0xff
	cmp	r6, #512	; 0x200
	sbc	r4, r4, #768	; 0x300
	bcs	lab1397
	lsls	lr, lr, #1
	adcs	r5, r5, r5
	adc	r6, r6, r6
lab1397: 	orr	r1, r2, r6, lsl #11
	orr	r1, r1, r5, lsr #21
	lsl	r0, r5, #11
	orr	r0, r0, lr, lsr #21
	lsl	lr, lr, #11
	subs	ip, r4, #253	; 0xfd
	cmphi	ip, #1792	; 0x700
	bhi	lab1398
	cmp	lr, #-2147483648	; 0x80000000
	lsrseq	lr, r0, #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #3661
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1396: 	and	r6, r6, #-2147483648	; 0x80000000
	orr	r1, r6, r1
	orr	r0, r0, r2
	eor	r1, r1, r3
	subs	r4, r4, ip, lsr #1
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	popgt	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #2891
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxgt	lr
	orr	r1, r1, #1048576	; 0x100000
	mov	lr, #0
	subs	r4, r4, #1
lab1420: 	cmn	r4, #54	; 0x36
	movle	r0, #0
	andle	r1, r1, #-2147483648	; 0x80000000
	pople	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #5880
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxle	lr
	rsb	r4, r4, #0
	subs	r4, r4, #32
	bge	lab1400
	adds	r4, r4, #12
	bgt	lab1401
	add	r4, r4, #20
	rsb	r5, r4, #32
	lsl	r3, r0, r5
	lsr	r0, r0, r4
	orr	r0, r0, r1, lsl r5
	and	r2, r1, #-2147483648	; 0x80000000
	bic	r1, r1, #-2147483648	; 0x80000000
	adds	r0, r0, r3, lsr #31
	adc	r1, r2, r1, lsr r4
	orrs	lr, lr, r3, lsl #1
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #5153
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1401: 	rsb	r4, r4, #12
	rsb	r5, r4, #32
	lsl	r3, r0, r4
	lsr	r0, r0, r5
	orr	r0, r0, r1, lsl r4
	and	r1, r1, #-2147483648	; 0x80000000
	adds	r0, r0, r3, lsr #31
	adc	r1, r1, #0
	orrs	lr, lr, r3, lsl #1
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #362
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1400: 	rsb	r5, r4, #32
	orr	lr, lr, r0, lsl r5
	lsr	r3, r0, r4
	orr	r3, r3, r1, lsl r5
	lsr	r0, r1, r4
	and	r1, r1, #-2147483648	; 0x80000000
	bic	r0, r0, r1, lsr r4
	add	r0, r0, r3, lsr #31
	orrs	lr, lr, r3, lsl #1
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #1468
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1429: 	bne	lab1402
	and	r6, r1, #-2147483648	; 0x80000000
lab1403: 	adc	r1, r1, r1
	tst	r1, #1048576	; 0x100000
	subeq	r4, r4, #1
	beq	lab1403
	orr	r1, r1, r6
	teq	r5, #0
	bxne	lr
lab1402: 	and	r6, r3, #-2147483648	; 0x80000000
lab1404: 	adc	r3, r3, r3
	tst	r3, #1048576	; 0x100000
	subeq	r5, r5, #1
	beq	lab1404
	orr	r3, r3, r6
	bx	lr
	teq	r4, ip
	and	r5, ip, r3, lsr #20
	teqne	r5, ip
	beq	lab1405
	orrs	r6, r0, r1, lsl #1
	orrsne	r6, r2, r3, lsl #1
	bne	lab1406
lab1431: 	and	r1, r1, #-2147483648	; 0x80000000
	mov	r0, #0
	pop	{r4, r5, r6, lr}
	bx	lr
lab1405: 	orrs	r6, r0, r1, lsl #1
	moveq	r0, r2
	moveq	r1, r3
	orrsne	r6, r2, r3, lsl #1
	beq	lab1407
	teq	r4, ip
	bne	lab1408
	orrs	r6, r0, r1, lsl #12
	bne	lab1409
lab1408: 	teq	r5, ip
	bne	lab1410
	orrs	r6, r2, r3, lsl #12
	movne	r0, r2
	movne	r1, r3
	bne	lab1411
lab1430: lab1399: 	and	r1, r1, #-2147483648	; 0x80000000
	orr	r1, r1, #2130706432	; 0x7f000000
	orr	r1, r1, #15728640	; 0xf00000
	mov	r0, #0
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #635
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1432: 	orr	r1, r1, #16252928	; 0xf80000
	pop	{r4, r5, r6, lr}
	bx	lr
__aeabi_ddiv:
	push	{r4, r5, r6, lr}
	mov	ip, #255	; 0xff
	orr	ip, ip, #1792	; 0x700
	ands	r4, ip, r1, lsr #20
	andsne	r5, ip, r3, lsr #20
	teqne	r4, ip
	teqne	r5, ip
	bleq	1271c <__aeabi_ddiv+0x19c>
	sub	r4, r4, r5
	eor	lr, r1, r3
	orrs	r5, r2, r3, lsl #12
	lsl	r1, r1, #12
	beq	lab1412
	lsl	r3, r3, #12
	mov	r5, #268435456	; 0x10000000
	orr	r3, r5, r3, lsr #4
	orr	r3, r3, r2, lsr #24
	lsl	r2, r2, #8
	orr	r5, r5, r1, lsr #4
	orr	r5, r5, r0, lsr #24
	lsl	r6, r0, #8
	and	r1, lr, #-2147483648	; 0x80000000
	cmp	r5, r3
	cmpeq	r6, r2
	adc	r4, r4, #253	; 0xfd
	add	r4, r4, #768	; 0x300
	bcs	lab1413
	lsrs	r3, r3, #1
	rrx	r2, r2
lab1413: 	subs	r6, r6, r2
	sbc	r5, r5, r3
	lsrs	r3, r3, #1
	rrx	r2, r2
	mov	r0, #1048576	; 0x100000
	mov	ip, #524288	; 0x80000
lab1417: 	sbcs	lr, r5, r3
	subcs	r6, r6, r2
	movcs	r5, lr
	orrcs	r0, r0, ip
	lsrs	r3, r3, #1
	rrx	r2, r2
	subs	lr, r6, r2
	sbcs	lr, r5, r3
	subcs	r6, r6, r2
	movcs	r5, lr
	orrcs	r0, r0, ip, lsr #1
	lsrs	r3, r3, #1
	rrx	r2, r2
	subs	lr, r6, r2
	sbcs	lr, r5, r3
	subcs	r6, r6, r2
	movcs	r5, lr
	orrcs	r0, r0, ip, lsr #2
	lsrs	r3, r3, #1
	rrx	r2, r2
	subs	lr, r6, r2
	sbcs	lr, r5, r3
	subcs	r6, r6, r2
	movcs	r5, lr
	orrcs	r0, r0, ip, lsr #3
	orrs	lr, r5, r6
	beq	lab1414
	lsl	r5, r5, #4
	orr	r5, r5, r6, lsr #28
	lsl	r6, r6, #4
	lsl	r3, r3, #3
	orr	r3, r3, r2, lsr #29
	lsl	r2, r2, #3
	lsrs	ip, ip, #4
	bne	lab1415
	tst	r1, #1048576	; 0x100000
	bne	lab1416
	orr	r1, r1, r0
	mov	r0, #0
	mov	ip, #-2147483648	; 0x80000000
	b	lab1417
lab1414: 	tst	r1, #1048576	; 0x100000
	orreq	r1, r1, r0
	moveq	r0, #0
lab1416: 	subs	ip, r4, #253	; 0xfd
	cmphi	ip, #1792	; 0x700
	bhi	lab1418
	subs	ip, r5, r3
	subseq	ip, r6, r2
	lsrseq	ip, r0, #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	pop	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #5551
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab1412: 	and	lr, lr, #-2147483648	; 0x80000000
	orr	r1, lr, r1, lsr #12
	adds	r4, r4, ip, lsr #1
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	popgt	{r4, r5, r6, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #8014
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bxgt	lr
	orr	r1, r1, #1048576	; 0x100000
	mov	lr, #0
	subs	r4, r4, #1
	b	lab1419
	orr	lr, r5, r6
	b	lab1420
	and	r5, ip, r3, lsr #20
	teq	r4, ip
	teqeq	r5, ip
	beq	lab1421
	teq	r4, ip
	bne	lab1422
	orrs	r4, r0, r1, lsl #12
	bne	lab1423
	teq	r5, ip
	bne	lab1424
	mov	r0, r2
	mov	r1, r3
	b	lab1425
lab1422: 	teq	r5, ip
	bne	lab1426
	orrs	r5, r2, r3, lsl #12
	beq	lab1427
	mov	r0, r2
	mov	r1, r3
	b	lab1428
lab1426: 	orrs	r6, r0, r1, lsl #1
	orrsne	r6, r2, r3, lsl #1
	bne	lab1429
	orrs	r4, r0, r1, lsl #1
	bne	lab1430
	orrs	r5, r2, r3, lsl #1
	bne	lab1431
	b	lab1432
__gedf2:
	mvn	ip, #0
	b	lab1433
__ledf2:
	mov	ip, #1
	b	lab1434
__cmpdf2:
	mov	ip, #1
lab1434: 	push	{ip}		; (str ip, [sp, #-4]!)
	lsl	ip, r1, #1
	mvns	ip, ip, asr #21
	lsl	ip, r3, #1
	mvnsne	ip, ip, asr #21
	beq	lab1435
lab1439: 	orrs	ip, r0, r1, lsl #1
	orrseq	ip, r2, r3, lsl #1
	teqne	r1, r3
	teqeq	r0, r2
	moveq	r0, #0
	bxeq	lr
	cmn	r0, #0
	teq	r1, r3
	cmppl	r1, r3
	cmpeq	r0, r2
	asrcs	r0, r3, #31
	mvncc	r0, r3, asr #31
	orr	r0, r0, #1
	bx	lr
lab1435: 	lsl	ip, r1, #1
	mvns	ip, ip, asr #21
	bne	lab1436
	orrs	ip, r0, r1, lsl #12
	bne	lab1437
lab1436: 	lsl	ip, r3, #1
	mvns	ip, ip, asr #21
	bne	lab1438
	orrs	ip, r2, r3, lsl #12
	beq	lab1439
lab1437: 	pop	{r0}		; (ldr r0, [sp], #4)
	bx	lr
__aeabi_cdrcmple:
	mov	ip, r0
	mov	r0, r2
	mov	r2, ip
	mov	ip, r1
	mov	r1, r3
	mov	r3, ip
	b	__aeabi_cdcmpeq
__aeabi_cdcmpeq:
	push	{r0, lr}
	bl	__cmpdf2
	cmp	r0, #0
	cmnmi	r0, #0
	pop	{r0, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #264
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
__aeabi_dcmpeq:
	str	lr, [sp, #-8]!
	push {r1, r2}
	mov.w r1, #2853
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_cdcmpeq
	push{r1, r2}
	mov.w r1, #2853
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	moveq	r0, #1
	movne	r0, #0
	ldr	lr, [sp], #8
	cpsid f
	push {r1, r2}
	mov.w r1, #6053
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
__aeabi_dcmplt:
	str	lr, [sp, #-8]!
	push {r1, r2}
	mov.w r1, #3650
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_cdcmpeq
	push{r1, r2}
	mov.w r1, #3650
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movcc	r0, #1
	movcs	r0, #0
	ldr	lr, [sp], #8
	cpsid f
	push {r1, r2}
	mov.w r1, #7178
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
__aeabi_dcmple:
	str	lr, [sp, #-8]!
	push {r1, r2}
	mov.w r1, #7775
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_cdcmpeq
	push{r1, r2}
	mov.w r1, #7775
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movls	r0, #1
	movhi	r0, #0
	ldr	lr, [sp], #8
	cpsid f
	push {r1, r2}
	mov.w r1, #2543
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
__aeabi_dcmpge:
	str	lr, [sp, #-8]!
	push {r1, r2}
	mov.w r1, #4026
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_cdrcmple
	push{r1, r2}
	mov.w r1, #4026
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movls	r0, #1
	movhi	r0, #0
	ldr	lr, [sp], #8
	bx	lr
__aeabi_dcmpgt:
	str	lr, [sp, #-8]!
	push {r1, r2}
	mov.w r1, #271
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	__aeabi_cdrcmple
	push{r1, r2}
	mov.w r1, #271
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movcc	r0, #1
	movcs	r0, #0
	ldr	lr, [sp], #8
	bx	lr
__aeabi_dcmpun:
	lsl	ip, r1, #1
	mvns	ip, ip, asr #21
	bne	lab1440
	orrs	ip, r0, r1, lsl #12
	bne	lab1441
lab1440: 	lsl	ip, r3, #1
	mvns	ip, ip, asr #21
	bne	lab1442
	orrs	ip, r2, r3, lsl #12
	bne	lab1443
lab1442: 	mov	r0, #0
	bx	lr
lab1443: 	mov	r0, #1
	bx	lr
__aeabi_d2iz:
	lsl	r2, r1, #1
	adds	r2, r2, #2097152	; 0x200000
	bcs	lab1444
	bpl	lab1445
	mvn	r3, #992	; 0x3e0
	subs	r2, r3, r2, asr #21
	bls	lab1446
	lsl	r3, r1, #11
	orr	r3, r3, #-2147483648	; 0x80000000
	orr	r3, r3, r0, lsr #21
	tst	r1, #-2147483648	; 0x80000000
	lsr	r0, r3, r2
	rsbne	r0, r0, #0
	bx	lr
lab1445: 	mov	r0, #0
	bx	lr
lab1444: 	orrs	r0, r0, r1, lsl #12
	bne	lab1447
lab1446: 	ands	r0, r1, #-2147483648	; 0x80000000
	mvneq	r0, #-2147483648	; 0x80000000
	bx	lr
lab1447: 	mov	r0, #0
	bx	lr
__aeabi_uldivmod:
	cmp	r3, #0
	cmpeq	r2, #0
	bne	lab1448
	cmp	r1, #0
	cmpeq	r0, #0
	mvnne	r1, #0
	mvnne	r0, #0
	b	__aeabi_idiv0
lab1448: 	sub	sp, sp, #8
	push	{sp, lr}
	bl	__udivmoddi4
	push{r1, r2}
	mov.w r1, #5025
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	lr, [sp, #4]
	add	sp, sp, #8
	pop	{r2, r3}
	cpsid f
	push {r1, r2}
	mov.w r1, #5554
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
__udivmoddi4:
	push	{r4, r5, r6, r7, r8, r9, sl, lr}
	mov	r6, r3
	cmp	r0, r2
	sbcs	r3, r1, r6
	mov	r4, r0
	movcc	r0, #0
	mov	r5, r1
	ldr	r7, [sp, #32]
	movcc	r1, r0
	bcc	lab1449
	mov	r1, r6
	mov	r0, r2
	mov	r8, r2
	bl	__clzdi2
	mov	r1, r5
	mov	r9, r0
	mov	r0, r4
	bl	__clzdi2
	sub	ip, r9, r0
	lsl	r3, r6, ip
	sub	r6, ip, #32
	orr	r3, r3, r8, lsl r6
	rsb	lr, ip, #32
	lsl	r2, r8, ip
	orr	r3, r3, r8, lsr lr
	cmp	r4, r2
	sbcs	r1, r5, r3
	movcc	r0, #0
	movcc	r1, r0
	bcc	lab1450
	mov	r0, #1
	subs	r4, r4, r2
	lsl	r1, r0, r6
	orr	r1, r1, r0, lsr lr
	sbc	r5, r5, r3
	lsl	r0, r0, ip
lab1450: 	cmp	ip, #0
	beq	lab1451
	lsr	r2, r2, #1
	orr	r2, r2, r3, lsl #31
	mov	r8, ip
	lsr	r3, r3, #1
	b	lab1452
lab1454: 	sbc	r5, r5, r3
	adds	r4, r4, r4
	adc	r5, r5, r5
	adds	r4, r4, #1
	adc	r5, r5, #0
	subs	r8, r8, #1
	beq	lab1453
lab1455: 	sbcs	r9, r5, r3
	bcs	lab1454
	adds	r4, r4, r4
	adc	r5, r5, r5
	subs	r8, r8, #1
	bne	lab1455
lab1453: 	adds	r0, r0, r4
	lsr	r4, r4, ip
	orr	r4, r4, r5, lsl lr
	orr	r4, r4, r5, lsr r6
	adc	r1, r1, r5
	lsr	r5, r5, ip
	lsl	r3, r5, ip
	orr	r3, r3, r4, lsl r6
	lsl	ip, r4, ip
	orr	r3, r3, r4, lsr lr
	subs	r0, r0, ip
	sbc	r1, r1, r3
lab1451: 	cmp	r7, #0
	stmne	r7, {r4, r5}
	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
	cpsid f
	push {r1, r2}
	mov.w r1, #7773
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
__clzdi2:
	push	{r4, lr}
	cmp	r1, #0
	bne	lab1456
	bl	__clzsi2
	add	r0, r0, #32
	b	lab1457
lab1456: 	mov	r0, r1
	bl	__clzsi2
lab1457: 	pop	{r4, lr}
	bx	lr
__clzsi2:
	mov	r1, #28
	cmp	r0, #65536	; 0x10000
	lsrcs	r0, r0, #16
	subcs	r1, r1, #16
	cmp	r0, #256	; 0x100
	lsrcs	r0, r0, #8
	subcs	r1, r1, #8
	cmp	r0, #16
	lsrcs	r0, r0, #4
	subcs	r1, r1, #4
	add	r2, pc, #8
	ldrb	r0, [r2, r0]
	add	r0, r0, r1
	bx	lr
	andeq	r0, r2, #4, 6	; 0x10000000
	tsteq	r1, r1, lsl #2
_close:
	mov	r2, #88	; 0x58
	ldr	r3, [pc, #8]	; 12b4c <_close+0x14>
	mvn	r0, #0
	str	r2, [r3]
	bx	lr
	andeq	r4, r2, r0, ror #9
_fstat:
	mov	r2, #88	; 0x58
	ldr	r3, [pc, #8]	; 12b64 <_fstat+0x14>
	mvn	r0, #0
	str	r2, [r3]
	bx	lr
	andeq	r4, r2, r0, ror #9
_getpid:
	mov	r2, #88	; 0x58
	ldr	r3, [pc, #8]	; 12b7c <_getpid+0x14>
	mvn	r0, #0
	str	r2, [r3]
	bx	lr
	andeq	r4, r2, r0, ror #9
_isatty:
	mov	r2, #88	; 0x58
	ldr	r3, [pc, #8]	; 12b94 <_isatty+0x14>
	mov	r0, #0
	str	r2, [r3]
	bx	lr
	andeq	r4, r2, r0, ror #9
_kill:
	mov	r2, #88	; 0x58
	ldr	r3, [pc, #8]	; 12bac <_kill+0x14>
	mvn	r0, #0
	str	r2, [r3]
	bx	lr
	andeq	r4, r2, r0, ror #9
_lseek:
	mov	r2, #88	; 0x58
	ldr	r3, [pc, #8]	; 12bc4 <_lseek+0x14>
	mvn	r0, #0
	str	r2, [r3]
	bx	lr
	andeq	r4, r2, r0, ror #9
_read:
	mov	r2, #88	; 0x58
	ldr	r3, [pc, #8]	; 12bdc <_read+0x14>
	mvn	r0, #0
	str	r2, [r3]
	bx	lr
	andeq	r4, r2, r0, ror #9
_sbrk:
	ldr	r2, [pc, #28]	; 12c04 <_sbrk+0x24>
	ldr	r3, [r2]
	ldr	r1, [pc, #24]	; 12c08 <_sbrk+0x28>
	cmp	r3, #0
	moveq	r3, r1
	add	r0, r3, r0
	str	r0, [r2]
	mov	r0, r3
	bx	lr
	andeq	r4, r2, r4, ror #9
	andeq	r4, r2, r8, ror #9
_write:
	mov	r2, #88	; 0x58
	ldr	r3, [pc, #8]	; 12c20 <_write+0x14>
	mvn	r0, #0
	str	r2, [r3]
	bx	lr
	andeq	r4, r2, r0, ror #9
_exit:
	b	_exit
