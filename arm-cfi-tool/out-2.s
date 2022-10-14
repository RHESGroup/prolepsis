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
	movs	r2, #0
	movw	r3, #65535	; 0xffff
	movt	r2, #65472	; 0xffc0
	movt	r3, #16863	; 0x41df
	bl	__aeabi_ddiv
	movs	r3, #0
	movs	r2, #0
	movt	r3, #16404	; 0x4014
	bl	__aeabi_dmul
	mov	r4, r0
	subs	r0, r7, r6
	mov	r5, r1
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__adddf3
	movs	r3, #0
	movs	r2, #0
	movt	r3, #16388	; 0x4004
	bl	__aeabi_dsub
	bl	__aeabi_d2iz
	pop	{r3, r4, r5, r6, r7, pc}
TestingMostlyAscending:
	push	{r4, r5, r6, lr}
	mov	r6, r0
	bl	rand_beebs
	bl	__aeabi_i2d
	movs	r2, #0
	movw	r3, #65535	; 0xffff
	movt	r2, #65472	; 0xffc0
	movt	r3, #16863	; 0x41df
	bl	__aeabi_ddiv
	movs	r3, #0
	movs	r2, #0
	movt	r3, #16404	; 0x4014
	bl	__aeabi_dmul
	mov	r4, r0
	mov	r0, r6
	mov	r5, r1
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__adddf3
	movs	r3, #0
	movs	r2, #0
	movt	r3, #16388	; 0x4004
	bl	__aeabi_dsub
	bl	__aeabi_d2iz
	pop	{r4, r5, r6, pc}
	nop
TestingJittered:
	push	{r4, lr}
	mov	r4, r0
	bl	rand_beebs
	bl	__aeabi_i2d
	movs	r2, #0
	movw	r3, #65535	; 0xffff
	movt	r2, #65472	; 0xffc0
	movt	r3, #16863	; 0x41df
	bl	__aeabi_ddiv
	movw	r2, #52429	; 0xcccd
	movw	r3, #52428	; 0xcccc
	movt	r2, #52428	; 0xcccc
	movt	r3, #16364	; 0x3fec
	bl	__aeabi_dcmple
	cbnz	r0, lab0
	subs	r4, #2
lab0: 	mov	r0, r4
	pop	{r4, pc}
	nop
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
lab6: 	ldmia	r6, {r0, r1}
	adds	r6, #8
	cmp	sl, r6
	stmdb	r5, {r0, r1}
	beq	lab4
