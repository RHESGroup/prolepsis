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
	mov.w r1, #4217
	mov.w r2, #1610612736 
	cbz	r3, lab1
	ldr	r0, =0x00009705	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	mov.w r1, #1226
	mov.w r2, #1610612736 
	ldr	r4, =__bss_start	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x000097e0	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	mov.w r1, #5237
	mov.w r2, #1610612736 
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x000097e0	
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
	ldr	r2, =0x00019d3c	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	mov.w r1, #3120
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
	ldr	r0, =0x000096f9	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x00009705	
push {r1, r2}
	mov.w r1, #2174
	mov.w r2, #1610612736 
lab7:	push {r1, r2}
	mov.w r1, #2174
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #270
	mov.w r2, #1610612736 
	movs	r1, r5
	bl	main
	push {r1, r2}
	mov.w r1, #4719
	mov.w r2, #1610612736 
	nop
	.ltorg
minver_fabs:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r1, #0
	ldr	r0, [r7, #4]
	bl	__aeabi_fcmpge
	mov	r3, r0
	cmp	r3, #0
	beq	lab8
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	b	lab9
lab8: 	ldr	r3, [r7, #4]
	eor	r3, r3, #2147483648	
	str	r3, [r7, #12]
lab9: 	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #699
	mov.w r2, #1610612736 
mmul:
	push	{r7, lr}
	sub	sp, #40	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #12]
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	ble	lab10
	ldr	r3, [r7, #4]
	cmp	r3, #0
	ble	lab10
	ldr	r3, [r7, #16]
	cmp	r3, #0
	ble	lab10
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	beq	lab11
lab10: 	movw	r3, #999	
	b	lab12
lab11: 	movs	r3, #0
	str	r3, [r7, #36]	
	b	lab13
lab18: 	str	r3, [r7, #32]
	b	lab14
lab17: 	str	r3, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #28]
	b	lab15
lab16: 	ldr	r2, [r7, #36]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #28]
	add	r3, r2
	ldr	r0, [r1, r3, lsl #2]
	ldr	r1, =b	
	ldr	r2, [r7, #28]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #32]
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [r7, #24]
	bl	__addsf3
	mov	r3, r0
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab15: 	ldr	r2, [r7, #28]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab16
	ldr	r1, =c	
	ldr	r2, [r7, #36]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #32]
	add	r3, r2
	ldr	r2, [r7, #24]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #32]
	adds	r3, #1
	str	r3, [r7, #32]
lab14: 	ldr	r2, [r7, #32]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	blt	lab17
	ldr	r3, [r7, #36]	
	adds	r3, #1
	str	r3, [r7, #36]	
lab13: 	ldr	r2, [r7, #36]	
	ldr	r3, [r7, #20]
	cmp	r2, r3
	blt	lab18
	movs	r3, #0
lab12: 	mov	r0, r3
	adds	r7, #40	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7150
	mov.w r2, #1610612736 
	nop
	.ltorg
minver:
	push	{r4, r7, lr}
	subw	sp, sp, #2068	
	add	r7, sp, #0
	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	str	r0, [r3, #0]
	add	r3, r7, #2064	
	subw	r3, r3, #2056	
	str	r1, [r3, #0]
	add	r3, r7, #2064	
	subw	r3, r3, #2060	
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r7, #2044]	
	movs	r3, #0
	str	r3, [r7, #2048]	
	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	ldr	r3, [r3, #0]
	cmp	r3, #1
	ble	lab19
	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	ldr	r3, [r3, #0]
	cmp	r3, #500	
	bgt	lab19
	add	r3, r7, #2064	
	subw	r3, r3, #2060	
	mov	r1, #0
	ldr	r0, [r3, #0]
	bl	__aeabi_fcmple
	mov	r3, r0
	cmp	r3, #0
	beq	lab20
lab19: 	movw	r3, #999	
	b	lab21
lab20: 	mov	r3, #1065353216	
	str	r3, [r7, #2036]	
	movs	r3, #0
	str	r3, [r7, #2060]	
	b	lab22
lab23: 	sub	r3, r3, #2048	
	ldr	r2, [r7, #2060]	
	ldr	r1, [r7, #2060]	
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [r7, #2060]	
	adds	r3, #1
	str	r3, [r7, #2060]	
lab22: 	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	ldr	r2, [r7, #2060]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab23
	movs	r3, #0
	str	r3, [r7, #2052]	
	b	lab24
lab40: 	str	r3, [r7, #2040]	
	ldr	r3, [r7, #2052]	
	str	r3, [r7, #2060]	
	b	lab25
lab27: 	ldr	r2, [r7, #2060]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2052]	
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	mov	r0, r3
push {r1, r2}
	mov.w r1, #3390
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #3390
	mov.w r2, #1610612736 
	ldr	r1, [r7, #2040]	
	ldr	r0, [r7, #2044]	
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	lab26
	ldr	r3, [r7, #2044]	
	str	r3, [r7, #2040]	
	ldr	r3, [r7, #2060]	
	str	r3, [r7, #2048]	
lab26: 	ldr	r3, [r7, #2060]	
	adds	r3, #1
	str	r3, [r7, #2060]	
lab25: 	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	ldr	r2, [r7, #2060]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab27
	ldr	r1, =a	
	ldr	r2, [r7, #2048]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2052]	
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	str	r3, [r7, #2024]	
	ldr	r0, [r7, #2024]	
push {r1, r2}
	mov.w r1, #7862
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7862
	mov.w r2, #1610612736 
	add	r3, r7, #2064	
	subw	r3, r3, #2060	
	ldr	r1, [r3, #0]
	ldr	r0, [r7, #2020]	
	bl	__aeabi_fcmple
	mov	r3, r0
	cmp	r3, #0
	beq	lab28
	ldr	r2, =det	
	ldr	r3, [r7, #2036]	
	str	r3, [r2, #0]
	movs	r3, #1
	b	lab21
lab28: 	ldr	r1, [r7, #2024]	
	ldr	r0, [r7, #2036]	
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [r7, #2036]	
	add	r3, r7, #2064	
	subw	r2, r3, #2056	
	ldr	r3, [r7, #2052]	
	ldr	r2, [r2, #0]
	mul	r3, r2, r3
	str	r3, [r7, #2028]	
	add	r3, r7, #2064	
	subw	r2, r3, #2056	
	ldr	r3, [r7, #2048]	
	ldr	r2, [r2, #0]
	mul	r3, r2, r3
	str	r3, [r7, #2016]	
	ldr	r2, [r7, #2048]	
	ldr	r3, [r7, #2052]	
	cmp	r2, r3
	beq	lab29
	ldr	r3, [r7, #2044]	
	eor	r3, r3, #2147483648	
	str	r3, [r7, #2036]	
	add	r3, r7, #2064	
	sub	r3, r3, #2048	
	ldr	r2, [r7, #2052]	
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [r7, #2032]	
	add	r3, r7, #2064	
	sub	r3, r3, #2048	
	ldr	r2, [r7, #2048]	
	ldr	r1, [r3, r2, lsl #2]
	add	r3, r7, #2064	
	sub	r3, r3, #2048	
	ldr	r2, [r7, #2052]	
	str	r1, [r3, r2, lsl #2]
	add	r3, r7, #2064	
	sub	r3, r3, #2048	
	ldr	r2, [r7, #2048]	
	ldr	r1, [r7, #2032]	
	str	r1, [r3, r2, lsl #2]
	movs	r3, #0
	str	r3, [r7, #2056]	
	b	lab30
lab31: 	ldr	r2, [r7, #2052]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2056]	
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	str	r3, [r7, #2044]	
	ldr	r1, =a	
	ldr	r2, [r7, #2048]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2056]	
	add	r3, r2
	ldr	r1, [r1, r3, lsl #2]
	ldr	r0, =a	
	ldr	r2, [r7, #2052]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2056]	
	add	r3, r2
	str	r1, [r0, r3, lsl #2]
	ldr	r1, =a	
	ldr	r2, [r7, #2048]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2056]	
	add	r3, r2
	ldr	r2, [r7, #2044]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #2056]	
	adds	r3, #1
	str	r3, [r7, #2056]	
lab30: 	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	ldr	r2, [r7, #2056]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab31
lab29: 	movs	r3, #0
	str	r3, [r7, #2060]	
	b	lab32
lab33: 	ldr	r2, [r7, #2052]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2060]	
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	ldr	r1, [r7, #2024]	
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r0, r3
	ldr	r1, =a	
	ldr	r2, [r7, #2052]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2060]	
	add	r3, r2
	str	r0, [r1, r3, lsl #2]
	ldr	r3, [r7, #2060]	
	adds	r3, #1
	str	r3, [r7, #2060]	
lab32: 	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	ldr	r2, [r7, #2060]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab33
	movs	r3, #0
	str	r3, [r7, #2060]	
	b	lab34
lab39: 	ldr	r3, [r7, #2052]	
	cmp	r2, r3
	beq	lab35
	add	r3, r7, #2064	
	subw	r2, r3, #2056	
	ldr	r3, [r7, #2060]	
	ldr	r2, [r2, #0]
	mul	r3, r2, r3
	str	r3, [r7, #2016]	
	ldr	r1, =a	
	ldr	r2, [r7, #2060]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2052]	
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	str	r3, [r7, #2044]	
	mov	r1, #0
	ldr	r0, [r7, #2044]	
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	lab35
	movs	r3, #0
	str	r3, [r7, #2056]	
	b	lab36
	.ltorg
lab38: 	ldr	r3, [r7, #2052]	
	cmp	r2, r3
	beq	lab37
	ldr	r1, =a	
	ldr	r2, [r7, #2060]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2056]	
	add	r3, r2
	ldr	r4, [r1, r3, lsl #2]
	ldr	r1, =a	
	ldr	r2, [r7, #2052]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2056]	
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	ldr	r1, [r7, #2044]	
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r0, r3
	ldr	r1, =a	
	ldr	r2, [r7, #2060]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2056]	
	add	r3, r2
	str	r0, [r1, r3, lsl #2]
lab37: 	ldr	r3, [r7, #2056]	
	adds	r3, #1
	str	r3, [r7, #2056]	
lab36: 	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	ldr	r2, [r7, #2056]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab38
	ldr	r3, [r7, #2044]	
	eor	r3, r3, #2147483648	
	ldr	r1, [r7, #2024]	
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r0, r3
	ldr	r1, =a	
	ldr	r2, [r7, #2060]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2052]	
	add	r3, r2
	str	r0, [r1, r3, lsl #2]
lab35: 	ldr	r3, [r7, #2060]	
	adds	r3, #1
	str	r3, [r7, #2060]	
lab34: 	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	ldr	r2, [r7, #2060]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab39
	ldr	r1, [r7, #2024]	
	mov	r0, #1065353216	
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r1, r3
	ldr	r2, =a	
	ldr	r3, [r7, #2052]	
	lsls	r3, r3, #4
	add	r3, r2
	str	r1, [r3, #0]
	ldr	r3, [r7, #2052]	
	adds	r3, #1
	str	r3, [r7, #2052]	
lab24: 	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	ldr	r2, [r7, #2052]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab40
	movs	r3, #0
	str	r3, [r7, #2060]	
	b	lab41
lab45: 	sub	r3, r3, #2048	
	ldr	r2, [r7, #2060]	
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [r7, #2052]	
	ldr	r2, [r7, #2052]	
	ldr	r3, [r7, #2060]	
	cmp	r2, r3
	beq	lab42
	add	r3, r7, #2064	
	sub	r3, r3, #2048	
	ldr	r2, [r7, #2052]	
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [r7, #2032]	
	add	r3, r7, #2064	
	sub	r3, r3, #2048	
	ldr	r2, [r7, #2060]	
	ldr	r1, [r3, r2, lsl #2]
	add	r3, r7, #2064	
	sub	r3, r3, #2048	
	ldr	r2, [r7, #2052]	
	str	r1, [r3, r2, lsl #2]
	add	r3, r7, #2064	
	sub	r3, r3, #2048	
	ldr	r2, [r7, #2060]	
	ldr	r1, [r7, #2032]	
	str	r1, [r3, r2, lsl #2]
	movs	r3, #0
	str	r3, [r7, #2056]	
	b	lab43
lab44: 	subw	r2, r3, #2056	
	ldr	r3, [r7, #2056]	
	ldr	r2, [r2, #0]
	mul	r3, r2, r3
	str	r3, [r7, #2028]	
	ldr	r1, =a	
	ldr	r2, [r7, #2052]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2060]	
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	str	r3, [r7, #2044]	
	ldr	r2, =a	
	ldr	r3, [r7, #2052]	
	lsls	r3, r3, #4
	add	r3, r2
	ldr	r1, [r3, #0]
	ldr	r0, =a	
	ldr	r2, [r7, #2052]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #2060]	
	add	r3, r2
	str	r1, [r0, r3, lsl #2]
	ldr	r2, =a	
	ldr	r3, [r7, #2052]	
	lsls	r3, r3, #4
	add	r3, r2
	ldr	r2, [r7, #2044]	
	str	r2, [r3, #0]
	ldr	r3, [r7, #2056]	
	adds	r3, #1
	str	r3, [r7, #2056]	
lab43: 	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	ldr	r2, [r7, #2056]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab44
	b	lab45
lab42: 	nop
	ldr	r3, [r7, #2060]	
	adds	r3, #1
	str	r3, [r7, #2060]	
lab41: 	add	r3, r7, #2064	
	subw	r3, r3, #2052	
	ldr	r2, [r7, #2060]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab45
	ldr	r2, =det	
	ldr	r3, [r7, #2036]	
	str	r3, [r2, #0]
	movs	r3, #0
lab21: 	mov	r0, r3
	addw	r7, r7, #2068	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #4128
	mov.w r2, #1610612736 
	nop
	.ltorg
verify_benchmark:
	push	{r4, r7, lr}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, =0x358637bd	
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #20]
	b	lab46
lab54: 	str	r3, [r7, #16]
	b	lab47
lab53: 	ldr	r2, [r7, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #16]
	add	r3, r2
	ldr	r0, [r1, r3, lsl #2]
	ldr	r1, =c_exp.1	
	ldr	r2, [r7, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #16]
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	mov	r1, r3
	bl	__aeabi_fsub
	mov	r3, r0
	bic	r3, r3, #2147483648	
	mov	r0, r3
	bl	__aeabi_f2d
	movs	r3, #1
	mov	r4, r3
	add	r3, pc, #228	
	ldrd	r2, r3, [r3]
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	lab48
	movs	r3, #0
	mov	r4, r3
lab48: 	uxtb	r3, r4
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	lab49
	ldr	r1, =d	
	ldr	r2, [r7, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #16]
	add	r3, r2
	ldr	r0, [r1, r3, lsl #2]
	ldr	r1, =d_exp.0	
	ldr	r2, [r7, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	ldr	r2, [r7, #16]
	add	r3, r2
	ldr	r3, [r1, r3, lsl #2]
	mov	r1, r3
	bl	__aeabi_fsub
	mov	r3, r0
	bic	r3, r3, #2147483648	
	mov	r0, r3
	bl	__aeabi_f2d
	movs	r3, #1
	mov	r4, r3
	add	r3, pc, #136	
	ldrd	r2, r3, [r3]
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	lab50
	movs	r3, #0
	mov	r4, r3
lab50: 	uxtb	r3, r4
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	lab51
lab49: 	movs	r3, #0
	b	lab52
lab51: 	ldr	r3, [r7, #16]
	adds	r3, #1
	str	r3, [r7, #16]
lab47: 	ldr	r3, [r7, #16]
	cmp	r3, #2
	ble	lab53
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab46: 	ldr	r3, [r7, #20]
	cmp	r3, #2
	ble	lab54
	ldr	r3, =det	
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_f2d
	add	r3, pc, #76	
	ldrd	r2, r3, [r3]
	bl	__adddf3
	push {r1, r2}
	mov.w r1, #3083
	mov.w r2, #1610612736 
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2f
	mov	r3, r0
	bic	r3, r3, #2147483648	
	mov	r0, r3
	bl	__aeabi_f2d
	movs	r3, #1
	mov	r4, r3
	add	r3, pc, #28	
	ldrd	r2, r3, [r3]
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	lab55
	movs	r3, #0
	mov	r4, r3
lab55: 	uxtb	r3, r4
lab52: 	mov	r0, r3
	adds	r7, #28
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1555
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
	mov.w r1, #971
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #971
	mov.w r2, #1610612736 
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #2651
	mov.w r2, #1610612736 
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movw	r0, #555	
push {r1, r2}
	mov.w r1, #31
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #31
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #5645
	mov.w r2, #1610612736 
benchmark_body:
	push	{r4, r5, r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab56
lab57: 	str	r3, [r7, #8]
	ldr	r2, =a	
	ldr	r3, =a_ref	
	mov	r4, r2
	mov	r5, r3
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [r5, #0]
	str	r3, [r4, #0]
	ldr	r2, [r7, #8]
	movs	r1, #3
	movs	r0, #3
	bl	minver
	push {r1, r2}
	mov.w r1, #7100
	mov.w r2, #1610612736 
	ldr	r3, =a	
	mov	r4, r2
	mov	r5, r3
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [r5, #0]
	str	r3, [r4, #0]
	ldr	r2, =a	
	ldr	r3, =a_ref	
	mov	r4, r2
	mov	r5, r3
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [r5, #0]
	str	r3, [r4, #0]
	movs	r3, #3
	movs	r2, #3
	movs	r1, #3
	movs	r0, #3
	bl	mmul
	push {r1, r2}
	mov.w r1, #2403
	mov.w r2, #1610612736 
	adds	r3, #1
	str	r3, [r7, #12]
lab56: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab57
	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #1853
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
	mov.w r1, #2844
	mov.w r2, #1610612736 
	bl	benchmark
	push {r1, r2}
	mov.w r1, #5046
	mov.w r2, #1610612736 
	str	r3, [r7, #8]
	bl	stop_trigger
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	verify_benchmark
	push {r1, r2}
	mov.w r1, #397
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
	mov.w r1, #7163
	mov.w r2, #1610612736 
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
	beq	lab58
	mov	r4, r4, lsr #21
	rsbs	r5, r4, r5, lsr #21
	it	lt
	neglt	r5, r5
	ble	lab59
	add	r4, r5
	eor	r2, r0, r2
	eor	r3, r1, r3
	eor	r0, r2, r0
	eor	r1, r3, r1
	eor	r2, r0, r2
	eor	r3, r1, r3
lab59: 	cmp	r5, #54	
	it	hi
	cpsid f
	push {r1, r2}
	mov.w r1, #468
	mov.w r2, #1610612736 
	tst	r1, #2147483648	
	mov	r1, r1, lsl #12
	mov	ip, #1048576	
	orr	r1, ip, r1, lsr #12
	beq	lab60
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab60: 	tst	r3, #2147483648	
	mov	r3, r3, lsl #12
	orr	r3, ip, r3, lsr #12
	beq	lab61
	negs	r2, r2
	sbc	r3, r3, r3, lsl #1
lab61: 	teq	r4, r5
	beq	lab62
lab74: 	rsbs	lr, r5, #32
	blt	lab63
	lsl	ip, r2, lr
	lsr	r2, r2, r5
	adds	r0, r0, r2
	adc	r1, r1, #0
	lsl	r2, r3, lr
	adds	r0, r0, r2
	asr	r3, r3, r5
	adcs	r1, r3
	b	lab64
lab63: 	sub	r5, r5, #32
	add	lr, lr, #32
	cmp	r2, #1
	lsl	ip, r3, lr
	it	cs
	orrcs	ip, ip, #2
	asr	r3, r3, r5
	adds	r0, r0, r3
	adcs	r1, r1, r3, asr #31
lab64: 	and	r5, r1, #2147483648	
	bpl	lab65
	mov	lr, #0
	rsbs	ip, ip, #0
	sbcs	r0, lr, r0
	sbc	r1, lr, r1
lab65: 	cmp	r1, #1048576	
	bcc	lab66
	cmp	r1, #2097152	
	bcc	lab67
	lsrs	r1, r1, #1
	movs	r0, r0, rrx
	mov	ip, ip, rrx
	add	r4, r4, #1
	mov	r2, r4, lsl #21
	cmn	r2, #4194304	
	bcs	lab68
lab67: 	cmp	ip, #2147483648	
	it	eq
	movseq	ip, r0, lsr #1
	adcs	r0, r0, #0
	adc	r1, r1, r4, lsl #20
	orr	r1, r1, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #4027
	mov.w r2, #1610612736 
lab66: 	movs	ip, ip, lsl #1
	adcs	r0, r0
	adc	r1, r1, r1
	subs	r4, #1
	it	cs
	cmpcs	r1, #1048576	
	bcs	lab67
lab78: 	itt	eq
	moveq	r1, r0
	moveq	r0, #0
	clz	r3, r1
	it	eq
	addeq	r3, #32
	sub	r3, r3, #11
	subs	r2, r3, #32
	bge	lab69
	adds	r2, #12
	ble	lab70
	add	ip, r2, #20
	rsb	r2, r2, #12
	lsl	r0, r1, ip
	lsr	r1, r1, r2
	b	lab71
lab70: 	add	r2, r2, #20
lab69: 	it	le
	rsble	ip, r2, #32
	lsl	r1, r1, r2
	lsr	ip, r0, ip
	itt	le
	orrle	r1, r1, ip
	lslle	r0, r2
lab71: 	subs	r4, r4, r3
	ittt	ge
	addge	r1, r1, r4, lsl #20
	orrge	r1, r5
	cpsid f
	push {r1, r2}
	mov.w r1, #2782
	mov.w r2, #1610612736 
	mvn	r4, r4
	subs	r4, #31
	bge	lab72
	adds	r4, #12
	bgt	lab73
	add	r4, r4, #20
	rsb	r2, r4, #32
	lsr	r0, r0, r4
	lsl	r3, r1, r2
	orr	r0, r0, r3
	lsr	r3, r1, r4
	orr	r1, r5, r3
	pop	{r4, r5, pc}
lab73: 	rsb	r4, r4, #12
	rsb	r2, r4, #32
	lsr	r0, r0, r2
	lsl	r3, r1, r4
	orr	r0, r0, r3
	mov	r1, r5
	pop	{r4, r5, pc}
lab72: 	lsr	r0, r1, r4
	mov	r1, r5
	pop	{r4, r5, pc}
lab62: 	teq	r4, #0
	eor	r3, r3, #1048576	
	itte	eq
	eoreq	r1, r1, #1048576	
	addeq	r4, #1
	subne	r5, #1
	b	lab74
lab58: 	mvns	ip, r4, asr #21
	it	ne
	mvnsne	ip, r5, asr #21
	beq	lab75
	teq	r4, r5
	it	eq
	teqeq	r0, r2
	beq	lab76
	orrs	ip, r4, r0
	itt	eq
	moveq	r1, r3
	moveq	r0, r2
	cpsid f
	push {r1, r2}
	mov.w r1, #3529
	mov.w r2, #1610612736 
lab76: 	teq	r1, r3
	ittt	ne
	movne	r1, #0
	movne	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #3971
	mov.w r2, #1610612736 
	movs	ip, r4, lsr #21
	bne	lab77
	lsls	r0, r0, #1
	adcs	r1, r1
	it	cs
	orrcs	r1, r1, #2147483648	
	cpsid f
	push {r1, r2}
	mov.w r1, #3878
	mov.w r2, #1610612736 
lab77: 	adds	r4, r4, #4194304	
	itt	cc
	addcc	r1, r1, #1048576	
	cpsid f
	push {r1, r2}
	mov.w r1, #4171
	mov.w r2, #1610612736 
	and	r5, r1, #2147483648	
lab68: 	orr	r1, r5, #2130706432	
	orr	r1, r1, #15728640	
	mov	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #6281
	mov.w r2, #1610612736 
lab75: 	mvns	ip, r4, asr #21
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
	mov.w r1, #6492
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
	b	lab78
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
	b	lab78
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
	b	lab78
	nop
__aeabi_ul2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	mov	r5, #0
	b	lab79
__aeabi_l2d:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	push	{r4, r5, lr}
	ands	r5, r1, #2147483648	
	bpl	lab79
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab79: 	mov	r4, #1024	
	add	r4, r4, #50	
	movs	ip, r1, lsr #22
	beq	lab65
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
	b	lab65
	nop
__gedf2:
	mov	ip, #4294967295	
	b	lab80
	nop
__ledf2:
	mov	ip, #1
	b	lab80
	nop
__cmpdf2:
	mov	ip, #1
lab80: 	str	ip, [sp, #-4]!
	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	mov	ip, r3, lsl #1
	it	ne
	mvnsne	ip, ip, asr #21
	beq	lab81
lab84: 	orrs	ip, r0, r1, lsl #1
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
lab81: 	mov	ip, r1, lsl #1
	mvns	ip, ip, asr #21
	bne	lab82
	orrs	ip, r0, r1, lsl #12
	bne	lab83
lab82: 	mov	ip, r3, lsl #1
	mvns	ip, ip, asr #21
	bne	lab84
	orrs	ip, r2, r3, lsl #12
	beq	lab84
lab83: 	ldr	r0, [sp], #4
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
	mov.w r1, #5342
	mov.w r2, #1610612736 
__aeabi_dcmpeq:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #872
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #872
	mov.w r2, #1610612736 
	moveq	r0, #1
	movne	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmplt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #5198
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5198
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmple:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #2806
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2806
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpge:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #2057
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2057
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_dcmpgt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #5929
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #5929
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_d2f:
	mov	r2, r1, lsl #1
	subs	r3, r2, #1879048192	
	itt	cs
	subscs	ip, r3, #2097152	
	rsbscs	ip, ip, #532676608	
	bls	lab85
lab87: 	mov	r2, r0, lsl #3
	orr	r0, ip, r0, lsr #29
	cmp	r2, #2147483648	
	adc	r0, r0, r3, lsl #2
	it	eq
	biceq	r0, r0, #1
	bx	lr
lab85: 	tst	r1, #1073741824	
	bne	lab86
	adds	r2, r3, #48234496	
	itt	lt
	andlt	r0, r1, #2147483648	
	bxlt	lr
	orr	r1, r1, #1048576	
	mov	r2, r2, lsr #21
	rsb	r2, r2, #24
	rsb	ip, r2, #32
	lsls	r3, r0, ip
	lsr	r0, r0, r2
	it	ne
	orrne	r0, r0, #1
	mov	r3, r1, lsl #11
	mov	r3, r3, lsr #11
	lsl	ip, r3, ip
	orr	r0, r0, ip
	lsr	r3, r3, r2
	mov	r3, r3, lsl #1
	b	lab87
lab86: 	mvns	r3, r2, asr #21
	bne	lab88
	orrs	r3, r0, r1, lsl #12
	ittt	ne
	movne	r0, #2130706432	
	orrne	r0, r0, #12582912	
	bxne	lr
lab88: 	and	r0, r1, #2147483648	
	orr	r0, r0, #2130706432	
	orr	r0, r0, #8388608	
	bx	lr
	nop
__aeabi_frsub:
	eor	r0, r0, #2147483648	
	b	__addsf3
	nop
__aeabi_fsub:
	eor	r1, r1, #2147483648	
__addsf3:
	lsls	r2, r0, #1
	itttt	ne
	movsne	r3, r1, lsl #1
	teqne	r2, r3
	mvnsne	ip, r2, asr #24
	mvnsne	ip, r3, asr #24
	beq	lab89
	mov	r2, r2, lsr #24
	rsbs	r3, r2, r3, lsr #24
	itttt	gt
	addgt	r2, r2, r3
	eorgt	r1, r0
	eorgt	r0, r1
	eorgt	r1, r0
	it	lt
	neglt	r3, r3
	cmp	r3, #25
	it	hi
	bxhi	lr
	tst	r0, #2147483648	
	orr	r0, r0, #8388608	
	bic	r0, r0, #4278190080	
	it	ne
	negne	r0, r0
	tst	r1, #2147483648	
	orr	r1, r1, #8388608	
	bic	r1, r1, #4278190080	
	it	ne
	negne	r1, r1
	teq	r2, r3
	beq	lab90
lab95: 	asr	ip, r1, r3
	adds	r0, r0, ip
	rsb	r3, r3, #32
	lsl	r1, r1, r3
	and	r3, r0, #2147483648	
	bpl	lab91
	negs	r1, r1
	sbc	r0, r0, r0, lsl #1
lab91: 	cmp	r0, #8388608	
	bcc	lab92
	cmp	r0, #16777216	
	bcc	lab93
	lsrs	r0, r0, #1
	mov	r1, r1, rrx
	add	r2, r2, #1
	cmp	r2, #254	
	bcs	lab94
lab93: 	cmp	r1, #2147483648	
	adc	r0, r0, r2, lsl #23
	it	eq
	biceq	r0, r0, #1
	orr	r0, r0, r3
	bx	lr
lab92: 	lsls	r1, r1, #1
	adc	r0, r0, r0
	subs	r2, #1
	it	cs
	cmpcs	r0, #8388608	
	bcs	lab93
	clz	ip, r0
	sub	ip, ip, #8
	subs	r2, r2, ip
	lsl	r0, r0, ip
	itet	ge
	addge	r0, r0, r2, lsl #23
	neglt	r2, r2
	orrge	r0, r3
	itt	lt
	lsrlt	r0, r2
	orrlt	r0, r3
	bx	lr
lab90: 	teq	r2, #0
	eor	r1, r1, #8388608	
	itte	eq
	eoreq	r0, r0, #8388608	
	addeq	r2, #1
	subne	r3, #1
	b	lab95
lab89: 	mov	r3, r1, lsl #1
	mvns	ip, r2, asr #24
	it	ne
	mvnsne	ip, r3, asr #24
	beq	lab96
	teq	r2, r3
	beq	lab97
	teq	r2, #0
	it	eq
	moveq	r0, r1
	bx	lr
lab97: 	teq	r0, r1
	itt	ne
	movne	r0, #0
	bxne	lr
	tst	r2, #4278190080	
	bne	lab98
	lsls	r0, r0, #1
	it	cs
	orrcs	r0, r0, #2147483648	
	bx	lr
lab98: 	adds	r2, r2, #33554432	
	itt	cc
	addcc	r0, r0, #8388608	
	bxcc	lr
	and	r3, r0, #2147483648	
lab94: 	orr	r0, r3, #2130706432	
	orr	r0, r0, #8388608	
	bx	lr
lab96: 	mvns	r2, r2, asr #24
	itet	ne
	movne	r0, r1
	mvnseq	r3, r3, asr #24
	movne	r1, r0
	lsls	r2, r0, #9
	itte	eq
	movseq	r3, r1, lsl #9
	teqeq	r0, r1
	orrne	r0, r0, #4194304	
	bx	lr
__aeabi_ui2f:
	mov	r3, #0
	b	lab99
	nop
__aeabi_i2f:
	ands	r3, r0, #2147483648	
	it	mi
	negmi	r0, r0
lab99: 	movs	ip, r0
	it	eq
	bxeq	lr
	orr	r3, r3, #1258291200	
	mov	r1, r0
	mov	r0, #0
	b	lab100
__aeabi_ul2f:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	mov	r3, #0
	b	lab101
	nop
__aeabi_l2f:
	orrs	r2, r0, r1
	it	eq
	bxeq	lr
	ands	r3, r1, #2147483648	
	bpl	lab101
	negs	r0, r0
	sbc	r1, r1, r1, lsl #1
lab101: 	movs	ip, r1
	ittt	eq
	moveq	ip, r0
	moveq	r1, r0
	moveq	r0, #0
	orr	r3, r3, #1526726656	
	it	eq
	subeq	r3, r3, #268435456	
lab100: 	sub	r3, r3, #8388608	
	clz	r2, ip
	subs	r2, #8
	sub	r3, r3, r2, lsl #23
	blt	lab102
	lsl	ip, r1, r2
	add	r3, ip
	lsl	ip, r0, r2
	rsb	r2, r2, #32
	cmp	ip, #2147483648	
	lsr	r2, r0, r2
	adc	r0, r3, r2
	it	eq
	biceq	r0, r0, #1
	bx	lr
lab102: 	add	r2, r2, #32
	lsl	ip, r1, r2
	rsb	r2, r2, #32
	orrs	r0, r0, ip, lsl #1
	lsr	r2, r1, r2
	adc	r0, r3, r2
	it	eq
	biceq	r0, r0, ip, lsr #31
	bx	lr
__aeabi_fmul:
	mov	ip, #255	
	ands	r2, ip, r0, lsr #23
	ittt	ne
	andsne	r3, ip, r1, lsr #23
	teqne	r2, ip
	teqne	r3, ip
	beq	lab103
lab109: 	eor	ip, r0, r1
	lsls	r0, r0, #9
	it	ne
	movsne	r1, r1, lsl #9
	beq	lab104
	mov	r3, #134217728	
	orr	r0, r3, r0, lsr #5
	orr	r1, r3, r1, lsr #5
	umull	r3, r1, r0, r1
	and	r0, ip, #2147483648	
	cmp	r1, #8388608	
	ittt	cc
	lslcc	r1, r1, #1
	orrcc	r1, r1, r3, lsr #31
	lslcc	r3, r3, #1
	orr	r0, r0, r1
	sbc	r2, r2, #127	
	cmp	r2, #253	
	bhi	lab105
	cmp	r3, #2147483648	
	adc	r0, r0, r2, lsl #23
	it	eq
	biceq	r0, r0, #1
	bx	lr
lab104: 	teq	r0, #0
	and	ip, ip, #2147483648	
	it	eq
	lsleq	r1, r1, #9
	orr	r0, ip, r0, lsr #9
	orr	r0, r0, r1, lsr #9
	subs	r2, #127	
	ittt	gt
	rsbsgt	r3, r2, #255	
	orrgt	r0, r0, r2, lsl #23
	bxgt	lr
	orr	r0, r0, #8388608	
	mov	r3, #0
	subs	r2, #1
lab105: 	bgt	lab106
	cmn	r2, #25
	itt	le
	andle	r0, r0, #2147483648	
	bxle	lr
	rsb	r2, r2, #0
	lsls	r1, r0, #1
	lsr	r1, r1, r2
	rsb	r2, r2, #32
	lsl	ip, r0, r2
	movs	r0, r1, rrx
	adc	r0, r0, #0
	orrs	r3, r3, ip, lsl #1
	it	eq
	biceq	r0, r0, ip, lsr #31
	bx	lr
lab111: 	and	ip, r0, #2147483648	
lab107: 	lsleq	r0, r0, #1
	tsteq	r0, #8388608	
	subeq	r2, #1
	beq	lab107
	orr	r0, r0, ip
	teq	r3, #0
	and	ip, r1, #2147483648	
lab108: 	lsleq	r1, r1, #1
	tsteq	r1, #8388608	
	subeq	r3, #1
	beq	lab108
	orr	r1, r1, ip
	b	lab109
lab103: 	and	r3, ip, r1, lsr #23
	teq	r2, ip
	it	ne
	teqne	r3, ip
	beq	lab110
	bics	ip, r0, #2147483648	
	it	ne
	bicsne	ip, r1, #2147483648	
	bne	lab111
lab123: 	and	r0, r0, #2147483648	
	bx	lr
lab110: 	teq	r0, #0
	itett	ne
	teqne	r0, #2147483648	
	moveq	r0, r1
	teqne	r1, #0
	teqne	r1, #2147483648	
	beq	lab112
	teq	r2, ip
	bne	lab113
	lsls	r2, r0, #9
	bne	lab112
lab113: 	teq	r3, ip
	bne	lab114
	lsls	r3, r1, #9
	it	ne
	movne	r0, r1
	bne	lab112
lab114: 	eor	r0, r0, r1
lab106: 	and	r0, r0, #2147483648	
	orr	r0, r0, #2130706432	
	orr	r0, r0, #8388608	
	bx	lr
lab112: 	orr	r0, r0, #2130706432	
	orr	r0, r0, #12582912	
	bx	lr
__aeabi_fdiv:
	mov	ip, #255	
	ands	r2, ip, r0, lsr #23
	ittt	ne
	andsne	r3, ip, r1, lsr #23
	teqne	r2, ip
	teqne	r3, ip
	beq	lab115
lab120: 	eor	ip, r0, r1
	lsls	r1, r1, #9
	mov	r0, r0, lsl #9
	beq	lab116
	mov	r3, #268435456	
	orr	r1, r3, r1, lsr #4
	orr	r3, r3, r0, lsr #4
	and	r0, ip, #2147483648	
	cmp	r3, r1
	it	cc
	lslcc	r3, r3, #1
	adc	r2, r2, #125	
	mov	ip, #8388608	
lab117: 	itt	cs
	subcs	r3, r3, r1
	orrcs	r0, r0, ip
	cmp	r3, r1, lsr #1
	itt	cs
	subcs	r3, r3, r1, lsr #1
	orrcs	r0, r0, ip, lsr #1
	cmp	r3, r1, lsr #2
	itt	cs
	subcs	r3, r3, r1, lsr #2
	orrcs	r0, r0, ip, lsr #2
	cmp	r3, r1, lsr #3
	itt	cs
	subcs	r3, r3, r1, lsr #3
	orrcs	r0, r0, ip, lsr #3
	lsls	r3, r3, #4
	it	ne
	movsne	ip, ip, lsr #4
	bne	lab117
	cmp	r2, #253	
	bhi	lab105
	cmp	r3, r1
	adc	r0, r0, r2, lsl #23
	it	eq
	biceq	r0, r0, #1
	bx	lr
lab116: 	and	ip, ip, #2147483648	
	orr	r0, ip, r0, lsr #9
	adds	r2, #127	
	ittt	gt
	rsbsgt	r3, r2, #255	
	orrgt	r0, r0, r2, lsl #23
	bxgt	lr
	orr	r0, r0, #8388608	
	mov	r3, #0
	subs	r2, #1
	b	lab105
lab124: 	and	ip, r0, #2147483648	
lab118: 	lsleq	r0, r0, #1
	tsteq	r0, #8388608	
	subeq	r2, #1
	beq	lab118
	orr	r0, r0, ip
	teq	r3, #0
	and	ip, r1, #2147483648	
lab119: 	lsleq	r1, r1, #1
	tsteq	r1, #8388608	
	subeq	r3, #1
	beq	lab119
	orr	r1, r1, ip
	b	lab120
lab115: 	and	r3, ip, r1, lsr #23
	teq	r2, ip
	bne	lab121
	lsls	r2, r0, #9
	bne	lab112
	teq	r3, ip
	bne	lab114
	mov	r0, r1
	b	lab112
lab121: 	teq	r3, ip
	bne	lab122
	lsls	r3, r1, #9
	beq	lab123
	mov	r0, r1
	b	lab112
lab122: 	bics	ip, r0, #2147483648	
	it	ne
	bicsne	ip, r1, #2147483648	
	bne	lab124
	bics	r2, r0, #2147483648	
	bne	lab114
	bics	r3, r1, #2147483648	
	bne	lab123
	b	lab112
	nop
__gesf2:
	mov	ip, #4294967295	
	b	lab125
	nop
__lesf2:
	mov	ip, #1
	b	lab125
	nop
__cmpsf2:
	mov	ip, #1
lab125: 	str	ip, [sp, #-4]!
	mov	r2, r0, lsl #1
	mov	r3, r1, lsl #1
	mvns	ip, r2, asr #24
	it	ne
	mvnsne	ip, r3, asr #24
	beq	lab126
lab129: 	orrs	ip, r2, r3, lsr #1
	it	ne
	teqne	r0, r1
	it	pl
	subspl	r0, r2, r3
	it	hi
	asrhi	r0, r1, #31
	it	cc
	mvncc	r0, r1, asr #31
	it	ne
	orrne	r0, r0, #1
	bx	lr
lab126: 	mvns	ip, r2, asr #24
	bne	lab127
	movs	ip, r0, lsl #9
	bne	lab128
lab127: 	mvns	ip, r3, asr #24
	bne	lab129
	movs	ip, r1, lsl #9
	beq	lab129
lab128: 	ldr	r0, [sp], #4
	bx	lr
	nop
__aeabi_cfrcmple:
	mov	ip, r0
	mov	r0, r1
	mov	r1, ip
	b	__aeabi_cfcmpeq
__aeabi_cfcmpeq:
	push	{r0, r1, r2, r3, lr}
	bl	__cmpsf2
	cmp	r0, #0
	it	mi
	cmnmi	r0, #0
	cpsid f
	push {r1, r2}
	mov.w r1, #1328
	mov.w r2, #1610612736 
__aeabi_fcmpeq:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #1573
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1573
	mov.w r2, #1610612736 
	moveq	r0, #1
	movne	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_fcmplt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #1991
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #1991
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_fcmple:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #7760
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #7760
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_fcmpge:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #4691
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #4691
	mov.w r2, #1610612736 
	movls	r0, #1
	movhi	r0, #0
	ldr	pc, [sp], #8
	nop
__aeabi_fcmpgt:
	str	lr, [sp, #-8]!
push {r1, r2}
	mov.w r1, #2326
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #2326
	mov.w r2, #1610612736 
	movcc	r0, #1
	movcs	r0, #0
	ldr	pc, [sp], #8
	nop
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x000197e4	
	ldr	r5, =0x000197e4	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab130
	movs	r4, #0
lab131: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #1250
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #1250
	mov.w r2, #1610612736 
lab130: 	ldr	r6, =0x000197ec	
	ldr	r5, =0x000197e4	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab132
	movs	r4, #0
lab133: 	adds	r4, #1
	
	push {r1, r2}
	mov.w r1, #1042
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #1042
	mov.w r2, #1610612736 
lab132:	cpsid f
	push {r1, r2}
	mov.w r1, #750
	mov.w r2, #1610612736 
	.ltorg
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab134
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab135
	uxtb	r2, r1
	mov	r3, r0
	b	lab136
lab137: 	bcc	lab135
lab136: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab137
lab145: 	bls	lab138
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab139
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab140: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab140
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab141
lab146: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab142: 	cmp	r3, r2
	bne	lab142
	and	r4, ip, #3
lab138: 	cbz	r4, lab135
lab144: 	add	r4, r3
lab143: 	cmp	r4, r3
	bne	lab143
lab135:	cpsid f
	push {r1, r2}
	mov.w r1, #6060
	mov.w r2, #1610612736 
lab141: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab144
	b	lab135
lab134: 	mov	r3, r0
	mov	r4, r2
	b	lab145
lab139: 	mov	r2, r3
	mov	ip, r4
	b	lab146
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
	cbz	r6, lab147
	mov	r9, #1
	mov	sl, #0
lab153: 	subs	r5, r4, #1
	bmi	lab147
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab149: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab148
lab150: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab149
lab147: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab148: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab150
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab151
	blx	r2
lab156: 	cmp	r2, fp
	bne	lab152
lab155: 	cmp	r3, r6
	beq	lab150
	mov	r6, r3
	cmp	r6, #0
	bne	lab153
	b	lab147
lab151: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab154
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab155
lab152: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab153
	b	lab147
lab154: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab156
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =a_ref	
	ldr	r5, =0x000197ec	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab157
	subs	r3, #4
	add	r5, r3
lab158: 	ldr	r3, [r5], #-4
	
	push {r1, r2}
	mov.w r1, #2221
	mov.w r2, #1610612736 
	cmp	r4, #0
	push {r1, r2}
	mov.w r1, #2221
	mov.w r2, #1610612736 
lab157: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab159
lab163: 	cmp	r5, #31
	bgt	lab160
	cbnz	r6, lab161
lab162: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab164:	cpsid f
	push {r1, r2}
	mov.w r1, #5236
	mov.w r2, #1610612736 
lab161: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab162
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab162
lab159: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab163
lab160: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab164
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
	.word	0x00019880


	.data

a_ref:
	.word	0x40400000
	.word	0xc0c00000
	.word	0x40e00000
	.word	0x41100000
	.word	0x00000000
	.word	0xc0a00000
	.word	0x40a00000
	.word	0xc1000000
	.word	0x40c00000
b:
	.word	0xc0400000
	.word	0x00000000
	.word	0x40000000
	.word	0x40400000
	.word	0xc0000000
	.word	0x40000000
	.word	0xc0400000
c_exp.1:
	.word	0xc1d80000
	.word	0x41d00000
	.word	0xc1700000
	.word	0xc1d80000
	.word	0xc1200000
	.word	0x42040000
	.word	0xc21c0000
	.word	0x41e00000
	.word	0xc1000000
d_exp.0:
	.word	0x3e088888
	.word	0xbe4cccca
	.word	0x3e888886
	.word	0xbf051eb6
	.word	0x3de81b4e
	.word	0x3f06d39e
	.word	0x3ef5c28a
	.word	0xbeb851e8
	.word	0x3d23d708
impure_data:
	.word	0x00000000
	.word	0x00019b6c
	.word	0x00019bd4
	.word	0x00019c3c
	.word	0x00000001
	.word	0x00000000
	.word	0xabcd330e
	.word	0xe66d1234
	.word	0x0005deec
	.word	0x0000000b
__atexit_recursive_mutex:
	.word	0x00019d38


	.bss

__bss_start:
	.word	0x00000000
object.0:
a:
c:
d:
det:
	.word	0x00000000
__lock___atexit_recursive_mutex:
	.word	0x00000000
