TestCompare:
	push	{lr}
	sub	sp, #20
	cmp	r0, r2
	add	lr, sp, #16
	stmdb	lr, {r0, r1}
	mov	ip, sp
	ite	ge
	movge	r0, #0
	movlt	r0, #1
	stmia	ip, {r2, r3}
	add	sp, #20
	ldr	pc, [sp], #4
TestingAscending:
	bx	lr
	nop
TestingDescending:
	subs	r0, r1, r0
	bx	lr
TestingEqual:
	mov	r0, #1000	; 0x3e8
	bx	lr
	nop
TestingRandom:
	b	rand_beebs
TestingMostlyDescending:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r7, r1
	mov	r6, r0
	bl	rand_beebs
	bl	__aeabi_i2d
	add	r3, pc, #52	; (adr r3, 8000228 <TestingMostlyDescending+0x44>)
	ldrd	r2, r3, [r3]
	bl	__aeabi_ddiv
	ldr	r3, [pc, #48]	; (8000230 <TestingMostlyDescending+0x4c>)
	movs	r2, #0
	bl	__aeabi_dmul
	mov	r4, r0
	subs	r0, r7, r6
	mov	r5, r1
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	ldr	r3, [pc, #24]	; (8000234 <TestingMostlyDescending+0x50>)
	movs	r2, #0
	bl	__aeabi_dsub
	bl	__aeabi_d2iz
	pop	{r3, r4, r5, r6, r7, pc}
	.word	0xffc00000
	.word	0x41dfffff
	.word	0x40140000
	.word	0x40040000
TestingMostlyAscending:
	push	{r4, r5, r6, lr}
	mov	r6, r0
	bl	rand_beebs
	bl	__aeabi_i2d
	add	r3, pc, #56	; (adr r3, 8000280 <TestingMostlyAscending+0x48>)
	ldrd	r2, r3, [r3]
	bl	__aeabi_ddiv
	ldr	r3, [pc, #56]	; (8000288 <TestingMostlyAscending+0x50>)
	movs	r2, #0
	bl	__aeabi_dmul
	mov	r4, r0
	mov	r0, r6
	mov	r5, r1
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	ldr	r3, [pc, #28]	; (800028c <TestingMostlyAscending+0x54>)
	movs	r2, #0
	bl	__aeabi_dsub
	bl	__aeabi_d2iz
	pop	{r4, r5, r6, pc}
	nop
	nop
	.word	0xffc00000
	.word	0x41dfffff
	.word	0x40140000
	.word	0x40040000
TestingJittered:
	push	{r4, lr}
	mov	r4, r0
	bl	rand_beebs
	bl	__aeabi_i2d
	add	r3, pc, #24	; (adr r3, 80002b8 <TestingJittered+0x28>)
	ldrd	r2, r3, [r3]
	bl	__aeabi_ddiv
	add	r3, pc, #24	; (adr r3, 80002c0 <TestingJittered+0x30>)
	ldrd	r2, r3, [r3]
	bl	__aeabi_dcmple
	cbnz	r0, lab0
	subs	r4, #2
lab0: 	mov	r0, r4
	pop	{r4, pc}
	.word	0xffc00000
	.word	0x41dfffff
	.word	0xcccccccd
	.word	0x3feccccc
TestingMostlyEqual:
	push	{r3, lr}
	bl	rand_beebs
	negs	r3, r0
	and	r3, r3, #3
	and	r0, r0, #3
	it	pl
	negpl	r0, r3
	add	r0, r0, #1000	; 0x3e8
	pop	{r3, pc}
	nop
TestingPathological:
	cbz	r0, lab1
	add	r3, r1, r1, lsr #31
	cmp	r0, r3, asr #1
	blt	lab2
	subs	r1, #1
	cmp	r0, r1
	ite	eq
	moveq	r0, #10
	movne	r0, #9
	bx	lr
lab2: 	movs	r0, #11
	bx	lr
lab1: 	movs	r0, #10
	bx	lr
WikiMerge.constprop.1.isra.0:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, #44	; 0x2c
	add	r4, sp, #40	; 0x28
	sub	r8, r3, r2
	stmdb	r4, {r2, r3}
	ldr	ip, [sp, #88]	; 0x58
	str	r2, [sp, #20]
	mov	r4, r0
	cmp	r8, #512	; 0x200
	ldr	r0, [sp, #80]	; 0x50
	str	r1, [sp, #12]
	ldr	r6, [sp, #92]	; 0x5c
	str	ip, [sp, #8]
	mov	r1, r2
	str	r0, [sp, #16]
	ldr	r2, [sp, #84]	; 0x54
	bgt	lab3
	add	r3, r4, r1, lsl #3
	subs	r1, r2, r0
	cmp	r1, #0
	add	sl, r6, r8, lsl #3
	ble	lab4
	cmp	r8, #0
	ble	lab4
	add	r7, r4, r0, lsl #3
	add	r4, r4, r2, lsl #3
	mov	r8, r4
	add	r5, r3, #8
	mov	r4, ip
	b	lab5
lab6: 	adds	r6, #8
	cmp	sl, r6
	stmdb	r5, {r0, r1}
	beq	lab4
lab7: lab5: 	ldmia	r6, {r2, r3}
	ldmia	r7, {r0, r1}
	blx	r4
	mov	r3, r5
	cmp	r0, #0
	beq	lab6
	ldmia	r7, {r0, r1}
	adds	r7, #8
	cmp	r8, r7
	stmdb	r5, {r0, r1}
	bne	lab7
lab4: 	sub	r2, sl, r6
	mov	r1, r6
	mov	r0, r3
	add	sp, #44	; 0x2c
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	memcpy
lab3: 	subs	r3, r2, r0
	cmp	r3, #0
	str	r3, [sp, #24]
	ble	lab8
	ldr	r3, [sp, #20]
	str	r8, [sp, #28]
	add	r7, r4, r3, lsl #3
	mov	fp, #0
	movs	r3, #1
	ldr	r9, [sp, #12]
	str	r3, [sp, #4]
	adds	r7, #4
	mov	sl, fp
	mov	r8, r0
	b	lab9
lab11: 	ldmia	r6, {r0, r1}
	ldr	r2, [r3], #-4
	ldr	r5, [r7, #-4]
	stmia	r3, {r0, r1}
	ldr	r3, [sp, #28]
	str	r5, [r4, r9, lsl #3]
	add	sl, sl, #1
	cmp	r3, sl
	str	r2, [r6, #4]
	ble	lab10
	ldr	r3, [sp, #12]
	add	r9, sl, r3
lab13: 	adds	r3, #1
	str	r3, [sp, #4]
	adds	r7, #8
lab9: 	add	r5, r4, r8, lsl #3
	add	r6, r4, r9, lsl #3
	ldmia	r5, {r0, r1}
	ldmia	r6, {r2, r3}
	ldr	ip, [sp, #8]
	blx	ip
	cmp	r0, #0
	beq	lab11
	mov	r3, r7
	ldmia	r5, {r0, r1}
	ldr	r2, [r3], #-4
	ldr	r6, [r7, #-4]
	stmia	r3, {r0, r1}
	ldr	r3, [sp, #24]
	str	r6, [r4, r8, lsl #3]
	add	fp, fp, #1
	cmp	r3, fp
	str	r2, [r5, #4]
	ble	lab12
	ldr	r3, [sp, #16]
	add	r8, r3, fp
	b	lab13
lab12: 	ldr	r8, [sp, #28]
	str	r9, [sp, #12]
lab16: 	ldr	r2, [sp, #4]
	sub	r8, r8, sl
	add	r3, r2
	cmp	r8, #0
	str	r3, [sp, #20]
	ble	lab14
lab8: 	ldr	r3, [sp, #12]
	add	r2, r4, r3, lsl #3
	ldr	r3, [sp, #20]
	add	r4, r4, r3, lsl #3
	add	lr, r2, #4
	add	ip, r4, #4
	movs	r3, #0
lab15: 	ldmia	r1, {r0, r1}
	ldr	r7, [r2, r3, lsl #3]
	ldr	r6, [lr, r3, lsl #3]
	add	r5, r2, r3, lsl #3
	stmia	r5, {r0, r1}
	str	r7, [r4, r3, lsl #3]
	str	r6, [ip, r3, lsl #3]
	adds	r3, #1
	cmp	r3, r8
	blt	lab15
lab14: 	add	sp, #44	; 0x2c
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab10: 	mov	r8, r3
	ldr	r3, [sp, #12]
	add	r3, sl
	str	r3, [sp, #12]
	b	lab16
	nop
WikiMerge.constprop.0.isra.0:
	sub	sp, #8
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	ip, r2, r1
	sub	sp, #36	; 0x24
	add	r4, sp, #32
	cmp	ip, #512	; 0x200
	stmdb	r4, {r1, r2}
	str	r3, [sp, #76]	; 0x4c
	str	r0, [sp, #4]
	str	r3, [sp, #8]
	mov	r0, r3
	ldr	r4, [sp, #84]	; 0x54
	ldr	r3, [sp, #80]	; 0x50
	str	r1, [sp, #12]
	bgt	lab17
	ldr	r7, [pc, #352]	; (8000620 <WikiMerge.constprop.0.isra.0+0x188>)
	add	r6, r7, r1, lsl #3
	subs	r1, r3, r0
	cmp	r1, #0
	add	r2, r4, ip, lsl #3
	ble	lab18
	cmp	ip, #0
	ble	lab18
	add	r5, r7, r0, lsl #3
	add	r7, r7, r3, lsl #3
	add	r3, r6, #8
	b	lab19
lab20: 	adds	r4, #8
	cmp	r2, r4
	stmdb	r3, {r0, r1}
	beq	lab18
lab21: lab19: 	ldr	r0, [r4, #0]
	ldr	r1, [r5, #0]
	cmp	r0, r1
	mov	r6, r3
	ble	lab20
	ldmia	r5, {r0, r1}
	adds	r5, #8
	cmp	r7, r5
	stmdb	r3, {r0, r1}
	bne	lab21
lab18: 	subs	r2, r2, r4
	mov	r1, r4
	mov	r0, r6
	add	sp, #36	; 0x24
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	sp, #8
	b	memcpy
lab17: 	subs	r3, r3, r0
	cmp	r3, #0
	str	r3, [sp, #16]
	ble	lab22
	ldr	r3, [pc, #248]	; (8000620 <WikiMerge.constprop.0.isra.0+0x188>)
	ldr	lr, [sp, #4]
	str	ip, [sp, #20]
	lsls	r1, r1, #3
	adds	r2, r1, #4
	subs	r1, #4
	adds	r1, r3, r1
	mov	fp, #0
	mov	r5, r0
	add	r2, r3
	movs	r4, #1
	mov	sl, fp
	mov	r9, r1
	b	lab23
lab25: 	ldr	ip, [r7, #-4]!
	ldr	r6, [r9, r4, lsl #3]
	stmia	r7, {r0, r1}
	ldr	r1, [sp, #20]
	str	ip, [r3, lr, lsl #3]
	add	sl, sl, #1
	cmp	r1, sl
	str	r6, [r8, #4]
	ble	lab24
	ldr	r1, [sp, #4]
	add	lr, sl, r1
lab27: 	adds	r2, #8
lab23: 	ldr	r0, [r3, lr, lsl #3]
	ldr	r1, [r3, r5, lsl #3]
	cmp	r0, r1
	mov	r7, r2
	mov	r6, r2
	add	ip, r3, r5, lsl #3
	add	r8, r3, lr, lsl #3
	ble	lab25
	ldmia	ip, {r0, r1}
	ldr	r8, [r6, #-4]!
	ldr	r7, [r9, r4, lsl #3]
	stmia	r6, {r0, r1}
	ldr	r1, [sp, #16]
	str	r8, [r3, r5, lsl #3]
	add	fp, fp, #1
	cmp	r1, fp
	str	r7, [ip, #4]
	ble	lab26
	ldr	r1, [sp, #8]
	add	r5, r1, fp
	b	lab27
lab22: 	ldr	r3, [pc, #104]	; (8000620 <WikiMerge.constprop.0.isra.0+0x188>)
lab29: 	add	r4, r3, r2, lsl #3
	ldr	r2, [sp, #12]
	add	r3, r3, r2, lsl #3
	add	r8, r4, #4
	add	lr, r3, #4
	movs	r2, #0
lab28: 	ldmia	r1, {r0, r1}
	ldr	r7, [r4, r2, lsl #3]
	ldr	r6, [r8, r2, lsl #3]
	add	r5, r4, r2, lsl #3
	stmia	r5, {r0, r1}
	str	r7, [r3, r2, lsl #3]
	str	r6, [lr, r2, lsl #3]
	adds	r2, #1
	cmp	ip, r2
	bgt	lab28
lab30: 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	sp, #8
	bx	lr
lab26: 	ldr	ip, [sp, #20]
	str	lr, [sp, #4]
lab31: 	sub	ip, ip, sl
	add	r2, r4
	cmp	ip, #0
	str	r2, [sp, #12]
	bgt	lab29
	b	lab30
lab24: 	ldr	r2, [sp, #4]
	add	r2, sl
	mov	ip, r1
	str	r2, [sp, #4]
	b	lab31
	nop
	.word	0x20000004
Rotate.constprop.0:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	mov	r6, r2
	sub	sp, #8
	add	r4, sp, #8
	cmp	r6, r1
	stmdb	r4, {r1, r2}
	ldr	r2, [sp, #40]	; 0x28
	beq	lab32
	cmp	r0, #0
	ite	lt
	addlt	r5, r0, r6
	addge	r5, r0, r1
	mov	r8, r0
	sub	r7, r6, r5
	it	lt
	sublt	r8, r5, r1
	cmp	r7, r8
	mov	r4, r1
	mov	r9, r3
	bge	lab33
	cmp	r7, r2
	ble	lab34
lab40: 	cmp	r8, #1
	mov	r3, r3, asr #1
	ble	lab35
	ldr	r1, [pc, #284]	; (8000784 <Rotate.constprop.0+0x160>)
	subs	r2, r5, r3
	add	r2, r1, r2, lsl #3
	add	r3, r4
	add	r8, r1, #4
	add	r3, r1, r3, lsl #3
	adds	r2, #4
	add	r8, r8, r5, lsl #3
lab36: 	ldmia	r1, {r0, r1}
	ldrd	lr, ip, [r3, #-8]
	subs	r3, #8
	stmia	r3, {r0, r1}
	str	lr, [r2, #-4]
	str	ip, [r2], #8
	cmp	r8, r2
	bne	lab36
lab35: 	add	r2, r7, r7, lsr #31
	cmp	r7, #1
	mov	r2, r2, asr #1
	ble	lab37
	ldr	r1, [pc, #220]	; (8000784 <Rotate.constprop.0+0x160>)
	adds	r3, r5, r2
	subs	r2, r6, r2
	add	r2, r1, r2, lsl #3
	add	ip, r1, #4
	add	r3, r1, r3, lsl #3
	adds	r2, #4
	add	ip, ip, r6, lsl #3
lab38: 	ldmia	r1, {r0, r1}
	ldrd	r7, r5, [r3, #-8]
	subs	r3, #8
	stmia	r3, {r0, r1}
	str	r7, [r2, #-4]
	str	r5, [r2], #8
	cmp	ip, r2
	bne	lab38
lab37: 	subs	r2, r6, r4
	add	r3, r2, r2, lsr #31
	cmp	r2, #1
	mov	r3, r3, asr #1
	ble	lab32
	ldr	r1, [pc, #156]	; (8000784 <Rotate.constprop.0+0x160>)
	subs	r2, r6, r3
	add	r3, r4
	add	r2, r1, r2, lsl #3
	add	r3, r1, r3, lsl #3
	adds	r1, #4
	add	r6, r1, r6, lsl #3
	adds	r2, #4
lab39: 	ldmia	r1, {r0, r1}
	ldrd	r5, r4, [r3, #-8]
	subs	r3, #8
	stmia	r3, {r0, r1}
	str	r5, [r2, #-4]
	str	r4, [r2], #8
	cmp	r6, r2
	bne	lab39
lab32: 	add	sp, #8
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
lab33: 	cmp	r2, r8
	blt	lab40
	ldr	r6, [pc, #100]	; (8000784 <Rotate.constprop.0+0x160>)
	mov	r8, r8, lsl #3
	add	sl, r6, r1, lsl #3
	mov	r2, r8
	mov	r1, sl
	mov	r0, r3
	bl	memcpy
	add	r1, r6, r5, lsl #3
	lsls	r2, r7, #3
	mov	r0, sl
	bl	memmove
	adds	r0, r7, r4
	mov	r2, r8
	mov	r1, r9
	add	r0, r6, r0, lsl #3
lab41: 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	memcpy
lab34: 	mov	sl, r7, lsl #3
	ldr	r7, [pc, #44]	; (8000784 <Rotate.constprop.0+0x160>)
	mov	r2, sl
	add	r1, r7, r5, lsl #3
	mov	r0, r3
	bl	memcpy
	add	r4, r7, r4, lsl #3
	sub	r0, r6, r8
	mov	r2, r8, lsl #3
	mov	r1, r4
	add	r0, r7, r0, lsl #3
	bl	memmove
	mov	r2, sl
	mov	r1, r9
	mov	r0, r4
	b	lab41
	nop
	.word	0x20000004
WikiSort.constprop.0:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	movs	r5, #0
	sub	sp, sp, #4320	; 0x10e0
	ldr	fp, [pc, #48]	; 80007c4 <WikiSort.constprop.0+0x3c>
	sub	sp, #28
	mov	ip, #2
	mov	lr, #1
	mov	r7, r5
lab47: 	add	r7, r7, #25
	mov	r6, lr
	bgt	lab42
	cmp	r7, ip
	mov	r6, ip
	ble	lab43
lab42: 	add	r3, fp, r6, lsl #3
	ldr	r4, [fp, r6, lsl #3]
	ldr	r8, [r3, #4]
	mov	r2, r6
	b	lab44
	.word	0x20000004
lab46: 	cmp	r5, r2
	stmia	r3, {r0, r1}
	bge	lab45
lab44: 	add	r3, fp, r2, lsl #3
	subs	r2, #1
	ldr	r1, [r3, #-8]
	cmp	r1, r4
	bgt	lab46
	adds	r6, #1
	cmp	r7, r6
	strd	r4, r8, [r3]
	bgt	lab42
lab76: 	add	r5, r5, #25
	add	lr, lr, #25
	add	ip, ip, #25
	bne	lab47
	movs	r3, #4
	str	r3, [sp, #124]	; 0x7c
	movs	r3, #25
	str	r3, [sp, #72]	; 0x48
	add	r3, sp, #224	; 0xe0
	str	r3, [sp, #148]	; 0x94
lab79: 	mov	r0, r4
	bl	__aeabi_i2d
	bl	sqrt
	bl	__aeabi_d2iz
	sdiv	r3, r4, r0
	mov	r6, r0
	str	r3, [sp, #116]	; 0x74
	adds	r3, #1
	lsls	r2, r4, #3
	lsls	r0, r3, #1
	str	r3, [sp, #112]	; 0x70
	lsls	r3, r6, #3
	str	r3, [sp, #76]	; 0x4c
	sub	r3, r2, #8
	add	r3, fp
	mov	r1, r4
	str	r3, [sp, #56]	; 0x38
	subs	r3, r0, #2
	subs	r3, r1, r3
	movs	r5, #0
	str	r4, [sp, #36]	; 0x24
	str	r3, [sp, #144]	; 0x90
	lsls	r4, r4, #4
	lsls	r3, r1, #1
	str	r3, [sp, #72]	; 0x48
	strd	r5, r5, [sp, #104]	; 0x68
	sub	r3, r4, #8
	strd	r5, r5, [sp, #44]	; 0x2c
	str	r3, [sp, #88]	; 0x58
	movs	r3, #1
	str	r2, [sp, #136]	; 0x88
	str	r0, [sp, #140]	; 0x8c
	str	r4, [sp, #96]	; 0x60
	str	r5, [sp, #132]	; 0x84
	str	r1, [sp, #100]	; 0x64
	str	fp, [sp, #52]	; 0x34
	str	r3, [sp, #68]	; 0x44
	str	r5, [sp, #128]	; 0x80
	str	r5, [sp, #120]	; 0x78
	str	r5, [sp, #80]	; 0x50
	str	r5, [sp, #60]	; 0x3c
	mov	sl, r6
lab77: 	ldr	r3, [sp, #88]	; 0x58
	ldr	r6, [sp, #60]	; 0x3c
	ldr	r2, [r0, #0]
	ldr	r3, [r0, r3]
	ldr	r1, [sp, #72]	; 0x48
	ldr	r4, [sp, #36]	; 0x24
	str	r6, [sp, #28]
	adds	r1, r6, r1
	cmp	r2, r3
	str	r1, [sp, #64]	; 0x40
	str	r4, [sp, #12]
	str	r1, [sp, #60]	; 0x3c
	str	r0, [sp, #8]
	bgt	lab48
	ldr	r3, [sp, #56]	; 0x38
	ldr	r2, [r3, #8]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bge	lab49
	ldr	r3, [sp, #100]	; 0x64
	cmp	r3, #512	; 0x200
	ble	lab50
	ldr	r3, [sp, #80]	; 0x50
	ldr	r2, [sp, #48]	; 0x30
	subs	r3, r3, r2
	cmp	r3, #0
	str	r3, [sp, #92]	; 0x5c
	ble	lab51
	ldr	r7, [sp, #100]	; 0x64
	str	r1, [sp, #84]	; 0x54
	mov	r9, r7
	mov	r3, r6
lab96: 	mls	lr, sl, lr, r7
	add	r8, r3, lr
	ldr	r3, [sp, #36]	; 0x24
	add	r6, r8, #1
	cmp	r3, r6
	mov	r5, r8
	ble	lab52
	ldr	r3, [sp, #48]	; 0x30
	ldr	ip, [sp, #76]	; 0x4c
	add	r4, fp, r3, lsl #3
	strd	lr, r8, [sp, #16]
	ldr	lr, [sp, #36]	; 0x24
	adds	r4, #4
	add	r3, fp, r8, lsl #3
lab53: 	add	r1, r3, #8
	ldmia	r1, {r0, r1}
	ldr	r7, [r4, #-4]
	ldr	r5, [r2], #-4
	add	r6, sl
	cmp	lr, r6
	stmia	r2, {r0, r1}
	add	r4, r4, #8
	strd	r7, r5, [r3, #8]
	add	r3, ip
	bgt	lab53
	ldrd	lr, r5, [sp, #16]
lab52: 	ldr	r3, [sp, #36]	; 0x24
	cmp	sl, r9
	ite	le
	addle	r3, sl
	addgt	r3, r9
	cmp	lr, #512	; 0x200
	ldr	r9, [fp, r8, lsl #3]
	str	r3, [sp, #16]
	bgt	lab54
	ldr	r1, [sp, #8]
	mov	r2, lr, lsl #3
	add	r0, sp, #248	; 0xf8
	bl	memcpy
lab98: 	str	r3, [sp, #20]
	movs	r6, #0
	add	r3, fp, #4
	str	r8, [sp, #24]
	str	r8, [sp, #8]
	mov	r4, r6
	str	r6, [sp, #40]	; 0x28
	str	r3, [sp, #32]
lab71: 	cmp	r3, #0
	ble	lab55
lab68: 	subs	r3, #1
	ldr	r3, [fp, r3, lsl #3]
	cmp	r3, r9
	blt	lab55
lab69: 	cmp	r4, r7
	bge	lab56
	ldr	r0, [fp, r5, lsl #3]
	mov	r2, r7
lab58: 	add	r3, r4, r3, asr #1
	ldr	r1, [fp, r3, lsl #3]
	cmp	r1, r0
	bge	lab57
	adds	r4, r3, #1
	cmp	r2, r4
	bgt	lab58
lab56: 	cmp	r7, r4
	bne	lab59
	ldr	r2, [fp, r4, lsl #3]
	ldr	r3, [fp, r5, lsl #3]
	cmp	r2, r3
	it	lt
	addlt	r4, #1
lab59: 	cmp	sl, #0
	ldr	r3, [sp, #8]
	sub	r6, r6, r4
	ble	lab60
	subs	r5, r5, r3
	add	r2, fp, r3, lsl #3
	add	r7, sl, r3
	ldr	r3, [sp, #32]
	adds	r2, #4
	add	r9, r3, r7, lsl #3
	mov	r8, r5, lsl #3
	mov	ip, r6
	mov	lr, r4
lab61: 	ldr	r6, [r2, #-4]
	ldr	r4, [r3], #-4
	add	r1, r3, r8
	ldmia	r1, {r0, r1}
	stmia	r3, {r0, r1}
	str	r6, [r3, r5, lsl #3]
	str	r4, [r2, r5, lsl #3]
	adds	r2, #8
	cmp	r2, r9
	bne	lab61
	mov	r6, ip
	mov	r4, lr
lab81: 	strd	r4, r2, [sp]
	ldr	r1, [sp, #48]	; 0x30
	ldr	r2, [sp, #40]	; 0x28
	ldr	r3, [sp, #28]
	str	r3, [sp, #152]	; 0x98
	add	r8, r1, r2
	adds	r2, #1
	str	r2, [sp, #40]	; 0x28
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #24]
	str	r3, [sp, #156]	; 0x9c
	adds	r5, r2, #1
	add	ip, fp, r8, lsl #3
	ldmia	ip, {r0, r1}
	add	lr, fp, r5, lsl #3
	ldr	r9, [fp, r5, lsl #3]
	ldr	r2, [lr, #4]
	stmia	lr, {r0, r1}
	str	r9, [fp, r8, lsl #3]
	str	r2, [ip, #4]
	add	r2, sp, #152	; 0x98
	ldmia	r2, {r1, r2}
	ldr	r0, [sp, #44]	; 0x2c
	strd	r3, r4, [sp, #208]	; 0xd0
	bl	WikiMerge.constprop.0.isra.0
	cmp	sl, #512	; 0x200
	mov	r5, r5, lsl #3
	bgt	lab62
	sub	r1, r5, #8
	ldr	r2, [sp, #76]	; 0x4c
	add	r1, fp
	add	r0, sp, #248	; 0xf8
	bl	memcpy
lab73: 	sub	r5, r7, r6
	ble	lab63
	ldr	r3, [sp, #32]
	subs	r5, r5, r4
	add	r2, fp, r4, lsl #3
	add	r4, r6
	adds	r2, #4
	add	lr, r3, r4, lsl #3
	mov	r8, r5, lsl #3
	mov	ip, r6
lab64: 	ldr	r6, [r2, #-4]
	ldr	r4, [r3], #-4
	add	r1, r3, r8
	ldmia	r1, {r0, r1}
	stmia	r3, {r0, r1}
	str	r6, [r3, r5, lsl #3]
	str	r4, [r2, r5, lsl #3]
	adds	r2, #8
	cmp	lr, r2
	bne	lab64
	mov	r6, ip
lab63: 	ldr	r3, [sp, #8]
	subs	r3, r3, r6
	str	r3, [sp, #28]
	add	r3, sl
	str	r3, [sp, #24]
	add	r6, r3
	ldr	r3, [sp, #12]
	cmp	r7, r3
	beq	lab65
	adds	r5, r7, #1
	mov	r0, r3
	add	r3, sl, r5
	cmp	r0, r3
	ble	lab66
	ldr	r1, [fp, r5, lsl #3]
lab67: 	cmp	r1, r2
	it	gt
	movgt	r5, r3
	add	r3, sl
	it	gt
	movgt	r1, r2
	cmp	r3, r0
	blt	lab67
	subs	r5, #1
lab82: 	ldr	r9, [fp, r5, lsl #3]
	str	r7, [sp, #8]
	subs	r3, r6, r4
	cmp	r3, #0
	bgt	lab68
lab55: 	ldrd	r3, r2, [sp, #16]
	cmp	r3, r2
	beq	lab69
	subs	r6, r3, r2
	cmp	sl, r6
	ble	lab70
	ldr	r4, [sp, #8]
	subs	r0, r2, r3
	strd	r4, r3, [sp, #200]	; 0xc8
	movs	r3, #0
	str	r3, [sp, #0]
	ldr	r3, [sp, #12]
	add	r3, r6
	str	r3, [sp, #12]
	add	r3, sp, #200	; 0xc8
	mov	r7, r2
	add	r5, r6
	ldmia	r3, {r1, r2}
	add	r6, r4
	add	r3, sp, #248	; 0xf8
	bl	Rotate.constprop.0
	str	r7, [sp, #16]
	str	r6, [sp, #8]
	b	lab71
lab57: 	cmp	r4, r3
	bge	lab56
	mov	r2, r3
	b	lab58
lab62: 	ldr	r3, [sp, #44]	; 0x2c
	ldr	r1, [sp, #8]
	subs	r2, r5, #4
	subs	r5, r3, r1
	ldr	r3, [sp, #32]
	add	r2, fp
	add	r9, r3, r7, lsl #3
	mov	r8, r5, lsl #3
	mov	ip, r6
	mov	lr, r4
lab72: 	ldr	r6, [r2, #-4]
	ldr	r4, [r3], #-4
	add	r1, r3, r8
	ldmia	r1, {r0, r1}
	stmia	r3, {r0, r1}
	str	r6, [r3, r5, lsl #3]
	str	r4, [r2, r5, lsl #3]
	adds	r2, #8
	cmp	r2, r9
	bne	lab72
	mov	r6, ip
	mov	r4, lr
	b	lab73
lab70: 	cmp	sl, #0
	ble	lab74
	ldr	r1, [sp, #8]
	mov	r3, r2
	subs	r4, r3, r1
	ldr	r3, [sp, #32]
	add	r2, fp, r1, lsl #3
	add	r7, sl, r1
	adds	r2, #4
	add	r8, r3, r7, lsl #3
	mov	lr, r4, lsl #3
	mov	ip, r5
lab75: 	ldr	r5, [r2, #-4]
	ldr	r6, [r3], #-4
	add	r1, r3, lr
	ldmia	r1, {r0, r1}
	stmia	r3, {r0, r1}
	str	r5, [r3, r4, lsl #3]
	str	r6, [r2, r4, lsl #3]
	adds	r2, #8
	cmp	r8, r2
	bne	lab75
	mov	r5, ip
lab99: 	cmp	r5, r1
	it	eq
	moveq	r5, r2
	add	r2, sl
	str	r2, [sp, #12]
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #16]
	str	r7, [sp, #8]
	add	r2, sl
	str	r2, [sp, #20]
	ldr	r2, [sp, #84]	; 0x54
	add	r3, sl
	cmp	r3, r2
	it	ge
	movge	r3, r2
	mov	r6, r7
	mov	r4, r1
	str	r3, [sp, #16]
	b	lab71
lab45: 	adds	r6, #1
	add	r3, fp, r2, lsl #3
	cmp	r7, r6
	strd	r4, r8, [r3]
	bgt	lab42
	b	lab76
lab50: 	mov	r1, r0
	ldr	r2, [sp, #136]	; 0x88
	add	r0, sp, #248	; 0xf8
	bl	memcpy
	add	r3, sp, #248	; 0xf8
	ldr	r0, [sp, #36]	; 0x24
	str	r3, [sp, #4]
	ldr	r3, [sp, #60]	; 0x3c
	str	r0, [sp, #164]	; 0xa4
	strd	r0, r3, [sp, #168]	; 0xa8
	str	r3, [sp, #0]
	str	r6, [sp, #160]	; 0xa0
	add	r3, sp, #160	; 0xa0
	ldmia	r3, {r1, r2}
	mov	r3, r0
	movs	r0, #0
	bl	WikiMerge.constprop.0.isra.0
lab49: 	ldr	r3, [sp, #80]	; 0x50
	ldr	r2, [sp, #48]	; 0x30
	subs	r3, r3, r2
	str	r3, [sp, #92]	; 0x5c
lab80: 	ldr	r2, [sp, #96]	; 0x60
	ldr	r1, [sp, #72]	; 0x48
	add	r3, r2
	str	r3, [sp, #52]	; 0x34
	ldr	r3, [sp, #36]	; 0x24
	add	r3, r1
	str	r3, [sp, #36]	; 0x24
	ldr	r3, [sp, #68]	; 0x44
	add	r3, r1
	str	r3, [sp, #68]	; 0x44
	ldr	r3, [sp, #56]	; 0x38
	add	r3, r2
	str	r3, [sp, #56]	; 0x38
	ldr	r3, [sp, #64]	; 0x40
	cmp	r3, #400	; 0x190
	blt	lab77
	ldr	r3, [sp, #92]	; 0x5c
	cmp	r3, #0
	bgt	lab78
lab146: 	subs	r3, #1
	str	r3, [sp, #124]	; 0x7c
	bne	lab79
	add	sp, sp, #4320	; 0x10e0
	add	sp, #28
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab48: 	str	r1, [sp, #244]	; 0xf4
	ldr	r2, [sp, #80]	; 0x50
	ldr	r1, [sp, #48]	; 0x30
	str	r6, [sp, #240]	; 0xf0
	mov	r3, #512	; 0x200
	str	r3, [sp, #0]
	subs	r2, r2, r1
	add	r3, sp, #248	; 0xf8
	str	r2, [sp, #92]	; 0x5c
	ldr	r0, [sp, #100]	; 0x64
	ldrd	r1, r2, [r3, #-8]
	bl	Rotate.constprop.0
	b	lab80
lab60: 	add	r7, sl, r3
	b	lab81
lab65: 	ldr	r3, [sp, #28]
	str	r3, [sp, #152]	; 0x98
	add	r2, sp, #248	; 0xf8
	ldr	r3, [sp, #24]
	str	r2, [sp, #4]
	ldr	r2, [sp, #84]	; 0x54
	str	r2, [sp, #0]
	strd	r3, r2, [sp, #192]	; 0xc0
	str	r3, [sp, #156]	; 0x9c
	add	r2, sp, #152	; 0x98
	ldmia	r2, {r1, r2}
	ldr	r0, [sp, #44]	; 0x2c
	bl	WikiMerge.constprop.0.isra.0
	b	lab80
lab66: 	mov	r5, r7
	b	lab82
lab51: 	mov	r0, r4
	ldr	r7, [sp, #116]	; 0x74
	ldr	r4, [sp, #68]	; 0x44
	movs	r5, #1
lab86: 	ldr	r2, [fp, r4, lsl #3]
	ldr	r3, [r3, #-8]
	cmp	r2, r3
	add	r1, r5, #1
	bgt	lab83
	bge	lab84
lab83: 	cmp	r7, r5
	mov	r5, r1
	beq	lab85
lab84: 	adds	r4, #1
	cmp	r0, r4
	bgt	lab86
lab85: 	ldr	r3, [sp, #112]	; 0x70
	cmp	r3, #512	; 0x200
	bgt	lab87
	cmp	r3, r5
	bne	lab88
	ldr	r2, [sp, #28]
	ldr	r9, [sp, #64]	; 0x40
	str	r2, [sp, #120]	; 0x78
	add	r3, r2
	strd	r9, r3, [sp, #104]	; 0x68
	str	r3, [sp, #80]	; 0x50
	movs	r3, #0
	str	r2, [sp, #44]	; 0x2c
	str	r3, [sp, #16]
lab164: 	mov	r2, r4
lab155: 	ldr	r7, [sp, #148]	; 0x94
	str	sl, [sp, #8]
	movs	r6, #0
	add	r8, r3, #4294967295	; 0xffffffff
lab91: 	add	sl, fp, r4, lsl #3
	add	lr, r2, #1
	add	r1, r4, #1
	rsb	r0, r6, #0
	add	r3, sp, #248	; 0xf8
	beq	lab89
	ldr	sl, [sl, #-8]
	ldr	ip, [fp, r4, lsl #3]
	cmp	sl, ip
	blt	lab89
	ble	lab90
lab89: 	strd	r1, lr, [sp, #224]	; 0xe0
	mov	ip, #512	; 0x200
	ldmia	r7, {r1, r2}
	str	ip, [sp]
	bl	Rotate.constprop.0
	adds	r2, r4, r6
	adds	r6, #1
lab90: 	cmp	r6, r5
	add	r4, r4, #4294967295	; 0xffffffff
	blt	lab91
	ldr	r3, [sp, #108]	; 0x6c
	ldr	r2, [sp, #36]	; 0x24
	ldr	sl, [sp, #8]
	subs	r7, r2, r3
	add	r3, fp, r3, lsl #3
	str	r3, [sp, #8]
	ldr	r3, [sp, #28]
	str	r3, [sp, #48]	; 0x30
lab157: 	cmp	r3, #0
	ble	lab92
	ldr	r3, [sp, #64]	; 0x40
	str	sl, [sp, #20]
	subs	r6, r3, #1
	mov	r4, r9
	mov	sl, r6
	mov	r6, r9
	ldr	r9, [sp, #16]
	movs	r5, #0
	add	r8, sp, #216	; 0xd8
lab95: 	add	r2, fp, r4, lsl #3
	mov	r0, r5
	add	r3, sp, #248	; 0xf8
	beq	lab93
	ldr	r1, [fp, r4, lsl #3]
	ldr	r2, [r2, #8]
	cmp	r1, r2
	blt	lab93
	ble	lab94
lab93: 	strd	r6, r4, [sp, #216]	; 0xd8
	mov	r6, #512	; 0x200
	ldmia	r8, {r1, r2}
	str	r6, [sp, #0]
	bl	Rotate.constprop.0
	subs	r6, r4, r5
	adds	r5, #1
lab94: 	cmp	r5, r9
	add	r4, r4, #1
	blt	lab95
	ldr	sl, [sp, #20]
lab92: 	ldr	r3, [sp, #28]
	ldr	r2, [sp, #36]	; 0x24
	str	r3, [sp, #128]	; 0x80
	ldr	r3, [sp, #104]	; 0x68
	str	r3, [sp, #84]	; 0x54
	sub	r9, r3, r2
	ldr	r3, [sp, #64]	; 0x40
	str	r3, [sp, #132]	; 0x84
	ldr	r3, [sp, #108]	; 0x6c
	str	r3, [sp, #28]
	b	lab96
lab43: 	adds	r5, #25
	add	lr, lr, #25
	add	ip, ip, #25
	b	lab47
lab54: 	ldr	r1, [sp, #28]
	ldr	r3, [sp, #44]	; 0x2c
	add	r2, fp, r1, lsl #3
	add	ip, fp, #4
	subs	r4, r3, r1
	adds	r2, #4
	add	ip, ip, r8, lsl #3
	mov	lr, r4, lsl #3
lab97: 	ldr	r7, [r2, #-4]
	ldr	r6, [r3], #-4
	add	r1, r3, lr
	ldmia	r1, {r0, r1}
	stmia	r3, {r0, r1}
	str	r7, [r3, r4, lsl #3]
	str	r6, [r2, r4, lsl #3]
	adds	r2, #8
	cmp	ip, r2
	bne	lab97
	b	lab98
lab74: 	ldr	r3, [sp, #8]
	add	r7, sl, r3
	b	lab99
lab88: 	ldr	r3, [sp, #64]	; 0x40
	ldr	r2, [sp, #36]	; 0x24
	subs	r3, #2
	cmp	r2, r3
	bgt	lab100
	ldr	r6, [sp, #116]	; 0x74
	movs	r0, #1
	subs	r4, r2, #1
lab104: 	ldr	r1, [fp, r3, lsl #3]
	ldr	r2, [r2, #8]
	cmp	r2, r1
	add	r5, r0, #1
	bgt	lab101
	bge	lab102
lab101: 	cmp	r6, r0
	beq	lab103
	mov	r0, r5
lab102: 	subs	r3, #1
	cmp	r3, r4
	mov	r9, r4
	bne	lab104
lab166: 	cmp	r2, r0
	add	r3, r0, r9
	beq	lab105
lab156: lab131: 	str	sl, [sp, #16]
	subs	r6, r3, #1
	mov	r9, r6
	ldr	r6, [sp, #12]
	ldr	r5, [sp, #28]
	add	r8, sp, #232	; 0xe8
	mov	sl, r3
	cmp	r6, r9
	strd	r6, sl, [sp, #168]	; 0xa8
	mov	r7, #512	; 0x200
	str	r8, [sp, #8]
	bge	lab107
lab116: 	mov	r4, r6
	mov	r2, r9
lab109: 	add	r3, r4, r3, asr #1
	ldr	r1, [fp, r3, lsl #3]
	cmp	r1, r0
	bge	lab108
	adds	r4, r3, #1
	cmp	r4, r2
	blt	lab109
lab117: 	bne	lab110
	ldr	r3, [sp, #52]	; 0x34
	ldr	r2, [sp, #88]	; 0x58
	ldr	r2, [r3, r2]
	ldr	r3, [fp, r5, lsl #3]
	cmp	r2, r3
	it	lt
	movlt	r4, sl
lab110: 	strd	r5, r4, [sp, #232]	; 0xe8
	ldr	r2, [sp, #8]
	str	r7, [sp, #0]
	ldmia	r2, {r1, r2}
	add	r3, sp, #248	; 0xf8
	subs	r0, r6, r4
	bl	Rotate.constprop.0
	add	ip, r6, #4294967295	; 0xffffffff
	sub	r8, r4, r6
	cmp	r5, ip
	strd	r5, r6, [sp, #160]	; 0xa0
	add	lr, r8, r5
	bge	lab111
	ldr	r0, [fp, lr, lsl #3]
	mov	r2, ip
lab113: 	add	r3, r5, r3, asr #1
	ldr	r1, [fp, r3, lsl #3]
	cmp	r1, r0
	bgt	lab112
	adds	r5, r3, #1
	cmp	r5, r2
	blt	lab113
lab111: 	cmp	r5, ip
	beq	lab114
lab118: 	cmp	r8, #0
	ble	lab115
lab119: 	cmp	r3, #0
	ble	lab115
	mov	r6, r4
	cmp	r6, r9
	strd	r6, sl, [sp, #168]	; 0xa8
	blt	lab116
lab107: 	mov	r4, r6
	b	lab117
lab112: 	cmp	r3, r5
	ble	lab111
	mov	r2, r3
	b	lab113
lab108: 	cmp	r3, r4
	ble	lab117
	mov	r2, r3
	b	lab109
lab114: 	ldr	r2, [fp, lr, lsl #3]
	ldr	r3, [fp, r5, lsl #3]
	cmp	r2, r3
	blt	lab118
	cmp	r8, #0
	mov	r5, r6
	bgt	lab119
lab115: 	ldr	sl, [sp, #16]
	b	lab80
lab87: 	ldr	ip, [sp, #36]	; 0x24
	adds	r2, r4, #1
	cmp	ip, r2
	ble	lab120
	ldr	lr, [sp, #116]	; 0x74
	movs	r0, #0
lab124: 	ldr	r1, [fp, r2, lsl #3]
	ldr	r3, [r3, #-8]
	cmp	r1, r3
	add	r7, r0, #1
	bgt	lab121
	bge	lab122
lab121: 	cmp	lr, r0
	mov	r0, r7
	beq	lab123
lab122: 	adds	r2, #1
	cmp	ip, r2
	bne	lab124
lab123: 	ldr	r3, [sp, #112]	; 0x70
	cmp	r3, r0
	beq	lab125
lab120: 	ldr	r3, [sp, #112]	; 0x70
	cmp	r3, r5
	ldr	r3, [sp, #64]	; 0x40
	beq	lab126
	subs	r2, r3, #2
	ldr	r3, [sp, #36]	; 0x24
	cmp	r3, r2
	bgt	lab127
	ldr	r6, [sp, #116]	; 0x74
	movs	r0, #1
	subs	r4, r3, #1
lab130: 	ldr	r1, [fp, r2, lsl #3]
	ldr	r3, [r3, #8]
	cmp	r3, r1
	add	r5, r0, #1
	bgt	lab128
	bge	lab129
lab128: 	cmp	r6, r0
	beq	lab127
	mov	r0, r5
lab129: 	subs	r2, #1
	cmp	r2, r4
	mov	r3, r4
	bne	lab130
lab159: 	subs	r3, #1
	cmp	r2, r3
	bgt	lab131
	ldr	r6, [sp, #116]	; 0x74
	movs	r0, #0
	subs	r4, r2, #1
lab135: 	ldr	r1, [fp, r3, lsl #3]
	ldr	r2, [r2, #8]
	cmp	r2, r1
	add	r5, r0, #1
	bgt	lab132
	bge	lab133
lab132: 	cmp	r6, r0
	beq	lab134
	mov	r0, r5
lab133: 	subs	r3, #1
	cmp	r3, r4
	mov	r9, r4
	bne	lab135
	ldr	r3, [sp, #112]	; 0x70
	cmp	r3, r0
	bne	lab131
lab158: 	ldr	r3, [sp, #116]	; 0x74
	ldr	r2, [sp, #64]	; 0x40
	ldr	r1, [sp, #36]	; 0x24
	mvns	r3, r3
	adds	r2, r3, r2
	ldr	r3, [sp, #144]	; 0x90
	str	r2, [sp, #48]	; 0x30
	subs	r3, #2
	add	r3, r1
	str	r3, [sp, #44]	; 0x2c
	ldr	r3, [sp, #140]	; 0x8c
	str	r2, [sp, #120]	; 0x78
	add	r3, r9
	b	lab136
lab78: 	ldr	r3, [sp, #44]	; 0x2c
	adds	r5, r3, #1
	ldr	r3, [sp, #120]	; 0x78
	cmp	r3, r5
	ble	lab137
	ldr	r6, [sp, #44]	; 0x2c
	mov	ip, r3
lab141: 	ldr	r4, [fp, r5, lsl #3]
	ldr	r7, [r3, #4]
	mov	r2, r5
	b	lab138
lab140: 	cmp	r6, r2
	stmia	r3, {r0, r1}
	bge	lab139
lab138: 	add	r3, fp, r2, lsl #3
	subs	r2, #1
	ldr	r1, [r3, #-8]
	cmp	r1, r4
	bgt	lab140
	adds	r5, #1
	cmp	ip, r5
	strd	r4, r7, [r3]
	bgt	lab141
lab137: 	ldr	r3, [sp, #108]	; 0x6c
	ldr	r2, [sp, #128]	; 0x80
	subs	r3, r3, r2
	cmp	r3, #0
	ble	lab142
	ldr	ip, [sp, #108]	; 0x6c
	mov	r6, r2
	mov	r4, ip
	mov	r8, #512	; 0x200
	add	r7, sp, #184	; 0xb8
lab145: 	cmp	r3, r4
	beq	lab143
lab151: 	ldr	r2, [fp, r4, lsl #3]
	cmp	r1, r2
	sub	r5, r4, ip
	sub	r0, ip, r4
	add	r3, sp, #248	; 0xf8
	sub	lr, ip, r6
	ble	lab144
	cmp	lr, #0
	add	r4, r4, #1
	bgt	lab145
lab142: 	ldr	r3, [sp, #132]	; 0x84
	ldr	r2, [sp, #104]	; 0x68
	subs	r3, r3, r2
	cmp	r3, #0
	ble	lab146
	ldrd	r9, r7, [sp, #128]	; 0x80
	mov	r6, r2
	mvn	r4, #3758096384	; 0xe0000000
	add	r5, sp, #176	; 0xb0
lab153: 	add	r0, r6, r4
	add	r1, r7, r4
	beq	lab147
lab149: 	ldr	r1, [fp, r1, lsl #3]
	cmp	r0, r1
	sub	r8, r2, r6
	mov	ip, #512	; 0x200
	add	r3, sp, #248	; 0xf8
	sub	lr, r7, r2
	ble	lab148
	cmp	lr, #0
	add	r6, r6, #4294967295	; 0xffffffff
	ble	lab146
	cmp	r9, r6
	add	r0, r6, r4
	add	r1, r7, r4
	bne	lab149
lab147: 	mov	r8, r7
	mov	r7, r6
	strd	r7, r8, [sp, #176]	; 0xb0
	mov	r5, #512	; 0x200
	subs	r6, r2, r6
	str	r5, [sp, #0]
	add	r4, sp, #176	; 0xb0
	ldmia	r4, {r1, r2}
	add	r3, sp, #248	; 0xf8
	mov	r0, r6
	bl	Rotate.constprop.0
	adds	r6, #1
	mov	r2, r8
	subs	r6, r2, r6
	subs	r3, r6, r7
	cmp	r3, #0
	ble	lab146
lab150: 	add	r3, sp, #248	; 0xf8
	ldmia	r4, {r1, r2}
	movs	r0, #0
	str	r5, [sp, #0]
	subs	r6, #1
	bl	Rotate.constprop.0
	subs	r3, r6, r7
	cmp	r3, #0
	bgt	lab150
	b	lab146
lab139: 	adds	r5, #1
	add	r3, fp, r2, lsl #3
	cmp	ip, r5
	strd	r4, r7, [r3]
	bgt	lab141
	b	lab137
lab144: 	strd	r6, r4, [sp, #184]	; 0xb8
	adds	r5, #1
	ldmia	r7, {r1, r2}
	add	r6, r5
	str	r8, [sp]
	bl	Rotate.constprop.0
	subs	r3, r4, r6
	cmp	r3, #0
	ble	lab142
	ldr	r3, [sp, #104]	; 0x68
	cmp	r3, r4
	mov	ip, r4
	bne	lab151
lab143: 	strd	r6, r3, [sp, #184]	; 0xb8
	mov	r2, ip
	mov	r8, #512	; 0x200
	subs	r5, r3, r2
	subs	r0, r2, r3
	str	r8, [sp]
	add	r2, sp, #248	; 0xf8
	add	r7, sp, #184	; 0xb8
	mov	r3, r2
	ldmia	r7, {r1, r2}
	bl	Rotate.constprop.0
	adds	r5, #1
	ldr	r3, [sp, #104]	; 0x68
	add	r6, r5
	subs	r3, r3, r6
	cmp	r3, #0
	ble	lab142
lab152: 	str	r8, [sp]
	add	r3, sp, #248	; 0xf8
	ldmia	r7, {r1, r2}
	adds	r6, #1
	movs	r0, #0
	bl	Rotate.constprop.0
	subs	r3, r4, r6
	cmp	r3, #0
	bgt	lab152
	b	lab142
lab148: 	strd	r6, r7, [sp, #176]	; 0xb0
	str	ip, [sp]
	mov	r0, r8
	add	r8, r8, #1
	ldmia	r5, {r1, r2}
	sub	r7, r7, r8
	bl	Rotate.constprop.0
	subs	r3, r7, r6
	cmp	r3, #0
	ble	lab146
	mov	r2, r6
	b	lab153
lab125: 	ldr	r3, [sp, #140]	; 0x8c
	ldr	r0, [sp, #68]	; 0x44
	adds	r1, r3, r6
	str	r1, [sp, #120]	; 0x78
	ldr	r1, [sp, #116]	; 0x74
	cmp	r3, #0
	add	r1, r0
	str	r1, [sp, #80]	; 0x50
	ble	lab154
	mov	r5, r3
	ldr	r3, [sp, #120]	; 0x78
	str	r3, [sp, #108]	; 0x6c
	ldr	r3, [sp, #112]	; 0x70
	str	r3, [sp, #92]	; 0x5c
	ldr	r3, [sp, #80]	; 0x50
	ldr	r9, [sp, #64]	; 0x40
	str	r3, [sp, #44]	; 0x2c
	movs	r3, #0
	str	r9, [sp, #104]	; 0x68
	mov	r4, r2
	str	r3, [sp, #16]
	b	lab155
lab103: 	ldr	r2, [sp, #112]	; 0x70
	mov	r0, r5
	mov	r9, r3
	cmp	r2, r0
	add	r3, r0, r9
	bne	lab156
lab105: 	mov	r1, r2
	ldr	r2, [sp, #64]	; 0x40
	subs	r2, r2, r1
	str	r2, [sp, #48]	; 0x30
	ldr	r2, [sp, #28]
	str	r2, [sp, #120]	; 0x78
	str	r2, [sp, #44]	; 0x2c
lab136: 	ldr	r2, [sp, #64]	; 0x40
	str	r2, [sp, #80]	; 0x50
lab167: 	ldr	r3, [sp, #64]	; 0x40
	ldr	r7, [sp, #100]	; 0x64
	str	r2, [sp, #16]
	subs	r3, r3, r2
	str	r3, [sp, #104]	; 0x68
	ldr	r3, [sp, #28]
	str	r0, [sp, #92]	; 0x5c
	str	r3, [sp, #108]	; 0x6c
	b	lab157
lab134: 	mov	r9, r3
	ldr	r3, [sp, #112]	; 0x70
	mov	r0, r5
	cmp	r3, r0
	bne	lab131
	b	lab158
lab127: 	mov	r3, r2
	b	lab159
lab126: 	ldr	r2, [sp, #36]	; 0x24
	subs	r3, #2
	cmp	r2, r3
	bgt	lab131
	ldr	ip, [sp, #116]	; 0x74
	movs	r0, #1
	subs	r6, r2, #1
lab163: 	ldr	r1, [fp, r3, lsl #3]
	ldr	r7, [r2, #8]
	cmp	r7, r1
	add	r2, r0, #1
	bgt	lab160
	bge	lab161
lab160: 	cmp	ip, r0
	beq	lab162
	mov	r0, r2
lab161: 	subs	r3, #1
	cmp	r3, r6
	mov	r9, r6
	bne	lab163
	cmp	r5, r0
	bne	lab131
lab165: 	ldr	r3, [sp, #28]
	str	r5, [sp, #16]
	adds	r3, r5, r3
	subs	r2, r1, r5
	str	r3, [sp, #80]	; 0x50
	str	r2, [sp, #44]	; 0x2c
	str	r2, [sp, #104]	; 0x68
	str	r3, [sp, #108]	; 0x6c
	str	r1, [sp, #120]	; 0x78
	b	lab164
lab162: 	mov	r0, r2
	cmp	r5, r0
	mov	r9, r3
	bne	lab131
	b	lab165
lab100: 	mov	r9, r3
	movs	r0, #1
	b	lab166
lab154: 	ldr	r3, [sp, #120]	; 0x78
	ldr	r2, [sp, #36]	; 0x24
	subs	r7, r2, r3
	add	r2, fp, r3, lsl #3
	str	r2, [sp, #8]
	ldr	r2, [sp, #112]	; 0x70
	str	r2, [sp, #92]	; 0x5c
	ldr	r2, [sp, #64]	; 0x40
	strd	r2, r3, [sp, #104]	; 0x68
	ldr	r3, [sp, #80]	; 0x50
	str	r3, [sp, #44]	; 0x2c
	ldr	r3, [sp, #28]
	str	r3, [sp, #48]	; 0x30
	b	lab92
lab106: 	ldr	r2, [sp, #28]
	str	r3, [sp, #80]	; 0x50
	str	r2, [sp, #44]	; 0x2c
	str	r2, [sp, #120]	; 0x78
	str	r9, [sp, #48]	; 0x30
	b	lab167
benchmark_body.constprop.0:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, [pc, #84]	; (8001344 <benchmark_body.constprop.0+0x5c>)
	ldmia	r5!, {r0, r1, r2, r3}
	sub	sp, #44	; 0x2c
	add	r4, sp, #4
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [r5, #0]
	ldr	r5, [pc, #72]	; (8001348 <benchmark_body.constprop.0+0x60>)
	str	r3, [r4, #0]
	mov	r8, #168	; 0xa8
	mov	r9, r4
lab170: 	bl	srand_beebs
	mov	r7, sp
lab169: 	movs	r4, #0
lab168: 	mov	r1, #400	; 0x190
	blx	r6
	add	r3, r5, r4, lsl #3
	str	r0, [r5, r4, lsl #3]
	str	r4, [r3, #4]
	adds	r4, #1
	cmp	r4, #400	; 0x190
	bne	lab168
	bl	WikiSort.constprop.0
	cmp	r7, r9
	bne	lab169
	subs	r8, r8, #1
	bne	lab170
	mov	r0, r8
	add	sp, #44	; 0x2c
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, pc}
	.word	0x08002de4
	.word	0x20000004
benchmark_body.isra.0:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r5, [pc, #92]	; (80013b0 <benchmark_body.isra.0+0x64>)
	mov	r9, r0
	ldmia	r5!, {r0, r1, r2, r3}
	sub	sp, #40	; 0x28
	add	r4, sp, #4
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	cmp	r9, #0
	ldr	r3, [r5, #0]
	str	r3, [r4, #0]
	ble	lab171
	ldr	r5, [pc, #72]	; (80013b4 <benchmark_body.isra.0+0x68>)
	mov	sl, #0
	mov	r8, r4
lab174: 	bl	srand_beebs
	mov	r7, sp
lab173: 	movs	r4, #0
lab172: 	mov	r1, #400	; 0x190
	blx	r6
	add	r3, r5, r4, lsl #3
	str	r0, [r5, r4, lsl #3]
	str	r4, [r3, #4]
	adds	r4, #1
	cmp	r4, #400	; 0x190
	bne	lab172
	bl	WikiSort.constprop.0
	cmp	r7, r8
	bne	lab173
	add	sl, sl, #1
	cmp	sl, r9
	bne	lab174
lab171: 	add	sp, #40	; 0x28
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
	.word	0x08002de4
	.word	0x20000004
Rotate.constprop.1:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	sub	sp, #8
	add	r4, sp, #8
	cmp	r3, r2
	stmdb	r4, {r2, r3}
	ldr	sl, [sp, #40]	; 0x28
	beq	lab175
	cmp	r1, #0
	ite	lt
	addlt	r5, r1, r3
	addge	r5, r1, r2
	mov	r9, r1
	sub	r8, r3, r5
	it	lt
	sublt	r9, r5, r2
	cmp	r8, r9
	mov	r7, r2
	mov	r6, r3
	mov	r4, r0
	bge	lab176
	cmp	r8, #512	; 0x200
	ble	lab177
lab183: 	cmp	r9, #1
	mov	r2, r2, asr #1
	ble	lab178
	subs	r3, r5, r2
	add	r3, r4, r3, lsl #3
	add	r2, r7
	add	r9, r4, #4
	add	r2, r4, r2, lsl #3
	adds	r3, #4
	add	r9, r9, r5, lsl #3
lab179: 	ldmia	r1, {r0, r1}
	ldrd	lr, ip, [r2, #-8]
	subs	r2, #8
	stmia	r2, {r0, r1}
	str	lr, [r3, #-4]
	str	ip, [r3], #8
	cmp	r9, r3
	bne	lab179
lab178: 	add	r3, r8, r8, lsr #31
	cmp	r8, #1
	mov	r3, r3, asr #1
	ble	lab180
	adds	r2, r5, r3
	subs	r5, r6, r3
	add	r5, r4, r5, lsl #3
	add	lr, r4, r6, lsl #3
	add	r2, r4, r2, lsl #3
	adds	r5, #4
	add	lr, lr, #4
lab181: 	ldmia	r3, {r0, r1}
	ldrd	ip, r3, [r2, #-8]
	subs	r2, #8
	stmia	r2, {r0, r1}
	str	ip, [r5, #-4]
	str	r3, [r5], #8
	cmp	lr, r5
	bne	lab181
lab180: 	subs	r2, r6, r7
	add	r3, r2, r2, lsr #31
	cmp	r2, #1
	mov	r3, r3, asr #1
	ble	lab175
	subs	r2, r6, r3
	add	r2, r4, r2, lsl #3
	add	r3, r7
	add	r6, r4, r6, lsl #3
	add	r3, r4, r3, lsl #3
	adds	r2, #4
	adds	r6, #4
lab182: 	ldmia	r1, {r0, r1}
	ldrd	r5, r4, [r3, #-8]
	subs	r3, #8
	stmia	r3, {r0, r1}
	str	r5, [r2, #-4]
	str	r4, [r2], #8
	cmp	r6, r2
	bne	lab182
lab175: 	add	sp, #8
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
lab176: 	cmp	r9, #512	; 0x200
	bgt	lab183
	add	r6, r0, r2, lsl #3
	mov	r9, r9, lsl #3
	mov	r2, r9
	mov	r1, r6
	mov	r0, sl
	bl	memcpy
	add	r1, r4, r5, lsl #3
	mov	r2, r8, lsl #3
	mov	r0, r6
	bl	memmove
	add	r0, r8, r7
	mov	r2, r9
	mov	r1, sl
	add	r0, r4, r0, lsl #3
lab184: 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	memcpy
lab177: 	mov	r8, r8, lsl #3
	add	r7, r0, r2, lsl #3
	add	r1, r0, r5, lsl #3
	mov	r2, r8
	mov	r0, sl
	bl	memcpy
	sub	r0, r6, r9
	mov	r2, r9, lsl #3
	mov	r1, r7
	add	r0, r4, r0, lsl #3
	bl	memmove
	mov	r2, r8
	mov	r1, sl
	mov	r0, r7
	b	lab184
	nop
Min:
	cmp	r0, r1
	it	ge
	movge	r0, r1
	bx	lr
Max:
	cmp	r0, r1
	it	lt
	movlt	r0, r1
	bx	lr
Range_length:
	sub	sp, #8
	add	r3, sp, #8
	stmdb	r3, {r0, r1}
	ldr	r3, [sp, #0]
	subs	r0, r1, r3
	add	sp, #8
	bx	lr
MakeRange:
	strd	r1, r2, [r0]
	bx	lr
	nop
FloorPowerOfTwo:
	orr	r0, r0, r0, asr #1
	orr	r0, r0, r0, asr #2
	orr	r0, r0, r0, asr #4
	orr	r0, r0, r0, asr #8
	orr	r0, r0, r0, asr #16
	sub	r0, r0, r0, asr #1
	bx	lr
	nop
BinaryFirst:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	sl, r3, #4294967295	; 0xffffffff
	sub	sp, #12
	add	r4, sp, #8
	cmp	r2, sl
	stmdb	r4, {r2, r3}
	ldr	r9, [sp, #48]	; 0x30
	mov	r5, r2
	mov	r8, r0
	mov	fp, r1
	bge	lab185
	add	r6, r0, r1, lsl #3
	mov	r7, sl
lab187: 	add	r4, r5, r4, asr #1
	add	r1, r8, r4, lsl #3
	ldmia	r6, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r9
	cbz	r0, lab186
	adds	r5, r4, #1
	cmp	r5, r7
	blt	lab187
lab185: 	cmp	sl, r5
	beq	lab188
lab189: 	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab186: 	cmp	r4, r5
	ble	lab185
	mov	r7, r4
	b	lab187
lab188: 	add	fp, r8, fp, lsl #3
	add	r8, r8, r5, lsl #3
	ldmia	fp, {r2, r3}
	ldmia	r8, {r0, r1}
	blx	r9
	cmp	r0, #0
	beq	lab189
	adds	r5, #1
	mov	r0, r5
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
	nop
BinaryLast:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	sl, r3, #4294967295	; 0xffffffff
	sub	sp, #12
	add	r4, sp, #8
	cmp	r2, sl
	stmdb	r4, {r2, r3}
	ldr	r9, [sp, #48]	; 0x30
	mov	r5, r2
	mov	r8, r0
	mov	fp, r1
	bge	lab190
	add	r6, r0, r1, lsl #3
	mov	r7, sl
lab192: 	add	r4, r5, r4, asr #1
	add	r3, r8, r4, lsl #3
	ldmia	r3, {r2, r3}
	ldmia	r6, {r0, r1}
	blx	r9
	cbnz	r0, lab191
	adds	r5, r4, #1
	cmp	r5, r7
	blt	lab192
lab190: 	cmp	sl, r5
	beq	lab193
lab194: 	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab191: 	cmp	r4, r5
	ble	lab190
	mov	r7, r4
	b	lab192
lab193: 	add	r3, r8, r5, lsl #3
	add	r8, r8, fp, lsl #3
	ldmia	r8, {r0, r1}
	ldmia	r3, {r2, r3}
	blx	r9
	cmp	r0, #0
	bne	lab194
	adds	r5, #1
	mov	r0, r5
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
InsertionSort:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	r9, r1, #1
	sub	sp, #28
	add	r4, sp, #8
	cmp	r2, r9
	stmia	r4, {r1, r2}
	str	r0, [sp, #4]
	ble	lab195
	mov	r8, r1
	mov	fp, r2
	mov	r7, r3
	add	r4, r0, r1, lsl #3
	add	r6, sp, #16
lab199: 	ldmia	sl, {r0, r1}
	mov	r5, r9
	stmia	r6, {r0, r1}
	b	lab196
lab198: 	subs	r5, #1
	cmp	r8, r5
	stmia	r3, {r0, r1}
	sub	r4, r4, #8
	bge	lab197
lab196: 	ldmia	r4, {r2, r3}
	ldmia	r6, {r0, r1}
	blx	r7
	add	r3, r4, #8
	cmp	r0, #0
	bne	lab198
lab197: 	ldmia	r6, {r0, r1}
	ldr	r3, [sp, #4]
	add	r9, r9, #1
	add	r5, r3, r5, lsl #3
	cmp	fp, r9
	stmia	r5, {r0, r1}
	mov	r4, sl
	bgt	lab199
lab195: 	add	sp, #28
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
Reverse:
	push	{r4, r5}
	sub	sp, #8
	add	r3, sp, #8
	mov	r4, r1
	stmdb	r3, {r1, r2}
	mov	r1, r2
	subs	r2, r2, r4
	cmp	r2, #1
	add	r3, r2, r2, lsr #31
	ble	lab200
	asrs	r3, r3, #1
	subs	r2, r1, r3
	add	r2, r0, r2, lsl #3
	add	r3, r4
	add	ip, r0, r1, lsl #3
	add	r3, r0, r3, lsl #3
	adds	r2, #4
	add	ip, ip, #4
lab201: 	ldmia	r1, {r0, r1}
	ldrd	r5, r4, [r3, #-8]
	subs	r3, #8
	stmia	r3, {r0, r1}
	str	r5, [r2, #-4]
	str	r4, [r2], #8
	cmp	r2, ip
	bne	lab201
lab200: 	add	sp, #8
	pop	{r4, r5}
	bx	lr
BlockSwap:
	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
	subs	r6, r3, #0
	ble	lab202
	add	lr, r0, r2, lsl #3
	add	r3, r0, r1, lsl #3
	add	r8, r3, #4
	add	r7, lr, #4
	movs	r2, #0
lab203: 	ldmia	r1, {r0, r1}
	ldr	r5, [r3, r2, lsl #3]
	ldr	r4, [r8, r2, lsl #3]
	add	ip, r3, r2, lsl #3
	stmia	ip, {r0, r1}
	str	r5, [lr, r2, lsl #3]
	str	r4, [r7, r2, lsl #3]
	adds	r2, #1
	cmp	r6, r2
	bne	lab203
lab202: 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
	nop
Rotate:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	mov	r6, r3
	sub	sp, #8
	add	r4, sp, #8
	cmp	r6, r2
	stmdb	r4, {r2, r3}
	ldrd	sl, r3, [sp, #40]	; 0x28
	beq	lab204
	cmp	r1, #0
	ite	lt
	addlt	r5, r1, r6
	addge	r5, r1, r2
	mov	r9, r1
	sub	r8, r6, r5
	it	lt
	sublt	r9, r5, r2
	cmp	r8, r9
	mov	r7, r2
	mov	r4, r0
	bge	lab205
	cmp	r3, r8
	bge	lab206
lab212: 	cmp	r9, #1
	mov	r2, r2, asr #1
	ble	lab207
	subs	r3, r5, r2
	add	r3, r4, r3, lsl #3
	add	r2, r7
	add	r9, r4, #4
	add	r2, r4, r2, lsl #3
	adds	r3, #4
	add	r9, r9, r5, lsl #3
lab208: 	ldmia	r1, {r0, r1}
	ldrd	lr, ip, [r2, #-8]
	subs	r2, #8
	stmia	r2, {r0, r1}
	str	lr, [r3, #-4]
	str	ip, [r3], #8
	cmp	r9, r3
	bne	lab208
lab207: 	add	r3, r8, r8, lsr #31
	cmp	r8, #1
	mov	r3, r3, asr #1
	ble	lab209
	adds	r2, r5, r3
	subs	r5, r6, r3
	add	r5, r4, r5, lsl #3
	add	lr, r4, r6, lsl #3
	add	r2, r4, r2, lsl #3
	adds	r5, #4
	add	lr, lr, #4
lab210: 	ldmia	r3, {r0, r1}
	ldrd	ip, r3, [r2, #-8]
	subs	r2, #8
	stmia	r2, {r0, r1}
	str	ip, [r5, #-4]
	str	r3, [r5], #8
	cmp	lr, r5
	bne	lab210
lab209: 	subs	r2, r6, r7
	add	r3, r2, r2, lsr #31
	cmp	r2, #1
	mov	r3, r3, asr #1
	ble	lab204
	subs	r2, r6, r3
	add	r2, r4, r2, lsl #3
	add	r3, r7
	add	r6, r4, r6, lsl #3
	add	r3, r4, r3, lsl #3
	adds	r2, #4
	adds	r6, #4
lab211: 	ldmia	r1, {r0, r1}
	ldrd	r5, r4, [r3, #-8]
	subs	r3, #8
	stmia	r3, {r0, r1}
	str	r5, [r2, #-4]
	str	r4, [r2], #8
	cmp	r6, r2
	bne	lab211
lab204: 	add	sp, #8
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
lab205: 	cmp	r3, r9
	blt	lab212
	add	r6, r0, r2, lsl #3
	mov	r9, r9, lsl #3
	mov	r2, r9
	mov	r1, r6
	mov	r0, sl
	bl	memcpy
	add	r1, r4, r5, lsl #3
	mov	r2, r8, lsl #3
	mov	r0, r6
	bl	memmove
	add	r0, r8, r7
	mov	r2, r9
	mov	r1, sl
	add	r0, r4, r0, lsl #3
lab213: 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	memcpy
lab206: 	mov	r8, r8, lsl #3
	add	r7, r0, r2, lsl #3
	add	r1, r0, r5, lsl #3
	mov	r2, r8
	mov	r0, sl
	bl	memcpy
	sub	r0, r6, r9
	mov	r2, r9, lsl #3
	mov	r1, r7
	add	r0, r4, r0, lsl #3
	bl	memmove
	mov	r2, r8
	mov	r1, sl
	mov	r0, r7
	b	lab213
	nop
WikiMerge:
	sub	sp, #8
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, #44	; 0x2c
	add	r4, sp, #40	; 0x28
	stmdb	r4, {r1, r2}
	str	r3, [sp, #84]	; 0x54
	mov	r1, r3
	str	r3, [sp, #24]
	ldr	r3, [sp, #88]	; 0x58
	ldr	r5, [sp, #108]	; 0x6c
	ldr	ip, [sp, #100]	; 0x64
	ldr	r6, [sp, #104]	; 0x68
	ldr	r2, [sp, #96]	; 0x60
	str	ip, [sp, #8]
	sub	r8, r3, r1
	mov	r4, r0
	cmp	r5, r8
	ldr	r0, [sp, #92]	; 0x5c
	str	r0, [sp, #12]
	blt	lab214
	add	r3, r4, r1, lsl #3
	subs	r1, r2, r0
	cmp	r1, #0
	add	sl, r6, r8, lsl #3
	ble	lab215
	cmp	r8, #0
	ble	lab215
	add	r7, r4, r0, lsl #3
	add	r4, r4, r2, lsl #3
	mov	r8, r4
	add	r5, r3, #8
	mov	r4, ip
	b	lab216
lab217: 	adds	r6, #8
	cmp	sl, r6
	stmdb	r5, {r0, r1}
	beq	lab215
lab218: lab216: 	ldmia	r6, {r2, r3}
	ldmia	r7, {r0, r1}
	blx	r4
	mov	r3, r5
	cmp	r0, #0
	beq	lab217
	ldmia	r7, {r0, r1}
	adds	r7, #8
	cmp	r8, r7
	stmdb	r5, {r0, r1}
	bne	lab218
lab215: 	sub	r2, sl, r6
	mov	r1, r6
	mov	r0, r3
	add	sp, #44	; 0x2c
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	sp, #8
	b	memcpy
lab214: 	subs	r3, r2, r0
	ldr	r9, [sp, #32]
	str	r3, [sp, #20]
	cmp	r3, #0
	str	r9, [sp, #16]
	ble	lab219
	cmp	r8, #0
	ble	lab220
	ldr	r3, [sp, #24]
	str	r8, [sp, #28]
	add	r7, r4, r3, lsl #3
	mov	fp, #0
	movs	r3, #1
	adds	r7, #4
	str	r3, [sp, #4]
	mov	sl, fp
	mov	r8, r0
	b	lab221
lab223: 	ldmia	r6, {r0, r1}
	ldr	r2, [r3], #-4
	ldr	r5, [r7, #-4]
	stmia	r3, {r0, r1}
	ldr	r3, [sp, #28]
	str	r5, [r4, r9, lsl #3]
	add	sl, sl, #1
	cmp	sl, r3
	str	r2, [r6, #4]
	bge	lab222
	ldr	r3, [sp, #16]
	add	r9, sl, r3
lab225: 	adds	r3, #1
	str	r3, [sp, #4]
	adds	r7, #8
lab221: 	add	r5, r4, r8, lsl #3
	add	r6, r4, r9, lsl #3
	ldmia	r5, {r0, r1}
	ldmia	r6, {r2, r3}
	ldr	ip, [sp, #8]
	blx	ip
	cmp	r0, #0
	beq	lab223
	mov	r3, r7
	ldmia	r5, {r0, r1}
	ldr	r2, [r3], #-4
	ldr	r6, [r7, #-4]
	stmia	r3, {r0, r1}
	ldr	r3, [sp, #20]
	str	r6, [r4, r8, lsl #3]
	add	fp, fp, #1
	cmp	fp, r3
	str	r2, [r5, #4]
	bge	lab224
	ldr	r3, [sp, #12]
	add	r8, fp, r3
	b	lab225
lab224: 	ldrd	r3, r8, [sp, #24]
	ldr	r2, [sp, #4]
	str	r9, [sp, #16]
	add	r3, r2
	str	r3, [sp, #24]
	sub	r8, r8, sl
lab219: 	cmp	r8, #0
	ble	lab220
	ldr	r3, [sp, #16]
	add	r5, r4, r3, lsl #3
	ldr	r3, [sp, #24]
	add	r4, r4, r3, lsl #3
	add	lr, r5, #4
	add	ip, r4, #4
	movs	r2, #0
lab226: 	ldmia	r3, {r0, r1}
	ldr	r7, [r5, r2, lsl #3]
	ldr	r6, [lr, r2, lsl #3]
	add	r3, r5, r2, lsl #3
	stmia	r3, {r0, r1}
	str	r7, [r4, r2, lsl #3]
	str	r6, [ip, r2, lsl #3]
	adds	r2, #1
	cmp	r2, r8
	bne	lab226
lab220: 	add	sp, #44	; 0x2c
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	sp, #8
	bx	lr
lab222: 	mov	r8, r3
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #24]
	add	r3, r2
	str	r3, [sp, #24]
	ldr	r3, [sp, #16]
	add	r3, sl
	str	r3, [sp, #16]
	sub	r8, r8, sl
	b	lab219
	nop
WikiSort:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #4352	; 0x1100
	sub	sp, #28
	cmp	r1, #32
	str	r1, [sp, #104]	; 0x68
	str	r2, [sp, #24]
	ble	lab227
	orr	r3, r1, r1, asr #1
	orr	r3, r3, r3, asr #2
	orr	r3, r3, r3, asr #4
	orr	r3, r3, r3, asr #8
	orr	r3, r3, r3, asr #16
	sub	r2, r3, r3, asr #1
	cmp	r2, #0
	mov	r3, r2
	ldr	r1, [sp, #104]	; 0x68
	str	r2, [sp, #152]	; 0x98
	it	lt
	addlt	r3, r2, #15
	asrs	r3, r3, #4
	movs	r2, #0
	sdiv	r7, r1, r3
	mov	r5, r2
	mls	fp, r3, r7, r1
	mov	r9, r3
	ldr	sl, [sp, #24]
	str	r3, [sp, #84]	; 0x54
	add	r5, fp
	cmp	r9, r5
	mov	r6, r0
	str	fp, [sp, #80]	; 0x50
	str	r7, [sp, #68]	; 0x44
	add	r8, sp, #208	; 0xd0
	mov	r3, sl
	add	r4, r7, r2
	bgt	lab228
lab230: 	strd	r2, r4, [sp, #208]	; 0xd0
	mov	r0, r6
	ldmia	r8, {r1, r2}
	bl	InsertionSort
	ldr	r3, [sp, #104]	; 0x68
	cmp	r3, r4
	sub	r5, r5, r9
	ble	lab229
lab231: 	mov	r2, r4
	cmp	r9, r5
	mov	r3, sl
	add	r4, r7, r2
	ble	lab230
lab228: 	strd	r2, r4, [sp, #208]	; 0xd0
	mov	r0, r6
	ldmia	r8, {r1, r2}
	bl	InsertionSort
	ldr	r3, [sp, #104]	; 0x68
	cmp	r3, r4
	bgt	lab231
lab229: 	ldr	r3, [sp, #152]	; 0x98
	cmp	r3, #16
	ble	lab232
	movs	r3, #16
	str	r3, [sp, #136]	; 0x88
	mov	r7, r6
lab275: 	mov	r0, r4
	bl	__aeabi_i2d
	bl	sqrt
	bl	__aeabi_d2iz
	sdiv	r3, r4, r0
	str	r3, [sp, #128]	; 0x80
	adds	r3, #1
	str	r3, [sp, #120]	; 0x78
	lsls	r3, r3, #1
	movs	r2, #0
	str	r3, [sp, #148]	; 0x94
	lsls	r3, r0, #3
	str	r2, [sp, #60]	; 0x3c
	str	r3, [sp, #92]	; 0x5c
	str	r2, [sp, #96]	; 0x60
	str	r2, [sp, #140]	; 0x8c
	str	r2, [sp, #132]	; 0x84
	str	r2, [sp, #36]	; 0x24
	str	r2, [sp, #64]	; 0x40
	str	r2, [sp, #116]	; 0x74
	str	r2, [sp, #124]	; 0x7c
	str	r2, [sp, #56]	; 0x38
	str	r2, [sp, #144]	; 0x90
	mov	r9, r0
	mov	r1, r2
lab269: 	ldr	r2, [sp, #80]	; 0x50
	add	r3, r2
	ldr	r2, [sp, #68]	; 0x44
	add	fp, r2, r1
	ldr	r2, [sp, #84]	; 0x54
	ldr	r1, [sp, #84]	; 0x54
	cmp	r2, r3
	it	le
	suble	r3, r3, r2
	ldr	r2, [sp, #80]	; 0x50
	add	r3, r2
	ldr	r2, [sp, #68]	; 0x44
	str	r3, [sp, #64]	; 0x40
	it	le
	addle	fp, fp, #1
	add	r0, fp, r2
	cmp	r1, r3
	str	r0, [sp, #48]	; 0x30
	bgt	lab233
	subs	r2, r3, r1
	mov	r3, r0
	adds	r3, #1
	str	r2, [sp, #64]	; 0x40
	str	r3, [sp, #48]	; 0x30
lab233: 	ldr	r3, [sp, #48]	; 0x30
	ldr	r2, [sp, #36]	; 0x24
	ldr	r4, [sp, #24]
	add	r3, r3, #536870912	; 0x20000000
	subs	r3, #1
	add	r3, r7, r3, lsl #3
	add	r8, r7, r2, lsl #3
	ldmia	r3, {r0, r1}
	ldmia	r8, {r2, r3}
	blx	r4
	mov	r4, r0
	cmp	r0, #0
	bne	lab234
	add	r1, r7, fp, lsl #3
	ldmdb	r1, {r2, r3}
	ldr	r5, [sp, #24]
	ldmia	r1, {r0, r1}
	blx	r5
	cmp	r0, #0
	beq	lab235
	ldr	r3, [sp, #36]	; 0x24
	sub	r3, fp, r3
	cmp	r3, #512	; 0x200
	str	r3, [sp, #20]
	ble	lab236
	ldr	r3, [sp, #96]	; 0x60
	ldr	r2, [sp, #56]	; 0x38
	subs	r3, r3, r2
	cmp	r3, #0
	str	r3, [sp, #100]	; 0x64
	ble	lab237
	ldr	r3, [sp, #48]	; 0x30
	str	r3, [sp, #88]	; 0x58
lab293: 	sdiv	r3, r2, r9
	mls	lr, r9, r3, r2
	ldr	r3, [sp, #36]	; 0x24
	add	sl, lr, r3
	add	r3, sl, #1
	cmp	fp, r3
	ble	lab238
	ldr	r2, [sp, #56]	; 0x38
	add	r4, r7, r2, lsl #3
	adds	r4, #4
	add	ip, r7, #4
lab239: 	add	r1, r7, r3, lsl #3
	ldmia	r1, {r0, r1}
	ldr	r5, [r2], #-4
	ldr	r6, [r4, #-4]
	stmia	r2, {r0, r1}
	str	r6, [r7, r3, lsl #3]
	str	r5, [ip, r3, lsl #3]
	add	r3, r9
	cmp	fp, r3
	add	r4, r4, #8
	bgt	lab239
lab238: 	add	r3, r7, sl, lsl #3
	ldmia	r3, {r0, r1}
	ldr	r3, [sp, #88]	; 0x58
	sub	r3, r3, fp
	cmp	r3, r9
	ite	le
	addle	r3, fp
	addgt	r3, fp, r9
	str	r3, [sp, #28]
	cmp	lr, #512	; 0x200
	add	r3, sp, #184	; 0xb8
	stmia	r3, {r0, r1}
	bgt	lab240
	mov	r2, lr, lsl #3
	mov	r1, r8
	add	r0, sp, #280	; 0x118
	bl	memcpy
	ldr	r3, [sp, #60]	; 0x3c
	lsls	r3, r3, #3
	str	r3, [sp, #20]
lab295: 	str	sl, [sp, #44]	; 0x2c
	add	r3, r7
	str	r3, [sp, #108]	; 0x6c
	adds	r3, #4
	str	r3, [sp, #112]	; 0x70
	add	r3, sp, #176	; 0xb0
	movs	r5, #0
	str	r3, [sp, #72]	; 0x48
	add	r3, sp, #168	; 0xa8
	str	fp, [sp, #32]
	str	sl, [sp, #20]
	mov	r4, r5
	str	r5, [sp, #52]	; 0x34
	str	r3, [sp, #76]	; 0x4c
	str	fp, [sp, #40]	; 0x28
lab263: 	cmp	r3, #0
	ble	lab241
lab250: 	subs	r3, #1
	add	r3, r7, r3, lsl #3
	ldmia	r3, {r0, r1}
	add	r3, sp, #184	; 0xb8
	ldmia	r3, {r2, r3}
	ldr	r6, [sp, #24]
	blx	r6
	cmp	r0, #0
	bne	lab241
lab251: 	ldr	r3, [sp, #24]
	str	r3, [sp, #0]
	ldr	r3, [sp, #72]	; 0x48
	mov	r1, sl
	ldmia	r3, {r2, r3}
	mov	r0, r7
	bl	BinaryFirst
	cmp	r9, #0
	mov	r4, r0
	sub	r5, r5, r0
	ble	lab242
	ldr	r3, [sp, #20]
	add	sl, r7, sl, lsl #3
	add	r6, r7, r3, lsl #3
	add	fp, r6, #4
	add	r8, sl, #4
	movs	r3, #0
	mov	ip, r0
	mov	lr, r5
lab243: 	ldmia	r2, {r0, r1}
	ldr	r5, [r6, r3, lsl #3]
	ldr	r4, [fp, r3, lsl #3]
	add	r2, r6, r3, lsl #3
	stmia	r2, {r0, r1}
	str	r5, [sl, r3, lsl #3]
	str	r4, [r8, r3, lsl #3]
	adds	r3, #1
	cmp	r9, r3
	bne	lab243
	mov	r4, ip
	mov	r5, lr
lab242: 	ldr	r3, [sp, #36]	; 0x24
	str	r3, [sp, #168]	; 0xa8
	ldr	r3, [sp, #44]	; 0x2c
	str	r3, [sp, #248]	; 0xf8
	str	r3, [sp, #172]	; 0xac
	add	r3, sp, #280	; 0x118
	str	r3, [sp, #12]
	ldr	r3, [sp, #24]
	str	r3, [sp, #8]
	ldrd	r3, r2, [sp, #52]	; 0x34
	add	lr, r3, r2
	ldr	r2, [sp, #20]
	str	r4, [sp, #252]	; 0xfc
	adds	r3, #1
	adds	r6, r2, #1
	str	r3, [sp, #52]	; 0x34
	add	r3, r7, lr, lsl #3
	ldmia	r3, {r0, r1}
	add	ip, r7, r6, lsl #3
	ldr	r8, [r7, r6, lsl #3]
	ldr	r2, [ip, #4]
	stmia	ip, {r0, r1}
	str	r8, [r7, lr, lsl #3]
	str	r2, [r3, #4]
	add	r3, sp, #248	; 0xf8
	ldmia	r3, {r0, r1}
	stmia	sp, {r0, r1}
	ldr	r3, [sp, #76]	; 0x4c
	ldr	r1, [sp, #60]	; 0x3c
	ldmia	r3, {r2, r3}
	mov	r0, r7
	bl	WikiMerge.constprop.1.isra.0
	cmp	r9, #512	; 0x200
	mov	r6, r6, lsl #3
	bgt	lab244
	sub	r1, r6, #8
	ldr	r2, [sp, #92]	; 0x5c
	add	r1, r7
	add	r0, sp, #280	; 0x118
	bl	memcpy
lab265: 	cmp	r5, #0
	add	r6, r9, r3
	sub	ip, r6, r5
	ble	lab245
	add	r4, r7, r4, lsl #3
	add	ip, r7, ip, lsl #3
	add	fp, r4, #4
	add	sl, ip, #4
	movs	r3, #0
	mov	r8, r6
	mov	lr, r5
lab246: 	ldmia	r2, {r0, r1}
	ldr	r6, [r4, r3, lsl #3]
	ldr	r5, [fp, r3, lsl #3]
	add	r2, r4, r3, lsl #3
	stmia	r2, {r0, r1}
	str	r6, [ip, r3, lsl #3]
	str	r5, [sl, r3, lsl #3]
	adds	r3, #1
	cmp	lr, r3
	bne	lab246
	mov	r6, r8
	mov	r5, lr
lab245: 	ldr	r3, [sp, #20]
	subs	r3, r3, r5
	str	r3, [sp, #36]	; 0x24
	add	r3, r9
	str	r3, [sp, #44]	; 0x2c
	add	r5, r3
	ldr	r3, [sp, #40]	; 0x28
	cmp	r6, r3
	beq	lab247
	add	sl, r6, #1
	add	r4, r9, sl
	cmp	r4, r3
	mov	r8, r3
	bge	lab248
	mov	fp, r5
	ldr	r5, [sp, #24]
lab249: 	add	r1, r7, r4, lsl #3
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	blx	r5
	cmp	r0, #0
	it	ne
	movne	sl, r4
	add	r4, r9
	cmp	r4, r8
	blt	lab249
	mov	r5, fp
	add	sl, sl, #4294967295	; 0xffffffff
lab277: 	ldmia	r3, {r0, r1}
	ldr	r4, [sp, #44]	; 0x2c
	str	r6, [sp, #20]
	add	r3, sp, #184	; 0xb8
	stmia	r3, {r0, r1}
	subs	r3, r5, r4
	cmp	r3, #0
	bgt	lab250
lab241: 	ldrd	r2, r3, [sp, #28]
	cmp	r3, r2
	beq	lab251
	mov	r3, r2
	ldr	r2, [sp, #32]
	subs	r6, r3, r2
	cmp	r9, r6
	ble	lab252
	subs	r4, r2, r3
	ldr	r2, [sp, #20]
	cmp	r2, r3
	mov	r3, r2
	beq	lab253
	cmp	r4, #0
	blt	lab254
	ldr	r3, [sp, #28]
	adds	r2, r4, r2
	sub	r8, r3, r2
	cmp	r4, r8
	ble	lab255
	cmp	r8, #0
	ble	lab256
lab255: 	add	r3, r4, r4, lsr #31
	cmp	r4, #1
	mov	r3, r3, asr #1
	ble	lab257
	ldr	r1, [sp, #20]
	subs	r4, r2, r3
	adds	r5, r7, #4
	add	r3, r1
	add	r4, r7, r4, lsl #3
	add	r5, r5, r2, lsl #3
	add	r3, r7, r3, lsl #3
	adds	r4, #4
	mov	lr, r2
	mov	ip, r5
lab258: 	ldmia	r1, {r0, r1}
	ldrd	r2, r5, [r3, #-8]
	subs	r3, #8
	stmia	r3, {r0, r1}
	str	r2, [r4, #-4]
	str	r5, [r4], #8
	cmp	ip, r4
	bne	lab258
	mov	r2, lr
lab257: 	add	r3, r8, r8, lsr #31
	cmp	r8, #1
	mov	r3, r3, asr #1
	ble	lab259
	ldr	r1, [sp, #28]
	add	r2, r3
	adds	r5, r7, #4
	subs	r3, r1, r3
	add	r3, r7, r3, lsl #3
	add	r5, r5, r1, lsl #3
	add	r2, r7, r2, lsl #3
	adds	r3, #4
	mov	ip, r5
lab260: 	ldmia	r1, {r0, r1}
	ldrd	r5, r4, [r2, #-8]
	subs	r2, #8
	stmia	r2, {r0, r1}
	str	r5, [r3, #-4]
	str	r4, [r3], #8
	cmp	ip, r3
	bne	lab260
lab259: 	ldr	r3, [sp, #28]
	ldr	r2, [sp, #20]
	subs	r2, r3, r2
	add	r3, r2, r2, lsr #31
	cmp	r2, #1
	mov	r3, r3, asr #1
	ble	lab261
	ldr	r1, [sp, #28]
	ldr	r0, [sp, #20]
	subs	r2, r1, r3
	adds	r5, r7, #4
	add	r3, r0
	add	r2, r7, r2, lsl #3
	add	r5, r5, r1, lsl #3
	add	r3, r7, r3, lsl #3
	adds	r2, #4
	mov	ip, r5
lab262: 	ldmia	r1, {r0, r1}
	ldrd	r5, r4, [r3, #-8]
	subs	r3, #8
	stmia	r3, {r0, r1}
	str	r5, [r2, #-4]
	str	r4, [r2], #8
	cmp	ip, r2
	bne	lab262
lab261: 	ldr	r3, [sp, #20]
	adds	r5, r3, r6
	mov	r4, r3
lab271: 	str	r5, [sp, #20]
	add	r3, r6
	str	r3, [sp, #40]	; 0x28
	ldr	r3, [sp, #32]
	str	r3, [sp, #28]
	add	sl, r6
	b	lab263
lab244: 	sub	r2, r6, #8
	ldrd	ip, lr, [sp, #108]	; 0x6c
	add	r2, r7
	add	r8, r2, #4
	movs	r3, #0
	mov	sl, r4
	mov	fp, r5
lab264: 	ldmia	r1, {r0, r1}
	ldr	r5, [r2, r3, lsl #3]
	ldr	r4, [r8, r3, lsl #3]
	add	r6, r2, r3, lsl #3
	stmia	r6, {r0, r1}
	str	r5, [ip, r3, lsl #3]
	str	r4, [lr, r3, lsl #3]
	adds	r3, #1
	cmp	r9, r3
	bne	lab264
	mov	r4, sl
	mov	r5, fp
	b	lab265
lab252: 	cmp	r9, #0
	ble	lab266
	ldr	r3, [sp, #20]
	add	r5, r7, r3, lsl #3
	ldr	r3, [sp, #32]
	add	r4, r7, r3, lsl #3
	add	r8, r5, #4
	add	lr, r4, #4
	movs	r3, #0
	mov	ip, r7
lab267: 	ldmia	r2, {r0, r1}
	ldr	r7, [r5, r3, lsl #3]
	ldr	r6, [r8, r3, lsl #3]
	add	r2, r5, r3, lsl #3
	stmia	r2, {r0, r1}
	str	r7, [r4, r3, lsl #3]
	str	r6, [lr, r3, lsl #3]
	adds	r3, #1
	cmp	r9, r3
	bne	lab267
	mov	r7, ip
lab266: 	ldr	r3, [sp, #20]
	ldr	r2, [sp, #40]	; 0x28
	ldr	r5, [sp, #28]
	ldr	r1, [sp, #32]
	cmp	sl, r3
	it	eq
	moveq	sl, r2
	add	r2, r9
	str	r2, [sp, #40]	; 0x28
	ldr	r2, [sp, #88]	; 0x58
	add	r5, r9
	cmp	r5, r2
	it	ge
	movge	r5, r2
	add	r1, r9
	str	r5, [sp, #28]
	add	r5, r9, r3
	str	r1, [sp, #32]
	mov	r4, r3
	str	r5, [sp, #20]
	b	lab263
lab236: 	lsls	r2, r3, #3
	mov	r1, r8
	add	r0, sp, #280	; 0x118
	bl	memcpy
	ldr	r3, [sp, #36]	; 0x24
	str	r3, [sp, #192]	; 0xc0
	ldr	r3, [sp, #48]	; 0x30
	str	r3, [sp, #204]	; 0xcc
	strd	fp, fp, [sp, #196]	; 0xc4
	add	r3, sp, #280	; 0x118
	str	r3, [sp, #12]
	ldr	r3, [sp, #24]
	str	r3, [sp, #8]
	add	r3, sp, #200	; 0xc8
	ldmia	r3, {r0, r1}
	stmia	sp, {r0, r1}
	add	r3, sp, #192	; 0xc0
	ldmia	r3, {r2, r3}
	mov	r1, r4
	mov	r0, r7
	bl	WikiMerge.constprop.1.isra.0
lab235: 	ldr	r3, [sp, #96]	; 0x60
	ldr	r2, [sp, #56]	; 0x38
	subs	r3, r3, r2
	str	r3, [sp, #100]	; 0x64
lab276: 	ldr	r2, [sp, #104]	; 0x68
	cmp	r3, r2
	bge	lab268
lab272: 	mov	r1, r3
	b	lab269
lab254: 	ldr	r2, [sp, #32]
	subs	r4, r2, r3
	cmp	r6, r4
	bge	lab270
	mov	r8, r6
	cmp	r8, #0
	bgt	lab255
lab256: 	mov	r8, r8, lsl #3
	add	r1, r7, r2, lsl #3
	add	r0, sp, #280	; 0x118
	mov	r2, r8
	bl	memcpy
	ldr	r3, [sp, #28]
	ldr	r5, [sp, #20]
	subs	r0, r3, r4
	lsls	r2, r4, #3
	add	r4, r7, r5, lsl #3
	mov	r1, r4
	add	r0, r7, r0, lsl #3
	bl	memmove
	mov	r0, r4
	mov	r2, r8
	add	r1, sp, #280	; 0x118
	bl	memcpy
	add	r5, r6
	ldr	r4, [sp, #20]
	b	lab271
lab234: 	ldr	r3, [sp, #36]	; 0x24
	str	r3, [sp, #216]	; 0xd8
	sub	r1, fp, r3
	ldr	r3, [sp, #48]	; 0x30
	str	r3, [sp, #220]	; 0xdc
	add	r3, sp, #280	; 0x118
	str	r3, [sp, #0]
	add	r3, sp, #216	; 0xd8
	ldmia	r3, {r2, r3}
	mov	r0, r7
	bl	Rotate.constprop.1
	ldr	r2, [sp, #56]	; 0x38
	ldr	r3, [sp, #96]	; 0x60
	subs	r3, r3, r2
	str	r3, [sp, #100]	; 0x64
	ldr	r2, [sp, #104]	; 0x68
	ldr	r3, [sp, #48]	; 0x30
	cmp	r3, r2
	blt	lab272
lab268: 	ldr	r3, [sp, #100]	; 0x64
	cmp	r3, #0
	bgt	lab273
lab329: 	ldr	r3, [sp, #80]	; 0x50
	lsls	r2, r2, #1
	str	r2, [sp, #68]	; 0x44
	ldr	r2, [sp, #84]	; 0x54
	lsls	r3, r3, #1
	cmp	r2, r3
	str	r3, [sp, #80]	; 0x50
	bgt	lab274
	subs	r3, r3, r2
	str	r3, [sp, #80]	; 0x50
	ldr	r3, [sp, #68]	; 0x44
	adds	r3, #1
	str	r3, [sp, #68]	; 0x44
lab274: 	ldr	r3, [sp, #136]	; 0x88
	ldr	r2, [sp, #152]	; 0x98
	lsls	r3, r3, #1
	cmp	r3, r2
	str	r3, [sp, #136]	; 0x88
	blt	lab275
lab232: 	add	sp, sp, #4352	; 0x1100
	add	sp, #28
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab247: 	ldr	r3, [sp, #88]	; 0x58
	str	r3, [sp, #260]	; 0x104
	ldr	r3, [sp, #36]	; 0x24
	str	r3, [sp, #168]	; 0xa8
	ldr	r3, [sp, #44]	; 0x2c
	str	r3, [sp, #256]	; 0x100
	str	r3, [sp, #172]	; 0xac
	add	r3, sp, #280	; 0x118
	str	r3, [sp, #12]
	ldr	r3, [sp, #24]
	str	r3, [sp, #8]
	add	r3, sp, #256	; 0x100
	ldmia	r3, {r0, r1}
	stmia	sp, {r0, r1}
	add	r3, sp, #168	; 0xa8
	ldmia	r3, {r2, r3}
	ldr	r1, [sp, #60]	; 0x3c
	mov	r0, r7
	bl	WikiMerge.constprop.1.isra.0
	b	lab276
lab253: 	adds	r5, r2, r6
	mov	r4, r2
	b	lab271
lab248: 	mov	sl, r6
	b	lab277
lab270: 	cmp	r4, #0
	bgt	lab278
	add	r5, r7, r3, lsl #3
	lsls	r4, r4, #3
	mov	r2, r4
	mov	r1, r5
	add	r0, sp, #280	; 0x118
	mov	r8, r3
	bl	memcpy
	ldr	r3, [sp, #32]
	mov	r0, r5
	add	r1, r7, r3, lsl #3
	lsls	r2, r6, #3
	bl	memmove
	mov	r3, r8
	adds	r5, r3, r6
	mov	r2, r4
	add	r1, sp, #280	; 0x118
	add	r0, r7, r5, lsl #3
	bl	memcpy
	ldr	r4, [sp, #20]
	b	lab271
lab237: 	ldr	r3, [sp, #36]	; 0x24
	add	sl, r3, #1
	cmp	sl, fp
	bge	lab279
	add	r5, r7, r3, lsl #3
	str	r8, [sp, #28]
	str	r9, [sp, #32]
	ldr	r8, [sp, #128]	; 0x80
	mov	r9, r7
	ldr	r7, [sp, #24]
	movs	r4, #1
lab283: 	adds	r5, #8
	ldmia	r5, {r2, r3}
	ldmia	r6, {r0, r1}
	blx	r7
	cbnz	r0, lab280
	ldmia	r6, {r2, r3}
	ldmia	r5, {r0, r1}
	blx	r7
	cbz	r0, lab281
lab280: 	cmp	r8, r4
	add	r3, r4, #1
	beq	lab282
	mov	r4, r3
lab281: 	add	sl, sl, #1
	cmp	sl, fp
	bne	lab283
	mov	r7, r9
	ldr	r8, [sp, #28]
	ldr	r9, [sp, #32]
lab347: 	cmp	r3, #512	; 0x200
	bgt	lab284
lab296: 	bne	lab285
	ldr	r2, [sp, #36]	; 0x24
	ldr	r1, [sp, #48]	; 0x30
	str	r1, [sp, #116]	; 0x74
	add	r3, r2
	str	r3, [sp, #96]	; 0x60
	str	r3, [sp, #124]	; 0x7c
	movs	r3, #0
	str	r2, [sp, #132]	; 0x84
	str	r2, [sp, #60]	; 0x3c
	str	r1, [sp, #28]
	str	r3, [sp, #32]
lab346: 	mov	r1, r3
lab337: 	add	r5, r7, sl, lsl #3
	add	r3, sp, #232	; 0xe8
	mov	fp, r7
	ldr	r7, [sp, #24]
	str	r3, [sp, #20]
	mov	r4, sl
	mov	r8, #0
	mov	r9, r1
lab288: 	cmp	r4, r3
	sub	r6, r5, #8
	beq	lab286
	ldmia	r5, {r2, r3}
	ldmia	r6, {r0, r1}
	blx	r7
	cbnz	r0, lab286
	ldmia	r5, {r0, r1}
	ldmia	r6, {r2, r3}
	blx	r7
	cbz	r0, lab287
lab286: 	add	r3, sl, #1
	adds	r2, r4, #1
	strd	r2, r3, [sp, #232]	; 0xe8
	ldr	r3, [sp, #20]
	add	r0, sp, #280	; 0x118
	ldmia	r3, {r2, r3}
	rsb	r1, r8, #0
	str	r0, [sp, #0]
	mov	r0, fp
	bl	Rotate.constprop.1
	add	sl, r4, r8
	add	r8, r8, #1
lab287: 	cmp	r8, r9
	add	r4, r4, #4294967295	; 0xffffffff
	mov	r5, r6
	blt	lab288
	ldr	r3, [sp, #124]	; 0x7c
	ldr	r9, [sp, #40]	; 0x28
	mov	r7, fp
	ldr	fp, [sp, #44]	; 0x2c
	add	r8, r7, r3, lsl #3
	sub	r2, fp, r3
	ldr	r3, [sp, #120]	; 0x78
	str	r3, [sp, #100]	; 0x64
	ldr	r3, [sp, #36]	; 0x24
	str	r2, [sp, #20]
	str	r3, [sp, #56]	; 0x38
lab314: 	cmp	r3, #0
	ble	lab289
	ldr	r3, [sp, #28]
	ldr	r2, [sp, #48]	; 0x30
	str	fp, [sp, #52]	; 0x34
	strd	r8, r9, [sp, #40]	; 0x28
	adds	r4, r3, #1
	add	sl, r2, #4294967295	; 0xffffffff
	ldr	r9, [sp, #32]
	add	r2, sp, #240	; 0xf0
	add	r4, r7, r4, lsl #3
	mov	fp, r7
	mov	r5, r3
	movs	r6, #0
	str	r2, [sp, #28]
	mov	r7, r3
lab292: 	sub	r8, r4, #8
	beq	lab290
	ldmia	r4, {r2, r3}
	ldmia	r8, {r0, r1}
	ldr	ip, [sp, #24]
	blx	ip
	cbnz	r0, lab290
	ldmia	r4, {r0, r1}
	ldmia	r8, {r2, r3}
	ldr	ip, [sp, #24]
	blx	ip
	cbz	r0, lab291
lab290: 	strd	r7, r5, [sp, #240]	; 0xf0
	ldr	r3, [sp, #28]
	add	r0, sp, #280	; 0x118
	ldmia	r3, {r2, r3}
	mov	r1, r6
	str	r0, [sp, #0]
	mov	r0, fp
	bl	Rotate.constprop.1
	subs	r7, r5, r6
	adds	r6, #1
lab291: 	cmp	r6, r9
	add	r5, r5, #1
	add	r4, r4, #8
	blt	lab292
	ldrd	r8, r9, [sp, #40]	; 0x28
	mov	r7, fp
	ldr	fp, [sp, #52]	; 0x34
lab289: 	ldr	r3, [sp, #36]	; 0x24
	str	r3, [sp, #140]	; 0x8c
	ldr	r3, [sp, #116]	; 0x74
	str	r3, [sp, #88]	; 0x58
	ldr	r3, [sp, #48]	; 0x30
	str	r3, [sp, #144]	; 0x90
	ldr	r3, [sp, #124]	; 0x7c
	str	r3, [sp, #36]	; 0x24
	b	lab293
lab240: 	ldr	r3, [sp, #36]	; 0x24
	str	sl, [sp, #32]
	add	r5, r7, r3, lsl #3
	ldr	r3, [sp, #60]	; 0x3c
	add	r4, r7, r3, lsl #3
	adds	r2, r4, #4
	lsls	r3, r3, #3
	str	r3, [sp, #20]
	add	r8, r5, #4
	movs	r3, #0
	mov	ip, r2
	mov	sl, r7
lab294: 	ldmia	r2, {r0, r1}
	ldr	r7, [r5, r3, lsl #3]
	ldr	r6, [r8, r3, lsl #3]
	add	r2, r5, r3, lsl #3
	stmia	r2, {r0, r1}
	str	r7, [r4, r3, lsl #3]
	str	r6, [ip, r3, lsl #3]
	adds	r3, #1
	cmp	lr, r3
	bne	lab294
	mov	r7, sl
	ldr	sl, [sp, #32]
	b	lab295
lab278: 	mov	r8, r6
	b	lab255
lab282: 	mov	r4, r3
	ldr	r3, [sp, #120]	; 0x78
	ldr	r8, [sp, #28]
	cmp	r3, #512	; 0x200
	mov	r7, r9
	ldr	r9, [sp, #32]
	ble	lab296
lab284: 	add	r6, sl, #1
	cmp	r6, fp
	bge	lab297
	strd	sl, r8, [sp, #28]
	add	r5, r7, sl, lsl #3
	movs	r3, #0
	str	r9, [sp, #44]	; 0x2c
	mov	sl, r7
	ldr	r9, [sp, #128]	; 0x80
	ldr	r7, [sp, #24]
	str	r4, [sp, #40]	; 0x28
	mov	r8, r3
lab301: 	adds	r5, #8
	ldmia	r5, {r2, r3}
	ldmia	r4, {r0, r1}
	blx	r7
	cbnz	r0, lab298
	ldmia	r4, {r2, r3}
	ldmia	r5, {r0, r1}
	blx	r7
	cbz	r0, lab299
lab298: 	cmp	r9, r8
	add	r3, r8, #1
	beq	lab300
	mov	r8, r3
lab299: 	adds	r6, #1
	cmp	r6, fp
	bne	lab301
	mov	r3, r8
	mov	r7, sl
	ldr	r4, [sp, #40]	; 0x28
	ldr	r8, [sp, #32]
	ldr	r9, [sp, #44]	; 0x2c
	ldr	sl, [sp, #28]
lab340: 	cmp	r3, r2
	beq	lab302
lab297: 	ldr	r3, [sp, #120]	; 0x78
	cmp	r4, r3
	ldr	r3, [sp, #48]	; 0x30
	beq	lab303
	sub	sl, r3, #2
	cmp	sl, fp
	blt	lab304
	add	r4, r7, sl, lsl #3
	str	r8, [sp, #28]
	str	r7, [sp, #32]
	ldr	r8, [sp, #128]	; 0x80
	ldr	r7, [sp, #24]
	movs	r6, #1
lab308: 	ldmia	r4, {r0, r1}
	ldmia	r5, {r2, r3}
	blx	r7
	cbnz	r0, lab305
	ldmia	r4, {r2, r3}
	ldmia	r5, {r0, r1}
	blx	r7
	cbz	r0, lab306
lab305: 	cmp	r8, r6
	add	r3, r6, #1
	beq	lab307
	mov	r6, r3
lab306: 	add	sl, sl, #4294967295	; 0xffffffff
	cmp	sl, fp
	sub	r4, r4, #8
	bge	lab308
lab307: 	ldrd	r8, r7, [sp, #28]
lab304: 	add	r3, sl, #4294967295	; 0xffffffff
	cmp	r3, fp
	blt	lab309
	strd	r9, r8, [sp, #28]
	add	r4, r7, r3, lsl #3
	mov	sl, r7
	ldr	r9, [sp, #128]	; 0x80
	ldr	r7, [sp, #24]
	movs	r6, #0
	mov	r8, r3
lab313: 	ldmia	r4, {r0, r1}
	ldmia	r5, {r2, r3}
	blx	r7
	cbnz	r0, lab310
	ldmia	r4, {r2, r3}
	ldmia	r5, {r0, r1}
	blx	r7
	cbz	r0, lab311
lab310: 	cmp	r9, r6
	add	r3, r6, #1
	beq	lab312
	mov	r6, r3
lab311: 	add	r8, r8, #4294967295	; 0xffffffff
	cmp	r8, fp
	sub	r4, r4, #8
	bge	lab313
	ldr	r9, [sp, #28]
	str	r8, [sp, #28]
	ldr	r8, [sp, #32]
	mov	r7, sl
lab341: 	cmp	r6, r3
	bne	lab309
	ldr	r2, [sp, #48]	; 0x30
	ldr	r0, [sp, #148]	; 0x94
	ldr	r4, [sp, #28]
	mov	r1, r3
	subs	r3, r2, r3
	str	r3, [sp, #56]	; 0x38
	str	r3, [sp, #132]	; 0x84
	ldr	r3, [sp, #120]	; 0x78
	str	r3, [sp, #100]	; 0x64
	add	r0, r4
	ldr	r3, [sp, #48]	; 0x30
	str	r0, [sp, #156]	; 0x9c
	sub	r2, r2, r1, lsl #1
	str	r2, [sp, #60]	; 0x3c
	str	r3, [sp, #96]	; 0x60
lab339: 	ldr	r3, [sp, #156]	; 0x9c
	subs	r3, r3, r2
	ldr	r2, [sp, #48]	; 0x30
	str	r3, [sp, #32]
	subs	r3, r2, r3
	str	r3, [sp, #116]	; 0x74
	ldr	r3, [sp, #36]	; 0x24
	str	r3, [sp, #124]	; 0x7c
	b	lab314
lab285: 	ldr	r3, [sp, #48]	; 0x30
	subs	r3, #2
	cmp	r3, fp
	str	r3, [sp, #28]
	blt	lab315
	strd	r9, r8, [sp, #28]
	add	r4, r7, r3, lsl #3
	mov	sl, r7
	ldr	r9, [sp, #128]	; 0x80
	ldr	r7, [sp, #24]
	movs	r6, #1
	mov	r8, r3
lab319: 	ldmia	r4, {r0, r1}
	ldmia	r5, {r2, r3}
	blx	r7
	cbnz	r0, lab316
	ldmia	r4, {r2, r3}
	ldmia	r5, {r0, r1}
	blx	r7
	cbz	r0, lab317
lab316: 	cmp	r9, r6
	add	r3, r6, #1
	beq	lab318
	mov	r6, r3
lab317: 	add	r8, r8, #4294967295	; 0xffffffff
	cmp	r8, fp
	sub	r4, r4, #8
	bge	lab319
	ldr	r9, [sp, #28]
	str	r8, [sp, #28]
	ldr	r8, [sp, #32]
	mov	r7, sl
lab349: 	cmp	r6, r3
	beq	lab320
lab338: 	add	r3, r6
	bge	lab321
lab309: 	ldr	r2, [sp, #48]	; 0x30
	sub	r3, r2, fp
	cmp	r3, #0
	ble	lab276
	add	r3, sp, #280	; 0x118
	add	r6, sp, #200	; 0xc8
	sub	r5, r3, #56	; 0x38
	str	r9, [sp, #28]
	str	r6, [sp, #20]
	ldr	r4, [sp, #36]	; 0x24
	ldr	sl, [sp, #24]
	mov	r6, fp
	sub	r8, r3, #88	; 0x58
	mov	r9, r2
	mov	fp, r5
	b	lab322
lab324: 	ble	lab323
lab322: 	strd	r6, r9, [sp, #200]	; 0xc8
	ldr	r3, [sp, #20]
	mov	r1, r4
	ldmia	r3, {r2, r3}
	mov	r0, r7
	str	sl, [sp]
	bl	BinaryFirst
	strd	r4, r0, [sp, #224]	; 0xe0
	mov	r5, r6
	add	ip, sp, #280	; 0x118
	mov	r6, r0
	ldmia	fp, {r2, r3}
	subs	r1, r5, r0
	str	ip, [sp]
	mov	r0, r7
	bl	Rotate.constprop.1
	strd	r4, r5, [sp, #192]	; 0xc0
	subs	r1, r6, r5
	ldmia	r8, {r2, r3}
	add	r1, r4
	str	sl, [sp]
	mov	r0, r7
	bl	BinaryLast
	subs	r3, r6, r0
	cmp	r3, #0
	mov	r4, r0
	sub	r2, r9, r6
	bgt	lab324
lab323: 	ldr	r9, [sp, #28]
	b	lab276
lab273: 	ldr	r3, [sp, #60]	; 0x3c
	str	r3, [sp, #160]	; 0xa0
	ldr	r3, [sp, #132]	; 0x84
	str	r3, [sp, #164]	; 0xa4
	add	r3, sp, #160	; 0xa0
	ldmia	r3, {r1, r2}
	mov	r0, r7
	ldr	r3, [sp, #24]
	bl	InsertionSort
	ldr	r3, [sp, #124]	; 0x7c
	ldr	r2, [sp, #140]	; 0x8c
	subs	r3, r3, r2
	cmp	r3, #0
	ble	lab325
	ldr	r5, [sp, #124]	; 0x7c
	mov	r6, r2
	mov	r4, r5
	add	r8, sp, #264	; 0x108
lab328: 	cmp	r2, r4
	add	r3, r7, r6, lsl #3
	add	r1, r7, r4, lsl #3
	beq	lab326
lab333: 	ldmia	r1, {r0, r1}
	ldr	ip, [sp, #24]
	blx	ip
	sub	r9, r4, r5
	subs	r1, r5, r4
	subs	r3, r5, r6
	cbz	r0, lab327
	cmp	r3, #0
	add	r4, r4, #1
	bgt	lab328
lab325: 	ldr	r3, [sp, #144]	; 0x90
	ldr	r2, [sp, #116]	; 0x74
	subs	r3, r3, r2
	cmp	r3, #0
	ble	lab329
	ldrd	fp, r9, [sp, #140]	; 0x8c
	mov	r5, r2
	mov	r4, r2
	mvn	r6, #3758096384	; 0xe0000000
	add	r8, sp, #272	; 0x110
lab332: 	add	r1, r9, r6
	cmp	fp, r5
	add	r3, r7, r3, lsl #3
	add	r1, r7, r1, lsl #3
	beq	lab330
	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
	ldr	ip, [sp, #24]
	blx	ip
	sub	sl, r4, r5
	mov	r3, r0
	mov	r1, sl
	mov	r0, r7
	sub	r2, r9, r4
	cmp	r3, #0
	beq	lab331
	cmp	r2, #0
	add	r5, r5, #4294967295	; 0xffffffff
	bgt	lab332
	b	lab329
lab327: 	strd	r6, r4, [sp, #264]	; 0x108
	add	r0, sp, #280	; 0x118
	add	r9, r9, #1
	ldmia	r8, {r2, r3}
	add	r6, r9
	str	r0, [sp, #0]
	mov	r0, r7
	bl	Rotate.constprop.1
	subs	r3, r4, r6
	cmp	r3, #0
	ble	lab325
	ldr	r2, [sp, #116]	; 0x74
	cmp	r2, r4
	mov	r5, r4
	add	r3, r7, r6, lsl #3
	add	r1, r7, r4, lsl #3
	bne	lab333
lab326: 	mov	r3, r2
	strd	r6, r3, [sp, #264]	; 0x108
	add	r1, sp, #280	; 0x118
	mov	r2, r5
	str	r1, [sp, #0]
	sub	r8, r1, #16
	subs	r5, r3, r5
	subs	r1, r2, r3
	mov	r0, r7
	ldmia	r8, {r2, r3}
	bl	Rotate.constprop.1
	adds	r5, #1
	ldr	r3, [sp, #116]	; 0x74
	add	r6, r5
	subs	r3, r3, r6
	cmp	r3, #0
	ble	lab325
	mov	r5, r8
lab334: 	add	r3, sp, #280	; 0x118
	str	r3, [sp, #0]
	ldmia	r5, {r2, r3}
	adds	r6, #1
	movs	r1, #0
	mov	r0, r7
	bl	Rotate.constprop.1
	subs	r3, r4, r6
	cmp	r3, #0
	bgt	lab334
	b	lab325
lab331: 	strd	r5, r9, [sp, #272]	; 0x110
	add	r4, sp, #280	; 0x118
	add	sl, sl, #1
	ldmia	r8, {r2, r3}
	sub	r9, r9, sl
	str	r4, [sp, #0]
	bl	Rotate.constprop.1
	sub	r3, r9, r5
	cmp	r3, #0
	ble	lab329
	mov	r4, r5
	b	lab332
lab330: 	strd	r5, r9, [sp, #272]	; 0x110
	add	r3, sp, #280	; 0x118
	subs	r4, r4, r5
	mov	r6, r5
	str	r3, [sp, #0]
	sub	r5, r3, #8
	ldmia	r5, {r2, r3}
	mov	r1, r4
	mov	r0, r7
	bl	Rotate.constprop.1
	adds	r4, #1
	mov	r2, r9
	subs	r4, r2, r4
	subs	r3, r4, r6
	cmp	r3, #0
	ble	lab329
lab335: 	add	r3, sp, #280	; 0x118
	str	r3, [sp, #0]
	ldmia	r5, {r2, r3}
	subs	r4, #1
	movs	r1, #0
	mov	r0, r7
	bl	Rotate.constprop.1
	subs	r3, r4, r6
	cmp	r3, #0
	bgt	lab335
	b	lab329
lab302: 	ldr	r3, [sp, #36]	; 0x24
	add	r2, r3
	str	r2, [sp, #96]	; 0x60
	ldr	r2, [sp, #148]	; 0x94
	adds	r3, r2, r3
	cmp	r2, #0
	str	r3, [sp, #132]	; 0x84
	ble	lab336
	mov	r2, r3
	str	r2, [sp, #124]	; 0x7c
	ldr	r2, [sp, #148]	; 0x94
	ldr	r3, [sp, #48]	; 0x30
	str	r3, [sp, #116]	; 0x74
	mov	r1, r2
	str	r3, [sp, #28]
	ldr	r2, [sp, #96]	; 0x60
	str	r2, [sp, #60]	; 0x3c
	movs	r3, #0
	mov	sl, r6
	str	r3, [sp, #32]
	b	lab337
lab318: 	mov	r6, r3
	ldr	r3, [sp, #120]	; 0x78
	ldr	r9, [sp, #28]
	str	r8, [sp, #28]
	cmp	r6, r3
	ldr	r8, [sp, #32]
	mov	r7, sl
	bne	lab338
lab320: 	ldr	r2, [sp, #28]
	adds	r2, r3, r2
	str	r2, [sp, #156]	; 0x9c
	ldr	r2, [sp, #48]	; 0x30
	subs	r3, r2, r3
	str	r3, [sp, #56]	; 0x38
	ldr	r3, [sp, #36]	; 0x24
	str	r3, [sp, #132]	; 0x84
	str	r3, [sp, #60]	; 0x3c
	ldr	r3, [sp, #120]	; 0x78
	str	r3, [sp, #100]	; 0x64
	ldr	r3, [sp, #48]	; 0x30
	str	r3, [sp, #96]	; 0x60
	b	lab339
lab300: 	mov	r7, sl
	ldrd	r4, r9, [sp, #40]	; 0x28
	ldr	r8, [sp, #32]
	ldr	sl, [sp, #28]
	b	lab340
lab312: 	ldr	r9, [sp, #28]
	str	r8, [sp, #28]
	mov	r7, sl
	ldr	r8, [sp, #32]
	mov	r6, r3
	b	lab341
lab303: 	subs	r3, #2
	cmp	r3, fp
	str	r3, [sp, #28]
	blt	lab309
	mov	r8, r3
	add	r5, r7, r3, lsl #3
	movs	r6, #1
lab345: 	ldmia	r5, {r0, r1}
	ldmia	r4, {r2, r3}
	ldr	ip, [sp, #24]
	blx	ip
	cbnz	r0, lab342
	ldmia	r4, {r0, r1}
	ldmia	r5, {r2, r3}
	ldr	r4, [sp, #24]
	blx	r4
	cbz	r0, lab343
lab342: 	ldr	r2, [sp, #128]	; 0x80
	cmp	r2, r6
	add	r3, r6, #1
	beq	lab344
	mov	r6, r3
lab343: 	add	r8, r8, #4294967295	; 0xffffffff
	cmp	r8, fp
	sub	r5, r5, #8
	bge	lab345
	str	r8, [sp, #28]
lab348: 	cmp	r6, r3
	bne	lab309
	ldr	r0, [sp, #48]	; 0x30
	ldr	r2, [sp, #36]	; 0x24
	str	r3, [sp, #32]
	adds	r2, r3, r2
	subs	r1, r0, r3
	str	r2, [sp, #96]	; 0x60
	str	r1, [sp, #60]	; 0x3c
	str	r1, [sp, #116]	; 0x74
	str	r2, [sp, #124]	; 0x7c
	str	r0, [sp, #132]	; 0x84
	b	lab346
lab279: 	movs	r4, #1
	b	lab347
lab227: 	movs	r2, #0
	add	r3, sp, #280	; 0x118
	str	r2, [sp, #280]	; 0x118
	str	r1, [sp, #284]	; 0x11c
	ldmia	r3, {r1, r2}
	ldr	r3, [sp, #24]
	add	sp, sp, #4352	; 0x1100
	add	sp, #28
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	InsertionSort
lab344: 	str	r8, [sp, #28]
	mov	r6, r3
	b	lab348
lab315: 	movs	r6, #1
	b	lab349
lab321: 	strd	r3, r6, [sp, #96]	; 0x60
	ldr	r3, [sp, #36]	; 0x24
	str	r3, [sp, #60]	; 0x3c
	str	r3, [sp, #132]	; 0x84
	ldr	r3, [sp, #28]
	str	r3, [sp, #56]	; 0x38
	b	lab339
lab336: 	ldr	r3, [sp, #132]	; 0x84
	str	r3, [sp, #124]	; 0x7c
	sub	r2, fp, r3
	str	r2, [sp, #20]
	add	r8, r7, r3, lsl #3
	ldr	r2, [sp, #120]	; 0x78
	ldr	r3, [sp, #36]	; 0x24
	str	r2, [sp, #100]	; 0x64
	str	r3, [sp, #56]	; 0x38
	ldr	r2, [sp, #48]	; 0x30
	ldr	r3, [sp, #96]	; 0x60
	str	r2, [sp, #116]	; 0x74
	str	r3, [sp, #60]	; 0x3c
	b	lab289
verify_benchmark:
	push	{r4, lr}
	mov	r4, #3200	; 0xc80
	sub	sp, sp, #3200	; 0xc80
	mov	r2, r4
	ldr	r1, [pc, #28]	; (80028d0 <verify_benchmark+0x2c>)
	mov	r0, sp
	bl	memcpy
	mov	r2, r4
	mov	r1, sp
	ldr	r0, [pc, #20]	; (80028d4 <verify_benchmark+0x30>)
	bl	memcmp
	clz	r0, r0
	lsrs	r0, r0, #5
	add	sp, sp, #3200	; 0xc80
	pop	{r4, pc}
	nop
	.word	0x08002e08
	.word	0x20000004
initialise_benchmark:
	bx	lr
	nop
warm_caches:
	b	benchmark_body.isra.0
benchmark:
	b	benchmark_body.constprop.0
SystemInit:
	ldr	r3, [pc, #40]	; (8002910 <SystemInit+0x2c>)
	ldr	r0, [pc, #44]	; (8002914 <SystemInit+0x30>)
	ldr	r2, [r3, #0]
	movs	r1, #0
	orr	r2, r2, #1
	str	r2, [r3, #0]
	str	r1, [r3, #8]
	ldr	r2, [r3, #0]
	bic	r2, r2, #17301504	; 0x1080000
	bic	r2, r2, #65536	; 0x10000
	str	r2, [r3, #0]
	str	r0, [r3, #4]
	ldr	r2, [r3, #0]
	bic	r2, r2, #262144	; 0x40000
	str	r2, [r3, #0]
	str	r1, [r3, #12]
	bx	lr
	nop
	.word	0x40023800
	.word	0x24003010
set_sysclk_to_168:
	ldr	r3, [pc, #112]	; (800298c <set_sysclk_to_168+0x74>)
	ldr	r2, [r3, #0]
	orr	r2, r2, #65536	; 0x10000
	str	r2, [r3, #0]
lab350: 	lsls	r0, r2, #14
	bpl	lab350
	ldr	r2, [r3, #64]	; 0x40
	ldr	r1, [pc, #100]	; (8002990 <set_sysclk_to_168+0x78>)
	ldr	r0, [pc, #100]	; (8002994 <set_sysclk_to_168+0x7c>)
	orr	r2, r2, #268435456	; 0x10000000
	str	r2, [r3, #64]	; 0x40
	ldr	r2, [r1, #0]
	orr	r2, r2, #16384	; 0x4000
	str	r2, [r1, #0]
	ldr	r2, [r3, #8]
	str	r2, [r3, #8]
	ldr	r1, [r3, #8]
	ldr	r2, [pc, #72]	; (800298c <set_sysclk_to_168+0x74>)
	orr	r1, r1, #5120	; 0x1400
	str	r1, [r3, #8]
	ldr	r1, [r3, #8]
	orr	r1, r1, #32768	; 0x8000
	str	r1, [r3, #8]
	str	r0, [r3, #4]
	ldr	r1, [r3, #0]
	orr	r1, r1, #16777216	; 0x1000000
	str	r1, [r3, #0]
lab351: 	lsls	r1, r3, #6
	bpl	lab351
	ldr	r3, [pc, #52]	; (8002998 <set_sysclk_to_168+0x80>)
	movw	r1, #1797	; 0x705
	str	r1, [r3, #0]
	ldr	r3, [r2, #8]
	ldr	r1, [pc, #28]	; (800298c <set_sysclk_to_168+0x74>)
	bic	r3, r3, #3
	str	r3, [r2, #8]
	ldr	r3, [r2, #8]
	orr	r3, r3, #2
	str	r3, [r2, #8]
lab352: 	lsls	r3, r3, #28
	bpl	lab352
	ldr	r3, [pc, #24]	; (800299c <set_sysclk_to_168+0x84>)
	ldr	r2, [pc, #24]	; (80029a0 <set_sysclk_to_168+0x88>)
	str	r2, [r3, #0]
	bx	lr
	nop
	.word	0x40023800
	.word	0x40007000
	.word	0x07405a08
	.word	0x40023c00
	.word	0x20000000
	.word	0x0a037a00
main:
	push	{lr}
	sub	sp, #12
	bl	initialise_board
	bl	initialise_benchmark
	movs	r0, #0
	bl	warm_caches
	bl	start_trigger
	bl	benchmark
	str	r0, [sp, #4]
	bl	stop_trigger
	ldr	r0, [sp, #4]
	bl	verify_benchmark
	clz	r0, r0
	lsrs	r0, r0, #5
	add	sp, #12
	ldr	pc, [sp], #4
	nop
acos:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
atan:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
cos:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
sin:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
pow:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
sqrt:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
sqrtf:
	movs	r0, #0
	bx	lr
floor:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
floorf:
	movs	r0, #0
	bx	lr
exp:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
log:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
__aeabi_ui2d:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
__aeabi_ui2f:
	movs	r0, #0
	bx	lr
__aeabi_dmul:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
__aeabi_d2uiz:
	movs	r0, #0
	bx	lr
__aeabi_dadd:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
__aeabi_dsub:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
__aeabi_d2iz:
	movs	r0, #0
	bx	lr
__aeabi_ddiv:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
__aeabi_dcmplt:
	movs	r0, #0
	bx	lr
__aeabi_dcmpeq:
	movs	r0, #0
	bx	lr
__aeabi_dcmpge:
	movs	r0, #0
	bx	lr
__aeabi_dcmple:
	movs	r0, #0
	bx	lr
__aeabi_dcmpun:
	movs	r0, #0
	bx	lr
__aeabi_i2d:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
__aeabi_dcmpgt:
	movs	r0, #0
	bx	lr
__aeabi_fadd:
	movs	r0, #0
	bx	lr
__aeabi_fcmpeq:
	movs	r0, #0
	bx	lr
__aeabi_fcmpge:
	movs	r0, #0
	bx	lr
__aeabi_fcmple:
	movs	r0, #0
	bx	lr
__aeabi_fcmpgt:
	movs	r0, #0
	bx	lr
__aeabi_fcmplt:
	movs	r0, #0
	bx	lr
__aeabi_fsub:
	movs	r0, #0
	bx	lr
__aeabi_i2f:
	movs	r0, #0
	bx	lr
__aeabi_fmul:
	movs	r0, #0
	bx	lr
__aeabi_fdiv:
	movs	r0, #0
	bx	lr
__aeabi_f2iz:
	movs	r0, #0
	bx	lr
__aeabi_f2uiz:
	movs	r0, #0
	bx	lr
__aeabi_d2f:
	movs	r0, #0
	bx	lr
__aeabi_f2d:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
__aeabi_uldivmod:
	push	{r4, r5}
	movs	r4, #0
	movs	r5, #0
	strd	r4, r5, [r0]
	strd	r4, r5, [r0, #8]
	pop	{r4, r5}
	bx	lr
	nop
memcpy:
	movs	r0, #0
	bx	lr
memmove:
	movs	r0, #0
	bx	lr
memset:
	movs	r0, #0
	bx	lr
memcmp:
	movs	r0, #0
	bx	lr
rand:
	movs	r0, #0
	bx	lr
srand:
	bx	lr
	nop
calloc:
	movs	r0, #0
	bx	lr
malloc:
	movs	r0, #0
	bx	lr
free:
	bx	lr
	nop
__assert_func:
	b	__assert_func
	nop
strlen:
	movs	r0, #0
	bx	lr
strcpy:
	movs	r0, #0
	bx	lr
strchr:
	movs	r0, #0
	bx	lr
strtol:
	movs	r0, #0
	bx	lr
strcmp:
	movs	r0, #0
	bx	lr
strncmp:
	movs	r0, #0
	bx	lr
strcat:
	movs	r0, #0
	bx	lr
printf:
	push	{r0, r1, r2, r3}
	movs	r0, #0
	add	sp, #16
	bx	lr
fprintf:
	push	{r1, r2, r3}
	movs	r0, #0
	add	sp, #12
	bx	lr
sprintf:
	push	{r1, r2, r3}
	movs	r0, #0
	add	sp, #12
	bx	lr
putchar:
	movs	r0, #0
	bx	lr
puts:
	movs	r0, #0
	bx	lr
clock:
	movs	r0, #0
	bx	lr
atoi:
	movs	r0, #0
	bx	lr
atof:
	movs	r0, #0
	movs	r1, #0
	bx	lr
	nop
fopen:
	movs	r0, #0
	bx	lr
fflush:
	movs	r0, #0
	bx	lr
ferror:
	movs	r0, #0
	bx	lr
fileno:
	movs	r0, #0
	bx	lr
fscanf:
	push	{r1, r2, r3}
	movs	r0, #0
	add	sp, #12
	bx	lr
sscanf:
	push	{r1, r2, r3}
	movs	r0, #0
	add	sp, #12
	bx	lr
qsort:
	bx	lr
	nop
fgetc:
	movs	r0, #0
	bx	lr
getc:
	movs	r0, #0
	bx	lr
ungetc:
	movs	r0, #0
	bx	lr
fputc:
	movs	r0, #0
	bx	lr
putc:
	movs	r0, #0
	bx	lr
fgets:
	movs	r0, #0
	bx	lr
fclose:
	movs	r0, #0
	bx	lr
fwrite:
	movs	r0, #0
	bx	lr
fputs:
	movs	r0, #0
	bx	lr
fread:
	movs	r0, #0
	bx	lr
exit:
	b	exit
	nop
getenv:
	movs	r0, #0
	bx	lr
memchr:
	movs	r0, #0
	bx	lr
__ctype_b_loc:
	movs	r0, #0
	bx	lr
__ctype_tolower_loc:
	movs	r0, #0
	bx	lr
tolower:
	movs	r0, #0
	bx	lr
__aeabi_memclr4:
	bx	lr
	nop
__aeabi_memclr8:
	bx	lr
	nop
__aeabi_memclr:
	bx	lr
	nop
__aeabi_memcpy4:
	bx	lr
	nop
__aeabi_memcpy:
	bx	lr
	nop
__aeabi_memmove4:
	bx	lr
	nop
__aeabi_memmove:
	bx	lr
	nop
initialise_board:
	mov	r2, #3758153728	; 0xe000e000
	ldr	r1, [pc, #16]	; (8002bd8 <initialise_board+0x18>)
	ldr	r3, [r2, #3580]	; 0xdfc
	movs	r0, #0
	orr	r3, r3, #16777216	; 0x1000000
	str	r3, [r2, #3580]	; 0xdfc
	str	r0, [r1, #4]
	bx	lr
	.word	0xe0001000
start_trigger:
	ldr	r2, [pc, #8]	; (8002be8 <start_trigger+0xc>)
	ldr	r3, [r2, #0]
	orr	r3, r3, #1
	str	r3, [r2, #0]
	bx	lr
	.word	0xe0001000
stop_trigger:
	ldr	r3, [pc, #12]	; (8002bfc <stop_trigger+0x10>)
	movs	r2, #0
	str	r2, [r3, #4]
	ldr	r2, [r3, #0]
	bic	r2, r2, #1
	str	r2, [r3, #0]
	bx	lr
	.word	0xe0001000
rand_beebs:
	ldr	r3, [pc, #20]	; (8002c18 <rand_beebs+0x18>)
	ldr	r1, [pc, #24]	; (8002c1c <rand_beebs+0x1c>)
	ldr	r2, [r3, #0]
	movw	r0, #12345	; 0x3039
	mla	r0, r1, r2, r0
	bic	r0, r0, #2147483648	; 0x80000000
	str	r0, [r3, #0]
	lsrs	r0, r0, #16
	bx	lr
	.word	0x20000c84
	.word	0x41c64e6d
srand_beebs:
	ldr	r3, [pc, #4]	; (8002c28 <srand_beebs+0x8>)
	str	r0, [r3, #0]
	bx	lr
	nop
	.word	0x20000c84
init_heap_beebs:
	ands	r2, r1, #3
	push	{r3, lr}
	bne	lab353
	ldr	r3, [pc, #20]	; (8002c4c <init_heap_beebs+0x20>)
	add	r1, r0
	strd	r0, r1, [r3, #4]
	str	r2, [r3, #12]
	pop	{r3, pc}
lab353: 	ldr	r3, [pc, #12]	; (8002c50 <init_heap_beebs+0x24>)
	ldr	r2, [pc, #16]	; (8002c54 <init_heap_beebs+0x28>)
	ldr	r0, [pc, #16]	; (8002c58 <init_heap_beebs+0x2c>)
	movs	r1, #65	; 0x41
	bl	__assert_func
	.word	0x20000c84
	.word	0x08003a8c
	.word	0x08003adc
	.word	0x08003aac
check_heap_beebs:
	ldr	r3, [pc, #16]	; (8002c70 <check_heap_beebs+0x14>)
	ldrd	r3, r2, [r3, #8]
	add	r0, r2
	cmp	r3, r0
	ite	cc
	movcc	r0, #0
	movcs	r0, #1
	bx	lr
	nop
	.word	0x20000c84
malloc_beebs:
	mov	r3, r0
	cbz	r0, lab354
	ldr	r2, [pc, #40]	; (8002ca4 <malloc_beebs+0x30>)
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	adds	r1, r0, r3
	add	r3, ip
	ands	ip, r1, #3
	itt	ne
	rsbne	ip, ip, #4
	addne	r3, ip
	str	r3, [r2, #12]
	ldr	r3, [r2, #8]
	it	ne
	addne	r1, ip
	cmp	r3, r1
	bcc	lab354
	str	r1, [r2, #4]
	bx	lr
lab354: 	movs	r0, #0
	bx	lr
	.word	0x20000c84
calloc_beebs:
	mul	r2, r1, r0
	push	{r4, lr}
	cbz	r2, lab355
	ldr	r3, [pc, #52]	; (8002ce8 <calloc_beebs+0x40>)
	ldr	r4, [r3, #4]
	ldr	r0, [r3, #12]
	adds	r1, r4, r2
	ands	ip, r1, #3
	add	r0, r2
	itt	ne
	rsbne	ip, ip, #4
	addne	r0, ip
	str	r0, [r3, #12]
	ldr	r0, [r3, #8]
	it	ne
	addne	r1, ip
	cmp	r0, r1
	bcc	lab355
	str	r1, [r3, #4]
	cbz	r4, lab356
	movs	r1, #0
	mov	r0, r4
	bl	memset
lab356: 	mov	r0, r4
	pop	{r4, pc}
lab355: 	movs	r4, #0
	mov	r0, r4
	pop	{r4, pc}
	.word	0x20000c84
realloc_beebs:
	cmp	r0, #0
	beq	lab357
	cmp	r1, #0
	beq	lab357
	ldr	r3, [pc, #140]	; (8002d84 <realloc_beebs+0x98>)
	mov	r2, r0
	ldr	r0, [r3, #4]
	push	{r4, r5, lr}
	adds	r4, r0, r1
	ldr	r5, [r3, #12]
	ands	ip, r4, #3
	add	r5, r1
	itt	ne
	rsbne	ip, ip, #4
	addne	r5, ip
	str	r5, [r3, #12]
	ldr	r5, [r3, #8]
	it	ne
	addne	r4, ip
	cmp	r5, r4
	bcc	lab358
	str	r4, [r3, #4]
	cbz	r0, lab358
	adds	r3, r2, #1
	subs	r3, r0, r3
	cmp	r3, #2
	add	r4, r1, #4294967295	; 0xffffffff
	bls	lab359
	cmp	r4, #7
	bls	lab359
	bic	r4, r1, #3
	mov	r3, r2
	mov	ip, r0
	add	r4, r2
lab360: 	str	lr, [ip], #4
	cmp	r3, r4
	bne	lab360
	lsls	r4, r1, #30
	bic	r3, r1, #3
	beq	lab361
	ldrb	r4, [r2, r3]
	strb	r4, [r0, r3]
	adds	r4, r3, #1
	cmp	r1, r4
	bls	lab361
	adds	r3, #2
	ldrb	r5, [r2, r4]
	strb	r5, [r0, r4]
	cmp	r1, r3
	bls	lab361
	ldrb	r2, [r2, r3]
	strb	r2, [r0, r3]
lab361: 	pop	{r4, r5, pc}
lab358: 	movs	r0, #0
	pop	{r4, r5, pc}
lab359: 	subs	r3, r2, #1
	subs	r1, r0, #1
	add	r2, r4
lab362: 	strb	r4, [r1, #1]!
	cmp	r3, r2
	bne	lab362
	pop	{r4, r5, pc}
lab357: 	movs	r0, #0
	bx	lr
	nop
	.word	0x20000c84
free_beebs:
	bx	lr
	nop
Reset_Handler:
	ldr	sp, [pc, #48]	; 8002dc0 <LoopFillZerobss+0xe>
	ldr	r0, [pc, #48]	; (8002dc4 <LoopFillZerobss+0x12>)
	ldr	r1, [pc, #52]	; (8002dc8 <LoopFillZerobss+0x16>)
	ldr	r2, [pc, #52]	; (8002dcc <LoopFillZerobss+0x1a>)
	movs	r3, #0
	b	LoopCopyDataInit
CopyDataInit:
	ldr	r4, [r2, r3]
	str	r4, [r0, r3]
	adds	r3, #4
LoopCopyDataInit:
	adds	r4, r0, r3
	cmp	r4, r1
	bcc	CopyDataInit
	ldr	r2, [pc, #40]	; (8002dd0 <LoopFillZerobss+0x1e>)
	ldr	r4, [pc, #40]	; (8002dd4 <LoopFillZerobss+0x22>)
	movs	r3, #0
	b	LoopFillZerobss
FillZerobss:
	str	r3, [r2, #0]
	adds	r2, #4
LoopFillZerobss:
	cmp	r2, r4
	bcc	FillZerobss
	bl	SystemInit
	bl	main
	bx	lr
	.word	0x20020000
	.word	0x20000000
	.word	0x20000004
	.word	0x08003aec
	.word	0x20000004
	.word	0x20000c94
ADC_IRQHandler:
	b	ADC_IRQHandler
	movs	r0, r0
