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
	ldr	r3, [pc, #16]	; (8028 <exit+0x1c>)
	ldr	r0, [r3, #0]
	ldr	r3, [r0, #60]	; 0x3c
	cbz	r3, lab0
	blx	r3
lab0: 	mov	r0, r4
	bl	_exit
	nop
	.word	0x0000895c
register_fini:
	ldr	r3, [pc, #8]	; (8038 <register_fini+0xc>)
	cbz	r3, lab1
	ldr	r0, [pc, #8]	; (803c <register_fini+0x10>)
	b	atexit
lab1: 	bx	lr
	.word	0x00000000
	.word	0x0000848d
__do_global_dtors_aux:
	push	{r4, lr}
	ldr	r4, [pc, #20]	; (8058 <__do_global_dtors_aux+0x18>)
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, [pc, #16]	; (805c <__do_global_dtors_aux+0x1c>)
	cbz	r3, lab3
	ldr	r0, [pc, #16]	; (8060 <__do_global_dtors_aux+0x20>)
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2: 	pop	{r4, pc}
	.word	0x00018da4
	.word	0x00000000
	.word	0x00008968
frame_dummy:
	push	{r3, lr}
	ldr	r3, [pc, #12]	; (8074 <frame_dummy+0x10>)
	cbz	r3, lab4
	ldr	r1, [pc, #12]	; (8078 <frame_dummy+0x14>)
	ldr	r0, [pc, #12]	; (807c <frame_dummy+0x18>)
	nop
lab4: 	pop	{r3, pc}
	.word	0x00000000
	.word	0x00018da8
	.word	0x00008968
_stack_init:
	sub	sl, r3, #65536	; 0x10000
	bx	lr
	nop
_mainCRTStartup:
	ldr	r3, [pc, #92]	; (80e8 <_mainCRTStartup+0x60>)
	cmp	r3, #0
	it	eq
	ldreq	r3, [pc, #76]	; (80dc <_mainCRTStartup+0x54>)
	mov	sp, r3
	bl	_stack_init
	movs	r1, #0
	mov	fp, r1
	mov	r7, r1
	ldr	r0, [pc, #76]	; (80ec <_mainCRTStartup+0x64>)
	ldr	r2, [pc, #80]	; (80f0 <_mainCRTStartup+0x68>)
	subs	r2, r2, r0
	bl	memset
	ldr	r3, [pc, #56]	; (80e0 <_mainCRTStartup+0x58>)
	cmp	r3, #0
	beq	lab5
	blx	r3
lab5: 	ldr	r3, [pc, #52]	; (80e4 <_mainCRTStartup+0x5c>)
	cmp	r3, #0
	beq	lab6
	blx	r3
lab6: 	movs	r0, #0
	movs	r1, #0
	movs	r4, r0
	movs	r5, r1
	ldr	r0, [pc, #52]	; (80f4 <_mainCRTStartup+0x6c>)
	cmp	r0, #0
	beq	lab7
	ldr	r0, [pc, #48]	; (80f8 <_mainCRTStartup+0x70>)
	bl	atexit
lab7: 	bl	__libc_init_array
	movs	r0, r4
	movs	r1, r5
	bl	main
	bl	exit
	nop
	.word	0x00080000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00018da4
	.word	0x00018dd4
	.word	0x00008481
	.word	0x0000848d
crc32pseudo:
	push	{r4, r7, lr}
	sub	sp, #12
	add	r7, sp, #0
	mov	r4, #4294967295	; 0xffffffff
	movs	r3, #0
	str	r3, [r7, #4]
	b	lab8
lab9: 	mov	r3, r0
	uxtb	r3, r3
	eors	r3, r4
	uxtb	r3, r3
	ldr	r2, [pc, #32]	; (813c <crc32pseudo+0x40>)
	ldr	r2, [r2, r3, lsl #2]
	lsrs	r3, r4, #8
	eor	r4, r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab8: 	ldr	r3, [r7, #4]
	cmp	r3, #1024	; 0x400
	blt	lab9
	mvns	r3, r4
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r4, r7, pc}
	.word	0x0000855c
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
	bl	benchmark_body
	str	r0, [r7, #12]
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #170	; 0xaa
	bl	benchmark_body
	mov	r3, r0
	mov	r0, r3
	pop	{r7, pc}
benchmark_body:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab10
lab11: 	bl	srand_beebs
	bl	crc32pseudo
	str	r0, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab10: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab11
	ldr	r3, [r7, #8]
	ubfx	r3, r3, #0, #15
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
verify_benchmark:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movw	r2, #11433	; 0x2ca9
	cmp	r3, r2
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
	ldr	r3, [pc, #24]	; (81ec <initialise_board+0x20>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #20]	; (81ec <initialise_board+0x20>)
	orr	r3, r3, #16777216	; 0x1000000
	str	r3, [r2, #0]
	ldr	r3, [pc, #16]	; (81f0 <initialise_board+0x24>)
	movs	r2, #0
	str	r2, [r3, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.word	0xe000edfc
	.word	0xe0001004
start_trigger:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #16]	; (820c <start_trigger+0x18>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #12]	; (820c <start_trigger+0x18>)
	orr	r3, r3, #1
	str	r3, [r2, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	.word	0xe0001000
stop_trigger:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #24]	; (8230 <stop_trigger+0x20>)
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, [pc, #24]	; (8234 <stop_trigger+0x24>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #20]	; (8234 <stop_trigger+0x24>)
	bic	r3, r3, #1
	str	r3, [r2, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.word	0xe0001004
	.word	0xe0001000
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
	bl	start_trigger
	bl	benchmark
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
	pop	{r7, pc}
	movs	r0, r0
rand_beebs:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #36]	; (82ac <rand_beebs+0x2c>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #36]	; (82b0 <rand_beebs+0x30>)
	mul	r3, r2, r3
	add	r3, r3, #12288	; 0x3000
	adds	r3, #57	; 0x39
	bic	r3, r3, #2147483648	; 0x80000000
	ldr	r2, [pc, #16]	; (82ac <rand_beebs+0x2c>)
	str	r3, [r2, #0]
	ldr	r3, [pc, #12]	; (82ac <rand_beebs+0x2c>)
	ldr	r3, [r3, #0]
	asrs	r3, r3, #16
	mov	r0, r3
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.word	0x00018dc0
	.word	0x41c64e6d
srand_beebs:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #12]	; (82cc <srand_beebs+0x18>)
	str	r3, [r2, #0]
	nop
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	.word	0x00018dc0
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, [pc, #52]	; (8308 <__libc_init_array+0x38>)
	ldr	r5, [pc, #52]	; (830c <__libc_init_array+0x3c>)
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab12
	movs	r4, #0
lab13: 	adds	r4, #1
	blx	r3
	cmp	r6, r4
	bne	lab13
lab12: 	ldr	r6, [pc, #36]	; (8310 <__libc_init_array+0x40>)
	ldr	r5, [pc, #36]	; (8314 <__libc_init_array+0x44>)
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab14
	movs	r4, #0
lab15: 	adds	r4, #1
	blx	r3
	cmp	r6, r4
	bne	lab15
lab14: 	pop	{r4, r5, r6, pc}
	.word	0x0001896c
	.word	0x0001896c
	.word	0x00018974
	.word	0x0001896c
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab16
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab17
	uxtb	r2, r1
	mov	r3, r0
	b	lab18
lab19: 	bcc	lab17
lab18: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab19
lab27: 	bls	lab20
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab21
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab22: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab22
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab23
lab28: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab24: 	cmp	r3, r2
	bne	lab24
	and	r4, ip, #3
lab20: 	cbz	r4, lab17
lab26: 	add	r4, r3
lab25: 	cmp	r4, r3
	bne	lab25
lab17: 	pop	{r4, r5, pc}
lab23: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab26
	b	lab17
lab16: 	mov	r3, r0
	mov	r4, r2
	b	lab27
lab21: 	mov	r2, r3
	mov	ip, r4
	b	lab28
__call_exitprocs:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, [pc, #180]	; (8478 <__call_exitprocs+0xbc>)
	sub	sp, #12
	mov	fp, r0
	ldr	r0, [r3, #0]
	str	fp, [sp, #4]
	mov	r7, r1
	bl	__retarget_lock_acquire_recursive
	ldr	r3, [pc, #168]	; (847c <__call_exitprocs+0xc0>)
	ldr	r8, [r3]
	ldr	r6, [r8, #328]	; 0x148
	cbz	r6, lab29
	mov	r9, #1
	mov	sl, #0
lab35: 	subs	r5, r4, #1
	bmi	lab29
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab31: 	ldr	r3, [r4, #256]	; 0x100
	cmp	r3, r7
	beq	lab30
lab32: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab31
lab29: 	ldr	r3, [pc, #112]	; (8478 <__call_exitprocs+0xbc>)
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab30: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab32
	ldr	r0, [r6, #392]	; 0x188
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab33
	blx	r2
lab38: 	cmp	r2, fp
	bne	lab34
lab37: 	cmp	r3, r6
	beq	lab32
	mov	r6, r3
	cmp	r6, #0
	bne	lab35
	b	lab29
lab33: 	ldr	r0, [r6, #396]	; 0x18c
	tst	r1, r0
	bne	lab36
	ldr	r1, [r4, #128]	; 0x80
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab37
lab34: 	ldr	r6, [r8, #328]	; 0x148
	cmp	r6, #0
	bne	lab35
	b	lab29
lab36: 	ldr	r0, [r4, #128]	; 0x80
	blx	r2
	b	lab38
	.word	0x00018da0
	.word	0x0000895c
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, [pc, #32]	; (84b0 <__libc_fini_array+0x24>)
	ldr	r5, [pc, #32]	; (84b4 <__libc_fini_array+0x28>)
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab39
	subs	r3, #4
	add	r5, r3
lab40: 	ldr	r3, [r5], #-4
	blx	r3
	cmp	r4, #0
	bne	lab40
lab39: 	ldmia	sp!, {r3, r4, r5, lr}
	b	_fini
	.word	0x00018978
	.word	0x00018974
__retarget_lock_acquire_recursive:
	bx	lr
	nop
__retarget_lock_release_recursive:
	bx	lr
	nop
__register_exitproc:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, [pc, #124]	; 8544 <__register_exitproc+0x84>
	mov	r6, r0
	ldr	r0, [sl]
	mov	r8, r3
	mov	r7, r1
	mov	r9, r2
	bl	__retarget_lock_acquire_recursive
	ldr	r3, [pc, #108]	; (8548 <__register_exitproc+0x88>)
	ldr	r3, [r3, #0]
	ldr	r4, [r3, #328]	; 0x148
	cbz	r4, lab41
lab45: 	cmp	r5, #31
	bgt	lab42
	cbnz	r6, lab43
lab44: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab46: lab43: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	; 0x88
	ldr	r2, [r4, #392]	; 0x188
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	; 0x188
	str	r8, [r1, #264]	; 0x108
	bne	lab44
	ldr	r2, [r4, #396]	; 0x18c
	orrs	r3, r2
	str	r3, [r4, #396]	; 0x18c
	b	lab44
lab41: 	add	r4, r3, #332	; 0x14c
	str	r4, [r3, #328]	; 0x148
	b	lab45
lab42: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	; 0xffffffff
	b	lab46
	.word	0x00018da0
	.word	0x0000895c
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
