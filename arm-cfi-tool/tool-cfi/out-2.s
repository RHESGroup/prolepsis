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
	ldr	r3, [pc, #16]	; (802c <exit+0x1c>)
	ldr	r0, [r3, #0]
	ldr	r3, [r0, #60]	; 0x3c
	cbz	r3, lab0
	blx	r3
lab0: 	mov	r0, r4
	bl	_exit
	nop
	.word	0x00008d3c
register_fini:
	ldr	r3, [pc, #8]	; (803c <register_fini+0xc>)
	cbz	r3, lab1
	ldr	r0, [pc, #8]	; (8040 <register_fini+0x10>)
	b	atexit
lab1: 	bx	lr
	.word	0x00000000
	.word	0x00008c6d
__do_global_dtors_aux:
	push	{r4, lr}
	ldr	r4, [pc, #20]	; (805c <__do_global_dtors_aux+0x18>)
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, [pc, #16]	; (8060 <__do_global_dtors_aux+0x1c>)
	cbz	r3, lab3
	ldr	r0, [pc, #16]	; (8064 <__do_global_dtors_aux+0x20>)
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2: 	pop	{r4, pc}
	.word	0x00019188
	.word	0x00000000
	.word	0x00008d48
frame_dummy:
	push	{r3, lr}
	ldr	r3, [pc, #12]	; (8078 <frame_dummy+0x10>)
	cbz	r3, lab4
	ldr	r1, [pc, #12]	; (807c <frame_dummy+0x14>)
	ldr	r0, [pc, #12]	; (8080 <frame_dummy+0x18>)
	nop
lab4: 	pop	{r3, pc}
	.word	0x00000000
	.word	0x0001918c
	.word	0x00008d48
_stack_init:
	sub	sl, r3, #65536	; 0x10000
	bx	lr
	nop
_mainCRTStartup:
	ldr	r3, [pc, #92]	; (80ec <_mainCRTStartup+0x60>)
	cmp	r3, #0
	it	eq
	ldreq	r3, [pc, #76]	; (80e0 <_mainCRTStartup+0x54>)
	mov	sp, r3
	bl	_stack_init
	movs	r1, #0
	mov	fp, r1
	mov	r7, r1
	ldr	r0, [pc, #76]	; (80f0 <_mainCRTStartup+0x64>)
	ldr	r2, [pc, #80]	; (80f4 <_mainCRTStartup+0x68>)
	subs	r2, r2, r0
	bl	memset
	ldr	r3, [pc, #56]	; (80e4 <_mainCRTStartup+0x58>)
	cmp	r3, #0
	beq	lab5
	blx	r3
lab5: 	ldr	r3, [pc, #52]	; (80e8 <_mainCRTStartup+0x5c>)
	cmp	r3, #0
	beq	lab6
	blx	r3
lab6: 	movs	r0, #0
	movs	r1, #0
	movs	r4, r0
	movs	r5, r1
	ldr	r0, [pc, #52]	; (80f8 <_mainCRTStartup+0x6c>)
	cmp	r0, #0
	beq	lab7
	ldr	r0, [pc, #48]	; (80fc <_mainCRTStartup+0x70>)
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
	.word	0x00019184
	.word	0x000191c4
	.word	0x00008c61
	.word	0x00008c6d
mulul64:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp}
	sub	sp, #172	; 0xac
	add	r7, sp, #0
	strd	r0, r1, [r7, #88]	; 0x58
	strd	r2, r3, [r7, #80]	; 0x50
	ldrd	r2, r3, [r7, #88]	; 0x58
	mov	r0, #0
	mov	r1, #0
	movs	r0, r3
	movs	r1, #0
	strd	r0, r1, [r7, #160]	; 0xa0
	ldrd	r2, r3, [r7, #88]	; 0x58
	mov	sl, r2
	mov	fp, #0
	strd	sl, fp, [r7, #152]	; 0x98
	ldrd	r2, r3, [r7, #80]	; 0x50
	mov	r0, #0
	mov	r1, #0
	movs	r0, r3
	movs	r1, #0
	strd	r0, r1, [r7, #144]	; 0x90
	ldrd	r2, r3, [r7, #80]	; 0x50
	str	r2, [r7, #32]
	mov	ip, #0
	str	ip, [r7, #36]	; 0x24
	ldrd	r2, r3, [r7, #32]
	strd	r2, r3, [r7, #136]	; 0x88
	ldr	r2, [r7, #156]	; 0x9c
	ldr	r3, [r7, #136]	; 0x88
	mul	r1, r3, r2
	ldr	r2, [r7, #140]	; 0x8c
	ldr	r3, [r7, #152]	; 0x98
	mul	r3, r2, r3
	add	r1, r3
	ldr	r2, [r7, #152]	; 0x98
	ldr	r3, [r7, #136]	; 0x88
	umull	r4, r5, r2, r3
	adds	r3, r1, r5
	mov	r5, r3
	strd	r4, r5, [r7, #128]	; 0x80
	strd	r4, r5, [r7, #128]	; 0x80
	ldrd	r2, r3, [r7, #128]	; 0x80
	str	r2, [r7, #24]
	str	ip, [r7, #28]
	ldrd	r3, r4, [r7, #24]
	strd	r3, r4, [r7, #120]	; 0x78
	ldrd	r2, r3, [r7, #128]	; 0x80
	mov	r0, #0
	mov	r1, #0
	movs	r0, r3
	movs	r1, #0
	strd	r0, r1, [r7, #112]	; 0x70
	ldr	r2, [r7, #164]	; 0xa4
	ldr	r3, [r7, #136]	; 0x88
	mul	r1, r3, r2
	ldr	r2, [r7, #140]	; 0x8c
	ldr	r3, [r7, #160]	; 0xa0
	mul	r3, r2, r3
	add	r1, r3
	ldr	r2, [r7, #160]	; 0xa0
	ldr	r3, [r7, #136]	; 0x88
	umull	r3, r2, r2, r3
	str	r2, [r7, #76]	; 0x4c
	str	r3, [r7, #72]	; 0x48
	ldr	r3, [r7, #76]	; 0x4c
	adds	r3, r1, r3
	str	r3, [r7, #76]	; 0x4c
	ldrd	r2, r3, [r7, #112]	; 0x70
	ldrd	r4, r5, [r7, #72]	; 0x48
	mov	r1, r4
	adds	r1, r2, r1
	str	r1, [r7, #16]
	mov	r1, r5
	adc	r1, r3, r1
	str	r1, [r7, #20]
	ldrd	r3, r4, [r7, #16]
	strd	r3, r4, [r7, #128]	; 0x80
	ldrd	r2, r3, [r7, #128]	; 0x80
	str	r2, [r7, #8]
	str	ip, [r7, #12]
	ldrd	r3, r4, [r7, #8]
	strd	r3, r4, [r7, #104]	; 0x68
	ldrd	r2, r3, [r7, #128]	; 0x80
	mov	r0, #0
	mov	r1, #0
	movs	r0, r3
	movs	r1, #0
	strd	r0, r1, [r7, #96]	; 0x60
	ldr	r3, [r7, #156]	; 0x9c
	ldr	r2, [r7, #144]	; 0x90
	mul	r1, r2, r3
	ldr	r2, [r7, #148]	; 0x94
	ldr	r3, [r7, #152]	; 0x98
	mul	r3, r2, r3
	adds	r2, r1, r3
	ldr	r1, [r7, #152]	; 0x98
	ldr	r3, [r7, #144]	; 0x90
	umull	r3, r1, r1, r3
	str	r1, [r7, #68]	; 0x44
	str	r3, [r7, #64]	; 0x40
	ldr	r3, [r7, #68]	; 0x44
	adds	r3, r2, r3
	str	r3, [r7, #68]	; 0x44
	ldrd	r2, r3, [r7, #104]	; 0x68
	ldrd	r4, r5, [r7, #64]	; 0x40
	mov	r1, r4
	adds	r1, r2, r1
	str	r1, [r7, #0]
	mov	r1, r5
	adc	r1, r3, r1
	str	r1, [r7, #4]
	ldrd	r3, r4, [r7]
	strd	r3, r4, [r7, #128]	; 0x80
	ldrd	r0, r1, [r7, #128]	; 0x80
	mov	r2, #0
	mov	r3, #0
	movs	r2, r1
	movs	r3, #0
	strd	r2, r3, [r7, #112]	; 0x70
	ldrd	r0, r1, [r7, #128]	; 0x80
	mov	r2, #0
	mov	r3, #0
	movs	r3, r0
	movs	r2, #0
	ldrd	r0, r1, [r7, #120]	; 0x78
	adds	r4, r2, r0
	str	r4, [r7, #56]	; 0x38
	adcs	r3, r1
	str	r3, [r7, #60]	; 0x3c
	ldr	r3, [r7, #204]	; 0xcc
	ldrd	r1, r2, [r7, #56]	; 0x38
	strd	r1, r2, [r3]
	ldr	r3, [r7, #164]	; 0xa4
	ldr	r2, [r7, #144]	; 0x90
	mul	r2, r3, r2
	ldr	r3, [r7, #148]	; 0x94
	ldr	r1, [r7, #160]	; 0xa0
	mul	r3, r1, r3
	add	r3, r2
	ldr	r1, [r7, #160]	; 0xa0
	ldr	r2, [r7, #144]	; 0x90
	umull	r8, r9, r1, r2
	add	r3, r9
	mov	r9, r3
	ldrd	r2, r3, [r7, #96]	; 0x60
	adds	r1, r8, r2
	str	r1, [r7, #48]	; 0x30
	adc	r3, r9, r3
	str	r3, [r7, #52]	; 0x34
	ldrd	r2, r3, [r7, #112]	; 0x70
	ldrd	r4, r5, [r7, #48]	; 0x30
	mov	r1, r4
	adds	r1, r1, r2
	str	r1, [r7, #40]	; 0x28
	mov	r1, r5
	adc	r1, r3, r1
	str	r1, [r7, #44]	; 0x2c
	ldr	r3, [r7, #200]	; 0xc8
	ldrd	r1, r2, [r7, #40]	; 0x28
	strd	r1, r2, [r3]
	nop
	adds	r7, #172	; 0xac
	mov	sp, r7
	ldmia	sp!, {r4, r5, r7, r8, r9, sl, fp}
	bx	lr
modul64:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp}
	sub	sp, #76	; 0x4c
	add	r7, sp, #0
	strd	r0, r1, [r7, #48]	; 0x30
	strd	r2, r3, [r7, #40]	; 0x28
	mov	r2, #1
	mov	r3, #0
	strd	r2, r3, [r7, #64]	; 0x40
	b	lab8
lab10: 	mov	r0, #0
	mov	r1, #0
	asrs	r0, r3, #31
	asrs	r1, r3, #31
	strd	r0, r1, [r7, #56]	; 0x38
	ldrd	r2, r3, [r7, #48]	; 0x30
	adds	r1, r2, r2
	str	r1, [r7, #32]
	adcs	r3, r3
	str	r3, [r7, #36]	; 0x24
	ldrd	r4, r5, [r7, #32]
	ldrd	r2, r3, [r7, #40]	; 0x28
	mov	r0, #0
	mov	r1, #0
	lsrs	r0, r3, #31
	movs	r1, #0
	orr	sl, r4, r0
	orr	fp, r5, r1
	strd	sl, fp, [r7, #48]	; 0x30
	ldrd	r2, r3, [r7, #40]	; 0x28
	adds	r1, r2, r2
	str	r1, [r7, #24]
	adcs	r3, r3
	str	r3, [r7, #28]
	ldrd	r3, r4, [r7, #24]
	strd	r3, r4, [r7, #40]	; 0x28
	ldrd	r0, r1, [r7, #56]	; 0x38
	ldrd	r2, r3, [r7, #48]	; 0x30
	orr	r8, r0, r2
	orr	r9, r1, r3
	ldrd	r2, r3, [r7, #104]	; 0x68
	cmp	r8, r2
	sbcs	r3, r9, r3
	bcc	lab9
	ldrd	r0, r1, [r7, #48]	; 0x30
	ldrd	r2, r3, [r7, #104]	; 0x68
	subs	r4, r0, r2
	str	r4, [r7, #16]
	sbc	r3, r1, r3
	str	r3, [r7, #20]
	ldrd	r3, r4, [r7, #16]
	strd	r3, r4, [r7, #48]	; 0x30
	ldrd	r2, r3, [r7, #40]	; 0x28
	adds	r1, r2, #1
	str	r1, [r7, #8]
	adc	r3, r3, #0
	str	r3, [r7, #12]
	ldrd	r3, r4, [r7, #8]
	strd	r3, r4, [r7, #40]	; 0x28
lab9: 	ldrd	r2, r3, [r7, #64]	; 0x40
	adds	r1, r2, #1
	str	r1, [r7, #0]
	adc	r3, r3, #0
	str	r3, [r7, #4]
	ldrd	r3, r4, [r7]
	strd	r3, r4, [r7, #64]	; 0x40
lab8: 	ldrd	r2, r3, [r7, #64]	; 0x40
	cmp	r2, #65	; 0x41
	sbcs	r3, r3, #0
	blt	lab10
	ldrd	r2, r3, [r7, #48]	; 0x30
	mov	r0, r2
	mov	r1, r3
	adds	r7, #76	; 0x4c
	mov	sp, r7
	ldmia	sp!, {r4, r5, r7, r8, r9, sl, fp}
	bx	lr
montmul:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp, lr}
	sub	sp, #144	; 0x90
	add	r7, sp, #8
	strd	r0, r1, [r7, #64]	; 0x40
	strd	r2, r3, [r7, #56]	; 0x38
	add	r3, r7, #88	; 0x58
	str	r3, [sp, #4]
	add	r3, r7, #96	; 0x60
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #56]	; 0x38
	ldrd	r0, r1, [r7, #64]	; 0x40
	bl	mulul64
	ldrd	r2, r3, [r7, #88]	; 0x58
	ldr	r1, [r7, #180]	; 0xb4
	mul	r0, r2, r1
	ldr	r1, [r7, #176]	; 0xb0
	mul	r1, r3, r1
	add	r0, r1
	ldr	r1, [r7, #176]	; 0xb0
	umull	r4, r5, r1, r2
	adds	r3, r0, r5
	mov	r5, r3
	strd	r4, r5, [r7, #120]	; 0x78
	strd	r4, r5, [r7, #120]	; 0x78
	add	r3, r7, #72	; 0x48
	str	r3, [sp, #4]
	add	r3, r7, #80	; 0x50
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #168]	; 0xa8
	ldrd	r0, r1, [r7, #120]	; 0x78
	bl	mulul64
	ldrd	r0, r1, [r7, #88]	; 0x58
	ldrd	r2, r3, [r7, #72]	; 0x48
	adds	r4, r0, r2
	str	r4, [r7, #32]
	adc	r3, r1, r3
	str	r3, [r7, #36]	; 0x24
	ldrd	r3, r4, [r7, #32]
	strd	r3, r4, [r7, #112]	; 0x70
	ldrd	r0, r1, [r7, #96]	; 0x60
	ldrd	r2, r3, [r7, #80]	; 0x50
	adds	r4, r0, r2
	str	r4, [r7, #24]
	adc	r3, r1, r3
	str	r3, [r7, #28]
	ldrd	r3, r4, [r7, #24]
	strd	r3, r4, [r7, #128]	; 0x80
	ldrd	r0, r1, [r7, #88]	; 0x58
	ldrd	r2, r3, [r7, #112]	; 0x70
	cmp	r2, r0
	sbcs	r3, r1
	bcs	lab11
	ldrd	r2, r3, [r7, #128]	; 0x80
	adds	r1, r2, #1
	str	r1, [r7, #16]
	adc	r3, r3, #0
	str	r3, [r7, #20]
	ldrd	r3, r4, [r7, #16]
	strd	r3, r4, [r7, #128]	; 0x80
lab11: 	ldrd	r0, r1, [r7, #96]	; 0x60
	ldrd	r2, r3, [r7, #128]	; 0x80
	cmp	r2, r0
	sbcs	r3, r1
	ite	cc
	movcc	r3, #1
	movcs	r3, #0
	uxtb	r3, r3
	mov	r5, r3
	ldrd	r0, r1, [r7, #96]	; 0x60
	ldrd	r2, r3, [r7, #128]	; 0x80
	cmp	r3, r1
	it	eq
	cmpeq	r2, r0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r4, r3
	ldrd	r0, r1, [r7, #88]	; 0x58
	ldrd	r2, r3, [r7, #112]	; 0x70
	cmp	r2, r0
	sbcs	r3, r1
	ite	cc
	movcc	r3, #1
	movcs	r3, #0
	uxtb	r3, r3
	ands	r3, r4
	uxtb	r3, r3
	orrs	r3, r5
	asrs	r2, r3, #31
	str	r3, [r7, #8]
	str	r2, [r7, #12]
	ldrd	r3, r4, [r7, #8]
	strd	r3, r4, [r7, #104]	; 0x68
	ldrd	r2, r3, [r7, #128]	; 0x80
	strd	r2, r3, [r7, #112]	; 0x70
	mov	r2, #0
	mov	r3, #0
	strd	r2, r3, [r7, #128]	; 0x80
	ldrd	r0, r1, [r7, #112]	; 0x70
	ldrd	r2, r3, [r7, #168]	; 0xa8
	cmp	r0, r2
	sbcs	r3, r1, r3
	ite	cs
	movcs	r3, #1
	movcc	r3, #0
	uxtb	r3, r3
	uxtb	r3, r3
	movs	r2, #0
	str	r3, [r7, #48]	; 0x30
	str	r2, [r7, #52]	; 0x34
	ldrd	r2, r3, [r7, #104]	; 0x68
	ldrd	r0, r1, [r7, #48]	; 0x30
	mov	r4, r0
	orrs	r4, r2
	str	r4, [r7, #40]	; 0x28
	orrs	r1, r3
	str	r1, [r7, #44]	; 0x2c
	movs	r3, #0
	ldrd	r1, r2, [r7, #40]	; 0x28
	mov	r0, r1
	rsbs	sl, r0, #0
	sbc	fp, r3, r2
	ldrd	r2, r3, [r7, #168]	; 0xa8
	and	r8, sl, r2
	and	r9, fp, r3
	ldrd	r2, r3, [r7, #112]	; 0x70
	subs	r1, r2, r8
	str	r1, [r7, #0]
	sbc	r3, r3, r9
	str	r3, [r7, #4]
	ldrd	r3, r4, [r7]
	strd	r3, r4, [r7, #112]	; 0x70
	ldrd	r2, r3, [r7, #112]	; 0x70
	mov	r0, r2
	mov	r1, r3
	adds	r7, #136	; 0x88
	mov	sp, r7
	ldmia	sp!, {r4, r5, r7, r8, r9, sl, fp, pc}
xbinGCD:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp}
	sub	sp, #76	; 0x4c
	add	r7, sp, #0
	strd	r0, r1, [r7, #32]
	strd	r2, r3, [r7, #24]
	mov	r2, #1
	mov	r3, #0
	strd	r2, r3, [r7, #64]	; 0x40
	mov	r2, #0
	mov	r3, #0
	strd	r2, r3, [r7, #56]	; 0x38
	ldrd	r2, r3, [r7, #32]
	strd	r2, r3, [r7, #48]	; 0x30
	ldrd	r2, r3, [r7, #24]
	strd	r2, r3, [r7, #40]	; 0x28
	b	lab12
lab14: 	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsrs	r3, r1, #1
	strd	r2, r3, [r7, #32]
	ldrd	r2, r3, [r7, #64]	; 0x40
	and	r3, r2, #1
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #20]
	ldrd	r3, r4, [r7, #16]
	mov	r2, r3
	mov	r3, r4
	orrs	r3, r2
	bne	lab13
	ldrd	r0, r1, [r7, #64]	; 0x40
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsrs	r3, r1, #1
	strd	r2, r3, [r7, #64]	; 0x40
	ldrd	r0, r1, [r7, #56]	; 0x38
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsrs	r3, r1, #1
	strd	r2, r3, [r7, #56]	; 0x38
	b	lab12
lab13: 	ldrd	r0, r1, [r7, #64]	; 0x40
	ldrd	r2, r3, [r7, #40]	; 0x28
	eor	r8, r0, r2
	eor	r9, r1, r3
	mov	r2, #0
	mov	r3, #0
	mov	r2, r8, lsr #1
	orr	r2, r2, r9, lsl #31
	mov	r3, r9, lsr #1
	ldrd	r4, r5, [r7, #64]	; 0x40
	ldrd	r0, r1, [r7, #40]	; 0x28
	and	sl, r4, r0
	and	fp, r5, r1
	adds	r1, r2, sl
	str	r1, [r7, #8]
	adc	r3, r3, fp
	str	r3, [r7, #12]
	ldrd	r3, r4, [r7, #8]
	strd	r3, r4, [r7, #64]	; 0x40
	ldrd	r0, r1, [r7, #56]	; 0x38
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsrs	r3, r1, #1
	ldrd	r0, r1, [r7, #48]	; 0x30
	adds	r4, r0, r2
	str	r4, [r7, #0]
	adc	r3, r1, r3
	str	r3, [r7, #4]
	ldrd	r3, r4, [r7]
	strd	r3, r4, [r7, #56]	; 0x38
lab12: 	ldrd	r2, r3, [r7, #32]
	orrs	r3, r2
	bne	lab14
	ldr	r1, [r7, #104]	; 0x68
	ldrd	r2, r3, [r7, #64]	; 0x40
	strd	r2, r3, [r1]
	ldr	r1, [r7, #108]	; 0x6c
	ldrd	r2, r3, [r7, #56]	; 0x38
	strd	r2, r3, [r1]
	nop
	adds	r7, #76	; 0x4c
	mov	sp, r7
	ldmia	sp!, {r4, r5, r7, r8, r9, sl, fp}
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
	movw	r0, #423	; 0x1a7
	bl	benchmark_body
	mov	r3, r0
	mov	r0, r3
	pop	{r7, pc}
benchmark_body:
	stmdb	sp!, {r4, r5, r7, r8, r9, sl, fp, lr}
	sub	sp, #160	; 0xa0
	add	r7, sp, #16
	str	r0, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #140]	; 0x8c
	b	lab15
lab18: 	str	r3, [r7, #136]	; 0x88
	ldr	r3, [pc, #592]	; (8978 <benchmark_body+0x26c>)
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r7, #128]	; 0x80
	ldr	r3, [pc, #588]	; (897c <benchmark_body+0x270>)
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r7, #120]	; 0x78
	ldr	r3, [pc, #580]	; (8980 <benchmark_body+0x274>)
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r7, #112]	; 0x70
	add	r3, r7, #56	; 0x38
	str	r3, [sp, #4]
	add	r3, r7, #64	; 0x40
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #120]	; 0x78
	ldrd	r0, r1, [r7, #112]	; 0x70
	bl	mulul64
	ldrd	r0, r1, [r7, #64]	; 0x40
	ldrd	r4, r5, [r7, #56]	; 0x38
	ldrd	r2, r3, [r7, #128]	; 0x80
	strd	r2, r3, [sp]
	mov	r2, r4
	mov	r3, r5
	bl	modul64
	strd	r0, r1, [r7, #104]	; 0x68
	add	r3, r7, #56	; 0x38
	str	r3, [sp, #4]
	add	r3, r7, #64	; 0x40
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #104]	; 0x68
	ldrd	r0, r1, [r7, #104]	; 0x68
	bl	mulul64
	ldrd	r0, r1, [r7, #64]	; 0x40
	ldrd	r4, r5, [r7, #56]	; 0x38
	ldrd	r2, r3, [r7, #128]	; 0x80
	strd	r2, r3, [sp]
	mov	r2, r4
	mov	r3, r5
	bl	modul64
	strd	r0, r1, [r7, #104]	; 0x68
	add	r3, r7, #56	; 0x38
	str	r3, [sp, #4]
	add	r3, r7, #64	; 0x40
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #104]	; 0x68
	ldrd	r0, r1, [r7, #104]	; 0x68
	bl	mulul64
	ldrd	r0, r1, [r7, #64]	; 0x40
	ldrd	r4, r5, [r7, #56]	; 0x38
	ldrd	r2, r3, [r7, #128]	; 0x80
	strd	r2, r3, [sp]
	mov	r2, r4
	mov	r3, r5
	bl	modul64
	strd	r0, r1, [r7, #104]	; 0x68
	mov	r2, #0
	mov	r3, #2147483648	; 0x80000000
	strd	r2, r3, [r7, #96]	; 0x60
	add	r3, r7, #24
	str	r3, [sp, #4]
	add	r3, r7, #32
	str	r3, [sp, #0]
	ldrd	r2, r3, [r7, #128]	; 0x80
	ldrd	r0, r1, [r7, #96]	; 0x60
	bl	xbinGCD
	ldrd	r2, r3, [r7, #32]
	ldr	r1, [r7, #96]	; 0x60
	mul	r0, r3, r1
	ldr	r1, [r7, #100]	; 0x64
	mul	r1, r2, r1
	add	r1, r0
	ldr	r0, [r7, #96]	; 0x60
	umull	r8, r9, r0, r2
	add	r3, r1, r9
	mov	r9, r3
	adds	r3, r8, r8
	str	r3, [r7, #0]
	adc	r3, r9, r9
	str	r3, [r7, #4]
	ldrd	r0, r1, [r7]
	ldrd	r2, r3, [r7, #24]
	ldr	r4, [r7, #128]	; 0x80
	mul	r5, r3, r4
	ldr	r4, [r7, #132]	; 0x84
	mul	r4, r2, r4
	add	r4, r5
	ldr	r5, [r7, #128]	; 0x80
	umull	sl, fp, r5, r2
	add	r3, r4, fp
	mov	fp, r3
	subs	r3, r0, sl
	str	r3, [r7, #8]
	sbc	r3, r1, fp
	str	r3, [r7, #12]
	ldrd	r1, r2, [r7, #8]
	mov	r3, r1
	subs	r3, #1
	orrs	r3, r2
	beq	lab16
	movs	r3, #1
	str	r3, [r7, #136]	; 0x88
lab16: 	ldrd	r2, r3, [r7, #128]	; 0x80
	strd	r2, r3, [sp]
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, r1, [r7, #112]	; 0x70
	bl	modul64
	strd	r0, r1, [r7, #88]	; 0x58
	ldrd	r2, r3, [r7, #128]	; 0x80
	strd	r2, r3, [sp]
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, r1, [r7, #120]	; 0x78
	bl	modul64
	strd	r0, r1, [r7, #80]	; 0x50
	ldrd	r2, r3, [r7, #24]
	strd	r2, r3, [sp, #8]
	ldrd	r2, r3, [r7, #128]	; 0x80
	strd	r2, r3, [sp]
	ldrd	r2, r3, [r7, #80]	; 0x50
	ldrd	r0, r1, [r7, #88]	; 0x58
	bl	montmul
	strd	r0, r1, [r7, #72]	; 0x48
	ldrd	r2, r3, [r7, #24]
	strd	r2, r3, [sp, #8]
	ldrd	r2, r3, [r7, #128]	; 0x80
	strd	r2, r3, [sp]
	ldrd	r2, r3, [r7, #72]	; 0x48
	ldrd	r0, r1, [r7, #72]	; 0x48
	bl	montmul
	strd	r0, r1, [r7, #72]	; 0x48
	ldrd	r2, r3, [r7, #24]
	strd	r2, r3, [sp, #8]
	ldrd	r2, r3, [r7, #128]	; 0x80
	strd	r2, r3, [sp]
	ldrd	r2, r3, [r7, #72]	; 0x48
	ldrd	r0, r1, [r7, #72]	; 0x48
	bl	montmul
	strd	r0, r1, [r7, #72]	; 0x48
	ldrd	r2, r3, [r7, #32]
	add	r1, r7, #40	; 0x28
	str	r1, [sp, #4]
	add	r1, r7, #48	; 0x30
	str	r1, [sp, #0]
	ldrd	r0, r1, [r7, #72]	; 0x48
	bl	mulul64
	ldrd	r0, r1, [r7, #48]	; 0x30
	ldrd	r4, r5, [r7, #40]	; 0x28
	ldrd	r2, r3, [r7, #128]	; 0x80
	strd	r2, r3, [sp]
	mov	r2, r4
	mov	r3, r5
	bl	modul64
	strd	r0, r1, [r7, #72]	; 0x48
	ldrd	r0, r1, [r7, #72]	; 0x48
	ldrd	r2, r3, [r7, #104]	; 0x68
	cmp	r1, r3
	it	eq
	cmpeq	r0, r2
	beq	lab17
	movs	r3, #1
	str	r3, [r7, #136]	; 0x88
lab17: 	ldr	r3, [r7, #140]	; 0x8c
	adds	r3, #1
	str	r3, [r7, #140]	; 0x8c
lab15: 	ldr	r2, [r7, #140]	; 0x8c
	ldr	r3, [r7, #20]
	cmp	r2, r3
	blt	lab18
	ldr	r3, [r7, #136]	; 0x88
	mov	r0, r3
	adds	r7, #144	; 0x90
	mov	sp, r7
	ldmia	sp!, {r4, r5, r7, r8, r9, sl, fp, pc}
	.word	0x000191b8
	.word	0x000191b0
	.word	0x000191a8
	.word	0x00000000
initialise_benchmark:
	push	{r7}
	add	r7, sp, #0
	ldr	r1, [pc, #64]	; (89d0 <initialise_benchmark+0x48>)
	add	r3, pc, #40	; (adr r3, 89b8 <initialise_benchmark+0x30>)
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r1]
	ldr	r1, [pc, #56]	; (89d4 <initialise_benchmark+0x4c>)
	add	r3, pc, #36	; (adr r3, 89c0 <initialise_benchmark+0x38>)
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r1]
	ldr	r1, [pc, #48]	; (89d8 <initialise_benchmark+0x50>)
	add	r3, pc, #32	; (adr r3, 89c8 <initialise_benchmark+0x40>)
	ldrd	r2, r3, [r3]
	strd	r2, r3, [r1]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	.word	0x3928f89f
	.word	0xfae84927
	.word	0xb9330573
	.word	0x14736def
	.word	0x87237fef
	.word	0x05493721
	.word	0x000191b8
	.word	0x000191b0
	.word	0x000191a8
verify_benchmark:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	movs	r0, r0
initialise_board:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #24]	; (8a1c <initialise_board+0x20>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #20]	; (8a1c <initialise_board+0x20>)
	orr	r3, r3, #16777216	; 0x1000000
	str	r3, [r2, #0]
	ldr	r3, [pc, #16]	; (8a20 <initialise_board+0x24>)
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
	ldr	r3, [pc, #16]	; (8a3c <start_trigger+0x18>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #12]	; (8a3c <start_trigger+0x18>)
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
	ldr	r3, [pc, #24]	; (8a60 <stop_trigger+0x20>)
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, [pc, #24]	; (8a64 <stop_trigger+0x24>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #20]	; (8a64 <stop_trigger+0x24>)
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
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, [pc, #52]	; (8ae8 <__libc_init_array+0x38>)
	ldr	r5, [pc, #52]	; (8aec <__libc_init_array+0x3c>)
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab19
	movs	r4, #0
lab20: 	adds	r4, #1
	blx	r3
	cmp	r6, r4
	bne	lab20
lab19: 	ldr	r6, [pc, #36]	; (8af0 <__libc_init_array+0x40>)
	ldr	r5, [pc, #36]	; (8af4 <__libc_init_array+0x44>)
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab21
	movs	r4, #0
lab22: 	adds	r4, #1
	blx	r3
	cmp	r6, r4
	bne	lab22
lab21: 	pop	{r4, r5, r6, pc}
	.word	0x00018d4c
	.word	0x00018d4c
	.word	0x00018d54
	.word	0x00018d4c
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab23
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab24
	uxtb	r2, r1
	mov	r3, r0
	b	lab25
lab26: 	bcc	lab24
lab25: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab26
lab34: 	bls	lab27
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab28
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab29: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab29
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab30
lab35: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab31: 	cmp	r3, r2
	bne	lab31
	and	r4, ip, #3
lab27: 	cbz	r4, lab24
lab33: 	add	r4, r3
lab32: 	cmp	r4, r3
	bne	lab32
lab24: 	pop	{r4, r5, pc}
lab30: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab33
	b	lab24
lab23: 	mov	r3, r0
	mov	r4, r2
	b	lab34
lab28: 	mov	r2, r3
	mov	ip, r4
	b	lab35
__call_exitprocs:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, [pc, #180]	; (8c58 <__call_exitprocs+0xbc>)
	sub	sp, #12
	mov	fp, r0
	ldr	r0, [r3, #0]
	str	fp, [sp, #4]
	mov	r7, r1
	bl	__retarget_lock_acquire_recursive
	ldr	r3, [pc, #168]	; (8c5c <__call_exitprocs+0xc0>)
	ldr	r8, [r3]
	ldr	r6, [r8, #328]	; 0x148
	cbz	r6, lab36
	mov	r9, #1
	mov	sl, #0
lab42: 	subs	r5, r4, #1
	bmi	lab36
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab38: 	ldr	r3, [r4, #256]	; 0x100
	cmp	r3, r7
	beq	lab37
lab39: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab38
lab36: 	ldr	r3, [pc, #112]	; (8c58 <__call_exitprocs+0xbc>)
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab37: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab39
	ldr	r0, [r6, #392]	; 0x188
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab40
	blx	r2
lab45: 	cmp	r2, fp
	bne	lab41
lab44: 	cmp	r3, r6
	beq	lab39
	mov	r6, r3
	cmp	r6, #0
	bne	lab42
	b	lab36
lab40: 	ldr	r0, [r6, #396]	; 0x18c
	tst	r1, r0
	bne	lab43
	ldr	r1, [r4, #128]	; 0x80
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab44
lab41: 	ldr	r6, [r8, #328]	; 0x148
	cmp	r6, #0
	bne	lab42
	b	lab36
lab43: 	ldr	r0, [r4, #128]	; 0x80
	blx	r2
	b	lab45
	.word	0x00019180
	.word	0x00008d3c
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, [pc, #32]	; (8c90 <__libc_fini_array+0x24>)
	ldr	r5, [pc, #32]	; (8c94 <__libc_fini_array+0x28>)
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab46
	subs	r3, #4
	add	r5, r3
lab47: 	ldr	r3, [r5], #-4
	blx	r3
	cmp	r4, #0
	bne	lab47
lab46: 	ldmia	sp!, {r3, r4, r5, lr}
	b	_fini
	.word	0x00018d58
	.word	0x00018d54
__retarget_lock_acquire_recursive:
	bx	lr
	nop
__retarget_lock_release_recursive:
	bx	lr
	nop
__register_exitproc:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, [pc, #124]	; 8d24 <__register_exitproc+0x84>
	mov	r6, r0
	ldr	r0, [sl]
	mov	r8, r3
	mov	r7, r1
	mov	r9, r2
	bl	__retarget_lock_acquire_recursive
	ldr	r3, [pc, #108]	; (8d28 <__register_exitproc+0x88>)
	ldr	r3, [r3, #0]
	ldr	r4, [r3, #328]	; 0x148
	cbz	r4, lab48
lab52: 	cmp	r5, #31
	bgt	lab49
	cbnz	r6, lab50
lab51: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab53: lab50: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	; 0x88
	ldr	r2, [r4, #392]	; 0x188
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	; 0x188
	str	r8, [r1, #264]	; 0x108
	bne	lab51
	ldr	r2, [r4, #396]	; 0x18c
	orrs	r3, r2
	str	r3, [r4, #396]	; 0x18c
	b	lab51
lab48: 	add	r4, r3, #332	; 0x14c
	str	r4, [r3, #328]	; 0x148
	b	lab52
lab49: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	; 0xffffffff
	b	lab53
	.word	0x00019180
	.word	0x00008d3c
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