lab7: 	adds	r5, #8
lab5: 	ldmia	r6, {r2, r3}
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
lab11: 	mov	r3, r7
	ldmia	r6, {r0, r1}
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
lab13: 	ldr	r3, [sp, #4]
	adds	r3, #1
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
lab16: 	ldr	r3, [sp, #20]
	ldr	r2, [sp, #4]
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
lab15: 	add	r1, r4, r3, lsl #3
	ldmia	r1, {r0, r1}
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
	str	r0, [sp, #4]
	ldr	r4, [sp, #84]	; 0x54
	ldr	r7, [sp, #80]	; 0x50
	str	r1, [sp, #12]
	str	r3, [sp, #76]	; 0x4c
	mov	r0, r3
	str	r3, [sp, #8]
	bgt	lab17
	movw	r3, #6236	; 0x185c
	movt	r3, #8192	; 0x2000
	add	r6, r3, r1, lsl #3
	subs	r1, r7, r0
	cmp	r1, #0
	add	r2, r4, ip, lsl #3
	ble	lab18
	cmp	ip, #0
	ble	lab18
	add	r5, r3, r0, lsl #3
	add	r7, r3, r7, lsl #3
	add	r3, r6, #8
	b	lab19
lab20: 	ldmia	r4, {r0, r1}
	adds	r4, #8
	cmp	r2, r4
	stmdb	r3, {r0, r1}
	beq	lab18
lab21: 	adds	r3, #8
lab19: 	ldr	r0, [r4, #0]
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
lab17: 	subs	r3, r7, r3
	cmp	r3, #0
	str	r3, [sp, #16]
	ble	lab22
	lsls	r1, r1, #3
	movw	r3, #6236	; 0x185c
	movt	r3, #8192	; 0x2000
	adds	r2, r1, #4
	subs	r1, #4
	adds	r1, r3, r1
	mov	fp, #0
	ldr	lr, [sp, #4]
	str	ip, [sp, #20]
	mov	r5, r0
	add	r2, r3
	movs	r4, #1
	mov	sl, fp
	mov	r9, r1
	b	lab23
lab25: 	ldmia	r8, {r0, r1}
	ldr	ip, [r7, #-4]!
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
lab27: 	adds	r4, #1
	adds	r2, #8
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
lab22: 	movw	r3, #6236	; 0x185c
	movt	r3, #8192	; 0x2000
lab29: 	ldr	r2, [sp, #4]
	add	r4, r3, r2, lsl #3
	ldr	r2, [sp, #12]
	add	r3, r3, r2, lsl #3
	add	r8, r4, #4
	add	lr, r3, #4
	movs	r2, #0
lab28: 	add	r1, r3, r2, lsl #3
	ldmia	r1, {r0, r1}
	ldr	r7, [r4, r2, lsl #3]
	ldr	r6, [r8, r2, lsl #3]
	add	r5, r4, r2, lsl #3
	stmia	r5, {r0, r1}
	str	r7, [r3, r2, lsl #3]
	str	r6, [lr, r2, lsl #3]
	adds	r2, #1
	cmp	ip, r2
	bgt	lab28
lab30: 	add	sp, #36	; 0x24
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	sp, #8
	bx	lr
lab26: 	ldr	ip, [sp, #20]
	str	lr, [sp, #4]
lab31: 	ldr	r2, [sp, #12]
	sub	ip, ip, sl
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
lab40: 	add	r3, r8, r8, lsr #31
	cmp	r8, #1
	mov	r3, r3, asr #1
	ble	lab35
	movw	r8, #6236	; 0x185c
	movt	r8, #8192	; 0x2000
	subs	r2, r5, r3
	add	r3, r4
	add	r2, r8, r2, lsl #3
	add	r3, r8, r3, lsl #3
	add	r8, r8, #4
	adds	r2, #4
	add	r8, r8, r5, lsl #3
lab36: 	subs	r1, r2, #4
	ldmia	r1, {r0, r1}
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
	movw	ip, #6236	; 0x185c
	movt	ip, #8192	; 0x2000
	adds	r3, r5, r2
	subs	r2, r6, r2
	add	r2, ip, r2, lsl #3
	add	r3, ip, r3, lsl #3
	add	ip, ip, #4
	adds	r2, #4
	add	ip, ip, r6, lsl #3
lab38: 	subs	r1, r2, #4
	ldmia	r1, {r0, r1}
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
	movw	r1, #6236	; 0x185c
	movt	r1, #8192	; 0x2000
	subs	r2, r6, r3
	add	r3, r4
	add	r2, r1, r2, lsl #3
	add	r3, r1, r3, lsl #3
	adds	r1, #4
	add	r6, r1, r6, lsl #3
	adds	r2, #4
lab39: 	subs	r1, r2, #4
	ldmia	r1, {r0, r1}
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
	movw	r6, #6236	; 0x185c
	movt	r6, #8192	; 0x2000
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
lab41: 	add	sp, #8
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	memcpy
lab34: 	mov	sl, r7, lsl #3
	movw	r7, #6236	; 0x185c
	movt	r7, #8192	; 0x2000
	add	r1, r7, r5, lsl #3
	mov	r2, sl
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
WikiSort.constprop.0:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	movw	fp, #6236	; 0x185c
	sub	sp, sp, #4320	; 0x10e0
	movs	r5, #0
	sub	sp, #28
	movt	fp, #8192	; 0x2000
	mov	ip, #2
	mov	lr, #1
	mov	r7, r5
lab47: 	cmp	lr, r5
	add	r7, r7, #25
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
lab46: 	ldmdb	r3, {r0, r1}
	cmp	r5, r2
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
lab76: 	cmp	r7, #400	; 0x190
	add	r5, r5, #25
	add	lr, lr, #25
	add	ip, ip, #25
	bne	lab47
	movs	r3, #4
	str	r3, [sp, #124]	; 0x7c
	movs	r3, #25
	str	r3, [sp, #72]	; 0x48
	add	r3, sp, #224	; 0xe0
	str	r3, [sp, #148]	; 0x94
	mov	r9, fp
lab79: 	ldr	r4, [sp, #72]	; 0x48
	mov	r0, r4
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
	add	r3, r9
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
	str	r9, [sp, #52]	; 0x34
	str	r3, [sp, #68]	; 0x44
	str	r5, [sp, #128]	; 0x80
	str	r5, [sp, #120]	; 0x78
	str	r5, [sp, #80]	; 0x50
	str	r5, [sp, #60]	; 0x3c
	mov	fp, r6
lab77: 	ldr	r0, [sp, #52]	; 0x34
	ldr	r3, [sp, #88]	; 0x58
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
	mov	sl, r7
	mov	r3, r6
lab96: 	sdiv	lr, r7, fp
	mls	lr, fp, lr, r7
	add	r8, r3, lr
	ldr	r3, [sp, #36]	; 0x24
	add	r6, r8, #1
	cmp	r3, r6
	mov	r5, r8
	ble	lab52
	ldr	r3, [sp, #48]	; 0x30
	ldr	ip, [sp, #76]	; 0x4c
	add	r4, r9, r3, lsl #3
	strd	lr, r8, [sp, #16]
	ldr	lr, [sp, #36]	; 0x24
	adds	r4, #4
	add	r3, r9, r8, lsl #3
lab53: 	mov	r2, r4
	add	r1, r3, #8
	ldmia	r1, {r0, r1}
	ldr	r7, [r4, #-4]
	ldr	r5, [r2], #-4
	add	r6, fp
	cmp	lr, r6
	stmia	r2, {r0, r1}
	add	r4, r4, #8
	strd	r7, r5, [r3, #8]
	add	r3, ip
	bgt	lab53
	ldrd	lr, r5, [sp, #16]
lab52: 	ldr	r3, [sp, #36]	; 0x24
	cmp	fp, sl
	ite	le
	addle	r3, fp
	addgt	r3, sl
	cmp	lr, #512	; 0x200
	ldr	sl, [r9, r8, lsl #3]
	str	r3, [sp, #16]
	bgt	lab54
	ldr	r1, [sp, #8]
	mov	r2, lr, lsl #3
	add	r0, sp, #248	; 0xf8
	bl	memcpy
lab98: 	ldr	r3, [sp, #36]	; 0x24
	str	r3, [sp, #20]
	movs	r6, #0
	add	r3, r9, #4
	str	r8, [sp, #24]
	str	r8, [sp, #8]
	mov	r4, r6
	str	r6, [sp, #40]	; 0x28
	str	r3, [sp, #32]
lab71: 	subs	r3, r6, r4
	cmp	r3, #0
	ble	lab55
lab68: 	add	r3, r6, #536870912	; 0x20000000
	subs	r3, #1
	ldr	r3, [r9, r3, lsl #3]
	cmp	r3, sl
	blt	lab55
lab69: 	subs	r7, r6, #1
	cmp	r4, r7
	bge	lab56
	ldr	r0, [r9, r5, lsl #3]
	mov	r2, r7
lab58: 	subs	r3, r2, r4
	add	r3, r4, r3, asr #1
	ldr	r1, [r9, r3, lsl #3]
	cmp	r1, r0
	bge	lab57
	adds	r4, r3, #1
	cmp	r2, r4
	bgt	lab58
lab56: 	cmp	r7, r4
	bne	lab59
	ldr	r2, [r9, r4, lsl #3]
	ldr	r3, [r9, r5, lsl #3]
	cmp	r2, r3
	it	lt
	addlt	r4, #1
lab59: 	cmp	fp, #0
	ldr	r3, [sp, #8]
	sub	r6, r6, r4
	ble	lab60
	subs	r5, r5, r3
	add	r2, r9, r3, lsl #3
	add	r7, fp, r3
	ldr	r3, [sp, #32]
	adds	r2, #4
	add	sl, r3, r7, lsl #3
	mov	r8, r5, lsl #3
	mov	ip, r6
	mov	lr, r4
lab61: 	mov	r3, r2
	ldr	r6, [r2, #-4]
	ldr	r4, [r3], #-4
	add	r1, r3, r8
	ldmia	r1, {r0, r1}
	stmia	r3, {r0, r1}
	str	r6, [r3, r5, lsl #3]
	str	r4, [r2, r5, lsl #3]
	adds	r2, #8
	cmp	r2, sl
	bne	lab61
	mov	r6, ip
	mov	r4, lr
lab81: 	add	r2, sp, #248	; 0xf8
	strd	r4, r2, [sp]
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
	add	ip, r9, r8, lsl #3
	ldmia	ip, {r0, r1}
	add	lr, r9, r5, lsl #3
	ldr	sl, [r9, r5, lsl #3]
	ldr	r2, [lr, #4]
	stmia	lr, {r0, r1}
	str	sl, [r9, r8, lsl #3]
	str	r2, [ip, #4]
	add	r2, sp, #152	; 0x98
	ldmia	r2, {r1, r2}
	ldr	r0, [sp, #44]	; 0x2c
	strd	r3, r4, [sp, #208]	; 0xd0
	bl	WikiMerge.constprop.0.isra.0
	cmp	fp, #512	; 0x200
	mov	r5, r5, lsl #3
	bgt	lab62
	sub	r1, r5, #8
	ldr	r2, [sp, #76]	; 0x4c
	add	r1, r9
	add	r0, sp, #248	; 0xf8
	bl	memcpy
lab73: 	cmp	r6, #0
	sub	r5, r7, r6
	ble	lab63
	ldr	r3, [sp, #32]
	subs	r5, r5, r4
	add	r2, r9, r4, lsl #3
	add	r4, r6
	adds	r2, #4
	add	lr, r3, r4, lsl #3
	mov	r8, r5, lsl #3
	mov	ip, r6
lab64: 	mov	r3, r2
	ldr	r6, [r2, #-4]
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
	add	r3, fp
	str	r3, [sp, #24]
	add	r6, r3
	ldr	r3, [sp, #12]
	cmp	r7, r3
	beq	lab65
	adds	r5, r7, #1
	mov	r0, r3
	add	r3, fp, r5
	cmp	r0, r3
	ble	lab66
	ldr	r1, [r9, r5, lsl #3]
lab67: 	ldr	r2, [r9, r3, lsl #3]
	cmp	r1, r2
	it	gt
	movgt	r5, r3
	add	r3, fp
	it	gt
	movgt	r1, r2
	cmp	r3, r0
	blt	lab67
	subs	r5, #1
lab82: 	ldr	r4, [sp, #24]
	ldr	sl, [r9, r5, lsl #3]
	str	r7, [sp, #8]
	subs	r3, r6, r4
	cmp	r3, #0
	bgt	lab68
lab55: 	ldrd	r3, r2, [sp, #16]
	cmp	r3, r2
	beq	lab69
	subs	r6, r3, r2
	cmp	fp, r6
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
	add	r2, r9
	add	sl, r3, r7, lsl #3
	mov	r8, r5, lsl #3
	mov	ip, r6
	mov	lr, r4
lab72: 	mov	r3, r2
	ldr	r6, [r2, #-4]
	ldr	r4, [r3], #-4
	add	r1, r3, r8
	ldmia	r1, {r0, r1}
	stmia	r3, {r0, r1}
	str	r6, [r3, r5, lsl #3]
	str	r4, [r2, r5, lsl #3]
	adds	r2, #8
	cmp	r2, sl
	bne	lab72
	mov	r6, ip
	mov	r4, lr
	b	lab73
lab70: 	cmp	fp, #0
	ble	lab74
	ldr	r1, [sp, #8]
	mov	r3, r2
	subs	r4, r3, r1
	ldr	r3, [sp, #32]
	add	r2, r9, r1, lsl #3
	add	r7, fp, r1
	adds	r2, #4
	add	r8, r3, r7, lsl #3
	mov	lr, r4, lsl #3
	mov	ip, r5
lab75: 	mov	r3, r2
	ldr	r5, [r2, #-4]
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
lab99: 	ldrd	r1, r2, [sp, #8]
	cmp	r5, r1
	it	eq
	moveq	r5, r2
	add	r2, fp
	str	r2, [sp, #12]
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #16]
	str	r7, [sp, #8]
	add	r2, fp
	str	r2, [sp, #20]
	ldr	r2, [sp, #84]	; 0x54
	add	r3, fp
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
lab80: 	ldr	r3, [sp, #52]	; 0x34
	ldr	r2, [sp, #96]	; 0x60
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
lab146: 	ldr	r3, [sp, #124]	; 0x7c
	subs	r3, #1
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
lab60: 	add	r7, fp, r3
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
lab86: 	add	r3, r9, r4, lsl #3
	ldr	r2, [r9, r4, lsl #3]
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
	ldr	sl, [sp, #64]	; 0x40
	str	r2, [sp, #120]	; 0x78
	add	r3, r2
	strd	sl, r3, [sp, #104]	; 0x68
	str	r3, [sp, #80]	; 0x50
	movs	r3, #0
	str	r2, [sp, #44]	; 0x2c
	str	r3, [sp, #16]
lab164: 	str	r5, [sp, #92]	; 0x5c
	mov	r2, r4
lab155: 	ldr	r3, [sp, #68]	; 0x44
	ldr	r7, [sp, #148]	; 0x94
	str	fp, [sp, #8]
	movs	r6, #0
	add	r8, r3, #4294967295	; 0xffffffff
lab91: 	cmp	r4, r8
	add	fp, r9, r4, lsl #3
	add	lr, r2, #1
	add	r1, r4, #1
	rsb	r0, r6, #0
	add	r3, sp, #248	; 0xf8
	beq	lab89
	ldr	fp, [fp, #-8]
	ldr	ip, [r9, r4, lsl #3]
	cmp	fp, ip
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
	ldr	fp, [sp, #8]
	subs	r7, r2, r3
	add	r3, r9, r3, lsl #3
	str	r3, [sp, #8]
	ldr	r3, [sp, #28]
	str	r3, [sp, #48]	; 0x30
lab157: 	ldr	r3, [sp, #16]
	cmp	r3, #0
	ble	lab92
	ldr	r3, [sp, #64]	; 0x40
	str	fp, [sp, #20]
	subs	r6, r3, #1
	mov	r4, sl
	mov	fp, r6
	mov	r6, sl
	ldr	sl, [sp, #16]
	movs	r5, #0
	add	r8, sp, #216	; 0xd8
lab95: 	cmp	r4, fp
	add	r2, r9, r4, lsl #3
	mov	r0, r5
	add	r3, sp, #248	; 0xf8
	beq	lab93
	ldr	r1, [r9, r4, lsl #3]
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
lab94: 	cmp	r5, sl
	add	r4, r4, #1
	blt	lab95
	ldr	fp, [sp, #20]
lab92: 	ldr	r3, [sp, #28]
	ldr	r2, [sp, #36]	; 0x24
	str	r3, [sp, #128]	; 0x80
	ldr	r3, [sp, #104]	; 0x68
	str	r3, [sp, #84]	; 0x54
	sub	sl, r3, r2
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
	add	r2, r9, r1, lsl #3
	add	ip, r9, #4
	subs	r4, r3, r1
	adds	r2, #4
	add	ip, ip, r8, lsl #3
	mov	lr, r4, lsl #3
lab97: 	mov	r3, r2
	ldr	r7, [r2, #-4]
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
	add	r7, fp, r3
	b	lab99
lab88: 	ldr	r3, [sp, #64]	; 0x40
	ldr	r2, [sp, #36]	; 0x24
	subs	r3, #2
	cmp	r2, r3
	bgt	lab100
	ldr	r6, [sp, #116]	; 0x74
	movs	r0, #1
	subs	r4, r2, #1
lab104: 	add	r2, r9, r3, lsl #3
	ldr	r1, [r9, r3, lsl #3]
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
	mov	sl, r4
	bne	lab104
lab166: 	ldr	r2, [sp, #112]	; 0x70
	cmp	r2, r0
	add	r3, r0, sl
	beq	lab105
lab156: 	ble	lab106
lab131: 	ldr	r3, [sp, #64]	; 0x40
	str	fp, [sp, #16]
	subs	r6, r3, #1
	mov	sl, r6
	ldr	r6, [sp, #12]
	ldr	r5, [sp, #28]
	add	r8, sp, #232	; 0xe8
	mov	fp, r3
	cmp	r6, sl
	strd	r6, fp, [sp, #168]	; 0xa8
	mov	r7, #512	; 0x200
	str	r8, [sp, #8]
	bge	lab107
lab116: 	ldr	r0, [r9, r5, lsl #3]
	mov	r4, r6
	mov	r2, sl
lab109: 	subs	r3, r2, r4
	add	r3, r4, r3, asr #1
	ldr	r1, [r9, r3, lsl #3]
	cmp	r1, r0
	bge	lab108
	adds	r4, r3, #1
	cmp	r4, r2
	blt	lab109
lab117: 	cmp	r4, sl
	bne	lab110
	ldr	r3, [sp, #52]	; 0x34
	ldr	r2, [sp, #88]	; 0x58
	ldr	r2, [r3, r2]
	ldr	r3, [r9, r5, lsl #3]
	cmp	r2, r3
	it	lt
	movlt	r4, fp
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
	ldr	r0, [r9, lr, lsl #3]
	mov	r2, ip
lab113: 	subs	r3, r2, r5
	add	r3, r5, r3, asr #1
	ldr	r1, [r9, r3, lsl #3]
	cmp	r1, r0
	bgt	lab112
	adds	r5, r3, #1
	cmp	r5, r2
	blt	lab113
lab111: 	cmp	r5, ip
	beq	lab114
lab118: 	sub	r8, r4, r5
	cmp	r8, #0
	ble	lab115
lab119: 	sub	r3, fp, r4
	cmp	r3, #0
	ble	lab115
	mov	r6, r4
	cmp	r6, sl
	strd	r6, fp, [sp, #168]	; 0xa8
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
lab114: 	ldr	r2, [r9, lr, lsl #3]
	ldr	r3, [r9, r5, lsl #3]
	cmp	r2, r3
	blt	lab118
	cmp	r8, #0
	mov	r5, r6
	bgt	lab119
lab115: 	ldr	fp, [sp, #16]
	b	lab80
lab87: 	ldr	ip, [sp, #36]	; 0x24
	adds	r2, r4, #1
	cmp	ip, r2
	ble	lab120
	ldr	lr, [sp, #116]	; 0x74
	movs	r0, #0
lab124: 	add	r3, r9, r2, lsl #3
	ldr	r1, [r9, r2, lsl #3]
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
lab130: 	add	r3, r9, r2, lsl #3
	ldr	r1, [r9, r2, lsl #3]
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
lab159: 	ldr	r2, [sp, #36]	; 0x24
	subs	r3, #1
	cmp	r2, r3
	bgt	lab131
	ldr	r6, [sp, #116]	; 0x74
	movs	r0, #0
	subs	r4, r2, #1
lab135: 	add	r2, r9, r3, lsl #3
	ldr	r1, [r9, r3, lsl #3]
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
	mov	sl, r4
	bne	lab135
	ldr	r3, [sp, #112]	; 0x70
	cmp	r3, r0
	bne	lab131
lab158: 	mov	r0, r3
	ldr	r3, [sp, #116]	; 0x74
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
	add	r3, sl
	b	lab136
lab78: 	ldr	r3, [sp, #44]	; 0x2c
	adds	r5, r3, #1
	ldr	r3, [sp, #120]	; 0x78
	cmp	r3, r5
	ble	lab137
	ldr	r6, [sp, #44]	; 0x2c
	mov	ip, r3
lab141: 	add	r3, r9, r5, lsl #3
	ldr	r4, [r9, r5, lsl #3]
	ldr	r7, [r3, #4]
	mov	r2, r5
	b	lab138
lab140: 	ldmdb	r3, {r0, r1}
	cmp	r6, r2
	stmia	r3, {r0, r1}
	bge	lab139
lab138: 	add	r3, r9, r2, lsl #3
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
lab145: 	ldr	r3, [sp, #104]	; 0x68
	cmp	r3, r4
	beq	lab143
lab151: 	ldr	r1, [r9, r6, lsl #3]
	ldr	r2, [r9, r4, lsl #3]
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
	ldrd	sl, r7, [sp, #128]	; 0x80
	mov	r6, r2
	mvn	r4, #3758096384	; 0xe0000000
	add	r5, sp, #176	; 0xb0
lab153: 	cmp	sl, r6
	add	r0, r6, r4
	add	r1, r7, r4
	beq	lab147
lab149: 	ldr	r0, [r9, r0, lsl #3]
	ldr	r1, [r9, r1, lsl #3]
	cmp	r0, r1
	sub	r8, r2, r6
	mov	ip, #512	; 0x200
	add	r3, sp, #248	; 0xf8
	sub	lr, r7, r2
	ble	lab148
	cmp	lr, #0
	add	r6, r6, #4294967295	; 0xffffffff
	ble	lab146
	cmp	sl, r6
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
lab150: 	strd	r7, r6, [sp, #176]	; 0xb0
	add	r3, sp, #248	; 0xf8
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
	add	r3, r9, r2, lsl #3
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
lab152: 	strd	r6, r4, [sp, #184]	; 0xb8
	str	r8, [sp]
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
	ldr	sl, [sp, #64]	; 0x40
	str	r3, [sp, #44]	; 0x2c
	movs	r3, #0
	str	sl, [sp, #104]	; 0x68
	mov	r4, r2
	str	r3, [sp, #16]
	b	lab155
lab103: 	ldr	r2, [sp, #112]	; 0x70
	mov	r0, r5
	mov	sl, r3
	cmp	r2, r0
	add	r3, r0, sl
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
lab167: 	sub	r2, r3, sl
	ldr	r3, [sp, #64]	; 0x40
	ldr	r7, [sp, #100]	; 0x64
	str	r2, [sp, #16]
	subs	r3, r3, r2
	str	r3, [sp, #104]	; 0x68
	ldr	r3, [sp, #28]
	str	r0, [sp, #92]	; 0x5c
	str	r3, [sp, #108]	; 0x6c
	b	lab157
lab134: 	mov	sl, r3
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
lab163: 	add	r2, r9, r3, lsl #3
	ldr	r1, [r9, r3, lsl #3]
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
	mov	sl, r6
	bne	lab163
	cmp	r5, r0
	bne	lab131
lab165: 	ldr	r1, [sp, #64]	; 0x40
	ldr	r3, [sp, #28]
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
	mov	sl, r3
	bne	lab131
	b	lab165
lab100: 	mov	sl, r3
	movs	r0, #1
	b	lab166
lab154: 	ldr	r3, [sp, #120]	; 0x78
	ldr	r2, [sp, #36]	; 0x24
	subs	r7, r2, r3
	add	r2, r9, r3, lsl #3
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
	str	sl, [sp, #48]	; 0x30
	b	lab167
	nop
benchmark_body.constprop.0:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
	movw	r4, #0
	movt	r4, #8192	; 0x2000
	ldmia	r4!, {r0, r1, r2, r3}
	sub	sp, #44	; 0x2c
	add	r6, sp, #4
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	movw	r5, #6236	; 0x185c
	ldr	r3, [r4, #0]
	str	r3, [r6, #0]
	mov	r8, #168	; 0xa8
	mov	r9, r6
	movt	r5, #8192	; 0x2000
lab170: 	movs	r0, #0
	bl	srand_beebs
	mov	r7, sp
lab169: 	ldr	r6, [r7, #4]!
	movs	r4, #0
lab168: 	mov	r0, r4
	mov	r1, #400	; 0x190
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
benchmark_body.isra.0:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	movw	r4, #0
	movt	r4, #8192	; 0x2000
	mov	r9, r0
	ldmia	r4!, {r0, r1, r2, r3}
	sub	sp, #40	; 0x28
	add	r5, sp, #4
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	cmp	r9, #0
	ldr	r3, [r4, #0]
	str	r3, [r5, #0]
	ble	lab171
	movw	r5, #6236	; 0x185c
	mov	sl, #0
	add	r8, sp, #36	; 0x24
	movt	r5, #8192	; 0x2000
lab174: 	movs	r0, #0
	bl	srand_beebs
	mov	r7, sp
lab173: 	ldr	r6, [r7, #4]!
	movs	r4, #0
lab172: 	mov	r0, r4
	mov	r1, #400	; 0x190
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
	nop
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
lab183: 	add	r2, r9, r9, lsr #31
	cmp	r9, #1
	mov	r2, r2, asr #1
	ble	lab178
	subs	r3, r5, r2
	add	r3, r4, r3, lsl #3
	add	r2, r7
	add	r9, r4, #4
	add	r2, r4, r2, lsl #3
	adds	r3, #4
	add	r9, r9, r5, lsl #3
lab179: 	subs	r1, r3, #4
	ldmia	r1, {r0, r1}
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
lab181: 	subs	r3, r5, #4
	ldmia	r3, {r0, r1}
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
lab182: 	subs	r1, r2, #4
	ldmia	r1, {r0, r1}
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
lab184: 	add	sp, #8
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
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
lab187: 	subs	r4, r7, r5
	add	r4, r5, r4, asr #1
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
lab189: 	mov	r0, r5
	add	sp, #12
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
lab192: 	subs	r4, r7, r5
	add	r4, r5, r4, asr #1
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
lab194: 	mov	r0, r5
	add	sp, #12
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
lab199: 	add	sl, r4, #8
	ldmia	sl, {r0, r1}
	mov	r5, r9
	stmia	r6, {r0, r1}
	b	lab196
lab198: 	ldmia	r4, {r0, r1}
	subs	r5, #1
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
lab201: 	subs	r1, r2, #4
	ldmia	r1, {r0, r1}
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
lab203: 	add	r1, lr, r2, lsl #3
	ldmia	r1, {r0, r1}
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
lab212: 	add	r2, r9, r9, lsr #31
	cmp	r9, #1
	mov	r2, r2, asr #1
	ble	lab207
	subs	r3, r5, r2
	add	r3, r4, r3, lsl #3
	add	r2, r7
	add	r9, r4, #4
	add	r2, r4, r2, lsl #3
	adds	r3, #4
	add	r9, r9, r5, lsl #3
lab208: 	subs	r1, r3, #4
	ldmia	r1, {r0, r1}
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
lab210: 	subs	r3, r5, #4
	ldmia	r3, {r0, r1}
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
lab211: 	subs	r1, r2, #4
	ldmia	r1, {r0, r1}
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
lab213: 	add	sp, #8
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
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
lab217: 	ldmia	r6, {r0, r1}
	adds	r6, #8
	cmp	sl, r6
	stmdb	r5, {r0, r1}
	beq	lab215
lab218: 	adds	r5, #8
lab216: 	ldmia	r6, {r2, r3}
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
lab223: 	mov	r3, r7
	ldmia	r6, {r0, r1}
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
lab225: 	ldr	r3, [sp, #4]
	adds	r3, #1
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
lab226: 	add	r3, r4, r2, lsl #3
	ldmia	r3, {r0, r1}
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
lab230: 	adds	r4, #1
	strd	r2, r4, [sp, #208]	; 0xd0
	mov	r0, r6
	ldmia	r8, {r1, r2}
	bl	InsertionSort
	ldr	r3, [sp, #104]	; 0x68
	cmp	r3, r4
	sub	r5, r5, r9
	ble	lab229
lab231: 	add	r5, fp
	mov	r2, r4
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
lab275: 	ldr	r4, [sp, #68]	; 0x44
	mov	r0, r4
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
lab269: 	ldr	r3, [sp, #64]	; 0x40
	ldr	r2, [sp, #80]	; 0x50
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
lab293: 	ldr	r2, [sp, #20]
	sdiv	r3, r2, r9
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
lab239: 	mov	r2, r4
	add	r1, r7, r3, lsl #3
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
lab295: 	ldr	r3, [sp, #20]
	str	sl, [sp, #44]	; 0x2c
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
lab263: 	subs	r3, r5, r4
	cmp	r3, #0
	ble	lab241
lab250: 	add	r3, r5, #536870912	; 0x20000000
	subs	r3, #1
	add	r3, r7, r3, lsl #3
	ldmia	r3, {r0, r1}
	add	r3, sp, #184	; 0xb8
	ldmia	r3, {r2, r3}
	ldr	r6, [sp, #24]
	blx	r6
	cmp	r0, #0
	bne	lab241
lab251: 	strd	r4, r5, [sp, #176]	; 0xb0
	ldr	r3, [sp, #24]
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
lab243: 	add	r2, sl, r3, lsl #3
	ldmia	r2, {r0, r1}
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
lab265: 	ldr	r3, [sp, #20]
	cmp	r5, #0
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
lab246: 	add	r2, ip, r3, lsl #3
	ldmia	r2, {r0, r1}
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
lab249: 	add	r3, r7, sl, lsl #3
	add	r1, r7, r4, lsl #3
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
lab277: 	add	r3, r7, sl, lsl #3
	ldmia	r3, {r0, r1}
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
lab258: 	subs	r1, r4, #4
	ldmia	r1, {r0, r1}
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
lab260: 	subs	r1, r3, #4
	ldmia	r1, {r0, r1}
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
lab262: 	subs	r1, r2, #4
	ldmia	r1, {r0, r1}
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
lab271: 	ldr	r3, [sp, #40]	; 0x28
	str	r5, [sp, #20]
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
lab264: 	add	r1, ip, r3, lsl #3
	ldmia	r1, {r0, r1}
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
lab267: 	add	r2, r4, r3, lsl #3
	ldmia	r2, {r0, r1}
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
lab276: 	ldr	r3, [sp, #48]	; 0x30
	ldr	r2, [sp, #104]	; 0x68
	cmp	r3, r2
	bge	lab268
lab272: 	str	r3, [sp, #36]	; 0x24
	mov	r1, r3
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
lab329: 	ldr	r2, [sp, #68]	; 0x44
	ldr	r3, [sp, #80]	; 0x50
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
lab283: 	mov	r6, r5
	adds	r5, #8
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
lab347: 	ldr	r3, [sp, #120]	; 0x78
	cmp	r3, #512	; 0x200
	bgt	lab284
lab296: 	cmp	r4, r3
	bne	lab285
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
lab346: 	ldr	r3, [sp, #120]	; 0x78
	mov	r1, r3
lab337: 	strd	r9, fp, [sp, #40]	; 0x28
	add	r5, r7, sl, lsl #3
	add	r3, sp, #232	; 0xe8
	mov	fp, r7
	ldr	r7, [sp, #24]
	str	r3, [sp, #20]
	mov	r4, sl
	mov	r8, #0
	mov	r9, r1
lab288: 	ldr	r3, [sp, #36]	; 0x24
	cmp	r4, r3
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
lab314: 	ldr	r3, [sp, #32]
	cmp	r3, #0
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
lab292: 	cmp	r5, sl
	sub	r8, r4, #8
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
lab294: 	add	r2, r4, r3, lsl #3
	ldmia	r2, {r0, r1}
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
lab301: 	mov	r4, r5
	adds	r5, #8
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
lab340: 	ldr	r2, [sp, #120]	; 0x78
	cmp	r3, r2
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
lab308: 	add	r5, r4, #8
	ldmia	r4, {r0, r1}
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
lab313: 	add	r5, r4, #8
	ldmia	r4, {r0, r1}
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
lab341: 	ldr	r3, [sp, #120]	; 0x78
	cmp	r6, r3
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
lab339: 	ldr	r2, [sp, #28]
	ldr	r3, [sp, #156]	; 0x9c
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
lab319: 	add	r5, r4, #8
	ldmia	r4, {r0, r1}
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
lab349: 	ldr	r3, [sp, #120]	; 0x78
	cmp	r6, r3
	beq	lab320
lab338: 	ldr	r3, [sp, #28]
	add	r3, r6
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
lab324: 	cmp	r2, #0
	ble	lab323
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
lab328: 	ldr	r2, [sp, #116]	; 0x74
	cmp	r2, r4
	add	r3, r7, r6, lsl #3
	add	r1, r7, r4, lsl #3
	beq	lab326
lab333: 	ldmia	r3, {r2, r3}
	ldmia	r1, {r0, r1}
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
lab332: 	adds	r3, r5, r6
	add	r1, r9, r6
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
lab334: 	strd	r6, r4, [sp, #264]	; 0x108
	add	r3, sp, #280	; 0x118
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
lab335: 	strd	r6, r4, [sp, #272]	; 0x110
	add	r3, sp, #280	; 0x118
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
lab345: 	add	r4, r5, #8
	ldmia	r5, {r0, r1}
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
lab348: 	ldr	r3, [sp, #120]	; 0x78
	cmp	r6, r3
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
	sub	sp, sp, #3200	; 0xc80
	mov	r4, #3200	; 0xc80
	movw	r1, #36	; 0x24
	mov	r2, r4
	movt	r1, #8192	; 0x2000
	mov	r0, sp
	bl	memcpy
	movw	r0, #6236	; 0x185c
	mov	r2, r4
	mov	r1, sp
	movt	r0, #8192	; 0x2000
	bl	memcmp
	clz	r0, r0
	lsrs	r0, r0, #5
	add	sp, sp, #3200	; 0xc80
	pop	{r4, pc}
	nop
initialise_benchmark:
	bx	lr
	nop
warm_caches:
	b	benchmark_body.isra.0
benchmark:
	b	benchmark_body.constprop.0
	.word	0x08007560
	.word	0x20000000
	.word	0x2000185c
	.word	0x2000185c
	.word	0x200024ec
SystemInit:
	mov	r3, #14336	; 0x3800
	movt	r3, #16386	; 0x4002
	movs	r1, #0
	ldr	r2, [r3, #0]
	orr	r2, r2, #1
	str	r2, [r3, #0]
	str	r1, [r3, #8]
	ldr	r2, [r3, #0]
	movw	r0, #12304	; 0x3010
	bic	r2, r2, #17301504	; 0x1080000
	bic	r2, r2, #65536	; 0x10000
	movt	r0, #9216	; 0x2400
	str	r2, [r3, #0]
	str	r0, [r3, #4]
	ldr	r2, [r3, #0]
	bic	r2, r2, #262144	; 0x40000
	str	r2, [r3, #0]
	str	r1, [r3, #12]
	bx	lr
	nop
set_sysclk_to_168:
	mov	r3, #14336	; 0x3800
	movt	r3, #16386	; 0x4002
	ldr	r2, [r3, #0]
	orr	r2, r2, #65536	; 0x10000
	str	r2, [r3, #0]
lab350: 	ldr	r2, [r3, #0]
	lsls	r0, r2, #14
	bpl	lab350
	ldr	r1, [r3, #64]	; 0x40
	mov	r2, #28672	; 0x7000
	movt	r2, #16384	; 0x4000
	orr	r1, r1, #268435456	; 0x10000000
	str	r1, [r3, #64]	; 0x40
	ldr	r1, [r2, #0]
	orr	r1, r1, #16384	; 0x4000
	str	r1, [r2, #0]
	ldr	r2, [r3, #8]
	str	r2, [r3, #8]
	ldr	r2, [r3, #8]
	orr	r2, r2, #5120	; 0x1400
	str	r2, [r3, #8]
	ldr	r1, [r3, #8]
	movw	r0, #23048	; 0x5a08
	orr	r1, r1, #32768	; 0x8000
	movt	r0, #1856	; 0x740
	str	r1, [r3, #8]
	str	r0, [r3, #4]
	ldr	r1, [r3, #0]
	mov	r2, #14336	; 0x3800
	orr	r1, r1, #16777216	; 0x1000000
	movt	r2, #16386	; 0x4002
	str	r1, [r3, #0]
lab351: 	ldr	r3, [r2, #0]
	lsls	r1, r3, #6
	bpl	lab351
	mov	r3, #15360	; 0x3c00
	movt	r3, #16386	; 0x4002
	movw	r1, #1797	; 0x705
	str	r1, [r3, #0]
	ldr	r3, [r2, #8]
	bic	r3, r3, #3
	str	r3, [r2, #8]
	ldr	r3, [r2, #8]
	mov	r1, #14336	; 0x3800
	orr	r3, r3, #2
	movt	r1, #16386	; 0x4002
	str	r3, [r2, #8]
lab352: 	ldr	r3, [r1, #8]
	lsls	r3, r3, #28
	bpl	lab352
	movw	r3, #3760	; 0xeb0
	movt	r3, #8192	; 0x2000
	mov	r2, #31232	; 0x7a00
	movt	r2, #2563	; 0xa03
	str	r2, [r3, #0]
	bx	lr
	nop
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
initialise_board:
	mov	r1, #3758153728	; 0xe000e000
	mov	r2, #4096	; 0x1000
	ldr	r3, [r1, #3580]	; 0xdfc
	movt	r2, #57344	; 0xe000
	orr	r3, r3, #16777216	; 0x1000000
	movs	r0, #0
	str	r3, [r1, #3580]	; 0xdfc
	str	r0, [r2, #4]
	bx	lr
	nop
start_trigger:
	mov	r3, #4096	; 0x1000
	movt	r3, #57344	; 0xe000
	ldr	r2, [r3, #0]
	orr	r2, r2, #1
	str	r2, [r3, #0]
	bx	lr
	nop
stop_trigger:
	mov	r3, #4096	; 0x1000
	movt	r3, #57344	; 0xe000
	movs	r2, #0
	str	r2, [r3, #4]
	ldr	r2, [r3, #0]
	bic	r2, r2, #1
	str	r2, [r3, #0]
	bx	lr
	nop
rand_beebs:
	movw	r3, #9436	; 0x24dc
	movt	r3, #8192	; 0x2000
	movw	r2, #20077	; 0x4e6d
	ldr	r1, [r3, #0]
	movt	r2, #16838	; 0x41c6
	movw	r0, #12345	; 0x3039
	mla	r0, r2, r1, r0
	bic	r0, r0, #2147483648	; 0x80000000
	str	r0, [r3, #0]
	lsrs	r0, r0, #16
	bx	lr
srand_beebs:
	movw	r3, #9436	; 0x24dc
	movt	r3, #8192	; 0x2000
	str	r0, [r3, #0]
	bx	lr
init_heap_beebs:
	ands	r2, r1, #3
	push	{r3, lr}
	bne	lab353
	movw	r3, #9436	; 0x24dc
	movt	r3, #8192	; 0x2000
	add	r1, r0
	strd	r0, r1, [r3, #4]
	str	r2, [r3, #12]
	pop	{r3, pc}
lab353: 	movw	r3, #3240	; 0xca8
	movw	r2, #3320	; 0xcf8
	movw	r0, #3272	; 0xcc8
	movt	r3, #8192	; 0x2000
	movt	r2, #8192	; 0x2000
	movs	r1, #65	; 0x41
	movt	r0, #8192	; 0x2000
	bl	__assert_func
check_heap_beebs:
	movw	r3, #9436	; 0x24dc
	movt	r3, #8192	; 0x2000
	ldrd	r3, r2, [r3, #8]
	add	r0, r2
	cmp	r3, r0
	ite	cc
	movcc	r0, #0
	movcs	r0, #1
	bx	lr
malloc_beebs:
	mov	r3, r0
	cbz	r0, lab354
	movw	r2, #9436	; 0x24dc
	movt	r2, #8192	; 0x2000
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
	nop
calloc_beebs:
	mul	r2, r1, r0
	push	{r4, lr}
	cbz	r2, lab355
	movw	r3, #9436	; 0x24dc
	movt	r3, #8192	; 0x2000
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
	nop
realloc_beebs:
	cmp	r0, #0
	beq	lab357
	cmp	r1, #0
	beq	lab357
	movw	r3, #9436	; 0x24dc
	movt	r3, #8192	; 0x2000
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
lab360: 	ldr	lr, [r3], #4
	str	lr, [ip], #4
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
lab362: 	ldrb	r4, [r3, #1]!
	strb	r4, [r1, #1]!
	cmp	r3, r2
	bne	lab362
	pop	{r4, r5, pc}
lab357: 	movs	r0, #0
	bx	lr
free_beebs:
	bx	lr
	nop
	push	{r4, r5, r6, lr}
	mov	ip, #255	; 0xff
	orr	ip, ip, #1792	; 0x700
	ands	r4, ip, r1, lsr #20
	ittte	ne
	andsne	r5, ip, r3, lsr #20
	teqne	r4, ip
	teqne	r5, ip
	bleq	lab363
	add	r4, r5
	eor	r6, r1, r3
	bic	r1, r1, ip, lsl #21
	bic	r3, r3, ip, lsl #21
	orrs	r5, r0, r1, lsl #12
	it	ne
	orrsne	r5, r2, r3, lsl #12
	orr	r1, r1, #1048576	; 0x100000
	orr	r3, r3, #1048576	; 0x100000
	beq	lab364
	umull	ip, lr, r0, r2
	mov	r5, #0
	umlal	lr, r5, r1, r2
	and	r2, r6, #2147483648	; 0x80000000
	umlal	lr, r5, r0, r3
	mov	r6, #0
	umlal	r5, r6, r1, r3
	teq	ip, #0
	it	ne
	orrne	lr, lr, #1
	sub	r4, r4, #255	; 0xff
	cmp	r6, #512	; 0x200
	sbc	r4, r4, #768	; 0x300
	bcs	lab365
	movs	lr, lr, lsl #1
	adcs	r5, r5
	adc	r6, r6, r6
lab365: 	orr	r1, r2, r6, lsl #11
	orr	r1, r1, r5, lsr #21
	mov	r0, r5, lsl #11
	orr	r0, r0, lr, lsr #21
	mov	lr, lr, lsl #11
	subs	ip, r4, #253	; 0xfd
	it	hi
	cmphi	ip, #1792	; 0x700
	bhi	lab366
	cmp	lr, #2147483648	; 0x80000000
	it	eq
	movseq	lr, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	pop	{r4, r5, r6, pc}
lab364: 	and	r6, r6, #2147483648	; 0x80000000
	orr	r1, r6, r1
	orr	r0, r0, r2
	eor	r1, r1, r3
	subs	r4, r4, ip, lsr #1
	ittt	gt
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	popgt	{r4, r5, r6, pc}
	orr	r1, r1, #1048576	; 0x100000
	mov	lr, #0
	subs	r4, #1
lab366: 	bgt	lab367
	cmn	r4, #54	; 0x36
	ittt	le
	movle	r0, #0
	andle	r1, r1, #2147483648	; 0x80000000
	pople	{r4, r5, r6, pc}
	rsb	r4, r4, #0
	subs	r4, #32
	bge	lab368
	adds	r4, #12
	bgt	lab369
	add	r4, r4, #20
	rsb	r5, r4, #32
	lsl	r3, r0, r5
	lsr	r0, r0, r4
	lsl	r2, r1, r5
	orr	r0, r0, r2
	and	r2, r1, #2147483648	; 0x80000000
	bic	r1, r1, #2147483648	; 0x80000000
	adds	r0, r0, r3, lsr #31
	lsr	r6, r1, r4
	adc	r1, r2, r6
	orrs	lr, lr, r3, lsl #1
	it	eq
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, pc}
lab369: 	rsb	r4, r4, #12
	rsb	r5, r4, #32
	lsl	r3, r0, r4
	lsr	r0, r0, r5
	lsl	r2, r1, r4
	orr	r0, r0, r2
	and	r1, r1, #2147483648	; 0x80000000
	adds	r0, r0, r3, lsr #31
	adc	r1, r1, #0
	orrs	lr, lr, r3, lsl #1
	it	eq
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, pc}
lab368: 	rsb	r5, r4, #32
	lsl	r2, r0, r5
	orr	lr, lr, r2
	lsr	r3, r0, r4
	lsl	r2, r1, r5
	orr	r3, r3, r2
	lsr	r0, r1, r4
	and	r1, r1, #2147483648	; 0x80000000
	lsr	r2, r1, r4
	bic	r0, r0, r2
	add	r0, r0, r3, lsr #31
	orrs	lr, lr, r3, lsl #1
	it	eq
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, pc}
lab374: 	teq	r4, #0
	bne	lab370
	and	r6, r1, #2147483648	; 0x80000000
lab371: 	lsls	r0, r0, #1
	adc	r1, r1, r1
	tst	r1, #1048576	; 0x100000
	it	eq
	subeq	r4, #1
	beq	lab371
	orr	r1, r1, r6
	teq	r5, #0
	it	ne
	bxne	lr
lab370: 	and	r6, r3, #2147483648	; 0x80000000
lab372: 	lsls	r2, r2, #1
	adc	r3, r3, r3
	tst	r3, #1048576	; 0x100000
	it	eq
	subeq	r5, #1
	beq	lab372
	orr	r3, r3, r6
	bx	lr
lab363: 	teq	r4, ip
	and	r5, ip, r3, lsr #20
	it	ne
	teqne	r5, ip
	beq	lab373
	orrs	r6, r0, r1, lsl #1
	it	ne
	orrsne	r6, r2, r3, lsl #1
	bne	lab374
	eor	r1, r1, r3
	and	r1, r1, #2147483648	; 0x80000000
	mov	r0, #0
	pop	{r4, r5, r6, pc}
lab373: 	orrs	r6, r0, r1, lsl #1
	itte	eq
	moveq	r0, r2
	moveq	r1, r3
	orrsne	r6, r2, r3, lsl #1
	beq	lab375
	teq	r4, ip
	bne	lab376
	orrs	r6, r0, r1, lsl #12
	bne	lab375
lab376: 	teq	r5, ip
	bne	lab377
	orrs	r6, r2, r3, lsl #12
	itt	ne
	movne	r0, r2
	movne	r1, r3
	bne	lab375
lab377: 	eor	r1, r1, r3
lab367: 	and	r1, r1, #2147483648	; 0x80000000
	orr	r1, r1, #2130706432	; 0x7f000000
	orr	r1, r1, #15728640	; 0xf00000
	mov	r0, #0
	pop	{r4, r5, r6, pc}
lab375: 	orr	r1, r1, #2130706432	; 0x7f000000
	orr	r1, r1, #16252928	; 0xf80000
	pop	{r4, r5, r6, pc}
__aeabi_drsub:
	eor	r1, r1, #2147483648	; 0x80000000
	b	__adddf3
	nop
__aeabi_dsub:
	eor	r3, r3, #2147483648	; 0x80000000
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
	beq	lab378
	mov	r4, r4, lsr #21
	rsbs	r5, r4, r5, lsr #21
	it	lt
	neglt	r5, r5
	ble	lab379
	add	r4, r5
	eor	r2, r0, r2
	eor	r3, r1, r3
	eor	r0, r2, r0
	eor	r1, r3, r1
	eor	r2, r0, r2
	eor	r3, r1, r3
lab379: 	cmp	r5, #54	; 0x36
	it	hi
	pophi	{r4, r5, pc}
	tst	r1, #2147483648	; 0x80000000
	mov	r1, r1, lsl #12
	mov	ip, #1048576	; 0x100000
	orr	r1, ip, r1, lsr #12
	beq	lab380
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab380: 	tst	r3, #2147483648	; 0x80000000
	mov	r3, r3, lsl #12
	orr	r3, ip, r3, lsr #12
	beq	lab381
	negs	r2, r2
	sbc	r3, r3, r3, lsl #1
lab381: 	teq	r4, r5
	beq	lab382
lab394: 	sub	r4, r4, #1
	rsbs	lr, r5, #32
	blt	lab383
	lsl	ip, r2, lr
	lsr	r2, r2, r5
	adds	r0, r0, r2
	adc	r1, r1, #0
	lsl	r2, r3, lr
	adds	r0, r0, r2
	asr	r3, r3, r5
	adcs	r1, r3
	b	lab384
lab383: 	sub	r5, r5, #32
	add	lr, lr, #32
	cmp	r2, #1
	lsl	ip, r3, lr
	it	cs
	orrcs	ip, ip, #2
	asr	r3, r3, r5
	adds	r0, r0, r3
	adcs	r1, r1, r3, asr #31
lab384: 	and	r5, r1, #2147483648	; 0x80000000
	bpl	lab385
	mov	lr, #0
	rsbs	ip, ip, #0
	sbcs	r0, lr, r0
	sbc	r1, lr, r1
lab385: 	cmp	r1, #1048576	; 0x100000
	bcc	lab386
	cmp	r1, #2097152	; 0x200000
	bcc	lab387
	lsrs	r1, r1, #1
	movs	r0, r0, rrx
	mov	ip, ip, rrx
	add	r4, r4, #1
	mov	r2, r4, lsl #21
	cmn	r2, #4194304	; 0x400000
	bcs	lab388
lab387: 	cmp	ip, #2147483648	; 0x80000000
	it	eq
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	orr	r1, r1, r5
	pop	{r4, r5, pc}
lab386: 	movs	ip, ip, lsl #1
	adcs	r0, r0
	adc	r1, r1, r1
	subs	r4, #1
	it	cs
	cmpcs	r1, #1048576	; 0x100000
	bcs	lab387
lab398: 	teq	r1, #0
	itt	eq
	moveq	r1, r0
	moveq	r0, #0
	clz	r3, r1
	it	eq
	addeq	r3, #32
	sub	r3, r3, #11
	subs	r2, r3, #32
	bge	lab389
	adds	r2, #12
	ble	lab390
	add	ip, r2, #20
	rsb	r2, r2, #12
	lsl	r0, r1, ip
	lsr	r1, r1, r2
	b	lab391
lab390: 	add	r2, r2, #20
lab389: 	it	le
	rsble	ip, r2, #32
	lsl	r1, r1, r2
	lsr	ip, r0, ip
	itt	le
	orrle	r1, r1, ip
	lslle	r0, r2
lab391: 	subs	r4, r4, r3
	ittt	ge
	addge	r1, r1, r4, lsl #20
	orrge	r1, r5
	popge	{r4, r5, pc}
	mvn	r4, r4
	subs	r4, #31
	bge	lab392
	adds	r4, #12
	bgt	lab393
	add	r4, r4, #20
	rsb	r2, r4, #32
	lsr	r0, r0, r4
	lsl	r3, r1, r2
	orr	r0, r0, r3
	lsr	r3, r1, r4
	orr	r1, r5, r3
	pop	{r4, r5, pc}
lab393: 	rsb	r4, r4, #12
	rsb	r2, r4, #32
	lsr	r0, r0, r2
	lsl	r3, r1, r4
	orr	r0, r0, r3
	mov	r1, r5
	pop	{r4, r5, pc}
lab392: 	lsr	r0, r1, r4
	mov	r1, r5
	pop	{r4, r5, pc}
lab382: 	teq	r4, #0
	eor	r3, r3, #1048576	; 0x100000
	itte	eq
	eoreq	r1, r1, #1048576	; 0x100000
	addeq	r4, #1
	subne	r5, #1
	b	lab394
lab378: 	mvns	ip, r4, asr #21
	it	ne
	mvnsne	ip, r5, asr #21
	beq	lab395
	teq	r4, r5
	it	eq
	teqeq	r0, r2
	beq	lab396
	orrs	ip, r4, r0
	itt	eq
	moveq	r1, r3
	moveq	r0, r2
	pop	{r4, r5, pc}
lab396: 	teq	r1, r3
	ittt	ne
	movne	r1, #0
	movne	r0, #0
	popne	{r4, r5, pc}
	movs	ip, r4, lsr #21
	bne	lab397
	lsls	r0, r0, #1
	adcs	r1, r1
	it	cs
	orrcs	r1, r1, #2147483648	; 0x80000000
	pop	{r4, r5, pc}
lab397: 	adds	r4, r4, #4194304	; 0x400000
	itt	cc
	addcc	r1, r1, #1048576	; 0x100000
	popcc	{r4, r5, pc}
	and	r5, r1, #2147483648	; 0x80000000
lab388: 	orr	r1, r5, #2130706432	; 0x7f000000
	orr	r1, r1, #15728640	; 0xf00000
	mov	r0, #0
	pop	{r4, r5, pc}
lab395: 	mvns	ip, r4, asr #21
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
	orrne	r1, r1, #524288	; 0x80000
	pop	{r4, r5, pc}
	nop
__aeabi_ui2d:
	teq	r0, #0
	itt	eq
	moveq	r1, #0
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, #1024	; 0x400
	add	r4, r4, #50	; 0x32
	mov	r5, #0
	mov	r1, #0
	b	lab398
	nop
__aeabi_i2d:
	teq	r0, #0
	itt	eq
	moveq	r1, #0
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, #1024	; 0x400
	add	r4, r4, #50	; 0x32
	ands	r5, r0, #2147483648	; 0x80000000
	it	mi
	negmi	r0, r0
	mov	r1, #0
	b	lab398
	nop
__aeabi_f2d:
	lsls	r2, r0, #1
	mov	r1, r2, asr #3
	mov	r1, r1, rrx
	mov	r0, r2, lsl #28
	itttt	ne
	andsne	r3, r2, #4278190080	; 0xff000000
	teqne	r3, #4278190080	; 0xff000000
	eorne	r1, r1, #939524096	; 0x38000000
	bxne	lr
	bics	r2, r2, #4278190080	; 0xff000000
	it	eq
	bxeq	lr
	teq	r3, #4278190080	; 0xff000000
	itt	eq
	orreq	r1, r1, #524288	; 0x80000
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, #896	; 0x380
	and	r5, r1, #2147483648	; 0x80000000
	bic	r1, r1, #2147483648	; 0x80000000
	b	lab398
	nop
__aeabi_ul2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	mov	r5, #0
	b	lab399
__aeabi_l2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	ands	r5, r1, #2147483648	; 0x80000000
	bpl	lab399
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab399: 	mov	r4, #1024	; 0x400
	add	r4, r4, #50	; 0x32
	movs	ip, r1, lsr #22
	beq	lab385
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
	b	lab385
	nop
__aeabi_dmul:
	push	{r4, r5, r6, lr}
	mov	ip, #255	; 0xff
	orr	ip, ip, #1792	; 0x700
	ands	r4, ip, r1, lsr #20
	ittte	ne
	andsne	r5, ip, r3, lsr #20
	teqne	r4, ip
	teqne	r5, ip
	bleq	lab400
	add	r4, r5
	eor	r6, r1, r3
	bic	r1, r1, ip, lsl #21
	bic	r3, r3, ip, lsl #21
	orrs	r5, r0, r1, lsl #12
	it	ne
	orrsne	r5, r2, r3, lsl #12
	orr	r1, r1, #1048576	; 0x100000
	orr	r3, r3, #1048576	; 0x100000
	beq	lab401
	umull	ip, lr, r0, r2
	mov	r5, #0
	umlal	lr, r5, r1, r2
	and	r2, r6, #2147483648	; 0x80000000
	umlal	lr, r5, r0, r3
	mov	r6, #0
	umlal	r5, r6, r1, r3
	teq	ip, #0
	it	ne
	orrne	lr, lr, #1
	sub	r4, r4, #255	; 0xff
	cmp	r6, #512	; 0x200
	sbc	r4, r4, #768	; 0x300
	bcs	lab402
	movs	lr, lr, lsl #1
	adcs	r5, r5
	adc	r6, r6, r6
lab402: 	orr	r1, r2, r6, lsl #11
	orr	r1, r1, r5, lsr #21
	mov	r0, r5, lsl #11
	orr	r0, r0, lr, lsr #21
	mov	lr, lr, lsl #11
	subs	ip, r4, #253	; 0xfd
	it	hi
	cmphi	ip, #1792	; 0x700
	bhi	lab403
	cmp	lr, #2147483648	; 0x80000000
	it	eq
	movseq	lr, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	pop	{r4, r5, r6, pc}
lab401: 	and	r6, r6, #2147483648	; 0x80000000
	orr	r1, r6, r1
	orr	r0, r0, r2
	eor	r1, r1, r3
	subs	r4, r4, ip, lsr #1
	ittt	gt
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	popgt	{r4, r5, r6, pc}
	orr	r1, r1, #1048576	; 0x100000
	mov	lr, #0
	subs	r4, #1
lab403: 	bgt	lab404
	cmn	r4, #54	; 0x36
	ittt	le
	movle	r0, #0
	andle	r1, r1, #2147483648	; 0x80000000
	pople	{r4, r5, r6, pc}
	rsb	r4, r4, #0
	subs	r4, #32
	bge	lab405
	adds	r4, #12
	bgt	lab406
	add	r4, r4, #20
	rsb	r5, r4, #32
	lsl	r3, r0, r5
	lsr	r0, r0, r4
	lsl	r2, r1, r5
	orr	r0, r0, r2
	and	r2, r1, #2147483648	; 0x80000000
	bic	r1, r1, #2147483648	; 0x80000000
	adds	r0, r0, r3, lsr #31
	lsr	r6, r1, r4
	adc	r1, r2, r6
	orrs	lr, lr, r3, lsl #1
	it	eq
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, pc}
lab406: 	rsb	r4, r4, #12
	rsb	r5, r4, #32
	lsl	r3, r0, r4
	lsr	r0, r0, r5
	lsl	r2, r1, r4
	orr	r0, r0, r2
	and	r1, r1, #2147483648	; 0x80000000
	adds	r0, r0, r3, lsr #31
	adc	r1, r1, #0
	orrs	lr, lr, r3, lsl #1
	it	eq
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, pc}
lab405: 	rsb	r5, r4, #32
	lsl	r2, r0, r5
	orr	lr, lr, r2
	lsr	r3, r0, r4
	lsl	r2, r1, r5
	orr	r3, r3, r2
	lsr	r0, r1, r4
	and	r1, r1, #2147483648	; 0x80000000
	lsr	r2, r1, r4
	bic	r0, r0, r2
	add	r0, r0, r3, lsr #31
	orrs	lr, lr, r3, lsl #1
	it	eq
	biceq	r0, r0, r3, lsr #31
	pop	{r4, r5, r6, pc}
lab411: 	teq	r4, #0
	bne	lab407
	and	r6, r1, #2147483648	; 0x80000000
lab408: 	lsls	r0, r0, #1
	adc	r1, r1, r1
	tst	r1, #1048576	; 0x100000
	it	eq
	subeq	r4, #1
	beq	lab408
	orr	r1, r1, r6
	teq	r5, #0
	it	ne
	bxne	lr
lab407: 	and	r6, r3, #2147483648	; 0x80000000
lab409: 	lsls	r2, r2, #1
	adc	r3, r3, r3
	tst	r3, #1048576	; 0x100000
	it	eq
	subeq	r5, #1
	beq	lab409
	orr	r3, r3, r6
	bx	lr
lab400: 	teq	r4, ip
	and	r5, ip, r3, lsr #20
	it	ne
	teqne	r5, ip
	beq	lab410
	orrs	r6, r0, r1, lsl #1
	it	ne
	orrsne	r6, r2, r3, lsl #1
	bne	lab411
lab423: 	eor	r1, r1, r3
	and	r1, r1, #2147483648	; 0x80000000
	mov	r0, #0
	pop	{r4, r5, r6, pc}
lab410: 	orrs	r6, r0, r1, lsl #1
	itte	eq
	moveq	r0, r2
	moveq	r1, r3
	orrsne	r6, r2, r3, lsl #1
	beq	lab412
	teq	r4, ip
	bne	lab413
	orrs	r6, r0, r1, lsl #12
	bne	lab412
lab413: 	teq	r5, ip
	bne	lab414
	orrs	r6, r2, r3, lsl #12
	itt	ne
	movne	r0, r2
	movne	r1, r3
	bne	lab412
lab414: 	eor	r1, r1, r3
lab404: 	and	r1, r1, #2147483648	; 0x80000000
	orr	r1, r1, #2130706432	; 0x7f000000
	orr	r1, r1, #15728640	; 0xf00000
	mov	r0, #0
	pop	{r4, r5, r6, pc}
lab412: 	orr	r1, r1, #2130706432	; 0x7f000000
	orr	r1, r1, #16252928	; 0xf80000
	pop	{r4, r5, r6, pc}
__aeabi_ddiv:
	push	{r4, r5, r6, lr}
	mov	ip, #255	; 0xff
	orr	ip, ip, #1792	; 0x700
	ands	r4, ip, r1, lsr #20
	ittte	ne
	andsne	r5, ip, r3, lsr #20
	teqne	r4, ip
	teqne	r5, ip
	bleq	lab415
	sub	r4, r4, r5
	eor	lr, r1, r3
	orrs	r5, r2, r3, lsl #12
	mov	r1, r1, lsl #12
	beq	lab416
	mov	r3, r3, lsl #12
	mov	r5, #268435456	; 0x10000000
	orr	r3, r5, r3, lsr #4
	orr	r3, r3, r2, lsr #24
	mov	r2, r2, lsl #8
	orr	r5, r5, r1, lsr #4
	orr	r5, r5, r0, lsr #24
	mov	r6, r0, lsl #8
	and	r1, lr, #2147483648	; 0x80000000
	cmp	r5, r3
	it	eq
	cmpeq	r6, r2
	adc	r4, r4, #253	; 0xfd
	add	r4, r4, #768	; 0x300
	bcs	lab417
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
lab417: 	subs	r6, r6, r2
	sbc	r5, r5, r3
	lsrs	r3, r3, #1
	mov	r2, r2, rrx
	mov	r0, #1048576	; 0x100000
	mov	ip, #524288	; 0x80000
lab419: 	subs	lr, r6, r2
	sbcs	lr, r5, r3
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
	beq	lab418
	mov	r5, r5, lsl #4
	orr	r5, r5, r6, lsr #28
	mov	r6, r6, lsl #4
	mov	r3, r3, lsl #3
	orr	r3, r3, r2, lsr #29
	mov	r2, r2, lsl #3
	movs	ip, ip, lsr #4
	bne	lab419
	tst	r1, #1048576	; 0x100000
	bne	lab420
	orr	r1, r1, r0
	mov	r0, #0
	mov	ip, #2147483648	; 0x80000000
	b	lab419
lab418: 	tst	r1, #1048576	; 0x100000
	itt	eq
	orreq	r1, r0
	moveq	r0, #0
lab420: 	subs	ip, r4, #253	; 0xfd
	it	hi
	cmphi	ip, #1792	; 0x700
	bhi	lab403
	subs	ip, r5, r3
	itt	eq
	subseq	ip, r6, r2
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	pop	{r4, r5, r6, pc}
lab416: 	and	lr, lr, #2147483648	; 0x80000000
	orr	r1, lr, r1, lsr #12
	adds	r4, r4, ip, lsr #1
	ittt	gt
	rsbsgt	r5, r4, ip
	orrgt	r1, r1, r4, lsl #20
	popgt	{r4, r5, r6, pc}
	orr	r1, r1, #1048576	; 0x100000
	mov	lr, #0
	subs	r4, #1
	b	lab403
	orr	lr, r5, r6
	b	lab403
lab415: 	and	r5, ip, r3, lsr #20
	teq	r4, ip
	it	eq
	teqeq	r5, ip
	beq	lab412
	teq	r4, ip
	bne	lab421
	orrs	r4, r0, r1, lsl #12
	bne	lab412
	teq	r5, ip
	bne	lab414
	mov	r0, r2
	mov	r1, r3
	b	lab412
lab421: 	teq	r5, ip
	bne	lab422
	orrs	r5, r2, r3, lsl #12
	beq	lab423
	mov	r0, r2
	mov	r1, r3
	b	lab412
lab422: 	orrs	r6, r0, r1, lsl #1
	it	ne
	orrsne	r6, r2, r3, lsl #1
	bne	lab411
	orrs	r4, r0, r1, lsl #1
	bne	lab414
	orrs	r5, r2, r3, lsl #1
	bne	lab423
	b	lab412
__gedf2:
	mov	ip, #4294967295	; 0xffffffff
	b	lab424
	nop
__ledf2:
	mov	ip, #1
	b	lab424
	nop
__cmpdf2:
	mov	ip, #1
lab424: 	str	ip, [sp, #-4]!
	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	mov	ip, r3, lsl #1
	it	ne
	mvnsne	ip, ip, asr #21
	beq	lab425
lab428: 	add	sp, #4
	orrs	ip, r0, r1, lsl #1
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
lab425: 	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	bne	lab426
	orrs	ip, r0, r1, lsl #12
	bne	lab427
lab426: 	mov	ip, r3, lsl #1
	mvns	ip, ip, asr #21
	bne	lab428
	orrs	ip, r2, r3, lsl #12
	beq	lab428
lab427: 	ldr	r0, [sp], #4
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
	pop	{r0, pc}
__aeabi_dcmpeq:
	str	lr, [sp, #-8]!
	bl	__aeabi_cdcmpeq
	ite	eq
	moveq	r0, #1
	movne	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmplt:
	str	lr, [sp, #-8]!
	bl	__aeabi_cdcmpeq
	ite	cc
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmple:
	str	lr, [sp, #-8]!
	bl	__aeabi_cdcmpeq
	ite	ls
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpge:
	str	lr, [sp, #-8]!
	bl	__aeabi_cdrcmple
	ite	ls
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpgt:
	str	lr, [sp, #-8]!
	bl	__aeabi_cdrcmple
	ite	cc
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpun:
	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	bne	lab429
	orrs	ip, r0, r1, lsl #12
	bne	lab430
lab429: 	mov	ip, r3, lsl #1
	mvns	ip, ip, asr #21
	bne	lab431
	orrs	ip, r2, r3, lsl #12
	bne	lab430
lab431: 	mov	r0, #0
	bx	lr
lab430: 	mov	r0, #1
	bx	lr
__aeabi_d2iz:
	mov	r2, r1, lsl #1
	adds	r2, r2, #2097152	; 0x200000
	bcs	lab432
	bpl	lab433
	mvn	r3, #992	; 0x3e0
	subs	r2, r3, r2, asr #21
	bls	lab434
	mov	r3, r1, lsl #11
	orr	r3, r3, #2147483648	; 0x80000000
	orr	r3, r3, r0, lsr #21
	tst	r1, #2147483648	; 0x80000000
	lsr	r0, r3, r2
	it	ne
	negne	r0, r0
	bx	lr
lab433: 	mov	r0, #0
	bx	lr
lab432: 	orrs	r0, r0, r1, lsl #12
	bne	lab435
lab434: 	ands	r0, r1, #2147483648	; 0x80000000
	it	eq
	mvneq	r0, #2147483648	; 0x80000000
	bx	lr
lab435: 	mov	r0, #0
	bx	lr
	nop
memcpy:
	mov	ip, r0
	orr	r3, r1, r0
	ands	r3, r3, #3
	bne	lab436
lab445: 	subs	r2, #64	; 0x40
	bcc	lab437
lab438: 	ldr	r3, [r1], #4
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
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #64	; 0x40
	bcs	lab438
lab437: 	adds	r2, #48	; 0x30
	bcc	lab439
lab440: 	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #16
	bcs	lab440
lab439: 	adds	r2, #12
	bcc	lab441
lab442: 	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #4
	bcs	lab442
lab441: 	adds	r2, #4
	beq	lab443
	lsls	r2, r2, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab443
	ldrh	r3, [r1, #0]
	strh	r3, [r0, #0]
lab443: 	mov	r0, ip
	bx	lr
	nop
lab436: 	cmp	r2, #8
	bcc	lab444
	lsls	r3, r1, #30
	beq	lab445
	ands	r3, r0, #3
	beq	lab445
	rsb	r3, r3, #4
	subs	r2, r2, r3
	lsls	r3, r3, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab445
	ldrh	r3, [r1], #2
	strh	r3, [r0], #2
	b	lab445
lab444: 	subs	r2, #4
	bcc	lab441
lab446: 	subs	r2, #1
	ldrb	r3, [r1], #1
	strb	r3, [r0], #1
	bcs	lab446
	ldrb	r3, [r1, #0]
	strb	r3, [r0, #0]
	ldrb	r3, [r1, #1]
	strb	r3, [r0, #1]
	ldrb	r3, [r1, #2]
	strb	r3, [r0, #2]
	mov	r0, ip
	bx	lr
memchr:
	and	r1, r1, #255	; 0xff
	cmp	r2, #16
	blt	lab447
	tst	r0, #7
	beq	lab448
lab451: 	ldrb	r3, [r0], #1
	subs	r2, #1
	cmp	r3, r1
	beq	lab449
	tst	r0, #7
	cbz	r2, lab450
	bne	lab451
lab448: 	push	{r4, r5, r6, r7}
	orr	r1, r1, r1, lsl #8
	orr	r1, r1, r1, lsl #16
	bic	r4, r2, #7
	mvns	r7, #0
	movs	r3, #0
lab453: 	ldrd	r5, r6, [r0], #8
	subs	r4, #8
	eor	r5, r5, r1
	eor	r6, r6, r1
	uadd8	r5, r5, r7
	sel	r5, r3, r7
	uadd8	r6, r6, r7
	sel	r6, r5, r7
	cbnz	r6, lab452
	bne	lab453
	pop	{r4, r5, r6, r7}
	and	r1, r1, #255	; 0xff
	and	r2, r2, #7
lab447: 	cbz	r2, lab450
lab454: 	ldrb	r3, [r0], #1
	subs	r2, #1
	eor	r3, r3, r1
	cbz	r3, lab449
	bne	lab454
lab450: 	movs	r0, #0
	bx	lr
lab449: 	subs	r0, #1
	bx	lr
lab452: 	cmp	r5, #0
	itte	eq
	moveq	r5, r6
	subeq	r0, #3
	subne	r0, #7
	tst	r5, #1
	bne	lab455
	adds	r0, #1
	tst	r5, #256	; 0x100
	ittt	eq
	addeq	r0, #1
	tsteq	r5, #98304	; 0x18000
	addeq	r0, #1
lab455: 	pop	{r4, r5, r6, r7}
	subs	r0, #1
	bx	lr
	nop
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
lab456: 	sub	r0, r2, r3
	bx	lr
	nop
strcmp:
	ldrb	r2, [r0, #0]
	ldrb	r3, [r1, #0]
	cmp	r2, #1
	it	cs
	cmpcs	r2, r3
	bne	lab456
	strd	r4, r5, [sp, #-16]!
	orr	r4, r0, r1
	strd	r6, r7, [sp, #8]
	mvn	ip, #0
	mov	r2, r4, lsl #29
	cbz	r2, lab457
	eor	r4, r0, r1
	tst	r4, #7
	bne	lab458
	and	r4, r0, #7
	bic	r0, r0, #7
	and	r5, r4, #3
	bic	r1, r1, #7
	mov	r5, r5, lsl #3
	ldrd	r2, r3, [r0], #16
	tst	r4, #4
	ldrd	r6, r7, [r1], #16
	lsl	r4, ip, r5
	orn	r2, r2, r4
	orn	r6, r6, r4
	beq	lab459
	orn	r3, r3, r4
	mov	r2, ip
	orn	r7, r7, r4
	mov	r6, ip
	b	lab459
lab457: 	ldrd	r2, r3, [r0], #16
	ldrd	r6, r7, [r1], #16
lab459: 	uadd8	r5, r2, ip
	eor	r4, r2, r6
	sel	r4, r4, ip
	cbnz	r4, lab460
	uadd8	r5, r3, ip
	eor	r5, r3, r7
	sel	r5, r5, ip
	cbnz	r5, lab461
	ldrd	r2, r3, [r0, #-8]
	ldrd	r6, r7, [r1, #-8]
	uadd8	r5, r2, ip
	eor	r4, r2, r6
	sel	r4, r4, ip
	uadd8	r5, r3, ip
	eor	r5, r3, r7
	sel	r5, r5, ip
	orrs	r5, r4
	beq	lab457
	cbnz	r4, lab460
lab461: 	rev	r5, r5
	clz	r4, r5
	bic	r4, r4, #7
	lsr	r1, r7, r4
	ldrd	r6, r7, [sp, #8]
	lsr	r3, r3, r4
	and	r0, r3, #255	; 0xff
	and	r1, r1, #255	; 0xff
	ldrd	r4, r5, [sp], #16
	sub	r0, r0, r1
	bx	lr
lab460: 	rev	r4, r4
	clz	r4, r4
	bic	r4, r4, #7
	lsr	r1, r6, r4
	ldrd	r6, r7, [sp, #8]
	lsr	r2, r2, r4
	and	r0, r2, #255	; 0xff
	and	r1, r1, #255	; 0xff
	ldrd	r4, r5, [sp], #16
	sub	r0, r0, r1
	bx	lr
lab458: 	tst	r4, #3
	bne	lab462
	ands	r4, r0, #3
	bne	lab463
lab465: 	ldr	r2, [r0], #8
	ldr	r3, [r1], #8
lab466: 	uadd8	r5, r2, ip
	eor	r5, r2, r3
	sel	r5, r5, ip
	cbnz	r5, lab464
	ldr	r2, [r0, #-4]
	ldr	r3, [r1, #-4]
	uadd8	r5, r2, ip
	eor	r5, r2, r3
	sel	r5, r5, ip
	cmp	r5, #0
	beq	lab465
lab464: 	rev	r5, r5
	clz	r4, r5
	bic	r4, r4, #7
	lsr	r1, r3, r4
	lsr	r2, r2, r4
	and	r0, r2, #255	; 0xff
	and	r1, r1, #255	; 0xff
	ldrd	r4, r5, [sp], #16
	sub	r0, r0, r1
	bx	lr
lab463: 	mov	r4, r4, lsl #3
	bic	r0, r0, #3
	ldr	r2, [r0], #8
	bic	r1, r1, #3
	ldr	r3, [r1], #8
	lsl	r4, ip, r4
	orn	r2, r2, r4
	orn	r3, r3, r4
	b	lab466
lab462: 	ands	r4, r0, #3
	beq	lab467
	sub	r1, r1, r4
	bic	r0, r0, #3
	lsls	r4, r4, #31
	ldr	r2, [r0], #4
	beq	lab468
	bcs	lab469
	ldrb	r3, [r1, #2]
	uxtb	r4, r2, ror #16
	subs	r4, r4, r3
	bne	lab470
	cbz	r3, lab470
lab468: 	ldrb	r3, [r1, #3]
	uxtb	r4, r2, ror #24
	subs	r4, r4, r3
	bne	lab470
	cbnz	r3, lab469
lab470: 	mov	r0, r4
	ldr	r4, [sp], #16
	bx	lr
lab469: 	add	r1, r1, #4
lab467: 	ldr	r2, [r0], #4
	lsls	r4, r1, #31
	bic	r1, r1, #3
	ldr	r3, [r1], #4
	bhi	lab471
	bcs	lab472
lab476: 	bic	r4, r2, #4278190080	; 0xff000000
	uadd8	r5, r2, ip
	eors	r5, r4, r3, lsr #8
	sel	r5, r5, ip
	bne	lab473
	cbnz	r5, lab474
	ldr	r3, [r1], #4
	eor	r4, r4, r2
	cmp	r4, r3, lsl #24
	bne	lab475
	ldr	r2, [r0], #4
	b	lab476
lab473: 	mov	r3, r3, lsr #8
	b	lab477
lab474: 	bics	r5, r5, #4278190080	; 0xff000000
	bne	lab478
	ldrb	r0, [r1, #0]
	ldrd	r4, r5, [sp], #16
	rsb	r0, r0, #0
	bx	lr
lab475: 	mov	r2, r2, lsr #24
	and	r3, r3, #255	; 0xff
	b	lab477
lab472: 	and	r4, r2, ip, lsr #16
	uadd8	r5, r2, ip
	eors	r5, r4, r3, lsr #16
	sel	r5, r5, ip
	bne	lab479
	cbnz	r5, lab480
	ldr	r3, [r1], #4
	eor	r4, r4, r2
	cmp	r4, r3, lsl #16
	bne	lab481
	ldr	r2, [r0], #4
	b	lab472
lab479: 	mov	r3, r3, lsr #16
	b	lab477
lab480: 	ands	r5, r5, ip, lsr #16
	bne	lab478
	ldrh	r3, [r1, #0]
	mov	r2, r2, lsr #16
	b	lab477
lab481: 	mov	r2, r2, lsr #16
	and	r3, r3, ip, lsr #16
	b	lab477
lab471: 	and	r4, r2, #255	; 0xff
	uadd8	r5, r2, ip
	eors	r5, r4, r3, lsr #24
	sel	r5, r5, ip
	bne	lab482
	cbnz	r5, lab483
	ldr	r3, [r1], #4
	eor	r4, r4, r2
	cmp	r4, r3, lsl #8
	bne	lab484
	ldr	r2, [r0], #4
	b	lab471
lab482: 	mov	r3, r3, lsr #24
	b	lab477
lab483: 	tst	r5, #255	; 0xff
	bne	lab478
	ldr	r3, [r1, #0]
lab484: 	mov	r2, r2, lsr #8
	bic	r3, r3, #4278190080	; 0xff000000
	b	lab477
lab478: 	mov	r0, #0
	ldrd	r4, r5, [sp], #16
	bx	lr
lab477: 	rev	r2, r2
	rev	r3, r3
	uadd8	r4, r2, ip
	eor	r4, r2, r3
	sel	r5, r4, ip
	clz	r4, r5
	lsl	r2, r2, r4
	lsl	r3, r3, r4
	mov	r0, r2, lsr #24
	ldrd	r4, r5, [sp], #16
	sub	r0, r0, r3, lsr #24
	bx	lr
	movs	r0, r0
	movs	r0, r0
strlen:
	pld	[r0]
	strd	r4, r5, [sp, #-8]!
	bic	r1, r0, #7
	mvn	ip, #0
	ands	r4, r0, #7
	pld	[r1, #32]
	bne	lab485
	mov	r4, #0
	mvn	r0, #7
lab487: 	ldrd	r2, r3, [r1]
	pld	[r1, #64]	; 0x40
	add	r0, r0, #8
lab488: 	uadd8	r2, r2, ip
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab486
	ldrd	r2, r3, [r1, #8]
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab486
	ldrd	r2, r3, [r1, #16]
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab486
	ldrd	r2, r3, [r1, #24]
	add	r1, r1, #32
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cmp	r3, #0
	beq	lab487
lab486: 	cmp	r2, #0
	itt	eq
	addeq	r0, #4
	moveq	r2, r3
	rev	r2, r2
	clz	r2, r2
	ldrd	r4, r5, [sp], #8
	add	r0, r0, r2, lsr #3
	bx	lr
lab485: 	ldrd	r2, r3, [r1]
	and	r5, r4, #3
	rsb	r0, r4, #0
	mov	r5, r5, lsl #3
	tst	r4, #4
	pld	[r1, #64]	; 0x40
	lsl	r5, ip, r5
	orn	r2, r2, r5
	itt	ne
	ornne	r3, r3, r5
	movne	r2, ip
	mov	r4, #0
	b	lab488
__aeabi_uldivmod:
	cbnz	r3, lab489
	cbnz	r2, lab489
	cmp	r1, #0
	it	eq
	cmpeq	r0, #0
	itt	ne
	movne	r1, #4294967295	; 0xffffffff
	movne	r0, #4294967295	; 0xffffffff
	b	__aeabi_idiv0
lab489: 	sub	ip, sp, #8
	strd	ip, lr, [sp, #-16]!
	bl	__udivmoddi4
	ldr	lr, [sp, #4]
	ldrd	r2, r3, [sp, #8]
	add	sp, #16
	bx	lr
__udivmoddi4:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r6, [sp, #32]
	mov	r5, r1
	mov	r4, r0
	mov	r8, r1
	cmp	r3, #0
	bne	lab490
	cmp	r2, r1
	mov	ip, r2
	bls	lab491
	clz	r2, r2
	cbz	r2, lab492
	lsl	r3, r1, r2
	rsb	r1, r2, #32
	lsr	r1, r0, r1
	lsl	ip, ip, r2
	orr	r8, r1, r3
	lsls	r4, r2
lab492: 	mov	r5, ip, lsr #16
	lsrs	r1, r4, #16
	udiv	lr, r8, r5
	uxth	r7, ip
	mls	r3, r5, lr, r8
	orr	r3, r1, r3, lsl #16
	mul	r1, lr, r7
	cmp	r1, r3
	bls	lab493
	adds	r3, ip, r3
	add	r0, lr, #4294967295	; 0xffffffff
	bcs	lab494
	cmp	r1, r3
	bls	lab494
	sub	lr, lr, #2
	add	r3, ip
lab493: 	subs	r3, r3, r1
	uxth	r4, r4
	udiv	r0, r3, r5
	mls	r3, r5, r0, r3
	orr	r4, r4, r3, lsl #16
	mul	r7, r0, r7
	cmp	r7, r4
	bls	lab495
	adds	r4, ip, r4
	add	r3, r0, #4294967295	; 0xffffffff
	bcs	lab496
	cmp	r7, r4
	bls	lab496
	add	r4, ip
	subs	r0, #2
lab495: 	subs	r4, r4, r7
	orr	r0, r0, lr, lsl #16
	movs	r1, #0
lab511: 	cbz	r6, lab497
	lsrs	r4, r2
	movs	r3, #0
	strd	r4, r3, [r6]
lab497: 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
lab490: 	cmp	r3, r1
	bls	lab498
	cmp	r6, #0
	beq	lab499
	movs	r1, #0
	strd	r0, r5, [r6]
	mov	r0, r1
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
lab498: 	clz	r1, r3
	cmp	r1, #0
	bne	lab500
	cmp	r3, r5
	bcc	lab501
	cmp	r2, r0
	bhi	lab502
lab501: 	subs	r4, r0, r2
	sbc	r3, r5, r3
	movs	r0, #1
	mov	r8, r3
lab525: 	cmp	r6, #0
	beq	lab497
	strd	r4, r8, [r6]
	b	lab497
lab491: 	cbnz	r2, lab503
	udf	#255	; 0xff
lab503: 	clz	r2, r2
	cmp	r2, #0
	bne	lab504
	sub	r5, r1, ip
	mov	r7, ip, lsr #16
	uxth	lr, ip
	movs	r1, #1
lab523: 	udiv	r3, r5, r7
	mls	r0, r7, r3, r5
	lsrs	r5, r4, #16
	orr	r5, r5, r0, lsl #16
	mul	r0, lr, r3
	cmp	r0, r5
	bls	lab505
	adds	r5, ip, r5
	add	r8, r3, #4294967295	; 0xffffffff
	bcs	lab506
	cmp	r0, r5
	bhi	lab507
lab506: 	mov	r3, r8
lab505: 	subs	r5, r5, r0
	uxth	r4, r4
	udiv	r0, r5, r7
	mls	r5, r7, r0, r5
	orr	r4, r4, r5, lsl #16
	mul	lr, lr, r0
	cmp	lr, r4
	bls	lab508
	adds	r4, ip, r4
	add	r5, r0, #4294967295	; 0xffffffff
	bcs	lab509
	cmp	lr, r4
	bhi	lab510
lab509: 	mov	r0, r5
lab508: 	sub	r4, r4, lr
	orr	r0, r0, r3, lsl #16
	b	lab511
lab500: 	rsb	r7, r1, #32
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
	bls	lab512
	adds	r5, ip, r5
	add	sl, r8, #4294967295	; 0xffffffff
	bcs	lab513
	cmp	r0, r5
	bls	lab513
	sub	r8, r8, #2
	add	r5, ip
lab512: 	subs	r5, r5, r0
	uxth	r4, r4
	udiv	r0, r5, r9
	mls	r5, r9, r0, r5
	orr	r5, r4, r5, lsl #16
	mul	lr, r0, lr
	cmp	lr, r5
	bls	lab514
	adds	r5, ip, r5
	add	r4, r0, #4294967295	; 0xffffffff
	bcs	lab515
	cmp	lr, r5
	bls	lab515
	subs	r0, #2
	add	r5, ip
lab514: 	orr	r0, r0, r8, lsl #16
	umull	r9, r4, r0, r2
	sub	r5, r5, lr
	cmp	r5, r4
	mov	r8, r9
	mov	lr, r4
	bcc	lab516
	beq	lab517
lab524: 	cbz	r6, lab518
	subs	r2, r3, r8
	sbc	r5, r5, lr
	lsl	r7, r5, r7
	lsr	r3, r2, r1
	lsrs	r5, r1
	orrs	r7, r3
	strd	r7, r5, [r6]
lab518: 	movs	r1, #0
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
lab504: 	rsb	r3, r2, #32
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
	bls	lab519
	adds	r3, ip, r3
	add	r8, r1, #4294967295	; 0xffffffff
	bcs	lab520
	cmp	r0, r3
	bls	lab520
	subs	r1, #2
	add	r3, ip
lab519: 	subs	r3, r3, r0
	uxth	r5, r5
	udiv	r0, r3, r7
	mls	r3, r7, r0, r3
	orr	r5, r5, r3, lsl #16
	mul	r3, r0, lr
	cmp	r3, r5
	bls	lab521
	adds	r5, ip, r5
	add	r8, r0, #4294967295	; 0xffffffff
	bcs	lab522
	cmp	r3, r5
	bls	lab522
	subs	r0, #2
	add	r5, ip
lab521: 	subs	r5, r5, r3
	orr	r1, r0, r1, lsl #16
	b	lab523
lab499: 	mov	r1, r6
	mov	r0, r6
	b	lab497
lab494: 	mov	lr, r0
	b	lab493
lab496: 	mov	r0, r3
	b	lab495
lab517: 	cmp	r3, r9
	bcs	lab524
lab516: 	subs	r8, r9, r2
	sbc	lr, r4, ip
	subs	r0, #1
	b	lab524
lab522: 	mov	r0, r8
	b	lab521
lab515: 	mov	r0, r4
	b	lab514
lab520: 	mov	r1, r8
	b	lab519
lab513: 	mov	r8, sl
	b	lab512
lab507: 	subs	r3, #2
	add	r5, ip
	b	lab505
lab502: 	mov	r0, r1
	b	lab525
lab510: 	add	r4, ip
	subs	r0, #2
	b	lab508
__aeabi_idiv0:
	bx	lr
	nop
sqrt:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	mov	r5, r1
	bl	__ieee754_sqrt
	mov	r2, r4
	mov	r6, r0
	mov	r7, r1
	mov	r3, r5
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmpun
	cbnz	r0, lab526
	mov	r0, r4
	mov	r1, r5
	movs	r2, #0
	movs	r3, #0
	bl	__aeabi_dcmplt
	cbnz	r0, lab527
lab526: 	mov	r0, r6
	mov	r1, r7
	pop	{r3, r4, r5, r6, r7, pc}
lab527: 	bl	__errno
	movs	r2, #0
	movs	r3, #0
	movs	r1, #33	; 0x21
	str	r1, [r0, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_ddiv
	mov	r6, r0
	mov	r7, r1
	mov	r0, r6
	mov	r1, r7
	pop	{r3, r4, r5, r6, r7, pc}
	nop
__ieee754_sqrt:
	ldr	r2, [pc, #388]	; (8004278 <__ieee754_sqrt+0x188>)
	bics	r2, r1
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	mov	r4, r1
	beq	lab528
	cmp	r1, #0
	mov	r3, r1
	mov	ip, r0
	ble	lab529
	asrs	r1, r1, #20
	beq	lab530
lab547: 	ubfx	r3, r3, #0, #20
	lsls	r0, r1, #31
	subw	r7, r1, #1023	; 0x3ff
	orr	r3, r3, #1048576	; 0x100000
	bmi	lab531
	lsls	r3, r3, #1
	add	r3, r3, ip, lsr #31
	mov	ip, ip, lsl #1
lab531: 	mov	r2, ip, lsr #31
	movs	r6, #0
	add	r3, r2, r3, lsl #1
	asrs	r7, r7, #1
	mov	ip, ip, lsl #1
	mov	lr, #22
	mov	r4, r6
	mov	r2, #2097152	; 0x200000
lab533: 	adds	r1, r4, r2
	cmp	r1, r3
	bgt	lab532
	subs	r3, r3, r1
	adds	r4, r1, r2
	add	r6, r2
lab532: 	lsls	r3, r3, #1
	subs	lr, lr, #1
	add	r3, r3, ip, lsr #31
	mov	r2, r2, lsr #1
	mov	ip, ip, lsl #1
	bne	lab533
	mov	r5, lr
	movs	r0, #32
	mov	r2, #2147483648	; 0x80000000
	b	lab534
lab537: 	beq	lab535
lab539: 	mov	r1, ip, lsr #31
	subs	r0, #1
	add	r3, r1, r3, lsl #1
	mov	ip, ip, lsl #1
	mov	r2, r2, lsr #1
	beq	lab536
lab534: 	cmp	r3, r4
	add	r1, r2, lr
	ble	lab537
	cmp	r1, #0
	add	lr, r1, r2
	blt	lab538
lab540: 	mov	r8, r4
lab541: 	subs	r3, r3, r4
	cmp	r1, ip
	it	hi
	addhi	r3, r3, #4294967295	; 0xffffffff
lab548: 	sub	ip, ip, r1
	add	r5, r2
	mov	r4, r8
	b	lab539
lab538: 	cmp	lr, #0
	blt	lab540
	add	r8, r4, #1
	b	lab541
lab529: 	bic	r2, r1, #2147483648	; 0x80000000
	orrs	r2, r0
	beq	lab542
	cmp	r1, #0
	bne	lab543
lab544: 	mov	r2, ip, lsr #11
	subs	r1, #21
	mov	r3, r2
	mov	ip, ip, lsl #21
	cmp	r2, #0
	beq	lab544
	lsls	r6, r2, #11
	bmi	lab545
lab530: 	movs	r0, #0
lab546: 	lsls	r3, r3, #1
	lsls	r5, r3, #11
	mov	r4, r0
	add	r0, r0, #1
	bpl	lab546
	mov	r2, r3
	mov	r3, ip
	lsl	ip, ip, r0
	rsb	r0, r0, #32
lab551: 	lsrs	r3, r0
	subs	r1, r1, r4
	orrs	r3, r2
	b	lab547
lab535: 	cmp	r1, ip
	bhi	lab539
	cmp	r1, #0
	add	lr, r1, r2
	blt	lab538
	mov	r8, r3
	movs	r3, #0
	b	lab548
lab536: 	orrs	r3, r3, ip
	bne	lab549
	lsrs	r0, r5, #1
lab550: 	asrs	r3, r6, #1
	add	r3, r3, #1069547520	; 0x3fc00000
	add	r3, r3, #2097152	; 0x200000
	lsls	r2, r6, #31
	it	mi
	orrmi	r0, r0, #2147483648	; 0x80000000
	add	r9, r3, r7, lsl #20
	mov	r5, r0
	mov	r4, r9
lab542: 	mov	r0, r5
	mov	r1, r4
	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
lab549: 	adds	r1, r5, #1
	itet	ne
	addne	r0, r5, #1
	addeq	r6, #1
	lsrne	r0, r0, #1
	b	lab550
lab528: 	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dmul
	mov	r2, r5
	mov	r3, r4
	bl	__adddf3
	mov	r5, r0
	mov	r4, r1
	mov	r0, r5
	mov	r1, r4
	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
lab543: 	mov	r2, r0
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_ddiv
	mov	r5, r0
	mov	r4, r1
	b	lab542
lab545: 	mov	r3, ip
	movs	r0, #32
	mov	r4, #4294967295	; 0xffffffff
	b	lab551
	nop
	.word	0x7ff00000
__assert_func:
	push	{lr}
	ldr	r4, [pc, #44]	; (80042ac <__assert_func+0x30>)
	ldr	r5, [r4, #0]
	mov	r4, r2
	ldr	r6, [r5, #12]
	mov	r2, r3
	sub	sp, #20
	mov	r3, r0
	mov	r5, r1
	cbz	r4, lab552
	ldr	r1, [pc, #28]	; (80042b0 <__assert_func+0x34>)
lab553: 	str	r5, [sp, #0]
	strd	r1, r4, [sp, #4]
	mov	r0, r6
	ldr	r1, [pc, #24]	; (80042b4 <__assert_func+0x38>)
	bl	fiprintf
	bl	abort
lab552: 	ldr	r1, [pc, #16]	; (80042b8 <__assert_func+0x3c>)
	mov	r4, r1
	b	lab553
	nop
	.word	0x20000eb4
	.word	0x20000d08
	.word	0x20000d18
	.word	0x20000d14
__assert:
	push	{r3, lr}
	mov	r3, r2
	movs	r2, #0
	bl	__assert_func
	nop
__errno:
	ldr	r3, [pc, #4]	; (80042d0 <__errno+0x8>)
	ldr	r0, [r3, #0]
	bx	lr
	nop
	.word	0x20000eb4
_fiprintf_r:
	push	{r2, r3}
	push	{lr}
	sub	sp, #12
	add	r3, sp, #16
	ldr	r2, [r3], #4
	str	r3, [sp, #4]
	bl	_vfiprintf_r
	add	sp, #12
	ldr	lr, [sp], #4
	add	sp, #8
	bx	lr
fiprintf:
	push	{r1, r2, r3}
	push	{r4, lr}
	sub	sp, #12
	add	r3, sp, #20
	ldr	r4, [pc, #24]	; (8004314 <fiprintf+0x24>)
	ldr	r2, [r3], #4
	str	r3, [sp, #4]
	mov	r1, r0
	ldr	r0, [r4, #0]
	bl	_vfiprintf_r
	add	sp, #12
	ldmia	sp!, {r4, lr}
	add	sp, #12
	bx	lr
	nop
	.word	0x20000eb4
memcmp:
	cmp	r2, #3
	push	{r4, lr}
	bls	lab554
	orr	ip, r0, r1
	tst	ip, #3
	mov	r4, r0
	mov	r3, r1
	bne	lab555
lab556: 	mov	r1, r3
	mov	r0, r4
	ldr	lr, [r1]
	ldr	ip, [r0]
	cmp	ip, lr
	add	r4, r4, #4
	add	r3, r3, #4
	bne	lab555
	subs	r2, #4
	cmp	r2, #3
	mov	r0, r4
	mov	r1, r3
	bhi	lab556
lab554: 	subs	r4, r2, #1
	cbz	r2, lab557
lab561: 	add	ip, r0, #4294967295	; 0xffffffff
	subs	r1, #1
	b	lab558
lab560: 	adds	r3, r0, r3
	beq	lab559
lab558: 	ldrb	lr, [ip, #1]!
	ldrb	r2, [r1, #1]!
	cmp	lr, r2
	sub	r3, r4, ip
	beq	lab560
	sub	r0, lr, r2
	pop	{r4, pc}
lab555: 	subs	r4, r2, #1
	b	lab561
lab559: 	mov	r0, r3
	pop	{r4, pc}
lab557: 	mov	r0, r2
	pop	{r4, pc}
memmove:
	cmp	r0, r1
	bls	lab562
	adds	r3, r1, r2
	cmp	r3, r0
	bls	lab562
	add	ip, r0, r2
	cbz	r2, lab563
	mov	r2, ip
lab564: 	ldrb	ip, [r3, #-1]!
	strb	ip, [r2, #-1]!
	cmp	r1, r3
	bne	lab564
	bx	lr
lab562: 	cmp	r2, #15
	bhi	lab565
	mov	r3, r0
	add	ip, r2, #4294967295	; 0xffffffff
	cbz	r2, lab563
lab573: 	add	ip, ip, #1
	subs	r3, #1
	add	ip, r1
lab566: 	ldrb	r2, [r1], #1
	strb	r2, [r3, #1]!
	cmp	r1, ip
	bne	lab566
lab563: 	bx	lr
lab565: 	orr	r3, r0, r1
	lsls	r3, r3, #30
	bne	lab567
	sub	r3, r2, #16
	push	{r4, r5, r6, lr}
	add	ip, r1, #32
	bic	r5, r3, #15
	add	lr, r1, #16
	add	r4, r0, #16
	add	ip, r5
	lsrs	r3, r3, #4
lab568: 	ldr	r5, [lr, #-16]
	str	r5, [r4, #-16]
	ldr	r5, [lr, #-12]
	str	r5, [r4, #-12]
	ldr	r5, [lr, #-8]
	str	r5, [r4, #-8]
	ldr	r5, [lr, #-4]
	str	r5, [r4, #-4]
	add	lr, lr, #16
	cmp	lr, ip
	add	r4, r4, #16
	bne	lab568
	adds	r3, #1
	tst	r2, #12
	add	r1, r1, r3, lsl #4
	and	r4, r2, #15
	add	r3, r0, r3, lsl #4
	beq	lab569
	subs	r4, #4
	bic	r6, r4, #3
	mov	ip, r4, lsr #2
	add	r6, r3
	subs	r4, r3, #4
	mov	lr, r1
lab570: 	ldr	r5, [lr], #4
	str	r5, [r4, #4]!
	cmp	r4, r6
	bne	lab570
	add	r4, ip, #1
	and	r2, r2, #3
	add	r3, r3, r4, lsl #2
	add	r1, r1, r4, lsl #2
lab574: 	add	ip, r2, #4294967295	; 0xffffffff
	cbz	r2, lab571
	add	ip, ip, #1
	subs	r3, #1
	add	ip, r1
lab572: 	ldrb	r2, [r1], #1
	strb	r2, [r3, #1]!
	cmp	r1, ip
	bne	lab572
lab571: 	pop	{r4, r5, r6, pc}
lab567: 	add	ip, r2, #4294967295	; 0xffffffff
	mov	r3, r0
	b	lab573
lab569: 	mov	r2, r4
	b	lab574
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab575
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab576
	uxtb	r2, r1
	mov	r3, r0
	b	lab577
lab578: 	subs	r4, #1
	bcc	lab576
lab577: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab578
lab586: 	cmp	r4, #3
	bls	lab579
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab580
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab581: 	strd	r5, r5, [r2, #-16]
	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab581
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab582
lab587: 	sub	r3, ip, #4
	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab583: 	str	r5, [r2], #4
	cmp	r3, r2
	bne	lab583
	and	r4, ip, #3
lab579: 	cbz	r4, lab576
lab585: 	uxtb	r2, r1
	add	r4, r3
lab584: 	strb	r2, [r3], #1
	cmp	r4, r3
	bne	lab584
lab576: 	pop	{r4, r5, pc}
lab582: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab585
	b	lab576
lab575: 	mov	r3, r0
	mov	r4, r2
	b	lab586
lab580: 	mov	r2, r3
	mov	ip, r4
	b	lab587
__sprint_r.part.0:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, [r1, #100]	; 0x64
	lsls	r4, r3, #18
	mov	r8, r2
	bpl	lab588
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #0]
	cbz	r3, lab589
	mov	fp, r1
	mov	r6, r0
	add	r9, r2, #8
lab594: 	ldrd	r5, sl, [r9, #-8]
	movs	r7, sl, lsr #2
	beq	lab590
	subs	r5, #4
	movs	r4, #0
	b	lab591
lab593: 	cmp	r7, r4
	beq	lab592
lab591: 	ldr	r1, [r5, #4]!
	mov	r2, fp
	mov	r0, r6
	bl	_fputwc_r
	adds	r3, r0, #1
	add	r4, r4, #1
	bne	lab593
lab595: 	movs	r3, #0
	strd	r3, r3, [r8, #4]
	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab592: 	ldr	r3, [r8, #8]
lab590: 	bic	sl, sl, #3
	sub	r3, r3, sl
	str	r3, [r8, #8]
	add	r9, r9, #8
	cmp	r3, #0
	bne	lab594
lab589: 	movs	r0, #0
	b	lab595
lab588: 	bl	__sfvwrite_r
	movs	r3, #0
	strd	r3, r3, [r8, #4]
	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
	nop
__sprint_r:
	push	{r4}
	ldr	r4, [r2, #8]
	cbz	r4, lab596
	pop	{r4}
	b	__sprint_r.part.0
lab596: 	mov	r0, r4
	str	r4, [r2, #4]
	pop	{r4}
	bx	lr
_vfiprintf_r:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, #244	; 0xf4
	strd	r3, r0, [sp, #16]
	mov	r4, r3
	str	r1, [sp, #4]
	mov	r7, r2
	cbz	r0, lab597
	ldr	r3, [r0, #56]	; 0x38
	cmp	r3, #0
	beq	lab598
lab597: 	ldr	r2, [sp, #4]
	ldr	r3, [r2, #100]	; 0x64
	lsls	r6, r3, #31
	bpl	lab599
	ldrsh	r1, [r2, #12]
	uxth	r2, r1
lab638: 	lsls	r0, r2, #18
	bmi	lab600
	orr	r2, r1, #8192	; 0x2000
	ldr	r1, [sp, #4]
	ldr	r3, [r1, #100]	; 0x64
	strh	r2, [r1, #12]
	bic	r3, r3, #8192	; 0x2000
	uxth	r2, r2
	str	r3, [r1, #100]	; 0x64
lab600: 	lsls	r1, r2, #28
	bpl	lab601
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	lab601
	and	r3, r2, #26
	cmp	r3, #10
	beq	lab602
lab620: 	add	r3, sp, #76	; 0x4c
	str	r3, [sp, #64]	; 0x40
	movs	r3, #0
	strd	r3, r3, [sp, #68]	; 0x44
	strd	r3, r3, [sp, #40]	; 0x28
	str	r3, [sp, #32]
	add	r9, sp, #76	; 0x4c
	str	r3, [sp, #36]	; 0x24
	str	r3, [sp, #12]
lab653: 	ldrb	r3, [r7, #0]
	cmp	r3, #0
	beq	lab603
	mov	r4, r7
	b	lab604
lab606: 	ldrb	r3, [r4, #1]!
	cmp	r3, #0
	beq	lab605
lab604: 	cmp	r3, #37	; 0x25
	bne	lab606
	subs	r5, r4, r7
	bne	lab607
lab631: 	ldrb	r3, [r4, #0]
	cmp	r3, #0
	beq	lab603
	mov	r3, #0
	movs	r5, #0
	strb	r3, [sp, #59]	; 0x3b
	adds	r7, r4, #1
	ldrb	r3, [r4, #1]
	str	r5, [sp, #8]
	mov	fp, #4294967295	; 0xffffffff
	movs	r4, #43	; 0x2b
lab612: 	adds	r7, #1
lab610: 	sub	r2, r3, #32
	cmp	r2, #90	; 0x5a
	bhi	lab608
	tbh	[pc, r2, lsl #1]
	.word	0x01500298
	.word	0x02940150
	.word	0x01500150
	.word	0x006a0150
	.word	0x01500150
	.word	0x026b0236
	.word	0x02410150
	.word	0x015002a6
	.word	0x005b02a2
	.word	0x005b005b
	.word	0x005b005b
	.word	0x005b005b
	.word	0x005b005b
	.word	0x01500150
	.word	0x01500150
	.word	0x01500150
	.word	0x01500150
	.word	0x02230150
	.word	0x01500084
	.word	0x01500150
	.word	0x01500150
	.word	0x01500150
	.word	0x01500150
	.word	0x00dd0150
	.word	0x01500150
	.word	0x02070150
	.word	0x02590150
	.word	0x01500150
	.word	0x0150051e
	.word	0x01500150
	.word	0x01500150
	.word	0x01500150
	.word	0x01500150
	.word	0x02230150
	.word	0x01500086
	.word	0x01500150
	.word	0x0086024f
	.word	0x01500080
	.word	0x01500245
	.word	0x00df0281
	.word	0x0080026f
	.word	0x02070150
	.word	0x053e007e
	.word	0x01500150
	.word	0x01500540
	.short	0x007e
	sub	r2, r3, #48	; 0x30
	movs	r1, #0
lab609: 	ldrb	r3, [r7], #1
	add	r1, r1, r1, lsl #2
	add	r1, r2, r1, lsl #1
	sub	r2, r3, #48	; 0x30
	cmp	r2, #9
	bls	lab609
	str	r1, [sp, #8]
	b	lab610
	ldr	r8, [sp, #20]
	mov	r0, r8
	bl	_localeconv_r
	ldr	r3, [r0, #4]
	str	r3, [sp, #40]	; 0x28
	mov	r0, r3
	bl	strlen
	str	r0, [sp, #44]	; 0x2c
	mov	r6, r0
	mov	r0, r8
	bl	_localeconv_r
	ldr	r3, [r0, #8]
	str	r3, [sp, #36]	; 0x24
	cmp	r6, #0
	bne	lab611
lab671: 	ldrb	r3, [r7, #0]
	b	lab612
	ldrb	r3, [r7, #0]
	orr	r5, r5, #32
	b	lab612
	orr	r5, r5, #16
	lsls	r4, r5, #26
	ldr	r6, [sp, #16]
	bpl	lab613
	adds	r6, #7
	bic	r6, r6, #7
	mov	r2, r6
	ldr	r3, [r6, #4]
	ldr	r6, [r2], #8
	str	r2, [sp, #16]
	mov	r8, r3
lab660: 	cmp	r3, #0
	blt	lab614
	cmp	fp, #4294967295	; 0xffffffff
	beq	lab615
	orrs	r3, r6, r8
	bic	sl, r5, #128	; 0x80
	beq	lab616
lab674: 	cmp	r6, #10
	sbcs	r3, r8, #0
	bcs	lab617
lab715: 	adds	r6, #48	; 0x30
	movs	r3, #1
	strb	r6, [sp, #239]	; 0xef
	mov	r5, sl
	str	r3, [sp, #0]
	add	r4, sp, #239	; 0xef
lab629: 	ldr	r8, [sp]
	ldrb	r3, [sp, #59]	; 0x3b
	cmp	r8, fp
	it	lt
	movlt	r8, fp
	cmp	r3, #0
	beq	lab618
	add	r8, r8, #1
	b	lab618
lab601: 	ldr	r5, [sp, #4]
	ldr	r0, [sp, #20]
	mov	r1, r5
	bl	__swsetup_r
	cmp	r0, #0
	bne	lab619
	ldrh	r2, [r5, #12]
	and	r3, r2, #26
	cmp	r3, #10
	bne	lab620
lab602: 	ldr	r1, [sp, #4]
	ldrsh	r3, [r1, #14]
	cmp	r3, #0
	blt	lab620
	ldr	r3, [r1, #100]	; 0x64
	lsls	r6, r3, #31
	bmi	lab621
	lsls	r5, r2, #22
	bpl	lab622
lab621: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	mov	r3, r4
	mov	r2, r7
	add	sp, #244	; 0xf4
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__sbprintf
	orr	r5, r5, #16
	ands	r8, r5, #32
	beq	lab623
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r3, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r3], #8
	str	r3, [sp, #16]
lab657: 	bic	sl, r5, #1024	; 0x400
	movs	r3, #0
lab667: 	mov	r2, #0
	strb	r2, [sp, #59]	; 0x3b
lab718: 	cmp	fp, #4294967295	; 0xffffffff
	beq	lab624
	orrs	r2, r6, r8
	bic	r5, sl, #128	; 0x80
	bne	lab625
	cmp	fp, #0
	bne	lab626
	cmp	r3, #0
	bne	lab627
	ands	r3, sl, #1
	str	r3, [sp, #0]
	beq	lab628
	movs	r3, #48	; 0x30
	strb	r3, [sp, #239]	; 0xef
	add	r4, sp, #239	; 0xef
	b	lab629
lab605: 	subs	r5, r4, r7
	beq	lab603
lab607: 	ldr	r3, [sp, #68]	; 0x44
	ldr	r2, [sp, #72]	; 0x48
	adds	r3, #1
	add	r2, r5
	cmp	r3, #7
	strd	r7, r5, [r9]
	str	r2, [sp, #72]	; 0x48
	str	r3, [sp, #68]	; 0x44
	bgt	lab630
	add	r9, r9, #8
lab634: 	ldr	r3, [sp, #12]
	add	r3, r5
	str	r3, [sp, #12]
	b	lab631
lab630: 	cmp	r2, #0
	beq	lab632
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	; 0x40
	bl	__sprint_r.part.0
	cbnz	r0, lab633
	add	r9, sp, #76	; 0x4c
	b	lab634
lab603: 	ldr	r3, [sp, #72]	; 0x48
	cmp	r3, #0
	bne	lab635
lab740: 	movs	r3, #0
	str	r3, [sp, #68]	; 0x44
lab633: 	ldr	r2, [sp, #4]
	ldr	r3, [r2, #100]	; 0x64
	lsls	r1, r3, #31
	bpl	lab636
	ldrh	r3, [r2, #12]
lab654: 	lsls	r3, r3, #25
	bmi	lab637
lab742: 	ldr	r0, [sp, #12]
	add	sp, #244	; 0xf4
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab599: 	ldr	r3, [sp, #4]
	ldrsh	r1, [r3, #12]
	lsls	r5, r1, #22
	uxth	r2, r1
	bmi	lab638
	mov	r5, r3
	ldr	r0, [r3, #88]	; 0x58
	bl	__retarget_lock_acquire_recursive
	ldrsh	r1, [r5, #12]
	uxth	r2, r1
	b	lab638
lab608: 	cmp	r3, #0
	beq	lab603
	strb	r3, [sp, #140]	; 0x8c
	mov	r8, #1
	mov	r3, #0
	strb	r3, [sp, #59]	; 0x3b
	str	r8, [sp]
	add	r4, sp, #140	; 0x8c
lab664: 	mov	fp, #0
lab618: 	ands	r3, r5, #2
	str	r3, [sp, #24]
	it	ne
	addne	r8, r8, #2
	ands	r3, r5, #132	; 0x84
	str	r3, [sp, #28]
	bne	lab639
	ldr	r3, [sp, #8]
	sub	r6, r3, r8
	cmp	r6, #0
	bgt	lab640
lab639: 	ldrd	r2, r1, [sp, #68]	; 0x44
	adds	r0, r2, #1
lab704: 	ldrb	r6, [sp, #59]	; 0x3b
	cbz	r6, lab641
	add	r2, sp, #59	; 0x3b
	adds	r1, #1
	str	r2, [r9]
	cmp	r0, #7
	mov	r2, #1
	strd	r0, r1, [sp, #68]	; 0x44
	str	r2, [r9, #4]
	bgt	lab642
lab727: 	mov	r2, r0
	add	r9, r9, #8
	adds	r0, #1
lab641: 	ldr	r3, [sp, #24]
	cbz	r3, lab643
	add	r3, sp, #60	; 0x3c
	adds	r1, #2
	str	r3, [r9]
	cmp	r0, #7
	mov	r3, #2
	strd	r0, r1, [sp, #68]	; 0x44
	str	r3, [r9, #4]
	ble	lab644
	cmp	r1, #0
	beq	lab645
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	; 0x40
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab633
	ldrd	r2, r1, [sp, #68]	; 0x44
	add	r9, sp, #76	; 0x4c
	adds	r0, r2, #1
lab643: 	ldr	r3, [sp, #28]
	cmp	r3, #128	; 0x80
	beq	lab646
lab679: 	ldr	r3, [sp, #0]
	sub	r6, fp, r3
	cmp	r6, #0
	bgt	lab647
lab687: 	ldr	r3, [sp, #0]
	str	r4, [r9]
	add	r1, r3
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	; 0x44
	str	r3, [r9, #4]
	ble	lab648
	cmp	r1, #0
	beq	lab649
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	; 0x40
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab633
	ldr	r1, [sp, #72]	; 0x48
	add	r9, sp, #76	; 0x4c
lab678: 	lsls	r0, r5, #29
	bpl	lab650
	ldr	r3, [sp, #8]
	sub	r4, r3, r8
	cmp	r4, #0
	bgt	lab651
lab650: 	ldrd	r2, r3, [sp, #8]
	cmp	r2, r8
	ite	ge
	addge	r3, r3, r2
	addlt	r3, r8
	str	r3, [sp, #12]
	cmp	r1, #0
	bne	lab652
lab695: 	movs	r3, #0
	str	r3, [sp, #68]	; 0x44
	add	r9, sp, #76	; 0x4c
	b	lab653
lab636: 	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #12]
	lsls	r2, r3, #22
	bmi	lab654
	ldr	r4, [sp, #4]
	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	ldrh	r3, [r4, #12]
	b	lab654
lab623: 	ands	r3, r5, #16
	bne	lab655
	ands	r2, r5, #64	; 0x40
	beq	lab656
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	mov	r8, r3
	uxth	r6, r6
	b	lab657
lab613: 	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	lsls	r0, r5, #27
	bmi	lab658
	lsls	r1, r5, #25
	bpl	lab659
	sbfx	r8, r3, #15, #1
	sxth	r6, r3
	mov	r3, r8
	b	lab660
	ldr	r6, [sp, #16]
	ldr	r4, [r6], #4
	mov	r3, #0
	strb	r3, [sp, #59]	; 0x3b
	cmp	r4, #0
	beq	lab661
	cmp	fp, #4294967295	; 0xffffffff
	beq	lab662
	mov	r2, fp
	movs	r1, #0
	mov	r0, r4
	bl	memchr
	cmp	r0, #0
	beq	lab663
	subs	r3, r0, r4
	str	r3, [sp, #0]
	str	r6, [sp, #16]
	mov	fp, #0
	b	lab629
	ldr	r6, [sp, #16]
	mov	r3, #0
	strb	r3, [sp, #59]	; 0x3b
	mov	r8, #1
	ldr	r3, [r6], #4
	strb	r3, [sp, #140]	; 0x8c
	str	r6, [sp, #16]
	str	r8, [sp]
	add	r4, sp, #140	; 0x8c
	b	lab664
lab598: 	bl	__sinit
	b	lab597
	ldr	r3, [sp, #16]
	ldr	r2, [r3], #4
	str	r2, [sp, #8]
	cmp	r2, #0
	bge	lab665
	ldr	r2, [sp, #8]
	str	r3, [sp, #16]
	negs	r2, r2
	str	r2, [sp, #8]
	ldrb	r3, [r7, #0]
	orr	r5, r5, #4
	b	lab612
	ldrb	r3, [r7, #0]
	cmp	r3, #108	; 0x6c
	ittte	eq
	ldrbeq	r3, [r7, #1]
	orreq	r5, r5, #32
	addeq	r7, #1
	orrne	r5, r5, #16
	b	lab612
	ldrb	r3, [r7, #0]
	cmp	r3, #104	; 0x68
	ittte	eq
	ldrbeq	r3, [r7, #1]
	orreq	r5, r5, #512	; 0x200
	addeq	r7, #1
	orrne	r5, r5, #64	; 0x40
	b	lab612
	orr	sl, r5, #16
lab724: 	ands	r8, sl, #32
	beq	lab666
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r3, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r3], #8
	str	r3, [sp, #16]
	movs	r3, #1
	b	lab667
	ldrb	r3, [r7, #0]
	strb	r4, [sp, #59]	; 0x3b
	b	lab612
	ldr	r3, [sp, #16]
	ldr	r6, [r3], #4
	str	r3, [sp, #16]
	movs	r3, #48	; 0x30
	strb	r3, [sp, #60]	; 0x3c
	movs	r3, #120	; 0x78
	strb	r3, [sp, #61]	; 0x3d
	ldr	r3, [pc, #740]	; (8004e40 <_vfiprintf_r+0x898>)
	str	r3, [sp, #32]
	orr	sl, r5, #2
	mov	r8, #0
	movs	r3, #2
	b	lab667
	lsls	r6, r5, #26
	bmi	lab668
	lsls	r4, r5, #27
	bmi	lab669
	lsls	r0, r5, #25
	bmi	lab670
	lsls	r1, r5, #22
	bpl	lab669
	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	strb	r2, [r3, #0]
	b	lab653
	ldrb	r3, [r7, #0]
	orr	r5, r5, #1
	b	lab612
	ldrb	r3, [sp, #59]	; 0x3b
	cmp	r3, #0
	bne	lab671
	movs	r3, #32
	strb	r3, [sp, #59]	; 0x3b
	ldrb	r3, [r7, #0]
	b	lab612
	ldrb	r3, [r7, #0]
	orr	r5, r5, #128	; 0x80
	b	lab612
	mov	r1, r7
	ldrb	r3, [r1], #1
	cmp	r3, #42	; 0x2a
	beq	lab672
	sub	r2, r3, #48	; 0x30
	cmp	r2, #9
	mov	r7, r1
	mov	fp, #0
	bhi	lab610
lab673: 	ldrb	r3, [r7], #1
	add	fp, fp, fp, lsl #2
	add	fp, r2, fp, lsl #1
	sub	r2, r3, #48	; 0x30
	cmp	r2, #9
	bls	lab673
	b	lab610
lab625: 	mov	sl, r5
lab624: 	cmp	r3, #1
	beq	lab674
lab735: 	cmp	r3, #2
	add	r4, sp, #240	; 0xf0
	bne	lab675
	ldr	r2, [sp, #32]
lab676: 	and	r3, r6, #15
	lsrs	r6, r6, #4
	ldrb	r3, [r2, r3]
	strb	r3, [r4, #-1]!
	orr	r6, r6, r8, lsl #28
	mov	r8, r8, lsr #4
	orrs	r3, r6, r8
	bne	lab676
lab677: 	add	r3, sp, #240	; 0xf0
	subs	r3, r3, r4
	mov	r5, sl
	str	r3, [sp, #0]
	b	lab629
lab675: 	and	r3, r6, #7
	lsrs	r6, r6, #3
	orr	r6, r6, r8, lsl #29
	mov	r8, r8, lsr #3
	adds	r3, #48	; 0x30
	orrs	r1, r6, r8
	mov	r2, r4
	strb	r3, [r4, #-1]!
	bne	lab675
	tst	sl, #1
	beq	lab677
	cmp	r3, #48	; 0x30
	beq	lab677
	movs	r3, #48	; 0x30
	subs	r2, #2
	strb	r3, [r4, #-1]
	add	r3, sp, #240	; 0xf0
	subs	r3, r3, r2
	mov	r5, sl
	str	r3, [sp, #0]
	mov	r4, r2
	b	lab629
lab713: 	ldr	r1, [sp, #0]
	str	r4, [sp, #76]	; 0x4c
	movs	r3, #1
	str	r1, [sp, #80]	; 0x50
	str	r1, [sp, #72]	; 0x48
	str	r3, [sp, #68]	; 0x44
	add	r9, sp, #76	; 0x4c
lab648: 	add	r9, r9, #8
	b	lab678
lab646: 	ldr	r3, [sp, #8]
	sub	r6, r3, r8
	cmp	r6, #0
	ble	lab679
	cmp	r6, #16
	ble	lab680
	ldr	sl, [pc, #452]	; 8004e44 <_vfiprintf_r+0x89c>
	mov	r3, sl
	strd	fp, r4, [sp, #24]
	mov	sl, r7
	ldr	fp, [sp, #20]
	ldr	r4, [sp, #4]
	mov	r7, r5
	mov	r5, r3
	b	lab681
lab683: 	add	ip, r2, #2
	add	r9, r9, #8
	mov	r2, r0
lab696: 	subs	r6, #16
	cmp	r6, #16
	ble	lab682
lab681: 	adds	r0, r2, #1
	adds	r1, #16
	movs	r3, #16
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	; 0x44
	str	r5, [r9]
	str	r3, [r9, #4]
	ble	lab683
	add	r2, sp, #64	; 0x40
	cmp	r1, #0
	beq	lab684
	mov	r1, r4
	mov	r0, fp
	add	r9, sp, #76	; 0x4c
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab633
	ldrd	r2, r1, [sp, #68]	; 0x44
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	bgt	lab681
lab682: 	ldrd	fp, r4, [sp, #24]
	mov	r3, r5
	mov	r5, r7
	mov	r7, sl
	mov	sl, r3
lab743: 	add	r1, r6
	cmp	ip, #7
	strd	ip, r1, [sp, #68]	; 0x44
	str	sl, [r9]
	str	r6, [r9, #4]
	ble	lab685
	cmp	r1, #0
	beq	lab686
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	; 0x40
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab633
	ldr	r3, [sp, #0]
	ldrd	r2, r1, [sp, #68]	; 0x44
	sub	r6, fp, r3
	cmp	r6, #0
	add	r0, r2, #1
	add	r9, sp, #76	; 0x4c
	ble	lab687
lab647: 	cmp	r6, #16
	ldr	sl, [pc, #268]	; 8004e44 <_vfiprintf_r+0x89c>
	ble	lab688
	mov	r3, sl
	strd	r4, r5, [sp, #24]
	mov	sl, r7
	ldr	r4, [sp, #20]
	ldr	r5, [sp, #4]
	mov	fp, #16
	mov	r7, r3
	b	lab689
lab691: 	add	ip, r2, #2
	add	r9, r9, #8
	mov	r2, r0
lab694: 	subs	r6, #16
	cmp	r6, #16
	ble	lab690
lab689: 	adds	r0, r2, #1
	adds	r1, #16
	cmp	r0, #7
	strd	r7, fp, [r9]
	strd	r0, r1, [sp, #68]	; 0x44
	ble	lab691
	add	r2, sp, #64	; 0x40
	cbz	r1, lab692
	mov	r1, r5
	mov	r0, r4
	add	r9, sp, #76	; 0x4c
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab633
	ldrd	r2, r1, [sp, #68]	; 0x44
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	bgt	lab689
lab690: 	ldrd	r4, r5, [sp, #24]
	mov	r3, r7
	mov	r0, ip
	mov	r7, sl
	mov	sl, r3
lab688: 	add	r1, r6
	cmp	r0, #7
	strd	r0, r1, [sp, #68]	; 0x44
	str	sl, [r9]
	str	r6, [r9, #4]
	bgt	lab693
	add	r9, r9, #8
	adds	r0, #1
	b	lab687
lab692: 	mov	ip, #1
	mov	r2, r1
	add	r9, sp, #76	; 0x4c
	b	lab694
lab652: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	; 0x40
	bl	__sprint_r.part.0
	cmp	r0, #0
	beq	lab695
	b	lab633
lab684: 	mov	ip, #1
	mov	r2, r1
	add	r9, sp, #76	; 0x4c
	b	lab696
lab642: 	cmp	r1, #0
	beq	lab697
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	; 0x40
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab633
	ldrd	r2, r1, [sp, #68]	; 0x44
	add	r9, sp, #76	; 0x4c
	adds	r0, r2, #1
	b	lab641
lab738: 	movs	r1, #2
	add	r3, sp, #60	; 0x3c
	str	r1, [sp, #80]	; 0x50
	str	r3, [sp, #76]	; 0x4c
	movs	r0, #1
	add	r9, sp, #76	; 0x4c
lab644: 	mov	r2, r0
lab721: 	add	r9, r9, #8
	adds	r0, r2, #1
	b	lab643
lab640: 	cmp	r6, #16
	ble	lab698
	ldrd	ip, r1, [sp, #68]	; 0x44
	ldr	sl, [pc, #28]	; 8004e48 <_vfiprintf_r+0x8a0>
	strd	fp, r4, [sp, #48]	; 0x30
	movs	r3, #16
	mov	r4, sl
	ldr	fp, [sp, #4]
	ldr	sl, [sp, #20]
	mov	r2, ip
	b	lab699
	.word	0x20000d60
	.word	0x20000d8c
	.word	0x20000d7c
lab701: 	add	ip, r2, #2
	add	r9, r9, #8
	mov	r2, r0
lab705: 	subs	r6, #16
	cmp	r6, #16
	ble	lab700
lab699: 	adds	r0, r2, #1
	adds	r1, #16
	cmp	r0, #7
	strd	r4, r3, [r9]
	strd	r0, r1, [sp, #68]	; 0x44
	ble	lab701
	add	r2, sp, #64	; 0x40
	cbz	r1, lab702
	mov	r1, fp
	mov	r0, sl
	add	r9, sp, #76	; 0x4c
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab633
	ldrd	r2, r1, [sp, #68]	; 0x44
	subs	r6, #16
	cmp	r6, #16
	add	ip, r2, #1
	mov	r3, #16
	bgt	lab699
lab700: 	mov	sl, r4
	ldr	fp, [sp, #48]	; 0x30
	ldr	r4, [sp, #52]	; 0x34
	mov	r2, ip
lab739: 	add	r1, r6
	cmp	r2, #7
	strd	r2, r1, [sp, #68]	; 0x44
	str	sl, [r9]
	str	r6, [r9, #4]
	bgt	lab703
	add	r9, r9, #8
	adds	r0, r2, #1
	b	lab704
lab702: 	mov	r2, r1
	mov	ip, #1
	add	r9, sp, #76	; 0x4c
	b	lab705
lab649: 	lsls	r4, r5, #29
	str	r1, [sp, #68]	; 0x44
	bpl	lab706
	ldr	r3, [sp, #8]
	sub	r4, r3, r8
	cmp	r4, #0
	ble	lab706
	add	r9, sp, #76	; 0x4c
lab651: 	cmp	r4, #16
	ble	lab707
	ldr	sl, [pc, #748]	; 80051d0 <_vfiprintf_r+0xc28>
	ldr	r2, [sp, #68]	; 0x44
	ldr	r6, [sp, #20]
	ldr	fp, [sp, #4]
	mov	r3, sl
	movs	r5, #16
	mov	sl, r7
	mov	r7, r3
	b	lab708
lab710: 	adds	r0, r2, #2
	add	r9, r9, #8
	mov	r2, r3
lab712: 	subs	r4, #16
	cmp	r4, #16
	ble	lab709
lab708: 	adds	r3, r2, #1
	adds	r1, #16
	cmp	r3, #7
	strd	r7, r5, [r9]
	strd	r3, r1, [sp, #68]	; 0x44
	ble	lab710
	add	r2, sp, #64	; 0x40
	cbz	r1, lab711
	mov	r1, fp
	mov	r0, r6
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab633
	ldrd	r2, r1, [sp, #68]	; 0x44
	subs	r4, #16
	cmp	r4, #16
	add	r0, r2, #1
	add	r9, sp, #76	; 0x4c
	bgt	lab708
lab709: 	mov	r3, r7
	mov	r7, sl
	mov	sl, r3
lab741: 	add	r1, r4
	cmp	r0, #7
	strd	sl, r4, [r9]
	strd	r0, r1, [sp, #68]	; 0x44
	ble	lab650
	cbz	r1, lab706
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	; 0x40
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab633
	ldr	r1, [sp, #72]	; 0x48
	b	lab650
lab711: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	; 0x4c
	b	lab712
lab706: 	ldrd	r2, r3, [sp, #8]
	cmp	r2, r8
	ite	ge
	addge	r3, r3, r2
	addlt	r3, r8
	str	r3, [sp, #12]
	b	lab695
lab693: 	cmp	r1, #0
	beq	lab713
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	; 0x40
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab633
	ldr	r0, [sp, #68]	; 0x44
	ldr	r1, [sp, #72]	; 0x48
	adds	r0, #1
	add	r9, sp, #76	; 0x4c
	b	lab687
lab697: 	ldr	r3, [sp, #24]
	cmp	r3, #0
	bne	lab714
lab645: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	; 0x4c
	b	lab643
lab632: 	str	r2, [sp, #68]	; 0x44
	add	r9, sp, #76	; 0x4c
	b	lab634
lab616: 	cmp	fp, #0
	bne	lab715
	mov	r5, sl
lab627: 	mov	fp, #0
	str	fp, [sp]
	add	r4, sp, #240	; 0xf0
	b	lab629
lab666: 	ands	r3, sl, #16
	bne	lab716
	ands	r2, sl, #64	; 0x40
	beq	lab717
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	mov	r8, r3
	uxth	r6, r6
	movs	r3, #1
	b	lab667
lab614: 	movs	r3, #45	; 0x2d
	negs	r6, r6
	strb	r3, [sp, #59]	; 0x3b
	sbc	r8, r8, r8, lsl #1
	mov	sl, r5
	movs	r3, #1
	b	lab718
lab703: 	cmp	r1, #0
	beq	lab719
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	; 0x40
	bl	__sprint_r.part.0
	cmp	r0, #0
	bne	lab633
	ldrd	r2, r1, [sp, #68]	; 0x44
	add	r9, sp, #76	; 0x4c
	adds	r0, r2, #1
	b	lab704
lab665: 	str	r3, [sp, #16]
	ldrb	r3, [r7, #0]
	b	lab612
lab628: 	add	r4, sp, #240	; 0xf0
	b	lab629
lab685: 	add	r9, r9, #8
	add	r0, ip, #1
	mov	r2, ip
	b	lab679
lab659: 	lsls	r2, r5, #22
	bmi	lab720
lab658: 	mov	r8, r3, asr #31
	mov	r6, r3
	mov	r3, r8
	b	lab660
lab716: 	ldr	r3, [sp, #16]
	ldr	r6, [r3], #4
	str	r3, [sp, #16]
	movs	r3, #1
	b	lab667
lab611: 	ldr	r3, [sp, #36]	; 0x24
	cmp	r3, #0
	beq	lab671
	ldr	r3, [sp, #36]	; 0x24
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab671
	ldrb	r3, [r7, #0]
	orr	r5, r5, #1024	; 0x400
	b	lab612
lab668: 	ldrd	r1, r6, [sp, #12]
	ldr	r2, [r6], #4
	str	r6, [sp, #16]
	asrs	r3, r1, #31
	strd	r1, r3, [r2]
	b	lab653
lab655: 	ldr	r3, [sp, #16]
	ldr	r6, [r3], #4
	str	r3, [sp, #16]
	b	lab657
lab714: 	movs	r1, #2
	add	r3, sp, #60	; 0x3c
	str	r1, [sp, #80]	; 0x50
	str	r3, [sp, #76]	; 0x4c
	add	r9, sp, #76	; 0x4c
	b	lab721
	ldr	r2, [pc, #300]	; (80051d4 <_vfiprintf_r+0xc2c>)
	str	r2, [sp, #32]
lab725: 	ands	r8, r5, #32
	beq	lab722
	ldr	r6, [sp, #16]
	adds	r6, #7
	bic	r6, r6, #7
	mov	r2, r6
	ldr	r8, [r6, #4]
	ldr	r6, [r2], #8
	str	r2, [sp, #16]
lab729: 	lsls	r2, r5, #31
	bpl	lab723
	orrs	r2, r6, r8
	beq	lab723
	strb	r3, [sp, #61]	; 0x3d
	movs	r3, #48	; 0x30
	orr	r5, r5, #2
	strb	r3, [sp, #60]	; 0x3c
lab723: 	bic	sl, r5, #1024	; 0x400
	movs	r3, #2
	b	lab667
	mov	sl, r5
	b	lab724
	ldr	r2, [pc, #236]	; (80051d8 <_vfiprintf_r+0xc30>)
	str	r2, [sp, #32]
	b	lab725
lab662: 	mov	r0, r4
	str	r6, [sp, #16]
	bl	strlen
	mov	fp, #0
	str	r0, [sp, #0]
	b	lab629
lab719: 	ldrb	r2, [sp, #59]	; 0x3b
	cmp	r2, #0
	beq	lab726
	movs	r0, #1
	add	r2, sp, #59	; 0x3b
	str	r0, [sp, #80]	; 0x50
	str	r2, [sp, #76]	; 0x4c
	add	r9, sp, #76	; 0x4c
	mov	r1, r0
	b	lab727
lab722: 	ands	r2, r5, #16
	beq	lab728
	ldr	r2, [sp, #16]
	ldr	r6, [r2], #4
	str	r2, [sp, #16]
	b	lab729
lab617: 	and	r3, sl, #1024	; 0x400
	str	fp, [sp]
	str	r9, [sp, #24]
	mov	fp, r7
	ldr	r9, [sp, #36]	; 0x24
	movs	r5, #0
	add	r4, sp, #240	; 0xf0
	mov	r7, r3
	b	lab730
lab732: 	mov	r0, r6
	mov	r1, r8
	bl	__aeabi_uldivmod
	cmp	r6, #10
	sbcs	r3, r8, #0
	bcc	lab731
lab737: 	mov	r6, r0
	mov	r8, r1
lab730: 	mov	r0, r6
	mov	r1, r8
	movs	r2, #10
	movs	r3, #0
	bl	__aeabi_uldivmod
	mov	r1, r2
	adds	r1, #48	; 0x30
	strb	r1, [r4, #-1]
	movs	r2, #10
	movs	r3, #0
	subs	r4, #1
	adds	r5, #1
	cmp	r7, #0
	beq	lab732
	ldrb	r1, [r9]
	cmp	r1, r5
	bne	lab732
	cmp	r5, #255	; 0xff
	beq	lab732
	cmp	r6, #10
	sbcs	r3, r8, #0
	bcs	lab733
lab731: 	add	r3, sp, #240	; 0xf0
	subs	r3, r3, r4
	str	r9, [sp, #36]	; 0x24
	mov	r7, fp
	ldr	r9, [sp, #24]
	ldr	fp, [sp]
	str	r3, [sp, #0]
	mov	r5, sl
	b	lab629
lab728: 	ands	r1, r5, #64	; 0x40
	beq	lab734
	ldr	r1, [sp, #16]
	ldr	r6, [r1], #4
	str	r1, [sp, #16]
	mov	r8, r2
	uxth	r6, r6
	b	lab729
lab615: 	mov	sl, r5
	b	lab674
lab626: 	cmp	r3, #1
	mov	sl, r5
	bne	lab735
	b	lab715
	nop
	.word	0x20000d7c
	.word	0x20000d4c
	.word	0x20000d60
lab669: 	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r2, [r3, #0]
	str	r6, [sp, #16]
	b	lab653
lab661: 	cmp	fp, #6
	mov	r8, fp
	it	cs
	movcs	r8, #6
	ldr	r4, [pc, #320]	; (800533c <_vfiprintf_r+0xd94>)
	str	r8, [sp]
	str	r6, [sp, #16]
	b	lab664
lab717: 	ldr	r3, [sp, #16]
	ands	r8, sl, #512	; 0x200
	ite	ne
	ldrne	r6, [r3], #4
	ldreq	r6, [r3], #4
	str	r3, [sp, #16]
	itt	ne
	movne	r8, r2
	uxtbne	r6, r6
	movs	r3, #1
	b	lab667
lab656: 	ldr	r3, [sp, #16]
	ands	r8, r5, #512	; 0x200
	ite	ne
	ldrne	r6, [r3], #4
	ldreq	r6, [r3], #4
	str	r3, [sp, #16]
	itt	ne
	movne	r8, r2
	uxtbne	r6, r6
	b	lab657
lab734: 	ldr	r2, [sp, #16]
	ands	r8, r5, #512	; 0x200
	ite	ne
	ldrne	r6, [r2], #4
	ldreq	r6, [r2], #4
	str	r2, [sp, #16]
	itt	ne
	movne	r8, r1
	uxtbne	r6, r6
	b	lab729
lab733: 	ldr	r3, [sp, #44]	; 0x2c
	ldr	r1, [sp, #40]	; 0x28
	subs	r4, r4, r3
	mov	r2, r3
	mov	r0, r4
	bl	strncpy
	ldrb	r3, [r9, #1]
	cbz	r3, lab736
	add	r9, r9, #1
lab736: 	mov	r0, r6
	mov	r1, r8
	movs	r2, #10
	movs	r3, #0
	movs	r5, #0
	bl	__aeabi_uldivmod
	b	lab737
lab686: 	movs	r0, #1
	mov	r2, r1
	add	r9, sp, #76	; 0x4c
	b	lab679
lab726: 	ldr	r3, [sp, #24]
	cmp	r3, #0
	bne	lab738
	mov	r2, r1
	movs	r0, #1
	add	r9, sp, #76	; 0x4c
	b	lab679
lab670: 	ldr	r6, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r3, [r6], #4
	str	r6, [sp, #16]
	strh	r2, [r3, #0]
	b	lab653
lab720: 	sbfx	r8, r3, #7, #1
	sxtb	r6, r3
	mov	r3, r8
	b	lab660
lab622: 	ldr	r0, [r1, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	b	lab621
lab663: 	str	fp, [sp]
	str	r6, [sp, #16]
	mov	fp, r0
	b	lab629
lab698: 	ldr	r2, [sp, #68]	; 0x44
	ldr	r1, [sp, #72]	; 0x48
	ldr	sl, [pc, #104]	; 8005340 <_vfiprintf_r+0xd98>
	adds	r2, #1
	b	lab739
lab635: 	ldr	r1, [sp, #4]
	ldr	r0, [sp, #20]
	add	r2, sp, #64	; 0x40
	bl	__sprint_r.part.0
	cmp	r0, #0
	beq	lab740
	b	lab633
lab707: 	ldr	r0, [sp, #68]	; 0x44
	ldr	sl, [pc, #72]	; 8005340 <_vfiprintf_r+0xd98>
	adds	r0, #1
	b	lab741
lab619: 	ldr	r3, [sp, #4]
	ldr	r3, [r3, #100]	; 0x64
	lsls	r3, r3, #31
	bmi	lab637
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #12]
	lsls	r7, r3, #22
	bmi	lab637
	ldr	r3, [sp, #4]
	ldr	r0, [r3, #88]	; 0x58
	bl	__retarget_lock_release_recursive
lab637: 	mov	r3, #4294967295	; 0xffffffff
	str	r3, [sp, #12]
	b	lab742
lab680: 	ldr	sl, [pc, #36]	; 8005344 <_vfiprintf_r+0xd9c>
	mov	ip, r0
	b	lab743
lab672: 	ldr	r2, [sp, #16]
	ldrb	r3, [r7, #1]
	mov	r7, r1
	ldr	r1, [r2], #4
	str	r2, [sp, #16]
	orr	fp, r1, r1, asr #31
	b	lab612
	nop
	.word	0x20000d74
	.word	0x20000d7c
	.word	0x20000d8c
vfiprintf:
	push	{r4}
	ldr	r4, [pc, #16]	; (800535c <vfiprintf+0x14>)
	mov	ip, r0
	mov	r3, r2
	ldr	r0, [r4, #0]
	pop	{r4}
	mov	r2, r1
	mov	r1, ip
	b	_vfiprintf_r
	.word	0x20000eb4
__sbprintf:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r3
	ldrh	r3, [r1, #12]
	subw	sp, sp, #1132	; 0x46c
	bic	r3, r3, #2
	strh	r3, [sp, #12]
	ldr	r3, [r1, #100]	; 0x64
	str	r3, [sp, #100]	; 0x64
	ldrh	r3, [r1, #14]
	strh	r3, [sp, #14]
	ldr	r3, [r1, #28]
	str	r3, [sp, #28]
	ldr	r3, [r1, #36]	; 0x24
	str	r3, [sp, #36]	; 0x24
	add	r3, sp, #104	; 0x68
	str	r3, [sp, #0]
	str	r3, [sp, #16]
	mov	r3, #1024	; 0x400
	mov	r5, r2
	mov	r6, r0
	str	r3, [sp, #8]
	str	r3, [sp, #20]
	add	r0, sp, #88	; 0x58
	movs	r3, #0
	mov	r4, r1
	str	r3, [sp, #24]
	bl	__retarget_lock_init_recursive
	mov	r2, r5
	mov	r3, r7
	mov	r1, sp
	mov	r0, r6
	bl	_vfiprintf_r
	subs	r5, r0, #0
	blt	lab744
	mov	r1, sp
	mov	r0, r6
	bl	_fflush_r
	cmp	r0, #0
	it	ne
	movne	r5, #4294967295	; 0xffffffff
lab744: 	ldrh	r3, [sp, #12]
	lsls	r3, r3, #25
	bpl	lab745
	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	; 0x40
	strh	r3, [r4, #12]
lab745: 	ldr	r0, [sp, #88]	; 0x58
	bl	__retarget_lock_close_recursive
	mov	r0, r5
	addw	sp, sp, #1132	; 0x46c
	pop	{r4, r5, r6, r7, pc}
__swsetup_r:
	push	{r3, r4, r5, lr}
	ldr	r3, [pc, #204]	; (80054b0 <__swsetup_r+0xd0>)
	ldr	r3, [r3, #0]
	mov	r5, r0
	mov	r4, r1
	cbz	r3, lab746
	ldr	r2, [r3, #56]	; 0x38
	cbz	r2, lab747
lab746: 	ldrsh	r3, [r4, #12]
	lsls	r0, r3, #28
	uxth	r2, r3
	bpl	lab748
lab754: 	ldr	r1, [r4, #16]
	cmp	r1, #0
	beq	lab749
lab757: 	ands	r0, r2, #1
	beq	lab750
	movs	r0, #0
	str	r0, [r4, #8]
	ldr	r0, [r4, #20]
	negs	r0, r0
	str	r0, [r4, #24]
	cbz	r1, lab751
lab752: 	movs	r0, #0
lab753: 	pop	{r3, r4, r5, pc}
lab750: 	lsls	r5, r2, #30
	it	pl
	ldrpl	r0, [r4, #20]
	str	r0, [r4, #8]
	cmp	r1, #0
	bne	lab752
lab751: 	lsls	r2, r2, #24
	it	pl
	movpl	r0, r1
	bpl	lab753
	orr	r3, r3, #64	; 0x40
	strh	r3, [r4, #12]
	mov	r0, #4294967295	; 0xffffffff
	pop	{r3, r4, r5, pc}
lab747: 	mov	r0, r3
	bl	__sinit
	ldrsh	r3, [r4, #12]
	lsls	r0, r3, #28
	uxth	r2, r3
	bmi	lab754
lab748: 	lsls	r1, r2, #27
	bpl	lab755
	lsls	r2, r2, #29
	bmi	lab756
	ldr	r1, [r4, #16]
lab760: 	orr	r3, r3, #8
	strh	r3, [r4, #12]
	uxth	r2, r3
	cmp	r1, #0
	bne	lab757
lab749: 	and	r0, r2, #640	; 0x280
	cmp	r0, #512	; 0x200
	beq	lab757
	mov	r1, r4
	mov	r0, r5
	bl	__smakebuf_r
	ldrsh	r3, [r4, #12]
	ldr	r1, [r4, #16]
	uxth	r2, r3
	b	lab757
lab756: 	ldr	r1, [r4, #48]	; 0x30
	cbz	r1, lab758
	add	r2, r4, #64	; 0x40
	cmp	r1, r2
	beq	lab759
	mov	r0, r5
	bl	_free_r
	ldrsh	r3, [r4, #12]
lab759: 	movs	r2, #0
	str	r2, [r4, #48]	; 0x30
lab758: 	ldr	r1, [r4, #16]
	movs	r2, #0
	strd	r1, r2, [r4]
	bic	r3, r3, #36	; 0x24
	b	lab760
lab755: 	movs	r2, #9
	orr	r3, r3, #64	; 0x40
	str	r2, [r5, #0]
	mov	r0, #4294967295	; 0xffffffff
	strh	r3, [r4, #12]
	pop	{r3, r4, r5, pc}
	.word	0x20000eb4
abort:
	push	{r3, lr}
	movs	r0, #6
	bl	raise
	movs	r0, #1
	bl	_exit
	nop
__sflush_r:
	ldrsh	r2, [r1, #12]
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r1
	lsls	r1, r2, #28
	mov	r7, r0
	bmi	lab761
	ldr	r3, [r4, #4]
	orr	r2, r2, #2048	; 0x800
	cmp	r3, #0
	strh	r2, [r4, #12]
	ble	lab762
lab774: 	ldr	r5, [r4, #40]	; 0x28
	cmp	r5, #0
	beq	lab763
	movs	r3, #0
	ldr	r6, [r7, #0]
	str	r3, [r7, #0]
	uxth	r3, r2
	ands	r2, r2, #4096	; 0x1000
	bne	lab764
	ldr	r1, [r4, #28]
	movs	r3, #1
	mov	r0, r7
	blx	r5
	adds	r2, r0, #1
	beq	lab765
lab777: 	ldrh	r3, [r4, #12]
	ldr	r5, [r4, #40]	; 0x28
lab775: 	lsls	r3, r3, #29
	bpl	lab766
	ldr	r3, [r4, #4]
	subs	r0, r0, r3
	ldr	r3, [r4, #48]	; 0x30
	cbz	r3, lab766
	ldr	r3, [r4, #60]	; 0x3c
	subs	r0, r0, r3
lab766: 	ldr	r1, [r4, #28]
	mov	r2, r0
	movs	r3, #0
	mov	r0, r7
	blx	r5
	adds	r1, r0, #1
	bne	lab767
	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq	lab767
	cmp	r3, #29
	beq	lab768
	cmp	r3, #22
	bne	lab769
lab768: 	ldrh	r3, [r4, #12]
	ldr	r2, [r4, #16]
	str	r2, [r4, #0]
	bic	r3, r3, #2048	; 0x800
	movs	r1, #0
	str	r1, [r4, #4]
	strh	r3, [r4, #12]
lab776: 	ldr	r1, [r4, #48]	; 0x30
	str	r6, [r7, #0]
	cbz	r1, lab763
	add	r3, r4, #64	; 0x40
	cmp	r1, r3
	beq	lab770
	mov	r0, r7
	bl	_free_r
lab770: 	movs	r0, #0
	str	r0, [r4, #48]	; 0x30
	pop	{r3, r4, r5, r6, r7, pc}
lab761: 	ldr	r6, [r4, #16]
	cbz	r6, lab763
	uxth	r3, r2
	ldr	r5, [r4, #0]
	str	r6, [r4, #0]
	lsls	r2, r3, #30
	ite	eq
	ldreq	r3, [r4, #20]
	movne	r3, #0
	subs	r5, r5, r6
	str	r3, [r4, #8]
	b	lab771
lab773: 	ldr	ip, [r4, #36]	; 0x24
	ldr	r1, [r4, #28]
	mov	r3, r5
	mov	r2, r6
	mov	r0, r7
	blx	ip
	subs	ip, r0, #0
	sub	r5, r5, ip
	add	r6, ip
	ble	lab772
lab771: 	cmp	r5, #0
	bgt	lab773
lab763: 	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
lab762: 	ldr	r3, [r4, #60]	; 0x3c
	cmp	r3, #0
	bgt	lab774
	b	lab763
lab764: 	ldr	r0, [r4, #80]	; 0x50
	b	lab775
lab767: 	ldrsh	r3, [r4, #12]
	ldr	r2, [r4, #16]
	str	r2, [r4, #0]
	bic	r3, r3, #2048	; 0x800
	strh	r3, [r4, #12]
	movs	r2, #0
	lsls	r3, r3, #19
	str	r2, [r4, #4]
	bpl	lab776
	str	r0, [r4, #80]	; 0x50
	b	lab776
lab772: 	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	; 0x40
	mov	r0, #4294967295	; 0xffffffff
	strh	r3, [r4, #12]
	pop	{r3, r4, r5, r6, r7, pc}
lab765: 	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq	lab777
	cmp	r3, #29
	beq	lab778
	cmp	r3, #22
	beq	lab778
lab769: 	ldrh	r3, [r4, #12]
	orr	r3, r3, #64	; 0x40
	strh	r3, [r4, #12]
	pop	{r3, r4, r5, r6, r7, pc}
lab778: 	str	r6, [r7, #0]
	b	lab763
	nop
_fflush_r:
	push	{r3, r4, r5, lr}
	mov	r4, r1
	mov	r5, r0
	cbz	r0, lab779
	ldr	r3, [r0, #56]	; 0x38
	cbz	r3, lab780
lab779: 	ldrsh	r0, [r4, #12]
	cbz	r0, lab781
lab786: 	ldr	r3, [r4, #100]	; 0x64
	lsls	r3, r3, #31
	bmi	lab782
	lsls	r1, r0, #22
	bpl	lab783
lab782: 	mov	r0, r5
	mov	r1, r4
	bl	__sflush_r
	ldr	r3, [r4, #100]	; 0x64
	lsls	r2, r3, #31
	mov	r5, r0
	bmi	lab784
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #22
	bpl	lab785
lab784: 	mov	r0, r5
	pop	{r3, r4, r5, pc}
lab780: 	bl	__sinit
	ldrsh	r0, [r4, #12]
	cmp	r0, #0
	bne	lab786
lab781: 	mov	r5, r0
	mov	r0, r5
	pop	{r3, r4, r5, pc}
lab783: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_acquire_recursive
	b	lab782
lab785: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	pop	{r3, r4, r5, pc}
	nop
fflush:
	push	{r3, r4, r5, lr}
	cbz	r0, lab787
	ldr	r3, [pc, #96]	; (80056a8 <fflush+0x68>)
	ldr	r5, [r3, #0]
	mov	r4, r0
	cbz	r5, lab788
	ldr	r3, [r5, #56]	; 0x38
	cbz	r3, lab789
lab788: 	ldrsh	r0, [r4, #12]
	cbz	r0, lab790
	ldr	r3, [r4, #100]	; 0x64
	lsls	r3, r3, #31
	bmi	lab791
	lsls	r1, r0, #22
	bpl	lab792
lab791: 	mov	r0, r5
	mov	r1, r4
	bl	__sflush_r
	ldr	r3, [r4, #100]	; 0x64
	lsls	r2, r3, #31
	mov	r5, r0
	bmi	lab793
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #22
	bpl	lab794
lab793: 	mov	r0, r5
	pop	{r3, r4, r5, pc}
lab790: 	mov	r5, r0
	mov	r0, r5
	pop	{r3, r4, r5, pc}
lab789: 	mov	r0, r5
	bl	__sinit
	b	lab788
lab792: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_acquire_recursive
	b	lab791
lab794: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	b	lab793
lab787: 	ldr	r3, [pc, #16]	; (80056ac <fflush+0x6c>)
	ldr	r1, [pc, #20]	; (80056b0 <fflush+0x70>)
	ldr	r0, [r3, #0]
	ldmia	sp!, {r3, r4, r5, lr}
	b	_fwalk_reent
	nop
	.word	0x20000eb4
	.word	0x20000d48
	.word	0x080055e5
_cleanup_r:
	ldr	r1, [pc, #4]	; (80056bc <_cleanup_r+0x8>)
	b	_fwalk_reent
	nop
	.word	0x08007265
__fp_lock:
	push	{r3, lr}
	ldr	r3, [r0, #100]	; 0x64
	lsls	r2, r3, #31
	bmi	lab795
	ldrh	r3, [r0, #12]
	lsls	r3, r3, #22
	bpl	lab796
lab795: 	movs	r0, #0
	pop	{r3, pc}
lab796: 	ldr	r0, [r0, #88]	; 0x58
	bl	__retarget_lock_acquire_recursive
	movs	r0, #0
	pop	{r3, pc}
__fp_unlock:
	push	{r3, lr}
	ldr	r3, [r0, #100]	; 0x64
	lsls	r2, r3, #31
	bmi	lab797
	ldrh	r3, [r0, #12]
	lsls	r3, r3, #22
	bpl	lab798
lab797: 	movs	r0, #0
	pop	{r3, pc}
lab798: 	ldr	r0, [r0, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	movs	r0, #0
	pop	{r3, pc}
__sfmoreglue:
	push	{r4, r5, r6, lr}
	movs	r2, #104	; 0x68
	subs	r5, r1, #1
	mul	r5, r2, r5
	mov	r6, r1
	add	r1, r5, #116	; 0x74
	bl	_malloc_r
	mov	r4, r0
	cbz	r0, lab799
	movs	r1, #0
	adds	r0, #12
	strd	r1, r6, [r4]
	str	r0, [r4, #8]
	add	r2, r5, #104	; 0x68
	bl	memset
lab799: 	mov	r0, r4
	pop	{r4, r5, r6, pc}
	nop
_cleanup:
	ldr	r3, [pc, #8]	; (8005734 <_cleanup+0xc>)
	ldr	r1, [pc, #12]	; (8005738 <_cleanup+0x10>)
	ldr	r0, [r3, #0]
	b	_fwalk_reent
	nop
	.word	0x20000d48
	.word	0x08007265
__sinit:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	mov	sl, r0
	ldr	r0, [pc, #228]	; (8005828 <__sinit+0xec>)
	bl	__retarget_lock_acquire_recursive
	ldr	r4, [sl, #56]	; 0x38
	cmp	r4, #0
	bne	lab800
	ldr	r5, [sl, #4]
	ldr	r2, [pc, #212]	; (800582c <__sinit+0xf0>)
	str	r2, [sl, #60]	; 0x3c
	movs	r3, #3
	strd	r4, r3, [sl, #736]	; 0x2e0
	ldr	r9, [pc, #204]	; 8005830 <__sinit+0xf4>
	ldr	r8, [pc, #204]	; 8005834 <__sinit+0xf8>
	ldr	r7, [pc, #204]	; (8005838 <__sinit+0xfc>)
	ldr	r6, [pc, #208]	; (800583c <__sinit+0x100>)
	movs	r3, #4
	add	r2, sl, #748	; 0x2ec
	str	r2, [sl, #744]	; 0x2e8
	mov	r1, r4
	strd	r4, r3, [r5, #8]
	strd	r4, r4, [r5]
	strd	r4, r4, [r5, #16]
	str	r4, [r5, #100]	; 0x64
	movs	r2, #8
	str	r4, [r5, #24]
	add	r0, r5, #92	; 0x5c
	bl	memset
	strd	r5, r9, [r5, #28]
	strd	r8, r7, [r5, #36]	; 0x24
	str	r6, [r5, #44]	; 0x2c
	add	r0, r5, #88	; 0x58
	bl	__retarget_lock_init_recursive
	ldr	r5, [sl, #8]
	ldr	r3, [pc, #148]	; (8005840 <__sinit+0x104>)
	str	r3, [r5, #12]
	mov	r1, r4
	strd	r4, r4, [r5]
	strd	r4, r4, [r5, #16]
	str	r4, [r5, #100]	; 0x64
	str	r4, [r5, #8]
	str	r4, [r5, #24]
	movs	r2, #8
	add	r0, r5, #92	; 0x5c
	bl	memset
	strd	r5, r9, [r5, #28]
	strd	r8, r7, [r5, #36]	; 0x24
	str	r6, [r5, #44]	; 0x2c
	add	r0, r5, #88	; 0x58
	bl	__retarget_lock_init_recursive
	ldr	r5, [sl, #12]
	ldr	r3, [pc, #100]	; (8005844 <__sinit+0x108>)
	str	r3, [r5, #12]
	mov	r1, r4
	strd	r4, r4, [r5]
	strd	r4, r4, [r5, #16]
	str	r4, [r5, #100]	; 0x64
	str	r4, [r5, #8]
	str	r4, [r5, #24]
	movs	r2, #8
	add	r0, r5, #92	; 0x5c
	bl	memset
	add	r0, r5, #88	; 0x58
	strd	r5, r9, [r5, #28]
	strd	r7, r6, [r5, #40]	; 0x28
	str	r8, [r5, #36]	; 0x24
	bl	__retarget_lock_init_recursive
	movs	r3, #1
	str	r3, [sl, #56]	; 0x38
	ldr	r0, [pc, #16]	; (8005828 <__sinit+0xec>)
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	__retarget_lock_release_recursive
lab800: 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r0, [pc, #4]	; (8005828 <__sinit+0xec>)
	b	__retarget_lock_release_recursive
	.word	0x2000250c
	.word	0x080056b5
	.word	0x08006f9d
	.word	0x08006fc5
	.word	0x08007005
	.word	0x08007025
	.word	0x00010009
	.word	0x00020012
__sfp:
	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r7, r0
	ldr	r0, [pc, #180]	; (8005904 <__sfp+0xbc>)
	bl	__retarget_lock_acquire_recursive
	ldr	r3, [pc, #176]	; (8005908 <__sfp+0xc0>)
	ldr	r6, [r3, #0]
	ldr	r3, [r6, #56]	; 0x38
	cbz	r3, lab801
lab807: 	add	r6, r6, #736	; 0x2e0
	mov	r8, #4
lab806: 	ldrd	r3, r4, [r6, #4]
	subs	r3, #1
	bpl	lab802
	b	lab803
lab804: 	adds	r2, r3, #1
	add	r4, r4, #104	; 0x68
	beq	lab803
lab802: 	ldrsh	r5, [r4, #12]
	subs	r3, #1
	cmp	r5, #0
	bne	lab804
	ldr	r3, [pc, #136]	; (800590c <__sfp+0xc4>)
	str	r3, [r4, #12]
	add	r0, r4, #88	; 0x58
	str	r5, [r4, #100]	; 0x64
	bl	__retarget_lock_init_recursive
	ldr	r0, [pc, #116]	; (8005904 <__sfp+0xbc>)
	bl	__retarget_lock_release_recursive
	strd	r5, r5, [r4, #4]
	strd	r5, r5, [r4, #16]
	str	r5, [r4, #0]
	str	r5, [r4, #24]
	movs	r2, #8
	mov	r1, r5
	add	r0, r4, #92	; 0x5c
	bl	memset
	strd	r5, r5, [r4, #48]	; 0x30
	strd	r5, r5, [r4, #68]	; 0x44
lab809: 	mov	r0, r4
	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
lab803: 	ldr	r5, [r6, #0]
	cbz	r5, lab805
	mov	r6, r5
	b	lab806
lab801: 	mov	r0, r6
	bl	__sinit
	b	lab807
lab805: 	mov	r1, #428	; 0x1ac
	mov	r0, r7
	bl	_malloc_r
	mov	r4, r0
	cbz	r0, lab808
	str	r5, [r0, #0]
	str	r8, [r0, #4]
	adds	r0, #12
	mov	r1, r5
	str	r0, [r4, #8]
	mov	r5, r4
	mov	r2, #416	; 0x1a0
	bl	memset
	str	r4, [r6, #0]
	mov	r6, r5
	b	lab806
lab808: 	ldr	r0, [pc, #12]	; (8005904 <__sfp+0xbc>)
	str	r4, [r6, #0]
	bl	__retarget_lock_release_recursive
	movs	r3, #12
	str	r3, [r7, #0]
	b	lab809
	nop
	.word	0x20002508
	.word	0x20000d48
	.word	0xffff0001
__sfp_lock_acquire:
	ldr	r0, [pc, #4]	; (8005918 <__sfp_lock_acquire+0x8>)
	b	__retarget_lock_acquire_recursive
	nop
	.word	0x20002508
__sfp_lock_release:
	ldr	r0, [pc, #4]	; (8005924 <__sfp_lock_release+0x8>)
	b	__retarget_lock_release_recursive
	nop
	.word	0x20002508
__sinit_lock_acquire:
	ldr	r0, [pc, #4]	; (8005930 <__sinit_lock_acquire+0x8>)
	b	__retarget_lock_acquire_recursive
	nop
	.word	0x2000250c
__sinit_lock_release:
	ldr	r0, [pc, #4]	; (800593c <__sinit_lock_release+0x8>)
	b	__retarget_lock_release_recursive
	nop
	.word	0x2000250c
__fp_lock_all:
	push	{r3, lr}
	ldr	r0, [pc, #20]	; (8005958 <__fp_lock_all+0x18>)
	bl	__retarget_lock_acquire_recursive
	ldr	r3, [pc, #16]	; (800595c <__fp_lock_all+0x1c>)
	ldr	r1, [pc, #20]	; (8005960 <__fp_lock_all+0x20>)
	ldr	r0, [r3, #0]
	ldmia	sp!, {r3, lr}
	b	_fwalk
	nop
	.word	0x20002508
	.word	0x20000eb4
	.word	0x080056c1
__fp_unlock_all:
	push	{r3, lr}
	ldr	r3, [pc, #20]	; (800597c <__fp_unlock_all+0x18>)
	ldr	r1, [pc, #20]	; (8005980 <__fp_unlock_all+0x1c>)
	ldr	r0, [r3, #0]
	bl	_fwalk
	ldmia	sp!, {r3, lr}
	ldr	r0, [pc, #12]	; (8005984 <__fp_unlock_all+0x20>)
	b	__retarget_lock_release_recursive
	nop
	.word	0x20000eb4
	.word	0x080056dd
	.word	0x20002508
__fputwc:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
	sub	sp, #12
	mov	r7, r0
	mov	r8, r1
	mov	r4, r2
	bl	__locale_mb_cur_max
	cmp	r0, #1
	bne	lab810
	add	r3, r8, #4294967295	; 0xffffffff
	cmp	r3, #254	; 0xfe
	bls	lab811
lab810: 	mov	r2, r8
	add	r3, r4, #92	; 0x5c
	add	r1, sp, #4
	mov	r0, r7
	bl	_wcrtomb_r
	adds	r2, r0, #1
	mov	r6, r0
	beq	lab812
	cbz	r0, lab813
	ldrb	ip, [sp, #4]
lab818: 	add	r9, sp, #5
	movs	r5, #0
	b	lab814
lab815: 	ldr	r3, [r4, #0]
	adds	r2, r3, #1
	str	r2, [r4, #0]
	strb	ip, [r3]
lab817: 	adds	r5, #1
	cmp	r5, r6
	bcs	lab813
	ldrb	ip, [r9], #1
lab814: 	ldr	r3, [r4, #8]
	subs	r3, #1
	cmp	r3, #0
	str	r3, [r4, #8]
	bge	lab815
	ldr	lr, [r4, #24]
	cmp	r3, lr
	mov	r1, ip
	mov	r2, r4
	mov	r0, r7
	blt	lab816
	cmp	ip, #10
	bne	lab815
lab816: 	bl	__swbuf_r
	adds	r3, r0, #1
	bne	lab817
	mov	r6, r0
	mov	r0, r6
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, pc}
lab813: 	mov	r6, r8
	mov	r0, r6
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, pc}
lab811: 	uxtb	ip, r8
	strb	ip, [sp, #4]
	mov	r6, r0
	b	lab818
lab812: 	ldrh	r3, [r4, #12]
	mov	r0, r6
	orr	r3, r3, #64	; 0x40
	strh	r3, [r4, #12]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, pc}
_fputwc_r:
	push	{r4, r5, lr}
	ldr	r3, [r2, #100]	; 0x64
	tst	r3, #1
	ldrsh	r3, [r2, #12]
	mov	r4, r2
	sub	sp, #12
	mov	r5, r0
	uxth	r2, r3
	bne	lab819
	lsls	r0, r3, #22
	bpl	lab820
lab819: 	lsls	r0, r2, #18
	bmi	lab821
	ldr	r2, [r4, #100]	; 0x64
	orr	r3, r3, #8192	; 0x2000
	orr	r2, r2, #8192	; 0x2000
	strh	r3, [r4, #12]
	str	r2, [r4, #100]	; 0x64
lab821: 	mov	r2, r4
	mov	r0, r5
	bl	__fputwc
	ldr	r3, [r4, #100]	; 0x64
	lsls	r2, r3, #31
	mov	r5, r0
	bmi	lab822
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #22
	bpl	lab823
lab822: 	mov	r0, r5
	add	sp, #12
	pop	{r4, r5, pc}
lab823: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	add	sp, #12
	pop	{r4, r5, pc}
lab820: 	ldr	r0, [r4, #88]	; 0x58
	str	r1, [sp, #4]
	bl	__retarget_lock_acquire_recursive
	ldrsh	r3, [r4, #12]
	ldr	r1, [sp, #4]
	uxth	r2, r3
	b	lab819
	nop
fputwc:
	ldr	r3, [pc, #108]	; (8005b08 <fputwc+0x70>)
	push	{r4, r5, r6, lr}
	ldr	r6, [r3, #0]
	mov	r5, r0
	mov	r4, r1
	cbz	r6, lab824
	ldr	r3, [r6, #56]	; 0x38
	cbz	r3, lab825
lab824: 	ldr	r3, [r4, #100]	; 0x64
	tst	r3, #1
	ldrsh	r3, [r4, #12]
	uxth	r2, r3
	bne	lab826
	lsls	r0, r3, #22
	bpl	lab827
lab826: 	lsls	r1, r2, #18
	bmi	lab828
	ldr	r2, [r4, #100]	; 0x64
	orr	r3, r3, #8192	; 0x2000
	orr	r2, r2, #8192	; 0x2000
	strh	r3, [r4, #12]
	str	r2, [r4, #100]	; 0x64
lab828: 	mov	r2, r4
	mov	r1, r5
	mov	r0, r6
	bl	__fputwc
	ldr	r3, [r4, #100]	; 0x64
	lsls	r2, r3, #31
	mov	r5, r0
	bmi	lab829
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #22
	bpl	lab830
lab829: 	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab825: 	mov	r0, r6
	bl	__sinit
	b	lab824
lab830: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab827: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_acquire_recursive
	ldrsh	r3, [r4, #12]
	uxth	r2, r3
	b	lab826
	.word	0x20000eb4
_malloc_trim_r:
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r7, [pc, #144]	; (8005ba0 <_malloc_trim_r+0x94>)
	mov	r4, r1
	mov	r6, r0
	bl	__malloc_lock
	ldr	r2, [r7, #8]
	ldr	r5, [r2, #4]
	rsb	r3, r4, #4064	; 0xfe0
	adds	r3, #15
	bic	r5, r5, #3
	add	r3, r5
	bic	r3, r3, #4080	; 0xff0
	bic	r3, r3, #15
	sub	r4, r3, #4096	; 0x1000
	cmp	r4, #4096	; 0x1000
	blt	lab831
	movs	r1, #0
	mov	r0, r6
	bl	_sbrk_r
	ldr	r3, [r7, #8]
	add	r3, r5
	cmp	r0, r3
	beq	lab832
lab831: 	mov	r0, r6
	bl	__malloc_unlock
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
lab832: 	negs	r1, r4
	mov	r0, r6
	bl	_sbrk_r
	adds	r0, #1
	beq	lab833
	ldr	r2, [pc, #64]	; (8005ba4 <_malloc_trim_r+0x98>)
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
	pop	{r3, r4, r5, r6, r7, pc}
lab833: 	movs	r1, #0
	mov	r0, r6
	bl	_sbrk_r
	ldr	r2, [r7, #8]
	subs	r3, r0, r2
	cmp	r3, #15
	ble	lab831
	orr	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [pc, #20]	; (8005ba8 <_malloc_trim_r+0x9c>)
	ldr	r1, [pc, #12]	; (8005ba4 <_malloc_trim_r+0x98>)
	ldr	r3, [r3, #0]
	subs	r0, r0, r3
	str	r0, [r1, #0]
	b	lab831
	nop
	.word	0x2000144c
	.word	0x20002514
	.word	0x20001854
_free_r:
	cmp	r1, #0
	beq	lab834
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r1
	mov	r6, r0
	bl	__malloc_lock
	ldr	r2, [r4, #-4]
	ldr	r7, [pc, #492]	; (8005dac <_free_r+0x200>)
	sub	r5, r4, #8
	bic	r1, r2, #1
	add	ip, r5, r1
	ldr	r0, [r7, #8]
	ldr	r3, [ip, #4]
	cmp	r0, ip
	bic	r3, r3, #3
	beq	lab835
	lsls	r2, r2, #31
	str	r3, [ip, #4]
	bmi	lab836
	ldr	r2, [r4, #-8]
	subs	r5, r5, r2
	add	r1, r2
	ldr	r2, [r5, #8]
	add	r0, r7, #8
	cmp	r2, r0
	beq	lab837
	add	r4, ip, r3
	ldr	lr, [r4, #4]
	ldr	r4, [r5, #12]
	str	r4, [r2, #12]
	tst	lr, #1
	str	r2, [r4, #8]
	beq	lab838
	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [ip]
lab842: 	cmp	r1, #512	; 0x200
	bcs	lab839
lab843: 	ldr	r2, [r7, #4]
	lsrs	r3, r1, #3
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
lab850: 	mov	r0, r6
	ldmia	sp!, {r3, r4, r5, r6, r7, lr}
	b	__malloc_unlock
lab836: 	add	r2, ip, r3
	ldr	r2, [r2, #4]
	lsls	r0, r2, #31
	bmi	lab840
	add	r1, r3
	add	r0, r7, #8
lab854: 	ldr	r3, [ip, #8]
	cmp	r3, r0
	beq	lab841
	ldr	r2, [ip, #12]
	str	r2, [r3, #12]
	str	r3, [r2, #8]
	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [r5, r1]
	b	lab842
lab834: 	bx	lr
lab840: 	orr	r3, r1, #1
	cmp	r1, #512	; 0x200
	str	r3, [r4, #-4]
	str	r1, [ip]
	bcc	lab843
lab839: 	cmp	r1, #2560	; 0xa00
	mov	r3, r1, lsr #9
	bcs	lab844
	lsrs	r3, r1, #6
	add	r0, r3, #57	; 0x39
	add	r2, r3, #56	; 0x38
	lsls	r3, r0, #3
lab853: 	adds	r0, r7, r3
	ldr	r3, [r7, r3]
	subs	r0, #8
	cmp	r0, r3
	beq	lab845
lab847: 	ldr	r2, [r3, #4]
	bic	r2, r2, #3
	cmp	r2, r1
	bls	lab846
	ldr	r3, [r3, #8]
	cmp	r0, r3
	bne	lab847
lab846: 	ldr	r0, [r3, #12]
lab855: 	strd	r3, r0, [r5, #8]
	str	r5, [r0, #8]
	str	r5, [r3, #12]
	mov	r0, r6
	ldmia	sp!, {r3, r4, r5, r6, r7, lr}
	b	__malloc_unlock
lab837: 	add	r2, ip, r3
	ldr	r2, [r2, #4]
	lsls	r2, r2, #31
	bmi	lab848
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
lab835: 	add	r3, r1
	lsls	r1, r2, #31
	bmi	lab849
	ldr	r2, [r4, #-8]
	subs	r5, r5, r2
	add	r3, r2
	ldrd	r1, r2, [r5, #8]
	str	r2, [r1, #12]
	str	r1, [r2, #8]
lab849: 	orr	r2, r3, #1
	str	r2, [r5, #4]
	ldr	r2, [pc, #160]	; (8005db0 <_free_r+0x204>)
	str	r5, [r7, #8]
	ldr	r2, [r2, #0]
	cmp	r2, r3
	bhi	lab850
	ldr	r3, [pc, #152]	; (8005db4 <_free_r+0x208>)
	mov	r0, r6
	ldr	r1, [r3, #0]
	bl	_malloc_trim_r
	b	lab850
lab844: 	cmp	r3, #20
	bls	lab851
	cmp	r3, #84	; 0x54
	bhi	lab852
	lsrs	r3, r1, #12
	add	r0, r3, #111	; 0x6f
	add	r2, r3, #110	; 0x6e
	lsls	r3, r0, #3
	b	lab853
lab838: 	add	r1, r3
	b	lab854
lab851: 	add	r0, r3, #92	; 0x5c
	add	r2, r3, #91	; 0x5b
	lsls	r3, r0, #3
	b	lab853
lab841: 	orr	r3, r1, #1
	strd	r5, r5, [r7, #16]
	strd	r0, r0, [r5, #8]
	str	r3, [r5, #4]
	str	r1, [r5, r1]
	b	lab850
lab845: 	ldr	r1, [r7, #4]
	asrs	r2, r2, #2
	movs	r4, #1
	lsl	r2, r4, r2
	orrs	r2, r1
	str	r2, [r7, #4]
	b	lab855
lab852: 	cmp	r3, #340	; 0x154
	bhi	lab856
	lsrs	r3, r1, #15
	add	r0, r3, #120	; 0x78
	add	r2, r3, #119	; 0x77
	lsls	r3, r0, #3
	b	lab853
lab856: 	movw	r2, #1364	; 0x554
	cmp	r3, r2
	bhi	lab857
	lsrs	r3, r1, #18
	add	r0, r3, #125	; 0x7d
	add	r2, r3, #124	; 0x7c
	lsls	r3, r0, #3
	b	lab853
lab857: 	mov	r3, #1016	; 0x3f8
	movs	r2, #126	; 0x7e
	b	lab853
lab848: 	orr	r3, r1, #1
	str	r3, [r5, #4]
	str	r1, [ip]
	b	lab850
	nop
	.word	0x2000144c
	.word	0x20001858
	.word	0x20002544
__sfvwrite_r:
	ldr	r3, [r2, #8]
	cmp	r3, #0
	beq	lab858
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldrsh	r3, [r1, #12]
	mov	r4, r1
	lsls	r1, r3, #28
	mov	r8, r0
	sub	sp, #12
	mov	r7, r2
	uxth	r0, r3
	bpl	lab859
	ldr	r3, [r4, #16]
	cbz	r3, lab859
	ands	r3, r0, #2
	ldr	r5, [r7, #0]
	beq	lab860
lab865: 	mov	sl, #0
	ldr	fp, [pc, #692]	; 800609c <__sfvwrite_r+0x2e4>
	mov	r6, sl
lab863: 	cmp	r6, fp
	mov	r3, r6
	mov	r2, sl
	it	cs
	movcs	r3, fp
	mov	r0, r8
	cmp	r6, #0
	beq	lab861
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #36]	; 0x24
	blx	ip
	cmp	r0, #0
	ble	lab862
	ldr	r3, [r7, #8]
	subs	r3, r3, r0
	add	sl, r0
	subs	r6, r6, r0
	str	r3, [r7, #8]
	cmp	r3, #0
	bne	lab863
lab871: 	movs	r0, #0
lab895: 	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab859: 	mov	r1, r4
	mov	r0, r8
	bl	__swsetup_r
	cmp	r0, #0
	bne	lab864
	ldrsh	r3, [r4, #12]
	ldr	r5, [r7, #0]
	uxth	r0, r3
	ands	r3, r0, #2
	bne	lab865
lab860: 	ands	r9, r0, #1
	bne	lab866
	mov	r6, r9
lab873: 	cbz	r6, lab867
lab872: 	lsls	r2, r0, #22
	ldr	fp, [r4, #8]
	bpl	lab868
	cmp	fp, r6
	mov	r2, fp
	bhi	lab869
	tst	r0, #1152	; 0x480
	bne	lab870
	ldr	r0, [r4, #0]
lab888: 	str	r2, [sp, #4]
	mov	r1, r9
	bl	memmove
	ldr	r3, [r4, #8]
	ldr	r1, [r4, #0]
	ldr	r2, [sp, #4]
	sub	r3, r3, fp
	add	r2, r1
	mov	sl, r6
	str	r3, [r4, #8]
	str	r2, [r4, #0]
	movs	r6, #0
lab886: 	ldr	r0, [r7, #8]
	sub	r0, r0, sl
	add	r9, sl
	str	r0, [r7, #8]
	cmp	r0, #0
	beq	lab871
	ldrsh	r0, [r4, #12]
	uxth	r0, r0
	cmp	r6, #0
	bne	lab872
lab867: 	ldrd	r9, r6, [r5]
	adds	r5, #8
	b	lab873
lab861: 	ldrd	sl, r6, [r5]
	adds	r5, #8
	b	lab863
lab880: 	mov	r1, r4
	mov	r0, r8
	bl	_fflush_r
	cbz	r0, lab874
lab862: 	ldrsh	r3, [r4, #12]
lab893: 	orr	r3, r3, #64	; 0x40
	mov	r0, #4294967295	; 0xffffffff
	strh	r3, [r4, #12]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab858: 	movs	r0, #0
	bx	lr
lab866: 	mov	r6, r3
	mov	sl, r5
	mov	r9, r3
	mov	r0, r3
	mov	r5, r3
	cbz	r6, lab875
lab881: 	cbz	r0, lab876
lab884: 	mov	r2, r9
lab894: 	ldrd	r1, r3, [r4, #16]
	ldr	r0, [r4, #0]
	cmp	r2, r6
	it	cs
	movcs	r2, r6
	cmp	r0, r1
	bls	lab877
	ldr	r1, [r4, #8]
	add	fp, r3, r1
	cmp	r2, fp
	bgt	lab878
lab877: 	cmp	r3, r2
	bgt	lab879
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #36]	; 0x24
	mov	r2, r5
	mov	r0, r8
	blx	ip
	subs	fp, r0, #0
	ble	lab862
lab889: 	subs	r9, r9, fp
	beq	lab880
	movs	r0, #1
lab874: 	ldr	r3, [r7, #8]
	sub	r3, r3, fp
	add	r5, fp
	sub	r6, r6, fp
	str	r3, [r7, #8]
	cmp	r3, #0
	beq	lab871
	cmp	r6, #0
	bne	lab881
lab875: 	add	r3, sl, #8
lab882: 	ldrd	r5, r6, [r3, #-8]
	mov	sl, r3
	adds	r3, #8
	cmp	r6, #0
	beq	lab882
lab876: 	mov	r2, r6
	movs	r1, #10
	mov	r0, r5
	bl	memchr
	cmp	r0, #0
	beq	lab883
	adds	r0, #1
	sub	r9, r0, r5
	b	lab884
lab868: 	ldr	r0, [r4, #0]
	ldr	r3, [r4, #16]
	cmp	r0, r3
	bhi	lab885
	ldr	r3, [r4, #20]
	cmp	r3, r6
	bhi	lab885
	mvn	r2, #2147483648	; 0x80000000
	cmp	r2, r6
	it	cs
	movcs	r2, r6
	ldr	r1, [r4, #28]
	sdiv	r2, r2, r3
	ldr	ip, [r4, #36]	; 0x24
	mul	r3, r2, r3
	mov	r0, r8
	mov	r2, r9
	blx	ip
	subs	sl, r0, #0
	ble	lab862
lab887: 	sub	r6, r6, sl
	b	lab886
lab885: 	cmp	fp, r6
	mov	sl, fp
	it	cs
	movcs	sl, r6
	mov	r2, sl
	mov	r1, r9
	bl	memmove
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #0]
	sub	r3, r3, sl
	add	r2, sl
	str	r3, [r4, #8]
	str	r2, [r4, #0]
	cmp	r3, #0
	bne	lab887
	mov	r1, r4
	mov	r0, r8
	bl	_fflush_r
	cmp	r0, #0
	beq	lab887
	b	lab862
lab869: 	ldr	r0, [r4, #0]
	mov	fp, r6
	mov	r2, r6
	b	lab888
lab879: 	mov	r1, r5
	str	r2, [sp, #4]
	bl	memmove
	ldr	r2, [sp, #4]
	ldr	r3, [r4, #8]
	subs	r3, r3, r2
	str	r3, [r4, #8]
	ldr	r3, [r4, #0]
	add	r3, r2
	str	r3, [r4, #0]
	mov	fp, r2
	b	lab889
lab870: 	ldr	r3, [r4, #0]
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
	bpl	lab890
	mov	r1, r2
	mov	r0, r8
	bl	_malloc_r
	cmp	r0, #0
	beq	lab891
	mov	r2, fp
	ldr	r1, [r4, #16]
	str	r0, [sp, #4]
	bl	memcpy
	ldrh	r2, [r4, #12]
	ldr	r3, [sp, #4]
	bic	r2, r2, #1152	; 0x480
	orr	r2, r2, #128	; 0x80
	strh	r2, [r4, #12]
lab892: 	add	r0, r3, fp
	str	r3, [r4, #16]
	sub	r3, sl, fp
	str	sl, [r4, #20]
	str	r3, [r4, #8]
	str	r0, [r4, #0]
	mov	fp, r6
	mov	r2, r6
	b	lab888
lab878: 	mov	r1, r5
	mov	r2, fp
	bl	memmove
	ldr	r3, [r4, #0]
	add	r3, fp
	str	r3, [r4, #0]
	mov	r1, r4
	mov	r0, r8
	bl	_fflush_r
	cmp	r0, #0
	beq	lab889
	b	lab862
lab890: 	mov	r0, r8
	bl	_realloc_r
	mov	r3, r0
	cmp	r0, #0
	bne	lab892
	ldr	r1, [r4, #16]
	mov	r0, r8
	bl	_free_r
	ldrsh	r3, [r4, #12]
	movs	r2, #12
	bic	r3, r3, #128	; 0x80
	str	r2, [r8]
	b	lab893
lab883: 	adds	r2, r6, #1
	mov	r9, r2
	b	lab894
lab891: 	movs	r2, #12
	ldrsh	r3, [r4, #12]
	str	r2, [r8]
	b	lab893
lab864: 	mov	r0, #4294967295	; 0xffffffff
	b	lab895
	nop
	.word	0x7ffffc00
_fwalk:
	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r8, r1
	add	r7, r0, #736	; 0x2e0
	movs	r6, #0
lab899: 	ldrd	r5, r4, [r7, #4]
	subs	r5, #1
	bmi	lab896
lab898: 	ldrh	r3, [r4, #12]
	cmp	r3, #1
	add	r5, r5, #4294967295	; 0xffffffff
	bls	lab897
	ldrsh	r3, [r4, #14]
	adds	r3, #1
	mov	r0, r4
	beq	lab897
	blx	r8
	orrs	r6, r0
lab897: 	adds	r3, r5, #1
	add	r4, r4, #104	; 0x68
	bne	lab898
lab896: 	ldr	r7, [r7, #0]
	cmp	r7, #0
	bne	lab899
	mov	r0, r6
	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
_fwalk_reent:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r0
	mov	r8, r1
	add	r6, r0, #736	; 0x2e0
	mov	r9, #0
lab903: 	ldrd	r5, r4, [r6, #4]
	subs	r5, #1
	bmi	lab900
lab902: 	ldrh	r3, [r4, #12]
	cmp	r3, #1
	add	r5, r5, #4294967295	; 0xffffffff
	bls	lab901
	ldrsh	r3, [r4, #14]
	adds	r3, #1
	mov	r1, r4
	beq	lab901
	mov	r0, r7
	blx	r8
	orr	r9, r9, r0
lab901: 	adds	r3, r5, #1
	add	r4, r4, #104	; 0x68
	bne	lab902
lab900: 	ldr	r6, [r6, #0]
	cmp	r6, #0
	bne	lab903
	mov	r0, r9
	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_setlocale_r:
	cbz	r2, lab904
	push	{r4, lr}
	ldr	r1, [pc, #44]	; (800615c <_setlocale_r+0x34>)
	mov	r0, r2
	mov	r4, r2
	bl	strcmp
	cbnz	r0, lab905
lab906: 	ldr	r0, [pc, #36]	; (8006160 <_setlocale_r+0x38>)
	pop	{r4, pc}
lab904: 	ldr	r0, [pc, #32]	; (8006160 <_setlocale_r+0x38>)
	bx	lr
lab905: 	ldr	r1, [pc, #28]	; (8006160 <_setlocale_r+0x38>)
	mov	r0, r4
	bl	strcmp
	cmp	r0, #0
	beq	lab906
	ldr	r1, [pc, #20]	; (8006164 <_setlocale_r+0x3c>)
	mov	r0, r4
	bl	strcmp
	cmp	r0, #0
	beq	lab906
	movs	r0, #0
	pop	{r4, pc}
	.word	0x20000da0
	.word	0x20000d9c
	.word	0x20000d14
__locale_mb_cur_max:
	ldr	r3, [pc, #4]	; (8006170 <__locale_mb_cur_max+0x8>)
	ldrb	r0, [r3, #296]	; 0x128
	bx	lr
	.word	0x200012e0
setlocale:
	cbz	r1, lab907
	push	{r4, lr}
	mov	r4, r1
	mov	r0, r4
	ldr	r1, [pc, #40]	; (80061a8 <setlocale+0x34>)
	bl	strcmp
	cbnz	r0, lab908
lab909: 	ldr	r0, [pc, #36]	; (80061ac <setlocale+0x38>)
	pop	{r4, pc}
lab907: 	ldr	r0, [pc, #32]	; (80061ac <setlocale+0x38>)
	bx	lr
lab908: 	ldr	r1, [pc, #28]	; (80061ac <setlocale+0x38>)
	mov	r0, r4
	bl	strcmp
	cmp	r0, #0
	beq	lab909
	ldr	r1, [pc, #20]	; (80061b0 <setlocale+0x3c>)
	mov	r0, r4
	bl	strcmp
	cmp	r0, #0
	beq	lab909
	movs	r0, #0
	pop	{r4, pc}
	.word	0x20000da0
	.word	0x20000d9c
	.word	0x20000d14
__localeconv_l:
	adds	r0, #240	; 0xf0
	bx	lr
_localeconv_r:
	ldr	r0, [pc, #0]	; (80061bc <_localeconv_r+0x4>)
	bx	lr
	.word	0x200013d0
localeconv:
	ldr	r0, [pc, #0]	; (80061c4 <localeconv+0x4>)
	bx	lr
	.word	0x200013d0
__retarget_lock_init:
	bx	lr
	nop
__retarget_lock_init_recursive:
	bx	lr
	nop
__retarget_lock_close:
	bx	lr
	nop
__retarget_lock_close_recursive:
	bx	lr
	nop
__retarget_lock_acquire:
	bx	lr
	nop
__retarget_lock_acquire_recursive:
	bx	lr
	nop
__retarget_lock_try_acquire:
	movs	r0, #1
	bx	lr
__retarget_lock_try_acquire_recursive:
	movs	r0, #1
	bx	lr
__retarget_lock_release:
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
	sub	sp, #88	; 0x58
	bpl	lab910
	add	r3, r4, #67	; 0x43
	movs	r2, #1
	strd	r3, r2, [r4, #16]
	str	r3, [r4, #0]
lab917: 	add	sp, #88	; 0x58
	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
lab910: 	ldrsh	r1, [r4, #14]
	cmp	r1, #0
	mov	r6, r0
	blt	lab911
	mov	r2, sp
	bl	_fstat_r
	cmp	r0, #0
	blt	lab912
	ldr	r5, [sp, #4]
	and	r5, r5, #61440	; 0xf000
	sub	r5, r5, #8192	; 0x2000
	clz	r5, r5
	mov	r8, #1024	; 0x400
	lsrs	r5, r5, #5
	mov	r7, #2048	; 0x800
lab918: 	mov	r1, r8
	mov	r0, r6
	bl	_malloc_r
	ldrsh	r3, [r4, #12]
	cbz	r0, lab913
lab916: 	ldr	r2, [pc, #128]	; (80062cc <__smakebuf_r+0xdc>)
	str	r2, [r6, #60]	; 0x3c
	orr	r3, r3, #128	; 0x80
	str	r8, [r4, #20]
	strh	r3, [r4, #12]
	str	r0, [r4, #0]
	str	r0, [r4, #16]
	cbnz	r5, lab914
lab920: 	orrs	r3, r7
	strh	r3, [r4, #12]
	add	sp, #88	; 0x58
	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
lab912: 	ldrh	r3, [r4, #12]
lab911: 	ands	r5, r3, #128	; 0x80
	beq	lab915
	mov	r8, #64	; 0x40
	mov	r1, r8
	mov	r0, r6
	bl	_malloc_r
	movs	r5, #0
	ldrsh	r3, [r4, #12]
	mov	r7, r5
	cmp	r0, #0
	bne	lab916
lab913: 	lsls	r2, r3, #22
	bmi	lab917
	bic	r3, r3, #3
	add	r2, r4, #67	; 0x43
	orr	r3, r3, #2
	movs	r1, #1
	strd	r2, r1, [r4, #16]
	strh	r3, [r4, #12]
	str	r2, [r4, #0]
	b	lab917
lab915: 	mov	r8, #1024	; 0x400
	mov	r7, r5
	b	lab918
lab914: 	ldrsh	r1, [r4, #14]
	mov	r0, r6
	bl	_isatty_r
	cbnz	r0, lab919
	ldrsh	r3, [r4, #12]
	b	lab920
lab919: 	ldrh	r3, [r4, #12]
	bic	r3, r3, #3
	orr	r3, r3, #1
	sxth	r3, r3
	b	lab920
	.word	0x080056b5
__swhatbuf_r:
	push	{r4, r5, r6, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #14]
	cmp	r1, #0
	sub	sp, #88	; 0x58
	mov	r5, r2
	mov	r6, r3
	blt	lab921
	mov	r2, sp
	bl	_fstat_r
	cmp	r0, #0
	blt	lab921
	ldr	r2, [sp, #4]
	and	r2, r2, #61440	; 0xf000
	sub	r2, r2, #8192	; 0x2000
	clz	r2, r2
	mov	r3, #1024	; 0x400
	lsrs	r2, r2, #5
	mov	r0, #2048	; 0x800
	str	r2, [r6, #0]
	str	r3, [r5, #0]
	add	sp, #88	; 0x58
	pop	{r4, r5, r6, pc}
lab921: 	ldrsh	r1, [r4, #12]
	movs	r3, #0
	ands	r0, r1, #128	; 0x80
	str	r3, [r6, #0]
	beq	lab922
	movs	r2, #64	; 0x40
	mov	r0, r3
	str	r2, [r5, #0]
	add	sp, #88	; 0x58
	pop	{r4, r5, r6, pc}
lab922: 	mov	r3, #1024	; 0x400
	str	r3, [r5, #0]
	add	sp, #88	; 0x58
	pop	{r4, r5, r6, pc}
	nop
_malloc_r:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	r6, r1, #11
	cmp	r6, #22
	sub	sp, #12
	mov	r4, r0
	bhi	lab923
	cmp	r1, #16
	bhi	lab924
	bl	__malloc_lock
	movs	r6, #16
	movs	r2, #24
	movs	r0, #2
lab972: 	ldr	r7, [pc, #724]	; (8006628 <_malloc_r+0x2f8>)
	add	r2, r7
	sub	r1, r2, #8
	ldr	r3, [r2, #4]
	cmp	r3, r1
	beq	lab925
lab946: 	ldr	r2, [r3, #4]
	ldr	r1, [r3, #12]
	bic	r2, r2, #3
	add	r2, r3
lab961: 	ldr	r5, [r3, #8]
	str	r1, [r5, #12]
	str	r5, [r1, #8]
	ldr	r1, [r2, #4]
	orr	r1, r1, #1
	mov	r0, r4
	str	r1, [r2, #4]
	add	r5, r3, #8
	bl	__malloc_unlock
	mov	r0, r5
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab923: 	bics	r6, r6, #7
	bmi	lab924
	cmp	r1, r6
	bhi	lab924
	bl	__malloc_lock
	cmp	r6, #504	; 0x1f8
	bcc	lab926
	lsrs	r3, r6, #9
	beq	lab927
	cmp	r3, #4
	bhi	lab928
	lsrs	r3, r6, #6
	add	r0, r3, #57	; 0x39
	add	ip, r3, #56	; 0x38
	lsls	r3, r0, #3
lab945: 	ldr	r7, [pc, #616]	; (8006628 <_malloc_r+0x2f8>)
	add	r3, r7
	sub	r5, r3, #8
	ldr	r3, [r3, #4]
	cmp	r5, r3
	bne	lab929
	b	lab930
lab932: 	cmp	r1, #0
	bge	lab931
	ldr	r3, [r3, #12]
	cmp	r5, r3
	beq	lab930
lab929: 	ldr	r2, [r3, #4]
	bic	r2, r2, #3
	subs	r1, r2, r6
	cmp	r1, #15
	ble	lab932
	mov	r0, ip
lab930: 	ldr	r5, [r7, #16]
	ldr	ip, [pc, #576]	; 800662c <_malloc_r+0x2fc>
	cmp	r5, ip
	beq	lab933
lab947: 	ldr	r2, [r5, #4]
	bic	r2, r2, #3
	subs	r3, r2, r6
	cmp	r3, #15
	bgt	lab934
	cmp	r3, #0
	strd	ip, ip, [r7, #16]
	bge	lab935
	cmp	r2, #512	; 0x200
	bcs	lab936
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
lab967: 	asrs	r3, r0, #2
	movs	r1, #1
	lsls	r1, r3
	cmp	r1, r2
	bhi	lab937
lab948: 	tst	r1, r2
	bne	lab938
	bic	r0, r0, #3
lab939: 	lsls	r1, r1, #1
	tst	r1, r2
	add	r0, r0, #4
	beq	lab939
lab938: 	add	r9, r7, r0, lsl #3
	mov	r5, r9
	mov	lr, r0
lab970: 	ldr	r8, [r5, #12]
	cmp	r5, r8
	bne	lab940
	b	lab941
lab943: 	cmp	r3, #0
	bge	lab942
	ldr	r8, [r8, #12]
	cmp	r5, r8
	beq	lab941
lab940: 	ldr	r2, [r8, #4]
	bic	r2, r2, #3
	subs	r3, r2, r6
	cmp	r3, #15
	ble	lab943
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
	b	lab944
lab924: 	movs	r3, #12
	str	r3, [r4, #0]
	movs	r5, #0
lab944: 	mov	r0, r5
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab927: 	mov	r3, #512	; 0x200
	movs	r0, #64	; 0x40
	mov	ip, #63	; 0x3f
	b	lab945
lab925: 	ldr	r3, [r2, #12]
	cmp	r2, r3
	it	eq
	addeq	r0, #2
	bne	lab946
	ldr	r5, [r7, #16]
	ldr	ip, [pc, #328]	; 800662c <_malloc_r+0x2fc>
	cmp	r5, ip
	bne	lab947
lab933: 	ldr	r2, [r7, #4]
	asrs	r3, r0, #2
	movs	r1, #1
	lsls	r1, r3
	cmp	r1, r2
	bls	lab948
lab937: 	ldr	r5, [r7, #8]
	ldr	r3, [r5, #4]
	bic	r9, r3, #3
	cmp	r6, r9
	bhi	lab949
	sub	r3, r9, r6
	cmp	r3, #15
	bgt	lab950
lab949: 	ldr	fp, [pc, #292]	; 8006630 <_malloc_r+0x300>
	ldr	r3, [pc, #292]	; (8006634 <_malloc_r+0x304>)
	ldr	r2, [fp]
	ldr	r3, [r3, #0]
	adds	r2, #1
	add	r3, r6
	add	sl, r5, r9
	beq	lab951
	add	r3, r3, #4096	; 0x1000
	adds	r3, #15
	bic	r8, r3, #4080	; 0xff0
	bic	r8, r8, #15
lab980: 	mov	r1, r8
	mov	r0, r4
	bl	_sbrk_r
	adds	r1, r0, #1
	mov	r2, r0
	beq	lab952
	cmp	sl, r0
	bhi	lab953
	ldr	r3, [pc, #240]	; (8006638 <_malloc_r+0x308>)
	ldr	r1, [r3, #0]
	add	r1, r8
	str	r1, [r3, #0]
	mov	r0, r1
	beq	lab954
lab986: 	ldr	r1, [fp]
	str	r3, [sp, #4]
	adds	r1, #1
	ittet	ne
	subne	sl, r2, sl
	addne	r0, sl
	streq	r2, [fp]
	strne	r0, [r3, #0]
	ands	fp, r2, #7
	beq	lab955
	rsb	r1, fp, #8
	add	r2, r1
	rsb	r1, fp, #4096	; 0x1000
	add	r8, r2
	adds	r1, #8
	sub	r1, r1, r8
	ubfx	sl, r1, #0, #12
	mov	r1, sl
	mov	r0, r4
	str	r2, [sp, #0]
	bl	_sbrk_r
	adds	r2, r0, #1
	ldrd	r2, r3, [sp]
	beq	lab956
lab982: 	subs	r0, r0, r2
	add	r8, r0, sl
lab983: 	ldr	r1, [r3, #0]
	str	r2, [r7, #8]
	orr	r0, r8, #1
	add	r1, sl
	cmp	r5, r7
	str	r0, [r2, #4]
	str	r1, [r3, #0]
	beq	lab957
	cmp	r9, #15
	bls	lab958
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
	bhi	lab959
	ldr	r0, [r2, #4]
	mov	r5, r2
lab987: 	ldr	r3, [pc, #80]	; (800663c <_malloc_r+0x30c>)
	ldr	r2, [r3, #0]
	cmp	r2, r1
	it	cc
	strcc	r1, [r3, #0]
	ldr	r3, [pc, #72]	; (8006640 <_malloc_r+0x310>)
	ldr	r2, [r3, #0]
	cmp	r2, r1
	it	cc
	strcc	r1, [r3, #0]
	b	lab960
lab950: 	adds	r2, r5, r6
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
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab931: 	ldr	r1, [r3, #12]
	add	r2, r3
	b	lab961
	nop
	.word	0x2000144c
	.word	0x20001454
	.word	0x20001854
	.word	0x20002544
	.word	0x20002514
	.word	0x2000253c
	.word	0x20002540
lab936: 	cmp	r2, #2560	; 0xa00
	mov	r3, r2, lsr #9
	bcc	lab962
	cmp	r3, #20
	bhi	lab963
	add	r1, r3, #92	; 0x5c
	lsls	r1, r1, #3
	adds	r3, #91	; 0x5b
lab973: 	add	lr, r7, r1
	ldr	r1, [r7, r1]
	sub	lr, lr, #8
	cmp	lr, r1
	beq	lab964
lab966: 	ldr	r3, [r1, #4]
	bic	r3, r3, #3
	cmp	r3, r2
	bls	lab965
	ldr	r1, [r1, #8]
	cmp	lr, r1
	bne	lab966
lab965: 	ldr	lr, [r1, #12]
	ldr	r2, [r7, #4]
lab981: 	strd	r1, lr, [r5, #8]
	str	r5, [lr, #8]
	str	r5, [r1, #12]
	b	lab967
lab928: 	cmp	r3, #20
	bls	lab968
	cmp	r3, #84	; 0x54
	bhi	lab969
	lsrs	r3, r6, #12
	add	r0, r3, #111	; 0x6f
	add	ip, r3, #110	; 0x6e
	lsls	r3, r0, #3
	b	lab945
lab941: 	add	lr, lr, #1
	tst	lr, #3
	add	r5, r5, #8
	bne	lab970
	b	lab971
lab942: 	add	r2, r8
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
	b	lab944
lab926: 	lsrs	r0, r6, #3
	add	r2, r6, #8
	b	lab972
lab935: 	add	r2, r5
	mov	r0, r4
	ldr	r3, [r2, #4]
	orr	r3, r3, #1
	str	r3, [r2, #4]
	adds	r5, #8
	bl	__malloc_unlock
	b	lab944
lab934: 	adds	r1, r5, r6
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
	b	lab944
lab962: 	lsrs	r3, r2, #6
	add	r1, r3, #57	; 0x39
	lsls	r1, r1, #3
	adds	r3, #56	; 0x38
	b	lab973
lab953: 	cmp	r5, r7
	beq	lab974
lab952: 	ldr	r5, [r7, #8]
	ldr	r0, [r5, #4]
lab960: 	bic	r8, r0, #3
	cmp	r6, r8
	sub	r3, r8, r6
	bhi	lab975
	cmp	r3, #15
	bgt	lab950
lab975: 	mov	r0, r4
	bl	__malloc_unlock
	movs	r5, #0
	b	lab944
lab968: 	add	r0, r3, #92	; 0x5c
	add	ip, r3, #91	; 0x5b
	lsls	r3, r0, #3
	b	lab945
lab977: 	ldr	r3, [r9], #-8
	cmp	r3, r9
	bne	lab976
lab971: 	tst	r0, #3
	add	r0, r0, #4294967295	; 0xffffffff
	bne	lab977
	ldr	r3, [r7, #4]
	bic	r3, r3, r1
	str	r3, [r7, #4]
lab991: 	lsls	r1, r1, #1
	cmp	r1, r3
	bhi	lab937
	cbnz	r1, lab978
	b	lab937
lab979: 	lsls	r1, r1, #1
	add	lr, lr, #4
lab978: 	tst	r1, r3
	beq	lab979
	mov	r0, lr
	b	lab938
lab951: 	add	r8, r3, #16
	b	lab980
lab964: 	asrs	r2, r3, #2
	mov	r8, #1
	ldr	r3, [r7, #4]
	lsl	r2, r8, r2
	orrs	r2, r3
	str	r2, [r7, #4]
	b	lab981
lab955: 	add	r1, r2, r8
	negs	r1, r1
	ubfx	sl, r1, #0, #12
	mov	r1, sl
	mov	r0, r4
	str	r2, [sp, #0]
	bl	_sbrk_r
	adds	r3, r0, #1
	ldrd	r2, r3, [sp]
	bne	lab982
	mov	sl, fp
	b	lab983
lab963: 	cmp	r3, #84	; 0x54
	bhi	lab984
	lsrs	r3, r2, #12
	add	r1, r3, #111	; 0x6f
	lsls	r1, r1, #3
	adds	r3, #110	; 0x6e
	b	lab973
lab969: 	cmp	r3, #340	; 0x154
	bhi	lab985
	lsrs	r3, r6, #15
	add	r0, r3, #120	; 0x78
	add	ip, r3, #119	; 0x77
	lsls	r3, r0, #3
	b	lab945
lab974: 	ldr	r3, [pc, #164]	; (800688c <_malloc_r+0x55c>)
	ldr	r0, [r3, #0]
	add	r0, r8
	str	r0, [r3, #0]
	b	lab986
lab954: 	ubfx	ip, sl, #0, #12
	cmp	ip, #0
	bne	lab986
	ldr	r5, [r7, #8]
	add	r8, r9
	orr	r0, r8, #1
	str	r0, [r5, #4]
	b	lab987
lab957: 	mov	r5, r2
	b	lab987
lab958: 	movs	r3, #1
	str	r3, [r2, #4]
	b	lab975
lab984: 	cmp	r3, #340	; 0x154
	bhi	lab988
	lsrs	r3, r2, #15
	add	r1, r3, #120	; 0x78
	lsls	r1, r1, #3
	adds	r3, #119	; 0x77
	b	lab973
lab985: 	movw	r2, #1364	; 0x554
	cmp	r3, r2
	bhi	lab989
	lsrs	r3, r6, #18
	add	r0, r3, #125	; 0x7d
	add	ip, r3, #124	; 0x7c
	lsls	r3, r0, #3
	b	lab945
lab956: 	sub	fp, fp, #8
	add	r8, fp
	sub	r8, r8, r2
	mov	sl, #0
	b	lab983
lab959: 	add	r1, r5, #8
	mov	r0, r4
	str	r3, [sp, #0]
	bl	_free_r
	ldr	r5, [r7, #8]
	ldr	r3, [sp, #0]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #0]
	b	lab987
lab988: 	movw	r1, #1364	; 0x554
	cmp	r3, r1
	bhi	lab990
	lsrs	r3, r2, #18
	add	r1, r3, #125	; 0x7d
	lsls	r1, r1, #3
	adds	r3, #124	; 0x7c
	b	lab973
lab989: 	mov	r3, #1016	; 0x3f8
	movs	r0, #127	; 0x7f
	mov	ip, #126	; 0x7e
	b	lab945
lab990: 	mov	r1, #1016	; 0x3f8
	movs	r3, #126	; 0x7e
	b	lab973
lab976: 	ldr	r3, [r7, #4]
	b	lab991
	.word	0x20002514
_mbtowc_r:
	push	{r4}
	ldr	r4, [pc, #12]	; (80068a0 <_mbtowc_r+0x10>)
	ldr	r4, [r4, #228]	; 0xe4
	mov	ip, r4
	pop	{r4}
	bx	ip
	nop
	.word	0x200012e0
__ascii_mbtowc:
	sub	sp, #8
	cbz	r1, lab992
	cbz	r2, lab993
lab995: 	cbz	r3, lab994
	ldrb	r3, [r2, #0]
	str	r3, [r1, #0]
	ldrb	r2, [r2, #0]
	subs	r0, r2, #0
	it	ne
	movne	r0, #1
lab996: 	add	sp, #8
	bx	lr
lab992: 	add	r1, sp, #4
	cmp	r2, #0
	bne	lab995
lab993: 	mov	r0, r2
	add	sp, #8
	bx	lr
lab994: 	mvn	r0, #1
	b	lab996
	nop
__malloc_lock:
	ldr	r0, [pc, #4]	; (80068d8 <__malloc_lock+0x8>)
	b	__retarget_lock_acquire_recursive
	nop
	.word	0x20002504
__malloc_unlock:
	ldr	r0, [pc, #4]	; (80068e4 <__malloc_unlock+0x8>)
	b	__retarget_lock_release_recursive
	nop
	.word	0x20002504
_realloc_r:
	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r7, r2
	cmp	r1, #0
	beq	lab997
	add	r5, r7, #11
	mov	r8, r0
	mov	r4, r1
	bl	__malloc_lock
	cmp	r5, #22
	bhi	lab998
	movs	r5, #16
	mov	r2, r5
lab1011: 	cmp	r7, r5
	bhi	lab999
	ldr	r1, [r4, #-4]
	bic	r6, r1, #3
	cmp	r6, r2
	sub	r9, r4, #8
	bge	lab1000
	ldr	r3, [pc, #752]	; (8006c10 <_realloc_r+0x328>)
	ldr	ip, [r3, #8]
	add	r0, r9, r6
	cmp	ip, r0
	beq	lab1001
	ldr	ip, [r0, #4]
	bic	r3, ip, #1
	add	r3, r0
	ldr	r3, [r3, #4]
	lsls	r3, r3, #31
	bmi	lab1002
	bic	ip, ip, #3
	add	r3, r6, ip
	cmp	r3, r2
	bge	lab1003
	lsls	r3, r1, #31
	bmi	lab1004
	ldr	r3, [r4, #-8]
	sub	sl, r9, r3
	ldr	r3, [sl, #4]
	bic	r1, r3, #3
	add	ip, r1
	add	ip, r6
	cmp	ip, r2
	bge	lab1005
lab1013: 	adds	r3, r6, r1
	cmp	r3, r2
	bge	lab1006
lab1004: 	mov	r1, r7
	mov	r0, r8
	bl	_malloc_r
	mov	r7, r0
	cbz	r0, lab1007
	ldr	r3, [r4, #-4]
	bic	r3, r3, #1
	add	r3, r9
	sub	r2, r0, #8
	cmp	r3, r2
	beq	lab1008
	subs	r2, r6, #4
	cmp	r2, #36	; 0x24
	bhi	lab1009
	cmp	r2, #19
	bhi	lab1010
	mov	r3, r0
	mov	r2, r4
lab1021: 	ldr	r1, [r2, #0]
	str	r1, [r3, #0]
	ldr	r1, [r2, #4]
	str	r1, [r3, #4]
	ldr	r2, [r2, #8]
	str	r2, [r3, #8]
lab1025: 	mov	r1, r4
	mov	r0, r8
	bl	_free_r
lab1007: 	mov	r0, r8
	bl	__malloc_unlock
	mov	r0, r7
	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab998: 	bic	r5, r5, #7
	cmp	r5, #0
	mov	r2, r5
	bge	lab1011
lab999: 	movs	r3, #12
	str	r3, [r8]
	movs	r7, #0
lab1019: 	mov	r0, r7
	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab1003: 	mov	r6, r3
	ldrd	r2, r3, [r0, #8]
	str	r3, [r2, #12]
	str	r2, [r3, #8]
lab1000: 	subs	r3, r6, r5
	cmp	r3, #15
	bhi	lab1012
	ldr	r3, [r9, #4]
	and	r3, r3, #1
	orrs	r3, r6
	add	r6, r9
	str	r3, [r9, #4]
	ldr	r3, [r6, #4]
	orr	r3, r3, #1
	str	r3, [r6, #4]
lab1014: 	mov	r0, r8
	mov	r7, r4
	bl	__malloc_unlock
	mov	r0, r7
	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab1002: 	lsls	r1, r1, #31
	bmi	lab1004
	ldr	r3, [r4, #-8]
	sub	sl, r9, r3
	ldr	r1, [sl, #4]
	bic	r1, r1, #3
	b	lab1013
lab997: 	ldmia	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r1, r2
	b	_malloc_r
lab1012: 	ldr	r1, [r9, #4]
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
	bl	_free_r
	b	lab1014
lab1001: 	ldr	r0, [ip, #4]
	bic	fp, r0, #3
	add	ip, r6, fp
	add	r0, r5, #16
	cmp	ip, r0
	bge	lab1015
	lsls	r1, r1, #31
	bmi	lab1004
	ldr	r1, [r4, #-8]
	sub	sl, r9, r1
	ldr	r1, [sl, #4]
	bic	r1, r1, #3
	add	fp, r1
	add	fp, r6
	cmp	r0, fp
	bgt	lab1013
	mov	r7, sl
	ldr	r1, [sl, #12]
	ldr	r0, [r7, #8]!
	subs	r2, r6, #4
	cmp	r2, #36	; 0x24
	str	r1, [r0, #12]
	str	r0, [r1, #8]
	bhi	lab1016
	cmp	r2, #19
	bls	lab1017
	ldr	r1, [r4, #0]
	str	r1, [sl, #8]
	ldr	r1, [r4, #4]
	str	r1, [sl, #12]
	cmp	r2, #27
	bhi	lab1018
	adds	r4, #8
	add	r2, sl, #16
lab1034: 	ldr	r1, [r4, #0]
	str	r1, [r2, #0]
	ldr	r1, [r4, #4]
	str	r1, [r2, #4]
	ldr	r1, [r4, #8]
	str	r1, [r2, #8]
lab1035: 	add	r1, sl, r5
	sub	r2, fp, r5
	orr	r2, r2, #1
	str	r1, [r3, #8]
	str	r2, [r1, #4]
	ldr	r3, [sl, #4]
	and	r3, r3, #1
	orrs	r5, r3
	mov	r0, r8
	str	r5, [sl, #4]
	bl	__malloc_unlock
	b	lab1019
lab1010: 	ldr	r3, [r4, #0]
	str	r3, [r0, #0]
	ldr	r3, [r4, #4]
	str	r3, [r0, #4]
	cmp	r2, #27
	bhi	lab1020
	add	r2, r4, #8
	add	r3, r0, #8
	b	lab1021
lab1015: 	add	r2, r9, r5
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
	b	lab1019
lab1008: 	ldr	r3, [r0, #-4]
	bic	r3, r3, #3
	add	r6, r3
	b	lab1000
lab1006: 	mov	r7, sl
	ldr	r1, [sl, #12]
	ldr	r0, [r7, #8]!
	subs	r2, r6, #4
	cmp	r2, #36	; 0x24
	str	r1, [r0, #12]
	str	r0, [r1, #8]
	bhi	lab1022
	cmp	r2, #19
	bls	lab1023
	ldr	r1, [r4, #0]
	str	r1, [sl, #8]
	ldr	r1, [r4, #4]
	str	r1, [sl, #12]
	cmp	r2, #27
	bhi	lab1024
	adds	r4, #8
	add	r2, sl, #16
lab1030: 	mov	r6, r3
	ldr	r3, [r4, #0]
	str	r3, [r2, #0]
	ldr	r3, [r4, #4]
	str	r3, [r2, #4]
	ldr	r3, [r4, #8]
	str	r3, [r2, #8]
	mov	r9, sl
	mov	r4, r7
	b	lab1000
lab1009: 	mov	r1, r4
	bl	memmove
	b	lab1025
lab1005: 	ldrd	r1, r3, [r0, #8]
	mov	r7, sl
	str	r3, [r1, #12]
	str	r1, [r3, #8]
	ldr	r1, [r7, #8]!
	ldr	r3, [sl, #12]
	str	r3, [r1, #12]
	subs	r2, r6, #4
	cmp	r2, #36	; 0x24
	str	r1, [r3, #8]
	bhi	lab1026
	cmp	r2, #19
	bls	lab1027
	ldr	r3, [r4, #0]
	str	r3, [sl, #8]
	ldr	r3, [r4, #4]
	str	r3, [sl, #12]
	cmp	r2, #27
	bhi	lab1028
	adds	r4, #8
	add	r3, sl, #16
lab1031: 	ldr	r2, [r4, #0]
	str	r2, [r3, #0]
	ldr	r2, [r4, #4]
	str	r2, [r3, #4]
	ldr	r2, [r4, #8]
	str	r2, [r3, #8]
	mov	r6, ip
	mov	r9, sl
	mov	r4, r7
	b	lab1000
lab1020: 	ldr	r3, [r4, #8]
	str	r3, [r0, #8]
	ldr	r3, [r4, #12]
	str	r3, [r0, #12]
	cmp	r2, #36	; 0x24
	beq	lab1029
	add	r2, r4, #16
	add	r3, r0, #16
	b	lab1021
lab1023: 	mov	r2, r7
	b	lab1030
lab1022: 	mov	r1, r4
	mov	r0, r7
	mov	r6, r3
	mov	r9, sl
	bl	memmove
	mov	r4, r7
	b	lab1000
lab1027: 	mov	r3, r7
	b	lab1031
lab1026: 	mov	r1, r4
	mov	r0, r7
	mov	r6, ip
	mov	r9, sl
	bl	memmove
	mov	r4, r7
	b	lab1000
	.word	0x2000144c
lab1024: 	ldr	r1, [r4, #8]
	str	r1, [sl, #16]
	ldr	r1, [r4, #12]
	str	r1, [sl, #20]
	cmp	r2, #36	; 0x24
	beq	lab1032
	adds	r4, #16
	add	r2, sl, #24
	b	lab1030
lab1029: 	ldr	r3, [r4, #16]
	str	r3, [r0, #16]
	ldr	r1, [r4, #20]
	str	r1, [r0, #20]
	add	r2, r4, #24
	add	r3, r0, #24
	b	lab1021
lab1028: 	ldr	r3, [r4, #8]
	str	r3, [sl, #16]
	ldr	r3, [r4, #12]
	str	r3, [sl, #20]
	cmp	r2, #36	; 0x24
	beq	lab1033
	adds	r4, #16
	add	r3, sl, #24
	b	lab1031
lab1017: 	mov	r2, r7
	b	lab1034
lab1016: 	mov	r1, r4
	mov	r0, r7
	bl	memmove
	ldr	r3, [pc, #88]	; (8006cbc <_realloc_r+0x3d4>)
	b	lab1035
lab1032: 	ldr	r2, [r4, #16]
	str	r2, [sl, #24]
	ldr	r2, [r4, #20]
	str	r2, [sl, #28]
	adds	r4, #24
	add	r2, sl, #32
	b	lab1030
lab1018: 	ldr	r1, [r4, #8]
	str	r1, [sl, #16]
	ldr	r1, [r4, #12]
	str	r1, [sl, #20]
	cmp	r2, #36	; 0x24
	beq	lab1036
	adds	r4, #16
	add	r2, sl, #24
	b	lab1034
lab1033: 	ldr	r3, [r4, #16]
	str	r3, [sl, #24]
	ldr	r3, [r4, #20]
	str	r3, [sl, #28]
	adds	r4, #24
	add	r3, sl, #32
	b	lab1031
lab1036: 	ldr	r2, [r4, #16]
	str	r2, [sl, #24]
	ldr	r2, [r4, #20]
	str	r2, [sl, #28]
	adds	r4, #24
	add	r2, sl, #32
	b	lab1034
	nop
	.word	0x2000144c
_sbrk_r:
	push	{r3, r4, r5, lr}
	ldr	r5, [pc, #28]	; (8006ce0 <_sbrk_r+0x20>)
	movs	r2, #0
	mov	r4, r0
	mov	r0, r1
	str	r2, [r5, #0]
	bl	_sbrk
	adds	r3, r0, #1
	beq	lab1037
lab1038: 	pop	{r3, r4, r5, pc}
lab1037: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab1038
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
	.word	0x20002548
_init_signal_r:
	push	{r3, r4, r5, lr}
	ldr	r4, [r0, #732]	; 0x2dc
	cbz	r4, lab1039
lab1042: 	movs	r0, #0
	pop	{r3, r4, r5, pc}
lab1039: 	movs	r1, #128	; 0x80
	mov	r5, r0
	bl	_malloc_r
	mov	r2, r0
	str	r0, [r5, #732]	; 0x2dc
	cbz	r0, lab1040
	subs	r3, r0, #4
	adds	r2, #124	; 0x7c
lab1041: 	str	r4, [r3, #4]!
	cmp	r3, r2
	bne	lab1041
	b	lab1042
lab1040: 	mov	r0, #4294967295	; 0xffffffff
	pop	{r3, r4, r5, pc}
_signal_r:
	cmp	r1, #31
	push	{r3, r4, r5, r6, r7, lr}
	mov	r5, r0
	bhi	lab1043
	ldr	r6, [r0, #732]	; 0x2dc
	mov	r4, r1
	mov	r7, r2
	cbz	r6, lab1044
lab1047: 	ldr	r0, [r6, r4, lsl #2]
	str	r7, [r6, r4, lsl #2]
	pop	{r3, r4, r5, r6, r7, pc}
lab1043: 	movs	r3, #22
	str	r3, [r0, #0]
	mov	r0, #4294967295	; 0xffffffff
	pop	{r3, r4, r5, r6, r7, pc}
lab1044: 	movs	r1, #128	; 0x80
	bl	_malloc_r
	mov	r6, r0
	str	r0, [r5, #732]	; 0x2dc
	cbz	r0, lab1045
	subs	r3, r0, #4
	add	r5, r0, #124	; 0x7c
	movs	r1, #0
lab1046: 	str	r1, [r3, #4]!
	cmp	r5, r3
	bne	lab1046
	b	lab1047
lab1045: 	mov	r0, #4294967295	; 0xffffffff
	pop	{r3, r4, r5, r6, r7, pc}
_raise_r:
	cmp	r1, #31
	push	{r3, r4, r5, lr}
	mov	r5, r0
	bhi	lab1048
	ldr	r2, [r0, #732]	; 0x2dc
	mov	r4, r1
	cbz	r2, lab1049
	ldr	r3, [r2, r1, lsl #2]
	cbz	r3, lab1049
	cmp	r3, #1
	beq	lab1050
	adds	r1, r3, #1
	beq	lab1051
	movs	r5, #0
	mov	r0, r4
	str	r5, [r2, r4, lsl #2]
	blx	r3
	mov	r0, r5
	pop	{r3, r4, r5, pc}
lab1049: 	mov	r0, r5
	bl	_getpid_r
	mov	r2, r4
	mov	r1, r0
	mov	r0, r5
	ldmia	sp!, {r3, r4, r5, lr}
	b	_kill_r
lab1051: 	movs	r3, #22
	str	r3, [r0, #0]
	movs	r0, #1
	pop	{r3, r4, r5, pc}
lab1050: 	movs	r0, #0
	pop	{r3, r4, r5, pc}
lab1048: 	movs	r3, #22
	str	r3, [r0, #0]
	mov	r0, #4294967295	; 0xffffffff
	pop	{r3, r4, r5, pc}
	nop
__sigtramp_r:
	cmp	r1, #31
	bhi	lab1052
	ldr	r2, [r0, #732]	; 0x2dc
	push	{r3, r4, r5, lr}
	mov	r4, r1
	mov	r5, r0
	cbz	r2, lab1053
lab1059: 	ldr	r3, [r2, r4, lsl #2]
	add	r2, r2, r4, lsl #2
	cbz	r3, lab1054
	adds	r1, r3, #1
	beq	lab1055
	cmp	r3, #1
	beq	lab1056
	movs	r5, #0
	mov	r0, r4
	str	r5, [r2, #0]
	blx	r3
	mov	r0, r5
	pop	{r3, r4, r5, pc}
lab1054: 	movs	r0, #1
	pop	{r3, r4, r5, pc}
lab1053: 	movs	r1, #128	; 0x80
	bl	_malloc_r
	mov	r2, r0
	str	r0, [r5, #732]	; 0x2dc
	cbz	r0, lab1057
	subs	r3, r0, #4
	movs	r1, #0
	adds	r0, #124	; 0x7c
lab1058: 	str	r1, [r3, #4]!
	cmp	r0, r3
	bne	lab1058
	b	lab1059
lab1056: 	movs	r0, #3
	pop	{r3, r4, r5, pc}
lab1055: 	movs	r0, #2
	pop	{r3, r4, r5, pc}
lab1057: 	mov	r0, #4294967295	; 0xffffffff
	pop	{r3, r4, r5, pc}
lab1052: 	mov	r0, #4294967295	; 0xffffffff
	bx	lr
raise:
	push	{r3, r4, r5, lr}
	ldr	r3, [pc, #84]	; (8006e74 <raise+0x58>)
	cmp	r0, #31
	ldr	r5, [r3, #0]
	bhi	lab1060
	ldr	r2, [r5, #732]	; 0x2dc
	mov	r4, r0
	cbz	r2, lab1061
	ldr	r3, [r2, r0, lsl #2]
	cbz	r3, lab1061
	cmp	r3, #1
	beq	lab1062
	adds	r1, r3, #1
	beq	lab1063
	movs	r5, #0
	str	r5, [r2, r0, lsl #2]
	blx	r3
	mov	r0, r5
	pop	{r3, r4, r5, pc}
lab1061: 	mov	r0, r5
	bl	_getpid_r
	mov	r2, r4
	mov	r1, r0
	mov	r0, r5
	ldmia	sp!, {r3, r4, r5, lr}
	b	_kill_r
lab1063: 	movs	r3, #22
	str	r3, [r5, #0]
	movs	r0, #1
	pop	{r3, r4, r5, pc}
lab1062: 	movs	r0, #0
	pop	{r3, r4, r5, pc}
lab1060: 	movs	r3, #22
	str	r3, [r5, #0]
	mov	r0, #4294967295	; 0xffffffff
	pop	{r3, r4, r5, pc}
	nop
	.word	0x20000eb4
signal:
	ldr	r3, [pc, #76]	; (8006ec8 <signal+0x50>)
	cmp	r0, #31
	push	{r4, r5, r6, lr}
	ldr	r6, [r3, #0]
	bhi	lab1064
	mov	r5, r1
	ldr	r1, [r6, #732]	; 0x2dc
	mov	r4, r0
	cbz	r1, lab1065
lab1068: 	ldr	r0, [r1, r4, lsl #2]
	str	r5, [r1, r4, lsl #2]
	pop	{r4, r5, r6, pc}
lab1064: 	movs	r3, #22
	str	r3, [r6, #0]
	mov	r0, #4294967295	; 0xffffffff
	pop	{r4, r5, r6, pc}
lab1065: 	movs	r1, #128	; 0x80
	mov	r0, r6
	bl	_malloc_r
	mov	r1, r0
	str	r0, [r6, #732]	; 0x2dc
	cbz	r0, lab1066
	subs	r3, r0, #4
	add	ip, r0, #124	; 0x7c
	movs	r2, #0
lab1067: 	str	r2, [r3, #4]!
	cmp	r3, ip
	bne	lab1067
	b	lab1068
lab1066: 	mov	r0, #4294967295	; 0xffffffff
	pop	{r4, r5, r6, pc}
	.word	0x20000eb4
_init_signal:
	push	{r3, r4, r5, lr}
	ldr	r3, [pc, #48]	; (8006f00 <_init_signal+0x34>)
	ldr	r5, [r3, #0]
	ldr	r4, [r5, #732]	; 0x2dc
	cbz	r4, lab1069
lab1072: 	movs	r0, #0
	pop	{r3, r4, r5, pc}
lab1069: 	movs	r1, #128	; 0x80
	mov	r0, r5
	bl	_malloc_r
	str	r0, [r5, #732]	; 0x2dc
	cbz	r0, lab1070
	subs	r3, r0, #4
	add	r2, r0, #124	; 0x7c
lab1071: 	str	r4, [r3, #4]!
	cmp	r3, r2
	bne	lab1071
	b	lab1072
lab1070: 	mov	r0, #4294967295	; 0xffffffff
	pop	{r3, r4, r5, pc}
	.word	0x20000eb4
__sigtramp:
	push	{r3, r4, r5, lr}
	ldr	r3, [pc, #96]	; (8006f68 <__sigtramp+0x64>)
	cmp	r0, #31
	ldr	r5, [r3, #0]
	bhi	lab1073
	ldr	r2, [r5, #732]	; 0x2dc
	mov	r4, r0
	cbz	r2, lab1074
lab1079: 	ldr	r3, [r2, r4, lsl #2]
	add	r2, r2, r4, lsl #2
	cbz	r3, lab1075
	adds	r1, r3, #1
	beq	lab1076
	cmp	r3, #1
	beq	lab1077
	movs	r5, #0
	mov	r0, r4
	str	r5, [r2, #0]
	blx	r3
	mov	r0, r5
	pop	{r3, r4, r5, pc}
lab1075: 	movs	r0, #1
	pop	{r3, r4, r5, pc}
lab1074: 	movs	r1, #128	; 0x80
	mov	r0, r5
	bl	_malloc_r
	mov	r2, r0
	str	r0, [r5, #732]	; 0x2dc
	cbz	r0, lab1073
	subs	r3, r0, #4
	movs	r1, #0
	adds	r0, #124	; 0x7c
lab1078: 	str	r1, [r3, #4]!
	cmp	r3, r0
	bne	lab1078
	b	lab1079
lab1077: 	movs	r0, #3
	pop	{r3, r4, r5, pc}
lab1076: 	movs	r0, #2
	pop	{r3, r4, r5, pc}
lab1073: 	mov	r0, #4294967295	; 0xffffffff
	pop	{r3, r4, r5, pc}
	nop
	.word	0x20000eb4
_kill_r:
	push	{r4, r5, r6, lr}
	mov	r4, r1
	ldr	r5, [pc, #32]	; (8006f94 <_kill_r+0x28>)
	mov	r3, r0
	movs	r6, #0
	mov	r0, r4
	mov	r1, r2
	mov	r4, r3
	str	r6, [r5, #0]
	bl	_kill
	adds	r3, r0, #1
	beq	lab1080
lab1081: 	pop	{r4, r5, r6, pc}
lab1080: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab1081
	str	r3, [r4, #0]
	pop	{r4, r5, r6, pc}
	nop
	.word	0x20002548
_getpid_r:
	b	_getpid
__sread:
	push	{r4, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #14]
	bl	_read_r
	cmp	r0, #0
	blt	lab1082
	ldr	r3, [r4, #80]	; 0x50
	add	r3, r0
	str	r3, [r4, #80]	; 0x50
	pop	{r4, pc}
lab1082: 	ldrh	r3, [r4, #12]
	bic	r3, r3, #4096	; 0x1000
	strh	r3, [r4, #12]
	pop	{r4, pc}
	nop
__seofread:
	movs	r0, #0
	bx	lr
__swrite:
	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #12]
	mov	r7, r3
	lsls	r3, r1, #23
	mov	r5, r0
	mov	r6, r2
	bmi	lab1083
lab1084: 	bic	r1, r1, #4096	; 0x1000
	strh	r1, [r4, #12]
	mov	r3, r7
	ldrsh	r1, [r4, #14]
	mov	r2, r6
	mov	r0, r5
	ldmia	sp!, {r4, r5, r6, r7, r8, lr}
	b	_write_r
lab1083: 	ldrsh	r1, [r4, #14]
	movs	r3, #2
	movs	r2, #0
	bl	_lseek_r
	ldrsh	r1, [r4, #12]
	b	lab1084
	nop
__sseek:
	push	{r4, lr}
	mov	r4, r1
	ldrsh	r1, [r1, #14]
	bl	_lseek_r
	ldrh	r3, [r4, #12]
	adds	r2, r0, #1
	itee	eq
	biceq	r3, r3, #4096	; 0x1000
	orrne	r3, r3, #4096	; 0x1000
	strne	r0, [r4, #80]	; 0x50
	strh	r3, [r4, #12]
	pop	{r4, pc}
__sclose:
	ldrsh	r1, [r1, #14]
	b	_close_r
strncpy:
	push	{r4, r5, lr}
	orr	r4, r0, r1
	lsls	r3, r4, #30
	bne	lab1085
	cmp	r2, #3
	bhi	lab1086
lab1085: 	mov	ip, r0
lab1090: 	add	lr, r1, #4294967295	; 0xffffffff
	b	lab1087
lab1089: 	ldrb	r1, [lr, #1]!
	strb	r1, [r3], #1
	subs	r4, r2, #1
	cbz	r1, lab1088
	mov	ip, r3
	mov	r2, r4
lab1087: 	mov	r3, ip
	cmp	r2, #0
	bne	lab1089
lab1092: 	pop	{r4, r5, pc}
lab1086: 	mov	r3, r1
	mov	ip, r0
lab1091: 	mov	r1, r3
	ldr	r5, [r3], #4
	sub	r4, r5, #16843009	; 0x1010101
	bic	r4, r4, r5
	tst	r4, #2155905152	; 0x80808080
	bne	lab1090
	subs	r2, #4
	cmp	r2, #3
	str	r5, [ip], #4
	mov	r1, r3
	bhi	lab1091
	b	lab1090
lab1088: 	add	r2, ip
	cmp	r4, #0
	beq	lab1092
lab1093: 	strb	r1, [r3], #1
	cmp	r3, r2
	bne	lab1093
	pop	{r4, r5, pc}
__swbuf_r:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r5, r1
	mov	r4, r2
	mov	r6, r0
	cbz	r0, lab1094
	ldr	r3, [r0, #56]	; 0x38
	cmp	r3, #0
	beq	lab1095
lab1094: 	ldrsh	r2, [r4, #12]
	ldr	r3, [r4, #24]
	str	r3, [r4, #8]
	lsls	r7, r2, #28
	uxth	r0, r2
	bpl	lab1096
	ldr	r3, [r4, #16]
	cbz	r3, lab1096
	uxtb	r5, r5
	lsls	r1, r0, #18
	mov	r7, r5
	bpl	lab1097
lab1102: 	ldr	r2, [r4, #0]
	ldr	r1, [r4, #20]
	subs	r3, r2, r3
	cmp	r1, r3
	ble	lab1098
lab1103: 	adds	r3, #1
lab1104: 	ldr	r1, [r4, #8]
	subs	r1, #1
	str	r1, [r4, #8]
	adds	r1, r2, #1
	str	r1, [r4, #0]
	strb	r5, [r2, #0]
	ldr	r2, [r4, #20]
	cmp	r2, r3
	beq	lab1099
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #31
	bpl	lab1100
	cmp	r5, #10
	beq	lab1099
lab1100: 	mov	r0, r7
	pop	{r3, r4, r5, r6, r7, pc}
lab1096: 	mov	r1, r4
	mov	r0, r6
	bl	__swsetup_r
	cbnz	r0, lab1101
	ldrsh	r2, [r4, #12]
	ldr	r3, [r4, #16]
	uxth	r0, r2
	uxtb	r5, r5
	lsls	r1, r0, #18
	mov	r7, r5
	bmi	lab1102
lab1097: 	orr	r2, r2, #8192	; 0x2000
	strh	r2, [r4, #12]
	ldr	r2, [r4, #100]	; 0x64
	ldr	r1, [r4, #20]
	bic	r2, r2, #8192	; 0x2000
	str	r2, [r4, #100]	; 0x64
	ldr	r2, [r4, #0]
	subs	r3, r2, r3
	cmp	r1, r3
	bgt	lab1103
lab1098: 	mov	r1, r4
	mov	r0, r6
	bl	_fflush_r
	cbnz	r0, lab1101
	ldr	r2, [r4, #0]
	movs	r3, #1
	b	lab1104
lab1095: 	bl	__sinit
	b	lab1094
lab1099: 	mov	r1, r4
	mov	r0, r6
	bl	_fflush_r
	cmp	r0, #0
	beq	lab1100
lab1101: 	mov	r7, #4294967295	; 0xffffffff
	b	lab1100
__swbuf:
	push	{r4}
	ldr	r4, [pc, #16]	; (8007154 <__swbuf+0x14>)
	mov	r3, r0
	mov	r2, r1
	ldr	r0, [r4, #0]
	pop	{r4}
	mov	r1, r3
	b	__swbuf_r
	nop
	.word	0x20000eb4
_wcrtomb_r:
	push	{r4, r5, r6, lr}
	mov	r5, r0
	sub	sp, #16
	mov	r4, r3
	cbz	r1, lab1105
	ldr	r6, [pc, #44]	; (8007190 <_wcrtomb_r+0x38>)
	ldr	r6, [r6, #224]	; 0xe0
	blx	r6
	adds	r3, r0, #1
	beq	lab1106
lab1107: 	add	sp, #16
	pop	{r4, r5, r6, pc}
lab1105: 	mov	r2, r1
	ldr	r1, [pc, #24]	; (8007190 <_wcrtomb_r+0x38>)
	ldr	r6, [r1, #224]	; 0xe0
	add	r1, sp, #4
	blx	r6
	adds	r3, r0, #1
	bne	lab1107
lab1106: 	movs	r2, #0
	movs	r3, #138	; 0x8a
	str	r2, [r4, #0]
	str	r3, [r5, #0]
	add	sp, #16
	pop	{r4, r5, r6, pc}
	nop
	.word	0x200012e0
wcrtomb:
	push	{r4, r5, r6, lr}
	ldr	r3, [pc, #68]	; (80071dc <wcrtomb+0x48>)
	sub	sp, #16
	ldr	r5, [r3, #0]
	mov	r4, r2
	mov	r3, r1
	mov	r1, r0
	cbz	r0, lab1108
	ldr	r0, [pc, #56]	; (80071e0 <wcrtomb+0x4c>)
	mov	r2, r3
	ldr	r6, [r0, #224]	; 0xe0
	mov	r3, r4
	mov	r0, r5
	blx	r6
	adds	r3, r0, #1
	beq	lab1109
lab1110: 	add	sp, #16
	pop	{r4, r5, r6, pc}
lab1108: 	ldr	r2, [pc, #36]	; (80071e0 <wcrtomb+0x4c>)
	mov	r3, r4
	ldr	r6, [r2, #224]	; 0xe0
	add	r1, sp, #4
	mov	r2, r0
	mov	r0, r5
	blx	r6
	adds	r3, r0, #1
	bne	lab1110
lab1109: 	movs	r2, #0
	movs	r3, #138	; 0x8a
	str	r2, [r4, #0]
	str	r3, [r5, #0]
	add	sp, #16
	pop	{r4, r5, r6, pc}
	nop
	.word	0x20000eb4
	.word	0x200012e0
_wctomb_r:
	push	{r4}
	ldr	r4, [pc, #12]	; (80071f4 <_wctomb_r+0x10>)
	ldr	r4, [r4, #224]	; 0xe0
	mov	ip, r4
	pop	{r4}
	bx	ip
	nop
	.word	0x200012e0
__ascii_wctomb:
	cbz	r1, lab1111
	cmp	r2, #255	; 0xff
	bhi	lab1112
	strb	r2, [r1, #0]
	movs	r0, #1
	bx	lr
lab1112: 	movs	r3, #138	; 0x8a
	str	r3, [r0, #0]
	mov	r0, #4294967295	; 0xffffffff
	bx	lr
lab1111: 	mov	r0, r1
	bx	lr
	nop
_write_r:
	push	{r3, r4, r5, lr}
	mov	r4, r1
	ldr	r5, [pc, #32]	; (800723c <_write_r+0x28>)
	mov	ip, r0
	mov	r1, r2
	mov	r0, r4
	mov	r2, r3
	movs	r3, #0
	str	r3, [r5, #0]
	mov	r4, ip
	bl	_write
	adds	r3, r0, #1
	beq	lab1113
lab1114: 	pop	{r3, r4, r5, pc}
lab1113: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab1114
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
	.word	0x20002548
_close_r:
	push	{r3, r4, r5, lr}
	ldr	r5, [pc, #28]	; (8007260 <_close_r+0x20>)
	movs	r2, #0
	mov	r4, r0
	mov	r0, r1
	str	r2, [r5, #0]
	bl	_close
	adds	r3, r0, #1
	beq	lab1115
lab1116: 	pop	{r3, r4, r5, pc}
lab1115: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab1116
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
	.word	0x20002548
_fclose_r:
	push	{r4, r5, r6, lr}
	cmp	r1, #0
	beq	lab1117
	mov	r6, r0
	mov	r4, r1
	cbz	r0, lab1118
	ldr	r3, [r0, #56]	; 0x38
	cmp	r3, #0
	beq	lab1119
lab1118: 	ldr	r3, [r4, #100]	; 0x64
	lsls	r0, r3, #31
	bpl	lab1120
lab1129: 	ldrsh	r3, [r4, #12]
	cmp	r3, #0
	beq	lab1117
lab1127: 	mov	r1, r4
	mov	r0, r6
	bl	__sflush_r
	ldr	r3, [r4, #44]	; 0x2c
	mov	r5, r0
	cbz	r3, lab1121
	ldr	r1, [r4, #28]
	mov	r0, r6
	blx	r3
	cmp	r0, #0
	it	lt
	movlt	r5, #4294967295	; 0xffffffff
lab1121: 	ldrh	r3, [r4, #12]
	lsls	r2, r3, #24
	bmi	lab1122
lab1130: 	ldr	r1, [r4, #48]	; 0x30
	cbz	r1, lab1123
	add	r3, r4, #64	; 0x40
	cmp	r1, r3
	beq	lab1124
	mov	r0, r6
	bl	_free_r
lab1124: 	movs	r3, #0
	str	r3, [r4, #48]	; 0x30
lab1123: 	ldr	r1, [r4, #68]	; 0x44
	cbz	r1, lab1125
	mov	r0, r6
	bl	_free_r
	movs	r3, #0
	str	r3, [r4, #68]	; 0x44
lab1125: 	bl	__sfp_lock_acquire
	ldr	r3, [r4, #100]	; 0x64
	movs	r2, #0
	lsls	r3, r3, #31
	strh	r2, [r4, #12]
	bpl	lab1126
lab1131: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_close_recursive
	bl	__sfp_lock_release
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab1120: 	ldrh	r3, [r4, #12]
	lsls	r1, r3, #22
	bmi	lab1127
	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_acquire_recursive
	ldrsh	r3, [r4, #12]
	cmp	r3, #0
	bne	lab1127
	ldr	r5, [r4, #100]	; 0x64
	ands	r5, r5, #1
	beq	lab1128
lab1117: 	movs	r5, #0
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab1119: 	bl	__sinit
	ldr	r3, [r4, #100]	; 0x64
	lsls	r0, r3, #31
	bmi	lab1129
	b	lab1120
lab1128: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	mov	r0, r5
	pop	{r4, r5, r6, pc}
lab1122: 	ldr	r1, [r4, #16]
	mov	r0, r6
	bl	_free_r
	b	lab1130
lab1126: 	ldr	r0, [r4, #88]	; 0x58
	bl	__retarget_lock_release_recursive
	b	lab1131
fclose:
	ldr	r3, [pc, #8]	; (800733c <fclose+0xc>)
	mov	r1, r0
	ldr	r0, [r3, #0]
	b	_fclose_r
	nop
	.word	0x20000eb4
_fstat_r:
	push	{r4, r5, r6, lr}
	mov	r4, r1
	ldr	r5, [pc, #32]	; (8007368 <_fstat_r+0x28>)
	mov	r3, r0
	movs	r6, #0
	mov	r0, r4
	mov	r1, r2
	mov	r4, r3
	str	r6, [r5, #0]
	bl	_fstat
	adds	r3, r0, #1
	beq	lab1132
lab1133: 	pop	{r4, r5, r6, pc}
lab1132: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab1133
	str	r3, [r4, #0]
	pop	{r4, r5, r6, pc}
	nop
	.word	0x20002548
_isatty_r:
	push	{r3, r4, r5, lr}
	ldr	r5, [pc, #28]	; (800738c <_isatty_r+0x20>)
	movs	r2, #0
	mov	r4, r0
	mov	r0, r1
	str	r2, [r5, #0]
	bl	_isatty
	adds	r3, r0, #1
	beq	lab1134
lab1135: 	pop	{r3, r4, r5, pc}
lab1134: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab1135
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
	.word	0x20002548
_lseek_r:
	push	{r3, r4, r5, lr}
	mov	r4, r1
	ldr	r5, [pc, #32]	; (80073b8 <_lseek_r+0x28>)
	mov	ip, r0
	mov	r1, r2
	mov	r0, r4
	mov	r2, r3
	movs	r3, #0
	str	r3, [r5, #0]
	mov	r4, ip
	bl	_lseek
	adds	r3, r0, #1
	beq	lab1136
lab1137: 	pop	{r3, r4, r5, pc}
lab1136: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab1137
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
	.word	0x20002548
_read_r:
	push	{r3, r4, r5, lr}
	mov	r4, r1
	ldr	r5, [pc, #32]	; (80073e4 <_read_r+0x28>)
	mov	ip, r0
	mov	r1, r2
	mov	r0, r4
	mov	r2, r3
	movs	r3, #0
	str	r3, [r5, #0]
	mov	r4, ip
	bl	_read
	adds	r3, r0, #1
	beq	lab1138
lab1139: 	pop	{r3, r4, r5, pc}
lab1138: 	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	lab1139
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
	.word	0x20002548
cleanup_glue:
	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r6, [r1, #0]
	mov	r4, r1
	mov	r5, r0
	cbz	r6, lab1140
	ldr	r7, [r6, #0]
	cbz	r7, lab1141
	ldr	r8, [r7]
	cmp	r8, #0
	beq	lab1142
	ldr	r1, [r8]
	cbz	r1, lab1143
	bl	cleanup_glue
lab1143: 	mov	r1, r8
	mov	r0, r5
	bl	_free_r
lab1142: 	mov	r1, r7
	mov	r0, r5
	bl	_free_r
lab1141: 	mov	r1, r6
	mov	r0, r5
	bl	_free_r
lab1140: 	mov	r1, r4
	mov	r0, r5
	ldmia	sp!, {r4, r5, r6, r7, r8, lr}
	b	_free_r
_reclaim_reent:
	ldr	r3, [pc, #136]	; (80074bc <_reclaim_reent+0x8c>)
	ldr	r3, [r3, #0]
	cmp	r3, r0
	beq	lab1144
	ldr	r1, [r0, #76]	; 0x4c
	push	{r4, r5, r6, lr}
	mov	r5, r0
	cbz	r1, lab1145
	movs	r6, #0
lab1148: 	ldr	r4, [r1, r6]
	cbz	r4, lab1146
lab1147: 	mov	r1, r4
	ldr	r4, [r4, #0]
	mov	r0, r5
	bl	_free_r
	cmp	r4, #0
	bne	lab1147
	ldr	r1, [r5, #76]	; 0x4c
lab1146: 	adds	r6, #4
	cmp	r6, #128	; 0x80
	bne	lab1148
	mov	r0, r5
	bl	_free_r
lab1145: 	ldr	r1, [r5, #64]	; 0x40
	cbz	r1, lab1149
	mov	r0, r5
	bl	_free_r
lab1149: 	ldr	r4, [r5, #328]	; 0x148
	cbz	r4, lab1150
	add	r6, r5, #332	; 0x14c
	cmp	r4, r6
	beq	lab1150
lab1151: 	mov	r1, r4
	ldr	r4, [r4, #0]
	mov	r0, r5
	bl	_free_r
	cmp	r6, r4
	bne	lab1151
lab1150: 	ldr	r1, [r5, #84]	; 0x54
	cbz	r1, lab1152
	mov	r0, r5
	bl	_free_r
lab1152: 	ldr	r3, [r5, #56]	; 0x38
	cbz	r3, lab1153
	ldr	r3, [r5, #60]	; 0x3c
	mov	r0, r5
	blx	r3
	ldr	r4, [r5, #736]	; 0x2e0
	cbz	r4, lab1153
	ldr	r1, [r4, #0]
	cbz	r1, lab1154
	mov	r0, r5
	bl	cleanup_glue
lab1154: 	mov	r1, r4
	mov	r0, r5
	ldmia	sp!, {r4, r5, r6, lr}
	b	_free_r
lab1153: 	pop	{r4, r5, r6, pc}
lab1144: 	bx	lr
	.word	0x20000eb4
_close:
	ldr	r3, [pc, #8]	; (80074cc <_close+0xc>)
	movs	r2, #88	; 0x58
	str	r2, [r3, #0]
	mov	r0, #4294967295	; 0xffffffff
	bx	lr
	.word	0x20002548
_fstat:
	ldr	r3, [pc, #8]	; (80074dc <_fstat+0xc>)
	movs	r2, #88	; 0x58
	str	r2, [r3, #0]
	mov	r0, #4294967295	; 0xffffffff
	bx	lr
	.word	0x20002548
_getpid:
	ldr	r3, [pc, #8]	; (80074ec <_getpid+0xc>)
	movs	r2, #88	; 0x58
	str	r2, [r3, #0]
	mov	r0, #4294967295	; 0xffffffff
	bx	lr
	.word	0x20002548
_isatty:
	ldr	r3, [pc, #8]	; (80074fc <_isatty+0xc>)
	movs	r2, #88	; 0x58
	str	r2, [r3, #0]
	movs	r0, #0
	bx	lr
	nop
	.word	0x20002548
_kill:
	ldr	r3, [pc, #8]	; (800750c <_kill+0xc>)
	movs	r2, #88	; 0x58
	str	r2, [r3, #0]
	mov	r0, #4294967295	; 0xffffffff
	bx	lr
	.word	0x20002548
_lseek:
	ldr	r3, [pc, #8]	; (800751c <_lseek+0xc>)
	movs	r2, #88	; 0x58
	str	r2, [r3, #0]
	mov	r0, #4294967295	; 0xffffffff
	bx	lr
	.word	0x20002548
_read:
	ldr	r3, [pc, #8]	; (800752c <_read+0xc>)
	movs	r2, #88	; 0x58
	str	r2, [r3, #0]
	mov	r0, #4294967295	; 0xffffffff
	bx	lr
	.word	0x20002548
_sbrk:
	ldr	r2, [pc, #16]	; (8007544 <_sbrk+0x14>)
	ldr	r1, [pc, #20]	; (8007548 <_sbrk+0x18>)
	ldr	r3, [r2, #0]
	cmp	r3, #0
	it	eq
	moveq	r3, r1
	add	r0, r3
	str	r0, [r2, #0]
	mov	r0, r3
	bx	lr
	.word	0x2000254c
	.word	0x20002550
_write:
	ldr	r3, [pc, #8]	; (8007558 <_write+0xc>)
	movs	r2, #88	; 0x58
	str	r2, [r3, #0]
	mov	r0, #4294967295	; 0xffffffff
	bx	lr
	.word	0x20002548
_exit:
	b	_exit
	nop
